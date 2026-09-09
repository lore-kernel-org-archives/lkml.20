Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944333EDE63
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948093; cv=none; b=EKlmT6XyK9ZqWmJ/ZzRSHfsPxZHmSOpm6QNcLrsBdkhD/EaTdoLbWkiBIAiynb+Rog+xecf3CKmwH6EQhP+upoSt6CCNGBrk1ailXa29VbnRvNukwezEb7seOisrJkfQuGl0TgMfAw6xtXfJJT0WCYcNfM/+X7NrSTSDfMW0xD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948093; c=relaxed/simple;
	bh=XRPintYB66K90WWvosFbfNFMrCSstXNSaa8RFhDin48=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hoSYBqXyOVzgXxoK8pgUd7yb5wszXOAaF2PcKxSPuIWe9rkMOxHa5I+8m3lMReYQDebPX9T2npOMUK4BcuJgB4VIXu9dojfh/P7QuE3wYgNikNYsEy4wUBiNZElOxfY8k08T0Y5KKoZDuSnNMFmPKQ14lvAO5eV88FcuiNN6mKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=knKN5ddo; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="knKN5ddo"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66fcf87897fso4303946d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788948089; x=1789552889; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNBljcBd5pVR40/qSQbRzR+DUQkxJ6419XWxuVBt6mg=;
        b=knKN5ddo70WoGAqNT1cXYO4RFeqwvEyrgjfzjOTWh0ZI7z0eldN3H9OZHWMzP8Acyc
         tkz5Nq+NpL9Cl5yMr8vTo0h9DtLwMvjbjnDgVE8UFTKEmvfFzDvpIlPVvcrimFFtQsEo
         9LMLjq2kA6FBn+PaMr1Wioy/GDYPYiJ+jn72tqftRAgcEk9VbaqC4hfgdzSPCARhEotX
         w4SSP7FiMBXRm2/0SbJmABzHUA1B8TZXd/3bFMQTALw7vLkROtUu6a2BAfQX7j4rcz1J
         dtvgs9uG01uy8plVKUXdLdoz0XvRykaSAj+NBOUpnmtxaC9UCWL3SAKZbwYtnXRJGMsw
         df8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948089; x=1789552889;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNBljcBd5pVR40/qSQbRzR+DUQkxJ6419XWxuVBt6mg=;
        b=lz4Fbf08LbxyyDXl/9108WGuFPIZ2f/uFIkw0qMeTZ0a4RhERsV2Fq+FWzj2IJ+pi8
         z4EUZ0wYWzfJW4URx9EpjwdxutiDMEPDBNg1FVFgMWVzzYVqqFBBGGqnDBxzURRUtSoT
         CcsXFakjtt2bRMmSU+TG/EHahcfsa1YLSucyroNRy9GyeOhjUI2zfr5eVGhLgkWCtZ+3
         kmNZp8kp1boJdLvaNNLSEZyQVQOxj2y+xoITw1QNclRpLVsXJRNQmjxt47dVa1ZUbz+b
         nA9b8FmaqkQTn/Z7niqG7jXFvRrDEIV1s6IQRt6wFyo80RXuFHpO7FfXAI/ss9nBmif7
         C5JA==
X-Forwarded-Encrypted: i=1; AKwUvBxa3u74kMDRWZ6nlTuADHk6GqDJ33CEQVIY7OmZbSW2lh3gYofoHvrMdhFkVSVv0qE3MlO1fgvOAURiDVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lEB3/wXxX7kNWTQ1EwyPcai3rjn+twy/QhXJjVEbKJxDIHcWsw
	1xt7vfIXulydb0jChsP/oezY5FeK1eo+oOWi161pkB9vNoyVrwv2I5/UxdGoVjT/wg==
X-Gm-Gg: AYBFou3GCFDaEi1xRbR0Rs1qQbitSLCD87DA3IFAyMdxV8EgH5hBVSR24DJ0ihFcgUt
	3MF0mu1WTry4BDs92SnetwR8EGOOyAXv2MbnB4saPbCKlbrCYoBiHdOFEsDcogS6OGtGyqe2XZT
	v40wWgB/jEbd2qTM5FTmMH9EZr0eNnyghJWCTB+UsuL2Cy3zNa028KiFahmALJzMq6S/wRyWDOp
	L12wO84k4s4F8YCjKBZjeM7CF4b0blU3J09jS73UWty1NIa5Q7jX4+d/kM8hBqoF5xP4be8CZ8k
	GloXHsT0j8AcZurkrfLDw+8pf3NK8buqDWBSHUFPtxPSQmkFe6eM5uMafKb6U+XAbhyNKLMlOsv
	MhB4nY1e9sFELrWoHrRkwaBFOkecSVddvWYsiMXG9i17olkSI5nwM4YnW4xf7MwWymmPqVhf+KC
	OlG7kJvOxQl/AmPZeFieaCbOf+1mYRGuRoIPnFCDK2V4hb+QU/wpZHr278eQ9sYSpPtpUt6OLSe
	xk0SXwSIicT59kybSMNmtovJ9Ib+mPYtteyh1/PGniIqe3BXSn9WiTHl38=
X-Received: by 2002:a05:690c:88:b0:864:6f4d:ef7f with SMTP id 00721157ae682-87121acbbc5mr139590577b3.7.1788948088169;
        Wed, 09 Sep 2026 03:01:28 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714a0b654dsm107264887b3.25.2026.09.09.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:01:26 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:01:22 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 10/26] mm/fbatch: remove several uses of
 mlock_drain_local()
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <9633684f-e5c4-d92b-8295-5cccaa18fc36@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Remove several uses of mlock_drain_local(): they were workarounds for
when that sequence of operations tended to leave folios in mlock_fbatch
with debilitating raised refcount (and no good if the task changed CPU).

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/huge_memory.c | 2 --
 mm/migrate.c     | 2 --
 mm/rmap.c        | 4 ----
 3 files changed, 8 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d53e5443b802..3628b5bd1359 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3570,8 +3570,6 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 	folio_remove_rmap_pmd(folio, pmd_page(orig_pmd), vma);
 	zap_deposited_table(mm, pmdp);
 	add_mm_counter(mm, MM_ANONPAGES, -HPAGE_PMD_NR);
-	if (vma->vm_flags & VM_LOCKED)
-		mlock_drain_local();
 	folio_put(folio);
 
 	return true;
diff --git a/mm/migrate.c b/mm/migrate.c
index 15b45832bcfa..1939d6ed19c9 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -447,8 +447,6 @@ static bool remove_migration_pte(struct folio *folio,
 				folio_add_file_rmap_pte(folio, new, vma);
 			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
 		}
-		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
-			mlock_drain_local();
 
 		trace_remove_migration_pte(pvmw.address, pte_val(pte),
 					   compound_order(new));
diff --git a/mm/rmap.c b/mm/rmap.c
index d1819fd69938..1ee42d60d77d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2396,8 +2396,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 finish_unmap:
 		folio_remove_rmap_ptes(folio, page, nr_pages, vma);
-		if (vma->vm_flags & VM_LOCKED)
-			mlock_drain_local();
 		folio_put_refs(folio, nr_pages);
 
 		/*
@@ -2771,8 +2769,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			hugetlb_remove_rmap(folio);
 		else
 			folio_remove_rmap_pte(folio, subpage, vma);
-		if (vma->vm_flags & VM_LOCKED)
-			mlock_drain_local();
 		folio_put(folio);
 	}
 
-- 
2.51.0

