Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922455;
	b=hMV0AjrIrlqpoL3VWnYjYTY34ZP5qFrnUZbKOmTJ35gRQqF5aO9/sJRJky2P+9dUN0Io
	 UwN+AqTktIxoE9CtREUug6S6WO/OyKJzeNS7RNGcL1shjPvVSjv/yBvDpN99P0cxVAwCB
	 7neGpYoDsIkqJR95slTeoc0DoTF2HCqa3ivwkJxtodVoBikpsJhc3i/jNxQr7tbZcOhC4
	 SZcu7RIaVuPxPTY4vIhYnRzn2moTe/VZs6Yf+akDJoCwRPBZB6fwKBCWkuRhGgVQhlDQf
	 CUnrPpePgjSE4TlpGCwED3VP+WdNUf2heEt9zaLxDZTBKRhs7+3c9Wq9u6tZUcHdwow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Cy0yloIasHhZ8V5YMjEjaDx2yExh1SKL7/bMbgtrdRI=;
	b=ICNs1pwFEMHiechEe5yajqXAsMcfrzfpA3oYkwqiuPC46mJqdZKBYAI5TmpY5x7vX/ZI
	 Iz4ddrp1UbwcJGYCz5Pc/J0JYI36Tpg7P3RqMbWg+Zta6tq6RhNUx7qWKtk2yJN420o+C
	 FTdgIijCZ9fxXlFU0h8+a+JOWeWojsJM/QVL1YMcXwCuua0abLIuYWb5qTyIYZtbOq4Vr
	 rBjOToTpL607aBtoZRtax53BTchk359egppVtxVQQHMPhMPzm/cQHANbjnPT7+iPt02rH
	 cqkjMJZ4IvtsByryo39THESWSp5bDqcJApN44HqVgFBBaP1oWb2ShZsBtI4bB3iquVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=REK2cYAK;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFD9606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAFD9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=REK2cYAK
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so89747a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922454; x=1794527254; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cy0yloIasHhZ8V5YMjEjaDx2yExh1SKL7/bMbgtrdRI=;
        b=REK2cYAKdjARdLAeearYj5H33i0tXSQGELoE2NngqbJsatb56+VX0b0LSwdNlwlOP/
         x2E3PXEtR/xxJgZG7R9Mbrqlsmp+2ky9CIYJ9YIOGrqYZ/zb44cmpug4Lw1dniWNeDv9
         0Ex2K944Z3oRcp5XgIehxCJeYzyWjLMRPmTQgy8kZn6eHNpD+RjPu0jXHAZ9zk5fsPVc
         HGNXoYziqkqI6COxmntN3ns42ath4TEKmKlSuTyBU9OxI4orqDIfnBWtjYnI7kruWp51
         /KnRYTunyJjsbvzI7GPIBZu1KqS26aLveC0K4qa8XecLl+bnd32tr9Q++WHFsgGdNMH1
         3TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922454; x=1794527254;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cy0yloIasHhZ8V5YMjEjaDx2yExh1SKL7/bMbgtrdRI=;
        b=2iLVhoKPTCiPg/syIFlM5NKzTV9O6pcoP47VzSMSqDpuAILoUcHk4snjcJFprF7g96
         fm9fVcDVe+t7WTSOivVymLe1LazMLSJxP4INilwdl/ojQEeYv3H2Bky3D6ygzo2+ctFi
         vLrvLbnDl/uYnhdKjNQrnApjCHXouBUefmeFskkrIKx0qEGLMq/nTw1mDuBtmix0J/9P
         LujWDcnD3O+KYpHntNyT8O8zJ3myAUCj4cRC1SF+GJx+I/XgRPEmYVq1UOLCFlrA9jnd
         HU1jkHBRL22ZWFKQXc3hQoyiEb+HGS3XjmZK93y+POIrIGr4NQACyBkgey4HajL6C2VC
         LnLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu+IivPli402Q/P9mhxeongihW8F9H/hl387SLNyhiQroLjvh4xE99zmgT4po5qslFrrRpQOo79BYL9rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yddd5h4a1dICQFs4m5yMRTz+zvkQXAMeTrB9+yJpr72WDsmCi
	R8TNfBKsk3ayeGDNLP55rTg7y083zBZ3QUxkc5T/MyBgDRg1AQrWEGGj3771BBskKWuhZtAShFZ
	mV8DVag==
X-Received: from pjbob17.prod.google.com ([2002:a17:90b:3911:b0:3ad:99d8:e894])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c08:b0:3ac:86a0:5766
 with SMTP id 98e67ed59e1d1-3b0db70162fmr659425a91.63.1793922453910; Thu, 05
 Nov 2026 15:47:33 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:45 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=10128;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=odEOSIeeAUbQBz6ZJoMdu4c41askoUP/8p41w39xNGk=; b=vV6LB+ANiipxiNsajQ94VdvmZ9iO1zReo9EaLlcMeDFFIwRzWffK/G0A3SiADY0fE7ruZ87Sy
 +QKGvUq+ANhCqrpznVAk121cycjm+d/1Sbs7dGTUqWREZ9LIgMoNyw9
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-1-2024e8fa517a@google.com>
Subject: [PATCH v16 01/20] KVM: selftests: Add macros to simplify creating VM
 shapes for non-default types
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Add VM_TYPE() and __VM_SHAPE() macros to create a vm_shape structure given
a type (and mode), and use the macros to define VM_SHAPE_{SEV,SEV_ES,SNP}
shapes for x86's SEV family of VM shapes.  Providing common infrastructure
will avoid having to copy+paste vm_sev_create_with_one_vcpu() for TDX.

Use the new SEV+ shapes and drop vm_sev_create_with_one_vcpu().

Opportunistically move the existing VM_SHAPE() (now __VM_SHAPE()) macro
below the definitions of VM_MODE_DEFAULT so that all of the SHAPE/TYPE
macros are bundled together.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h     | 27 ++++++++-------
 .../testing/selftests/kvm/include/x86/processor.h  |  4 +++
 tools/testing/selftests/kvm/include/x86/sev.h      |  2 --
 tools/testing/selftests/kvm/lib/x86/sev.c          | 16 ---------
 tools/testing/selftests/kvm/x86/sev_dbg_test.c     | 13 ++++---
 tools/testing/selftests/kvm/x86/sev_smoke_test.c   | 40 +++++++++++-----------
 6 files changed, 45 insertions(+), 57 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index e2618877619e..20358e4bf119 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -257,18 +257,6 @@ struct vm_shape {
 
 kvm_static_assert(sizeof(struct vm_shape) == sizeof(u64));
 
-#define VM_TYPE_DEFAULT			0
-
-#define VM_SHAPE(__mode)			\
-({						\
-	struct vm_shape shape = {		\
-		.mode = (__mode),		\
-		.type = VM_TYPE_DEFAULT		\
-	};					\
-						\
-	shape;					\
-})
-
 extern enum vm_guest_mode vm_mode_default;
 
 #if defined(__aarch64__)
@@ -312,8 +300,23 @@ extern enum vm_guest_mode vm_mode_default;
 
 #endif
 
+#define VM_TYPE_DEFAULT			0
+
+#define __VM_SHAPE(__mode, __type)		\
+({						\
+	struct vm_shape shape = {		\
+		.mode = (__mode),		\
+		.type = (__type),		\
+	};					\
+						\
+	shape;					\
+})
+
+#define VM_SHAPE(__mode)	__VM_SHAPE(__mode, VM_TYPE_DEFAULT)
 #define VM_SHAPE_DEFAULT	VM_SHAPE(VM_MODE_DEFAULT)
 
+#define VM_TYPE(__type)		__VM_SHAPE(VM_MODE_DEFAULT, __type)
+
 #define MIN_PAGE_SIZE		(1U << MIN_PAGE_SHIFT)
 #define PTES_PER_MIN_PAGE	ptes_per_page(MIN_PAGE_SIZE)
 
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 5898a277a2e0..3e88a413fb1e 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -389,6 +389,10 @@ static inline unsigned int x86_model(unsigned int eax)
 	return ((eax >> 12) & 0xf0) | ((eax >> 4) & 0x0f);
 }
 
+#define VM_SHAPE_SEV		VM_TYPE(KVM_X86_SEV_VM)
+#define VM_SHAPE_SEV_ES		VM_TYPE(KVM_X86_SEV_ES_VM)
+#define VM_SHAPE_SNP		VM_TYPE(KVM_X86_SNP_VM)
+
 #define PHYSICAL_PAGE_MASK      GENMASK_ULL(51, 12)
 
 #define PAGE_SHIFT		12
diff --git a/tools/testing/selftests/kvm/include/x86/sev.h b/tools/testing/selftests/kvm/include/x86/sev.h
index dec383e59a47..eb4ab573febf 100644
--- a/tools/testing/selftests/kvm/include/x86/sev.h
+++ b/tools/testing/selftests/kvm/include/x86/sev.h
@@ -53,8 +53,6 @@ void snp_vm_launch_start(struct kvm_vm *vm, u64 policy);
 void snp_vm_launch_update(struct kvm_vm *vm);
 void snp_vm_launch_finish(struct kvm_vm *vm);
 
-struct kvm_vm *vm_sev_create_with_one_vcpu(u32 type, void *guest_code,
-					   struct kvm_vcpu **cpu);
 void vm_sev_launch(struct kvm_vm *vm, u64 policy, u8 *measurement);
 
 kvm_static_assert(SEV_RET_SUCCESS == 0);
diff --git a/tools/testing/selftests/kvm/lib/x86/sev.c b/tools/testing/selftests/kvm/lib/x86/sev.c
index 93f916903461..95d8520eea34 100644
--- a/tools/testing/selftests/kvm/lib/x86/sev.c
+++ b/tools/testing/selftests/kvm/lib/x86/sev.c
@@ -158,22 +158,6 @@ void snp_vm_launch_finish(struct kvm_vm *vm)
 	vm_sev_ioctl(vm, KVM_SEV_SNP_LAUNCH_FINISH, &launch_finish);
 }
 
-struct kvm_vm *vm_sev_create_with_one_vcpu(u32 type, void *guest_code,
-					   struct kvm_vcpu **cpu)
-{
-	struct vm_shape shape = {
-		.mode = VM_MODE_DEFAULT,
-		.type = type,
-	};
-	struct kvm_vm *vm;
-	struct kvm_vcpu *cpus[1];
-
-	vm = __vm_create_with_vcpus(shape, 1, 0, guest_code, cpus);
-	*cpu = cpus[0];
-
-	return vm;
-}
-
 void vm_sev_launch(struct kvm_vm *vm, u64 policy, u8 *measurement)
 {
 	if (is_sev_snp_vm(vm)) {
diff --git a/tools/testing/selftests/kvm/x86/sev_dbg_test.c b/tools/testing/selftests/kvm/x86/sev_dbg_test.c
index 0277e38e3556..d017aa22277b 100644
--- a/tools/testing/selftests/kvm/x86/sev_dbg_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_dbg_test.c
@@ -72,17 +72,14 @@ static void __test_sev_dbg(struct kvm_vm *vm, int nr_bytes)
 	}
 }
 
-static void test_sev_dbg(u32 type, u64 policy)
+static void test_sev_dbg(struct vm_shape shape, u64 policy)
 {
 	int sizes[] = { 1, 8, 15, 16, 17, 32, 33 };
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	int i;
 
-	if (!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(type)))
-		return;
-
-	vm = vm_sev_create_with_one_vcpu(type, NULL, &vcpu);
+	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, NULL);
 
 	data = addr_gva2hva(vm, vm_alloc(vm, BUFFER_SIZE, KVM_UTIL_MIN_VADDR));
 	memset(data, 0xaa, BUFFER_SIZE);
@@ -114,7 +111,9 @@ int main(int argc, char *argv[])
 	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));
 
 	/* Note, KVM doesn't support {de,en}crypt commands for SNP. */
-	test_sev_dbg(KVM_X86_SEV_VM, 0);
-	test_sev_dbg(KVM_X86_SEV_ES_VM, SEV_POLICY_ES);
+	if (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SEV_VM))
+		test_sev_dbg(VM_SHAPE_SEV, 0);
+	if (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SEV_ES_VM))
+		test_sev_dbg(VM_SHAPE_SEV_ES, SEV_POLICY_ES);
 	return 0;
 }
diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
index 19f76f7d8ca6..584c6e5b15a0 100644
--- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
@@ -104,7 +104,7 @@ static void compare_xsave(u8 *from_host, u8 *from_guest)
 		abort();
 }
 
-static void test_sync_vmsa(u32 type, u64 policy)
+static void test_sync_vmsa(struct vm_shape shape, u64 policy)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
@@ -114,7 +114,7 @@ static void test_sync_vmsa(u32 type, u64 policy)
 	double x87val = M_PI;
 	struct kvm_xsave __attribute__((aligned(64))) xsave = { 0 };
 
-	vm = vm_sev_create_with_one_vcpu(type, guest_code_xsave, &vcpu);
+	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code_xsave);
 	gva = vm_alloc_shared(vm, PAGE_SIZE, KVM_UTIL_MIN_VADDR,
 			      MEM_REGION_TEST_DATA);
 	hva = addr_gva2hva(vm, gva);
@@ -150,13 +150,13 @@ static void test_sync_vmsa(u32 type, u64 policy)
 	kvm_vm_free(vm);
 }
 
-static void test_sev(void *guest_code, u32 type, u64 policy)
+static void test_sev(void *guest_code, struct vm_shape shape, u64 policy)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
 
-	vm = vm_sev_create_with_one_vcpu(type, guest_code, &vcpu);
+	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_code);
 
 	/* TODO: Validate the measurement is as expected. */
 	vm_sev_launch(vm, policy, NULL);
@@ -202,12 +202,12 @@ static void guest_shutdown_code(void)
 	__asm__ __volatile__("ud2");
 }
 
-static void test_sev_shutdown(u32 type, u64 policy)
+static void test_sev_shutdown(struct vm_shape shape, u64 policy)
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 
-	vm = vm_sev_create_with_one_vcpu(type, guest_shutdown_code, &vcpu);
+	vm = vm_create_shape_with_one_vcpu(shape, &vcpu, guest_shutdown_code);
 
 	vm_sev_launch(vm, policy, NULL);
 
@@ -219,28 +219,28 @@ static void test_sev_shutdown(u32 type, u64 policy)
 	kvm_vm_free(vm);
 }
 
-static void test_sev_smoke(void *guest, u32 type, u64 policy)
+static void test_sev_smoke(void *guest, struct vm_shape shape, u64 policy)
 {
 	const u64 xf_mask = XFEATURE_MASK_X87_AVX;
 
-	if (type == KVM_X86_SNP_VM)
-		test_sev(guest, type, policy | SNP_POLICY_DBG);
+	if (shape.type == KVM_X86_SNP_VM)
+		test_sev(guest, shape, policy | SNP_POLICY_DBG);
 	else
-		test_sev(guest, type, policy | SEV_POLICY_NO_DBG);
-	test_sev(guest, type, policy);
+		test_sev(guest, shape, policy | SEV_POLICY_NO_DBG);
+	test_sev(guest, shape, policy);
 
-	if (type == KVM_X86_SEV_VM)
+	if (shape.type == KVM_X86_SEV_VM)
 		return;
 
-	test_sev_shutdown(type, policy);
+	test_sev_shutdown(shape, policy);
 
 	if (kvm_has_cap(KVM_CAP_XCRS) &&
 	    (xgetbv(0) & kvm_cpu_supported_xcr0() & xf_mask) == xf_mask) {
-		test_sync_vmsa(type, policy);
-		if (type == KVM_X86_SNP_VM)
-			test_sync_vmsa(type, policy | SNP_POLICY_DBG);
+		test_sync_vmsa(shape, policy);
+		if (shape.type == KVM_X86_SNP_VM)
+			test_sync_vmsa(shape, policy | SNP_POLICY_DBG);
 		else
-			test_sync_vmsa(type, policy | SEV_POLICY_NO_DBG);
+			test_sync_vmsa(shape, policy | SEV_POLICY_NO_DBG);
 	}
 }
 
@@ -255,13 +255,13 @@ int main(int argc, char *argv[])
 	 * though X86_FEATURE_SEV is set.  Gate every type on KVM_CAP_VM_TYPES.
 	 */
 	if (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SEV_VM))
-		test_sev_smoke(guest_sev_code, KVM_X86_SEV_VM, 0);
+		test_sev_smoke(guest_sev_code, VM_SHAPE_SEV, 0);
 
 	if (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SEV_ES_VM))
-		test_sev_smoke(guest_sev_es_code, KVM_X86_SEV_ES_VM, SEV_POLICY_ES);
+		test_sev_smoke(guest_sev_es_code, VM_SHAPE_SEV_ES, SEV_POLICY_ES);
 
 	if (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SNP_VM))
-		test_sev_smoke(guest_snp_code, KVM_X86_SNP_VM, snp_default_policy());
+		test_sev_smoke(guest_snp_code, VM_SHAPE_SNP, snp_default_policy());
 
 	return 0;
 }

-- 
2.56.0.455.g6c5a503b38-goog

