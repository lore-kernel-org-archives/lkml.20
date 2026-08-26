Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714A3B8D5C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785537; cv=none; b=GkTVZKhrf9heBwLeYYqhO2VD5O9KaTjkLPy8SNZ+XQYTfXpvAUQnNmDcRkNnRP4uQ30Kl1XdonPHV+4NLPxLkS0yjaJbUKNgpezvPW0H3sQ0+Ig3zTEDtATTOGnTslG9Os+l90ZldJpHalKj9wuB3+xd9T74eM61Xkn8gYRiLXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785537; c=relaxed/simple;
	bh=vGtFww1PuxppHfkNm4nZY6ebSxcqiYn2V+uIZxWhPY4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WOnz1Satcw3XV1u1Ncu0yLIhTornq2CSs6nYTllasdSuy9mdjoVx73Up2gBdm7cy+4bWEKYkJySHLlHtCYH40cw/wzGTRUclQp/P/5//SGR3tO8vdryS5EA/uztnk9wzYIlRylmVzdANJxsXSjtJabCOGr73dmS3chNYm8XOmfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P2l9HRCI; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P2l9HRCI"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso20151775ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785533; x=1788390333; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qrd3Eszpzuyl+ARXBwnNOR4mn5401Rmq7plszPl1Tnk=;
        b=P2l9HRCIZ49E5ouU/2RRSiJfPqozrJnMu7H7ShaVmQTq3r8ydTFeiD9+ed6AhlgVnT
         tSKBwUzBgVUgaAJ5jKw65PUL2ed/yuuj/XfgAbH/IspByC374bcCIdSO13QHSBV0Mv5e
         JNVxw6KKnNWcEjz2fNf0YHxEdAIPlie0xKkGAsPtBDbY2clTpjvUvunr2oe+q2ifNYw4
         VMC42ifJxK6cNG9GBPJGPP//Kwu8oiA3bVJkQE/TU7P5kMH6kcMbYZ+v7ca2wWO1UjmB
         Kz/iEnSHwy2aTylsqFQD1D1CN4T7R59tx0btAJDTKDoz1w1MLjtIJbEeddlVB9AIB3L6
         eRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785533; x=1788390333;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qrd3Eszpzuyl+ARXBwnNOR4mn5401Rmq7plszPl1Tnk=;
        b=D7nJtTECh4ojEosKHmzpYnsuXGVVRKLs0VJXeDFfwSMuobFu2+5y2RND5dkWKy1Icf
         2Y/1YqBP0tWgJvtVvJM5qs46uzwU7W+dbID8i1FF4yUPb8vO4nvI3Wjh6mewneuYDrqQ
         1R/pBmb3czsE20VeRw9Gmu4zeQwfPPb2KPGJif+v1A5WWiUWqsfdlTnhn+I/a2LTJQ4a
         YF0SbaNhbODvJ2+Sqsmc+CZLpegGWBxnYRS6helQIDDVz7GYcL3sfoaQbZhycEns7oGy
         fDD9ZnH03WOx1rfBo8mjpg1wDftcvI6uEuDU52efyZDklriu+BGB++fIm2JQqHvn21IV
         UfcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGDu0gGtRPrtq7/ncYXf8tO/Q0JI/zU4eifeI40I+Zs3QfS7xgSY17R58eU9pyQySlk+pdhGO2Ljn6bHU=@vger.kernel.org
X-Gm-Message-State: AFuF++lvMOfj8QjdYdy0Yx5QwXZQZPgma5fv5z9KYxndeefILNVMpVQZ
	rgBgUheEUFlSPJgJ23TZeKlb5s9pes90uob614oxBwSAYoZqtAeTueQtoBmPZ3g+L/cObClswKc
	cS8JY5g==
X-Received: from plfn5.prod.google.com ([2002:a17:902:e545:b0:2cc:fd6e:8ff3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32c9:b0:2c9:df1b:e948
 with SMTP id d9443c01a7336-2d7079eb7e9mr183803125ad.4.1787785532402; Wed, 26
 Aug 2026 16:05:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:04 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-14-seanjc@google.com>
Subject: [PATCH 13/20] KVM: selftests: Add TEST_EXTRA memory region type for
 "special" memslots
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

And another memory region type to deal with extra, one-off memory regions,
and use the new type to manage x86's SMRAM memslot, as another step towards
taking the region type instead of the raw memslot in the physical page
allocator APIs.

Alternatively, SMRAM setup could simply use the quad-underscore API to
continue passing in the memslot, but a surprising number of tests use an
"extra" memslot for a variety of reasons.  I.e. allocating memory from one
(and exactly one) extra memslot isn't all that rare, and so should be
treated as normal behavior, not as something extraordinary, as
quad-underscore functions typically suggest.

Opportunistically add comments to document the intended usage of the types,
as the difference between DATA, TEST_DATA, and TEST_EXTRA in particular
isn't exactly obvious.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 37 ++++++++++++++++---
 tools/testing/selftests/kvm/include/x86/smm.h |  2 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  7 ++--
 3 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 14f87c8a00ec..f4f4f360a10b 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -82,11 +82,43 @@ struct userspace_mem_regions {
 	DECLARE_HASHTABLE(slot_hash, 9);
 };
 
+/*
+ * Memory region types are passed to various page allocators to communicate
+ * various properties and metadata related to the allocation.  Note, the
+ * descriptions below described the primary usage of each type.  Individual
+ * tests may allocate memory for other purposes.
+ *
+ * By default, all regions are mapped to memslot '0'.  Tests can override the
+ * memslot for any or all types, e.g. so that all test data is allocated from a
+ * curated memslot.
+ */
 enum kvm_mem_region_type {
+	/*
+	 * The CODE region is used by lib/elf when loading the test's code into
+	 * guest memory.
+	 */
 	MEM_REGION_CODE,
+	/*
+	 * The DATA region is used to allocate core data structures, e.g. vCPU
+	 * stacks, VM exception tables, x86's TSS, etc.
+	 */
 	MEM_REGION_DATA,
+	/*
+	 * The PT region, a.k.a. Page Table region, is used to allocate page
+	 * table pages.
+	 */
 	MEM_REGION_PT,
+	/*
+	 * The TEST_DATA region is used for allocating test data that is either
+	 * test specific, and/or isn't considered a "core" data structure.
+	 */
 	MEM_REGION_TEST_DATA,
+	/*
+	 * The TEST_EXTRA region is for special snowflakes, where a test wants
+	 * to create and use a one-off memslot, without impacting "normal" test
+	 * data allocations.
+	 */
+	MEM_REGION_TEST_EXTRA,
 	NR_MEM_REGIONS,
 };
 
@@ -129,11 +161,6 @@ struct kvm_vm {
 
 	struct kvm_binary_stats stats;
 
-	/*
-	 * KVM region slots. These are the default memslots used by page
-	 * allocators, e.g., lib/elf uses the memslots[MEM_REGION_CODE]
-	 * memslot.
-	 */
 	u32 memslots[NR_MEM_REGIONS];
 };
 
diff --git a/tools/testing/selftests/kvm/include/x86/smm.h b/tools/testing/selftests/kvm/include/x86/smm.h
index 2d1afa09819b..15faaa060126 100644
--- a/tools/testing/selftests/kvm/include/x86/smm.h
+++ b/tools/testing/selftests/kvm/include/x86/smm.h
@@ -8,7 +8,7 @@
 #define SMRAM_MEMSLOT	((1 << 16) | 1)
 #define SMRAM_PAGES	(SMRAM_SIZE / PAGE_SIZE)
 
-void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
+void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 		 const void *smi_handler, size_t handler_size);
 
 void inject_smi(struct kvm_vcpu *vcpu);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index ea5fa59888af..b988eea373ad 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1468,11 +1468,12 @@ bool kvm_arch_has_default_irqchip(void)
 	return true;
 }
 
-void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
+void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 		 const void *smi_handler, size_t handler_size)
 {
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, smram_gpa,
-				    SMRAM_MEMSLOT, SMRAM_PAGES, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       smram_gpa, SMRAM_MEMSLOT, SMRAM_PAGES);
+
 	TEST_ASSERT(vm_phy_pages_alloc(vm, SMRAM_PAGES, smram_gpa,
 				       SMRAM_MEMSLOT) == smram_gpa,
 		    "Could not allocate guest physical addresses for SMRAM");
-- 
2.55.0.887.g758fc8c411-goog

