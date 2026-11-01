Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499241;
	b=Wi3io2IlYMD1JcsF9StmuTAMVIHXGkegaGedWg5T4G+ksfx+ZNdl4R0RT6NfJXn2Xmtb
	 EEEhybdzas2uHbIjXeVXybhWGWQpaIlKe0oevl49M8ypzryPRbZ02E6H4qoNpH6iVsCaD
	 WYGdd+UUNHIiRXy6cVOMk+eaflYNS3PEnR4Vm0rE97Fjr1lY2bvyqEk1OOuMCoT2IW/w/
	 uMtyJojRQIWou4xSTDwC7eqb0VapBLFP5tsC+dIf9j4d4KnWKICpiDyq5dtZ/TyrqIEVI
	 pqpMbHeu91ehRQNJLc9mnIXSVW31ZU6UrU/nUhTHxaQB7mSdhjlDiIFijK0chmWzNkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j2CqNGtb20G7+NWXUngS5SFkSTjGBoouQclrEPz+fGk=;
	b=NcX0c5c6eB+sLKnZnfkSKlnJ6iNmcmYz73agYDQe/q6WAHdLQBRC/RRaNd2dIrnc7IOZ
	 Sq4yfj0lYIbINP8M++ZKAoMpaAzkXDgtzotlNN20tA14uxj0h7irkAMtI91srioTCtpPL
	 Q4AxudNllT9kCY2c6L8VDL5iSbKqhMalWYvYsqK5gt0Za2aCRIuqxb7qbiZ+PKwqFLQuY
	 MTpSWqKD1fD23CYlOHKK1BJPFX7iCRicPGQOP1IEA2j9BXx13IK3UKzXmylLky+XK1rZ0
	 n/28g8RW7vhz0cI3PU/U7RS0mdWjWPU07QJ2JP6WxbM6ILQ9n8/Ss8fEHgZD5Pa/8oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lgW7KZRH;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A000B606A339
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A000B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lgW7KZRH
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f1cf92c9eso184307785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793499240; x=1794104040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2CqNGtb20G7+NWXUngS5SFkSTjGBoouQclrEPz+fGk=;
        b=lgW7KZRH2FptuM6zfLuSTQWRDuyCAkuCBA24OzlxPGcrnnn/d+2g9YBFs2nU7Z9pBC
         rt1miwq2rsx7tgbytKf8Nj0TEJwif19s/geiXmYyQPmobo/CRepPUjMQTaYcs6MYm7Tv
         +xu18fOEL8vJDid3zNoyh475FihV1Uh5jxGII1RwHH/ZUitaDTOir7Wo5NCQLbIKWE0W
         5Mm5SgZCt/U7qJTiMcRk6O78RsRwGezhOPXK2jt7ccrKlr2ZQ+RgvASwQvWn0R4P7/jV
         VgWXFHRFUPb9jiKFgZBKcs6vWSdn9KsPm1FZgVyL3vmHy/6VInI0iBLYYQKYC5baGRTJ
         cLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793499240; x=1794104040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2CqNGtb20G7+NWXUngS5SFkSTjGBoouQclrEPz+fGk=;
        b=DPEdwuAYuzngDY4ksLwTsZiEZP/eF6AFq1bBjKAeRuaJGk9jdPoIkcYd8UgjDmtyRu
         G9E3ljRJ/U/DvyY3XIY1czWU0Qu1kdBX/wBTtyZCpArWiWS1QCEhcUrUSu6mFjTufRiY
         +UpsGuBNB8W8oRQ3mBdm51BIVag7rgpiEEnwDQPDSmm24KilC3lpBQHL+9oGly79UK5s
         /32bZhF+I0XMHOQnLXTcr1gP3zj2PBlFYuzkU7S7SRn/gY/CfKB8P2uh/c245s02+vI4
         HHXWfLN2a2Qwdr9vscjc5P43jCnPimsOftCGpL7jmC8jcU0MBpM6kinYNuozCbftogqh
         MtFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4j90tIMAvYFGRXpPJE/5nqbsjXN0iN3+wZ2M1sOQXlMDplx0Kco9e8prnIaiwR2/a94vt4+VLS2QvjMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhvjVLKaXOK6Y2Y++TII6sPwXQdE501T/Y0HkVvJb88RJwGxTx
	lF2EUc2zVLgXtkx9Wa2E4Q6kJEsp9H1r5GEwBPzOb8h6SfjVxBlrYiWIbw+j4bE6g64=
X-Gm-Gg: AYBFou3T6AwhPtIEG+baA2xzmACf0pFv4S+CLOj06WrUaie4Pyd/B40hg6A4cQ3lwdA
	yWhmepf3GQzeL+UbDfZGZT1cxwnCwCGAiFtiYLQnxwKxn+6CMl7zTSXxK2THKnMuGTuqcebc6yh
	1BA+rTV1hxzumgqCDYsKngkha28dSwseI6OHkvuShdiKCFSVOBwz57P48V/sWJY2Im/xv+NgMEy
	jKUJrRsFmy8yhWOXgvKCBXD11VVJEggLIMMaejMFMY5UazbzUWPQzgLu2/63oWks5Dv3Cm0mUlv
	xkPOlPkcNEMCIL9k80vV44eGGzBMhbmz+3rtJ+C6/Ux7ExuhGU3kRdTjjdDBZoIutdgApvVORcU
	kAfFmg9BY5j8HKYPuf1X4lnyd6cPnPaNJSwmrm6bcKYE6XVATQWI6hwLlvd/02jxxZGR6uj1ECr
	DzfN0gpVVXq1cp233ZSKujMNhWGG+HVnljShsLxQSLGVYybr1ErcN6SAq1eRKc/GEJ1YeSGYUEs
	f/vVKp3YMQL/MhS4MRrnXocgra6JnyczBXa4lJcdReFZXsKy2ffZVE+OWko49Wu6JWpoQ07rBGj
	Oz7MX72139borfm3U2ruIaRyc7aGzZt1gQJbp0Tj6pOq1jbp8YPXj3w4ZAZTXbdhm3eNIwjpfv+
	tCz8sBPssIQ==
X-Received: by 2002:a05:620a:460b:b0:940:f224:5a70 with SMTP id af79cd13be357-944217f9c7emr1111740485a.72.1793499239606;
        Sat, 31 Oct 2026 19:13:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425858552sm498131985a.18.2026.10.31.19.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 19:13:59 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v5 08/12] mm/page_alloc: retry allocations that raced with a zonelist rebuild
Date: Sat, 31 Oct 2026 22:13:36 -0400
Message-ID: <20261101021340.2251928-9-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101021340.2251928-1-gourry@gourry.net>
References: <20261101021340.2251928-1-gourry@gourry.net>
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
shifting the slots after the new zone.  The iterator approves a slot,
then the allocator loads the zone from it, so a GFP_KERNEL request can
land in ZONE_MOVABLE and a nodemask request on a node outside its mask:

  CPU 0                             CPU 1
  prepare_alloc_pages()
    first_zones_zonelist(nodemask {1})
      slot 0 (NORMAL1) approved
                                    online_pages()
                                      build_all_zonelists()
                                        [NORMAL1, NORMAL2, ...]
                                        -> [MOVABLE1, NORMAL1, ...]
  get_page_from_freelist()
    zone = zonelist_zone(slot 0)    /* MOVABLE1 */
    allocates from MOVABLE1

zonelist_update_seq detects the rebuild, but only the slowpath's failure
exits check it.

Check it whenever an allocation succeeds too, and if it changed, free
the page and retry, as the memcg charge failure path does.  Eligible
pages are dropped as well: zonelists only change when memory comes or
goes, and a retry is simpler than rechecking the page.

Freeing the page does not undo a block the allocation claimed.  A
GFP_KERNEL request that lands in a fresh ZONE_MOVABLE converts a free
block to MIGRATE_UNMOVABLE, which stays until the zone's movable free
list runs out and a movable allocation takes it back.

The fast and bulk paths read the seqlock's raw seqcount without waiting:
an ALLOC_NOLOCK caller can be an NMI that interrupted the writer, and on
PREEMPT_RT the seqlock accessor takes the spinlock.  A sample taken
mid-write costs a retry, or NULL under ALLOC_NOLOCK.
check_retry_zonelist() returns 0 when compiled out, so a backport
without the hot-add change stays harmless.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/page_alloc.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 28d46f987685..f2f7e96bdef2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4419,12 +4419,25 @@ static unsigned int zonelist_iter_begin(void)
 	return 0;
 }
 
+/*
+ * Never wait for the writer, which an ALLOC_NOLOCK caller in NMI may have
+ * interrupted. Read the raw seqcount: on PREEMPT_RT the seqlock accessor takes
+ * the spinlock while a write is in progress.
+ */
+static unsigned int zonelist_iter_sample(void)
+{
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
+		return raw_seqcount_begin(&zonelist_update_seq.seqcount.seqcount);
+
+	return 0;
+}
+
 static unsigned int check_retry_zonelist(unsigned int seq)
 {
 	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
 		return read_seqretry(&zonelist_update_seq, seq);
 
-	return seq;
+	return 0;
 }
 
 /* Perform direct synchronous page reclaim */
@@ -5100,6 +5113,12 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 	warn_alloc(gfp_mask, ac->nodemask,
 			"page allocation failure: order:%u", order);
 got_pg:
+	/* A rebuild during the walk may have handed out an ineligible zone. */
+	if (page && check_retry_zonelist(zonelist_iter_cookie)) {
+		__free_frozen_pages(page, order, FPI_NONE);
+		page = NULL;
+		goto restart;
+	}
 	return page;
 }
 
@@ -5184,6 +5203,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	struct list_head *pcp_list;
 	struct alloc_context ac;
 	unsigned int alloc_flags = ALLOC_WMARK_LOW;
+	unsigned int zonelist_iter_cookie;
 	int nr_populated = 0, nr_account = 0;
 
 	/*
@@ -5224,6 +5244,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	/* May set ALLOC_NOFRAGMENT, fragmentation will return 1 page. */
 	gfp &= gfp_allowed_mask;
 	gfp = current_gfp_context(gfp);
+	zonelist_iter_cookie = zonelist_iter_sample();
 	if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &gfp, &alloc_flags))
 		goto out;
 
@@ -5273,6 +5294,10 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	if (unlikely(!zone))
 		goto failed;
 
+	/* The zone was chosen from a zonelist that a rebuild may have changed. */
+	if (unlikely(check_retry_zonelist(zonelist_iter_cookie)))
+		goto failed;
+
 	/* spin_trylock may fail due to a parallel drain or IRQ reentrancy. */
 	pcp = pcp_spin_trylock(zone->per_cpu_pageset);
 	if (!pcp)
@@ -5413,6 +5438,7 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order,
 		.alloc_flags = alloc_flags,
 	};
 	unsigned int fastpath_alloc_flags = alloc_flags;
+	unsigned int zonelist_iter_cookie;
 
 	/* Other flags could be supported later if needed. */
 	if (WARN_ON(alloc_flags & ~(ALLOC_NOLOCK | ALLOC_NO_CODETAG)))
@@ -5442,6 +5468,7 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order,
 	 */
 	gfp = current_gfp_context(gfp);
 	alloc_gfp = gfp;
+	zonelist_iter_cookie = zonelist_iter_sample();
 	if (!prepare_alloc_pages(gfp, order, preferred_nid, nodemask, &ac,
 			&alloc_gfp, &fastpath_alloc_flags))
 		return NULL;
@@ -5458,6 +5485,11 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order,
 
 	/* First allocation attempt (or, for nolock, only attempt) */
 	page = get_page_from_freelist(alloc_gfp, order, fastpath_alloc_flags, &ac);
+	if (likely(page) && unlikely(check_retry_zonelist(zonelist_iter_cookie))) {
+		__free_frozen_pages(page, order,
+				    alloc_flags & ALLOC_NOLOCK ? FPI_NOLOCK : 0);
+		page = NULL;
+	}
 	if (likely(page) || (alloc_flags & ALLOC_NOLOCK))
 		goto out;
 
-- 
2.56.0

