Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD2B399351
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377328; cv=none; b=reKqivC0jdFXWKmlvj00BfDsufVy+zhPz/JUv9SY1bVFRv6F1g4jl+XMIsY3ntFPTGoCstTH63LFl0ZQGcqP/4urWQoyYxg84d9IQOdE6ATGAeN3ADBbLWZXPHEy1UK4ufp/jjf5kpNvq9JvBZm1TPO/o1CiHPLn7ugwVEv8rGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377328; c=relaxed/simple;
	bh=MqTE7K5pNhCo4/31s6/6kWidCPt4QuecBwAxB925n3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJ5MxpDNDHDK6j4C7K0l8RtikBqUAjORoekkp91+Ymp0TjadQPS4Qj2ymkU+JjwvHTQolFE6AobNvxNuAfL45f0KcgUI3gOpQrcQBf/EH5wksR8xsmp0dhTGN5/D25Zphrrn4KwhQnkQK6BSzf7Fzd/H8rLkbIhuLTT8nZcgQ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=c95Mf6l6; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Vxm+/P+M; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="c95Mf6l6";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Vxm+/P+M"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682IvUm93642350
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=0z2s
	UYS3bRxKw8oYeBvz7KheVev/gzBZgUkJzUWo5SA=; b=c95Mf6l6qAjpqtYgVvw0
	gB0qdUg83m/qkdW61GmXQEKNeQpPr5tfuu7G25qCm8oAGIqpxcFBFovovJhNIt+Q
	sm4UKt7Ey+OMpB8APfxXC5fCSq4aOLKOl4Tm4r6JKh7TRr2xinhsv0aok5KGWE2W
	H911hIv2F5wUhSL1jLZfOF2A7Vz0oq6rcTB3xHGoWinYr8UpiAZfEn3vckcwASe6
	u6Z4ViX5FrPkMp026WKzY5kjeSSObrb8mjr2rd2UiJVe097k7wL4l32DePxZdJlv
	bYfd9AHezGTPLcZvvkY4PHZesmDxaMQkB2H8AA1X5DUtWVpBHZNJODUq1UQt6Ifz
	3g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4geshp08yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:28:23 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cc915d1d9so21845316d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788377302; x=1788982102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0z2sUYS3bRxKw8oYeBvz7KheVev/gzBZgUkJzUWo5SA=;
        b=Vxm+/P+MyYTSwXwW1NZVs8ZBj0jM5Sso579MbOxyv1uFkekDCJWKQxleQiNPmDASpz
         kj/eaOpDciKXA4vpqI7Tf8S38ZE9Logr5wDBn8JfQLYelkKiWEhhS+DEG4H1PukSGMty
         5dpOHnaKmA82qUH92iMACvL+MFwzSBwr31S/3kMJXc9+eu+zTKw5u7u8+g1IGsVKS1cp
         i/O+u3vM+igbqBP5K8Na+PHTeAnIy35K4kWgBU23eXPaQIvYQI4ZFgIZv0+8sA25btsb
         hlX4iLB764K5sZuh//Zbs4agPDTghzs2BmISng6RKQNTQ2la4PZRsi0R38leVxMN+WFx
         i+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377302; x=1788982102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0z2sUYS3bRxKw8oYeBvz7KheVev/gzBZgUkJzUWo5SA=;
        b=sSU1bgSQF1FM2fKL2S8ZQCmB1lgJTayNbDMD3p729U01/SWMouQW7At7WN6D5xHBOb
         5n36VwWZ3HBJuJzE2qJ6qzLHGbJuOdDBgd22hF84xIT842Y9tLu4VL1qPGtcKBsDy+WI
         hMAyRZ+b6FbrM4cOes6HhIwCzJJ78NTDIakYOvc1VJ8Vhk65DFEW5+JCs3NCJpRonHkG
         pqKw9DZviJCZ6pOr4PbmgwbA1zYMCTjwk99/oar1m7HqfjvyiwEXFHYC5qvINInSF6wq
         HVDyqpy8F0kw8TFQxfcrdrIMYtyH7DdBEcVQ5aFqbnIFC5Mqg66bhMrzVY+gAeKpCROa
         LQUw==
X-Forwarded-Encrypted: i=1; AKwUvBz7W1uaDsM2oyOAnSxNcKtFFruOKZQ8DC6rqkp6ZMGmchjVphlrenkmy96dFfejKWSTBS4LHkYvJXqaGPk=@vger.kernel.org
X-Gm-Message-State: AFuF++mgkR6pwzS9Dp+uo3xNdy1czChabvMXyl56RkskIkIr4Bm105/6
	UcN4gguLM30V5LRPkdqcAk/V7fOTThz845Q8X0ZTTHd2ig/HOn6wvBO65Z1gTI9630/Po/xBXwK
	O7wwWJDsYl+Hl8zpwwV4Om+WVqY7QtzvJ9UOmEu5CcemufloP9rnnH+KLcHYtdw==
X-Gm-Gg: AYBFou3UevRhQg9N9jLC6o1gaDqzZBYrOTG0HbDqfvqQLMQxqdczUvqYTp7wwPAjnbI
	ekhkm4TDbGuJu0KolPJBaevAc56NpU/uSVBghnOTy2gic1PCICfccXBNyOl9FNvfzbsnXR7o7rH
	E5gY5HytEww17YG3fc+TU+jgk1pqRs1MhGb2UpWwZszCJXsbYvHMIH28/Xco5kHkr7K/lr0Ddg6
	XInigI9KUK7o762ISeeZDE+ZmnRyyKm4hqksw1ZDlsKPtziFf1kvNaKpDFgI9zx/D/E/xNdwQsK
	JeAf9gYp2ltVnoNhZQqjDKIVRxjGI3ef3h5XjTgAcoTt8jDp3EPUb02fRY2C622CCEKPmoNB36b
	G/sdJ03XDW+GM2abU5DxzTR5RtpQxkgo1Hs2T+cOGcORR/7T/kJmmaw==
X-Received: by 2002:a05:6214:459a:b0:90e:8495:b33c with SMTP id 6a1803df08f44-90e9f20406amr120753346d6.2.1788377302347;
        Wed, 02 Sep 2026 12:28:22 -0700 (PDT)
X-Received: by 2002:a05:6214:459a:b0:90e:8495:b33c with SMTP id 6a1803df08f44-90e9f20406amr120752136d6.2.1788377301664;
        Wed, 02 Sep 2026 12:28:21 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec85a0sm25420936d6.29.2026.09.02.12.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:21 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 15:27:49 -0400
Subject: [PATCH 03/11] mm: memcontrol: constify the lruvec helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-folio_memcg-const-v1-3-e2c1da22246d@columbia.edu>
References: <20260902-folio_memcg-const-v1-0-e2c1da22246d@columbia.edu>
In-Reply-To: <20260902-folio_memcg-const-v1-0-e2c1da22246d@columbia.edu>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788377294; l=7434;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=MqTE7K5pNhCo4/31s6/6kWidCPt4QuecBwAxB925n3w=;
 b=c9uAhsFeBBBtvIgXq+FIchS+b/wpJeP+BhGmEX5xOHyy+GDucmCaa6L3hZ4mszhUX1bhfyZIq
 dWF1STmz8XwBV6qBCZ9FPOwCSAY/jrUYsVZvW+W3lykd5JWWXmv2oje
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: xXCIX0aEiYSz-lOyH5DihgjL_0ZLblDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX662fyIFJnZql
 9ynYvhdLWARsnw13tKxoS6VLL7lHhlBqJBCdW4n+hAX0fQdhUPregLBrnkxlFdFCibbGLupZ7vl
 iflZEstY20zYP9lWPqKL/Axce0fP28fjDNAOVNdIzy8S2LdZNXfl6RCPJxkxGbQKCgAjQaoKBUN
 TC1p3LW+Ou6pHJUMjf6Xbztmgc4u2TGS6ieS37SartQt00cxwPIJRJeSuO2NYABM2RoUWepOfv6
 UTCFanGNN4YXozWR1erOsB/FuAAGcn8e5GDoZlfgG5e+RygpDVQa8VKO0DkNlb/NBRyQEG5rYq3
 YJiKentLOSWZ9jDhFsVEBvz2uL3BJ9szkraw7ND2IfzvM4DvkJXnD1TcZcsIy1rRJfLM3+3gfJa
 oZESA8B1OgN0gaUWnq6+7Mf9IAANEYd1UQtQkuqheu1x97ZdACsK8sJR1UzaAz3lLYEVzgINDUv
 YLllqhMTVJ2WXE2z57g==
X-Proofpoint-ORIG-GUID: xXCIX0aEiYSz-lOyH5DihgjL_0ZLblDc
X-Authority-Analysis: v=2.4 cv=J96aKgnS c=1 sm=1 tr=0 ts=6a9878d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=OahJJIsL82qy_ALkPHgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX9Dpk4EAjO4zx
 wMJHqOmNDCREyjQou+FTmiSpA9y4EMRvpl4BWXWk12FZYwmC8A75MuttYYn0mmNCxW4lnaIb8Zj
 rzOTm05DP4QAQXC7EXLOKfg51l8boNCJyQy58VKcxnTcblsyf5sz
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 bulkscore=10 adultscore=0 spamscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020172

The lruvec lookup helpers only read from the memcg, folio, or lruvec
they are given. Constify them, along with lruvec_pgdat().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 34 +++++++++++++++++-----------------
 include/linux/mmzone.h     |  2 +-
 mm/memcontrol.c            |  6 +++---
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 2b3b62e84ab2..4b7cc97e45b2 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -688,7 +688,7 @@ void mem_cgroup_migrate(struct folio *old, struct folio *new);
  * @pgdat combination. This can be the node lruvec, if the memory
  * controller is disabled.
  */
-static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
+static inline struct lruvec *mem_cgroup_lruvec(const struct mem_cgroup *memcg,
 					       struct pglist_data *pgdat)
 {
 	struct mem_cgroup_per_node *mz;
@@ -729,7 +729,7 @@ static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
  * their binding is stable if the returned lruvec matches the one the caller has
  * locked. Useful for lock batching.
  */
-static inline struct lruvec *folio_lruvec(struct folio *folio)
+static inline struct lruvec *folio_lruvec(const struct folio *folio)
 {
 	struct mem_cgroup *memcg = folio_memcg(folio);
 
@@ -745,9 +745,9 @@ struct mem_cgroup *get_mem_cgroup_from_current(void);
 
 struct mem_cgroup *get_mem_cgroup_from_folio(const struct folio *folio);
 
-struct lruvec *folio_lruvec_lock(struct folio *folio);
-struct lruvec *folio_lruvec_lock_irq(struct folio *folio);
-struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
+struct lruvec *folio_lruvec_lock(const struct folio *folio);
+struct lruvec *folio_lruvec_lock_irq(const struct folio *folio);
+struct lruvec *folio_lruvec_lock_irqsave(const struct folio *folio,
 						unsigned long *flags);
 
 static inline
@@ -827,7 +827,7 @@ static inline struct mem_cgroup *mem_cgroup_from_seq(struct seq_file *m)
 	return mem_cgroup_from_css(seq_css(m));
 }
 
-static inline struct mem_cgroup *lruvec_memcg(struct lruvec *lruvec)
+static inline struct mem_cgroup *lruvec_memcg(const struct lruvec *lruvec)
 {
 	struct mem_cgroup_per_node *mz;
 
@@ -885,7 +885,7 @@ void mem_cgroup_update_lru_size(struct lruvec *lruvec, enum lru_list lru,
 		int zid, long nr_pages);
 
 static inline
-unsigned long mem_cgroup_get_zone_lru_size(struct lruvec *lruvec,
+unsigned long mem_cgroup_get_zone_lru_size(const struct lruvec *lruvec,
 		enum lru_list lru, int zone_idx)
 {
 	struct mem_cgroup_per_node *mz;
@@ -1175,13 +1175,13 @@ static inline void mem_cgroup_migrate(struct folio *old, struct folio *new)
 {
 }
 
-static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
+static inline struct lruvec *mem_cgroup_lruvec(const struct mem_cgroup *memcg,
 					       struct pglist_data *pgdat)
 {
 	return &pgdat->__lruvec;
 }
 
-static inline struct lruvec *folio_lruvec(struct folio *folio)
+static inline struct lruvec *folio_lruvec(const struct folio *folio)
 {
 	struct pglist_data *pgdat = folio_pgdat(folio);
 	return &pgdat->__lruvec;
@@ -1241,7 +1241,7 @@ static inline void mem_cgroup_put(struct mem_cgroup *memcg)
 {
 }
 
-static inline struct lruvec *folio_lruvec_lock(struct folio *folio)
+static inline struct lruvec *folio_lruvec_lock(const struct folio *folio)
 {
 	struct pglist_data *pgdat = folio_pgdat(folio);
 
@@ -1250,7 +1250,7 @@ static inline struct lruvec *folio_lruvec_lock(struct folio *folio)
 	return &pgdat->__lruvec;
 }
 
-static inline struct lruvec *folio_lruvec_lock_irq(struct folio *folio)
+static inline struct lruvec *folio_lruvec_lock_irq(const struct folio *folio)
 {
 	struct pglist_data *pgdat = folio_pgdat(folio);
 
@@ -1259,7 +1259,7 @@ static inline struct lruvec *folio_lruvec_lock_irq(struct folio *folio)
 	return &pgdat->__lruvec;
 }
 
-static inline struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
+static inline struct lruvec *folio_lruvec_lock_irqsave(const struct folio *folio,
 		unsigned long *flagsp)
 {
 	struct pglist_data *pgdat = folio_pgdat(folio);
@@ -1314,7 +1314,7 @@ static inline struct mem_cgroup *mem_cgroup_from_seq(struct seq_file *m)
 	return NULL;
 }
 
-static inline struct mem_cgroup *lruvec_memcg(struct lruvec *lruvec)
+static inline struct mem_cgroup *lruvec_memcg(const struct lruvec *lruvec)
 {
 	return NULL;
 }
@@ -1325,7 +1325,7 @@ static inline bool mem_cgroup_online(struct mem_cgroup *memcg)
 }
 
 static inline
-unsigned long mem_cgroup_get_zone_lru_size(struct lruvec *lruvec,
+unsigned long mem_cgroup_get_zone_lru_size(const struct lruvec *lruvec,
 		enum lru_list lru, int zone_idx)
 {
 	return 0;
@@ -1465,7 +1465,7 @@ static inline void mem_cgroup_flush_workqueue(void) { }
 static inline int mem_cgroup_init(void) { return 0; }
 #endif /* CONFIG_MEMCG */
 
-static inline struct lruvec *parent_lruvec(struct lruvec *lruvec)
+static inline struct lruvec *parent_lruvec(const struct lruvec *lruvec)
 {
 	struct mem_cgroup *memcg;
 
@@ -1528,8 +1528,8 @@ static inline void lruvec_unlock_irqrestore(struct lruvec *lruvec, unsigned long
 }
 
 /* Test requires a stable folio->memcg binding, see folio_memcg() */
-static inline bool folio_matches_lruvec(struct folio *folio,
-		struct lruvec *lruvec)
+static inline bool folio_matches_lruvec(const struct folio *folio,
+		const struct lruvec *lruvec)
 {
 	return lruvec_pgdat(lruvec) == folio_pgdat(folio) &&
 	       lruvec_memcg(lruvec) == folio_memcg(folio);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 84e237f2c17d..8e1e3a50757a 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1657,7 +1657,7 @@ extern void init_currently_empty_zone(struct zone *zone, unsigned long start_pfn
 
 extern void lruvec_init(struct lruvec *lruvec);
 
-static inline struct pglist_data *lruvec_pgdat(struct lruvec *lruvec)
+static inline struct pglist_data *lruvec_pgdat(const struct lruvec *lruvec)
 {
 #ifdef CONFIG_MEMCG
 	return lruvec->pgdat;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index b9bf655cdd2d..e2845f761e37 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1441,7 +1441,7 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
  *
  * Return: The lruvec this folio is on with its lock held and rcu read lock held.
  */
-struct lruvec *folio_lruvec_lock(struct folio *folio)
+struct lruvec *folio_lruvec_lock(const struct folio *folio)
 {
 	struct lruvec *lruvec;
 
@@ -1469,7 +1469,7 @@ struct lruvec *folio_lruvec_lock(struct folio *folio)
  * Return: The lruvec this folio is on with its lock held and interrupts
  * disabled and rcu read lock held.
  */
-struct lruvec *folio_lruvec_lock_irq(struct folio *folio)
+struct lruvec *folio_lruvec_lock_irq(const struct folio *folio)
 {
 	struct lruvec *lruvec;
 
@@ -1498,7 +1498,7 @@ struct lruvec *folio_lruvec_lock_irq(struct folio *folio)
  * Return: The lruvec this folio is on with its lock held and interrupts
  * disabled and rcu read lock held.
  */
-struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
+struct lruvec *folio_lruvec_lock_irqsave(const struct folio *folio,
 		unsigned long *flags)
 {
 	struct lruvec *lruvec;

-- 
2.39.5

