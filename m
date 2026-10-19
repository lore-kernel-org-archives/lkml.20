Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD320459A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792372335; cv=none; b=W1MLSjL+ePk1FFL8f1BytvE+5LXl6EdZOcgBZZCn6918BrMNK65JKSkJleoqPujKJa+CF9bZ5X34aHcQ58PDbzLBmP0+xC9Z4VWuxqF4m/VgpKawM6qYv707daXWivLLCgfeR1avRDCyTTUqfTHYLf4PmX4ISKrzfoDgTfZFH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792372335; c=relaxed/simple;
	bh=YuNuB52kvQgcX349nqKkv4i/2o2bUEHQba83Zru1I+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inJVOPseio87xnGbnhLAdo1AgSyjo7FNTejz8QTNLAKVoDS9DxkiQ3HFlkkZ8kYExH3o/ZGuA0Uq/Qj/jACudbtne3gzPwuYxTBxUi1SFKAAgj6Qp8ILaw8x6+7l8Es+/eAwjxURsYgUrmMgb/e1Isb8GZRGecIN1WVxlQRim00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSfTWYOU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSfTWYOU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso7593165ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792372333; x=1792977133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iMW1/+hYAmRNDgdBSskmyjNh4Q5P7SaRq2YqDn9vmg=;
        b=PSfTWYOU5EUIVR1NV5JpVqiAK4657QXW4DL7WbAH7p+FW1e9huBC8x05Oysc3pbuw6
         8QLZIQlseAOICPW+tzujajx1uVcGqLn2kEbXeRk4mOfAfF2B24sn9jXPnRAp0Qq7nYIi
         Lf/ArIDXjFqsU3ZGM26D0dPWx2kLD+D634Vhv1fgPIbiGxSvGUzCt7GaeS4Xh7FqSL09
         Ws/hdqYNyze7iy9/cVurRg1zjHUowD/8iNnQBa9Soztry5hKs6V/P3N+Kz4bv5XcHHXG
         T+gdoBXJ0r0LM3AHwu/GB4vPgxXZFK5Q9z30OhTQoPaRj/B3OJgRgHW4qs6mOO+UC2cA
         y18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792372333; x=1792977133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iMW1/+hYAmRNDgdBSskmyjNh4Q5P7SaRq2YqDn9vmg=;
        b=zwhXnCCLpiSZMGxyxvrV2GsXUqSqL31R61/BJgSEJVKLoJH6hAB38bilnydYUqU6ub
         XhdeXsWdAYZ5wHgr+ma2issKzsPCLGohUyfBAMivdMBSH9Gz+zM7hYrAhTMoNHcDbkQt
         VtgxC3pz2gdiqCFzMaYu+sVpciyj2COXzNHaspeJ+TRds1RYRmtxFtmjPsZWiTFEjcbG
         AeO76zSu8aqJoSHtA+vYZB0rBFPir+x065uKNzrMj87Z3CxqmjEhCUNcqR7dHOYdMGpX
         gOGojoT+BDkuxuDFupZiT1BxaMovHpn+emCm0vTTKipVbmJWiVsban6xzek9VCbsInAS
         X9OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFQ73rjTC12+wpL5QpNhhzS3yCJ9KMWari9EDbhU5kRjGlZxXymVCR6VPsF+yqjLxjjn4jmF79mZ8wWoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtnIKfkBU7wIshELqBaP7IbtvheIuf2qoKwBA74WwLtzA2g8BX
	0Lxv5D0ahd7dqlKmMomFLW0jQZwyMFR93LAhN4HOmIAtuMyMlHWIn3EY
X-Gm-Gg: AYBFou16yhdTAoX6Dl88ZHPOdCDsURmfgFghEdapJBrfpV/6/1G2bqqugbYUHHcnFzV
	s5KwxgbQDMZdyuWpyuAT//LvTYLhLwX6Nwtny8N+04hwjAjF+diCNuSwIA5Ai7F5UTRFnOEn1Xo
	mW0pmkduVTV9ls+FPQoXfLrWYdhftaOSBxMTwiBpStaDL1Yr2XJVkN09hDHf5KL8Vvo5uzB1AlI
	/ip0UxhUop6j7YHwt75Z0hMl9G0DcNvRmurZJtEwZEPJPFxZvvDkKbYubKrBR49FzzxGfAmb2H9
	ELR77uTB3rZmu4CfOCV2tOhUsh7k0s4LaRub+9PQ/uX7UuVpWPU9nNhNFun45T3BgbFACtP6kAH
	QearntDhE7UGfTOYAD1Loy69IahizrQAQHmIY0xnairD4PxiE2q1X7R5w1EUjTM98okJDRBQD0w
	GiW0Tm4mXDOrwMS4GCChmE3Ik+teJa4WPoTc2rjvT9ZBSEVUTByiHF7Scbb2FkXYzuEHg4TxLqu
	GWozpfC30PTMtSp0DfLaKlA8Qds/e2dpjLHSaWxFIQEUAGxFK2+4qax
X-Received: by 2002:a17:90b:390f:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3acef5f5bd8mr5441712a91.59.1792372333228;
        Sun, 18 Oct 2026 18:12:13 -0700 (PDT)
Received: from 1u1g-b650-0212.nvidia.com ([72.25.70.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm7011793a91.1.2026.10.18.18.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:12:12 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mm/ksm: keep soft-dirty and uffd-wp when merging a page
Date: Sun, 18 Oct 2026 18:09:34 -0700
Message-ID: <20261019010934.697895-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace_page() maps the KSM page with a PTE built from scratch, so the
soft-dirty and uffd bits of the PTE it replaces are lost. Due to this, a
write before the merge no longer shows as soft-dirty, the next write to
a uffd-wp page raises no write-protect fault, and because the page is
mapped with the VMA's normal permissions, on a uffd-rwp VMA the next
access raises no RWP fault.

Copy the soft-dirty and uffd bits from the original PTE to the new PTE,
and restore PAGE_NONE for RWP VMAs, as try_to_map_unused_to_zeropage()
does.

Fixes: 0f8975ec4db2 ("mm: soft-dirty bits for user memory changes tracking")
Fixes: 63b2d4174c4a ("userfaultfd: wp: add the writeprotect API to userfaultfd ioctl")
Fixes: 2d427bb01639 ("mm/userfaultfd: add RWP fault delivery and expose UFFDIO_REGISTER_MODE_RWP")
Cc: stable@vger.kernel.org
Tested-by: Lance Yang <lance.yang@linux.dev>
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---

Notes:
    v1: https://lore.kernel.org/all/20261018122957.526467-1-samarth.colleges@gmail.com/
    
    Changes since v1 (thanks, Lance):
    - Fixes: point the uffd-wp and RWP tags at the commits that make the
      registration modes reachable (63b2d4174c4a, 2d427bb01639).
    - Shorten the comment; the uffd bit carries RWP state too.
    - Add Lance's Tested-by.

 mm/ksm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/ksm.c b/mm/ksm.c
index dbfb8f98b189..de144fa07c49 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -34,6 +34,7 @@
 #include <linux/memory.h>
 #include <linux/mmu_notifier.h>
 #include <linux/swap.h>
+#include <linux/userfaultfd_k.h>
 #include <linux/ksm.h>
 #include <linux/hashtable.h>
 #include <linux/freezer.h>
@@ -1463,6 +1464,17 @@ static int replace_page(struct vm_area_struct *vma, struct page *page,
 		dec_mm_counter(mm, MM_ANONPAGES);
 	}
 
+	/*
+	 * Preserve soft-dirty and uffd bits when replacing the page.
+	 * Restore PAGE_NONE for RWP-protected PTEs.
+	 */
+	if (pte_soft_dirty(orig_pte))
+		newpte = pte_mksoft_dirty(newpte);
+	if (pte_uffd(orig_pte))
+		newpte = pte_mkuffd(newpte);
+	if (pte_uffd(orig_pte) && userfaultfd_rwp(vma))
+		newpte = pte_modify(newpte, PAGE_NONE);
+
 	flush_cache_page(vma, addr, pte_pfn(ptep_get(ptep)));
 	/*
 	 * No need to notify as we are replacing a read only page with another

base-commit: 48fe11c8d0f1e4e59426a3606f20ac1130b6d8dc
-- 
2.53.0

