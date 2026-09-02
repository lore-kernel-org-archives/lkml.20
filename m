Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99AC4AC16E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367310; cv=none; b=Gu1tdvKYE+az5iZfflu1UDWY75OGkW6hNKl+Z4l9YtJDRYoOkVZ8iZVvO6lmZUXaml5c48OEv4gT1Akpk/4n9558MKOr9hzEaFIzvIFKy2iWKPLC+56IqlN90/CMniJzkEWFNSwbqBaqnnNWIO1XrcBEzepzo4I2pkzoe+UF48M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367310; c=relaxed/simple;
	bh=IooTrDugbi730db2Qdv2j1/bfHJilOastYDRCxIfQLA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nHP4XFlDcuesjY6endiCoXZ7hW443riK9aFSMyd3q3l4dncmcMcryBsZTve38GIwBNyFj3Txg/Grvx24X8QhsGl1xByz7u3+jdjguxPalLqKyalqMYp6LeyuW3i4NKj04upbjjdpVWLbDKyu0CbWAFlnWazMGX9tqwYsx/ARMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=diK/u/Zs; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="diK/u/Zs"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-85f1f3620bcso52206b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367299; x=1788972099; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OWxwiZu3iI1BKMOXY9Ac60kPARcqOSTNs6vsc+7jhyU=;
        b=diK/u/Zs3uyVrLlcRq6ZjQRp/Qc+PJn9diy3VY0ZaFx2xroiiDWbkUEE4XVkcvg8sg
         BaqabkreKsHnYE291lDtUtoMLfMoiUPSSli/1Mq/olGer/sdBM5z39b3Ga/BFknnyHH/
         6UMj1tNgqrPB79CwjlvKxZKrSwQPz9BzoK4kTyTrzuxcX+w9Kfe6NhnfvtWzFFANVMzN
         0FvZLW3FE/q7roMKIWMT2xgof8famJO1AXaQbnaZdPACpHxcYgY5eieAu8lE+BVFn4Xu
         fkrLrpttQ7YErWMABcor0sgUvwu2eQB8GvzcX5D71yATpwSjJDukIwUi+7aGz7NL8M0F
         dCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367299; x=1788972099;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWxwiZu3iI1BKMOXY9Ac60kPARcqOSTNs6vsc+7jhyU=;
        b=djYpJRQEUQSxot85mLpZYZpHxGS0efiM6l+Y0e6A1iuUZsCRrC/FaG1ks/APsH3P2w
         bVfHHZiG9j+r+VMz4vHm4F3GBg7r/SNTL7RvbqwgAId++AsmMXlokO3dlpDOOfdUEuAr
         v2uEqgdHbOwkmNsENp7LVXmbOuHNbaIOfN8onIw2p9oHa0twy3Vf8WabpOukIldsu1bd
         UUf9/cq54l9mQjMGwO10lZgMjoC6Qqq1J8dItquxPdsnog3z2W3+FQnyELo8FpruOR2P
         zMUlK5ZU7tpz8pFNL7qJ1+DkTNNNlYK9WECGpjrn4iZAqTcO++k5u60BGnOBI7VjGdeZ
         3i4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgZ5ZfInNBVilAIlylNJW4fQ92z5IEFKIf9GrY7lS77xKHGd3kUvUkpHi2BxjtKWdJHpuycU+1Hemj0mk=@vger.kernel.org
X-Gm-Message-State: AFuF++lke6I9HFLiXZYrf+XSoF6nKppOZHoWRpNfap6V7nC8t4h4dnwP
	7QnFRZ3dQ2KYvYYnJALiozT6qd6emvDAjpkubu4jMwz+w3XZVlxmmsPR9AzEB3GxPynvzdmjkry
	K1cqnAA==
X-Received: from pfbbm14.prod.google.com ([2002:a05:6a00:320e:b0:84c:2e88:693d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d55:b0:84e:cd14:aeba
 with SMTP id d2e1a72fcca58-85ffbe960f2mr374778b3a.6.1788367298091; Wed, 02
 Sep 2026 09:41:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:14 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-12-seanjc@google.com>
Subject: [PATCH v2 11/20] KVM: selftests: Initialize vm->memslots[] with
 invalid memslots during creation
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Initialize vm->memslots[] with an invalid memslots value during very
initial VM creation so that failure to configure the core memory regions
generates an immediate assert instead of potential weirdness, e.g. if slot0
is coincidentally valid.  This will also allow hardening the region APIs to
guard overriding a region's memslot multiple times.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h  | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c      | 5 +++++
 tools/testing/selftests/kvm/lib/x86/processor.c | 5 ++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c56f342b16fd..304ef6af3268 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -33,6 +33,8 @@
 
 #define NSEC_PER_SEC 1000000000L
 
+#define KVM_INVALID_MEMSLOT UINT_MAX
+
 struct userspace_mem_region {
 	struct kvm_userspace_memory_region2 region;
 	struct sparsebit *unused_phy_pages;
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index ce0d8fba4624..56df5b1d9c79 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -288,6 +288,7 @@ __weak void vm_populate_gva_bitmap(struct kvm_vm *vm)
 struct kvm_vm *____vm_create(struct vm_shape shape)
 {
 	struct kvm_vm *vm;
+	int i;
 
 	vm = calloc(1, sizeof(*vm));
 	TEST_ASSERT(vm != NULL, "Insufficient Memory");
@@ -296,6 +297,8 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	vm->regions.gpa_tree = RB_ROOT;
 	vm->regions.hva_tree = RB_ROOT;
 	hash_init(vm->regions.slot_hash);
+	for (i = 0; i < NR_MEM_REGIONS; i++)
+		vm->memslots[i] = KVM_INVALID_MEMSLOT;
 
 	vm->mode = shape.mode;
 	vm->type = shape.type;
@@ -1190,6 +1193,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot)
 {
 	struct userspace_mem_region *region;
 
+	TEST_ASSERT(memslot != KVM_INVALID_MEMSLOT, "vm->memslots[] unpopulated?");
+
 	hash_for_each_possible(vm->regions.slot_hash, region, slot_node,
 			       memslot)
 		if (region->region.slot == memslot)
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index d31fa81ea075..ea5fa59888af 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -529,7 +529,10 @@ void tdp_identity_map_default_memslots(struct kvm_vm *vm)
 
 	/* Only memslot 0 is mapped here, ensure it's the only one being used */
 	for (s = 0; s < NR_MEM_REGIONS; s++)
-		TEST_ASSERT_EQ(vm->memslots[s], 0);
+		TEST_ASSERT(!vm->memslots[s] ||
+			    vm->memslots[s] == KVM_INVALID_MEMSLOT,
+			    "Unhandled memslot '%u' for type '%u'",
+			    vm->memslots[s], s);
 
 	i = (region->region.guest_phys_addr >> vm->page_shift) - 1;
 	last = i + (region->region.memory_size >> vm->page_shift);
-- 
2.55.0.966.g6673acef38-goog

