Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37A53D6CCF
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785535; cv=none; b=XwYHGchzD2t8Jmct8u6DedPcZRY/r/n5XN/0/88WOJH36bJ3IWbo05hmHvDQBNyVWEOpO9plSXKqRPjb1QkG9uGm037nTnxMX87uw03dKccHJvBhD9EzphYSpFt6spH4PUIJtIyoAByCi9Tdh9nlkN6Eerq0Hdj4jM5rwaqp90A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785535; c=relaxed/simple;
	bh=av5yiCSKVQdtOhgHMWl7iQdf1C3zvreKT5M9Cp0nLIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cnqjCTOeJZkoQ6ZwGsZl7HQatGJHd+aR2W0KNcrFsZIawkDJOQb8pdTgEOvYuLXlKwjSJiwAy/wnkFE73iO9pbpoUTor7h5xySCEW1auOaXpnNe9uAfHOria7tPkEC0dlSG/KFJLjSJXOdjywwIteH4VVO22bdGDpGP+eBxXJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mmpUCcqe; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mmpUCcqe"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-855315ccb64so26954b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785532; x=1788390332; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cv4l6DetpbfnxZzj2chSUH1uUtI9CMqirdy2q6HV2z0=;
        b=mmpUCcqeOXTBHIgqdhAZZgOJmF/QL7qKTnYw3TrLunxDFxFMT917mgLyh5ICyyhlsL
         9YywEzw5yz3AAAlbgthvfpfh4tCzMSnSHPknLNJfKD7/xPVBrjRiPbKQoROEMLlx56kh
         oZkMzaY4cjY1W65prRIBdq1NBRA6V4iOZxy0XFpKaugFI570tNog2zZzg0BXpvXB2E3f
         HMp3nzhjSHQ8fCeISIEGICFMaWCsrU8IVhCpgjC5+Bnzi62dKL/O9c0+3jZGEq0Nbzga
         slzqBVQurhHIMAOMuQCDK+ictwO1uzr2V67PHuqctbMumzen3emDw83hNILkr011ghSj
         rY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785532; x=1788390332;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cv4l6DetpbfnxZzj2chSUH1uUtI9CMqirdy2q6HV2z0=;
        b=Jeog8hbxFwHeZCQ0rpsZkCAUy5qQAC4veKc1XXwExO9cQpbB3F1RwKiTk8IxxCfQbf
         zlg/j2FzQV0bcWII5deNM+cBHnFsS2KCrh65e0iTA2TVpfY/2JDgw4ttXGU2ZtFOOFKs
         Q91ISwDf5DBnNGln3eixwrlJHpW1HnTW/IKdbRZSr9Z/ewQ5QHblI5+lG3OheLsTISTg
         aCEdQxCKnBSEpEVSw7RHk2ntj2++IBhZy1T2yELpt8MOdHINdgrA53dYU+VrzJr/4dIg
         2NXNi6Nt+ulEBzpWhN4j0iG1aWRgRrRalVlM2B8Im+tCtAzn3gxnC2cAIXGE0YQVSB9y
         XDfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqC+F67YzaNVPYzvGShHAQNjZtKUMggTuJRkQTQ/EfsrW0GXBKOSH9pCDESpAMynb/QUJjfs0waizKKsiw=@vger.kernel.org
X-Gm-Message-State: AFuF++m88cwUnVm57NbOgd68UzCdVJuiHssj4JUmYY1wBasPJkhsAkOo
	XEuS90M9UveiJynCQU5yKxiJgx1G3lBip6G7aZH4RW0LSw6BlBZN2M5A3wbCJvd6glNlmj1ihTX
	9CBXOiw==
X-Received: from pgcq30.prod.google.com ([2002:a63:751e:0:b0:cc1:c78b:a2fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3086:b0:3c0:eeb7:28b
 with SMTP id adf61e73a8af0-3cf762865f1mr18455761637.8.1787785531152; Wed, 26
 Aug 2026 16:05:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:03 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-13-seanjc@google.com>
Subject: [PATCH 12/20] KVM: selftests: Add APIs to override memory region
 types with custom memslots
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Add and use APIs to override memory region types instead of open coding the
logic in tests, partly to dedup test code, but mostly to add some amount of
protection against conflicting overrides.  This will allow converting more
tests to override memory regions without taking on too much risk of bugs in
the long term, e.g. due to silently overriding a region multiple times.

Deliberately "unroll" the loops in __vm_create() and the CMMA test's
create_main_memslot() to avoid filling all memslots in anticipation of
adding an "extra" memslot that is for test use and *only* test use, i.e.
shouldn't be configured by core library code.

Converting tests to overriding memory regions will allow taking the region
type instead of the raw memslot in the physical page allocator APIs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/arm64/page_fault_test.c     | 18 +++++------
 .../testing/selftests/kvm/include/kvm_util.h  | 30 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  8 +++--
 tools/testing/selftests/kvm/s390/cmma_test.c  | 19 ++++--------
 4 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/page_fault_test.c b/tools/testing/selftests/kvm/arm64/page_fault_test.c
index 6bb3d82906b2..b0e3fc8cd76a 100644
--- a/tools/testing/selftests/kvm/arm64/page_fault_test.c
+++ b/tools/testing/selftests/kvm/arm64/page_fault_test.c
@@ -597,18 +597,16 @@ static void setup_memslots(struct kvm_vm *vm, struct test_params *p)
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0,
 				    CODE_AND_DATA_MEMSLOT, code_npages, 0);
-	vm->memslots[MEM_REGION_CODE] = CODE_AND_DATA_MEMSLOT;
-	vm->memslots[MEM_REGION_DATA] = CODE_AND_DATA_MEMSLOT;
+	____vm_override_mem_region(vm, MEM_REGION_CODE, CODE_AND_DATA_MEMSLOT);
+	____vm_override_mem_region(vm, MEM_REGION_DATA, CODE_AND_DATA_MEMSLOT);
 
-	vm_userspace_mem_region_add(vm, p->src_type, data_gpa - pt_size,
-				    PAGE_TABLE_MEMSLOT, pt_size / guest_page_size,
-				    p->test_desc->pt_memslot_flags);
-	vm->memslots[MEM_REGION_PT] = PAGE_TABLE_MEMSLOT;
+	__vm_override_mem_region(vm, MEM_REGION_PT, p->src_type, data_gpa - pt_size,
+				 PAGE_TABLE_MEMSLOT, pt_size / guest_page_size,
+				 p->test_desc->pt_memslot_flags);
 
-	vm_userspace_mem_region_add(vm, p->src_type, data_gpa, TEST_DATA_MEMSLOT,
-				    data_size / guest_page_size,
-				    p->test_desc->data_memslot_flags);
-	vm->memslots[MEM_REGION_TEST_DATA] = TEST_DATA_MEMSLOT;
+	__vm_override_mem_region(vm, MEM_REGION_TEST_DATA, p->src_type, data_gpa,
+				 TEST_DATA_MEMSLOT, data_size / guest_page_size,
+				 p->test_desc->data_memslot_flags);
 }
 
 static void setup_ucall(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 70e77992dd2f..14f87c8a00ec 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -704,6 +704,36 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		gpa_t gpa, u32 slot, u64 npages, u32 flags,
 		int guest_memfd_fd, u64 guest_memfd_offset);
 
+
+static inline void ____vm_override_mem_region(struct kvm_vm *vm,
+					      enum kvm_mem_region_type type,
+					      u32 slot)
+{
+	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
+		    "Memory region type '%u' was already overridden with slot=%u",
+		    type, vm->memslots[type]);
+
+	vm->memslots[type] = slot;
+}
+
+static inline void __vm_override_mem_region(struct kvm_vm *vm,
+					    enum kvm_mem_region_type type,
+					    enum vm_mem_backing_src_type src_type,
+					    gpa_t gpa, u32 slot, u64 npages,
+					    u32 flags)
+{
+	____vm_override_mem_region(vm, type, slot);
+	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
+}
+
+static inline void vm_override_mem_region(struct kvm_vm *vm,
+					  enum kvm_mem_region_type type,
+					  enum vm_mem_backing_src_type src_type,
+					  gpa_t gpa, u32 slot, u64 npages)
+{
+	__vm_override_mem_region(vm, type, src_type, gpa, slot, npages, 0);
+}
+
 #ifndef vm_arch_has_protected_memory
 static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
 {
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 56df5b1d9c79..781af2928d04 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -495,7 +495,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 						 nr_extra_pages);
 	struct userspace_mem_region *slot0;
 	struct kvm_vm *vm;
-	int i, flags;
+	int flags;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
 
@@ -513,8 +513,10 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 		flags |= KVM_MEM_GUEST_MEMFD;
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
-	for (i = 0; i < NR_MEM_REGIONS; i++)
-		vm->memslots[i] = 0;
+	____vm_override_mem_region(vm, MEM_REGION_CODE, 0);
+	____vm_override_mem_region(vm, MEM_REGION_PT, 0);
+	____vm_override_mem_region(vm, MEM_REGION_DATA, 0);
+	____vm_override_mem_region(vm, MEM_REGION_TEST_DATA, 0);
 
 	kvm_vm_elf_load(vm, program_invocation_name);
 
diff --git a/tools/testing/selftests/kvm/s390/cmma_test.c b/tools/testing/selftests/kvm/s390/cmma_test.c
index 15d81b2ed7ad..73387cc3bca7 100644
--- a/tools/testing/selftests/kvm/s390/cmma_test.c
+++ b/tools/testing/selftests/kvm/s390/cmma_test.c
@@ -102,24 +102,17 @@ static void guest_dirty_test_data(void)
 
 static void create_main_memslot(struct kvm_vm *vm)
 {
-	int i;
-
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, MAIN_PAGE_COUNT, 0);
-	/* set the array of memslots to zero like __vm_create does */
-	for (i = 0; i < NR_MEM_REGIONS; i++)
-		vm->memslots[i] = 0;
+	____vm_override_mem_region(vm, MEM_REGION_CODE, 0);
+	____vm_override_mem_region(vm, MEM_REGION_PT, 0);
+	____vm_override_mem_region(vm, MEM_REGION_DATA, 0);
 }
 
 static void create_test_memslot(struct kvm_vm *vm)
 {
-	vm_userspace_mem_region_add(vm,
-				    VM_MEM_SRC_ANONYMOUS,
-				    TEST_DATA_START_GFN << vm->page_shift,
-				    TEST_DATA_MEMSLOT,
-				    TEST_DATA_PAGE_COUNT,
-				    0
-				   );
-	vm->memslots[MEM_REGION_TEST_DATA] = TEST_DATA_MEMSLOT;
+	vm_override_mem_region(vm, MEM_REGION_TEST_DATA, VM_MEM_SRC_ANONYMOUS,
+			       TEST_DATA_START_GFN << vm->page_shift,
+			       TEST_DATA_MEMSLOT, TEST_DATA_PAGE_COUNT);
 }
 
 static void create_memslots(struct kvm_vm *vm)
-- 
2.55.0.887.g758fc8c411-goog

