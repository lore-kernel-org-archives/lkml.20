Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C42280329
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481482; cv=none; b=YvZkK6KMTExqoW0XXAD/S9gGQrCcDPtiFNDJ3ZMy5lUs8zrATWvlsp1u/znrVUCrOR43k3fjS+GSpLn075WKcGyjz76aYJQRBqmIZVIfSbVGtqnjJb1Bw6VlID688Yku2ANM4wfcLujOIBqPfxhAVGfpXs2N41C3GZlFZUGIkZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481482; c=relaxed/simple;
	bh=tDrKAnuI9Uxg5aMETYZvEKyOXsIlNDxnV7W4NqPPMiY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UPin7kAhlOYpYST2nIrVOMOz+peQl8C3D4atHicNKRiPJO+f2rVG1RYjhaafbl+8A5P9IMsirBbh15SNU1dhT4MwpsH1Kw1HwnLdyBVxnwkpdHxXE/7zD617EEJ2VBQPFBR8C1iI+WFJP/3NoVsjhkcZ7rYkGfJP/g3EOri89AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tHFwXXtl; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tHFwXXtl"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9057fab9eso7181545ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788481476; x=1789086276; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7Xvn0jlM2o/RfgoN0/1SOuii7r0BwBFUn8zSa9jtw2A=;
        b=tHFwXXtl8OQ7yXzDBoL/p1bUN3712jDosxXnf/lTjnbyqyseu+dtRAcP77iHns+kjn
         Qiez4+Tzq/779t8iqzKMp64/f3ciZ24KYKUrWdJvdWyZZmLHQhHeUWJ1toicd9+UV48y
         NdvXY6p6HLv1m1XM9GRO+P+AWLl/Lawpvl3yUACZHoLwEOoVz6+NTWtffDhMzRT2DwKF
         PUemB8gi6dGi7zq1ZuRUG7cpu+RdcLw8hPL2AU9oYYi9/mRI0yNU1rGPiC2jOEl8xeu3
         CwhYjavvPS15a7rbMv/BYkptvThnFlITu/tQsDoAPOA1rCo53eqfapUdGO041hcVpq9d
         CC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788481476; x=1789086276;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Xvn0jlM2o/RfgoN0/1SOuii7r0BwBFUn8zSa9jtw2A=;
        b=TuYu6kfiVeWb8tOBPkdCkcMKqJq6L3EZloG4YMOuOYm5h4yvHx37meFcCzhUs0iEiu
         eJIJyg2qcQkZr5OHf6SguW+7DyjF6JldHOvaZ7OMIwiDC1D9+2n8rUYanBFEf46w9Ymt
         vfL2UXUlSjf+sa5vh/GzKXRyNVnB1fSzfF3yy2uJCC8ECjiX1zgJg/FnEvs+8W37xBmu
         dm5SUYxAAlI3ytAA3mfXxOXOGSqMsoO136vEgsQjW5wxOXbcY7oudVHt6r/0Z+YpRj2A
         NkLNb5W1ZGbzFFGjHmTv2+WklzHN4d3qJSrqvwP8hmUXb0WdG7uOz26j19PjePuEOPDu
         nF0A==
X-Forwarded-Encrypted: i=1; AKwUvBzthW6r6SYfce+iuDYNoEsZ9eY41ow8h6GmgJi+ZLwNISurwDYP8N3dpV2xOwUAmcRvH/z8KqmZmBy+T0w=@vger.kernel.org
X-Gm-Message-State: AFuF++kul56ejUeddCY90EvdqDm8lEu97+EOtJiRhn1J3atpHWKLVPYx
	Ia2n5mdcxSc92mwdjDiAfSEEcpw53OGkhWvnkXkbw7fHr8wEmhTXd3g5mCfjOuCZ07oRc34vPnw
	MgvrvKg==
X-Received: from plw19.prod.google.com ([2002:a17:903:45d3:b0:2cf:8131:8521])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:124e:b0:2d9:4baf:f1a7
 with SMTP id d9443c01a7336-2db1287a543mr29645055ad.19.1788481476138; Thu, 03
 Sep 2026 17:24:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  3 Sep 2026 17:24:15 -0700
In-Reply-To: <20260904002423.3154436-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904002423.3154436-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904002423.3154436-10-seanjc@google.com>
Subject: [PATCH v4 09/17] KVM: selftests: Always assert that vmptrld() succeeds
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
2.55.0.979.g7e5102b832-goog

