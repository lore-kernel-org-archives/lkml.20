Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DC348987C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779992; cv=none; b=W3WH4OVFpQ+cbHnU0h9+p2fD+Rr0vPo/W/YUmgdM/Ot5o6xzDWjSbaLyQGK5fRGTyw7yDZdT4uox7GRTTYD4jZ6dfpCOBgD9yX1VHdLsJb5mpywWjOsKkIhyCLInoqD9wvWctYLK/79ZG8DUopSEyf7Nq/xaIHNW+ndFbE2KlaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779992; c=relaxed/simple;
	bh=oyP3Jx5TwpM7lfELbNHOfyWPzvuct03eZ43EbbHjfho=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wdka1sxYX65L7vefE0KjNSYrQkExVw0SZvxwurtQXmkB4baXTg8LIIXIIDhsOIwiz1rpLIQ6nLRcg/LhcRgABxyLJvj3ufmTjz4t0ykXlwVrQyooWl9mOOe7NDNZRUIIn3OrS5j6HlAtP/AYDTrMqh49RZkuXN9FvZlPN9Gx524=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LhwBOzJQ; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LhwBOzJQ"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c62f0d60so1710071a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787779987; x=1788384787; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SS97OA+o28099dnvzUD8Vv8IMBV5k83CG9rDEZqRG/8=;
        b=LhwBOzJQGYv359CevPYPq1TEGh8vUbBvQ7eg72os7QFgGLY7RHUd/U1zh2NBDS3Zzt
         OEDXbQdEDpAgsIzJK/Mmk4z0s8nr+4YUsCLsBK1fbyX2ejU+g4oVkqowUOTdowi5EkRH
         P57h82UbFDYsit0rm+eghfCRgnVff8Op67+WYOyXyVEK/doa/ycu8x1hGQbyVYwsSnIY
         toxeQM9I68KlKbjsRReUiN8NQsExheP6GzZtuhhxJgCFYJg+l71xzURH56JHetXLsUF8
         IGjrw4I68DuXt5eEzabx6f+Xr2u1/dG9TYXTu9XnYp2PK/cDf5D9VJKrdy0axJUeB9D1
         Z8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787779987; x=1788384787;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SS97OA+o28099dnvzUD8Vv8IMBV5k83CG9rDEZqRG/8=;
        b=GUmkJ3vnMqOlNjdmd1qWC3zFNG4G3/IDvfNMQMeYOaCiNcAaMnzoJsqGkUEt/A0HSM
         /Yov3yDCCbId6jBhFAMmx54gKJQtZiVSPPan5fVPT4qdfbkLT/NwzXeUxqvHzaZqul1i
         FVk+1Ro2fctR8u+wozNYs2tvHKelE3Eg2WXuvpl7FHAln+7doXyd0Df1oYggPNhpUwOb
         rY3bCkOGwwomJwNJHd0PvNxUwC3Z2o0Q53hUM5CGKHEBBEr2rUmWkNy+L7vndnSbdduQ
         aiqTTHfoo7SPH6xSkTk/J008y70n07bfQJgn8mdANcxZYFs54QsOtrSXNCTknPYCbYeM
         j9PA==
X-Forwarded-Encrypted: i=1; AHgh+Row/MFXmwFGaLM30BBKPQYdwiOeRsWAWITrpgfHKiubtCGMSfpELR9Ty6D7/+os8IkvRRQl2NPYvykuclw=@vger.kernel.org
X-Gm-Message-State: AFuF++l+og2xmAE1cM/o+e2vQwLXpUASd+Z6YLt+oiV3mkoiCeaxBlVm
	ndZijR8YMsozpucgwEVt97RvgXwNJzf11viNLGd+yhiBx9LPr33fg5gan9pj++vlFlKDucYrNrh
	afCq1Fg==
X-Received: from pgal4.prod.google.com ([2002:a63:3e04:0:b0:cc1:be9e:35ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a95:b0:3c1:fbf:1e2e
 with SMTP id adf61e73a8af0-3cf83b22768mr21020948637.10.1787779986926; Wed, 26
 Aug 2026 14:33:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:32:42 -0700
In-Reply-To: <20260826213303.914988-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826213303.914988-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826213303.914988-3-seanjc@google.com>
Subject: [PATCH v10 02/21] KVM: x86: Improve accuracy of KVM clock when TSC
 scaling is in force
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Dongli Zhang <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="UTF-8"

From: David Woodhouse <dwmw@amazon.co.uk>

The kvm_guest_time_update() function scales the host TSC frequency to
the guest's using kvm_scale_tsc() and the v->arch.l1_tsc_scaling_ratio
scaling ratio previously calculated for that vCPU. Then calculates the
scaling factors for the KVM clock itself based on that guest TSC
frequency.

However, it uses kHz as the unit when scaling, and then multiplies by
1000 only at the end.

With a host TSC frequency of 3000MHz and a guest set to 2500MHz, the
result of kvm_scale_tsc() will actually come out at 2,499,999kHz. So
the KVM clock advertised to the guest is based on a frequency of
2,499,999,000 Hz.

By using Hz as the unit from the beginning, the KVM clock would be based
on a more accurate frequency of 2,499,999,999 Hz in this example.

Use u64 for the hw_tsc_hz field since an unsigned int would overflow for
TSC frequencies above 4GHz.

Fixes: 78db6a503796 ("KVM: x86: rewrite handling of scaled TSC for kvmclock")
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Tested-by: Dongli Zhang <dongli.zhang@oracle.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/cpuid.c            |  1 +
 arch/x86/kvm/x86.c              | 18 ++++++++++--------
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 683bb8bf43a9..0255ca6b24c2 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -864,7 +864,7 @@ struct kvm_vcpu_arch {
 	gpa_t time;
 	s8  pvclock_tsc_shift;
 	u32 pvclock_tsc_mul;
-	unsigned int hw_tsc_khz;
+	u64 hw_tsc_hz;
 	struct gfn_to_pfn_cache pv_time;
 	/* set guest stopped flag in pvclock flags field */
 	bool pvclock_set_guest_stopped_request;
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index ddb022cb203a..ca26be88c204 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -16,6 +16,7 @@
 #include <linux/vmalloc.h>
 #include <linux/uaccess.h>
 #include <linux/sched/stat.h>
+#include <linux/units.h>
 
 #include <asm/processor.h>
 #include <asm/user.h>
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 10f11e06d117..e18158f51103 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -61,6 +61,7 @@
 #include <linux/mem_encrypt.h>
 #include <linux/suspend.h>
 #include <linux/smp.h>
+#include <linux/units.h>
 
 #include <trace/events/ipi.h>
 #include <trace/events/kvm.h>
@@ -1763,7 +1764,8 @@ static void kvm_setup_guest_pvclock(struct pvclock_vcpu_time_info *ref_hv_clock,
 int kvm_guest_time_update(struct kvm_vcpu *v)
 {
 	struct pvclock_vcpu_time_info hv_clock = {};
-	unsigned long flags, tgt_tsc_khz;
+	unsigned long flags;
+	u64 tgt_tsc_hz;
 	unsigned seq;
 	struct kvm_vcpu_arch *vcpu = &v->arch;
 	struct kvm_arch *ka = &v->kvm->arch;
@@ -1789,8 +1791,8 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 
 	/* Keep irq disabled to prevent changes to the clock */
 	local_irq_save(flags);
-	tgt_tsc_khz = get_cpu_tsc_khz();
-	if (unlikely(tgt_tsc_khz == 0)) {
+	tgt_tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
+	if (unlikely(tgt_tsc_hz == 0)) {
 		local_irq_restore(flags);
 		kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
 		return 1;
@@ -1831,16 +1833,16 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 	/* With all the info we got, fill in the values */
 
 	if (kvm_caps.has_tsc_control) {
-		tgt_tsc_khz = kvm_scale_tsc(tgt_tsc_khz,
+		tgt_tsc_hz = kvm_scale_tsc(tgt_tsc_hz,
 					    v->arch.l1_tsc_scaling_ratio);
-		tgt_tsc_khz = tgt_tsc_khz ? : 1;
+		tgt_tsc_hz = tgt_tsc_hz ? : 1;
 	}
 
-	if (unlikely(vcpu->hw_tsc_khz != tgt_tsc_khz)) {
-		kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_khz * 1000LL,
+	if (unlikely(vcpu->hw_tsc_hz != tgt_tsc_hz)) {
+		kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_hz,
 				   &vcpu->pvclock_tsc_shift,
 				   &vcpu->pvclock_tsc_mul);
-		vcpu->hw_tsc_khz = tgt_tsc_khz;
+		vcpu->hw_tsc_hz = tgt_tsc_hz;
 	}
 
 	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
-- 
2.55.0.887.g758fc8c411-goog

