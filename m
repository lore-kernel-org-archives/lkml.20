Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FE33C09F9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787571; cv=none; b=GpRpZsroJ91SPb7dV0Yyrh4yDXIonkxhaKprtWvzyWI/OR47+Jc51dMZBBwKSx8mPnKIqzm8BjSc0grmiTLwKlv8RWM6xV3nl0YHCkUen4BzNTeqWtwZ2WvV+6tlocfL9X9OAMEAKA6AzDZX2Wk/sMzPYFOmnVmclyLTrDBQVFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787571; c=relaxed/simple;
	bh=PaH7v/6ZshYM/7JV06k//ebWoKkZhJSEyltBWJM+apc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UMgiHUPqc8B3IDB44Mr+ZGO5zg7r0SBOP7beHcsrNKjXNrJmXznkPr0gecK73ts/QQaFijNMTaBblBUcv632m3e30gqE3z8tlL7LBlpD3BkpQHkRMjf8IwMVdgFH5w8EAxUvA2EvekTERB9ODGl0MHlG/tga163Rm8n/HMr69ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fv7b2hj3; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fv7b2hj3"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-854f274dd69so268094b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787787567; x=1788392367; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rnnRN8hJfQwgolvTmyTrKWAk5xBd0sRsJp37TMVzJVc=;
        b=Fv7b2hj3WeDf/KiMfk4K8EIXktD2XA6j/UXo4nzaT0R6kbX7ybwdDL/s4v5g+vrJVw
         WO+noAJuO7Zk2pubqQKIyhAVPUiQGA7ih0I88kylAL8REQJAc//Uo6zLqL9vrAA1n098
         RfjDKmlYyb36bc+7ddVu2V1wGBDZLGRxxPfxnLWXB5HvBFYOfAUovHP/qn1SwoB5M6ek
         m9RCb/6j6yLQvETBvJPi0lyjWzdegVDNfJrnMZ/kAvft5jAIo7XyMJmLWEh6g98kbvsH
         b7pKGfB4n/1ysjWc07U90q7srEzdHmHxMGNILUq9e1LOhelGqzx5aycK0PjjJFeCKdCh
         60sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787567; x=1788392367;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnnRN8hJfQwgolvTmyTrKWAk5xBd0sRsJp37TMVzJVc=;
        b=PJd7h69QUN7LFWmZm2Wz1rG6Hd6g3ICsiYtEam16xL2dt31oqgQvNgX8Jv1/MgiVnH
         xKi2OcrU8TtjM46YEkPUOQ+pKhPIniJ9z2EvSvzpz0KM99BrKo/KVps6A0tAoFe/pKLE
         6P8DWozomParjLJJ8jn5Q7jo6LshJrc+CvmZy402BRtPHneUK4UEe/cX15Lz9SQ8DLUo
         59p+JLF3CqFLwh5809xGkwD8Z8FfNbhqOjthgJsaXCvaOM9HEOcgM5WljeDcEjikEfqQ
         y5MAbjQrg3pEJ4cYnVq7QU+HLJ2CARVemXW3fJ1IZ6+zictgUyZRWhk9P3yMx0K75Fio
         02QA==
X-Forwarded-Encrypted: i=1; AHgh+RpkTgEzJPflsJFeyUgQBDdxfedU4oSqwzNXv2xsEZtvkh0OIjsNBaF79uuDQMzvlos367o7DERslsuTufA=@vger.kernel.org
X-Gm-Message-State: AFuF++nr5HyqvrdqidHGDKTHhTCx5+P4ghFnVK3trQJ1WqCVHFY/pejl
	y/tvMGcRKSngp4oBwY0pUO4YyvKB6BGVPjIFNMg3u0qDN0RafzHSkSxqGkyW7YGH68ivhzuOKzh
	3j6vIfw==
X-Received: from pgco21.prod.google.com ([2002:a63:7315:0:b0:cc1:bf49:dfd2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1a12:b0:854:9b2a:f898
 with SMTP id d2e1a72fcca58-8549b2af9f9mr7835471b3a.8.1787787567089; Wed, 26
 Aug 2026 16:39:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:39:11 -0700
In-Reply-To: <20260826233919.998904-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826233919.998904-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826233919.998904-6-seanjc@google.com>
Subject: [PATCH v3 05/13] KVM: selftests: Check VMPTRLD with active eVMCS
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, f734222792@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Check that VMPTRLD when eVMCS is active results in #UD. This matches
genuine Hyper-V's behavior.

Use KVM_ASM_SAFE framework to handle #UD from VMPTRLD.  Unfortunately, the
same trick cannot be applied to the existing #UD check on VMLAUNCH as
VMLAUNCH clobbers all registers which KVM_ASM_SAFE depends on.  Keep
VMLAUNCH handling separately.  Deliberately use a double-underscores
prefix instead of a "safe" postfix for the helper, to communicate that the
inner/outer helpers handle more than just exceptions, they also handle
VM-Fail conditions.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
[sean: use __ instead of _safe]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/vmx.h | 19 +++++++++++---
 .../testing/selftests/kvm/x86/hyperv_evmcs.c  | 26 +++++++++++++++----
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index ac7d48d1387e..a161dbee7e04 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -342,9 +342,6 @@ static inline int vmptrld(u64 vmcs_pa)
 {
 	u8 ret;
 
-	if (enable_evmcs)
-		return -1;
-
 	__asm__ __volatile__ ("vmptrld %[pa]; setna %[ret]"
 		: [ret]"=rm"(ret)
 		: [pa]"m"(vmcs_pa)
@@ -353,6 +350,22 @@ static inline int vmptrld(u64 vmcs_pa)
 	return ret;
 }
 
+static inline int __vmptrld(u64 vmcs_pa)
+{
+	u64 error_code;
+	u8 vector;
+	u8 failed;
+
+	asm volatile(KVM_ASM_SAFE("vmptrld %[pa]")
+		     "\n\tsetna %[failed]"
+		     : KVM_ASM_SAFE_OUTPUTS(vector, error_code),
+		       [failed]"=qm"(failed)
+		     : [pa]"m"(vmcs_pa)
+		     : "cc", "memory", KVM_ASM_SAFE_CLOBBERS);
+
+	return vector ? vector : failed ? -EINVAL : 0;
+}
+
 static inline int vmptrst(u64 *value)
 {
 	u64 tmp;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
index 6224d859d7bb..f953a9755a76 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
@@ -23,7 +23,11 @@ static int ud_count;
 static void guest_ud_handler(struct ex_regs *regs)
 {
 	ud_count++;
-	regs->rip += 3; /* VMLAUNCH */
+	/*
+	 * VMLAUNCH insn can't be easily covered by KVM_ASM_SAFE framework but
+	 * luckily the instruction is always three bytes.
+	 */
+	regs->rip += 3;
 }
 
 static void guest_nmi_handler(struct ex_regs *regs)
@@ -178,7 +182,15 @@ void guest_code(struct vmx_pages *vmx_pages, struct hyperv_test_pages *hv_pages,
 	GUEST_ASSERT(vmreadz(VM_EXIT_REASON) == EXIT_REASON_VMCALL);
 	GUEST_SYNC(11);
 
-	/* Try enlightened vmptrld with an incorrect GPA */
+	/* VMPTRLD instruction causes #UD after enlightened VMLAUNCH */
+	GUEST_ASSERT(__vmptrld(hv_pages->enlightened_vmcs_gpa) == UD_VECTOR);
+
+	/*
+	 * Try enlightened vmptrld with an incorrect GPA. GUEST_SYNC(12) signals
+	 * the host to enable guest_ud_handler() which cannot be enabled beforehand
+	 * to not override the default fixup handler from KVM_ASM_SAFE().
+	 */
+	GUEST_SYNC(12);
 	evmcs_vmptrld(0xdeadbeef, hv_pages->enlightened_vmcs);
 	GUEST_ASSERT(vmlaunch());
 	GUEST_ASSERT(ud_count == 1);
@@ -252,7 +264,6 @@ int main(int argc, char *argv[])
 	vcpu_args_set(vcpu, 3, vmx_pages_gva, hv_pages_gva, addr_gva2gpa(vm, hcall_page));
 	vcpu_set_msr(vcpu, HV_X64_MSR_VP_INDEX, vcpu->id);
 
-	vm_install_exception_handler(vm, UD_VECTOR, guest_ud_handler);
 	vm_install_exception_handler(vm, NMI_VECTOR, guest_nmi_handler);
 
 	pr_info("Running L1 which uses EVMCS to run L2\n");
@@ -282,7 +293,7 @@ int main(int argc, char *argv[])
 
 		/* Force immediate L2->L1 exit before resuming */
 		if (stage == 8) {
-			pr_info("Injecting NMI into L1 before L2 had a chance to run after restore\n");
+			pr_debug("Injecting NMI into L1 before L2 had a chance to run after restore\n");
 			inject_nmi(vcpu);
 		}
 
@@ -292,9 +303,14 @@ int main(int argc, char *argv[])
 		 * KVM_STATE_NESTED_EVMCS is not lost.
 		 */
 		if (stage == 9) {
-			pr_info("Trying extra KVM_GET_NESTED_STATE/KVM_SET_NESTED_STATE cycle\n");
+			pr_debug("Trying extra KVM_GET_NESTED_STATE/KVM_SET_NESTED_STATE cycle\n");
 			vcpu = save_restore_vm(vm, vcpu);
 		}
+
+		if (stage == 12) {
+			pr_debug("Trying enlightened VMLAUNCH with an invalid PTR\n");
+			vm_install_exception_handler(vm, UD_VECTOR, guest_ud_handler);
+		}
 	}
 
 done:
-- 
2.55.0.887.g758fc8c411-goog

