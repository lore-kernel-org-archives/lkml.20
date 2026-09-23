Received: from va-2-59.ptr.blmpb.com (va-2-59.ptr.blmpb.com [209.127.231.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0354334D0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155055; cv=none; b=ZESkDKIkz/dcHo4oZlWYWuJB3OJ6fpjfDnoZDPZ6ybTQQu8jRGOj7fX0MeShfqu8w7+N3nZTMdwW7JNnrjIOY8dO4tJh+65S0sl6rX1rl3pXR1SHsDPYKz+FrnoSudl1BQWVvJkelmzL3ZG4+SGOnowtHWeQiFkz4V3KrG+nMpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155055; c=relaxed/simple;
	bh=/fsUZjkzQ81iJixu+iZ/uVnyUIRlQNXwreJvymVt2Xo=;
	h=Content-Type:Cc:From:Subject:Date:Mime-Version:To:Message-Id; b=AR3abSK+u7IDdtgGb6e+ugSzWTUi12RUCqO7ju6DrJwe0N3G+NjSs9sGLqbJA9zMVquO/XnxodfsSHnnPd3bUQazu2SdHHEkGPj9EFXOU4C69pemf4PHd9g9wp6zUMnkzpu/mbGe4b0eQS9FCJsKFOhSZPUmyv5ENp+idk1z4EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=KpL7ecoS; arc=none smtp.client-ip=209.127.231.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="KpL7ecoS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1790155041;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8LW/UL97F9n2RNOfFVINEJLOceLsBC25MrzyAVvWnbk=;
 b=KpL7ecoSDR0Nz0lUfnm/QBZDyYN02XOJyOWAnRIUQkCDSC1Ewm+v4j0GfglG+S4Rt+sZXW
 OMybAW/CHmgsQm6Ta8HZVA7wHfP5aKQhvFR1gKtgd/56moJUvAoK2G9VxTuLpT3k64PFcC
 QKcuwa1Ld7YR4mL4asJLqTkJJy1LjPpKQZBvIiXCKoA83249gQxugZWAESyqYPa3Z7uFaf
 ag5Kg41Nf56/Rup9em58dx9cbRZ5ZGo1oKgIitPh8qKZ+0MOeYzzut1oDUeTNR+PgaKVSY
 qWK+z/HMa9XqEFvY4vNLLt+Of0VsUlLXdCjbIUcZUfEbZ90RgEksZxTsA6mqmw==
X-Lms-Return-Path: <lba+26ab3991f+a3f3bd+vger.kernel.org+xiangwencheng@lanxincomputing.com>
Content-Type: text/plain; charset=UTF-8
Cc: <xb@ultrarisc.com>, <atish.patra@linux.dev>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<pbonzini@redhat.com>, <graf@amazon.com>, 
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<xiangwencheng@lanxincomputing.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Subject: [PATCH v3] RISC-V: KVM: Serialize and atomize the IMSIC's TOPEI read-and-clear operation
Date: Wed, 23 Sep 2026 17:16:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 7bit
To: <anup@brainfault.org>
Message-Id: <20260923091658.1421475-1-xiangwencheng@lanxincomputing.com>
Received: from lanxin-ThinkBook-16-G5-IRH ([123.120.5.129]) by smtp.feishu.cn with ESMTP; Wed, 23 Sep 2026 17:17:18 +0800

The TOPEI read-and-clear must be atomic with respect to
interrupt injection (set_bit in EIP). Otherwise an
interrupt injected between the topei read and the
clear_bit could be silently dropped.

v3:
 - fix undefined eflags

v2:
 - fix patch file curruption

v1: https://lore.kernel.org/kvm-riscv/20260923070332.1376132-1-xiangwencheng@lanxincomputing.com/

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 arch/riscv/kvm/aia_imsic.c | 42 +++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index c1af23e79ae0..c440088651ec 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -607,26 +607,25 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
 		kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
 }
 
-static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
+static void __imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
 {
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
 	struct imsic_mrif *mrif = imsic->swfile;
-	unsigned long flags;
-
-	/*
-	 * The critical section is necessary during external interrupt
-	 * updates to avoid the risk of losing interrupts due to potential
-	 * interruptions between reading topei and updating pending status.
-	 */
-
-	raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
 
 	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
 	    imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
 		kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
 	else
 		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
+}
+
+static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
+{
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
+	__imsic_swfile_extirq_update(vcpu);
 	raw_spin_unlock_irqrestore(&imsic->swfile_extirq_lock, flags);
 }
 
@@ -912,12 +911,15 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
 	struct imsic_mrif_eix *eix;
 	int r, rc = KVM_INSN_CONTINUE_NEXT_SEPC;
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	unsigned long flags;
 
 	/* If IMSIC vCPU state not initialized then forward to user space */
 	if (!imsic)
 		return KVM_INSN_EXIT_TO_USER_SPACE;
 
 	if (isel == KVM_RISCV_AIA_IMSIC_TOPEI) {
+		raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
+
 		/* Read pending and enabled interrupt with highest priority */
 		topei = imsic_mrif_topei(imsic->swfile, imsic->nr_eix,
 					 imsic->nr_msis);
@@ -934,16 +936,20 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
 					  eix->eip);
 			}
 		}
+		if (wr_mask)
+			__imsic_swfile_extirq_update(vcpu);
+
+		raw_spin_unlock_irqrestore(&imsic->swfile_extirq_lock, flags);
 	} else {
 		r = imsic_mrif_rmw(imsic->swfile, imsic->nr_eix, isel,
 				   val, new_val, wr_mask);
 		/* Forward unknown IMSIC register to user-space */
 		if (r)
 			rc = (r == -ENOENT) ? 0 : KVM_INSN_ILLEGAL_TRAP;
-	}
 
-	if (wr_mask)
-		imsic_swfile_extirq_update(vcpu);
+		if (wr_mask)
+			imsic_swfile_extirq_update(vcpu);
+	}
 
 	return rc;
 }
@@ -1050,9 +1056,17 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
 	} else {
+		/*
+		 * Serialize the EIP set + external-irq update against the
+		 * TOPEI read-and-clear path so that an injected interrupt
+		 * cannot be silently lost when the guest acknowledges a
+		 * different (or the same) interrupt concurrently.
+		 */
+		raw_spin_lock(&imsic->swfile_extirq_lock);
 		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
 		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
-		imsic_swfile_extirq_update(vcpu);
+		__imsic_swfile_extirq_update(vcpu);
+		raw_spin_unlock(&imsic->swfile_extirq_lock);
 	}
 
 	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
-- 
2.53.0
