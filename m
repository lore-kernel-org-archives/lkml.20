Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3443552B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390578; cv=none; b=N0RGlR+4HHVb6M726REaxfaiZTe9IyS0W6pUQNv4kmtIvxT8U0IuVqB/UQUR3My91z3qjGm62FrrLjgaPfcP1z9UGuQVsycBf6dt+tRUEH7Nnjoe91b4MNWXyfeznXFz8bhELKzjz0ImChbN1XohJcMpIm52MA9tUymMqlzYNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390578; c=relaxed/simple;
	bh=60b++oU64bR3hdczm3nMl9QKb4QsVVNXlpRRHAGyvtE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ze+ox+VyGWcWz8Yt/FSQogfpDTq8LgEtYQ5VUGXzK/Ah89rQD5jgfOmhRzyWEFKqSuz1H4Ah9QiJTVizvdVnCp1wdl1CvClY3lIa2VT8wZMxmgYHDmcQOPsyictSEnOM5Z9U8UqgFhHTjpsvD2Whn8OzF9P1Y588i1RFWFKhSf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B+LPnc0M; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+LPnc0M"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fed0652bso19773115ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788390575; x=1788995375; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qSDddEMP3f6RmPvCgvYdnz8wn2o/zSc7XyEc9xD4eok=;
        b=B+LPnc0ME/KGFsZDRHIdM/dXiFCiw2HxN9Nwc9VjQRVVqEkLnN2ry/p52AvyG40giz
         WeXO5zMl6AkBCbxJJcvUcza+/CycXHxMBMbVK2cfCuZr1zZVVTlZht5KNt1lkapvufjk
         aMlAMErpTV/4tHhOcol3xFb33ou3L6RkwXMcUfxqdgRa7cVL1ajln5g83XtrQh3g4V54
         JgEw1S5WZRL2NPMLsy8Re/yeALcMc6TrAIAq8Ak2G7gpLgxDxPNrTTUo2H7fMOFfYtRo
         i4VxEPj33nP/3F8E9+IvT+QzZMwsBcLysqfEI8mfJy5l7S736EeKme8E9HJntdkVFo3n
         hffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390575; x=1788995375;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSDddEMP3f6RmPvCgvYdnz8wn2o/zSc7XyEc9xD4eok=;
        b=BRZB2UM3j3Na5RA/Nh8wtJ0GQ71p/zYLoQpcq4nprXkPmvp2yWDqKxcApe9NvAnDZ1
         MTzRhvmJ6Pzq8gDHoMplG+qwU1Ba9uPOSqfFm5em9Bo5Kw7EziWVbuGU26cgpnzDW9Oy
         kGAMg5dKfgAK8mEACMPiGI6944Kmxli0dF4l9jzm0Nl/KNGguKCPjUIe3OV6YGwNQLF6
         Az82atGVStfuiHYeFiCm9f6QnL/cO5abrX2QVvv0Vc17kIqVTYQAkldjA2i6LuTUfeCP
         GK6sjbIYPpi7W8rsXlU7koREfq4rulnbZgJbBwZIDNXAC+Ehwp/cZFtbjlXXcA3RoPpy
         smzA==
X-Forwarded-Encrypted: i=1; AKwUvBx8AF+d6YjtgnItrHCDSohjf1MGhk36OZ0428O7Ub5aAYBjUhOgnZT5OR0Msw05c7pLv70igEUhWdgQdqM=@vger.kernel.org
X-Gm-Message-State: AFuF++kaTNT+b8t077aoSQLbcdmuASDMYr7LlbFIAoMeajl1A47gtY+t
	DEXMywA49LtypVNRScEAVDolTq/GYDfKi3yuZ0gt6+djFxqOCWkOrENRma/E19PqfuhDFjO9QUH
	d4GmbxQ==
X-Received: from pjzp12.prod.google.com ([2002:a17:90b:10c:b0:398:df3f:7569])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7cc:b0:396:b98b:a3c2
 with SMTP id 98e67ed59e1d1-39aedf1b1ecmr11061480a91.8.1788390574817; Wed, 02
 Sep 2026 16:09:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 16:09:30 -0700
In-Reply-To: <20260902230932.2760127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902230932.2760127-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902230932.2760127-2-seanjc@google.com>
Subject: [PATCH v3 1/3] KVM: x86/mmu: Use KVM's max TDP level to determine
 need for 32-bit TDP root
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

When checking to see if KVM needs to allocate a TDP PAE root that's 32-bit
addressable, query KVM's overall max TDP level, not the vCPU-specific TDP
level, as the logic is specific to using NPT on 32-bit hosts.  Querying the
vCPU's alleged TDP level is flawed and confusing, as KVM selects between
4-level vs. 5-level based on the guest's MAXPHYADDR, and MAXPHYADDR isn't
yet configured (via CPUID) when the vCPU is being created.

I.e. as is, it would *appear* that KVM is violating its own rules with
respect to changing guest CPUID (see kvm_mmu_after_set_cpuid()).  In
practice, the flaw is benign as the goal is purely to see if KVM needs to
use PAE-paging; whether KVM will use 4-level vs. 5-level is irrelevant.

More importantly, avoiding kvm_mmu_get_tdp_level() during vCPU creation
will allow hardening KVM's handling of S-EPT mirror root level.

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 064ecc33b926..c9a684151420 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6834,7 +6834,7 @@ static int __kvm_mmu_create(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu, struct k
 	 * other exception is for shadowing L1's 32-bit or PAE NPT on 64-bit
 	 * KVM; that horror is handled on-demand by mmu_alloc_special_roots().
 	 */
-	if (tdp_enabled && kvm_mmu_get_tdp_level(vcpu) > PT32E_ROOT_LEVEL)
+	if (tdp_enabled && kvm_mmu_get_max_tdp_level() > PT32E_ROOT_LEVEL)
 		return 0;
 
 	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_DMA32);
-- 
2.55.0.970.g62bdec98f9-goog

