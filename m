Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499237;
	b=YA6dbwzLnkYmMx0AzEyAmYmsFiirUq3TI5ylMte/BX48pfWCtb0xdqyqW522GBdUSp0Z
	 lFbRx+cBKs0FWuYwSFEBUoBY78fJuvtqC397Sei+GDqaJ6r1cboIi/qAtrVelAIEkXd3Y
	 mXetloOC0zHxgOnHSu/DjQT3CVeK9bMcY5WLXWeZhcw9VhUkujYMAkIaVKu2ocygVZYQG
	 wI5bELypOzCEj/qHVsVk6LFdy0SXD3mgTj+a+/6kbF0wUAXs1OQYKEOZesAsqTuvANEsw
	 FfI7vF7U0v8E6HcGcGUZX4Nh2S0HfWJhtSQ5TnfFc1h/AxjaWRqGaNfHDmVVJ9xhUfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KAOVkIrNNyhi9D/V3dLJ+NSr5WjrzmwZ1Aks/FNVQtc=;
	b=WQHpMmnpNLfq1Wq0myDQ0pUXg8uQFQj/iFd9fmysg6tEauebpemTylRqX6dTHo4U5PP3
	 8M44bh02fEHoTaKWhttMXyQUzo2Cxij4iq+XR9dBMXNhDvPkMGUmPX4VdSbQl9qStF8eu
	 DalWleFw332ukGQKy1ZlT0S12gmLma7uvvR7F2aQEw/XrZZtcNMGHki+tkFqUJSsAnLRi
	 UR5TytwW+B6oigAP/bD6LVO1UBheABYIY842AEfNCL/VkLHZ1crx/wQhRtMD0goS+vbH5
	 HzfqZcEkxm0q6zyLVLx0kNDcZbIE5DduDNTFAjff5BHT7cOhm1PVNSvduxdhifq9Lxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=GQZwPZut;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB3606A33E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AB3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=GQZwPZut
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-945ae2daa3eso39835885a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793499231; x=1794104031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAOVkIrNNyhi9D/V3dLJ+NSr5WjrzmwZ1Aks/FNVQtc=;
        b=GQZwPZut1+f0LNuk58xvNeHpw5iZVxdxph21KZg7S3cQYqlDaYoC2soU2pe5O0tbrr
         ZM77qC5FcogyagTiVBGGa20b5p+8WvYkrdxZAWuUpyvziaCPjLrF2Zc7+ltF/e99szjW
         IB0LdH3ROzeg288FHmXf23WAI83PduKfy/e2rBeeEQLjyTEmaqMfECko8xjHJnRjkx9m
         MK/ALbLe8W5W8N14SARnsl8bpxsWg2BRRsVPQXFdsk9cwlLQ+GoFtOeM5yqPuMOBJOO4
         crUFvgoV5iOdeGERJZGRRNcww1RBUg63cGdm1q3rd5lQFfoHAgV6sVQKxU8yU8MMdtHT
         upHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793499231; x=1794104031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAOVkIrNNyhi9D/V3dLJ+NSr5WjrzmwZ1Aks/FNVQtc=;
        b=N48EzHWUo7++F5mVHijJjpa3NfimumG2qI3NGP56XKcNDb8IbC53DuseW6DtZPFU+9
         uWAO7BnmvkjTkj6ncBao3FIcj7nOFxeEbB99si5btJEAJ/r1ExdSI72QGqOzosTvMuzG
         PdocZTu5+Sn9NkmomDinVQUAZeol1rV7dtDjxCZAmpkW9HCje3fT2ICgytADpmfnNLkm
         /7TceqTQtA0HBH9//TfLr1982zV3HfitafvWHTE2Uvr89RpndYtw3RifwwDiPV/10CRu
         f6k75etqMdT/6/HDvCZ9qPeHClB776KqXs63dzSzd+abEPETAX1qsG3glDRgBhHpkvRF
         DZ5g==
X-Forwarded-Encrypted: i=1; AKwUvBz3h3DZsKrxDqMPu8CMhZOUw5hsI3pm0jQ6UFHu4X5ZwBYwaXBhxlpovJXoKb815MYC2NqsyuE3KruScNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL1uOtUu/1MHL2RdS48cDjKi0r+z1pUABpx5Xomh0TpWgkfXw3
	k+U5w37WoDACGhAI3HfNmfaoBfi2AuwsfEsoPzZ1quDVJkMZ6QGcWuPMXysFU1p/C5g=
X-Gm-Gg: AYBFou1C/0kwROMhsK56RYWx1mBEv5Lt57+s3icejNqqcaRDS7BU34/kfvn8AcJv5nC
	xeqqft1lqDe3iQQBL8vqLveVk2ZuFWrJnPIwy6N4MVV2tH79TZKhKZBz8Je0TgPb2E34WpZ8Yoo
	ZARymwFNWPuCEo4day98ZnEYyeXMSetsQS4Twoi0SpykwIHMWFfXT4hWPVljISFAuwRUIdyVZQb
	gXzRF04u34nSo/pcsOk+rBc5eVT2CQd4OHod7hBt1e2nAnzl+fmxkNlYohHcShgbRnsdwLjmZk5
	hfHtTFK0LpUg6v467tuAek/EyVQ6AT+tgu0Z0tQGp4rJ2zi7wPtBZAnGdhyFxwf4jQtoAFjXWE/
	zfnRT0ZkMfz0MWeaVDj5IcJV7/HmmRKqsydAByWAB0o3KXo8AvwEIVu/o4gMYPjYu+UTnlO4fD1
	ZyFdhp+SqVesvslYw+EOmsLd44uM9fEnUScVYZAUX+VcSbCKKkp6OKl1GFsBCHjJUMlyQFtCNUQ
	711q+itpDrKZrO6Im+jx9WHDaRx9PG0xWXm1Cbpx5bB5HNx4ZKRvFsSYijf713T4BIWNFzydMSZ
	P0p/WiOuk0E+X4mG53w1B828TOgVMNHuajxR54ona5+ynKN9kTLUJ8+Khsaa2L9wPBg2EAKM3l0
	GSKS4AuTSJA==
X-Received: by 2002:a05:620a:254a:b0:93e:6325:ae6d with SMTP id af79cd13be357-9442175ae31mr1053484485a.40.1793499231477;
        Sat, 31 Oct 2026 19:13:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425858552sm498131985a.18.2026.10.31.19.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 19:13:51 -0700 (PDT)
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
	Josef Bacik <josef@toxicpanda.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 03/12] mm, page_alloc: pass zone pointer to trace_reclaim_retry_zone
Date: Sat, 31 Oct 2026 22:13:31 -0400
Message-ID: <20261101021340.2251928-4-gourry@gourry.net>
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

From: Josef Bacik <josef@toxicpanda.com>

should_reclaim_retry() walks a zonelist and passes the zoneref pointer
to the reclaim_retry_zone tracepoint, which loads the zone from the
entry again to find the node.

Memory hotplug rebuilds the zonelists in place while allocations are
under way. When a zone in front of the zoneref entry has become empty,
the entries move up, and this one can be the end marker by the time the
tracepoint looks at it. zonelist_node_idx() then dereferences a NULL
zone. Short of that, the event can name another zone than the one its
numbers belong to.

Pass the zone pointer instead of the zoneref pointer.

Fixes: d379f01de095 ("oom, trace: add oom detection tracepoints")
Cc: <stable@vger.kernel.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/trace/events/oom.h | 8 ++++----
 mm/page_alloc.c            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/trace/events/oom.h b/include/trace/events/oom.h
index 9f0a5d1482c4..cbcf6fe4cc61 100644
--- a/include/trace/events/oom.h
+++ b/include/trace/events/oom.h
@@ -33,7 +33,7 @@ TRACE_EVENT(oom_score_adj_update,
 
 TRACE_EVENT(reclaim_retry_zone,
 
-	TP_PROTO(struct zoneref *zoneref,
+	TP_PROTO(struct zone *zone,
 		int order,
 		unsigned long reclaimable,
 		unsigned long available,
@@ -41,7 +41,7 @@ TRACE_EVENT(reclaim_retry_zone,
 		int no_progress_loops,
 		bool wmark_check),
 
-	TP_ARGS(zoneref, order, reclaimable, available, min_wmark, no_progress_loops, wmark_check),
+	TP_ARGS(zone, order, reclaimable, available, min_wmark, no_progress_loops, wmark_check),
 
 	TP_STRUCT__entry(
 		__field(	int, node)
@@ -55,8 +55,8 @@ TRACE_EVENT(reclaim_retry_zone,
 	),
 
 	TP_fast_assign(
-		__entry->node = zonelist_node_idx(zoneref);
-		__entry->zone_idx = zonelist_zone_idx(zoneref);
+		__entry->node = zone_to_nid(zone);
+		__entry->zone_idx = zone_idx(zone);
 		__entry->order = order;
 		__entry->reclaimable = reclaimable;
 		__entry->available = available;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 1850a41f24f7..e14d550d4128 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4670,7 +4670,7 @@ should_reclaim_retry(gfp_t gfp_mask, unsigned order,
 		 */
 		wmark = __zone_watermark_ok(zone, order, min_wmark,
 				ac->highest_zoneidx, alloc_flags, available);
-		trace_reclaim_retry_zone(z, order, reclaimable,
+		trace_reclaim_retry_zone(zone, order, reclaimable,
 				available, min_wmark, *no_progress_loops, wmark);
 		if (wmark) {
 			ret = true;
-- 
2.56.0

