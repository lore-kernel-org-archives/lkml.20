Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564865;
	b=IX82+eaVZTv8KkdgSk6sLCT3sq1+7KlQEL5NKiFsfcgpVYq8DJUPwiVJGZR0zsWqbunN
	 qpiiviOo067+V9KFYeuR3JPIAN8f738Yh75vjNfVJuXuNTRGgYDLK63n/7A5LxOhR70M8
	 TvWOl9QZC9zAU/VP46nMjd4TyarJIFqoQ2b7t6fIfRbaNLX54eG9u3oQg6cAHXW6dpdjv
	 zQtDhGysx2IENMDnA7iu1/6gWAMESgpRfsMgZQ/Kj9gAdSCdMPql2Vc+Ah7A+rPXwOlUS
	 /RoXXBunyW/gwV+S9sSaXs22e0GOWNb7/fz/9o7zNiCvadt4nysS/ZoCNsyh7awna+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564865;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:X-Lms-Return-Path:
	 Content-Type:To:From:Date:Content-Transfer-Encoding:Cc:Received:
	 X-Mailer:X-Original-From:Subject:Message-Id;
	bh=I1JA9FJ/SP/+WEbDXsjWk6ef9MGFbfHr+CbxzhoP4+E=;
	b=iL58n9spTlnQ3C2zh0JV/y8nERT1PvvIs/KkD2SiSKAfb/zOaOW1Uk3z/SlhNkHnZZDm
	 hKcqQZiEwP4OJ1lRUQS/alQ0IAx9NyQ5SlyR5DbeQL6uCH6zdlpOeJl0REbskvSAgNSm+
	 MSaobga6PgGa8VgOohXIy10g8gzWFoy6r3D9nU2PWsgemMczTK4lcCj8EqqYAKNxdAZsS
	 DNDlQgoNIXrOONyiWARlf2whljtVcfRBDOT42HCPa/IEQ6XHQPdtkzdFiImiTIjujxulv
	 fmBRGP6M2C1HGfcFSZ4WLgZ/BPL2FxDI+tE20rMliJcKA0qnTFi2Nn9XgOVxwBZ7Tpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lanxincomputing.com;
	spf=pass smtp.mailfrom=lanxincomputing.com;
	dkim=pass header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=CS5T5Imy;
	arc=none smtp.remote-ip=209.127.231.39
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD151606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD151606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=CS5T5Imy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1794564858;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=I1JA9FJ/SP/+WEbDXsjWk6ef9MGFbfHr+CbxzhoP4+E=;
 b=CS5T5ImyRIr7b9g1zL7JIDLKYCSNavpZovZeZfKFsTTz2qkF/fSo8VehDdsombFhc6eYHE
 VT/Vy8AtKrp7Y2kWdb0r4O3KHbTOqTIgZyx0XeW/a6jTVre4IbBkv9TJ+NcPYp7TBtLebv
 /07cA6xrKMm0ra52s58PBUlnXG6LZm4+Dj5M37R81jkuM7rw8niYpJ1jZ3OZXPEPBsi+1C
 ssZOA4iWHlNErtVNNvLdB3HZg2vafSuagslKjhx85ZOhA2w7U0BFFCEU52IKtj/Ev22iF7
 U2/0S7mJHhb3waclcFl4jmNxbfHGYCyG63f//zRIcuQNCtWmMrdk12UnaBVqcw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26af6e2f8+187bd2+vger.kernel.org+xiangwencheng@lanxincomputing.com>
Content-Type: text/plain; charset=UTF-8
To: <anup@brainfault.org>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Date: Fri, 13 Nov 2026 18:13:57 +0800
Content-Transfer-Encoding: 7bit
Cc: <xb@ultrarisc.com>, <atish.patra@linux.dev>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<pbonzini@redhat.com>, <graf@amazon.com>, 
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<xiangwencheng@lanxincomputing.com>
Received: from lanxin-ThinkBook-16-G5-IRH.lan ([123.120.4.67]) by smtp.feishu.cn with ESMTP; Fri, 13 Nov 2026 18:14:16 +0800
X-Mailer: git-send-email 2.53.0
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
Subject: [PATCH v4] RISC-V: KVM: Serialize and atomize the IMSIC's TOPEI read-and-clear operation
Message-Id: <20261113101358.3007601-1-xiangwencheng@lanxincomputing.com>

The TOPEI read-and-clear must be atomic with respect to
interrupt injection (set_bit in EIP). Otherwise an
interrupt injected between the topei read and the
clear_bit could be silently dropped.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
v4:
 - pass topei value to __imsic_swfile_extirq_update()

v3:
 - fix undefined eflags

v2:
 - fix patch file curruption

v1: https://lore.kernel.org/kvm-riscv/20260923070332.1376132-1-xiangwencheng@lanxincomputing.com/
---
 arch/riscv/kvm/aia_imsic.c | 47 +++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index c1af23e79ae0..0a6b20f3a28d 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -607,26 +607,25 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
 		kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
 }
 
-static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
+static void __imsic_swfile_extirq_update(struct kvm_vcpu *vcpu, u32 topei)
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
 
-	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
-	    imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
+	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) && topei)
 		kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
 	else
 		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
+}
+
+static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
+{
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	struct imsic_mrif *mrif = imsic->swfile;
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
+	__imsic_swfile_extirq_update(vcpu, imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis));
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
+			__imsic_swfile_extirq_update(vcpu, topei);
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
@@ -1034,6 +1040,7 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 	unsigned long flags;
 	struct imsic_mrif_eix *eix;
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	struct imsic_mrif *mrif = imsic->swfile;
 
 	/* We only emulate one IMSIC MMIO page for each Guest VCPU */
 	if (!imsic || !iid || guest_index ||
@@ -1050,9 +1057,17 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
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
+		__imsic_swfile_extirq_update(vcpu, imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis));
+		raw_spin_unlock(&imsic->swfile_extirq_lock);
 	}
 
 	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
-- 
2.53.0
