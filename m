Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A43BB9FD
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787574; cv=none; b=eXRmaGEnqVJgyhRfSnRXU+xJ6AE4ua5Sb2WecJVR8TK67fTvcJT+SqSYqFPoOgK1SD7/RZYEvueE1/sskDfjypn9zhdrTQmoBqIUP8hsELY0U+NZ/us/Ef4wIMMtx0Bqd0ZNaFHd9Gq4/miRczGgDlu7s2iagfq8CIDAAIXqFqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787574; c=relaxed/simple;
	bh=8op8SK69nNJ5+fR1jNHaXw1lEEgW3Gtam9ftxRyX8SI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=diTVwIo8syVrEMU/GpxvqdhMT1J2Ky9DAJq3Xta1PnkG7fpHQnnmCBUmP6VWcGC2Mt47dSONTzb/Jo0rELQUeyJTG99kls42qD7xUxeg81YWF/QP7KV5R6xGk5NwiWpk0RZAlTL9Vfyq//xBMbTjKKFQs0+1PUfFUd4k07d6sg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pjpJgNdT; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pjpJgNdT"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so1307353a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787787571; x=1788392371; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1lA74hrTUIjO6W0d1/xKos4l4p+K5AfqJrIXCLaGcfo=;
        b=pjpJgNdTHnuu+6L3q/mmjTzy585z5ikezulqFYdV1D3nVkbYUiqzL9S8UOJ2wKKiyL
         CttGmT3MHtOb/BlCRuugyQ2QWrTkliMrf5mCrL7L+NywjaJdOxr0LNjQ2dcDUiN5/qGt
         Cvm8jKZA3Wd222XY+r4aI9AqDMVPg3uc/v4b5dXozLDwnwvvPTGhy8e417XijcSo32hp
         2tY7fTbiruKuQi2zaSWM2/fLJUiaQPENCyEdKqGzFvQvaDmJZO+nqsa1Cu9w6l4vyrrF
         fwYXSqBEyj+uTJd4dzSsrSO6KZ8upK5+r6YwJ6n5xOZ9iqYafMhtC85+Mz7jjJ+SQ2GI
         n0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787571; x=1788392371;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1lA74hrTUIjO6W0d1/xKos4l4p+K5AfqJrIXCLaGcfo=;
        b=F8+tp5T5OC47lP80Fig4K9I8uek8PINKzfd6YukxIC/LAsCsBsVXUkNi0hHWZCadGC
         C6BLQqCvDpgouO+iFQETEwfqUIMeDwkVryJF0+9Dgue9lo5eOp5osk89Ri6rdUYZdWfR
         kHgD+UQnlxAjSqI/O+Zl/0RP5tYgGmLPcCAoCmTGizy6sIPvnXittpa87V5kanfvkdgB
         /lNVr1P0cC4ewiItOwzAbcwe9nm1/vVfAbbb1RqRpQvKZMMWvU/BI7OUUMnCWBstfr5C
         rbwh5mrWCKP+29leT5T92Ln+Ft0Xi6Q8q3s6DP/AEsyN2a0n75F7YRSYxrPWhASbFymh
         iSQw==
X-Forwarded-Encrypted: i=1; AHgh+RqHuq+JaewrxI4XwlpnTk2a+vJGpKz+8n7suazrQToxMhMiZZlBhy9W9hIdhtQuTBmxErOfWbDOqdgiMBg=@vger.kernel.org
X-Gm-Message-State: AFuF++lYlq3MztsjFMsmu8Qm88wg0BY5QSv42ECvY7xKQjDxqqbwW1YN
	2K27qLhDmxKWO75dBIWeK8qsPVxLnQRbxaLAF8js3iovnMAxDh2X2s60EUkbRqCzgzER/gGUV5w
	rlV3EDg==
X-Received: from plcq19.prod.google.com ([2002:a17:902:e313:b0:2cb:97da:d8ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1ae5:b0:2d6:f3ce:b51e
 with SMTP id d9443c01a7336-2d707a354b0mr110982175ad.3.1787787571313; Wed, 26
 Aug 2026 16:39:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:39:15 -0700
In-Reply-To: <20260826233919.998904-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826233919.998904-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826233919.998904-10-seanjc@google.com>
Subject: [PATCH v3 09/13] KVM: selftests: Always assert that vmptrld() succeeds
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, f734222792@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Assert that vmptrld() succeeds instead of forcing all callers to do the
same, and opportunistically provide a macro to print (hopefully) useful
information on VMX instruction failures.

Leave load_vmcs() as-is for the moment to minimize the amount of churn
since the vmptrld() changes aren't completely trivial.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/vmx.h | 23 +++++++++----------
 tools/testing/selftests/kvm/lib/x86/vmx.c     |  3 +--
 tools/testing/selftests/kvm/x86/state_test.c  |  6 ++---
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index cf37a03a93b9..8f004b946826 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -309,6 +309,10 @@ struct vmx_msr_entry {
 
 #include "evmcs.h"
 
+#define GUEST_ASSERT_VMX_INSN_SUCCEEDED(insn, __r, __pa)		\
+	__GUEST_ASSERT(!__r, __stringify(insn) "[0x%lx] hit %s",	\
+		       __pa, __r < 0 ? "VM-Fail" : ex_str(__r))
+
 static inline void vmxon(u64 phys)
 {
 	u8 ret;
@@ -338,18 +342,6 @@ static inline void vmclear(u64 vmcs_pa)
 	__GUEST_ASSERT(!ret, "vmclear [0x%lx] failed\n", vmcs_pa);
 }
 
-static inline int vmptrld(u64 vmcs_pa)
-{
-	u8 ret;
-
-	__asm__ __volatile__ ("vmptrld %[pa]; setna %[ret]"
-		: [ret]"=rm"(ret)
-		: [pa]"m"(vmcs_pa)
-		: "cc", "memory");
-
-	return ret;
-}
-
 static inline int __vmptrld(u64 vmcs_pa)
 {
 	u64 error_code;
@@ -366,6 +358,13 @@ static inline int __vmptrld(u64 vmcs_pa)
 	return vector ? vector : failed ? -EINVAL : 0;
 }
 
+static inline void vmptrld(u64 vmcs_pa)
+{
+	int ret = __vmptrld(vmcs_pa);
+
+	GUEST_ASSERT_VMX_INSN_SUCCEEDED(vmptrld, ret, vmcs_pa);
+}
+
 static inline u64 vmptrst(void)
 {
 	u64 value = 0;
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 57a8287de0d2..e65024b9ea0d 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -172,8 +172,7 @@ bool load_vmcs(struct vmx_pages *vmx)
 	*(u32 *)(vmx->vmcs) = vmcs_revision();
 	vmclear(vmx->vmcs_gpa);
 
-	if (vmptrld(vmx->vmcs_gpa))
-		return false;
+	vmptrld(vmx->vmcs_gpa);
 
 	/* Setup shadow VMCS, do not load it yet. */
 	*(u32 *)(vmx->shadow_vmcs) = vmcs_revision() | 0x80000000ul;
diff --git a/tools/testing/selftests/kvm/x86/state_test.c b/tools/testing/selftests/kvm/x86/state_test.c
index 203584fcaf62..a7786f478be0 100644
--- a/tools/testing/selftests/kvm/x86/state_test.c
+++ b/tools/testing/selftests/kvm/x86/state_test.c
@@ -108,7 +108,7 @@ static void vmx_l1_guest_code(struct vmx_pages *vmx_pages)
 	vmwrite(SECONDARY_VM_EXEC_CONTROL, SECONDARY_EXEC_SHADOW_VMCS);
 	vmwrite(VMCS_LINK_POINTER, vmx_pages->shadow_vmcs_gpa);
 
-	GUEST_ASSERT(!vmptrld(vmx_pages->shadow_vmcs_gpa));
+	vmptrld(vmx_pages->shadow_vmcs_gpa);
 	GUEST_ASSERT(vmlaunch());
 	GUEST_SYNC(8);
 	GUEST_ASSERT(vmlaunch());
@@ -118,11 +118,11 @@ static void vmx_l1_guest_code(struct vmx_pages *vmx_pages)
 	GUEST_SYNC(9);
 	GUEST_ASSERT(vmreadz(GUEST_RIP) == 0xc0ffee);
 
-	GUEST_ASSERT(!vmptrld(vmx_pages->vmcs_gpa));
+	vmptrld(vmx_pages->vmcs_gpa);
 	GUEST_ASSERT(!vmresume());
 	GUEST_ASSERT(vmreadz(VM_EXIT_REASON) == EXIT_REASON_VMCALL);
 
-	GUEST_ASSERT(!vmptrld(vmx_pages->shadow_vmcs_gpa));
+	vmptrld(vmx_pages->shadow_vmcs_gpa);
 	GUEST_ASSERT(vmreadz(GUEST_RIP) == 0xc0ffffee);
 	GUEST_ASSERT(vmlaunch());
 	GUEST_ASSERT(vmresume());
-- 
2.55.0.887.g758fc8c411-goog

