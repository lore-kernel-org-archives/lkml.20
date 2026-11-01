Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499243;
	b=gAsXGD2QhMcxBzGSCGLJTr3XHNenvf2EVuNj0K6g2tgXXHVa9hknYJZnPZgLQNpiKq4z
	 bkxtIbxSR3JU458yF3XtQ4pc0G455UK9dVXfgyJPY4s7o59joto245HDA/5D4f+BwGbLA
	 m+n6Pi1zsSiH8sW7ChcKQ0hQ0J/pkYoxFtahY5eNQqypXnaQ07Y78/sI7FKET/eB+3zWt
	 q3y1GMARavqpWqIG2Twd+zvdV1sSpk/fb9RL1QQxVjESuC55GkCyFyOvrukxRCmU2ZWX2
	 jN9fESVjpqHsSmOnem8DH/cag+mBEyTE7ZN2XmNYeksPJ4nxO/l5pF2DKpwxkt/EXvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PsOknrkq/nzec9hQG23km3v2sM//hYMRVRxTHFDDb+s=;
	b=ZhQRHWyKU5fx37wNIufhhzKK4Ba19aywbQ2ZniEPRjZ/Ic5eyFiwqlDrvZ4nk1g+/cJ4
	 L9denECFaM/VUlL9Qim1j4TXe7WJ8rvOFh8KHlCNIM8kFhAJxb9YL/ZvisGEdxz2SQWpE
	 kXW3IjTOfh3WZxYbg0w3dET6ncywNNh7TgrwYMz9C9VNog+LVGIT6rLizeWGKxNo76rmr
	 VFz/8574PdDIwKMhXucT62lWt3h6YHjqsIVwEqlLr+nhFd/6mOcwff4OnI0RH8Qv9FNBG
	 8cumLJKAWuXwDvi6mD3qzwKuGrFaan0CRvLRRX1TsPlJzutrCKLNN0OYzWNhn2SZBmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="H/L+nA9j";
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0E2606A32F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB0E2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=H/L+nA9j
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f20c3aaa5so205267685a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793499238; x=1794104038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsOknrkq/nzec9hQG23km3v2sM//hYMRVRxTHFDDb+s=;
        b=H/L+nA9jNizIm/iixoLRh1fmKt4I7O+jnIUupPKcZ/0xeRQEkk9svkGxMoN6A+8+Eo
         F8N34TrsvjwnymM2DpnGBCCWXp7hpqDpb4Af+Nj2BQRyOx3PbIAXiYrJ+yzKE7C3rRwj
         gIvMYNIBFusvovNyfROiuFl3AQG2m6xvwikiJdU1F4ZG5DoXZmqINu2F8DHiok5GTU6S
         1Jnm45OspMEHCl2fFapGV7BT9v8L5lw5MnIbM9jKybmAwuAwB5SRr0yOEhD7O8OgBbYN
         awMKxVAL6++0JEY5JinhPTKHctCI0LPTbyEavcuwa3NdazWQRTgVqiit/991KsZr6pQE
         7/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793499238; x=1794104038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PsOknrkq/nzec9hQG23km3v2sM//hYMRVRxTHFDDb+s=;
        b=q8O1acBQvZbGOfI4QMwkw/Rdvabxdu/KW2qDMGKLapKecUPY592OmO/xAgK1zTYbMB
         TkSrto1ZZm4wTxis6BpwXMHPBy3gBRFNHtxF8CXU2NTzGXE0/14evnP2+6EwuquZ8yW9
         QjOwILOy+xEWHpupc38ygQwO1//+wgb90G4fYTfeKAqWy8wmOzPDmjI99clXkXE9xqKq
         DMsXy2s4xkwlbthy7nla2DpuVxA75ZwcxTEowzAwf73UPD4rI9yZRrFlnLl+qvE+8os8
         I1TvjjOy5bcSL4v0d/lT90Uv7n0eAjbiOIeovZ/aY7PrCD0PPqzkjfAMnSpkOjqazyXr
         tdvg==
X-Forwarded-Encrypted: i=1; AKwUvByrYOY6t5dqZKwoGXi3kg94ImynueZvrugET2wLz/2RIxaqFawQeWORSCOVuHkb1D7rSFs+FFAYeWdoOw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2xA+DVyShjdSZsuW1gaXHNOJwWC/gTJEkwKe9F7PvT9f9xeih
	4HIhPHqkM4GA0PYmRaNapZWPsF5U0cu0fVFp6WCV/i6GhlrBl3uSA2TE3Uu3L6lr2KQ=
X-Gm-Gg: AYBFou1DGv299sCFnJhFUSQrhzcqU/iF/kyC40p+wGis0jxd8BlX717MYJT/dykCefT
	W6R9ymRshxrBLsJn/z7q6CDy1YKW+4dpvEKYJBHVyDBJul6hqMRmRDlvxSJy5dvwpDwFCY+gn8e
	cu3WO94TvDsNnJMqI9w9vwwSw+ruVZCp/UuDA/oFQ6m3nNKJHzemyj93PLlWWVajP1Q7WVnYtTy
	uXpXbgWTJ/s0us1hUotmTTZ/Wk10YG+4JFtUcM7T+DZGhRdK3NFOc0zpfePWKaf7dPJ4p41+ops
	ilzdfq5qvXX8dn6D+PTZISqkaSSjJVU5/0YS54+Kg5uDGi4ZaPOlIdxYka9qGIQTxcRxLD7nsKQ
	ub/cyd5FxH28YXSzyUUdiSACyrCgb+Ryd24XfBVnUTLDXtgFC5dnI8HJHKWemsqsNSziSNx8EDb
	DqhRYTtl/ZirwH23hMB51G1rkiQeRn5JmFVLQ20XeSqeNtLQWy8jzrFn8QjVEoHsDWooMs/Ov50
	RhNZMJl2FZhDa35tGPRaUOvE7dr7/yBReMLX26E8LII/VLfZHPlQ9f1gIrsd0KnJijWNfPktFKG
	tY/41Pq46GmH4kpvySSTypDA/oJNL7zyYJhDp3loDr6SnQEEO60AdznS2qzwZ2o12wLY7fXP7sv
	z9u0XO2O7Sg==
X-Received: by 2002:a05:620a:45a5:b0:93e:e175:ee92 with SMTP id af79cd13be357-9442175ae0emr1102271485a.39.1793499238054;
        Sat, 31 Oct 2026 19:13:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425858552sm498131985a.18.2026.10.31.19.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 19:13:57 -0700 (PDT)
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
Subject: [PATCH v5 07/12] mm/mmzone: read each zoneref slot once when filtering by nodemask
Date: Sat, 31 Oct 2026 22:13:35 -0400
Message-ID: <20261101021340.2251928-8-gourry@gourry.net>
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

__next_zones_zonelist() tests a slot's zone for NULL, then reads the
slot again to look up the zone's node. Offlining a zone's last block
rebuilds the zonelists in place, so the second read can return the
terminator:

  CPU 0                             CPU 1
  __next_zones_zonelist(nodemask)
    zonelist_zone(slot 1) = NORMAL
                                    offline_pages()
                                      build_all_zonelists()
                                        [MOVABLE, NORMAL, NULL]
                                        -> [NORMAL, NULL]
    zref_in_nodemask(slot 1)
      zone_to_nid(NULL)

Current GCC and clang merge the two reads, but nothing requires it.
With mm/mmzone.o built with -fno-inline -fno-ipa-sra, holding a
nodemask allocation between the reads while the node's last movable
block goes offline oopses every time:

  BUG: kernel NULL pointer dereference, address: 0000000000000060
  RIP: 0010:zone_to_nid+0x0/0x10
  Call Trace:
   zref_in_nodemask+0x9/0x20
   __next_zones_zonelist+0x23/0x70
   prepare_alloc_pages.constprop.0+0x16c/0x190
   __alloc_frozen_pages_noprof+0xaf/0x330

Read the slot once and test that zone. A NULL zone still ends the walk.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
 mm/mmzone.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/mm/mmzone.c b/mm/mmzone.c
index 9cc9ef588580..65880396f104 100644
--- a/mm/mmzone.c
+++ b/mm/mmzone.c
@@ -43,13 +43,14 @@ struct zone *next_zone(struct zone *zone)
 	return zone;
 }
 
-static inline int zref_in_nodemask(struct zoneref *zref,
-				   const nodemask_t *nodes)
+/* A NULL zone terminates the zonelist, so it ends the search. */
+static inline bool zone_in_nodemask(const struct zone *zone,
+				    const nodemask_t *nodes)
 {
 #ifdef CONFIG_NUMA
-	return node_isset(zonelist_node_idx(zref), *nodes);
+	return !zone || node_isset(zone_to_nid(zone), *nodes);
 #else
-	return 1;
+	return true;
 #endif /* CONFIG_NUMA */
 }
 
@@ -67,7 +68,7 @@ struct zoneref *__next_zones_zonelist(struct zoneref *z,
 			z++;
 	else
 		while (zonelist_zone_idx(z) > highest_zoneidx ||
-				(zonelist_zone(z) && !zref_in_nodemask(z, nodes)))
+		       !zone_in_nodemask(zonelist_zone(z), nodes))
 			z++;
 
 	return z;
-- 
2.56.0

