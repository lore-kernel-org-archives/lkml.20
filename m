Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163691;
	b=IdPQpc6skpfh6fF+Qc3EMaM5RZHTJk+POz8ASzCon0tcbXRePADq1K1kZn7ZxSP38h35
	 tHW+zsVVlHegmem9OKehmjhG+hMUxsOxO5RgGJSww4Kpvdtv7w9TM48OJ4WF7MjTE/E59
	 BmLRceB/vh83YNDPdhGqmsH1lHfaF+Z1Cy1JwFl/Y+EYMifYoif2XbgQlTZv8rJq+NiWk
	 2bJ716MaFnDANacHRTvl6zonhJrQFD4XamwVZnitPGrjhfrr037G9tq5G0eecLjaOmhii
	 jDCkbDY7Qy0QyKWnBi0JyMYnnwVI8aF0OWh43m44jQzibV/A4wb+FEnRpODIjlcRPQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4PPjtqMp1V58uGYejGtWodvU/HeeS5pvfYydRAC9x9I=;
	b=ZEl5BosiL19CCAyKayZPHZRy7VkhAZKpAo/1Q4Ma9Hr9ALazdwVITI8gWDXxCIDFa9PV
	 PjK/8C7ntb9rwuyvFgV1PdSR3xFUybrejAjVTDRSz1j1Kp5Hy5npFAUG5VpkaAQHqGK/u
	 1lTyBn4dn+HUzBNWo+cucgKMaZ3LmzTfF49Dd51G/I2wOwpSKHxw8Lx32sY0ZFeZXqmLT
	 3TXhCO6xoXx63akH2IrrTvcHCwo6KWF7LWGIMhy8YCc4RFCAT/imErKN5mMfQrSnhOiK8
	 jdsenLKPIL6iFLUjGlSZpp2AV8OWi59skQYsNoNlaaJDChempZYnZ9nOIAVTSDPOuaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=unqNiMoR;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C69660A3815
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C69660A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=unqNiMoR
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d885929so385285f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163689; x=1793768489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PPjtqMp1V58uGYejGtWodvU/HeeS5pvfYydRAC9x9I=;
        b=unqNiMoRYCef3A9/hfXhrILrTnGL85C1xRpiwvrMP317cz7PbheJLnkdxtnAQBULFn
         x0Na3E5+jDO3SdIKc/QmiQD1TO69+Lhblv9SehFYKUjMECY6h4+ICO8e7necMnyHd+ZE
         D8N9WLr8AAtG7sBU/qYRP+JKBCjONj/HTtiJGhxewmpZ0AnPuKkXL9ltUyrj6Z4HFKOq
         h2SD3L5Ex4Aip2hhDgoAKdydvYczjTHgixF5sq2kq9XIb1oQV2qKPo9Jj2PSUVQg/PcX
         RfEG58xmn4X9jR2+P85j8yv2KRskqZ4larVHaD8xeODB/7QdFdXpqfuRbO/BMHXoC2UT
         A4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163689; x=1793768489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PPjtqMp1V58uGYejGtWodvU/HeeS5pvfYydRAC9x9I=;
        b=S95d3RAzZqGITJFAq8d402K7pbbdaqPz9JiL235WLkT1c9AdC8McajQPHUwvaKDRXd
         CNi7Rzl9kl63DL0iq0eWN9qmCq4ZVwDTrKRpwR9b6Bt+H0PztHA8uOmTmFWRaGz9NnWE
         Z9bRr60QNJuWMAFBL1xTE8hURB737YbzddbdfsRc9cKrCbFSTENl7Qcz9+sdEktComY1
         IU+WqKEGu928YEgRZcwigdo7ZE+avTGswxjPGvakCXb/6kaS7yk3yqJXM9b6I5HzPith
         D9rA7AiZ49Z99OFYYPQLhJBJe80PNh9W9DW9E189B9VbrqXoJyOHSYePlBw4pjNWbc4u
         fYNA==
X-Forwarded-Encrypted: i=1; AKwUvBxx0WTQKsHHJwXxcbrneY7SWxga6J58jhcTJ2v2LHLhM09varAytFp0kkgtI08LU8znBgwFnoN2QUioCvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAGeidltkFUvQdR6P2Q+c67AyMpsM9U++nmkFRvaIMJn30NlPH
	cvSzzLByCXysvM5taLiwGd1y4vQytzpjtWEifrAw/vMRwRc0yRqwkqGO
X-Gm-Gg: AYBFou3kOFkdIj4m90G5txr6z/XtGdYSuj7eY2wCd7Wupgwe2uF4/CM9a8UCAIAGIPE
	Gmh86Rh3PV04sd7GsULGw2LWIU01Wnj90EBvp9h5DF//Ea5vpDNBf/VB0Awzoq1++HS5Fibslct
	bnQfXIcIHRu5V0RsQlX1EueQbHurmFzr/ywowff4OVawJ8rY0OYXX6iI49leEoH+1tVEqu9218g
	Psxsco2e1TwyS4TVis8bp0ZRExDr7NDdvt4JZdqDfZY6oo5Ew4aR8Dpof9VXglCb5iJKKLNpuvE
	T/qnrMHI3ySNCbuhKYbZMWCzP46B9NRfXRScSNSs5z52N1j70vRhxc1HJAEONg7KV+J8LEvhSU4
	TZgLFO31yRcM24XoZ9h4oz5SJ68MfeUIVPdb5H+IsMartIbqJnbCG7purYc5a/jY4Eru/GlNLqm
	/NkYcVhCEe5YFvTpVImAPklqPwP7JliOsSBAMfhpvnjcWCwZ7wu6APDRgn0JGjPR6LJbk/ymZxR
	GLaRoCXJoRRH/Tj4bim29BmmjQWt1XLo/hbJscDmo2rzD+TueTia8/9crLPy3TkNLoa9pdRrhh0
	LAuCiNnrv2O4t1W0kvEJ6FKeA0vQTMRteeay+FCbD2tzLsWCdriCpKhIUO9rxx6ta1943flA99r
	b32KPAv4RpZ54lZrwLFak6gzNnMZdEco4u6IODxejFJd5/fHqJt3TMdD+d+Du9D0t2NNn6RHIkT
	FrGwoEaeshiBUVqLnCZt0VL+2EVZR8Rg0WBuVDNw==
X-Received: by 2002:a05:600c:154e:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a967e8d5a3mr18553845e9.34.1793163689112;
        Tue, 27 Oct 2026 22:01:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
Date: Wed, 28 Oct 2026 06:01:11 +0100
Message-Id: <20261028050113.10046-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028050113.10046-1-kmehltretter@gmail.com>
References: <20261028050113.10046-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A write to GICD_ISPENDR for an active level interrupt makes the
interrupt Active and Pending. It must be delivered again after it is
deactivated.

KVM loses the second pending state. vgic_v2_populate_lr() leaves
pending_latch set for a level interrupt, while vgic_v2_compute_lr()
keeps Pending and Active out of the same LR. vgic_v2_fold_lr() clears
the latch after the LR becomes empty. At that point it cannot tell the
original latch from one written while the interrupt was active, and
clears both.

Synchronize the target vCPU's LRs in vgic_mmio_write_spending() with
vgic_access_active_prepare() and vgic_access_active_finish() under
config_lock before setting pending_latch. When the interrupt is in an
LR on another vCPU, this folds any prior ack into the VGIC state before
the new pending state is recorded.

In vgic_v2_fold_lr(), clear the original latch when an LR populated for
an inactive interrupt no longer reports a pending state, and preserve a
latch written while the interrupt was active.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-mmio.c | 76 +++++++++++++++++++--------------
 arch/arm64/kvm/vgic/vgic-v2.c   | 10 +++--
 2 files changed, 50 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index fddb9da0403d5..e42eb10d502b2 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -350,11 +350,54 @@ static void __set_pending(struct kvm_vcpu *vcpu, gpa_t addr, unsigned int len,
 	}
 }
 
+/*
+ * If we are fiddling with an IRQ's active state, we have to make sure the IRQ
+ * is not queued on some running VCPU's LRs, because then the change to the
+ * active state can be overwritten when the VCPU's state is synced coming back
+ * from the guest. Setting an IRQ pending also requires the target VCPU's LRs
+ * to be synced first so that any prior ack in the LR is folded
+ * before pending_latch is set.
+ *
+ * For shared interrupts as well as GICv3 private interrupts accessed from the
+ * non-owning CPU, we have to stop all the VCPUs because interrupts can be
+ * migrated while we don't hold the IRQ locks and we don't want to be chasing
+ * moving targets.
+ *
+ * For GICv2 private interrupts we don't have to do anything because
+ * userspace accesses to the VGIC state already require all VCPUs to be
+ * stopped, and only the VCPU itself can modify its private interrupts
+ * active state, which guarantees that the VCPU is not running.
+ */
+static void vgic_access_active_prepare(struct kvm_vcpu *vcpu, u32 intid)
+{
+	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
+	     vcpu != kvm_get_running_vcpu()) ||
+	    intid >= VGIC_NR_PRIVATE_IRQS)
+		kvm_arm_halt_guest(vcpu->kvm);
+}
+
+/* See vgic_access_active_prepare */
+static void vgic_access_active_finish(struct kvm_vcpu *vcpu, u32 intid)
+{
+	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
+	     vcpu != kvm_get_running_vcpu()) ||
+	    intid >= VGIC_NR_PRIVATE_IRQS)
+		kvm_arm_resume_guest(vcpu->kvm);
+}
+
 void vgic_mmio_write_spending(struct kvm_vcpu *vcpu,
 			      gpa_t addr, unsigned int len,
 			      unsigned long val)
 {
+	u32 intid = VGIC_ADDR_TO_INTID(addr, 1);
+
+	mutex_lock(&vcpu->kvm->arch.config_lock);
+	vgic_access_active_prepare(vcpu, intid);
+
 	__set_pending(vcpu, addr, len, val, false);
+
+	vgic_access_active_finish(vcpu, intid);
+	mutex_unlock(&vcpu->kvm->arch.config_lock);
 }
 
 int vgic_uaccess_write_spending(struct kvm_vcpu *vcpu,
@@ -452,39 +495,6 @@ int vgic_uaccess_write_cpending(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-/*
- * If we are fiddling with an IRQ's active state, we have to make sure the IRQ
- * is not queued on some running VCPU's LRs, because then the change to the
- * active state can be overwritten when the VCPU's state is synced coming back
- * from the guest.
- *
- * For shared interrupts as well as GICv3 private interrupts accessed from the
- * non-owning CPU, we have to stop all the VCPUs because interrupts can be
- * migrated while we don't hold the IRQ locks and we don't want to be chasing
- * moving targets.
- *
- * For GICv2 private interrupts we don't have to do anything because
- * userspace accesses to the VGIC state already require all VCPUs to be
- * stopped, and only the VCPU itself can modify its private interrupts
- * active state, which guarantees that the VCPU is not running.
- */
-static void vgic_access_active_prepare(struct kvm_vcpu *vcpu, u32 intid)
-{
-	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
-	     vcpu != kvm_get_running_vcpu()) ||
-	    intid >= VGIC_NR_PRIVATE_IRQS)
-		kvm_arm_halt_guest(vcpu->kvm);
-}
-
-/* See vgic_access_active_prepare */
-static void vgic_access_active_finish(struct kvm_vcpu *vcpu, u32 intid)
-{
-	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
-	     vcpu != kvm_get_running_vcpu()) ||
-	    intid >= VGIC_NR_PRIVATE_IRQS)
-		kvm_arm_resume_guest(vcpu->kvm);
-}
-
 static unsigned long __vgic_mmio_read_active(struct kvm_vcpu *vcpu,
 					     gpa_t addr, unsigned int len)
 {
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 7182f63fc9382..f3ba3177dd97b 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -57,7 +57,7 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 {
 	u32 cpuid, intid = val & GICH_LR_VIRTUALID;
 	struct vgic_irq *irq;
-	bool deactivated;
+	bool deactivated, was_active;
 
 	/* Extract the source vCPU id from the LR */
 	cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val) & 7;
@@ -71,7 +71,8 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 
 	scoped_guard(raw_spinlock, &irq->irq_lock) {
 		/* Always preserve the active bit, note deactivation */
-		deactivated = irq->active && !(val & GICH_LR_ACTIVE_BIT);
+		was_active = irq->active;
+		deactivated = was_active && !(val & GICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & GICH_LR_ACTIVE_BIT);
 
 		if (irq->active && vgic_irq_is_sgi(intid))
@@ -88,8 +89,11 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state and was not represented in the LR, so preserve it.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & GICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & GICH_LR_PENDING_BIT) && !was_active)
 			irq->pending_latch = false;
 
 		/* Handle resampling for mapped interrupts if required */
-- 
2.39.5 (Apple Git-154)

