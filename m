Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE73BF672
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785528; cv=none; b=EWkZBOrigUykn7VL7G78T2xSYy9SPg8x9AY0Ocme9chVPNSHiwvZjNlY9Yh9yCWd6Tpdz4s9fqxSIqDK5eN/MuaSEJ786ENxPuU1LrO9Cn1UQR4atRLihWbh4em4uM5OONJp7WxN8TZRapXjXkzN5/BIlTQECayTGUw1e0kRolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785528; c=relaxed/simple;
	bh=m3Lp8WMJLB/tampmgFN8ph5luv5ZjkhRNjnxAVae4ys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G9IbCIkcmTXa0MXJdAOe3f6BW5jI187diicbDBTtdSXujOYL2dDzachzw3elRHrPai1ipac+R237sjSS/t/4/yWt36OANNSQlQFtccTBhUPt4HoZcQ0t8CeGWikl2ZNlUpZdu6BZKGcQtUWqIEV+CGm12pw+GnQDABIwl3ApMeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VCsNvrFm; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VCsNvrFm"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e048a801dso2173199b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785523; x=1788390323; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ypnv5ADnidmiHmk4i8NjwAmXQS3vAgk870JArYSva+A=;
        b=VCsNvrFmzwwOjwaZW6yMNLBk6X7MZvMd1W7hC74fgkPqVrRjfzh3EOeAKaILDgaYdN
         gg+EUnewdGXsrNw2zIzIP8v7drp4nJZnWdKQF1aNOdZw5Z5sxYA7AbKFQZiAwUDGuFWX
         tEaEzi5pS6OiWjUZjh6eqrDXCUsgxhKZKqIL6VYlN2ZSRIdUPIJs+7YGVWG9QjSKT4OA
         RedTabCTtaZjqyV7HK71vKy229CTPbXtrdhXm/j2og3t/WJTil3G12B+S1YNEMyS4B8B
         +baf6a33VHoeWgD/PbEJK/QoR1wO8sGmNQGGRhvtN816zyA1M+Zi5vvqIukZHJ+OTQvn
         R5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785523; x=1788390323;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypnv5ADnidmiHmk4i8NjwAmXQS3vAgk870JArYSva+A=;
        b=YL+KHKsUJXTthGh3a6U3p1BPvw6nfSlfPiZQRpvMdHUBI19gtjB57nThNN1RREVT+h
         IGgrzUmuKpFgSBYJCBZdzlL+GOcqNvSmZi9FG8REpQPgCHo+z8mPeckeRM6Rhw3mnMVe
         y6SGRZzxtInzlvIwh3VMyiS8G8ktgfxw03ZdMIUMOjS5uzrh5EMycJ1WKDRveIIMmGgG
         BRLbgwJzaEZdTfjR3FMq+aTaxrU3hke+c1/N7/YPTvAzR4tSKp6VUkJ+sFEli0+CtisM
         gr61IPYovuuQx/QNSPdyREatdiDYY1baHL4lQ4HHuMM/wJIjD2CxeAH+9JcYeirAnXs/
         nEBg==
X-Forwarded-Encrypted: i=1; AHgh+Ron5cmjxaApuz0WZG1ljC0YBOuVqqPjmUz2/B0zVzBjzXFrrQpjeR0KHdnoFniU5eWI/K9nnaC3KVh0yVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lBZjxPhItuEITSQle65LY8W7vSXRRdEvTR0J5pLrP/budm8O4Y
	hm60r6+ow7161YYP9m6Rwfhncx3dDtIL7Y8vRsC9u9/u+0jMtLhxrh74O2cUB2hLzz4hMKSuEKE
	jGQV9WQ==
X-Received: from pghz21.prod.google.com ([2002:a63:e115:0:b0:cbe:ddc9:c670])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a110:b0:3c3:33df:4d9a
 with SMTP id adf61e73a8af0-3cf7596a65cmr18790428637.1.1787785522980; Wed, 26
 Aug 2026 16:05:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:04:57 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-7-seanjc@google.com>
Subject: [PATCH 06/20] KVM: selftests: Extend page allocator to support
 naturally aligned allocations
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

Extend the page allocator to support naturally aligned allocations, as some
flavors of PowerPC page tables require multiple guest pages per table, and
those tables need to be naturally aligned.

Take care to align the potential base address *inside* the retry loop, i.e.
the base needs to be (re)aligned on every attempt.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h |  2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 13 +++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index b1c5597b1def..96c8251c224a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -991,6 +991,8 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 const char *exit_reason_str(unsigned int exit_reason);
 
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
+gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			   u32 memslot, bool protected);
 gpa_t vm_alloc_page_table(struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index bbf6d7684c0c..896da440659e 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -17,6 +17,7 @@
 #include <sys/stat.h>
 #include <time.h>
 #include <unistd.h>
+#include <linux/align.h>
 #include <linux/kernel.h>
 
 #define KVM_UTIL_MIN_PFN	2
@@ -2032,9 +2033,10 @@ const char *exit_reason_str(unsigned int exit_reason)
  *
  * Note, success is guaranteed!
  */
-gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
-			   u32 memslot, bool protected)
+gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			     u32 memslot, bool protected, bool naturally_aligned)
 {
+	size_t alignment = naturally_aligned ? nr_pages : 1;
 	struct userspace_mem_region *region;
 	sparsebit_idx_t pg, base;
 
@@ -2051,6 +2053,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 
 	base = min_gpa >> vm->page_shift;
 again:
+	base = ALIGN(base, alignment);
 	for (pg = base; pg < base + nr_pages; ++pg) {
 		if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
 			base = sparsebit_next_set(region->unused_phy_pages, pg);
@@ -2077,6 +2080,12 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	__builtin_unreachable();
 }
 
+gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			   u32 memslot, bool protected)
+{
+	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot, protected, false);
+}
+
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
 {
 	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
-- 
2.55.0.887.g758fc8c411-goog

