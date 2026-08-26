Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E8846AA68
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762566; cv=none; b=j6cd/vBDTAtgRJ1PPEqthiImVxpZWIP/gdjzIRur1vna4GiCUDnCWlWLfRoFCMA5BtMOMmJgU8jGKriLPCmJ+RrMOA5p+0XVxoJ8vzhvNCqLCFQ92oJbmacwhDdWv7DKfSdMNIzSOE6MbWC5sWglbyU9yT3ToFJug7alWu0SGxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762566; c=relaxed/simple;
	bh=SUbXpp9dCEW7WnzEf6ifM7tx5RgJp39AuZVGWdWrhN0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ye/yYFWFKKxjTU55V879pnozzaUPgkEv3TjwKgWihFJb2J4auOn8wWrVSWVtdosZS9200FJ41pe1ZgdzU+AEwX4p8shQi4SWHKOjhpAn5M8L+7QVQ5Om3Ilf7IJK/icxvaP3t13/Zw6v2pqhY8RuqQt/8yD3yrvv5b/R8/X7/Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V62yYS/L; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V62yYS/L"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so2437770a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787762536; x=1788367336; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=60ICzOSokLmFbW+aEUbh3rqJ5JJ2ffZEu6ut5rD8ZZQ=;
        b=V62yYS/LfKcnuyEq6nYl0mfBlA/gacdWH58XS9SddKCft2yeWfGf+PA7yRlSne0VAl
         aXpEBEI4N3PZcqaOC4kdqBr4ecLtOyFPYw5ttW84RcWV6QDY2qSOfFam/bao9k/fc2C3
         xgcq/hfzsYQTqmiHlOWxfSdCELgBaqqq26fAypV9apXr48In9yPkvDWdhPVmYSUia/nr
         Z8Nk23Z8gXCqGTBnzz8jBYf8P2DEv69/1moFvS+9a1t1xrH8Pm0CJWxMzsI22PgUuTvt
         GGaammutl2fmCdQN/8MPDiSwU1uh8tVrWlOijapdqSrjnx5FYfYASVvm6EzP5SZ06X55
         1ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762536; x=1788367336;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=60ICzOSokLmFbW+aEUbh3rqJ5JJ2ffZEu6ut5rD8ZZQ=;
        b=beSVblWZl0Q9TOQLD+gwX8ESGaPOBLbYxSNuCUGHOSVsJ3N6vURKi+saSitJyNFx9v
         kN6tfEqgpmgmveCYMvr2nPBBgdUXwAG6GSzA6wjpaLgIbqDQhP5LpwuUKT8GP5zJ5/Jy
         ii275AFGwt+sUcZOyNH5x3b/kyyLhRLsTCVWDN9NxraBNKRhAaCCVGekR+bUYM0mNRmf
         CqPAz8XJs3Ki8xp2QkyzWv2jvxHmgDR3gvjzxR/jsxNuyZdy0Os6kOl0ex5vBzkQ/X5o
         0JuoBQjxZ4s4Wmj8/OJEx/AV9XL14w7xTF9e3nDE+xezubJDLK4VvKIpphnLUpEwmjvY
         o/Nw==
X-Forwarded-Encrypted: i=1; AHgh+RqGa1zUR5JV1LSoI9e31M2D0JcIePI3DSbe6Vq5ayyDY7zOvHNGPLIR3iUWXY7kPr0VrEZcyZAjyINkjNM=@vger.kernel.org
X-Gm-Message-State: AFuF++ll1Fgh+Ov2G2XArlkT/omd1nuKif5H1NpogkUWfk7Bu3/cOTvG
	fH0HfFJ8pNozHJQiaot2ypeiVbhs0UGLKPABd8WOnT6wVLmVfRTifcMXqN/7ZA4hHvGqpB2uu6N
	uG5lulA==
X-Received: from pfjx5.prod.google.com ([2002:aa7:9a45:0:b0:84b:50b5:d431])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1709:b0:848:6f5c:a327
 with SMTP id d2e1a72fcca58-85376488d15mr13781436b3a.15.1787762536088; Wed, 26
 Aug 2026 09:42:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 09:42:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260826164214.756512-1-seanjc@google.com>
Subject: [PATCH v2 0/4] KVM: x86/mmu: Fix pre-fault and map private loops
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Fix a bug in the pre-fault path where KVM fails to reload an invalidated
MMU root, which puts the KVM_PRE_FAULT_MEMORY task into an infinite loop
(although it's breakable, so not fatal to the host).  My best guess is that
the test started failing once PREEMPT_LAZY was enabled by default.  Note,
the bug is *really* easy to repro with a to-be-proposed patch to have KVM
do auto-pre-faulting[*], i.e. prefetch surrounding pages on fault.

Then harden the similar "map private PFN" to also guard against unexpected
root invalidations, because Sashiko keeps pointing out that it's theoretically
possible for that code to end up in the same type of infinite loop.

[*] https://lore.kernel.org/all/ao4CufEI_pRCjbMF@google.com

v2:
 - Collect reviews. [Rick, Kai]
 - Tweak the slots_comment in kvm_tdp_mmu_map_private_pfn() to better capture
   the nuances of KVM_REQ_MMU_FREE_OBSOLETE_ROOTS. [Rick]
 - Call out in the changelog for patch 2 that simply warning on
   KVM_REQ_MMU_FREE_OBSOLETE_ROOTS is flawed, but handled in a subsequent
   patch. [Sashiko]
 - Make it more clear that encountering retry in kvm_tdp_mmu_map_private_pfn()
   can only happen if there are KVM bugs. [Rick]
 - Set r to RET_PF_RETRY when a stale page fault is detected. [Sashiko]

v1: https://lore.kernel.org/all/20260806214050.78058-1-seanjc@google.com

Sean Christopherson (4):
  KVM: x86/mmu: Reload MMU on *every* page pre-fault attempt/iteration
  KVM: x86/mmu: Harden "map private PFN" against unexpected root
    invalidation
  KVM: x86/mmu: Top-up memory caches when retrying "map private PFN"
  KVM: x86/mmu: Add sanity check to detect stale page faults in "map
    private PFN"

 arch/x86/kvm/mmu/mmu.c | 48 ++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 16 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.860.g4b6b3295ed-goog

