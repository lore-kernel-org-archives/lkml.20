Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F6C56E067
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883074; cv=none; b=jzg5BaR+D7UAPRjiJbeGNl8HaIK+dbuPg1eD02gmhidB08pfa6WWUbxq9uxXzuAq//LCUuDPGwOhKGGg/L1szl6FsJkqYWhXBTMChArC4gdXqbuX5JZz9DVG7D656dGRSs+aVe9ehcCTba1hCW+ZuYr+IiPHUxeCegwltf0Rm9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883074; c=relaxed/simple;
	bh=/+62ulVzAM2WXnRhGUmPvVQj53n/Y8t1Wv5NdXRJejI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DAbhB03/SR3n+F8/Eb+XMHPHXI70DHzeBK9PymDr075FblvlrQPp6mbknoZCsvQIDVZHx0BWhO0oaPJsva+uBlg2s9Nr7WIltUlOHDKBKLOxUYXdBi7OQJhUYRiBVu0ot0A5/GFpVow2V+erEou2qPFN6FbtxiHPmiwfk+rtjqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=jn6ISzO0; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ucQvHF9U; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="jn6ISzO0";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ucQvHF9U"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FbjwM426569
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=2q7+
	pK/fegvYO/+H/qvJUigNWbet/T2/smxNKvcI9ds=; b=jn6ISzO0RRsjI2PFcS3N
	AO1O6lCxHPub8krMWbboGE5MUX5VvM4lsoGzXMDjV32MpMviOAxlzULP9eHWVaGL
	StbjXmrC96kWIX0abBypOO1isKiCxDxCdBv+CZiJFIgRuopj5BJlaCCyZo5OlOoC
	FQyZ9Y1LruBeNtv8kh0dHowU2sIbApGhvx36yXecwoJHmFe1QY8h+ulxEK4NvAJ0
	D1k+KVFBt8oeSfiUbOITCv3G8kAOLwN8eaR6czj/13MxpJ5GtJgnDqxNF7RZ5F1G
	43a3ejXWKX6JTyUCkkXMkUDKTyiCgYwjRYQa3AwZz0u3ywdUPHFaevPPre87Ft6v
	Rg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjmv7geyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:57:50 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d33c89a29so106159611cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788883069; x=1789487869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2q7+pK/fegvYO/+H/qvJUigNWbet/T2/smxNKvcI9ds=;
        b=ucQvHF9UXgJVGjmnobJRMYs7Ri/Vmib9Tu56EXiT+siFcSNfm0i+JnjsK571hDQIIN
         NAO7yGrS7CnlLsFdWIL8qZkYcek70Mey+0ivKqYBDQfhmoT5cecwzA4GUnfvFSzP1Ckj
         UaX/yFuLiA7JrCmSnoaMhBIF/6g+ZWjCq6+t+C1knGR5zMontQTTQaG9HCLqsqthD8nX
         PqNld0TQNZG/JgfbZaGx8DI4UjLAjikIsUHWButHoJ3xqnLBTRwCTQdDQEl9Ba1/3In+
         dloNpB/M81rIhWh6W+zgah08C9z7Z+rpVfegT3bwT8DJu0o1Gv54kjkHaYVr4Ns62+Tt
         wPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883069; x=1789487869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2q7+pK/fegvYO/+H/qvJUigNWbet/T2/smxNKvcI9ds=;
        b=FniKFBRVznNzSJW3vtUdjzebNGJlGDeNy4Gym5Pygum5WuPhFZqa3B5tT8r9Cs6hBy
         q+dGao+/oUnsFh8WualCDVU6OrsZY972hBbE91A0ZlibRWmubn/sbmfU+BZ8/t/ykxfS
         3ZQ3e3n8O2JPnFgAtsZxEnueh0KQqwxk3bliIfV6XQUnNwDzamxVHr1q7Anuwq4X9RSC
         2tbsWET6mrrbGFQ8QNFioRw2x+nJvllKMNZnMtKnKTp0PaClrqsCUBlc17+DcM8CAsex
         j6BK2+tKzVkEfGP3KJFpX9mO15kAX0V/E/djIDxEQi7E0idJhcdRp4BsBMLIjTVAw8Bu
         qIOw==
X-Forwarded-Encrypted: i=1; AKwUvBzpCRONEeYe9mFLMspJs6edBEUGr7h0JJvdsn96Vp3JO7M7Cn6S0pCD3PXuzzq//kMJf75pAgeOe0S/Z14=@vger.kernel.org
X-Gm-Message-State: AFuF++nSK6eWEv5jPcDF/Uxi29COHzQLzotyKyOB6ug/uzVJ8FFxGq0Y
	jwquHfuptGPyoI6VImNh1yD3OyrCUJ+yxM0Hyrcxiw2HkkIoZFSgUTG0OCXTD/bIzLzKCcC2nB0
	yPUO4Df8awheHxn7V13mrzo3RpcqdJbt1kEkacacjNr3/H6Bmuik2Jg8KbZEzNg==
X-Gm-Gg: AYBFou2tyiQf6dAJeme4P1IqzYzb2nZQBSY6IdJRyjnUcwrmxYaCXoGzlvpDo9RdeV3
	IZKNjceqfvILR2e8/tg8jt4IdnbBmyxJz3/xXOtJ9k3jk00bLjs/GLoAOF6ZjypDWgiTVexWq2U
	AAHMt6m0KfHD26ujZhGkMNht5ao59khE58VLoz76l8Gb91XOyfLpUb+bqfc4v/ElZXjW1+6qlMO
	FASGvdz/TRrlqM5GyszE3WbrEC28Ro8JoEVqK8WA9ydlsZNf1PcnOemz3MAowxamiFEfmEilF/3
	kqVXLC7pvcpTOSOyfPduMDA8OzSRCFYEovaZNd1lzpf53uulS4wPFD4ksqK5DkniwMIl7qf6H5+
	qHt/iTY8q/5sXRXa0c0LteSjpH//y9JgyQNWgvF2SLVmvDFXV
X-Received: by 2002:ac8:7fcc:0:b0:530:5152:75f0 with SMTP id d75a77b69052e-53054877858mr367351701cf.22.1788883068899;
        Tue, 08 Sep 2026 08:57:48 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:530:5152:75f0 with SMTP id d75a77b69052e-53054877858mr367350791cf.22.1788883068272;
        Tue, 08 Sep 2026 08:57:48 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53093295584sm27830461cf.13.2026.09.08.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:47 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:57:39 -0400
Subject: [PATCH v2 03/11] mm: memcontrol: constify the lruvec helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_memcg-const-v2-3-811e9f443409@columbia.edu>
References: <20260908-folio_memcg-const-v2-0-811e9f443409@columbia.edu>
In-Reply-To: <20260908-folio_memcg-const-v2-0-811e9f443409@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788883062; l=8627;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=/+62ulVzAM2WXnRhGUmPvVQj53n/Y8t1Wv5NdXRJejI=;
 b=/2UbPzrXSADG9Kn0tAviqEfSjsr2c2YqXCtkwjOFFU9fAPZ8gjJ3GpD1mXeo1sBfEzVfKuMrj
 NoGDbj9AqcABjBSVT9Bkb7oUKitfrh2oJ4MbGA+V/SCRhlTKxTJ7w1y
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX/XGofk1dbSzP
 xFYzQO0OD9EJ8EHXx0u6s/fRAnk095QPfh9B6oE6h0NSG33iqGlFsSzfuHJjG923WitUOeqvG7z
 XvGXyX0lCf9uZuC0LaallogNMu/dlFmHjvbSRlKH50QJdtAlbH5mup8xcomUeNIKs9sUGHIYw7z
 Du+rRBK7qcfygVtdBzKQ8pmXbHP7vCf/FzXyw/ZLSU1mSv7vQQdiXbRyRnChEuXP9jVxsC2WsH2
 rWdeBHHwY/mLos+t094n0wcFhdYCnaOnnCzdGCL81dlAeQT6V0pv6MlzRpY1aNJ1pNMEMmsAlo6
 CahUIV+7Yc+Fy2FZcbbMLNQfb0mYIsueE8DfJTnQ9LZhtcyYtCvlI2OySJqeDDMbVhz93Q4aMrd
 Bc//ND2YUb0sBdfRTONrGZYcF+cfoRuYG0xrK8PTopSbpMGVHXkFsRH5GSSoiNarG2lxm23uYAA
 qRiP/uE8eqBtPBUKz5Q==
X-Proofpoint-ORIG-GUID: ILi-raEriar8amM_u7CyYzTEC97P3Om6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX/NMAUefrZkoT
 kPAeiRLs3c3BP039wVfCdPsLnTzUOGBmahsyPAWkphJz3QA8JsKiwSy+2OeMwHuLbOYX4O2wjzD
 o/VxH16ctWHgwo14Q4RZp/eM+MR1b7w/EzC0vMzPL40Oo/qYPpHf
X-Authority-Analysis: v=2.4 cv=fpnsol4f c=1 sm=1 tr=0 ts=6aa0307e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=KOoHFShP43Ts9fVHKv0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ILi-raEriar8amM_u7CyYzTEC97P3Om6
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=10 impostorscore=10 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080172

The lruvec lookup helpers only read from the memcg, folio, or lruvec
they are given. Constify them, along with lruvec_pgdat() and the folio
argument of the folio_lruvec_relock_irq() helpers. mem_cgroup_lruvec()
may update lruvec->pgdat for a newly onlined node, but that lives in
the per-node structure, not the memcg.

Use container_of_const() in lruvec_memcg() while at it, so the const
isn't silently cast away.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 42 +++++++++++++++++++++---------------------
 include/linux/mmzone.h     |  2 +-
 mm/memcontrol.c            |  6 +++---
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index d2577a064894..dde828a1206f 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -722,7 +722,7 @@ void mem_cgroup_migrate(struct folio *old, struct folio *new);
  * @pgdat combination. This can be the node lruvec, if the memory
  * controller is disabled.
  */
-static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
+static inline struct lruvec *mem_cgroup_lruvec(const struct mem_cgroup *memcg,
 					       struct pglist_data *pgdat)
 {
 	struct mem_cgroup_per_node *mz;
@@ -763,7 +763,7 @@ static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
  * their binding is stable if the returned lruvec matches the one the caller has
  * locked. Useful for lock batching.
  */
-static inline struct lruvec *folio_lruvec(struct folio *folio)
+static inline struct lruvec *folio_lruvec(const struct folio *folio)
 {
 	struct mem_cgroup *memcg = folio_memcg(folio);
 
@@ -779,9 +779,9 @@ struct mem_cgroup *get_mem_cgroup_from_current(void);
 
 struct mem_cgroup *get_mem_cgroup_from_folio(const struct folio *folio);
 
-struct lruvec *folio_lruvec_lock(struct folio *folio);
-struct lruvec *folio_lruvec_lock_irq(struct folio *folio);
-struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
+struct lruvec *folio_lruvec_lock(const struct folio *folio);
+struct lruvec *folio_lruvec_lock_irq(const struct folio *folio);
+struct lruvec *folio_lruvec_lock_irqsave(const struct folio *folio,
 						unsigned long *flags);
 
 static inline
@@ -861,14 +861,14 @@ static inline struct mem_cgroup *mem_cgroup_from_seq(struct seq_file *m)
 	return mem_cgroup_from_css(seq_css(m));
 }
 
-static inline struct mem_cgroup *lruvec_memcg(struct lruvec *lruvec)
+static inline struct mem_cgroup *lruvec_memcg(const struct lruvec *lruvec)
 {
-	struct mem_cgroup_per_node *mz;
+	const struct mem_cgroup_per_node *mz;
 
 	if (mem_cgroup_disabled())
 		return NULL;
 
-	mz = container_of(lruvec, struct mem_cgroup_per_node, lruvec);
+	mz = container_of_const(lruvec, struct mem_cgroup_per_node, lruvec);
 	return mz->memcg;
 }
 
@@ -919,7 +919,7 @@ void mem_cgroup_update_lru_size(struct lruvec *lruvec, enum lru_list lru,
 		int zid, long nr_pages);
 
 static inline
-unsigned long mem_cgroup_get_zone_lru_size(struct lruvec *lruvec,
+unsigned long mem_cgroup_get_zone_lru_size(const struct lruvec *lruvec,
 		enum lru_list lru, int zone_idx)
 {
 	long val;
@@ -1215,13 +1215,13 @@ static inline void mem_cgroup_migrate(struct folio *old, struct folio *new)
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
@@ -1281,7 +1281,7 @@ static inline void mem_cgroup_put(struct mem_cgroup *memcg)
 {
 }
 
-static inline struct lruvec *folio_lruvec_lock(struct folio *folio)
+static inline struct lruvec *folio_lruvec_lock(const struct folio *folio)
 {
 	struct pglist_data *pgdat = folio_pgdat(folio);
 
@@ -1290,7 +1290,7 @@ static inline struct lruvec *folio_lruvec_lock(struct folio *folio)
 	return &pgdat->__lruvec;
 }
 
-static inline struct lruvec *folio_lruvec_lock_irq(struct folio *folio)
+static inline struct lruvec *folio_lruvec_lock_irq(const struct folio *folio)
 {
 	struct pglist_data *pgdat = folio_pgdat(folio);
 
@@ -1299,7 +1299,7 @@ static inline struct lruvec *folio_lruvec_lock_irq(struct folio *folio)
 	return &pgdat->__lruvec;
 }
 
-static inline struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
+static inline struct lruvec *folio_lruvec_lock_irqsave(const struct folio *folio,
 		unsigned long *flagsp)
 {
 	struct pglist_data *pgdat = folio_pgdat(folio);
@@ -1354,7 +1354,7 @@ static inline struct mem_cgroup *mem_cgroup_from_seq(struct seq_file *m)
 	return NULL;
 }
 
-static inline struct mem_cgroup *lruvec_memcg(struct lruvec *lruvec)
+static inline struct mem_cgroup *lruvec_memcg(const struct lruvec *lruvec)
 {
 	return NULL;
 }
@@ -1365,7 +1365,7 @@ static inline bool mem_cgroup_online(struct mem_cgroup *memcg)
 }
 
 static inline
-unsigned long mem_cgroup_get_zone_lru_size(struct lruvec *lruvec,
+unsigned long mem_cgroup_get_zone_lru_size(const struct lruvec *lruvec,
 		enum lru_list lru, int zone_idx)
 {
 	return 0;
@@ -1505,7 +1505,7 @@ static inline void mem_cgroup_flush_workqueue(void) { }
 static inline int mem_cgroup_init(void) { return 0; }
 #endif /* CONFIG_MEMCG */
 
-static inline struct lruvec *parent_lruvec(struct lruvec *lruvec)
+static inline struct lruvec *parent_lruvec(const struct lruvec *lruvec)
 {
 	struct mem_cgroup *memcg;
 
@@ -1568,15 +1568,15 @@ static inline void lruvec_unlock_irqrestore(struct lruvec *lruvec, unsigned long
 }
 
 /* Test requires a stable folio->memcg binding, see folio_memcg() */
-static inline bool folio_matches_lruvec(struct folio *folio,
-		struct lruvec *lruvec)
+static inline bool folio_matches_lruvec(const struct folio *folio,
+		const struct lruvec *lruvec)
 {
 	return lruvec_pgdat(lruvec) == folio_pgdat(folio) &&
 	       lruvec_memcg(lruvec) == folio_memcg(folio);
 }
 
 /* Don't lock again iff page's lruvec locked */
-static inline struct lruvec *folio_lruvec_relock_irq(struct folio *folio,
+static inline struct lruvec *folio_lruvec_relock_irq(const struct folio *folio,
 		struct lruvec *locked_lruvec)
 {
 	if (locked_lruvec) {
@@ -1590,7 +1590,7 @@ static inline struct lruvec *folio_lruvec_relock_irq(struct folio *folio,
 }
 
 /* Don't lock again iff folio's lruvec locked */
-static inline void folio_lruvec_relock_irqsave(struct folio *folio,
+static inline void folio_lruvec_relock_irqsave(const struct folio *folio,
 		struct lruvec **lruvecp, unsigned long *flags)
 {
 	if (*lruvecp) {
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index c9ae7991a8b2..da6f84530022 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1660,7 +1660,7 @@ extern void init_currently_empty_zone(struct zone *zone, unsigned long start_pfn
 
 extern void lruvec_init(struct lruvec *lruvec);
 
-static inline struct pglist_data *lruvec_pgdat(struct lruvec *lruvec)
+static inline struct pglist_data *lruvec_pgdat(const struct lruvec *lruvec)
 {
 #ifdef CONFIG_MEMCG
 	return lruvec->pgdat;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1ad7de092611..49d2e7e3c023 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1463,7 +1463,7 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
  *
  * Return: The lruvec this folio is on with its lock held and rcu read lock held.
  */
-struct lruvec *folio_lruvec_lock(struct folio *folio)
+struct lruvec *folio_lruvec_lock(const struct folio *folio)
 {
 	struct lruvec *lruvec;
 
@@ -1491,7 +1491,7 @@ struct lruvec *folio_lruvec_lock(struct folio *folio)
  * Return: The lruvec this folio is on with its lock held and interrupts
  * disabled and rcu read lock held.
  */
-struct lruvec *folio_lruvec_lock_irq(struct folio *folio)
+struct lruvec *folio_lruvec_lock_irq(const struct folio *folio)
 {
 	struct lruvec *lruvec;
 
@@ -1520,7 +1520,7 @@ struct lruvec *folio_lruvec_lock_irq(struct folio *folio)
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

