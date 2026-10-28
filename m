Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222384;
	b=0jWn5EIlPgTRSVIa6o13coQsu4EsHZXWylMMgWg03LiPD0ZbShDMK3X3Lv5Xco/7+XQp
	 GTZdFlpdncKeGYNyt1jOM0nWJMqqnhU9plJkHfV4ilIt/XFMxF56uPZGpcG4PqFXscLZb
	 Mr/5gxJAOqfnVJQgfW500Aj0oytu0Cxmc5rz/rsOoaQ7YFntmJVdZxnVvcacEGpp9/cvd
	 DbX0qJOIpIAb2bg0lTEL/LuUBaBS3VtnD6bQU5foSPqvr0bDU1PfoTBntKkVgUhmTgdlM
	 CCvkcDJWGzYr4/9AehSErTTXV6fbNy8OPjq8ZRF3mGnVX1jRQcwKieQHSZdWLg/GSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zcBSq0z/f2PFtUtjLoqIazx5vf/WTcNJyMg91Vl4fF4=;
	b=kJjhJU45kA4OIRx3Yon3Osp8RVhwf+gjTMrr3uTUVYKKx8QjpifFSYJ8z/2heDOKoCls
	 XWqHz6vItwkAyrBdCkMSryZTwDg7bnLgu9BkwsGg+DPrSkG0wDdxWcnwFwz1EsbJ7Jg48
	 N5NFaVn0PgTHJiB2XqAOvFmi8mqOsNocszSxOqgBGuK+itWVjwVubD6n5JytyGtpijqYe
	 IWdKLhOKFpnOxy9++nm5zHrrZVOQtBCb19U8BExvYMCUomxXPShM5g6KQbF8+e+LhUh1Z
	 yRluZ9nvotntcYMxH+vs7WtO8KmKTZO/cV5H+eiJO5X7S6Nep0hD+/b0FFBmOfAkdEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lzBMaCtX;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55F2606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55F2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lzBMaCtX
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91bb5795792so16608426d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793222383; x=1793827183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcBSq0z/f2PFtUtjLoqIazx5vf/WTcNJyMg91Vl4fF4=;
        b=lzBMaCtXTe4tIpZ/BLXyFwBocpFxb1SXXSkNaR9zcuSy0NtHU2rbYUrKdmmn4mGIP4
         aAkJ+6vGAjmXXK8CHHnTiWaAbCYWgbuo/kixn/kOSXZpf+4pVg8mgtBL1dUT151qGao5
         sk+ukapGeh3XMji1zB7jsFjgojOlUINRMi3pCzetjSkjt3oxSw7IkP6FHnJW1uSk3YXc
         /W48SoaPARvF2f49D7//zXhoVHnHgt1AH/guGluBR3L3lIjX1B583PpOsxX/H7tmxY3X
         pbWGhzHVfCTH788LRz+gJLzzFve4X0JEiuesbDfMFjTJUe+TcZk5p/JLpIZqH5WN0Tae
         8HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222383; x=1793827183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcBSq0z/f2PFtUtjLoqIazx5vf/WTcNJyMg91Vl4fF4=;
        b=EXo0sUyFkryBN2aS1q3qA28gUyW7c7S2B3XxUME2bBDJRbUEyRquJE/8LzIeIV2olC
         hkWC54vhJ54Cr3GFyb9J6WwD0WsXlZauwd/Sr478Mwwt94UPB+zyKP0858t1bH3FAmgh
         6NOB422/ea2TRWkYfAT7nVp8d/Ih7YA20QNPx4WD6zI5dBoJvWJRwCeHqJnZOeThSwjH
         IZ9FZtMTnD5/3CEca8BtbZkDgq70DIyqfmt5qAeq1L5ZTRieFbJnnZwRAyyFSn2pACYN
         VXjnnqloFSREUL6wd2X6SxyMevEkde+g2haTf+tggyLleg0IQIELVtOHEe6zUgAGwmgP
         dBIQ==
X-Gm-Message-State: AFq9FYJH0USFIV/T+cGyzz6HwEgaBqvnij7Jek1L7uTJo6yVoUJbXxBQ
	Zc3v4AtqfWGeIqPkQ3ldAsLb4JCC3gNCCDIbBWVJtf0jyXwBI9GfhbmeMSw33XMNY/s=
X-Gm-Gg: AYBFou1NmkAjjUSfTUlz+U6gEMInoBihTupsiY1JS3KiN5mSAsSPNmiolGaao1DHJr6
	sAEmFLbSnVWLAhYK5xfNZBDq6OZSWB3jVa2hdwCrarzIIPY+3MTjSudcW6f8cUR09jYmfhLvE/q
	0Za+nbRCAhBl8xSal7gZYsR/JqEqph7NyppKJZbdf80krlAsT1jfPso/Avh6Tk/rYm7pimYqSYF
	1/lHK3u0kesJWa0Gd/6gKhmU4ZfbZ3+ZOg+2JqE6sUcPfAnhE0Mi88Vwqx9qX0R5p6g6rsYnJYs
	NMWNncL9zLlyyx9JNUwnRV0k7joEMN4cQAnSbl46OR5QDDmh5DEeizCq+dt6cDkjc+lAck/xWB0
	DOY2RoOXPA9G5laMYvYvjIY482j0E2Wa3O5+a9TbXsYmvJ+8PSLh0MbXSiHVlbxVoOo2n+YVmdB
	22duOdhxIvpZv+PXJB8rG60rGWaxOgAp9eKWdPRP9D5Idqoh/R6b2IGGhrpVocF0PpfzyjH9ADd
	2t7pa/7ekq2ZEaxExfDSQN69dDVEh96QQ8rv8isPCRtAPHz3uHOc9jY7nbIB9z2cb2APU5oky+w
	n0ku8XNLAAGSfe1QSr5HABUO+/lIiyapwx3skkewX6x7C4f4uBHAH6EWRgQwp5sQ+lNrLujIcKO
	osuO1eNyqAmco4f4eGncKk3gwrigsRhNdzH4S
X-Received: by 2002:a05:6214:21e9:b0:912:517b:844 with SMTP id 6a1803df08f44-91c7d1e7b9amr58841976d6.40.1793222382629;
        Wed, 28 Oct 2026 14:19:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm139778966d6.3.2026.10.28.14.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:19:42 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v4 7/8] mm/page_alloc: retry alloc_contig_pages() when the zonelist is rebuilt
Date: Wed, 28 Oct 2026 17:19:29 -0400
Message-ID: <20261028211930.3504634-8-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028211930.3504634-1-gourry@gourry.net>
References: <20261028211930.3504634-1-gourry@gourry.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Onlining the first block of a zone rebuilds every zonelist in place,
shifting the slots after the new zone.
alloc_contig_frozen_pages_noprof() approves a slot by the caller's gfp
and nodemask, then loads the zone from it:

  CPU 0                             CPU 1
  alloc_contig_frozen_pages_noprof(GFP_HIGHUSER | __GFP_THISNODE)
    slot 0 (NORMAL1) approved
                                    online_pages()
                                      build_all_zonelists()
                                        [NORMAL1]
                                        -> [MOVABLE1, NORMAL1]
    zone = zonelist_zone(slot 0)    /* MOVABLE1 */
    alloc_contig_frozen_range(MOVABLE1 pfns)

A gigantic hugetlb page can then land in ZONE_MOVABLE, and a nodemask
caller can get a range from another node.  Gigantic pages are kept out
of ZONE_MOVABLE since commit 79b63f12abcb ("mm, hugetlb: do not allocate
non-migrateable gigantic pages from movable zones").

Check zonelist_update_seq before using each zone, and restart the walk
if it changed, as the hugetlb pool walk does.  Check again before
escalating to the pass that may migrate hugetlb pages, so a pass a
rebuild cut short is redone rather than escalated.

With kprobes holding the walk across the online, the base kernel put the
1G page in ZONE_MOVABLE in 3 of 3 runs, and this change put it in
ZONE_NORMAL in 3 of 3.  Direct GFP_KERNEL calls with nodemask {1} and
{2} got a ZONE_MOVABLE range and a node 1 range on base, 3 of 3 each,
and neither with this change.

Fixes: 5e27a2df03b8 ("mm/page_alloc: add alloc_contig_pages()")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 70830689048a..7d06c6c4011a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7593,6 +7593,7 @@ struct page *alloc_contig_frozen_pages_noprof(unsigned long nr_pages,
 		gfp_t gfp_mask, int nid, nodemask_t *nodemask)
 {
 	unsigned long ret, pfn, flags;
+	unsigned int zonelist_cookie;
 	struct zonelist *zonelist;
 	struct zone *zone;
 	struct zoneref *z;
@@ -7601,8 +7602,13 @@ struct page *alloc_contig_frozen_pages_noprof(unsigned long nr_pages,
 
 retry:
 	zonelist = node_zonelist(nid, gfp_mask);
+	zonelist_cookie = zonelist_iter_begin();
 	for_each_zone_zonelist_nodemask(zone, z, zonelist,
 					gfp_zone(gfp_mask), nodemask) {
+		/* A rebuild may have shifted an ineligible zone into this slot. */
+		if (unlikely(check_retry_zonelist(zonelist_cookie)))
+			goto retry;
+
 		spin_lock_irqsave(&zone->lock, flags);
 
 		pfn = ALIGN(zone->zone_start_pfn, nr_pages);
@@ -7637,6 +7643,9 @@ struct page *alloc_contig_frozen_pages_noprof(unsigned long nr_pages,
 	 * second pass, we will try moving HugeTLB pages when those pages are
 	 * smaller than the requested contiguous region size.
 	 */
+	/* Redo a pass that a rebuild cut short before escalating. */
+	if (unlikely(check_retry_zonelist(zonelist_cookie)))
+		goto retry;
 	if (skip_hugetlb && skipped_hugetlb) {
 		skip_hugetlb = false;
 		goto retry;
-- 
2.56.0

