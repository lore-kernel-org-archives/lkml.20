Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FDE4ACC94
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367299; cv=none; b=FZDdQQurO2XWwfr3vCpZUMtw7MKgCsPP/mpY2YZUOFrMUFRwq2rMoJ2AuWYW7wk5AK05xi/SDtzvDPft6ik6ULhxd3MvVCkOTmlGWW8UH43trhaQZnF0Pa1GtboYFMgjATUEmHfmdEa8/KVnorYe+zeuW9BCtfmunZBMTCvZJKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367299; c=relaxed/simple;
	bh=wsoBQD4qq6Et3vmrWdvEDcU5mPTJSW7kE60nWbUUw1M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QZZZ2kOGcN6dNAOJ++K4mnXTOJ1TphRtYwijYaAgSqfbyBR9DBD65tFRNNjpTCpA6UI6Xf/nYaYB6zRtoERN13NgBaQ9WhNQEQGxIuZxCHFbXcWwQXj/qvIDl8FjZuDcjCV5alVEB1iBsmoaSAdEmMt7n/HcqvccbKSv6+Lnz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CoDV/rMi; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CoDV/rMi"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2235826a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367292; x=1788972092; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PFS8FckNWR5Ypo1TjtxFOP+XgfwND0gTpHBze+LVvng=;
        b=CoDV/rMi3wXQcIFfpDJEJwOSFcAe8AwHgQYhqSKnx37lPTzLE8BwcctmfTf7fTmuxa
         cbrbaE36fua4gM4G50OaPdDtl9TOGfqqRo8IuqTjDFCRxGdKCbaR0UaeKDn5rJzT4sYA
         nW83hlnQrYoDvedAsnVxrYX2nIcoUeuQd7upTg9XHgN0YY91iL75AH2BuHvSuDXO30nW
         Y5RM0VG32hhMkh+WIlcXNdwXfjHx+Ywj8fea+bp6CDQF+AJkKoGNOVFaHshdct7sLksq
         w1A7vN42/NzUcYMsfHYUO2/UtrPmJI4sWxxcr0fJ6gmBRGlLaQ5uQfFLxCnQvuecRxpU
         1+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367292; x=1788972092;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFS8FckNWR5Ypo1TjtxFOP+XgfwND0gTpHBze+LVvng=;
        b=BUH/5phrh1n7Tlw7b4JoFUOrkvbIpZQf1xeQnXdpkSuZj+Pxainfa5/ooz1Ne4CFr4
         1y4uPaymy3F6Xuf3Ng+QY1l2oJYpfx+c+naw+FT8JfVD3XN+QphL5muhLid6z1/noeMY
         HiqieoZZeDcgMMlNnp9z6uLCW2+8fDGLuTElYU30pfAk4YWC4A41RVfClx3G3T18d0Qt
         OddeBcFaUMD2RkRRVMuxRsnNWIqHcK8En5xelOqakq6rFk/OoOX7NkEqDpTXoSTzWXEf
         zY/5wJthvrtLFNtTYjBIb0yGP8iqQI6tScyAnmvQkejcSrUBM/Lr5S/NCa9n2jl4BfOD
         NHgA==
X-Forwarded-Encrypted: i=1; AKwUvByTWKEspOp1cH4snwXnTeLgNztgJlS45XpABeR6AoUjg847AWdVeEPIn/CsLwgxuxB6QoFiISsW+JmEHD0=@vger.kernel.org
X-Gm-Message-State: AFuF++lr/lSZn48kNKHMfY495VX23Wej3HgOyMdyO+fd++DyrMM6XXtU
	QQTQ59tdLwJX1tpknrUjYRcdNRSlj19DCBZykKxVPrt3x4MO0wueevBF3hSRgursZxBo7Pna5qC
	3tMdpxg==
X-Received: from pjmm16.prod.google.com ([2002:a17:90b:5810:b0:383:7b51:b1cd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7cb:b0:396:65dd:4093
 with SMTP id 98e67ed59e1d1-39aee153a7amr7412902a91.14.1788367292151; Wed, 02
 Sep 2026 09:41:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:09 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-7-seanjc@google.com>
Subject: [PATCH v2 06/20] KVM: selftests: Extend page allocator to support
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Extend the page allocator to support naturally aligned allocations, as some
flavors of PowerPC page tables require multiple guest pages per table, and
those tables need to be naturally aligned.

Take care to align the potential base address *inside* the retry loop, i.e.
the base needs to be (re)aligned on every attempt.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h |  2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 13 +++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 95bc0a78d2bc..4732b9528812 100644
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
2.55.0.966.g6673acef38-goog

