Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792556775;
	b=Xe6Ji1yPPbebHfyGxw6GDY0YWtcdAVi452c04l6awRT1+81IuYnsW4yslm3bPpcV2IWq
	 drTTlTi7V1BVYqLhfWaqeHz9rFxcGgiT9sLk9HfbZqBVIEdTPrTvCReYZwozGyCoJV+so
	 5hg3zMe600jzF+lH28GGaJjYC24ZeaEM57YWIHg+LQzx/NtdzS+Omec+4cq0DunsUrjBT
	 JryFaCBD2IrRqDwQmlnitJjVujnvIY5H9agFCFF5N/LvCpfqBuYcDCOdSzFltGYUgxbs4
	 OzUNCEMIasGEZHIlAzRO8cp69O4Pg5KaRysWPfiZggBBbIAgQKnOqsFI33okacjNjwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792556775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zRn4PafUxxSb/oRykccl0MVX6FaEdCZzKquEwGEhVtY=;
	b=a3K6G7gkeXTH7j4oCzWo3IJmGy2qzci5OsLxQjZDsS9GgsYmIk2jUn/oIOVWz4wHW725
	 QNypH0P+Ph8ulMK+NAFGv9YlymzKkNskLaP7Tw/hCKUhuJHehJaqQQsUY5XqhZyqwHnPl
	 MSLzCTWvbKrdFfL6tOEwOYmQWxHVPQYxvAImlOiOVb2PMOgTDdYI+7XMaPUETfSnDckHO
	 U0aNzjDRnkhjyN1jT1A6JmoGnNMY5Vw2EljC5vtezypKxVs3S7SHsA7ClBbTkSbyvLJLP
	 auUrPOZZ+8pFku/IrxmSoNlHBR961nos+XJHBbIgWHecRvwycEA9ZQ3LKg0+LcOmvlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IeIg5tcb;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC0C606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC0C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IeIg5tcb
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so174705a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792556775; x=1793161575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRn4PafUxxSb/oRykccl0MVX6FaEdCZzKquEwGEhVtY=;
        b=IeIg5tcbg5h1CCq9/Fw3Qx3Qkpwkb+6E/6TLmrVQe6yMhHJ1iFe5qn+lVQRGKJ1EHt
         RAGr2TEY2MMn/vbZUiHhwSE1xqIY8F3I5bzMOfbxrbJ751VqqydBpkm3nDyLhanCXGaz
         zGNgyjq8w+l1PsQqeNuMtLq82WgDjlnrH63CpZHFam2axBglzrCPs2CkpUQoENqxy4+O
         ENsiwx4biR6uU/BtzjGC0UtQrgt4nH3b5odOl0pwOMlmDHe7gt1QohYfX6xwXzXM/roA
         eU+0N3Fd4Hf/urTnz3KQFRCTl4r2Ce+zVILJea06rUWTFMFTsb90Z82X1VFwp5FX5S2t
         jdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792556775; x=1793161575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRn4PafUxxSb/oRykccl0MVX6FaEdCZzKquEwGEhVtY=;
        b=JVzdzPXfqk9MiJ2y1pJ1Kj9m+gEFU/33wEVZ6WYoZM05S8HTIFnXoE5S2T9aYAy1Bt
         hMEa1GSDmIi8FLIVl7z8mtwfMwfrrCX50X9Qmjv5MbXTIr5dhq6wPV/2Pmc0dw/1bQj8
         qP9N35CSP/QHl3eXaVGVx6A9/bBGEoigWvL3/EflwmHMfD0ldJoA9gMScfUtfTYgfZMF
         cmUsndGknkfeQFwiooenjbh1QeffBzzf/vqWVuvCMJsBxtT7qXlWTE1BZ/bZ6Z4BGxDN
         TE4tqx0852JGGbvMwuL2DFObmyfeUYDTT5Z6/v7SwMUBPOCfSHlXwg2jWQN4qmlx9qMe
         8Gdg==
X-Forwarded-Encrypted: i=1; AKwUvBxAUtdUH9rvmJMhVIB6yym3K03/y+6Pl6ZarLrqNF/tjtrFODQZCA8Wlb9cbqrA9Fdt8gJJaRJkZWRb12I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKimBzNQX7IR8YwtJkwuKCme1tCwnkKogedV9WvsEMaWNVm4Fn4
	woYktfb/MWab9zL5nScSD4Bc8i/cUZKkzrfOtYwKuCLPlOJhmHNm9I1Z
X-Gm-Gg: AYBFou3+sTXxUpiQm+Re/DdFASyR+mO6iewcCUMuj9J9vc75OK+Y1SUJf+Ja4dqEaig
	b7bh004W2bj4Y/iaTWL6VFvEtApSItXEWYtD4fTSPjnQYKSblsrRKeoUBq0iVZQ3cd5CMhH7p7V
	oVR1KWIVQkzzwhocSFjLgbh0NvhS4064wKpotFD2RhuUN8AOwWhCRMZfJRsIhV8ymoQ6EfUKy34
	HPUArKUarHZbJtvG6py5XfXNYTRjHuT/mdqRernIpiMrdxF1QMwrpobcdkhSRdp+O2ga9pGOV2o
	VQ6+mUS3VnyGaubkHoquQiMMxmsG6cSj1fd4SDreyxZ71eSjrTEsvzhxRJ3ObtzHiaRJqyn13bB
	ofLnjSQcIIKQdzkeHjNKz1urs5WA+um37soM7kNsQLj8CwG6Jf7qdnIFPcj2oNl5ttVdVerC1wm
	rzNemuppy9jxjlerjSCBF/euyIXWmLIHoSbqLS2Jqi1fVDtFVFbqDrfnI5NRpHrMHgYlVkEbD74
	gNrJ85ihRyM6XIEuyM6C1gM+JtPhcrOfxuAF85etAaQxrW2cK/A2Hsmd2wZ3PO5jfhUxCTRgR7p
	M9Ipxo7+GNAc0rY+tJBQpOhUMNkbP2Z6VPBrIctvPqGgXIZ8DTgvUBTq2L4zklF2pB+iRQOP
X-Received: by 2002:a17:90b:28cc:b0:39e:6c69:7777 with SMTP id 98e67ed59e1d1-3ad86d1c951mr751363a91.32.1792556774584;
        Tue, 20 Oct 2026 21:26:14 -0700 (PDT)
Received: from monk.. (border-p14.nat.sfu.ca. [192.75.244.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80219f83sm2355155a91.6.2026.10.20.21.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:26:14 -0700 (PDT)
From: ma.mandourr@gmail.com
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH 2/2] KVM: selftests: Add test for nested VM-Exits while vectoring soft INTs
Date: Tue, 20 Oct 2026 21:26:03 -0700
Message-ID: <20261021042603.608292-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021042603.608292-1-ma.mandourr@gmail.com>
References: <20261021042603.608292-1-ma.mandourr@gmail.com>
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

From: Mahmoud Abumandour <ma.mandourr@gmail.com>

Verify that a VM-Exit from L2 that occurs while vectoring INT3 or INTn
reports the instruction length in the VM-Exit instruction length field and
leaves L1's VM-Entry instruction length untouched.

Assisted-by: LLM
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/vmx_soft_int_vectoring_test.c     | 105 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/vmx_soft_int_vectoring_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 888a7530a280..d5f8749413f2 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -140,6 +140,7 @@ TEST_GEN_PROGS_x86 += x86/vmx_exception_with_invalid_guest_state
 TEST_GEN_PROGS_x86 += x86/vmx_msrs_test
 TEST_GEN_PROGS_x86 += x86/vmx_invalid_nested_guest_state
 TEST_GEN_PROGS_x86 += x86/vmx_nested_la57_state_test
+TEST_GEN_PROGS_x86 += x86/vmx_soft_int_vectoring_test
 TEST_GEN_PROGS_x86 += x86/apic_bus_clock_test
 TEST_GEN_PROGS_x86 += x86/xapic_ipi_test
 TEST_GEN_PROGS_x86 += x86/xapic_state_test
diff --git a/tools/testing/selftests/kvm/x86/vmx_soft_int_vectoring_test.c b/tools/testing/selftests/kvm/x86/vmx_soft_int_vectoring_test.c
new file mode 100644
index 000000000000..e74510c49938
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/vmx_soft_int_vectoring_test.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Verify that a nested VM-Exit that occurs while L2 is vectoring a software
+ * exception (INT3) or a software interrupt (INTn) reports the length of the
+ * instruction in the VM-Exit instruction length field, and doesn't modify the
+ * VM-Entry instruction length field, a VM-Entry control that only L1 writes.
+ */
+#include "kvm_util.h"
+#include "processor.h"
+#include "vmx.h"
+#include "kselftest.h"
+
+#define INTR_INFO_VALID_MASK		BIT(31)
+#define INTR_TYPE_SOFT_INTR		(4 << 8)
+#define INTR_TYPE_SOFT_EXCEPTION	(6 << 8)
+
+#define SOFT_INT_VECTOR			0x40
+
+/*
+ * Arbitrary, but a legal instruction length that differs from the lengths of
+ * INT3 and INTn, i.e. a value no VM-Exit in this test can legitimately produce.
+ */
+#define ENTRY_INSN_LEN			7
+
+static void l2_guest_code(void)
+{
+	asm volatile("int3");
+	asm volatile("int $" __stringify(SOFT_INT_VECTOR));
+	vmcall();
+}
+
+static void l1_assert_vectoring_exit(const char *insn, u32 vectoring_info,
+				     u32 insn_len)
+{
+	u64 entry_insn_len;
+
+	GUEST_ASSERT_EQ(vmread(VM_EXIT_REASON), EXIT_REASON_EXCEPTION_NMI);
+	GUEST_ASSERT_EQ(vmread(VM_EXIT_INTR_INFO) & 0xff, GP_VECTOR);
+	GUEST_ASSERT_EQ(vmread(IDT_VECTORING_INFO_FIELD),
+			INTR_INFO_VALID_MASK | vectoring_info);
+	GUEST_ASSERT_EQ(vmread(VM_EXIT_INSTRUCTION_LEN), insn_len);
+
+	entry_insn_len = vmread(VM_ENTRY_INSTRUCTION_LEN);
+	__GUEST_ASSERT(entry_insn_len == ENTRY_INSN_LEN,
+		       "VM-Exit while vectoring %s changed the VM-Entry instruction length from %u to %lu",
+		       insn, ENTRY_INSN_LEN, entry_insn_len);
+
+	/* RIP points at the INT3/INTn, skip it. */
+	vmwrite(GUEST_RIP, vmread(GUEST_RIP) + insn_len);
+}
+
+static void l1_guest_code(struct vmx_pages *vmx_pages)
+{
+	prepare_for_vmx_operation(vmx_pages);
+	load_vmcs(vmx_pages);
+	prepare_vmcs(vmx_pages, l2_guest_code);
+
+	/*
+	 * Put every IDT entry beyond the limit so that vectoring any event in
+	 * L2 generates #GP, and intercept #GP so that the VM-Exit occurs while
+	 * the original event is being vectored.
+	 */
+	vmwrite(GUEST_IDTR_LIMIT, 0);
+	vmwrite(EXCEPTION_BITMAP, BIT(GP_VECTOR));
+	vmwrite(VM_ENTRY_INSTRUCTION_LEN, ENTRY_INSN_LEN);
+
+	vmlaunch();
+	l1_assert_vectoring_exit("INT3", INTR_TYPE_SOFT_EXCEPTION | BP_VECTOR, 1);
+
+	vmresume();
+	l1_assert_vectoring_exit("INTn", INTR_TYPE_SOFT_INTR | SOFT_INT_VECTOR, 2);
+
+	vmresume();
+	GUEST_ASSERT_EQ(vmread(VM_EXIT_REASON), EXIT_REASON_VMCALL);
+	GUEST_DONE();
+}
+
+int main(int argc, char *argv[])
+{
+	gva_t vmx_pages_gva;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+
+	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX));
+
+	vm = vm_create_with_one_vcpu(&vcpu, l1_guest_code);
+	vcpu_alloc_vmx(vm, &vmx_pages_gva);
+	vcpu_args_set(vcpu, 1, vmx_pages_gva);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+	case UCALL_DONE:
+		break;
+	default:
+		TEST_FAIL("Unexpected ucall %lu", uc.cmd);
+	}
+
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.43.0

