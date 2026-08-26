Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9686F3C1970
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785531; cv=none; b=o+hedULVr6Pvkza5Ks9dvNlPtlH31zFOTEAMZGKelUJ4leTR8NIc1ETlhpiyGZ/A4GSpje7lvHKs/FXBXxX+vwbSATUab7uOkHn8IjvX828dSNaQ/pjqXUfLMO6iPw+SJWNLOoSGI8QWwDzXZqAarxT1ytneewndAg27adnlieM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785531; c=relaxed/simple;
	bh=huIHcszqZLipHy5mZfQG8RPYZOue7MV8WgHvk308HPs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DI/Zq1OhMYf7nADU4nEOyUabx96AFqET0fu+i4U+rZ9awUA2IJUA4fW6wprcK8VHRNa4/KY+lPRAn/z4iLYgFaeoKwANLooOqO5vtmGkE1UtYq6en1uHkWfcrE07PrSuM/weNNyqzwxwQdcsjDKhoH4D9OQrGSFFVrdprprEhA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tVOe7SHP; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tVOe7SHP"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso302162a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785529; x=1788390329; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GZ4MVTLP0goD2ecS0YI5oUFT+iv0vlU/KAAezn2Wgnw=;
        b=tVOe7SHP37etwWpHoYSQhknn14vXHJyY646AToTqEEgioVdJawL7xdGtzd0xxdlazA
         9ENTXzU2a+CKDf3r8vja/Wi037mUl8YKEtEr/izpXqpHhPsiGvpNSOA/1MDupEpCgsWK
         hMA9kJ4C7mWgdKH5c0k0FnMlXhpbMNMA5aPf4dSLk5IcUDaZhwQle8Qkv2kckSxXfv0I
         5mRe74JgLWWfpw/AeG1fvkeqlup/MVPxyMuMi8y8qAbX1PRVGG+8O3HqUF6us8p7WBwe
         BtK3y3AYYMfxCVZGxron0CrK3DTwRytIGj0rhz1re1Jodb3Wgl9Td4SSOsFop8lBdc00
         6Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785529; x=1788390329;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GZ4MVTLP0goD2ecS0YI5oUFT+iv0vlU/KAAezn2Wgnw=;
        b=Vae55dMJ8hyOe63+gLZI/t8G0MNoFCmFEEkMfo+Y+o806yUEAWhi9thzRc9qpi9EE4
         6OyHqTL2X0VU3CNl4NrB07yQ4Y+X6xrL8bbXmQq9s25UeE35BJoWyvFkDaA1W5hh8I3n
         ZK77Tl4d0joQrbgk77gJ7oa2TdWHv8+EeXk7j6508ke5CjM+OrZTPGDyX0Mzodqsnxt3
         xgHQn2fXawQknIsV7mooS5i6c6CM58shxgUO6qW/O/5lw3Rfu+IIr5ZKgg4kcZEovz7x
         bkEGTGOkeFryvKBBG6VkRbawd1vkdpYfMhBx61cLG+hMre+KUcruWqVLyj84qsUJpFYE
         cckA==
X-Forwarded-Encrypted: i=1; AHgh+RqWVQhyBArrTfxIzs92bJANq6YSpFJEdsQUO49Gx4qR6Hl1aLbnBiUf2kVlpVK2O+YAXbEBYy6pqIqvLzk=@vger.kernel.org
X-Gm-Message-State: AFuF++nOOspcL/JGj8xms7Oal2UvRWKJvTM0oKM8dHRN6gmuM4kC2pfA
	LA8xdny5FeCMElrPuNNwiTbs3QxbXIkPCOjDeXr7r4uFZ6eB2SGE/OK0dU/aKal3/FbOQGwg35M
	V2Ui7LA==
X-Received: from pgdt3.prod.google.com ([2002:a05:6a02:3003:b0:c9e:41e5:2eec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4388:b0:3b2:8674:9830
 with SMTP id adf61e73a8af0-3d0f6d2abaemr2865016637.14.1787785528406; Wed, 26
 Aug 2026 16:05:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:01 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-11-seanjc@google.com>
Subject: [PATCH 10/20] KVM: selftests: Add a wrapper API to allocate multiple
 page table pages
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

Add vm_alloc_page_table_pages() and use it throughout arch code to replace
open coded equivalents.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h    | 9 +++++++--
 tools/testing/selftests/kvm/lib/arm64/processor.c | 4 +---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 4 +---
 tools/testing/selftests/kvm/lib/s390/processor.c  | 8 ++------
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 2525c2cacc22..21354434de0a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1013,10 +1013,15 @@ static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
 	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
 }
 
+static inline gpa_t vm_alloc_page_table_pages(struct kvm_vm *vm, size_t nr_pages)
+{
+	return vm_phy_pages_alloc(vm, nr_pages, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				  vm->memslots[MEM_REGION_PT]);
+}
+
 static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
 {
-	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				 vm->memslots[MEM_REGION_PT]);
+	return vm_alloc_page_table_pages(vm, 1);
 }
 
 /*
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 01325bf4d36f..2dcaa2c4a038 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -115,9 +115,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	if (vm->mmu.pgd_created)
 		return;
 
-	vm->mmu.pgd = vm_phy_pages_alloc(vm, nr_pages,
-					 KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-					 vm->memslots[MEM_REGION_PT]);
+	vm->mmu.pgd = vm_alloc_page_table_pages(vm, nr_pages);
 	vm->mmu.pgd_created = true;
 }
 
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..c175dcd14114 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -69,9 +69,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	if (vm->mmu.pgd_created)
 		return;
 
-	vm->mmu.pgd = vm_phy_pages_alloc(vm, nr_pages,
-					 KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-					 vm->memslots[MEM_REGION_PT]);
+	vm->mmu.pgd = vm_alloc_page_table_pages(vm, nr_pages);
 	vm->mmu.pgd_created = true;
 }
 
diff --git a/tools/testing/selftests/kvm/lib/s390/processor.c b/tools/testing/selftests/kvm/lib/s390/processor.c
index fb9dab92d4d1..33f49d743b5f 100644
--- a/tools/testing/selftests/kvm/lib/s390/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390/processor.c
@@ -20,9 +20,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	if (vm->mmu.pgd_created)
 		return;
 
-	gpa = vm_phy_pages_alloc(vm, PAGES_PER_REGION,
-				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				   vm->memslots[MEM_REGION_PT]);
+	gpa = vm_alloc_page_table_pages(vm, PAGES_PER_REGION);
 	memset(addr_gpa2hva(vm, gpa), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	vm->mmu.pgd = gpa;
@@ -38,9 +36,7 @@ static u64 virt_alloc_region(struct kvm_vm *vm, int ri)
 {
 	u64 taddr;
 
-	taddr = vm_phy_pages_alloc(vm,  ri < 4 ? PAGES_PER_REGION : 1,
-				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				   vm->memslots[MEM_REGION_PT]);
+	taddr = vm_alloc_page_table_pages(vm, ri < 4 ? PAGES_PER_REGION : 1);
 	memset(addr_gpa2hva(vm, taddr), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	return (taddr & REGION_ENTRY_ORIGIN)
-- 
2.55.0.887.g758fc8c411-goog

