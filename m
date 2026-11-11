Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376855;
	b=b8smsjbnWOwXG5SL/9jA7XQmf1Ctg5v9DVOU8fHyFj/JEgR91Ha5GYyjUuF1f2hEThQd
	 rn6sp18Ouq/sW2AnxZeGG0wZY6d03jvp607XkbMl4pwYIU3TSr3+/7RDk9tKYGD+dUbvz
	 R5/w0CKV/RP6esJZHnF75ORC1YmzbjRbbLpxJC+uDlIvqaguqOc86VMvNI2uGkHB6c5eP
	 nTWsJMyY5YJ73pJhTmY7Mlu8EWSsIBVlBj9wZ0KevUCdP30iIpXhUmkm+scseMmRBR1Az
	 B090hUnFDRhi2LAP3VNzzU4FGr3RnetofgYT7V8twah9GyFlcUwnRGQ+sbJYvH6VFCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376855;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yUu1/mKZm+Up6njBU/bttM2RPCbWdwFakUfLnH9Qrec=;
	b=tVicewTtrWhup/aPi4qWn5cuV+sas6hZkT6YRho/jgjL94Krg92YGvDe1NO/3pPVzo/0
	 ZCohH82xGAZy8A1TLccXdH/suxG941JauaLPuRdpjDDu0/pl8jEdxoA0SZEJtGuOWcyuY
	 JLX9QtW+2xsZZCIYmr1fQowpER1YUKZcmiDWI9lCFHmhgNP7ws1XzPDhRGARfxCZ2dPFU
	 zZssN0SknsZHFSt1p2xvaswAQMUPnKFXFz7H+ZoZV01H7WNK+x6PPvyCy6uSCDtKzEhjP
	 0YYgRNxaNPLHzbR3w0OAghldcYIwfooXFKATHsPUMTh0RVau/fGa7hAJ5QJUYOBDFhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iLAZoJyF;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBBE60A5BD5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBBE60A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iLAZoJyF
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93f1e5d7450so279765885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:00:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376854; x=1794981654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUu1/mKZm+Up6njBU/bttM2RPCbWdwFakUfLnH9Qrec=;
        b=ZyhsLK1um8tZejyn6V77f1AflqRQHN+ZcO1Fik51FRGlVlvl8aBMen429+scXqEuYn
         qcH1SbRFrRoI9+5MxExORDOn6XNt1bbNiroZBqxMaO0OGsdyo4CekH3O8p2LD5pNw7DZ
         UPWNbKy792rPcjUUmpKpvh8kpSSwZ6GQt6I4M/4fN6Ot6Jzh1YSy1BfE6+I7AlRU6wNd
         uoJby1i43EqDg3miK+Kb4tAkn2CT2ZLllRt/fYtU2fP88UZ7yUqRLkgHT86vlDbi1w76
         DbStQfX+8mYhYYW7mfmaEngUmVQs4OmQdCVMQ01mJCuRkRizRRyG/n2u/1CvxRSBGdfx
         nFXw==
X-Forwarded-Encrypted: i=1; AL+hErFyswYn6aRuMk6M5wsKbwRCglEw6AOOCG9SpI6e7rOk2SXjd3qJ0bFzkXxoG/wdSs10ZRQMeLwJwLbX4EE=@vger.kernel.org
X-Gm-Message-State: APuU4Z93KCdzcPuGDOtOqTAnYfFaA3NkkyEA3R8stVFe2CtXcP1Wy0a5
	+G2SYuQb6xZVTUROFr9sLlSuAq5UPPdIYluNkqkXRLRBlk857xgcS0J1cGUZNxJBBCwswV2XEQD
	sk95vEus8ASuYmSKL8/V10C7rOrKBfOfU6DOmBgQZx6kmmyxNNpJ/Ty54OQ/OmMyqTbtKzNbsU0
	EFc/oXsZUFuUXXnAEXNrpsA4m+tlu2ZSU4d5wP+mwiVvhiF61ulRVogl1wdj3HiyesAA3N5FLW3
	Dt2uwi49g42TSV/
X-Gm-Gg: AYBFou2yJOBUsdXwld9403G5SX72B+A9WeHzcxL6hcWOSVmGuN3+AO854VjR/hXIifC
	KNJp30iXquuO0di6SeOkrlxbxsYjXVOrgbnx4Jgll5rJWh9p4E+9b74dpn0YL+IMBrTGr5k1bML
	E42CYtFHFm/f8+/o4Cxi6VB4S2GKiEQ28yntp6JFHPa/jzfWQZ6mCTADyAtHofQEOI1I+5JA0gZ
	7hd43qv6xMBXTmvek/wuVBBs6PqrUICBxIjK2H3EjQtJR93WaFH7M0cP484ojxiRa9Ivbnx6Oie
	/PTDvzCp/1pwRWkrcr/yPLxJ229SUkN8pzrds9txhyvEAVXRTh3TYGodhVg2h05tQpgQZnBFaeG
	pFFRKDJFh2NTvpocvzDi7/hO3qqViG/6TRDHqgmhyCIcgyj2/7JHYH3xCC28Yj7in8nX14Oksk9
	YI3hMkVFY94XscNEFMCKKvPB5/AqOCZPoO
X-Received: by 2002:a05:620a:1b94:b0:93e:c12c:4408 with SMTP id af79cd13be357-947b0008293mr203407785a.68.1794376854267;
        Tue, 10 Nov 2026 22:00:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9479ee6d10asm51045685a.3.2026.11.10.22.00.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:00:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so531017585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794376852; x=1794981652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUu1/mKZm+Up6njBU/bttM2RPCbWdwFakUfLnH9Qrec=;
        b=iLAZoJyF8t2AaPkaDAffU8LJSIDhe9NRB/9FWFOnAcPUU8i7r9CfwWCczMMr4OFGoG
         u8bQenf/syo9FDpeQcX/hxltTVA/44t9dBZ3ILTxSQM4bHT1KmQ9FcM1cHGAUZVtFjsB
         KPBsy77OHXb9v5LyLM3mKmNWncGFRTdyi+ieo=
X-Forwarded-Encrypted: i=1; AL+hErHNQlq0gzKgHJ9NqFhgr/XkgXr5U9Njx+D3ELsDCYFYNV1yxlJFBg30qvScSEiXM94TyvdCxDAKvYUgty4=@vger.kernel.org
X-Received: by 2002:a05:620a:4156:b0:93f:5593:5750 with SMTP id af79cd13be357-947afd6c0fbmr227815085a.17.1794376851941;
        Tue, 10 Nov 2026 22:00:51 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:93f:5593:5750 with SMTP id af79cd13be357-947afd6c0fbmr227809085a.17.1794376851368;
        Tue, 10 Nov 2026 22:00:51 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:42 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Doug Covelli <doug.covelli@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Xin Li <xin@zytor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Liran Alon <liran.alon@oracle.com>,
	Arbel Moshe <arbel.moshe@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 11/12] KVM: selftests: Test VMware hypercall exits with nested Hyper-V flushes
Date: Wed, 11 Nov 2026 01:00:00 -0500
Message-ID: <2239b3e439ce19419015d7b2ce4144d5176a884a.1794374897.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794374897.git.zack.rusin@broadcom.com>
References: <cover.1794374897.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Enable VMware hypercall exits in hyperv_evmcs and hyperv_svm_test when
KVM supports them, and issue the first L2 TLB flush hypercall with
VMware's magic value in RAX.

When L1 enables it, L0 handles Hyper-V's L2 TLB flush hypercall itself,
through the same dispatch that forwards VMware hypercalls.  The 64-bit
Hyper-V calling convention doesn't use RAX as an input, so a flush with
VMware's magic value left in RAX must still be handled as a Hyper-V
hypercall instead of exiting to userspace.

Add hyperv_hypercall_rax() to issue a Hyper-V hypercall with a given
value in RAX, and enable the VMware flag again when hyperv_evmcs
restores its state into a new VM.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 .../selftests/kvm/include/x86/hyperv.h        | 21 +++++++++++++++
 .../testing/selftests/kvm/x86/hyperv_evmcs.c  | 27 +++++++++++++++----
 .../selftests/kvm/x86/hyperv_svm_test.c       | 21 ++++++++++-----
 3 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/hyperv.h b/tools/testing/selftests/kvm/include/x86/hyperv.h
index 78003f5a22f3..06d14be3c4ee 100644
--- a/tools/testing/selftests/kvm/include/x86/hyperv.h
+++ b/tools/testing/selftests/kvm/include/x86/hyperv.h
@@ -286,6 +286,27 @@ static inline void hyperv_hypercall(u64 control, gva_t input_address,
 	GUEST_ASSERT((hv_status & 0xffff) == 0);
 }
 
+/*
+ * Issue a Hyper-V hypercall with @rax in RAX, which the 64-bit calling
+ * convention doesn't use as an input, and assert that it succeeded.
+ */
+static inline void hyperv_hypercall_rax(u64 control, gva_t input_address,
+					gva_t output_address, u64 rax)
+{
+	u64 error_code;
+	u8 vector;
+
+	asm volatile("mov %[output_address], %%r8\n\t"
+		     KVM_ASM_SAFE("vmcall")
+		     : "+a" (rax), "+c" (control), "+d" (input_address),
+		       KVM_ASM_SAFE_OUTPUTS(vector, error_code)
+		     : [output_address] "r"(output_address)
+		     : "cc", "memory", "r8", KVM_ASM_SAFE_CLOBBERS);
+
+	GUEST_ASSERT(!vector);
+	GUEST_ASSERT((rax & 0xffff) == 0);
+}
+
 /* Write 'Fast' hypercall input 'data' to the first 'n_sse_regs' SSE regs */
 static inline void hyperv_write_xmm_input(void *data, int n_sse_regs)
 {
diff --git a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
index c81f2dd4f2a1..cdd4e523c62a 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
@@ -18,6 +18,8 @@
 #include "hyperv.h"
 #include "vmx.h"
 
+#define VMWARE_HYPERVISOR_MAGIC	0x564d5868
+
 static int ud_count;
 
 static void guest_ud_handler(struct ex_regs *regs)
@@ -63,9 +65,13 @@ void l2_guest_code(void)
 	vmcall();
 	rdmsr_from_l2(MSR_GS_BASE); /* intercepted */
 
-	/* L2 TLB flush tests */
-	hyperv_hypercall(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE | HV_HYPERCALL_FAST_BIT, 0x0,
-			 HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES | HV_FLUSH_ALL_PROCESSORS);
+	/*
+	 * L2 TLB flush tests.  Leave VMware's magic value in RAX to check that
+	 * VMware hypercall exits don't claim the flush that L0 handles.
+	 */
+	hyperv_hypercall_rax(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE | HV_HYPERCALL_FAST_BIT, 0x0,
+			     HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES | HV_FLUSH_ALL_PROCESSORS,
+			     VMWARE_HYPERVISOR_MAGIC);
 	rdmsr_from_l2(MSR_FS_BASE);
 	/*
 	 * Note: hypercall status (RAX) is not preserved correctly by L1 after
@@ -209,6 +215,13 @@ void inject_nmi(struct kvm_vcpu *vcpu)
 	vcpu_events_set(vcpu, &events);
 }
 
+static void vm_enable_vmware_hypercall(struct kvm_vm *vm)
+{
+	if (kvm_check_cap(KVM_CAP_X86_VMWARE) & KVM_VMWARE_ENABLE_HYPERCALL)
+		vm_enable_cap(vm, KVM_CAP_X86_VMWARE,
+			      KVM_VMWARE_ENABLE_HYPERCALL);
+}
+
 static struct kvm_vcpu *save_restore_vm(struct kvm_vm *vm,
 					struct kvm_vcpu *vcpu)
 {
@@ -222,7 +235,9 @@ static struct kvm_vcpu *save_restore_vm(struct kvm_vm *vm,
 	kvm_vm_release(vm);
 
 	/* Restore state in a new VM.  */
-	vcpu = vm_recreate_with_one_vcpu(vm);
+	kvm_vm_restart(vm);
+	vm_enable_vmware_hypercall(vm);
+	vcpu = vm_vcpu_recreate(vm, 0);
 	vcpu_set_hv_cpuid(vcpu);
 	vcpu_enable_evmcs(vcpu);
 	vcpu_load_state(vcpu, state);
@@ -251,7 +266,9 @@ int main(int argc, char *argv[])
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_HYPERV_ENLIGHTENED_VMCS));
 	TEST_REQUIRE(kvm_hv_cpu_has(HV_X64_NESTED_DIRECT_FLUSH));
 
-	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	vm = vm_create(1);
+	vm_enable_vmware_hypercall(vm);
+	vcpu = vm_vcpu_add(vm, 0, guest_code);
 
 	hcall_page = vm_alloc_pages(vm, 1);
 	memset(addr_gva2hva(vm, hcall_page), 0x0,  getpagesize());
diff --git a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
index 3a3dc31072e8..fe0762ae8260 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
@@ -18,6 +18,8 @@
 #include "svm_util.h"
 #include "hyperv.h"
 
+#define VMWARE_HYPERVISOR_MAGIC	0x564d5868
+
 /* Exit to L1 from L2 with RDMSR instruction */
 static inline void rdmsr_from_l2(u32 msr)
 {
@@ -44,11 +46,14 @@ void l2_guest_code(void)
 
 	GUEST_SYNC(5);
 
-	/* L2 TLB flush tests */
-	hyperv_hypercall(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE |
-			 HV_HYPERCALL_FAST_BIT, 0x0,
-			 HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES |
-			 HV_FLUSH_ALL_PROCESSORS);
+	/*
+	 * L2 TLB flush tests.  Leave VMware's magic value in RAX to check that
+	 * VMware hypercall exits don't claim the flush that L0 handles.
+	 */
+	hyperv_hypercall_rax(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE |
+			     HV_HYPERCALL_FAST_BIT, 0x0,
+			     HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES |
+			     HV_FLUSH_ALL_PROCESSORS, VMWARE_HYPERVISOR_MAGIC);
 	rdmsr_from_l2(MSR_FS_BASE);
 	/*
 	 * Note: hypercall status (RAX) is not preserved correctly by L1 after
@@ -156,7 +161,11 @@ int main(int argc, char *argv[])
 	TEST_REQUIRE(kvm_hv_cpu_has(HV_X64_NESTED_DIRECT_FLUSH));
 
 	/* Create VM */
-	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	vm = vm_create(1);
+	if (kvm_check_cap(KVM_CAP_X86_VMWARE) & KVM_VMWARE_ENABLE_HYPERCALL)
+		vm_enable_cap(vm, KVM_CAP_X86_VMWARE,
+			      KVM_VMWARE_ENABLE_HYPERCALL);
+	vcpu = vm_vcpu_add(vm, 0, guest_code);
 	vcpu_set_hv_cpuid(vcpu);
 	vcpu_alloc_svm(vm, &nested_gva);
 	vcpu_alloc_hyperv_test_pages(vm, &hv_pages_gva);
-- 
2.53.0

