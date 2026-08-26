Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E5A3D5246
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787576; cv=none; b=RJbtTyKLWqUGnw+rGEl0+rg3wopoGcxpPzxlWezDwJAaq3oQv+4I56f1L+fV6VgCzJ0pEXFKBC8baZ91H2iyh4BWZ8ytgr+7ZCJm6IKrTr9BrAjPCE6wzW99xDkiLW4yy6vyEPciEX4gaZy8wBn9CGR20GbwvT83RS/Wb3zFZts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787576; c=relaxed/simple;
	bh=WR3vfwn/tUBcTJ88hZA6vzRfWzzpkEfUDot7lz2orgo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rDAP3gmizru1tCUszp5EcBaXbq30eT06reXFaqNTuxyGADBAlda/d15wj5J6XR/fbs14nyavUdZuiCdZTdkKthtTF6YIQyCMTIDq+XMjOd5GQHQnIGC/xfqjnuH9fJN6bEwUDnbzDRDsCglBUXjT+zN+3grPf/ML9bOi05Mf1xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ruhFSspg; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ruhFSspg"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso15432595ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787787574; x=1788392374; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zj4ROiVmXRICZe7l5AdtnEuLk38uQAGV2MCs3QZelPA=;
        b=ruhFSspgeEKXucumfwJXpFHkc6Hy+oOWOluJhwmBTPPTC3o9i++ukPZcONBcvrMHZM
         a9LiBH+GQZbwDXin1S9LGMs1qrsHyGolheGt8NDtXFt0JeKHN2PJm9e3w3Oxt15c6/1p
         YJiq4tD38ufC36A7lh5BWLujgdo1mMhUdvFxdqjUmLp2WCWEI6aWeXdlg+/Qdb0Pp3L2
         NqLu4Z/1xVATV3NJMfD2zysO8qDPAi9fzuWv1uFSKN8k6sBZIDN46Wx90u0za1P1zuRo
         ozYWWxbza6KVg8qovthmueoFKSAvH1GTzmu5YKm8dFx/kx5KnwIgcBwJvlgu9qyHCcCx
         6yjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787574; x=1788392374;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zj4ROiVmXRICZe7l5AdtnEuLk38uQAGV2MCs3QZelPA=;
        b=sMCwM7VwrHJ9k5jlAvqQ4hyLAQmLuSgS93iFeNiPfLT4o92ng4O+d+ru1PgtdVv1Pp
         1dGQtOMY/HQxG523zr5e59wVTug2oqed9N/eRfPHlvg6aqlNKeqFJqhqMbOw9Yw5wfQ8
         xRo9+1OhNlcHRKaFowFJT3vU7yHEvidkzkHCbNF5kKnlpGAy98zwbOLHesYvLysKqC/v
         64URL8QZzz55YayHa/2a72ri0P9SwIzI5oslSFKgQ/ra0znAr8IifXANts1XdH0Syd8a
         H0NNhhj/7uo7MepGQYJFwGZXwAtNDHkIzx+IChACZraZ2Yebtvdj2znzQrtiCghmNDoz
         ITJA==
X-Forwarded-Encrypted: i=1; AHgh+RqS5/UEoVW5O0aUq0WcxGTbymU3rvl9l4htNhXhSPcBAvZ3+mMhdvQDTRLoDXXwaeyYfBxzLjhhQXXoFGs=@vger.kernel.org
X-Gm-Message-State: AFuF++mUXc0FZrd3vCiKL0QgXVBvhAsmfzh0q4xbXgOHmGS/iTRDE5qF
	BHz6hRn9hyahKaNqI/z6yK8opd8Dk84vO1NGS329hsR1p/oWNbNYKzIvXUe+20TRv48Gp68D2j8
	Q4L5fNg==
X-Received: from pldr12.prod.google.com ([2002:a17:903:410c:b0:2ce:fa2c:7de3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:22ca:b0:2d6:fd55:3a9d
 with SMTP id d9443c01a7336-2d707a55a21mr179370145ad.3.1787787573491; Wed, 26
 Aug 2026 16:39:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:39:17 -0700
In-Reply-To: <20260826233919.998904-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826233919.998904-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826233919.998904-12-seanjc@google.com>
Subject: [PATCH v3 11/13] KVM: selftests: Add macros to handle simple VMX instructions
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, f734222792@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add macros to build helpers for VMXON, VMPTRLD, and VMCLEAR, i.e. the VMX
instructions that take a VMCS address as input, and don't have outputs.
Getting the params right is annoying, especially when using KVM_ASM_SAFE().

As a bonus, this adds non-asserting double-underscores versions of VMXON
and VMCLEAR for "free".

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/vmx.h | 71 +++++++------------
 1 file changed, 26 insertions(+), 45 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index 5c46ae95c4c3..3def8df902a2 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -313,58 +313,39 @@ struct vmx_msr_entry {
 	__GUEST_ASSERT(!__r, __stringify(insn) "[0x%lx] hit %s",	\
 		       __pa, __r < 0 ? "VM-Fail" : ex_str(__r))
 
-static inline void vmxon(u64 phys)
-{
-	u8 ret;
-
-	__asm__ __volatile__ ("vmxon %[pa]; setna %[ret]"
-		: [ret]"=rm"(ret)
-		: [pa]"m"(phys)
-		: "cc", "memory");
-
-	__GUEST_ASSERT(!ret, "vmxon [0x%lx] failed", phys);
+#define BUILD_VMCS_ASM_HELPERS(insn)					\
+static inline int __##insn(u64 vmcs_pa)					\
+{									\
+	u64 error_code;							\
+	u8 vector;							\
+	u8 failed;							\
+									\
+	asm volatile(KVM_ASM_SAFE(__stringify(insn) " %[pa]")		\
+		     "\n\tsetna %[failed]"				\
+		     : KVM_ASM_SAFE_OUTPUTS(vector, error_code),	\
+		       [failed]"=qm"(failed)				\
+		     : [pa]"m"(vmcs_pa)					\
+		     : "cc", "memory", KVM_ASM_SAFE_CLOBBERS);		\
+									\
+	return vector ? vector : failed ? -EINVAL : 0;			\
+}									\
+									\
+static inline void insn(u64 vmcs_pa)					\
+{									\
+	int ret = __##insn(vmcs_pa);					\
+									\
+	GUEST_ASSERT_VMX_INSN_SUCCEEDED(insn, ret, vmcs_pa);		\
 }
 
+BUILD_VMCS_ASM_HELPERS(vmxon)
+BUILD_VMCS_ASM_HELPERS(vmptrld)
+BUILD_VMCS_ASM_HELPERS(vmclear)
+
 static inline void vmxoff(void)
 {
 	__asm__ __volatile__("vmxoff");
 }
 
-static inline void vmclear(u64 vmcs_pa)
-{
-	u8 ret;
-
-	__asm__ __volatile__ ("vmclear %[pa]; setna %[ret]"
-		: [ret]"=rm"(ret)
-		: [pa]"m"(vmcs_pa)
-		: "cc", "memory");
-
-	__GUEST_ASSERT(!ret, "vmclear [0x%lx] failed\n", vmcs_pa);
-}
-
-static inline int __vmptrld(u64 vmcs_pa)
-{
-	u64 error_code;
-	u8 vector;
-	u8 failed;
-
-	asm volatile(KVM_ASM_SAFE("vmptrld %[pa]")
-		     "\n\tsetna %[failed]"
-		     : KVM_ASM_SAFE_OUTPUTS(vector, error_code),
-		       [failed]"=qm"(failed)
-		     : [pa]"m"(vmcs_pa)
-		     : "cc", "memory", KVM_ASM_SAFE_CLOBBERS);
-
-	return vector ? vector : failed ? -EINVAL : 0;
-}
-
-static inline void vmptrld(u64 vmcs_pa)
-{
-	int ret = __vmptrld(vmcs_pa);
-
-	GUEST_ASSERT_VMX_INSN_SUCCEEDED(vmptrld, ret, vmcs_pa);
-}
-
 static inline u64 vmptrst(void)
 {
 	u64 value = 0;
-- 
2.55.0.887.g758fc8c411-goog

