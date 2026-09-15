Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488E34BB264
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514440; cv=none; b=pI9l6NQO1NfHWzDLydVvIToxb1kJ0AnhY1WrYJ9M+BDFxzV/sYoie/4KvA+5MpuyMFQoStA0p1CHVb7WpJUD+RjUQ36qraBVB4qh5ztpIUrXaukIexE47g2QHbHg4jNzvjfPb/GObrx1hrjcE2D1rN1SEVWcmNmokVtFFDcVvQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514440; c=relaxed/simple;
	bh=QErkJjMmQvmsS88jxAIrE9Ky5O4EbrTfoXBaycDxTEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzDjDJs4x4UKewpxhpo+dkH42FBF+n9MT8/QQx2wZmXViL8Dy7vSI/mN9AUVP86o+PPb7n2nfPkPI71OD/8CIWczMICQRykiqLL5k0aYNbvD83+cnTjIg0aZ1PgZhMXPVmzG1fkm/tJ0siT+uYen9ojPStz7qEZ2vHroRgmtwLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fr8WCK0j; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ySbkz0g9; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fr8WCK0j";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ySbkz0g9"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FMbgRR3384220
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=xI8O
	6nUTdr8vwkC89YCiv/sTDb7PohQILvZ2tXdjQQ8=; b=fr8WCK0j0BHJre1/OWYc
	k5BDY+cpsNa2PQwGj9KsK9N7d0k32tcZueGCtDIq/Rank22cYs+usAlylHDOYvQb
	+kOK3USJNUZapFNdcIevYYedCV2jOsHR2R5UHQ21I2reof8c5hxEZp6RRr2LADYm
	W9CNbaMXkPXGuVwFyre9saYk4PNoNhpzvZ7EbGT1ApZqziM8RBlfSUhu8bDSgku6
	Cp63F9erILoQAlIxsGHRLXgKL3bxtLRivH9MM73b2VuOKcmT/S1Edgo5CpSgurrs
	sNDMwTYePbHISEo87rrduWZYOBeaqNbJrkrWgNjH1/U2BAv9agZBSjXBm5pDay6a
	cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gqbjfad7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:30 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f1847fb9so601580685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789514430; x=1790119230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xI8O6nUTdr8vwkC89YCiv/sTDb7PohQILvZ2tXdjQQ8=;
        b=ySbkz0g9Fe7rELskIwTPk+Uu7LxfFBQlC4iEzSAX4VoTgeXqOQHVR6oT8cmMfT+0gz
         YXgyh4bG7eLWA+3CsGKDG2omxWeyhpgUdAt4OxLkcxb470C7j+BCrGlg60eHzdI1llyE
         sk28U/xbmDrWO/2YrYZZuXvAAvpEiZA5UiWU/PnNS/TZGnme6TC76I6nXuDV6RqyClr/
         y2HhTKQHlLdAyETorHIif4pWqloEAocQhpU8iXmd3zj81Z9AF1/pQwnYD3Cu99yKIml0
         bfNkPInG9wkJyD3YfjTHRMeCteVgm/2uGz2pBfgZvEyExdP7d0QVdN1QcTaRGaAn+qvo
         529w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514430; x=1790119230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xI8O6nUTdr8vwkC89YCiv/sTDb7PohQILvZ2tXdjQQ8=;
        b=dmASzUT/1s2rp5Kd9fbABjKiQRjc9CJg44tuJMocBnlfLh135RJNvFsp2Z/F2hrrGB
         6Mtbmx0IvayALTCEmj6l9hVjWheHY7QQusNQm4dmlAK+V2Tlp08xVepTrxsaCIzEbirv
         Pha6+BXjz3re+w+bG/ijkIRFgWkeSWffxgh0xgNL+Q3UsDlT31I5TeEYor5r0AjoWfnJ
         dFXEL26u4/hAXe+0FDy2SZ0jRnnBVyKaqT8bwTiKE2soN1PfV2MbdFMkR2fCmuHbxrR0
         gvn7L9u9TvGJLw/YEo6pzLTP3jIOqDsEDKxjTn3me8JFwANX9p1dIVCEywa1Mj8H/oUl
         7xRw==
X-Forwarded-Encrypted: i=1; AKwUvBzoSbetpuyDPsxRGtZoqSoFnAqvjNw1PADZuCprqrBCjbtcPZYgLUoyr/fyu1mgl8vIvGlVt8nz0s+ZP/I=@vger.kernel.org
X-Gm-Message-State: AFuF++kTbP2pabT4sC2Nlui0bk0s7mvFK532F3VjHsSvr4r6uNGi+AUI
	grZlVwX0+fSerNGtFjzTMqH5gOkTlb9OSJ1c6m/s8fXaJxooKnTmRWgFiN5waa/xCNtlAyM+dqX
	estoEye1lqpX/7OXAjNRckNqYK91+EaLqFT2mHcztWwCaM+9cullH4uN3zGj2BA==
X-Gm-Gg: AYBFou2bnl7RX4PgX0vx9v5kZvewtOcyPeu/Vlpn8rWVW11rg+KesW+b9l6RiTR0N9e
	wI03B4AbpQ5jIYB0bCaei/oUdA9Jx4dJ1ksecpUNb8Oj5hFLCkTnJ7B/C1S+Etq/FD1sZeIuHD/
	R4GTQGP+JT8s7lcdp8USnKy5QC5k08cCR3mHfAUgm/fqNm7K/MYtNzHTKm6sMoef/b5VTSlbQ5P
	vyu5ltSNeEHiQ60PYnexW3TuLCwaowU9I2YAq995tFktFOl1X18PBXQJ/2bKtXmnMaUBjgFYnmz
	2AWPytO0WLI3HHZbRoSYK5/yuH1AETUKJEfcsq9bVUfCjuEppYX/HMuLnUfOpIyIc/MlYM0wSsS
	Pc/L0AHCJqYFFdjJCJH8LtD1rikfb3HJ6scOPyaPaNvYxjy8j
X-Received: by 2002:a05:620a:462c:b0:915:83f3:780d with SMTP id af79cd13be357-93bb785be63mr61981285a.32.1789514429845;
        Tue, 15 Sep 2026 16:20:29 -0700 (PDT)
X-Received: by 2002:a05:620a:462c:b0:915:83f3:780d with SMTP id af79cd13be357-93bb785be63mr61974785a.32.1789514429367;
        Tue, 15 Sep 2026 16:20:29 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-204.net.columbia.edu. [128.59.179.204])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781dfde3sm77151085a.12.2026.09.15.16.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:20:28 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 15 Sep 2026 19:20:07 -0400
Subject: [PATCH v3 03/11] mm: memcontrol: constify the lruvec helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-folio_memcg-const-v3-3-c239a6010b58@columbia.edu>
References: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
In-Reply-To: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
        Barry Song <baohua@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789514423; l=9069;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QErkJjMmQvmsS88jxAIrE9Ky5O4EbrTfoXBaycDxTEs=;
 b=B32sWF75c3qlH0UPqHe1rOYhPDsSHtgFDH9HH2yVkg3R8Bec/IIENkJk8Ee4OtAVS73mwx9fx
 bJqShL+MhmoBs6F5daqgJnAUlGS0n5d6CdZEhIIS8WR/gpypZaSjmmj
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=fNCsTpae c=1 sm=1 tr=0 ts=6aa9d2be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=hXAsoc/zAxyCEdIRhrpmVw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=KOoHFShP43Ts9fVHKv0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zAsmtaeTA1qFLv4d-oMPdqS1dTBpc4-a
X-Proofpoint-ORIG-GUID: zAsmtaeTA1qFLv4d-oMPdqS1dTBpc4-a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX8EqwT7H56X85
 DK/gXnpodzmpYJslAftcpARNtyFg77I9j3JBh2aZ+n7zdvaoz4hlKV+6CMpY1YCCaSuGrkMKX3I
 yDwSAYz1Ydk0Pj4FPYXEMbAauajzxiMmhyMxJxR12/SMvcPKrZkq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX7qQEOpGI9/J/
 h7o2pV91eByS2V5/rZgujpgHPQy3j2pbFkqFqk3o5DtFPR6vueRJL9ZtCC7SdJrDLklZVK8c2te
 6fFXsZzWYMLAPpZ1NBzTDnrFkCYmfZJ4zpb2uTziXjmXASZX3tOgNHcaMO45NjgAS7/kB2bPrLw
 WfZvL4Klz7+irH/XsOUcjfv9ITCbAo3V1mytw871kJLdAJaBbInXR5cfPdPQ5+8FbLqM6t+/m6f
 TS7Dc2O7xgBjuiOAloZdH+UTiz3/EDf7GkP30ej4cs3ijIiRGVPGP9sPTn/LYRU7MOmIPdavkx9
 AQnAvyCRhgt3kydPVTwMALgbhR7g892nh7S4dXErnUUHrtJ9JI7hcegIulQ73AWCa4F65C0Tbtv
 mTKf+c5mxYikMwrSvXKh64lBsGR9Ze50g/GdTJ4+YwOzVx7SuG9185b0t/VzPYNxjL0155HkFIL
 xKQl6mA5e5AcfhNVEHg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11906
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=10 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=10 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150341

The lruvec lookup helpers only read from the memcg, folio, or lruvec
they are given. Constify them, along with lruvec_pgdat() and the folio
argument of the folio_lruvec_relock_irq() helpers. mem_cgroup_lruvec()
may update lruvec->pgdat for a newly onlined node, but that lives in
the per-node structure, not the memcg. Similarly, lruvec_pgdat() still
returns a non-const pgdat and does not use container_of_const().

Use container_of_const() in lruvec_memcg() and
mem_cgroup_get_zone_lru_size(), so the const isn't silently cast away.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 46 +++++++++++++++++++++++-----------------------
 include/linux/mmzone.h     |  2 +-
 mm/memcontrol.c            |  6 +++---
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 65cb45f4be32..436934030d79 100644
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
 
@@ -919,13 +919,13 @@ void mem_cgroup_update_lru_size(struct lruvec *lruvec, enum lru_list lru,
 		int zid, long nr_pages);
 
 static inline
-unsigned long mem_cgroup_get_zone_lru_size(struct lruvec *lruvec,
+unsigned long mem_cgroup_get_zone_lru_size(const struct lruvec *lruvec,
 		enum lru_list lru, int zone_idx)
 {
 	long val;
-	struct mem_cgroup_per_node *mz;
+	const struct mem_cgroup_per_node *mz;
 
-	mz = container_of(lruvec, struct mem_cgroup_per_node, lruvec);
+	mz = container_of_const(lruvec, struct mem_cgroup_per_node, lruvec);
 	val = READ_ONCE(mz->lru_zone_size[zone_idx][lru]);
 	if (WARN_ON_ONCE(val < 0))
 		return 0;
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
index f8a2d823f7de..9c9c3119277d 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1661,7 +1661,7 @@ extern void init_currently_empty_zone(struct zone *zone, unsigned long start_pfn
 
 extern void lruvec_init(struct lruvec *lruvec);
 
-static inline struct pglist_data *lruvec_pgdat(struct lruvec *lruvec)
+static inline struct pglist_data *lruvec_pgdat(const struct lruvec *lruvec)
 {
 #ifdef CONFIG_MEMCG
 	return lruvec->pgdat;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 54937efa075d..1f660af3bc3a 100644
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

