Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222382;
	b=4RzFYvem2NZ8x/5LFBkAFe8lJfOJcHsVWCPeVV2lII9DLdCKc5842zzUYDmFM4t2cLVJ
	 p7aiWLeaiqwbzAWHESHuf0YLTaZ1PdfCxuQX91fg14+OKaWIXxe+VUHLJ8ZD/+Nm7+T1/
	 gmEislSkq/PKTQMsQ9WdulT8EILz4gRGB7tLVu+67suZ8phyY7XNi5mkFgdjlsaGp7zx6
	 ESg8MQN4tIZMrt093POEJaw3NeeqiO5e6zgTXEQAnw/YhN+pS+Q5bVC709v+rMtiKQp8G
	 dPdgaHI/WCKJPfUmWMfU4f9OfHhByvk/O5nyd9SXe9SrqOBgDlc3IRv5aBHQPp2eXXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZIgZaCWO7ouB50zgNC7x8DTFvAXbflI8ZAgrOwWkY6A=;
	b=A5QHAoGW4QXbkcXB4pCT85rcST7vtDMItwaZ2C69k73HCkcCC2oU0194vfUf5XTeEC5f
	 +KCQ+I9HD+EAyNSAeFOO5/t2MxDevR1sJ7HGgVUu+6FkFcOisKx7Pk207+TDXeTIhkpS2
	 qBidAO/Esiqp6jW31OIF7bWsapWWn2wd8Wi0wnrSlHPLUWmrAt7HRXD1vTm2U3XkkYqLN
	 tWGYOOgfmpCLw41ltIyUWnaUugBQ9I6o5AWHSEwNDeu1nNgkOWr4kYMCMkBqEft5qsc3Q
	 fNt5vw+FaskM4XFivzMOwYC+Phq+Fg9mrlYrlCxGoESs13w6A3JvdTlDURIGCGsqolA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XobPomqO;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60460A2604
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F60460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XobPomqO
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f2b8cf037so110427085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793222381; x=1793827181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIgZaCWO7ouB50zgNC7x8DTFvAXbflI8ZAgrOwWkY6A=;
        b=XobPomqOGjQ2JuRdVXXlnoFmj2MGfcqu2NphESlZ6ykYJ2KjP9b7lKBuKcF8W+3ozx
         e/rE9lSgiZhGX82YHC+I0n1vz+VW/o91RudyYt9haN9/AByWS8eWjAUw3GqlgSJU6Lx3
         m6O48aUdjb1KKJKPactK+Mb73t9blmLzbHQoYUeSHg1by1OGRwifOBhVrLf9Y0mxa6el
         Vjb9xmDQqzfj8kEE37LWWBBiod5wiky3yGS4B1NM3MsKgW1Kgm5W/z40/L4Wk6LV5AVL
         Eeu3jVtwqiQCPEdGuWLx3RaI7BaXP2PX/X6SH+zwRakr6CTDCkXKv9GpT+SBjXgvQ0WP
         q7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222381; x=1793827181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIgZaCWO7ouB50zgNC7x8DTFvAXbflI8ZAgrOwWkY6A=;
        b=K7cpDVxb/AnKGV4ygtzCSjPIwboFNbESORikXiEWKM/Uab3OCNVTGOJvyq6tJd52aA
         OAAwwIrdhMh74gWpkqucp0eSWLnJI/wpSHWk7Y/9gSNhnxVhlLlzfnLGw59CiNmSGT4x
         bLOm6ShrOyFBYqwtCQz3zONah7tYemp0yEYKMJ/wneiHTU4SlW1A5NYy0oEP5/0oCrL9
         RdXba0MA66JehhWJbcT47A4Ghz5so4I/zdV9KTHJ1l3r9CRAT8BBLAVCmCzfU0kKr7C+
         87CcLwscPng7h4UfwcyR9FlhLyUgrY1+8hNO3glpOaOKmdMNIXtwhTiWZQtfxA4GW2KG
         xm8w==
X-Gm-Message-State: AFq9FYIfmkHKPq839AkCsbFTu/eP+qrvlTYEBoPEL+Yxy+dpPsUpjT8R
	K95cu3bzxDal2i1dDNMfrlHdW5X1klNJW5mapdD+/ZnxBFdxn2DVTtHl8QAOfUzoR8w=
X-Gm-Gg: AYBFou3SviBVzjxhg1jzWyAWjP3ToARiSYVUafL5Npde8Tnf9BzGVOhjUitObZ89clv
	XdYElhmUaRKP7IFL4mpeOkrYSY1SKMQq0cX7ZETF+zrdBKetHzIRd8Jikn6y4b1e+NmGBcr3he8
	NG2LXk1gK2CRBlhbY7aaL2g+l4fR8WIYH7l33Sb/w48y9HLkiD4w0vbRSBRjzXAVSC0oGcUlbxk
	VSs3I49x9/oCUQkH2DnR6uP7rXvFvCYnDUDoUvSOVhTDBjsPJmNxLjWWpFaQ96fTh6Tpf9ksgXY
	yO0yqiTjDKJyIrBYVJM+HxdXGaxVE6sJX3ERuzbUtPVcU9q6mQlpvyPUc9RDIh9heWnpFw6aHZE
	MsgBFFdUaCz/CVohtdmHAN4jYJj3BeJKLOSp0/wm8xSS6seWKGU1qRJ/G59oF/pjOfbiKQjDjAG
	aQ9oeQ5g8R4Qbwfy8jQ3GpZCdPjqxtTkKIRLjWrX5ItOdfIosvbMWCrOJ6Op66kKX3j+CCw7532
	kDM0aNN8B7KaTWVb8C1aNjxEzN6EWey44PiqxXYvVoxHrdSwa7e6EguAuOTnixduOmVRmC/tv+a
	x4k2+NjTbofQo9ZHnce3vCLPZ/zGqhO4f/GNiuQugz5jZfYN3vA3dnV+PXEt27TL4Xj1pZNpDEu
	FZe8fexiPbgkmBuY=
X-Received: by 2002:a05:620a:2629:b0:940:f224:5a85 with SMTP id af79cd13be357-94408d6a286mr556498485a.71.1793222381385;
        Wed, 28 Oct 2026 14:19:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm139778966d6.3.2026.10.28.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:19:41 -0700 (PDT)
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
Subject: [PATCH v4 6/8] mm/hugetlb: retry the pool walk when the zonelist is rebuilt
Date: Wed, 28 Oct 2026 17:19:28 -0400
Message-ID: <20261028211930.3504634-7-gourry@gourry.net>
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
shifting the slots after the new zone.  dequeue_hugetlb_folio_nodemask()
approves a slot by its node, then loads the zone from it, so a hugetlb
fault bound to one node can take a pool page from another:

  CPU 0                             CPU 1
  dequeue_hugetlb_folio_nodemask(nodemask {2})
    slot 3 (NORMAL2) approved
                                    online_pages()
                                      build_all_zonelists()
                                        [.., NORMAL1, NORMAL2]
                                        -> [.., MOVABLE1, NORMAL1, ...]
    zone = zonelist_zone(slot 3)    /* NORMAL1 */
    dequeue_hugetlb_folio_node_exact(h, 1)

Check zonelist_update_seq before using each zone, and on the way out
with nothing found, and restart the walk if it changed.  Checking before
the dequeue leaves nothing to put back.  Reset the last-tried node on
restart, so it is not skipped.

With kprobes holding the walk across the online, a fault bound to node 2
took a node 1 page in 3 of 3 runs, and a node 2 page in 3 of 3 with this
change.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/hugetlb.c    | 13 ++++++++++---
 mm/page_alloc.c |  4 ++--
 mm/page_alloc.h |  3 +++
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b37d7d0db7fc..8edf323baf0f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1293,11 +1293,11 @@ static struct folio *dequeue_hugetlb_folio_node_exact(struct hstate *h,
 static struct folio *dequeue_hugetlb_folio_nodemask(struct hstate *h, gfp_t gfp_mask,
 							int nid, nodemask_t *nmask)
 {
-	unsigned int cpuset_mems_cookie;
+	unsigned int cpuset_mems_cookie, zonelist_cookie;
 	struct zonelist *zonelist;
 	struct zone *zone;
 	struct zoneref *z;
-	int node = NUMA_NO_NODE;
+	int node;
 
 	/* 'nid' should not be NUMA_NO_NODE. Try to catch any misuse of it and rectifiy. */
 	if (nid == NUMA_NO_NODE)
@@ -1306,10 +1306,16 @@ static struct folio *dequeue_hugetlb_folio_nodemask(struct hstate *h, gfp_t gfp_
 	zonelist = node_zonelist(nid, gfp_mask);
 
 retry_cpuset:
+	node = NUMA_NO_NODE;
 	cpuset_mems_cookie = read_mems_allowed_begin();
+	zonelist_cookie = zonelist_iter_begin();
 	for_each_zone_zonelist_nodemask(zone, z, zonelist, gfp_zone(gfp_mask), nmask) {
 		struct folio *folio;
 
+		/* A rebuild may have shifted a node outside @nmask into this slot. */
+		if (unlikely(check_retry_zonelist(zonelist_cookie)))
+			goto retry_cpuset;
+
 		if (!cpuset_zone_allowed(zone, gfp_mask))
 			continue;
 		/*
@@ -1324,7 +1330,8 @@ static struct folio *dequeue_hugetlb_folio_nodemask(struct hstate *h, gfp_t gfp_
 		if (folio)
 			return folio;
 	}
-	if (unlikely(read_mems_allowed_retry(cpuset_mems_cookie)))
+	if (unlikely(read_mems_allowed_retry(cpuset_mems_cookie) ||
+		     check_retry_zonelist(zonelist_cookie)))
 		goto retry_cpuset;
 
 	return NULL;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 33aab9deaaa1..70830689048a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4411,7 +4411,7 @@ EXPORT_SYMBOL_GPL(fs_reclaim_release);
  */
 static DEFINE_SEQLOCK(zonelist_update_seq);
 
-static unsigned int zonelist_iter_begin(void)
+unsigned int zonelist_iter_begin(void)
 {
 	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
 		return read_seqbegin(&zonelist_update_seq);
@@ -4432,7 +4432,7 @@ static unsigned int zonelist_iter_sample(void)
 	return 0;
 }
 
-static unsigned int check_retry_zonelist(unsigned int seq)
+unsigned int check_retry_zonelist(unsigned int seq)
 {
 	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
 		return read_seqretry(&zonelist_update_seq, seq);
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index 2b1017a91928..53df6b8a0c00 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -265,6 +265,9 @@ extern void zone_pcp_disable(struct zone *zone);
 extern void zone_pcp_enable(struct zone *zone);
 extern void zone_pcp_init(struct zone *zone);
 
+unsigned int zonelist_iter_begin(void);
+unsigned int check_retry_zonelist(unsigned int seq);
+
 enum fallback_result {
 	/* Found suitable migratetype, *mt_out is valid. */
 	FALLBACK_FOUND,
-- 
2.56.0

