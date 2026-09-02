Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD4B4AA1F4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367297; cv=none; b=BmHNU40ZUcD3DqKZSWHWWwdf4AtFP3DaMi4Yk4/2klW2bFBEtLbAdrFgaoJMvQnC9p76CD+gn4EgCjuP0c8z3SrRU8BS8/ptUDK58hV4t9mzR/Jeh0l1UCA23hDdpRSLYUda5twFQwo+WsdfBBuGOBxGQ3XgWhL0qqb675DaRY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367297; c=relaxed/simple;
	bh=sdY9q2BfDSeykJcP8/5Cy+uZ5jMK/dC9tNYwEHAyn2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ky41M/aN0iZvBm31ch2tG25umAtSJTB2hsY20kaW9vTXGW8wJAe5yM8PyEgYjIYv2SOT2A5Iuyw2yicrj57vXc9FYVOxrQqDyUiyIpwHj9GRPgUJL5QMRWem6MS0RnlfZNft8z8S1PQ5sZFG8K59eZneagMTSR0gHE39yba+noI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gKcQlH/i; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gKcQlH/i"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so2160021a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367291; x=1788972091; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wh/M14gjNPKIhJHces0NPAZ6Z3gj1daHrmdTKDJlvdI=;
        b=gKcQlH/i62JexEHGAzzwd42Mq4jVmmAytuGa+nOYxn4SLKi0/6Zmx7r8B7bUJ80fiX
         eRlPgyfuohsqYu6Hh1aLcvv6fSamXA02ghXJJ4DrEE+Cg7rqW+LKh2bHq7612cXeYyas
         uazWh9vayuQVtGciu5SXsuXrxYPnMsQ0sCe96yu4IrZew+1jmtqJkANlKgCN/6XqXRmd
         F/+YBuy9jRWvkZy5oX9Hpu5VIr9C4MM7yCyh/EDoBX+yl3H1/CnRQ48HR16i4HrQq8mY
         Vd6WqCD7TfvEQkQM9/Tu7zfZV6DlUDmQLTNbZ9ifXwszCRCTO/FWWiKpoShwX+MYZLAB
         hSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367291; x=1788972091;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wh/M14gjNPKIhJHces0NPAZ6Z3gj1daHrmdTKDJlvdI=;
        b=VCPi5zbtGbEJ0SNJMx2S8GHVbhXHa49BUxNN5i3rL4KHR5aKXdJxjaSGLNF0FT9Vo+
         MKy+M4jnuVnJm6Bpf1I1UutqTA0iPvi+jrN2EiB4WkMNZjd1tyhgzC0xSoxXXb+623M1
         diXksjyIFQ8Rbr9mccs0GrYw2wkSwddjTqVK6AyGpogL9SJ7gZM0krXYgOFNsTSavoFa
         N/1Ij6Yjv6XDCU7ml7vOIjmI0uZ7eN/gQ81tJH6ddfKbaWfpUePl/UMpEAcYdsq9Pc9Q
         50nrHGirePSbue8/BYDKHRHT7IUkBIpGy7RiirDLh1h8Mq4GVho/TC+OLdRdVPbhpSez
         rtYg==
X-Forwarded-Encrypted: i=1; AKwUvBwtgNh375rHkR7VBp0Gi0EAa8NvPNt/66H46CmSHe6JrowcXhRpd0AH7/RHQpvdkv4w3Q8TbuKcdkrB0ks=@vger.kernel.org
X-Gm-Message-State: AFuF++nSCrfEBoHPASnZll2smt3SB7OMrSd9h9yMg9AKkVeHCacwV/Uw
	v4nKSouOIOLCEJlNiA6h5jFpu25NVdB8uwYZxm3RhZX1QADHDOer15lP5ECKD5M3UnV5xtcs+3y
	vo+t0sw==
X-Received: from pjbbt18.prod.google.com ([2002:a17:90a:f012:b0:396:5f0e:9c23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c52:b0:38e:6aa7:68ad
 with SMTP id 98e67ed59e1d1-39aedf7c6aemr8714453a91.5.1788367291013; Wed, 02
 Sep 2026 09:41:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:08 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-6-seanjc@google.com>
Subject: [PATCH v2 05/20] KVM: selftests: Use goto instead of do-while to
 retry finding unused physical pages
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

From: Nicholas Piggin <npiggin@gmail.com>

Rework the core loop of the physical page allocator to use a goto instead
of do-while loop when retrying with a new base address.  The do-while loop
obviously works, but it obfuscates the success vs. failure paths, and in
general is convoluted.

For all intents and purposes, no functional change intended.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[Rebased to latest mainline tree]
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
[sean: separate from alignment change, use enomem label, write changelog]
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b071d77dd301..bbf6d7684c0c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2049,23 +2049,15 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	TEST_ASSERT(!protected || region->protected_phy_pages,
 		    "Region doesn't support protected memory");
 
-	base = pg = min_gpa >> vm->page_shift;
-	do {
-		for (; pg < base + nr_pages; ++pg) {
-			if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
-				base = pg = sparsebit_next_set(region->unused_phy_pages, pg);
-				break;
-			}
+	base = min_gpa >> vm->page_shift;
+again:
+	for (pg = base; pg < base + nr_pages; ++pg) {
+		if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
+			base = sparsebit_next_set(region->unused_phy_pages, pg);
+			if (!base)
+				goto enomem;
+			goto again;
 		}
-	} while (pg && pg != base + nr_pages);
-
-	if (pg == 0) {
-		fprintf(stderr, "No guest physical page available, "
-			"min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
-			min_gpa, vm->page_size, memslot);
-		fputs("---- vm dump ----\n", stderr);
-		vm_dump(stderr, vm, 2);
-		abort();
 	}
 
 	for (pg = base; pg < base + nr_pages; ++pg) {
@@ -2075,6 +2067,14 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	}
 
 	return base * vm->page_size;
+
+enomem:
+	fprintf(stderr, "No guest physical page available, min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
+		min_gpa, vm->page_size, memslot);
+	fputs("---- vm dump ----\n", stderr);
+	vm_dump(stderr, vm, 2);
+	abort();
+	__builtin_unreachable();
 }
 
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
-- 
2.55.0.966.g6673acef38-goog

