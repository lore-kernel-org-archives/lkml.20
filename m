Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424B3C4575
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785529; cv=none; b=Hz1gGAcquBdFMSvckMbS7F34sN+4G+KM828vQ6A/9MPaVt4fLetWkIS+0emWQWRm0gPSfz0fVivjtcqKYx1/Msz20+VBKuFVR7XQTb10detxV2E2wlqhJ2xxHDjI9mF5PKmI1jRU1qHL2w1FAiG9FaKt5mb9CwpR3HMBaOu7A6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785529; c=relaxed/simple;
	bh=Og3X8RzZZC7bGK7N/Qk1HYx+tidEH32/xLJy5bYOdgg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pvIQaDMRtTN0GH6pxV8eK2zNEjLhXuMr4f1CkCHJj1XYLNa47MnBMLqvEv9QjTfUQIqrQKy2SBwG4dOnFGriR9FUaCMtIhmHv87hxtWJ8b3rM1h0K3dtxUCeTQmLTtHdvsJp0cmHK7Hfz8+yIyqLULme1s0cbCOLY3lNdzNfzYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kavUWIoD; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kavUWIoD"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso1457786a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785524; x=1788390324; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IKkZ5WMHTp+y0tIK6W989B7G/56Zjcmbkdc6Bf2mTQA=;
        b=kavUWIoDTGWqr9c/YVkaH+uI+hcMPgtPQUMpJ8AsEM73hHrb824uusFiJl2rwuF9a9
         mkjFby/x4LqsnRINXJtD6nbzmc3HR3NQvJc/l17hH/4QZj6MlLy9IWktccoeXlLOeSsP
         DXMqioiXogZa0g6ucpUNFyNBISygmRkJs/DkwYehtNiaO5eYXtLw8Eyytlt2yuSC7v2y
         BrobfuC3THbYBfJMcCnOmOiBRAgZQipGa6tx570adb+GvwzR9+9rq7tyTbDOUQMNMcWG
         iIWQBoQoTH0p4xB9OFq4//LWh4eFd9FVSx5VY+uBUPf20PQmWN9zbgPUUmncgoKDSYuN
         uRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785524; x=1788390324;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IKkZ5WMHTp+y0tIK6W989B7G/56Zjcmbkdc6Bf2mTQA=;
        b=TkDrxuldVYfl7onwJWWouG/NEWl/YsG2C8E3v/gnxYyPU4n6m65KGXhThchihlrjwu
         gVAEKEGG8d2oUsDFOXVaSrVCD2xT2UHkKmwDgFeLH4/zB9wZNfQZMdmhNs4TZKpZuNJj
         OjPcGioYYPh6p5i6/rQs47kBURruXchQB2UnbPwzhECF/F7r0mmzzLE0+AWtYUC+OZvS
         0DE1Gkm9ppLNryaEpWhGSFZ9fMAgcd0KForcVoq3GkwbAoax44xmww6yE3eIeM+uTT4j
         LwYS2Qvp9Vgf4h5yFPg/zoBmB66pwTODkxllfrOQSFqPBgW4LLlorjUEXAB+hjbAjM96
         QRlw==
X-Forwarded-Encrypted: i=1; AHgh+RpUGdI0ZM3JRJEnw8Q6LT4upxgacMLmBhX+i0NYsZC38PzWT9PSDri2gcTD5zV5U+M9alX99Lv9YY8pd7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kHJ7gKu6lZanWzGlitZvg9eeijB/xnRoBbLsqkt1vG1nsiGweK
	O0ONJq1ZOl4zlp/7b2thAK//y/PUHs9jexf9AAHC26rFM4anFUQT5U5IUATHmuQh5FMOIEdeEBf
	svGoMHw==
X-Received: from pfwy20.prod.google.com ([2002:a05:6a00:1c94:b0:845:a3d5:fed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f92:b0:848:2e3c:9955
 with SMTP id d2e1a72fcca58-85371fa599amr18012291b3a.4.1787785524196; Wed, 26
 Aug 2026 16:05:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:04:58 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-8-seanjc@google.com>
Subject: [PATCH 07/20] KVM: selftests: Make the single-page allocator APIs
 static inline
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

Move the single-page allocator APIs to kvm_util.h as inline functions, as
the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
to remain that way for the foreseeable future.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 14 ++++++++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c     | 11 -----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 96c8251c224a..2525c2cacc22 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -990,12 +990,10 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
 const char *exit_reason_str(unsigned int exit_reason);
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			   u32 memslot, bool protected);
-gpa_t vm_alloc_page_table(struct kvm_vm *vm);
 
 static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				       gpa_t min_gpa, u32 memslot)
@@ -1009,6 +1007,18 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				    vm_arch_has_protected_memory(vm));
 }
 
+static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
+				      u32 memslot)
+{
+	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
+}
+
+static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
+{
+	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				 vm->memslots[MEM_REGION_PT]);
+}
+
 /*
  * ____vm_create() does KVM_CREATE_VM and little else.  __vm_create() also
  * loads the test binary into guest memory and creates an IRQ chip (x86 only).
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 896da440659e..ce0d8fba4624 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2086,17 +2086,6 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot, protected, false);
 }
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
-{
-	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
-}
-
-gpa_t vm_alloc_page_table(struct kvm_vm *vm)
-{
-	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				 vm->memslots[MEM_REGION_PT]);
-}
-
 /*
  * Address Guest Virtual to Host Virtual
  *
-- 
2.55.0.887.g758fc8c411-goog

