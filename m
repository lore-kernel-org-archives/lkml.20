Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C1764A8D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785516; cv=none; b=Un5jA/IFmO9lqrPG4CTkKTAmRXUNN+i74rnJ3kKFbi9sKvOmPz3vLNBw5+W26o083Y5YnmKwqT0d/THdDXrJ9Oe438/eYGSYvybUTUVdHaYRGrgpXZzkhIdMNrtUz5RjZyaAklnU3Hm0jPDjAKnf/0mrhhGgQUKdaH3nfuB91mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785516; c=relaxed/simple;
	bh=09nufcNEnQr4iHnEimrLNPRNUWNVw6IP6eINZA721YY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pytU/jBYuYT+Kjpo5T2xdKGOn2hBHIftVPbmf4qMJDfWoy2vt0iCWu0dwekuVYzC04NJYa35Ju3/ub7uxk9htyv2LV0HOLXX/WGbMcgcwFOu4O+ZH04zSZbYAHqlMW0OFJubV9NaIt/WlYwpA6cWS5GUbQfBJtTbvPsjDWvkOBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FpYqfTgf; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FpYqfTgf"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7293f13c6so1142715ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785514; x=1788390314; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRDzIvJTa0HXgdmAJ1iBjSEqSYXJcGrZt7XM2C/1134=;
        b=FpYqfTgf9GR38RE5+5ufDq4/ngULPl44sgBeHwHEfRtJkppRBaDGJL3EPsde7YvMuT
         ndU2+OkvQSfpef7SKNeTKXGF3ybrzP+huE1Wr57ezz1s1KVwvIuwk2qK9evJuVREw4XB
         lCwqa8s5yJYl6KOSZ4BPVth0XuDgmGNVZvxrR8iLf5ZV6Z81tYfGXtJfB9UeSRT9AGZ8
         2XzzuMTq7+ZQy0DER30UKwYVx4hlLsoTxZW5WrHIyS/ebzhJOTb+udaDwpMdR5JYK+Mu
         JiTcW8RhdacRJn9kQWC6JC+HVWHtgeNSvzDzl92Lzm5cOBemevl66GdKRBC/ggkNe8OW
         D0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785514; x=1788390314;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gRDzIvJTa0HXgdmAJ1iBjSEqSYXJcGrZt7XM2C/1134=;
        b=XtUMegrvrCbMn3yPzUXnZKjGQPxtpOc8Y71U2eEXiYv+0ZFdGHdd9Z70JfH20o3RGD
         m4pxqWXgO7mjixObf5o4b7a/IZObQFc6Y2TaV1318iscN1iJL9WRB+MI8TOS1PhL1UGH
         r4pitd2cCRrARcsaWOObcedk/pBaabla81ZLUgRS254ey3waJQlJHwmPeCpuFZO2Plfb
         rxQ0HZq2yNr/cdVguntGFCtFgFRwv/e3dRl3DZBbhO6ssG0WbXkctxyKt2lkZYyufCZX
         w91PpRAFMupHZEs4EKW/vZSSANMw0XoenqPE2vWuWIB2ron6qeGG11yDFKQGv6noX8IL
         v+Dg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+nF6y0rNdglBdiSJ6t7/nKqjqZg98JYsUQb6n+nqTECT47AzVI5kEZxR0ti70zYKp2TXI7HZ2vzclBZA=@vger.kernel.org
X-Gm-Message-State: AFuF++ksQynSEu/yF3RVqXXYe0IwMHlSpdTSfz7ZL4XVQJoQE5GICSA2
	nmS2gHCkGMSsencxpE768fpmPFZEL8XKKgnz7KOLkkOqf8QESLKZWqANLwK+olhiXjiVJjzzpy2
	Z8gWBkg==
X-Received: from plxl5.prod.google.com ([2002:a17:902:db45:b0:2d6:f794:4e76])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b24:b0:2c9:9a2e:dab0
 with SMTP id d9443c01a7336-2d707954e7amr191786295ad.3.1787785513509; Wed, 26
 Aug 2026 16:05:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:04:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-1-seanjc@google.com>
Subject: [PATCH 00/20] KVM: selftests: PPC pre-enabling
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

This is a big pile of cleanups and refactoring to prepare for PPC support in
KVM selftests.  PPC has paging modes that require multi-page page tables, and
those page tables need to be naturally aligned.  The original proposal was to
plumb in an @align param to the page allocators[*], but I didn't love the idea
of adding another rarely used param to the allocators.

Reworking the APIs to take a region type requires a fair bit of churn, and was
more painful than expected as I didn't realize just how many one-off tests did
weird things, but overall I think it's worth it?  If only to keep cutting down
on the use of magic memslot numbers in tests.

This needs explicit testing on s390.  I tested on arm64 and x86, and given the
number of failures I had to wade through, I wouldn't be at all suprised if I
broke something subtle on s390 as well.

I'm less concerned about RISC-V and LoongArch as they don't have any custom
tests that are affected (which is where I got burned).

[*] https://lore.kernel.org/all/df86b5ccdbdafc3509d9538bd5e6796737bab2db.1781093720.git.ritesh.list@gmail.com

Nicholas Piggin (1):
  KVM: selftests: Use goto instead of do-while to retry finding unused
    physical pages

Sean Christopherson (19):
  KVM: selftests: Use MEM_REGION_PT memslot instead of '0' for s390
    regions/segments
  KVM: selftests: Bump the minimum GPA for page tables to 0x200000
  KVM: selftests: Use vm_alloc_page_table() to allocate LoongArch page
    tables
  KVM: selftests: Rename "num" param to "nr_pages" for physical page
    allocators
  KVM: selftests: Extend page allocator to support naturally aligned
    allocations
  KVM: selftests: Make the single-page allocator APIs static inline
  KVM: selftests: Use the innermost page allocator API in the memslot
    perf test
  KVM: selftests: Use the innermost page allocator API in s390's IRQ
    routing test
  KVM: selftests: Add a wrapper API to allocate multiple page table
    pages
  KVM: selftests: Initialize vm->memslots[] with invalid memslots during
    creation
  KVM: selftests: Add APIs to override memory region types with custom
    memslots
  KVM: selftests: Add TEST_EXTRA memory region type for "special"
    memslots
  KVM: selftests: Use TEST_EXTRA region in arm64's vGIC LPI stress test
  KVM: selftests: Use TEST_EXTRA region in x86's smaller MAXPHYADDR test
  KVM: selftests: Use TEST_EXTRA region in set memory region test
  KVM: selftests: Take the memory region type, not memslot, in page
    allocators
  KVM: selftests: Use TEST_ASSERT(), not assert(), in
    vm_get_mem_region()
  KVM: selftests: Automatically pick min_gpa for allocations based on
    region type
  KVM: selftests: Add arch hook to force page tables to be naturally
    aligned

 .../selftests/kvm/arm64/page_fault_test.c     |  18 ++-
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  19 ++-
 .../testing/selftests/kvm/include/kvm_util.h  | 106 +++++++++++++--
 tools/testing/selftests/kvm/include/x86/smm.h |   2 +-
 .../selftests/kvm/lib/arm64/processor.c       |   4 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 127 +++++++++++-------
 .../selftests/kvm/lib/loongarch/processor.c   |   5 +-
 .../selftests/kvm/lib/riscv/processor.c       |   4 +-
 .../selftests/kvm/lib/s390/processor.c        |   7 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  15 ++-
 .../testing/selftests/kvm/memslot_perf_test.c |   3 +-
 tools/testing/selftests/kvm/s390/cmma_test.c  |  19 +--
 .../testing/selftests/kvm/s390/irq_routing.c  |   2 +-
 .../selftests/kvm/set_memory_region_test.c    |   8 +-
 .../x86/smaller_maxphyaddr_emulation_test.c   |   9 +-
 15 files changed, 219 insertions(+), 129 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.887.g758fc8c411-goog

