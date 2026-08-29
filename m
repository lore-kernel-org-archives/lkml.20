Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4582E417BC3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030581; cv=none; b=pBKNvf0KKFgfIXSbRo8KnON8D82ECEHORaVE09XAsmZ15zmnkuCf6W0aEJTqcSvcP0t2lHpQoQUngDkUIwWRVltvDSCKPp8xovQTP70TgaULvxX7ir1YNQJFSc2uS0B5Jt+W522DeVpbse7VlInrhTROCD+RU64VhgqsEa+wigk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030581; c=relaxed/simple;
	bh=G2ktRMgJTq06/55atnVs92oo/YszbeBoCTRq3W3l8TQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIwd8WhMvliLL1TL6TCURwtQVS/HMYIyn+vG+4Rxhq4Y6fliiMOq6xzcKGhXY6NIJmsclPx3IwO2xUfNfpSRrYO+GoCaaRHvgkyDWJ+71MP0TlA5wL7K4yIH+8vWH8CwwRQkvxf1RZnk/qOQAN9J8wTbqYBWBRj5xL2OrLjpskY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=bsbIw8F2; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=GfXcl/g1; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="bsbIw8F2";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="GfXcl/g1"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIZHQA1326075
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=7Jpu
	g6oWTGrHeweZlqYEb+sOFZBCujX66E+4i6PuPxA=; b=bsbIw8F2ayaMsOV2QzU9
	C2PLOJKWGm+4XRx+SYenC+eFfeyKSFFFbQG/A9J4eH5zY9h3M2boY8Wr6Zsco3b9
	9G3hl9KB0wZXSuPAPtKV1SZuNtTMye7n61iYJQpZ+YD9pUPrcKx+JA0YaMu99Dq2
	cbSjWjp/CMAy7h7v4P0NDzI0UQx9z6S/2dTqWzczKw18KhMOn5K0RcduIZuYIhxJ
	Unu4/OCmAQzu74p6qhzsAe0mX1fv5zcLe1+92SvJ3JEpn1lAOWEQgD09JANHj2o4
	5Yd+pTWgPBibo/uon0ap20LGqpYEw2izxj9My/hlCYWZi7OEHc4HDCo3Bs23Lofl
	sQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbqxhb5vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:39 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ffe24490bso13420531cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788030578; x=1788635378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Jpug6oWTGrHeweZlqYEb+sOFZBCujX66E+4i6PuPxA=;
        b=GfXcl/g1vKWXV1LWyDvwu/kdpM6VjkliCz0Lk806Ov3aay8oSlyjFDEuLgm6o+HyuN
         Fk5bc8qk3sER05vVPSKaE/s7p3dmcEwN308DzWfWSMALho92mJSdOIX1bIkJIviQ2m5A
         sUwrgs070i7N/Jd0sHVzQcwrvEqrVVmcdONLWitecchAD5xx9cdOv2GfqynGpmRMjct/
         Jmf4F76jMdETMA73jSRSTUM4heIJrvgDOdsTNSjfXOC15L5dvJHi/Th+ub4XuJtJ33Ym
         OFue/RfnYFVKItMpN1BiKRzAI1zhu3Kfp1kvLAwoxwlESERT2aYBqdUucxtmNncwRLfG
         oEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030578; x=1788635378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Jpug6oWTGrHeweZlqYEb+sOFZBCujX66E+4i6PuPxA=;
        b=NZBvlfHEpFxwwu0xmhGHm/FgTl6Ysq4SD76ph7NIFNdyEbZF+XL0dbz2jfs5v2SCXJ
         iisfxkw3zih80TIDPgHQ0dTPLp2Bq6VrEAvwcGB8XZArC3YPzTON4AISvTVaruLiuxlV
         QmkNWHMZe1X8xc7+tZqjTL+lhIhP9UjKPjpgF6RcSNZy4vNLsDhFnTz2pcYWmJ2Qrg8s
         5gx+bfquEzu1/H2hdX1zDOwiTsMlikC9kyOuGSHWtGmXLhz2HSh7af8/1iXsTZKDMWyg
         C2rAOYswcOmeoE3AOr8CtIVoXCCtBH+gvUsKqeeKbSNFIcUQHvKFiGzGCs3wYqrs6dne
         RLyA==
X-Forwarded-Encrypted: i=1; AHgh+RozLLIRFWUkDGfrZrzWE1/kJxuqhX2CsGnEH7DEE2wjt0ioUFPhTtv/qiTB1M9H0Je4AL0gGFoOcsm2osw=@vger.kernel.org
X-Gm-Message-State: AFuF++l069hI69EcI6ULQS1r49wlrNn/eoKiCFBAOn9HMSkpcRiTHZRD
	XbTwDWcY3j6n3UrQJ41YcpGwOjo16VgQmG20JnUd5sw5XA3PLYVcCAfGSt1zKE3Kcs1CByEEbO6
	aMOqX2Fbln6AW3TW14eo3QpDFFfWGSP8qNklAX1Pa/1+b34uW2AX+9fXYTsbxjw==
X-Gm-Gg: AR+sD10EWpvkH5WBUxCS+0G2l1ShUHFvPA/w+Ca9ElcJvaUMChvgIWYvLrYdzNwDaO7
	yfIYBrstEZbCvFIG4QwSjg+mv+oXUn7tozJGudik1F7vQ9LSM9fm0nSKEGA6X25DjoTAVLl1Z54
	ohnpFSpDvUsjoL0xxL6A+3nDvvpKMv/pM57PkuznfKTv1u63y7wUo4EWfPGmi3aQ8cOF3jVGNcF
	GUbWW2KGygxxnaFtzHfhTXRwmwtw7W4HRfEczNEvSzix8bIjmE3/Lc2BacowMCuc01O81Tm6aPC
	OudvdrHcOvN1MJytoGj54qQZsRH+WMHR33o1JTkT3mxkCSeo0evUvnG0McxOhDamDuxOMqhh+t0
	+0UaWd3MjuW0l0gOpopXLoP5i50wsgwxkUANepVzmSw==
X-Received: by 2002:a05:622a:389:b0:51b:f857:cf82 with SMTP id d75a77b69052e-52fb93d5114mr170604461cf.8.1788030578218;
        Sat, 29 Aug 2026 12:09:38 -0700 (PDT)
X-Received: by 2002:a05:622a:389:b0:51b:f857:cf82 with SMTP id d75a77b69052e-52fb93d5114mr170603841cf.8.1788030577780;
        Sat, 29 Aug 2026 12:09:37 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm239150095e9.10.2026.08.29.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:09:36 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 29 Aug 2026 15:09:05 -0400
Subject: [PATCH v2 6/6] mm/swap: rename __swap_writepage() to
 __swap_writeout()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-b4-page_io-folios-v2-6-649728091117@columbia.edu>
References: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
In-Reply-To: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>,
        Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788030553; l=2860;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=G2ktRMgJTq06/55atnVs92oo/YszbeBoCTRq3W3l8TQ=;
 b=qi6e6/ntBcGd5Bt7IXAXtAUQphoFd5rvFHZ7YLCPOUHK30NGdCqvHAyO1e+iqX6QuXa87zECq
 p9V0LAWsCfxDlXWKV2uzpPOr/45TeS1J/jv2H/ASXR9LoR7RlBCqN9V
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX6A1tnmZ6pubZ
 V7gbh76kmZag+URvh6rytgPqaTMr/UDSyUmyeD+S6m2G311+B/g4+7zDmUceEIAaD//1sumrJFy
 zlpq9XaYrwDAatkp4Hd9sI3SFI8zNez6fVTn2O2syOURhOMz7rM0
X-Proofpoint-ORIG-GUID: pIrHISNl5yE7YJbTDux2KmZHpsRKFAbD
X-Proofpoint-GUID: pIrHISNl5yE7YJbTDux2KmZHpsRKFAbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX9mR54rKN039z
 Q5Crg80nrZ3QJVQh2ZsSQcy+SmsVL/jTT9h02H+RZKwi1OtbfeUc9ef4IhQPSvRtqR5LiHGxob+
 Hny2Fsfmwvi7vtvQDDmlqqCsQVhJrY9ae4eNh9pB1cVy6pU6YyDUkfWcDthU6GkX3Tf/saizNsX
 NabnlCCJSGUtl7XcljgjNQyzQGhMGYYasgARPs1PDDYy5mSpjfFoOzdaxtfOrhobXADlknSR8Gn
 55ArELrRcvDY/0U4KY70lTaVOYagBCP6uFexvnhpHpAQEtg9CCjX2BYnEkiS5vZbvqVpLNQhQoQ
 djH2C12MlmcwpG8sqA4BiqWDo3cYGvRlisxHW1OJb1ksVogMM1bq3KwJliY8Z+Bdz2wJCRvwF9V
 l7a7qLacPtBx/vwIcEFfyFf73jgBazHfY3EJfQh1CmXd5CQo1vP8esg4SItGcRJbGzjyYGWQAxZ
 cqcxfe9bfs/ufA+X2Jw==
X-Authority-Analysis: v=2.4 cv=MJpQXsZl c=1 sm=1 tr=0 ts=6a932e73 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=An_WYHtdnaDCoZj6waEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 bulkscore=10 adultscore=0
 impostorscore=10 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290165

Commit 84798514db50 ("mm: Remove swap_writepage() and
shmem_writepage()") renamed swap_writepage() to swap_writeout(). Rename
__swap_writepage(), which operates on a folio, to match its caller.
Update a stale reference to swap_writepage() in swapfile.c as well.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/page_io.c  | 4 ++--
 mm/swap.h     | 2 +-
 mm/swapfile.c | 2 +-
 mm/zswap.c    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 36466159cf19..1da4ff484f09 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -248,7 +248,7 @@ int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 	}
 	rcu_read_unlock();
 
-	__swap_writepage(ctx, folio);
+	__swap_writeout(ctx, folio);
 	return 0;
 out_unlock:
 	folio_unlock(folio);
@@ -369,7 +369,7 @@ static void swap_add_folio(struct swap_io_ctx *ctx, struct folio *folio, int rw)
 	}
 }
 
-void __swap_writepage(struct swap_io_ctx *ctx, struct folio *folio)
+void __swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 {
 	VM_BUG_ON_FOLIO(!folio_test_swapcache(folio), folio);
 
diff --git a/mm/swap.h b/mm/swap.h
index fddba7a87500..0b5d507739bc 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -258,7 +258,7 @@ void swap_read_folio(struct swap_io_ctx *ctx, struct folio *folio);
 void swap_read_submit(struct swap_io_ctx *ctx);
 void swap_write_submit(struct swap_io_ctx *ctx);
 int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio);
-void __swap_writepage(struct swap_io_ctx *ctx, struct folio *folio);
+void __swap_writeout(struct swap_io_ctx *ctx, struct folio *folio);
 
 /* linux/mm/swap_state.c */
 extern struct address_space swap_space __read_mostly;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 51f5a525bb61..ab9d45dbbef8 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2989,7 +2989,7 @@ EXPORT_SYMBOL_GPL(add_swap_extent);
 /*
  * A `swap extent' is a simple thing which maps a contiguous range of pages
  * onto a contiguous range of disk blocks.  A rbtree of swap extents is
- * built at swapon time and is then used at swap_writepage/swap_read_folio
+ * built at swapon time and is then used at swap_writeout/swap_read_folio
  * time for locating where on disk a page belongs.
  *
  * If the swapfile is an S_ISBLK block device, a single extent is installed.
diff --git a/mm/zswap.c b/mm/zswap.c
index 37f34e406c8e..88a1a74f9185 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1050,7 +1050,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	folio_set_reclaim(folio);
 
 	/* start writeback */
-	__swap_writepage(&ctx, folio);
+	__swap_writeout(&ctx, folio);
 	swap_write_submit(&ctx);
 
 out:

-- 
2.39.5

