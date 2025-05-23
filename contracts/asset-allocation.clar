;; asset-allocation.clar
;; Manages distribution across chains

(define-map user-allocations
  {user: principal, asset: (string-ascii 10)}
  {allocations: (list 10 {protocol: principal, chain-id: uint, percentage: uint})})

;; Set allocation for a user
(define-public (set-allocation
  (asset (string-ascii 10))
  (allocations (list 10 {protocol: principal, chain-id: uint, percentage: uint})))
  (begin
    ;; Verify total percentage equals 100%
    (asserts! (is-eq (fold add-percentage allocations u0) u100) (err u102))

    ;; Store the allocation
    (map-set user-allocations
      {user: tx-sender, asset: asset}
      {allocations: allocations})

    (print {event: "allocation-set", user: tx-sender, asset: asset})
    (ok true)))

;; Get allocation for a user
(define-read-only (get-allocation (user principal) (asset (string-ascii 10)))
  (default-to {allocations: (list)}
    (map-get? user-allocations {user: user, asset: asset})))

;; Helper function to sum percentages
(define-private (add-percentage (allocation {protocol: principal, chain-id: uint, percentage: uint}) (sum uint))
  (+ sum (get percentage allocation)))

;; Execute rebalancing based on current allocation
(define-public (rebalance (asset (string-ascii 10)))
  (let ((current-allocation (get allocations (get-allocation tx-sender asset))))
    (asserts! (> (len current-allocation) u0) (err u103))

    ;; In a real implementation, this would interact with other contracts
    ;; to move assets according to the allocation
    (print {event: "rebalance-executed", user: tx-sender, asset: asset})
    (ok true)))
