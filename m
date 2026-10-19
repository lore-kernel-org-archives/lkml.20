Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430634;
	b=1GT4YkwxJotdS6JHnRinN+IsobZfgd7IU67BUGPKSsF7Sj9qIZ/BCuq6DnW7JsNzNrGU
	 jeeBaxBAHObj4QNJfEyDvFaxtDIudcf4fNETXriMfljQ6XgUtklhCgguI8SG3a/9lpO0Z
	 kPtmYHfaOwQO3Gq0WnrT0xsLbIhEr3OiTH9QCdjbGW68ouP5MsZevdieQv/+ulIlyBhoQ
	 BEUkz1h/CSgjirUyw96AIhpcAUESlpplFroUXT49+n7JDj58aCaDl7Wvdn6RgzDgE3O/t
	 qigUUdrnB6IAbJN/EUNn3cwJZ1Ok/nD+Qov1u0Ep6PcQ4HQtDxPlDxnNooBaj2pmtGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ykp4/R1v56ikD31+YWezPL+y1PopNUKQZFoNf3vFuBU=;
	b=gD2iiaY7QcRPOkJ3MxX6r8hA3yAvMSt+2wrgcxFbQge7M0w7rVp6O4rAiVcG28QdT7AB
	 JRkrAPYw7O9I7qz21yZCk5eE//b/30bILT5o8nygutCE0vlWbeUnePzvOYYRefOqtYF5G
	 Y5DMLzuMYwgvXi9VNUr0Iyr0hdWCKfDoxtGssJNL5kYvt0DmwpnwuwWHH5wusOSbRyyyj
	 LwxK3jTWajk3dnp3CzZJKqtcg6GxfRoCf1Q6TeiwJqKVmMID60IC4VSZw8hIozhOpaHIK
	 +9MJnG/0Uat6n7SnCtghDkTTAtmELN2vw5m+dzHtBMjqa1XeI7P2dszrbs+dNkF/k2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IJpixvff;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD067606A339
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD067606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IJpixvff
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93cb1c0e851so170547685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792430633; x=1793035433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ykp4/R1v56ikD31+YWezPL+y1PopNUKQZFoNf3vFuBU=;
        b=IJpixvff4in9lSpOW0FjhHULAGZlaxLLwi3T+3Ac6Wg1yxpt6NUmArJgfqS6EkHG4k
         Tl+0anSJ0lQVT7Fg/OtDRvFaOjjKLdx6ttZp/KKUenmEq1Gx5IR9/B0ndtFEED4xaHDJ
         i0TqdhDNjJxg/oEA/BvBqPdzrrBnF/95b8rdeCR+pJMSQQnZIzscS12YPsF7UP7rfe7b
         0NVqqqDdSlzvFcNkhxuTBEtG0tfucr+2Q3mnmEwGOlXMfaixidPVALU1x7anuaDWAafL
         HAjtsAXUpjOCec2u8hyDOvoAbF86wsDRP7UopxFm3Yf90570OOODNyqdz0fVg0hbceRk
         u6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430633; x=1793035433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ykp4/R1v56ikD31+YWezPL+y1PopNUKQZFoNf3vFuBU=;
        b=tex0RTw7KbWWbCRDSanEU6Z94RBOZt+IR+fqsggUL58pW2asy6xcIHT3EBYb3+sxxC
         HEvtnO0jFIOJzloIq4dd1GCr4NFz3dn/CmKrZWpLnFJuYHsRP9xdjrT/VMqTPU7QLF04
         /tp0b6XXpIvgXZEps+tWqLBsHaethZwHGS4kq2fHy+vi98P6j7X3MXvUGqb/0O8Ck1FN
         of0RRu4MZ5pS6hFDTQiOGouwl+lY5y7MJGFk39y9JJGZWgQXpt1bRlxQ/LEJpAu1h9b2
         WIRa5g9IPqSkF0LZ/ck1jGDW0Hm0607MznF8dBZbDvYPevliCEho2a2aNKNGL9XFerjV
         AgjA==
X-Gm-Message-State: AFq9FYJzJ2dG/oe2LZHiemsVM3o7heOkjTbXgJKwuCwrOcKrabnCrMk3
	zbB7EI1JVvps8CNOxpYubu8T3SrkZbkuACL3ClBszxYp2vQw+7u9RQuHKUQClE9gExo=
X-Gm-Gg: AYBFou16eFzJ9cmvfUxYZj3dzV5dSTeZIyD8CaJVId96FbqVUPKRhdlbi/MW5IkH78t
	7TZd4nhoXIQKYkIpKSIM60l8LGi9GHojZMTR1yvDGRhsyUQl+Un1FpuDmgKPQR5XLEQ8HyJhoTL
	ykL8WMl6FOtYhqvl/o2ha8vFXAicKLDowXE1b6EEoRppdDtIAlZugh9THU48J/RnZ4ozi/1RuLP
	QlqWmNzJ24SJ9vl1wkzEh+dtRoVRLjFrvFunVSPv24khnJ/dSuqpgILFBlGxgZe9mLYpSQ1Zpcj
	dWXeu4HAcij/jSiRUefe4q0wgA8j1ND4gf65KlV45I/emm+iAHnX3MoeLyxRdFVjl+qq0MxKxx9
	AcQFscPBX9VGuoGzSWSax0cqoy+41mHAEUVRhRvFnO99LbQG2v2N/9TAxF2TE8d5iVA51mhBO85
	tid51aR5rhBHZo6Gg9Lws8+09ziuxQ6GJ1uM4yz1j347JirW11aC0tMno4DGEJ0ndUUSTkdVSt0
	84isB3qva3QI45ia/0kTc6KLywKgFyYyw1W8v1BlL11/dv3Q9pqayvBitBX
X-Received: by 2002:a05:620a:2783:b0:93e:d051:8f19 with SMTP id af79cd13be357-93f29ced575mr1321775885a.40.1792430632885;
        Mon, 19 Oct 2026 10:23:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4adb28c2sm14615385a.0.2026.10.19.10.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:23:52 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	mgorman@techsingularity.net,
	jiang.liu@huawei.com,
	Bessel.Wang@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH v2 2/5] mm/page_alloc: validate zonelist slots against concurrent rebuilds
Date: Mon, 19 Oct 2026 13:23:42 -0400
Message-ID: <20261019172346.3344005-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019172346.3344005-1-gourry@gourry.net>
References: <20261019172346.3344005-1-gourry@gourry.net>
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
shifting the slots after the new zone. An in-flight walk can use a
zone it previously filtered. e.g.:
  - a GFP_KERNEL request can land in ZONE_MOVABLE,
  - a node not in the nodemask can have its zones selected.

With kprobes holding the walk across the online, I was able to get this
zone/node misplacement to happen consistently across hotplug events.

The iterator approves a slot by its zone index and node, and the
allocator then loads the zone pointer from the slot again:

  CPU 0                             CPU 1
  first_zones_zonelist(nodemask {1})
    slot 0 (NORMAL1) approved
                                    online_pages()
                                      build_all_zonelists()
                                        [NORMAL1, NORMAL2, ...]
                                        -> [MOVABLE1, NORMAL1, ...]
  get_page_from_freelist()
    zone = zonelist_zone(slot 0)    /* MOVABLE1 */

Every later step of the walk filters and loads the same way, so a slot
approved for one node can also hold another node's zone by that time.

Recheck the loaded zone against highest_zoneidx and the nodemask in both
allocator loops, and skip it on a mismatch. Hot-add only inserts zones,
so the zone that was in a skipped slot is still ahead in the walk, and a
walk that runs off the end meanwhile is retried by the zonelist seq-check.

The recheck adds about a dozen instructions per zone visited. The two
fields it reads share a cacheline with zone->per_cpu_pageset, which the
pcp allocation path loads anyway.

Fixes: c33d6c06f60f7 ("mm, page_alloc: avoid looking up the first zone in a zonelist twice")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c7125f6693574..aa3cd44fdaa5b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3784,6 +3784,19 @@ static inline unsigned int alloc_flags_cma(gfp_t gfp_mask)
 	return ALLOC_DEFAULT;
 }
 
+/*
+ * The zonelist can be rebuilt in place while it is walked, so the iterator's
+ * filters may have passed a slot that now holds a different zone. Recheck the
+ * zone itself.
+ */
+static inline bool zonelist_zone_valid(struct zone *zone,
+				       const struct alloc_context *ac)
+{
+	if (zone_idx(zone) > ac->highest_zoneidx)
+		return false;
+	return !ac->nodemask || node_isset(zone_to_nid(zone), *ac->nodemask);
+}
+
 /*
  * get_page_from_freelist goes through the zonelist trying to allocate
  * a page.
@@ -3812,6 +3825,9 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		struct page *page;
 		unsigned long mark;
 
+		if (unlikely(!zonelist_zone_valid(zone, ac)))
+			continue;
+
 		if (cpusets_enabled() &&
 			(alloc_flags & ALLOC_CPUSET) &&
 			!__cpuset_zone_allowed(zone, gfp_mask))
@@ -5236,6 +5252,9 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	for_next_zone_zonelist_nodemask(zone, z, ac.highest_zoneidx, ac.nodemask) {
 		unsigned long mark;
 
+		if (unlikely(!zonelist_zone_valid(zone, &ac)))
+			continue;
+
 		if (cpusets_enabled() && (alloc_flags & ALLOC_CPUSET) &&
 		    !__cpuset_zone_allowed(zone, gfp)) {
 			continue;
-- 
2.53.0-Meta

