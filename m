Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C85E342523
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290840; cv=none; b=FKCu0BKsEzj4Cn+Uvo2lriJWyYNUFIoHq4Z4SZAERqacBsZQACTwwXYCgjG4nenuuA+uk+JoslIUViZ9Z+VtMWefZe1NTq5shO68VjyNdcIAmLJ+jTdWf74Wr7ZN1sbE2TN1OT+0tNS66OQn89L4AzOpdmAmhYK8TXRrIdrih14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290840; c=relaxed/simple;
	bh=ZfxlxtmL3f3PRGLmnA/UFU+0uUoCd85J9y/mFCt9dxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IwjJ0WSB5I6qf5LvMp5hLI3k73P5s9TG0I3tlqY4FqMiyWB4OGvBoA96EMWFm7glSx3GEh5DYErdfFMM1K4Y2i5g3+VFIAwvFI44IR4MVh0wztsJs8hlnXGL82BMZxu+8CHkBab6YRUR0wfR/04SCsZGfrvzWshRmlolfAieBOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=CMtqfJvy; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="CMtqfJvy"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91b55859245so18234326d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792290836; x=1792895636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HeSnSeSZP+b+6MzP6ewtTRyYSL3RxjlUFlHftt5R+jo=;
        b=CMtqfJvy46Fu1j6MExudMxmUp2GT2OE0bSguoLYv0MphSj/eGgo4ZYP0maOHYiCUkS
         AZVbUzj3tcQV750AeRXlEW0QcZrJ338gskkoSkSGRyy0gMjUjpIQS4VWHNtubpooxxNF
         YZiUT0ArxEvSiF829KEyXk68lukAz074kX/pk0Rsbfd4QsCmTTmD9ePZj7XU4nxaGd6M
         E23oEB2HiI6SEgO9LMGHRRGgMBCwkZXfvQESz3s/lopaT20RG1EHev2MIpz5OJ6hpY3O
         M0Bbnp30gTq8OP7d+m/viHwNICNIJk5t77IJLCueY08jgYiB889sfDEtodLMGBXJNg78
         hHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290836; x=1792895636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HeSnSeSZP+b+6MzP6ewtTRyYSL3RxjlUFlHftt5R+jo=;
        b=wgi55WV8Y3b2jspEjTCRM1beO/+UTsP37cQ9WDIiFbMbLv3Op/9qBmc3F9h7B6+NJr
         cDugwof2oqz1+EXVrCI8QIwuimM0NH5UFB3o0lc9g847E+OOleC/3daXKeXvB+IiPQnU
         5O/XHBtS1M48cnAFYsMi7skjnCRvM0PjWbQ3So6pyF0D7Arz1qXO+zy2uDE1O/chzOZk
         rY6GNr84EktKmpDKcqB7iEa/Dz5qHxaL2Fzfe1Bt54fdz4RQymU3hpvoaGFgElBEVVz/
         BGJSNozDX2vaCgXs86CxkbT5ewUPd1pvxM5ediNQolRZiZz5qNoUuubHsebeN7+HYjuG
         5QNw==
X-Gm-Message-State: AFq9FYJbHXWHpgLp7B6xc2ydR+Fkf39DlD/WeCFt79bi2r1RV6vgChI/
	4rrIDQV89yjMcBt+GZptm7StL9FarqPswHv8wVA7MuXL7sa/wevv4XQ+T9LeF05eIWA=
X-Gm-Gg: AYBFou1AqqDKiscXLhVf/Ppuf10azvTbsex+rTKhd9/qU/WzB6nHkvX5dIiwp6gEdsq
	KN83YyMClxI6MisLJCye0yQ4mpGPNi3mr75JPb6CjNNDl5ozkFhRnnsFM7wlTlZWYAf6n0NsjbS
	x8Cr70nUrXvLKotllxnuAn/9L0KGPxGoRfnd+8AedBiZtHKbSF3OPfu0cZy2CcrSNF1qi88WWCu
	H+f2ZnnheRVg72DrShgV1XczPRjfqiIP9w10FijE9XYCv2QCBD8lSB92TN8NR1LqOGG2l8f38j8
	IuznnkIH/Bo6gvbEL78AOHuQN1ICWuu2qXr7tPvhF+amMI2mQBOvFz68RVXLscAVFWWK/7Jp7IX
	YiZdWlOfJxNQihASASC16lJ/wHDJSz4heJg3YR/s+v20QGk61s2vyaH/ezeVfxOjhh+PPsCeF3b
	K1KOwSQiY2jkaonptD4qwF0zP9DbpkfseBYPZYOQrtD95NdQ+i63L5i9/lLBIgeRvwXgOBR7YGA
	GeolekqTh8yNiyWcK1CfmD6jRV/XUGpmlMXaudzecE64r3VnKGy1zOJv1Nx
X-Received: by 2002:a05:6214:2a4d:b0:91b:5d39:e13f with SMTP id 6a1803df08f44-91bdf517971mr74943116d6.52.1792290835889;
        Sat, 17 Oct 2026 19:33:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba473easm61705926d6.17.2026.10.17.19.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:33:55 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	pasha.tatashin@soleen.com,
	mhocko@suse.com,
	stable@vger.kernel.org
Subject: [PATCH] mm/mempolicy: apply bind policies against the scoped allocation zone
Date: Sat, 17 Oct 2026 22:33:49 -0400
Message-ID: <20261018023349.1697434-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QEMU fails to start a guest with a VFIO device when guest RAM comes
from a memory backend bound to a movable-only node:

  vfio_container_dma_map(0x55b1b1317800, 0x0, 0x10000000,
                         0x7f39a2200000)
    = -12 (Cannot allocate memory)

VFIO pins guest RAM when the device is realized, and the pin faults
the pages in. io_uring fixed buffers fail the same way. Faulting the
range in before pinning lets the same pin succeed, since resident
pages are migrated off the node instead.

A long-term pin faults under memalloc_pin_save(). PF_MEMALLOC_PIN makes
current_gfp_context() clear __GFP_MOVABLE, but policy_nodemask() tests
apply_policy_zone() against the caller's gfp.

The bind keeps its movable-only nodemask, and the allocation finds no
usable zone:

  page allocation failure:
      order:0,
      mode:0x140dc2(GFP_HIGHUSER|__GFP_ZERO|__GFP_COMP),
      nodemask=1,cpuset=/,mems_allowed=0-1

  Call Trace:
   warn_alloc+0x136/0x150
   __alloc_frozen_pages_noprof+0xed8/0x1720
   alloc_pages_mpol+0xaa/0x170
   vma_alloc_folio_noprof+0x65/0xd0
   __handle_mm_fault+0x137b/0x1ac0
   handle_mm_fault+0xa0/0x270
   __get_user_pages+0x250/0xfd0
   __gup_longterm_locked+0x116/0x870
   gup_fast_fallback+0xcfc/0xdf0
   pin_user_pages_fast+0x47/0x60
   io_pin_pages+0x9a/0x110

Base page faults fail with -ENOMEM.
hugetlb faults fail with -EFAULT.

Check the policy zone against current_gfp_context(gfp), so a pin-scoped
fault falls back off the movable-only nodemask, like any other
non-movable allocation under the same bind.

Tested in qemu with a dax/kmem movable-only node 1. io_uring and VFIO
pins of unfaulted base pages and 2MB hugetlb pages now succeed and land
on node 0 (correct). QEMU now starts with the same backend binding.

Fixes: 8e3560d963d2 ("mm: honor PF_MEMALLOC_PIN for all movable pages")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 70298fded1b4a..0884c629670dd 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2302,7 +2302,7 @@ static nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
 		break;
 	case MPOL_BIND:
 		/* Restrict to nodemask (but not on lower zones) */
-		if (apply_policy_zone(pol, gfp_zone(gfp)) &&
+		if (apply_policy_zone(pol, gfp_zone(current_gfp_context(gfp))) &&
 		    cpuset_nodemask_valid_mems_allowed(&pol->nodes))
 			nodemask = &pol->nodes;
 		if (pol->home_node != NUMA_NO_NODE)
-- 
2.53.0-Meta

