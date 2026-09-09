Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43D47DF85
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947496; cv=none; b=lpzoi6m9TC01nWSjmwxKRIOLidWlazRMF3tT9DfFw1HJrz/G/pe6ldSLd47vq50LNQn5CaSDo3LDF0LzBvjrwtu+5M568SbdIKaaNPGRWpDABeSzvqj3/rFa7h8oPTsfNBojajYedHrt5ZLwNQopfa0GLVNVaWgteysRSWYuP18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947496; c=relaxed/simple;
	bh=zEN3i+bht4wJK9nMYZ0X1V5lt+UAKAX+zLdvRlqVUhs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OYgvVnLVdXLGksBZRAifsZklMhPd0aSiu+ecF9YRBLqCdyKfMOaXsPO9zm77nYwoYXSHC9o3tSJ35sVH0ly/w6gytnuBdpzzGIofTi6CIj7dgD1BvPwm9IcJgvudalqrcrDSppOD3Rs2732epOfYMat4WTnJ7RIPg7jsI9fkRHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kGnX2DKj; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kGnX2DKj"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66fa10f35caso5178187d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788947494; x=1789552294; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mn+TRjSVVIAZoTaeIYbM//CzX6IvKNmptuaikzRYa5A=;
        b=kGnX2DKj5lnH5TOHANwvHWEMVwQIEp3f4GgGRZXADv0eNY2m2fw8q33D3/MO9JfAwT
         1ZcJZVgZQkSIDSzb6T5+E8sqTQg50xUC0+CCDRjDctfJAGKrlcSwy3UTnhB9Z4ENzo3x
         OPnvb4MBYE4UpXz6RCRFEQL/jktk64V0atEPf3rIwAcfpW9cTn0oThrLP9Y5xzRATvnx
         Mn0HTU8OPvLjn2OPvXDmGjOAJH7D//Mz7uj5WB9LCAYmppi0mer7j62U++HoqKCUsCgW
         SDECqbINvgOIRG6fubgzAGl3hGUrza5t3QDpB8YQpDTH1uuxa70krfzzYAD8aCv5vA4m
         4W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947494; x=1789552294;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mn+TRjSVVIAZoTaeIYbM//CzX6IvKNmptuaikzRYa5A=;
        b=qnYH9T63+SIveztyB/UBZwKiTcNMnsz0pZwku74DlKwUbGsrFB5yUI1lKGQj9chRdQ
         aK0jT7N6e3iURY7ZkFxGoN94uggF5Lyc05dqypbA41QuiOUESVIEeBnnXqxPOLOgiEPw
         VklqShZOJU/7nrZjGjuIjQsdkiEOPIBq7UoHyjMOBwD9nw/PluJBMQLkleMTKr4LLfVU
         zdWPN+A7eaWPMFai7geBUVXBjl4111Qg4vZLdKw01q4ezIjDxHtW3Z3qgnzw9d8hiWhg
         HsQDYzxWNRsGrfgzPt+hp1WjL94t9Lwp+EuL8YokHNHGubqr501DJVRjUQ0e5c0Yz0zF
         iTiw==
X-Forwarded-Encrypted: i=1; AKwUvBzwpEShonH78uHYZe2qMwbdgT/Ozq7h1mrwPLVZEUrIPoW3m12EpFeNcrzOTbsKe20GfmBfhyAE1ngu93Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n57yFfEnyY3RsvoA6BQKXYxKie7w9d+AQOGlxfFRfgS0uejLyq
	Xoz574iRtSwYDNu0bKXQbEwEApP1h9RAdwhKCeYPlX73TpNGKyt69IS373V3S4sGww==
X-Gm-Gg: AYBFou3ECV87Qu9zKUJApTIL0gMtLk2N/G1z4jdR+v/A/0fEsjOgcJxXi4dpQbST0Z8
	VQGFOCguzJm6iE9NeNorTiDGZivXQ62Ceh6zvpA0jvl9p/92tGBnp6DpXlrK0g7Gm/zJZOvOeBL
	gOWN/W//cs52HUxLUROC8bsZSg/ZMDmxcFbOC3aReUW4je/V5mZdw+v8xS4L83gc/h14gj7Doj0
	m1v7y+ALuZv0HP+yc3kqm0PF9aeWh/q0ssEWewRP17eSMpSbGEkd4y2WXHajPZEMfwH1hlm4x35
	7evXDDbpNmc7hivbbkySm9ZlVnri2vHvPh/NuFUYDW9xsd6nTDUOvugpWUoB7aI3Ye9SS0tr5er
	0egfpYeHLKxlFd2Z1/HjpZ6yXMx0gkd55YYdEQcGoBl1+mzzEffvJp4iH4CjfL9U3ByGcMubPog
	lfmPhoAChuuGYsI04DCkO/WrU4f+Ja0q46Qz8juyNL7wYGDbO8HSRuBDLAXbmZU1pMQKB56Dr5O
	dXPXXxJy/IvGHkDf9ngSETpaLih9QculC4TvdG7ZwzuevwcdBxZBxlsUCU=
X-Received: by 2002:a05:690e:b8d:b0:66f:c774:5b4 with SMTP id 956f58d0204a3-66fc77411b8mr7040210d50.78.1788947493066;
        Wed, 09 Sep 2026 02:51:33 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8749af79c56sm78820707b3.22.2026.09.09.02.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:51:32 -0700 (PDT)
Date: Wed, 9 Sep 2026 02:51:27 -0700 (PDT)
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
Subject: [PATCH v2 05/26] mm/fbatch: lru_add_del_folio()+folio_add_lru()
 after clear_lru()
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <b2e312f3-6909-5496-195f-ab71b45970ac@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Most callers of folio_test_clear_lru() then proceed to remove the folio
from its lru, and add it back at the end when they're done (if still in
use). But isolate_migratepages_block() and check_move_unevictable_pages()
sometimes decide against, and release immediately with a folio_set_lru().

Which usually works fine: but there's now a small chance that while they
held the folio with lru bit cleared, an lru_add fbatch drain came along,
and had to skip that folio because its lru bit was transiently cleared
(previously, the lru_add fbatch drain relied on finding lru bit never yet
set). This risks leaving that folio off lru, unreclaimable until freed.

Fix such cases by trying lru_add_del_folio() (which only takes action and
returns true if the folio was on an lru_add fbatch), then folio_add_lru()
if it succeeded: invalidating the old fbatch slot, appending in a new one.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/compaction.c | 13 +++++++++++--
 mm/vmscan.c     | 16 +++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index a049415512c6..9e045a90ba21 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1204,7 +1204,13 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 				     !cc->alloc_contig)) {
 				low_pfn += folio_nr_pages(folio) - 1;
 				nr_scanned += folio_nr_pages(folio) - 1;
-				folio_set_lru(folio);
+				if (lru_add_del_folio(folio)) {
+					lruvec_unlock_irqrestore(locked, flags);
+					folio_add_lru(folio);
+					locked = NULL;
+				} else {
+					folio_set_lru(folio);
+				}
 				goto isolate_fail_put;
 			}
 		}
@@ -1293,7 +1299,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 	if (locked)
 		lruvec_unlock_irqrestore(locked, flags);
 	if (folio) {
-		folio_set_lru(folio);
+		if (lru_add_del_folio(folio))
+			folio_add_lru(folio);
+		else
+			folio_set_lru(folio);
 		folio_put(folio);
 	}
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..4e8d5cc34f07 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -8093,17 +8093,19 @@ void check_move_unevictable_folios(struct folio_batch *fbatch)
 			folio_clear_unevictable(folio);
 			lruvec_add_folio(lruvec, folio);
 			pgrescued += nr_pages;
+		} else if (lru_add_del_folio(folio)) {
+			lruvec_unlock_irq(lruvec);
+			folio_add_lru(folio);
+			lruvec = NULL;
 		}
-		folio_set_lru(folio);
+		if (lruvec)
+			folio_set_lru(folio);
 	}
 
-	if (lruvec) {
-		__count_vm_events(UNEVICTABLE_PGRESCUED, pgrescued);
-		__count_vm_events(UNEVICTABLE_PGSCANNED, pgscanned);
+	if (lruvec)
 		lruvec_unlock_irq(lruvec);
-	} else if (pgscanned) {
-		count_vm_events(UNEVICTABLE_PGSCANNED, pgscanned);
-	}
+	count_vm_events(UNEVICTABLE_PGRESCUED, pgrescued);
+	count_vm_events(UNEVICTABLE_PGSCANNED, pgscanned);
 }
 EXPORT_SYMBOL_GPL(check_move_unevictable_folios);
 
-- 
2.51.0

