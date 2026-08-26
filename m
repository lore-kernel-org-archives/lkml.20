Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419C93E958F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785550; cv=none; b=DTnEurQDRqU1KeCrKK+VzKQUj/o8bkNTocdxpTMmu+T8ho8/gLiYCmEGpZ9JkSSBVcMTH6JnvXXrWebVq4pYln24mj73QLHAPLVkI6aWMKs0S9rOJsKwwm6AhRXnzrY8QThNSjM4YAgSIcop/iaPbA8MzYliDUMRshePivukJno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785550; c=relaxed/simple;
	bh=X9xnhlePSqIAyLBCipdOU0BNauH8Bhdv8PSGmQMr+Ik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H4+ZmVRd9fblv/auTQ/cmxNSZa9MN3+l2Id7sM9z4YV7bmJ9ZAKVGWFtohgJ4ieq6Bo+OJlklRRP7cE0R0iItrnWKABlxaHygra4/ih57SDcnXYirN1qT9TKw6pXeZq7OxxUDRtZz0K049xMxNHqfRZkyXFEI9l0t3axtiA/0Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dbXJ7U4S; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dbXJ7U4S"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8485d853b08so109327b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785541; x=1788390341; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHiSvQXl4tkWm+SikbwEM4QvcPfHzRPC0s7Gep7aVew=;
        b=dbXJ7U4SuYurP5RGbLRVn5K03bu7RlwS4LDu3MrrAk10gF/X1/DSk9UUa0xG7neyKE
         sl3K0a2tdRP/CPSX3D3hvUUfuMfGDYSAx3NQ70ax8FsyK5Vwkalfb3yRdD9BHk52UZeH
         EOTi4c5bT36Yy25iRSZvQUN6s8252nQc1WgN08TZEpnctvqMPAt06gfYYezK9CnMQ9Ow
         VZ0b/pHOogtGbvmFgtigsRhzXtZ0mJC9RyKQQOAP2HKe1P9ZnDbuRvbZcHoTiJsk79ss
         fJ9xvtSNnQ/hr21UlMvKwTZo51qzcnMeY+RzUTWnSypAoLNBqyxk8I6kEqK3CuFbZJnO
         D9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785541; x=1788390341;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pHiSvQXl4tkWm+SikbwEM4QvcPfHzRPC0s7Gep7aVew=;
        b=MHu08KWy7yGriE/71xC52RENx31+deRNDL/mC59A+L47nlQq7UsE2Y9yVupvRP3Fq+
         h4IvzXrC9rU/eVT5+MQTwJ9GzwmZ3bLhtFiRDAzjDckRFpDnAsn5UREP5+JsHmVGc/V7
         vYq1CFJNJA+NI9q/DrYsE74W5hh8+TZr8bNg4yst1ML6lsis422Mz4m2nssi33ZNxbvK
         wBttaRADpZA8MAd43lWI4odgHuQX+VohJ8mI3M9vPN1l55cV6lBkK5hyMeJc3ov9ULQk
         n+uZUwfP5AL/1P1R/af7fPSF5Jm7u7gGOuf2t80Hnl3jAnjEj91TwEPxRGvXSefVa3q6
         dWIg==
X-Forwarded-Encrypted: i=1; AHgh+RpGj5xh8Tn13Rh/LEQtGgWAcUD3Og+hqLiVieHNLhfLghNQ69JwM1uUCiBa7jltYSVyPxRY1rJpVuuOHIw=@vger.kernel.org
X-Gm-Message-State: AFuF++k9HSlH1QtRdAtcd41TcYzdzJGz0kgn1QMlytNk1Qe+unzZpvuP
	cvfFKo81+2Q+UHbCqPoyL1RU6jtZlCTH1p9tnakNrR3KvQF2RVheYaBu9FVUCZ8HZyAEKy00tiP
	nSN24Rg==
X-Received: from pfbcb3.prod.google.com ([2002:a05:6a00:4303:b0:847:aa6c:47fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b53:b0:851:8baf:5b26
 with SMTP id d2e1a72fcca58-853749a5e4emr17924734b3a.14.1787785540289; Wed, 26
 Aug 2026 16:05:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:11 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-21-seanjc@google.com>
Subject: [PATCH 20/20] KVM: selftests: Add arch hook to force page tables to
 be naturally aligned
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

Add an arch hook to communicate to the core physical page allocator that
page table allocations need to be naturally aligned.  The hook will be used
for upcoming PowerPC support, which has MMU tables that are larger than the
guest base page size and need to be naturally aligned.

Bury the hook in the physical page allocator to avoid having to plumb a
rarely used param into the main APIs.

Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 1264cd1a343a..ffd4cf740d7f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1050,6 +1050,8 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
 const char *exit_reason_str(unsigned int exit_reason);
 
+bool kvm_arch_needs_naturally_aligned_page_tables(void);
+
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 8b5b330a5889..57b653fbd0b1 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2085,10 +2085,16 @@ gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	__builtin_unreachable();
 }
 
+__weak bool kvm_arch_needs_naturally_aligned_page_tables(void)
+{
+	return false;
+}
+
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 			   enum kvm_mem_region_type type, bool protected)
 {
 	struct userspace_mem_region *region = vm_get_mem_region(vm, type);
+	bool naturally_aligned = false;
 	gpa_t min_gpa;
 
 	TEST_ASSERT(region, "No region for type '%u', memslot '%u'",
@@ -2110,6 +2116,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 		break;
 	case MEM_REGION_PT:
 		min_gpa = KVM_GUEST_PAGE_TABLE_MIN_PADDR;
+		naturally_aligned = kvm_arch_needs_naturally_aligned_page_tables();
 		break;
 	case MEM_REGION_TEST_EXTRA:
 		min_gpa = region->region.guest_phys_addr;
@@ -2120,7 +2127,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 	}
 
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, vm->memslots[type],
-				      protected, false);
+				      protected, naturally_aligned);
 }
 
 /*
-- 
2.55.0.887.g758fc8c411-goog

