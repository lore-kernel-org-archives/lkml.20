Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA213D51E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789868969; cv=none; b=bL6tUeVVmrqkpzUQGIEH/UqPwREbx3rlFJugJbWPIXYQqETVfL1JpR+0bpFYSVq4UtOmhCdbAIsRFfrCPyru8qNrJ1E7kJNN+rQ+cfJEksvTpo1xB66myvqDIqFjNhqubG68LpWY8FH3tidI2fkBuzLVgXTac0Aw/OinAdXGo1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789868969; c=relaxed/simple;
	bh=LUNVupo1CFKBad538sxLD5a5QiLK8YZIVvdpBThXB1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXYNbcc04wVr86Di18TvovAp7muL8adKUlnKGlOzHSYjkaOp86aefGouNxDJtey/O1WmwuKC03RxK68AI7WD/LgxErE0Gp03NMhFtJ480qBz47IvEJuEhh69pZ8y2lJcLV+c6Ozak5T0rGTveB//lRM4kCqCq0fv8MNtjcVWuLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4eYxH25; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4eYxH25"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so314116a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789868967; x=1790473767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3VMqpd4wyFLTTPKzckaIuxNzEcB+BV3yCJaVANwqLc=;
        b=e4eYxH251NjIpbTDkVLjdzea1g35C+mepm313GoLmi5trl1i66Epgfq/BF6EI8vbpJ
         tFRbhfXn7BLnNE66SkSTyKCdnvjr9mRw+T1ga23rSD9ZyqBHLJlo36onGgOcVCcYbswd
         9N5HmZ22Fc9aCCgDpG17U7x+f+pUs8gTd63LWo9GVLyQLrou4hQtpYp02X175sl750Fo
         bK0GG+2VaKlj3VYrGDjDsi86nSXtXiHaEbuecb8rargkLAPxQNlNkdJDE8z3Gshbrmwe
         59QGUeCLe/ZYJwOANNlEbrFFq4b3rftWqby0mqYLr3JqBJ6nfv2cg6SmBbsle1NBGCTG
         +v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789868967; x=1790473767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3VMqpd4wyFLTTPKzckaIuxNzEcB+BV3yCJaVANwqLc=;
        b=bkgD5/9qx/yJlnyO0V4RclJ0AkJVN7AyN4o1FyKa3x69trFlW8r+Cxit5DAeJfortU
         rqS9J5BCMRcdg2pO5ligZcxa8vCan2gqeU3cajRGrW0U8017hm+/H1JEMaLXbBzin7Ek
         IP6y9VrrcT4eGIPPAgHoH4I1lGL6pvAy6dgN3xtdz48tMSq1X9e/Owh9IspHuMLbkMx/
         qR5MXMsmE1ogYQnEoN/hkqgM2YG7U+aEC4N22KsRqNgxCqWgg1ddVBje9ob0bMvzShUb
         OVTvwTQpJpWhRuHSwquAZlBe43a1mrOtdxHva9iXSUI2qmMyU68e2cEzAgVfRMV2+wy9
         aR9g==
X-Forwarded-Encrypted: i=1; AKwUvByENjEiNzWO0kqeMhUAZHMMKH4jNZkRec//BYh7T9cFeHCduNU6lL6Ra8WHjgYbaMc5tSqPfFTnuKz6GXc=@vger.kernel.org
X-Gm-Message-State: AFuF++nsBvWCAXPVapQizctDa23+DMEXgbFd3q5+F238/VzJOZwBaheT
	MnVrWZ6W0WqoDcRR11wXaKCC9Je85sFfrK17oYe3ouaWUeXZA5ZDaXiO
X-Gm-Gg: AYBFou0p9iT8M9EUzyPZeNTwsE/xzGLztokFkL1/luYBM6x62+5hdSoxIy104MKzDyu
	ff4fCeKwbfaKxdNhYqgoYpev5e6RJcz9pUfvECyVrltpoD/ruJY8atb7cF7dkCels6pIH584eqP
	at0XO+GWAMRHuashSgNi/ZUN3zFVungHS8UyCLUeywjLWoOaMo5dzzJq4mzCZ+3KnJDIwCNyE7q
	XDnp1v5fz94Wt+kN5k7qpVEevXCsALT+FjL1BBH8QMAxJFeV8g8Y/LGsQhzU4ncN73dlYmoAzbx
	JCmQIEKwSMwZkCGelR1jrVeZOPrTwpHu+Jp006lONNgpi3IyF+YsG7MUXtHipX7RS/8n8kT+MS4
	IdYkMiGmYJsFP8KXjLTUEyMCMb269qeBd4c/8/BMktkcLEIzvK9r45CVh/e4wrTXrTj7fHczVSh
	rGgYngEnkWUgDTBcL8MqqNFvI7aVKrPd7cl6dkK+kizdErN+yFAa/4VIgIUY6VALSCMPcgUs2JJ
	xTr74ZHgcRqnByDKBNtannRHw==
X-Received: by 2002:a17:90a:d884:b0:39e:6a7e:ee16 with SMTP id 98e67ed59e1d1-39e6a7eef52mr6036581a91.34.1789868967269;
        Sat, 19 Sep 2026 18:49:27 -0700 (PDT)
Received: from 192.168.1.3 ([2409:8a1e:2e81:7320:b04b:54a9:ba93:7a0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54af4d5sm9517021c88.2.2026.09.19.18.49.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 18:49:26 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v3 0/1] KVM: arm64: vgic: Drop last_lr_irq and serialize overflow EOI replay
Date: Sun, 20 Sep 2026 09:49:10 +0800
Message-ID: <20260920014911.58616-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918040214.85580-1-ndaugoing@gmail.com>
References: <20260918040214.85580-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Marc, Oliver, Fuad, and KVM/arm64 maintainers,

Following up on the discussion around the remote LPI disable vs LR fold
race [1], this series addresses the issue at its root: the last_lr_irq
cursor introduced in commit 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount
deactivations from AP-list tail").

Problem:
vgic_v3_fold_lr_state() / vgic_v2_fold_lr_state() walk the overflow tail
of the ap_list starting from *host_data_ptr(last_lr_irq) without holding
ap_list_lock. Caching this raw pointer across the entire guest execution
leaves it vulnerable to concurrent modification: when a remote vCPU
disables LPIs via GICR_CTLR, vgic_flush_pending_lpis() unlinks the node
with list_del() and drops its reference, leaving last_lr_irq pointing to
a poisoned or freed object. When the vCPU exits, the walk dereferences
corrupted memory, causing a kernel panic or UAF.

Oliver and Marc suggested taking ap_list_lock in
vgic_v3_fold_lr_state() [2][3]. I tried that approach first, but it
runs into the following lock-order problems:
1. kvm_notify_acked_irq() grabs regular spinlocks and can re-enter
   vgic_queue_irq_unlock() (which takes ap_list_lock), causing deadlock.
2. vgic_put_irq() is a no-op for SPI/PPI, but for LPIs it calls
   refcount_dec_and_lock_irqsave() which acquires dist->lpi_xa.xa_lock
   when dropping the last reference. That lock sits above ap_list_lock
   in the lock ordering, so calling vgic_put_irq() under ap_list_lock
   causes lock inversion.
Addressing these under a global fold lock requires deferring all EOI'ed
SPI notifications to a stack bitmap and deferring LPI releases with
vgic_put_irq_norelease(), penalizing the fast path for all exits even
though folding hardware LRs does not touch ap_list at all. It also still
requires pinning and clearing the per-CPU last_lr_irq pointer.

Changes since v2:
- Replaced the skip-unlink approach of v2 with dropping the last_lr_irq
  cursor entirely and serializing only the overflow EOI replay under
  ap_list_lock (per Oliver and Marc's suggestion [2][3]).

The cleaner approach in this patch:
1. Drop the fragile last_lr_irq per-CPU cursor entirely.
2. The common fast path (folding hardware LRs) runs natively without
   ap_list_lock. We record the INTIDs of the used LRs in a small stack
   array (VGIC_V3_MAX_LRS / VGIC_V2_MAX_LRS entries).
3. If eoicount == 0 (the vast majority of guest exits), clear
   cpuif->used_lrs = 0 and return immediately without taking ap_list_lock.
4. If unlikely(eoicount > 0), acquire ap_list_lock only to scan the ap_list
   and pin (via vgic_get_irq_ref) up to eoicount active interrupts that
   were not in hardware LRs. The scan is a linear walk over at most 16/64
   LR INTIDs per candidate, on the rare eoicount > 0 path - bounded and
   acceptable. lr_intids[] only records INTIDs from the used_lrs range;
   the extraction mask mirrors vgic_fold_lr() exactly
   (ICH_LR_VIRTUAL_ID_MASK for GICv3, GICH_LR_VIRTUALID for GICv2),
   so no stale or invalid slot can produce a false match.
5. Drop ap_list_lock immediately, and then replay their deactivations
   outside the lock, naturally eliminating both eventfd re-entrancy and
   lpi_xa lock inversions without changing any function signatures.
   vgic_fold_lr() has no error path, so cpuif->used_lrs = 0 is always
   reached after a complete fold, with no risk of partial cleanup.

Note on EOIcount hardware limits:
ICH_HCR_EL2.EOIcount (GICv3) and GICH_HCR.EOICount (GICv2) are both
5-bit fields, giving a maximum value of 31. The targets[32] stack array
and min_t(u32, eoicount, ARRAY_SIZE(targets)) bound together ensure no
overflow even if hardware writes an unexpected value.

Note on EOIcount source:
For GICv3, eoicount is read from cpuif->vgic_hcr, which is populated by
__vgic_v3_save_state right before ICH_HCR_EL2 is cleared in hardware.
For GICv2, vgic_v2_save_state reads GICH_HCR via MMIO into the same
cpuif->vgic_hcr field (when LRENPIE is set) before writing 0 to GICH_HCR.
In both cases the software copy is the only valid source; reading the
hardware register after save would return 0.

Note on scope:
This series fixes the use-after-free in the ap_list traversal caused by
last_lr_irq. It does not address the separate concern raised by Oliver
in [2] about a pending LPI still sitting in an LR when RWP=0 becomes
visible to another vCPU; that may require a stronger approach (e.g.
halting the VM) and I am happy to follow up separately.

[1] https://lore.kernel.org/r/aiHrGM1f8czcUby4@v4bel
[2] https://lore.kernel.org/r/aiJi5a3JJ-TbWL-s@kernel.org
[3] https://lore.kernel.org/r/87a4t99z9n.wl-maz@kernel.org

Yuchao Zhang (1):
  KVM: arm64: vgic: Drop last_lr_irq and serialize overflow EOI replay

 arch/arm64/include/asm/kvm_host.h |  3 --
 arch/arm64/kvm/vgic/vgic-v2.c     | 64 +++++++++++++++++++++++--------
 arch/arm64/kvm/vgic/vgic-v3.c     | 74 ++++++++++++++++++++++++++-----
 arch/arm64/kvm/vgic/vgic.c        |  9 +---
 arch/arm64/kvm/vgic/vgic.h        | 14 ++++++++
 5 files changed, 114 insertions(+), 50 deletions(-)

-- 
2.53.0
