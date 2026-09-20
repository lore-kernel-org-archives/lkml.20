Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C4026F2A0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789868979; cv=none; b=m91yJOUF5WAmNV5UgEBq+2XJMKPHg+Ok+AWKFZiB8ILOekKwODVQG+t4FP4MHMl8bQvqf4s+JsbYLzHpW4bNma0n/FRK2VgRG4E3kIumpRfiHUN7+VBhDsrnNyMIdvoyhaPdcdmmU3symbO9e9GL8zLuUs5wbQVaWG6TyC0x9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789868979; c=relaxed/simple;
	bh=VVpnML9rEhEp+bKErO/D+MPuOIxEgR6B6m5Z2HEhw+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwMFAfSDnc5cTtoA7e6Vb0NOqrwMnsTYsqrfkAiJNazmrwiEl4vmcpi1Hm1sSnVzGC53njJ4DadfZGHtFPZH/0aL2Tu9EGCYqV3bxxaLOmaQu8E6WTtHXVtl+eFyLVcMf5OAnwMxHnlV1GplZT7tQ5eVBcbth1cFU0IyJ4HhLHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSzU9e+u; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSzU9e+u"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868cfc5c244so1043711b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789868976; x=1790473776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyDSdiJxcou3Q+96YMJeoku8tsfQDYMOkfUAit+gRR0=;
        b=rSzU9e+uSf6iYZKwSVS4Xw03CI2UrGlt4Dl3vGloRYU8fnq9u8LAf1gQ3O/uXSJb5E
         GH45Kx04/gRoY5cFXJ503ufplqXLBmO4NCZWWgmA2CDz1IYH8T4fKP+VeOGpkjdcRIV7
         V8UyNPiJaJTBF8XsihGsYP/Y26/gmoAm0CosJHW4pSdYF3zbM6XxEh/LINbt3lOu+yct
         KqtN2FuOWp9kB1+rmX9eQV02eJLQWbZBQz0RAUTzpbXiN2MTII2GYfXNSUAFgHii2Pvy
         gllzmXjFpQxlw7FbX1Ge5J2r3RZczKo2zP/6w9pftR8MWGkTUJya9xqXOl8yXaaH81dn
         H3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789868976; x=1790473776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FyDSdiJxcou3Q+96YMJeoku8tsfQDYMOkfUAit+gRR0=;
        b=F3Ov6D67WH4TIpV77Tri8XJkyg+U1wJ9JGj46tpSOfM7zUYZkzkzH8tYqPapbBWj+E
         JoAMMsoJ1BUOrmFQioTe8Wdb5vvpYjO5SerVAELl0VrIUPF2NRh0WqwQ1P39F7XWP1J3
         7wTSuup0ISI5OOrQcsRyk6w5iQQJ0DvtkyLBmzW5uyFbvPH1KpxFs5N/xjjyQwwZAk12
         DBEV7wQnGjpr4ZVE1ANlcupTyVk/EOsm7I1+hr2CJX1b0lDfRK0gLoL3l2bdQ96DAzCj
         XVWsZtpi/M7oSAPhawNnb3h5BZ+W74Cx+56+eRn3usJp6AOklIpnRpZSpLB3UnrpYAGQ
         a1Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxbzQrCTMRqhiNxYXG1PTeHhiYnY/B/YCNCoJDdGSqn5r9Cs1JDcR1IXaoKt1CN0Jk4Z0YdD07tRNzrKtc=@vger.kernel.org
X-Gm-Message-State: AFuF++ltrtfK4CO5jv7/cgXl9wTGceahMrZiyRX2r2h5TIuybn6xvNKL
	Lhb5r1MnjxVO5n5PAMuiJ/4nWBB3g7w8rpWsxRFWGAlWlpiDUhGP5wXv
X-Gm-Gg: AYBFou1Y2oy4JMjy91oN/BWcblE3cQH1JNboWAILoFeNpOdDzK1O5wQzlLZADVHskBo
	I3BwkRGUhkGHiNlGIGdcZxxrfdKxWdwp2B99v/ow88i7tKeBCnThb7UtexWxsWalQPOgPp+XG9Y
	fRwPXXN3AhFHMLpJj3odEB4T7EMTGrTTerQiS6aKw+J3fA04rI3WYP8Og5HjBZ3hfceuW3OtTtK
	5yFpUNhNIEzESukrAa9DpTjowtAEFaQQDIF6lL/MfsNDQNTYRQ/3XOIRruHCxHTNNziMOExfDs/
	Jh52LMlU171NRnnWcG73dApxWd0X93FPVcvdTXIzxQIqKXmwUWjVo6WaRjTJsudX1SLITPD4AzF
	nuHyMszkGAw59D5ePGtlcfEMwE54Y4Xkx0ffny9B5UpIu0Up67uuRfSk/2V+eGdmiCDFOzRZ6zo
	/isQ38UHHLLBAOwG4AZnersRs31LW56puq2hMhdDOP8G3CWEqEHtQNXe6nDU1KZlxxdBCrUMShh
	yCmcRNAMf0p4WhZlus9Thr38SyTF2J2iybQ
X-Received: by 2002:a05:6a21:1f89:b0:3dd:85a8:cad3 with SMTP id adf61e73a8af0-3dd8c4bf134mr10160594637.42.1789868975860;
        Sat, 19 Sep 2026 18:49:35 -0700 (PDT)
Received: from 192.168.1.3 ([2409:8a1e:2e81:7320:b04b:54a9:ba93:7a0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54af4d5sm9517021c88.2.2026.09.19.18.49.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 18:49:35 -0700 (PDT)
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
	Yuchao Zhang <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] KVM: arm64: vgic: Drop last_lr_irq and serialize overflow EOI replay
Date: Sun, 20 Sep 2026 09:49:11 +0800
Message-ID: <20260920014911.58616-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260920014911.58616-1-ndaugoing@gmail.com>
References: <20260918040214.85580-1-ndaugoing@gmail.com>
 <20260920014911.58616-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount deactivations from
AP-list tail") introduced tracking the last interrupt placed in a List
Register in per-CPU host data (*host_data_ptr(last_lr_irq)) to resume the
EOIcount-based deactivation walk in the overflow tail of the ap_list.

However, caching this raw pointer in per-CPU host data spans the entire
guest execution without holding ap_list_lock or a reference count.
A concurrent vCPU can disable LPIs by writing to GICR_CTLR.EnableLPIs,
triggering vgic_flush_pending_lpis() which removes LPIs with list_del()
and drops their reference.  When the victim vCPU exits, the lock-free
list_for_each_entry_continue() starting from last_lr_irq dereferences a
poisoned next pointer or freed object, causing a host panic or UAF.

Rather than taking ap_list_lock across the entire fold path (which forces
deferring kvm_notify_acked_irq() to avoid eventfd deadlocks and deferring
vgic_put_irq() to avoid lock inversion with lpi_xa), solve this by
dropping the fragile last_lr_irq cursor entirely:

1. In vgic_flush_lr_state(), do not track last_lr_irq.
2. In vgic_v3_fold_lr_state() / vgic_v2_fold_lr_state(), fold the hardware
   LRs natively without ap_list_lock.  Record the INTIDs of the used LRs in
   a small stack array (at most 16/64 entries).
3. If eoicount == 0 (the vast majority of exits), clear cpuif->used_lrs and
   return immediately without taking ap_list_lock on the fast path.
4. If unlikely(eoicount > 0), acquire ap_list_lock only to scan the ap_list
   and pin up to eoicount active interrupts that were not in hardware LRs.
   The scan is a linear walk over at most 16/64 LR INTIDs per candidate, on
   the rare eoicount > 0 path - bounded and acceptable.
   Then drop ap_list_lock before replaying their deactivations, naturally
   avoiding both eventfd re-entrancy and lpi_xa lock inversions.

Fixes: 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 --
 arch/arm64/kvm/vgic/vgic-v2.c     | 64 +++++++++++++++++++-------
 arch/arm64/kvm/vgic/vgic-v3.c     | 74 +++++++++++++++++++++----------
 arch/arm64/kvm/vgic/vgic.c        |  9 +---
 arch/arm64/kvm/vgic/vgic.h        | 14 ++++++
 5 files changed, 114 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7..c4355ae23e98 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -800,9 +800,6 @@ struct kvm_host_data {
 	unsigned int debug_brps;
 	unsigned int debug_wrps;
 
-	/* Last vgic_irq part of the AP list recorded in an LR */
-	struct vgic_irq *last_lr_irq;
-
 	/* PPI state tracking for GICv5-based guests */
 	struct {
 		DECLARE_BITMAP(pendr, VGIC_V5_NR_PRIVATE_IRQS);
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 7182f63fc938..4a0ad5bd1cf6 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -115,37 +115,71 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_v2_cpu_if *cpuif = &vgic_cpu->vgic_v2;
 	u32 eoicount = FIELD_GET(GICH_HCR_EOICOUNT, cpuif->vgic_hcr);
-	struct vgic_irq *irq = *host_data_ptr(last_lr_irq);
+	struct vgic_irq *targets[32];
+	u32 lr_intids[VGIC_V2_MAX_LRS];
+	int nr_lrs = min_t(int, vgic_cpu->vgic_v2.used_lrs, ARRAY_SIZE(lr_intids));
+	u32 max_targets;
+	int nr_targets = 0;
 
 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
 
-	for (int lr = 0; lr < vgic_cpu->vgic_v2.used_lrs; lr++)
-		vgic_v2_fold_lr(vcpu, cpuif->vgic_lr[lr]);
+	if (!vgic_cpu->vgic_v2.used_lrs && !eoicount)
+		return;
 
-	/* See the GICv3 equivalent for the EOIcount handling rationale */
-	list_for_each_entry_continue(irq, &vgic_cpu->ap_list_head, ap_list) {
-		u32 lr;
+	for (int lr = 0; lr < nr_lrs; lr++) {
+		u32 val = cpuif->vgic_lr[lr];
+
+		lr_intids[lr] = val & GICH_LR_VIRTUALID;
+		vgic_v2_fold_lr(vcpu, val);
+	}
+
+	cpuif->used_lrs = 0;
+
+	if (likely(!eoicount))
+		return;
+
+	max_targets = min_t(u32, eoicount, ARRAY_SIZE(targets));
+
+	/*
+	 * EOIMode=0: replay deactivations for overflow active interrupts.
+	 * Walk ap_list under ap_list_lock and pin candidate interrupts so we
+	 * can process them outside the lock without risking lock inversion.
+	 */
+	scoped_guard(raw_spinlock, &vgic_cpu->ap_list_lock) {
+		struct vgic_irq *irq;
 
-		if (!eoicount) {
-			break;
-		} else {
-			guard(raw_spinlock)(&irq->irq_lock);
+		list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
+			if (nr_targets == max_targets)
+				break;
 
-			if (!(likely(vgic_target_oracle(irq) == vcpu) &&
-			      irq->active))
+			if (intid_in_lrs(irq->intid, lr_intids, nr_lrs))
 				continue;
 
+			scoped_guard(raw_spinlock, &irq->irq_lock) {
+				if (likely(vgic_target_oracle(irq) == vcpu) &&
+				    irq->active) {
+					vgic_get_irq_ref(irq);
+					targets[nr_targets++] = irq;
+				}
+			}
+		}
+	}
+
+	for (int i = 0; i < nr_targets; i++) {
+		struct vgic_irq *irq = targets[i];
+		u32 lr;
+
+		scoped_guard(raw_spinlock, &irq->irq_lock) {
 			lr = vgic_v2_compute_lr(vcpu, irq) & ~GICH_LR_ACTIVE_BIT;
 		}
 
 		if (lr & GICH_LR_HW)
 			writel_relaxed(FIELD_GET(GICH_LR_PHYSID_CPUID, lr),
 				       kvm_vgic_global_state.gicc_base + GIC_CPU_DEACTIVATE);
+
 		vgic_v2_fold_lr(vcpu, lr);
-		eoicount--;
+		vgic_put_irq(vcpu->kvm, irq);
 	}
-
-	cpuif->used_lrs = 0;
 }
 
 void vgic_v2_deactivate(struct kvm_vcpu *vcpu, u32 val)
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 726e20a1da6e..7e573860f3e1 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -148,37 +148,65 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
 	u32 eoicount = FIELD_GET(ICH_HCR_EL2_EOIcount, cpuif->vgic_hcr);
-	struct vgic_irq *irq = *host_data_ptr(last_lr_irq);
+	struct vgic_irq *targets[32];
+	u32 lr_intids[VGIC_V3_MAX_LRS];
+	int nr_lrs = min_t(int, cpuif->used_lrs, ARRAY_SIZE(lr_intids));
+	u32 max_targets;
+	int nr_targets = 0;
 
 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
 
-	for (int lr = 0; lr < cpuif->used_lrs; lr++)
-		vgic_v3_fold_lr(vcpu, cpuif->vgic_lr[lr]);
+	if (!cpuif->used_lrs && !eoicount)
+		return;
+
+	for (int lr = 0; lr < nr_lrs; lr++) {
+		u64 val = cpuif->vgic_lr[lr];
+
+		if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)
+			lr_intids[lr] = val & ICH_LR_VIRTUAL_ID_MASK;
+		else
+			lr_intids[lr] = val & GICH_LR_VIRTUALID;
+
+		vgic_v3_fold_lr(vcpu, val);
+	}
+
+	cpuif->used_lrs = 0;
+
+	if (likely(!eoicount))
+		return;
+
+	max_targets = min_t(u32, eoicount, ARRAY_SIZE(targets));
 
 	/*
-	 * EOIMode=0: use EOIcount to emulate deactivation. We are
-	 * guaranteed to deactivate in reverse order of the activation, so
-	 * just pick one active interrupt after the other in the tail part
-	 * of the ap_list, past the LRs, and replay the deactivation as if
-	 * the CPU was doing it. We also rely on priority drop to have taken
-	 * place, and the list to be sorted by priority.
+	 * EOIMode=0: replay deactivations for overflow active interrupts.
+	 * Walk ap_list under ap_list_lock and pin candidate interrupts so we
+	 * can process them outside the lock without risking lock inversion.
 	 */
-	list_for_each_entry_continue(irq, &vgic_cpu->ap_list_head, ap_list) {
-		u64 lr;
+	scoped_guard(raw_spinlock, &vgic_cpu->ap_list_lock) {
+		struct vgic_irq *irq;
 
-		/*
-		 * I would have loved to write this using a scoped_guard(),
-		 * but using 'continue' here is a total train wreck.
-		 */
-		if (!eoicount) {
-			break;
-		} else {
-			guard(raw_spinlock)(&irq->irq_lock);
+		list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
+			if (nr_targets == max_targets)
+				break;
 
-			if (!(likely(vgic_target_oracle(irq) == vcpu) &&
-			      irq->active))
+			if (intid_in_lrs(irq->intid, lr_intids, nr_lrs))
 				continue;
 
+			scoped_guard(raw_spinlock, &irq->irq_lock) {
+				if (likely(vgic_target_oracle(irq) == vcpu) &&
+				    irq->active) {
+					vgic_get_irq_ref(irq);
+					targets[nr_targets++] = irq;
+				}
+			}
+		}
+	}
+
+	for (int i = 0; i < nr_targets; i++) {
+		struct vgic_irq *irq = targets[i];
+		u64 lr;
+
+		scoped_guard(raw_spinlock, &irq->irq_lock) {
 			lr = vgic_v3_compute_lr(vcpu, irq) & ~ICH_LR_ACTIVE_BIT;
 		}
 
@@ -186,10 +214,8 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 			vgic_v3_deactivate_phys(FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
 
 		vgic_v3_fold_lr(vcpu, lr);
-		eoicount--;
+		vgic_put_irq(vcpu->kvm, irq);
 	}
-
-	cpuif->used_lrs = 0;
 }
 
 void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index b25303d9919f..966948fd3ddd 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -866,9 +866,6 @@ static void vgic_fold_state(struct kvm_vcpu *vcpu)
 		return;
 	}
 
-	if (!*host_data_ptr(last_lr_irq))
-		return;
-
 	if (kvm_vgic_global_state.type == VGIC_V2)
 		vgic_v2_fold_lr_state(vcpu);
 	else
@@ -1015,14 +1012,10 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 	if (irqs_outside_lrs(&als))
 		vgic_sort_ap_list(vcpu);
 
-	*host_data_ptr(last_lr_irq) = NULL;
-
 	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
 		scoped_guard(raw_spinlock,  &irq->irq_lock) {
-			if (likely(vgic_target_oracle(irq) == vcpu)) {
+			if (likely(vgic_target_oracle(irq) == vcpu))
 				vgic_populate_lr(vcpu, irq, count++);
-				*host_data_ptr(last_lr_irq) = irq;
-			}
 		}
 
 		if (count == kvm_vgic_global_state.nr_lr)
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index b71d486ae514..35a07b320be4 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -334,6 +334,20 @@ static inline void vgic_get_irq_ref(struct vgic_irq *irq)
 	WARN_ON_ONCE(!vgic_try_get_irq_ref(irq));
 }
 
+/*
+ * Linear scan over at most VGIC_V3_MAX_LRS / VGIC_V2_MAX_LRS entries.
+ * Only called on the rare eoicount > 0 path, so the O(n) cost is
+ * acceptable and avoids the complexity of a bitmap.
+ */
+static inline bool intid_in_lrs(u32 intid, const u32 *lr_intids, int nr_lrs)
+{
+	for (int i = 0; i < nr_lrs; i++) {
+		if (lr_intids[i] == intid)
+			return true;
+	}
+	return false;
+}
+
 void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu);
 void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr);
 void vgic_v3_clear_lr(struct kvm_vcpu *vcpu, int lr);
-- 
2.53.0

