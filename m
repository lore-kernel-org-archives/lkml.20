Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66439489882
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933242; cv=none; b=rP2KzYgMOZEimpey9aQpsdoJK2qF28T2yAqi88aIt/JRCAzJUEZJ+EK7OFNgJSAcQBhbOgnCkpomfdtYms1Wuio33I0+VWQAZAkJs1c7gjpwvb8U/4VbJWEAu6nPUrR1WcG7mbX5MgwryBvNL9FQW+TX4EcSOlCoFOCabO88wRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933242; c=relaxed/simple;
	bh=mGmxkvKj52r/VL/kLBv9q5DPklSGMxo9bT+u0vHf5rs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSBW4G0EfIKuR0ELEFuvmt3Jo0oCpN6SaHIzIhkfzh/BFuaicqDyAO+S9uaQVofI60xir/OzKQaHLjiBe/TyM+MO9wu9TqdGJ256ocHnROoI1A7d6MMkDsI23PyvV0bus+J3RFvJufUTCRnPooekaiQGLUC90o1OGnl6ioJbCM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UptAxKS8; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UptAxKS8"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ebso1605834d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933237; x=1790538037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y5wqvR/8Rgbn3Q8wmCLu7MA68JCRgtXzVIxWF4pI6Mc=;
        b=UptAxKS8bK/ZBb5JuwkGfgCFTOImqq2GI8i5uC/JqQ8x+VoU8sKP35iE858/TKjW02
         qyMoJxleSrPnT15uCWXekc9fNc0vbzrgRs5CGsg3HeImgt7RR1hkMsgfZiBwgnTPBhRS
         2zYIwKc1MdsbopcZwhAEgx6JUaWCW9b8wJ8AXjh7qERjyDYPYZBkftwloLMFqb0aWsxZ
         vbLyzNlRb0Ybyh9vs8y0o4CX/VTv7QevjAMIfIQjpwjm2GPxaKYgKdexOO6aMBN0T/KX
         KKTAbf3c6IURSKzXe3VvoN5cHalQWjzC1PIgNq0SZslANPyp/o/UjzXw0sddTpV1JsdM
         L20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933237; x=1790538037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y5wqvR/8Rgbn3Q8wmCLu7MA68JCRgtXzVIxWF4pI6Mc=;
        b=egdK7IjzyzSoX0KdKTrR+8WJkpPJ7k+u31APCQ7hdJ0rTRzpmNwS9bo4o56h78fJSy
         uok/9zxR1D9RqWbzHawcQ8BBMu/sfYIjHXJiuRK35qodkMoz6OgZolmSzGHW/dU3w8wc
         z3P1ZxMnUti00eUJFK+nX/FEQdLc/xY+eGK3USjpAxjc/fLwaiGCD0isQZcGNCgMzyTi
         zkTlvPrhflMD39+I61FmzUJO16RvWgkyBzvUMsbUP0yxuEVx7EepAU2ASlZwL5bb4Phy
         4fDuNFh+X/VrDJHtTht91+fUelilwlGcmzoFzsPi0DgOFOtsu8zArjiR9AlG1boTwzPs
         HtjA==
X-Forwarded-Encrypted: i=1; AKwUvBwIR75cZaqWAhDoKu1Q05+Zn5AGIkhP/UjEoEpUeUMRsWxOfAQMOF6LoFyAcKlhJMH1gwaXR/idjL/MOTs=@vger.kernel.org
X-Gm-Message-State: AFuF++nOucYoBNQCtXyR3Ny3eTYW7lI06xOxOKEPHbb61NCm6A/6QPdP
	XbUrJv38Mv5Q7IiHa63WHvm9ttMsIw39axua+uWFvIYx5ruHLteQiUyGtIBJRvxBLk4=
X-Gm-Gg: AYBFou0VYORobTAUf4Asbtl57K94Xm7WelquV9KETMOiGYytGPY7JY1PlS/iOgXdPmq
	bgJGcTkbZDr6zDzd6KFKanitWju9fIN2iFz7b//uhBdcn2DXVg1mmXmufRhd0ycNVkTXqoa82iM
	M0OrAJ1/TNsP25uuQm3f/4SI4XTWyqs9AaJyGLsDnHy6T5mbHsim5WY5htnqllb2IBzszAmPwR8
	EDWuzmB9lsZfqT4O6tMlboDwvvUaOKpmwfFH/eLAJBBKY06Bto7HSEP1YDuGvrR06q34xtRQkCe
	EwRHYjifuuTCZVEGJIgjZluW9FFmhjK6m4iWKpzrKI56U2ThSG6InjBfjZAnGejNyV1ar3QXNhX
	AHPibopjxoPTTnnI613wvgrUQ8yT/zx1mGk4MuhGV91etvm9bAtso/LE2Tn6yjD3dlJ72VtGw0E
	pgUSqOJ65sN18/OYZQoii8UXSJSlMbF7izF8B1Gh3UM+nasxdOiix+McLGmQHYeWKzD6u9lBldC
	70bbo44dw3OqroABTX7NVJkFj77D971a31erDnOY0xjS+pzBEA6Na7lhvwvH109Np4OHRdSBg6C
	NOsyYdpu4R5M/YQ9YPuW
X-Received: by 2002:a05:690e:4854:20b0:672:99e1:11f2 with SMTP id 956f58d0204a3-67299e11844mr878861d50.143.1789933237384;
        Sun, 20 Sep 2026 12:40:37 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672990aada0sm2671022d50.9.2026.09.20.12.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:40:36 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 37/46] KVM: VMX: Add Caretaker VMX assembly guest entry/exit routine and helpers
Date: Sun, 20 Sep 2026 15:36:41 -0400
Message-ID: <20260920193650.3373435-38-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add arch/x86/kvm/vmx/caretaker_vmenter.S and caretaker.h for standalone
Intel VMX VMLAUNCH/VMRESUME world switch on preserved physical cores.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/kvm/msrs.c                  |   2 +
 arch/x86/kvm/vmx/caretaker.h         |  78 +++++++++++++++++++
 arch/x86/kvm/vmx/caretaker_vmenter.S | 112 +++++++++++++++++++++++++++
 3 files changed, 192 insertions(+)
 create mode 100644 arch/x86/kvm/vmx/caretaker.h
 create mode 100644 arch/x86/kvm/vmx/caretaker_vmenter.S

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index ae849e0b7d14..536c8d1959dc 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -882,11 +882,13 @@ int kvm_msr_write(struct kvm_vcpu *vcpu, u32 index, u64 data)
 {
 	return __kvm_set_msr(vcpu, index, data, true);
 }
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_msr_write);
 
 int kvm_msr_read(struct kvm_vcpu *vcpu, u32 index, u64 *data)
 {
 	return __kvm_get_msr(vcpu, index, data, true);
 }
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_msr_read);
 
 int __kvm_emulate_msr_read(struct kvm_vcpu *vcpu, u32 index, u64 *data)
 {
diff --git a/arch/x86/kvm/vmx/caretaker.h b/arch/x86/kvm/vmx/caretaker.h
new file mode 100644
index 000000000000..d4272e202e73
--- /dev/null
+++ b/arch/x86/kvm/vmx/caretaker.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+#ifndef __VMX_CARETAKER_H
+#define __VMX_CARETAKER_H
+
+#define VMCS_VM_INSTRUCTION_ERROR	0x4400
+
+#ifndef __ASSEMBLY__
+#include <linux/types.h>
+#include <linux/kvm_host.h>
+#include <linux/oncore.h>
+#include <asm/vmx.h>
+#endif
+
+#include "../caretaker.h"
+
+#ifndef __ASSEMBLY__
+#include <asm/desc.h>
+#include <linux/processor.h>
+
+/* Length of instructions */
+#define PAUSE_INSN_LEN			2
+#define VMCALL_INSN_LEN			3
+
+/* Exit qualification bitfields for I/O instructions (Intel SDM Vol 3C) */
+#define VMX_IO_SIZE_MASK		0x7
+#define VMX_IO_DIRECTION_BIT		BIT(3)
+#define VMX_IO_PORT_SHIFT		16
+
+/* Default VMX preemption timer shift (counts down every 2^5 TSC ticks) */
+#define VMX_PREEMPTION_TIMER_SHIFT	5
+
+struct caretaker_vmx_page {
+	struct caretaker_x86_page common;
+	/* Guest syscall state not automatically switched by VMCS */
+	u64 star;
+	u64 lstar;
+	u64 fmask;
+	u64 vmxon_pa;
+	u32 timer_shift;
+	u32 ple_supported;
+	u8 vmxon_area[PAGE_SIZE] __aligned(PAGE_SIZE);
+} __aligned(PAGE_SIZE);
+
+static inline unsigned long vmx_vmread(unsigned long field)
+{
+	unsigned long val;
+
+	asm volatile("vmread %1, %0" : "=r" (val) : "r" (field) : "cc");
+	return val;
+}
+
+static inline void vmx_vmwrite(unsigned long field, unsigned long val)
+{
+	asm volatile("vmwrite %1, %0" : : "r" (field), "r" (val) : "cc");
+}
+
+#ifdef CONFIG_KVM_CARETAKER
+int vmx_caretaker_enter(void *page);
+void vmx_caretaker_exit_handler(void);
+void vmx_caretaker_register(void);
+void vmx_caretaker_unregister(void);
+void vmx_caretaker_decode_exit(void *page,
+			       struct kvm_caretaker_exit *exit);
+void vmx_caretaker_init_host_vmcs(struct caretaker_vmx_page *cvp);
+void vmx_caretaker_init(struct kvm_vcpu *vcpu);
+#else
+static inline void vmx_caretaker_register(void) {}
+static inline void vmx_caretaker_unregister(void) {}
+static inline void vmx_caretaker_init(struct kvm_vcpu *vcpu) {}
+#endif
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* __VMX_CARETAKER_H */
diff --git a/arch/x86/kvm/vmx/caretaker_vmenter.S b/arch/x86/kvm/vmx/caretaker_vmenter.S
new file mode 100644
index 000000000000..ff135cba854d
--- /dev/null
+++ b/arch/x86/kvm/vmx/caretaker_vmenter.S
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+#include <linux/linkage.h>
+#include <linux/cfi_types.h>
+#include <linux/objtool.h>
+#include <asm/asm.h>
+#include <asm/bitsperlong.h>
+#include <asm/kvm_vcpu_regs.h>
+#include <asm/nospec-branch.h>
+#include <asm/msr-index.h>
+#include <asm/page_types.h>
+#include "caretaker.h"
+#include "../caretaker_asm.h"
+
+.section .text.cpu_preserved, "ax"
+
+/**
+ * vmx_caretaker_enter - Low-level transition to VMX guest mode and back
+ * @cvp: Pointer to struct caretaker_vmx_page (%rdi)
+ */
+SYM_TYPED_FUNC_START(vmx_caretaker_enter)
+	ENDBR
+	CARETAKER_PUSH_HOST_REGS
+	movq %rsp, CXP_STACK_ORIG(%rdi)
+
+	/* Switch to private preserved stack */
+	movq CXP_STACK_TOP(%rdi), %rsp
+
+	/* Activate VMCS on this pCPU */
+	vmptrld CXP_VMCS_PA(%rdi)
+
+	/* Restore guest MSR_KERNEL_GS_BASE if valid/canonical */
+	movq CXP_KERNEL_GS_BASE(%rdi), %rax
+	movq %rax, %rdx
+	sarq $56, %rdx
+	incq %rdx
+	cmpq $1, %rdx
+	ja 2f
+	movl $MSR_KERNEL_GS_BASE, %ecx
+	movq CXP_KERNEL_GS_BASE(%rdi), %rax
+	movq %rax, %rdx
+	shrq $32, %rdx
+1:	wrmsr
+2:
+	_ASM_EXTABLE(1b, 2b)
+
+	/* Restore guest GPRs */
+	CARETAKER_RESTORE_GPRS %rdi
+
+	pushq %rdi
+	movq CXP_REG_RDI(%rdi), %rdi
+
+	/* Clear CPU microarchitectural buffers before guest entry */
+	CARETAKER_CLEAR_CPU_BUFFERS
+
+	/* Launch or resume */
+	vmresume
+	vmlaunch
+
+	/* If both fail, record error and return */
+	popq %rdi
+	mov $VMCS_VM_INSTRUCTION_ERROR, %eax
+	vmread %rax, %rax
+	movq %rax, CXP_LAST_EXIT_CODE(%rdi)
+	btsq $31, %rax
+	jmp .Lvmx_ret
+SYM_FUNC_END(vmx_caretaker_enter)
+
+SYM_FUNC_START(vmx_caretaker_exit_handler)
+	ENDBR
+	/*
+	 * Hardware jumps here on VM-Exit with:
+	 * RSP = HOST_RSP (CXP_STACK_TOP)
+	 * CR3 = HOST_CR3
+	 */
+	pushq %rdi
+
+	/* Recompute CVP pointer from RSP: CVP = (RSP & PAGE_MASK) - CXP_STACK_OFFSET */
+	movq %rsp, %rdi
+	andq $PAGE_MASK, %rdi
+	subq $CXP_STACK_OFFSET, %rdi
+
+	/* Save guest GPRs into CVP */
+	CARETAKER_SAVE_GPRS %rdi
+	popq CXP_REG_RDI(%rdi)
+
+	/* Stuff Return Stack Buffer to prevent guest RSB poisoning */
+	CARETAKER_FILL_RETURN_BUFFER %rax
+
+	/* Read guest MSR_KERNEL_GS_BASE */
+	movl $MSR_KERNEL_GS_BASE, %ecx
+	rdmsr
+	shlq $32, %rdx
+	orq %rax, %rdx
+	movq %rdx, CXP_KERNEL_GS_BASE(%rdi)
+
+	xorq %rax, %rax
+	jmp .Lvmx_ret
+
+.Lvmx_ret:
+	/* Restore caller stack */
+	movq CXP_STACK_ORIG(%rdi), %rsp
+
+	/* Restore host callee-saved registers */
+	CARETAKER_POP_HOST_REGS
+	ret
+SYM_FUNC_END(vmx_caretaker_exit_handler)
+STACK_FRAME_NON_STANDARD(vmx_caretaker_enter)
+STACK_FRAME_NON_STANDARD(vmx_caretaker_exit_handler)
-- 
2.55.0.1082.g2b9226bbc0-goog

