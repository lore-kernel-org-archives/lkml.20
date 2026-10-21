Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550396;
	b=CJWpiQPSCw+LUBHSBrQwe7ld+9EgUha2mllaYNs6v2Qv1f1feyaoLXnQkhbn2kkT5OZ3
	 zxFiJvcrYdVo9d9VnoF5sNw1HjwTmQGiUkF/3JwG32KxVeanQjnBDFDCrFiq61H3YqlG/
	 pBKAeKxLsFF9zuHaYo+zWfs48BlN76gjzk636vDvIRzriufce27rMBWDPqXANRqIxtcuJ
	 Y2xn4YnJriz+vOdtbK1/SSnohXA5R+jdPmt8XMR+YRxaU+KkfOiDjnRT1GCsT1+ZuK+F3
	 sgBlnO58RpMA+xrkuvU++RIsND2RfTOyBMMNSE9s4gbP1NkmEvR2LhsC1gWUnvHZJLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SIfdYuKrZowGGWCzHHgolNoCF8XMtQxMyZQ9b0XJkH8=;
	b=adbn7DCMV86Rdxs+tL72ZRZd6bpl//pEHTAV7zWBBFA3BOwru+cUnaW9HFLUL3TG1rci
	 xEJNFejMSDSlkIrSf/PEvnwx+nTQBO5b4jfC6bpqVLB50KXoRSY3IemCqnpvzBNt6KiB2
	 bheQeIEjSRyQ3DzApriB/zFD3E+ZfpBftwiRqI2CH5poJaHXVwQLK2vpEvGQon0dRR1YM
	 /MMN0fglo3oTY6vEUD2GMp9LJMRKmVaLpXADZFG2/NRJkiRH13Yvq+lU68g677zmbNYm9
	 EFzDDKCPzArl/zqCqa7RlEG1zmZcf0QI8mfdt+UAv3hE6j0j/LxwJZyGGZJ3ALGoIYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=agfPLIGG;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD061606A327
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD061606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=agfPLIGG
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f1ca4132bso26115985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792550395; x=1793155195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIfdYuKrZowGGWCzHHgolNoCF8XMtQxMyZQ9b0XJkH8=;
        b=agfPLIGGiLVsUCOLHMgU/UcLSpxwViouNvaZrSqAOZSdV5uSMjzkT4D+DlabS5tvPO
         9+2z5tm5/VtSy8fxs4XWBqbQ04lH8JCWHbgqmPQ4SRfKNhURTo0R7lBsM05I6U7ynqrM
         eWDsvZHJcQD0xvaYmZ5YeMEqzRifU+skeh5p6cMv8UAtGRRK6P/fUAhHrp7bFNYmC7J+
         z+XQSLsvtPXfYQgV5ykAyRnKxOU+bF5iFCYzmMp+NOoYkgqCodOXmB9DXqH1C795Idqw
         BmaMW24Rd8tqEt4oIro7K9vthFEuxjeZN0TOD1lbUgoyho/s7eT+K4djWgZsSug1qaTT
         rkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550395; x=1793155195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIfdYuKrZowGGWCzHHgolNoCF8XMtQxMyZQ9b0XJkH8=;
        b=wj/gUm1yYbCJWV7uPD/A2VwEzsW+FbOktCquko9PzwDIiRgVvl+zNC85GQ0X0LnkEV
         DzWvfTf2Pw4CWz1TuPIrb4bGggGAWFNeNo8TWs6/cJfgi9qNLnpH98xIluSdDAXidh76
         mUkm21FjRheEo2xldJRMe7kA1UoncH/7yf2lzc3R8w866l4Y5CIVX6CZej81RmEktI9V
         4DwOvHlPB5h7uYhVb8AKBnD6tXWyFrhSvtbbvH6MtcdUsbRg3TraMbqldCxD9u3EW3/q
         KUsT8b+DgHVq78iUzyxePwJxCxIc/Y7oIFpVgJ9MztsL0wONqYkkO/Jg9ydNm/QMzPhE
         yyBA==
X-Gm-Message-State: AFq9FYKz0WbFpjc4HcWAdTy9pAXq9REY99Dy0D+V6fbMWBn4GxyiW8iB
	Wu5+NBP2LO+XjUdqxNM94nOfqj8854r2zrrndRyOHdYFu9fBXv1mCuAReszarY1Kk2A=
X-Gm-Gg: AYBFou1yatEcU5p8meM7E8KfPJUcXknJyXezccErS9lLUbp6F+gKaaRRvPWFTLauon3
	vGtbBBo+Mg/KjePT6H3G/0uGHH73UAoCnHajJq8tB8ATntS801LqrfL/+ssKAFHIImyWKMNzrmT
	Pb4agGl+egX/vd4uEYIGjlGHrj5ZdhOHDL0otVEDIGHMVaCA0OqXAQlm6c9Ut2I/+HkyDtLRaUX
	Lmzml14EH4koyoJneeA2XPSiIddSHVUubyXs77Z8SX22/gQGZnXt2Q6rWJgSxHKui3BVXfUYm2V
	8vbB3ieakgV/c5I/tCIe6VKs8d3E3QmNbXPhU5fZjLuaT2gOnYABgjBEzr+QIsFhm7JVKXyU3Pl
	46MUFP2zIWbefdInDGuxdTh4nAA9Bo3ItEatOGRxAFpMmpgZFVmPicxhFK0uFhWJmCdwWyE7E/b
	op8DSxGV/LQabAq9W0VtD5VdTioXlt0spiOuFzFCEFdu40sMmtB2oN48o1L6sM1zOn/8PGsN+bs
	UsWZ0Ei9M7HWEFcU5O3qljqt66UdgUu5/5fZBdvEpY7SaZNl8TVBRzvFNznb/YuFRdXRqon9iB2
	BEtuhk9Hk/zWGqmkQ9hc87oMbBY9CvqlyFTz5DYRYlbysbYdA9HjWWgH2os/s/4=
X-Received: by 2002:a05:620a:260a:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93f57f1d75dmr211957385a.43.1792550394720;
        Tue, 20 Oct 2026 19:39:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10a45336sm13819426d6.3.2026.10.20.19.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:39:54 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	mhocko@suse.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v3 6/8] mm/hugetlb: retry the pool walk when the zonelist is rebuilt
Date: Tue, 20 Oct 2026 22:39:38 -0400
Message-ID: <20261021023940.1940971-7-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021023940.1940971-1-gourry@gourry.net>
References: <20261021023940.1940971-1-gourry@gourry.net>
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
shifting the slots after the new zone. A hugetlb fault bound to one node
can then take a pool page from another.

dequeue_hugetlb_folio_nodemask() picks pool nodes by walking a zonelist
with the policy nodemask. The iterator approves a slot by its node, and
the walk loads the zone from the slot afterwards:

  CPU 0                             CPU 1
  dequeue_hugetlb_folio_nodemask(nodemask {2})
    slot 3 (NORMAL2) approved
                                    online_pages()
                                      build_all_zonelists()
                                        [.., NORMAL1, NORMAL2]
                                        -> [.., MOVABLE1, NORMAL1, ...]
    zone = zonelist_zone(slot 3)    /* NORMAL1 */
    dequeue_hugetlb_folio_node_exact(h, 1)

Check zonelist_update_seq before using each zone the walk returns, and
on the way out with nothing found, and restart the walk if it changed.
Checking before the dequeue leaves nothing to put back. Reset the node
the walk last tried on every restart, so a restart does not skip it.

With kprobes holding the walk across the online, a hugetlb fault bound
to node 2 took its page from node 1 in 3 of 3 runs, and from node 2 in 3
of 3 runs with this change.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/hugetlb.c    | 13 ++++++++++---
 mm/page_alloc.c |  4 ++--
 mm/page_alloc.h |  3 +++
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b37d7d0db7fc9..8edf323baf0fc 100644
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
index dd8c9046f9a06..5ca8e57c5fcbf 100644
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
index 2b1017a91928c..53df6b8a0c00a 100644
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
2.53.0-Meta

