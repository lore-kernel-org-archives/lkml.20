Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48533803DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377311; cv=none; b=LT/zmEfpViuTCe7O3HQj4lRl/j9PoLEWHnwmE6/AUGHI5pqUKUuQmWuGuWgOh+NUFoLNDOwlhkox7QJFixv31yiLT+1CbWf+u4DunqOrW6ggADCGG7pOsCQz5PHomHnwaWrA1+wFMQj6W3mS5r9OHSI9DQM2+iXHmPzSUX0YBtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377311; c=relaxed/simple;
	bh=0RRq+cNSMCUgXKQ4BRhzRqAGgsu/pKvi0Pw8sEiBxb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bsqFbLXh0QrK1dEXzCIoquybQGTTnkBfR1tFIVWPYWl9xdmUZ2S9iH2O6+ajsjzLU0cecHP+4w1kZx8nUiZdM1ZzYoEq9dpeXG35OL7/wCDDVnvbDP2UN5gr3JFal63VGhJdqhT5UrNW789dcpOVDu2yU4qNPk2r6bifymJADBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nje5+gnF; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=uu9iNwrS; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nje5+gnF";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="uu9iNwrS"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682JCXqV1004510
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=iiZS
	lMXPNQnU6e8k3TycWv1GklzL+eafvVQe1OpPlbg=; b=nje5+gnFYNFeomEIdAzb
	OO46aLw4FtxnoW5AtquBni6728Z46UKLbG++R7XEKw9yL3/v2xSCMapeh2vE7ywv
	t0g8vHp4gRSeQLZV2HziRdNDTgFPY9xqXLbz9xVJiW8c5rvn/WltJLuDPb7g5JXp
	VYoVQVJBzPh8j4WkxiyVKXd7tkRTZRcvRSzeTGB6OwgzxlOlGRqg/fbCDXNgyKqt
	KIcTMDAtXdwplUOSGU100HyXNGwwvgwUQS7Th+WJk+T/HWv/D+d2uZQIIBdk+B+v
	/T/BaeyHzM04Hofh4BsWk/9vXeNbuQQaia5r6CNcdBGBN5opC6F85QW3/B5wXLPm
	WQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gesrr03tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:28:19 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cddf4f59eso27276236d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788377299; x=1788982099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiZSlMXPNQnU6e8k3TycWv1GklzL+eafvVQe1OpPlbg=;
        b=uu9iNwrSQeoOIOFCOYA7NZOeoBOJrPhAbIZBx1ltZ+VDXVLc4qcjHoAHJnxDILy6ZN
         j5feLiHO0P/6YNSy/6mQ0zZxa33DzAl1QIzrJEe2Mz/3/j80NstswPvEKrZ3G6cBnq9J
         36vgmQafR1INUt7jcArTlF4xJymB+DTiSO+guRHzFgLk/ZScu2FykHHSvQMM89RzmUbi
         U2TeihmDoYTD29tQ/wLhKDdXoQU+vQH4KhOJVyrZpjulYwnLEL0JPw/uV5uQSeMl6jUh
         2RWOL+EzC76cQQ3QSsD3Sjg1x9GVL35OBeY56f4nJdHNhFjmfmHfgur8RInWAJmBemj7
         Netg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377299; x=1788982099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiZSlMXPNQnU6e8k3TycWv1GklzL+eafvVQe1OpPlbg=;
        b=Kb46qqLVKJupoKVvZTAuXPYts7ABTNtgU49qUWjCH2uPlyz/57loOxLpilMyvPuCH1
         MAbPkCnW6Y3cLSd6BDs7qNRqT8QG85LMRc4nZkHLM5VzyKzfGcl86EkLAm1yNL6sfZ3D
         QZHey2f74llTwqcdVWNJnqaXQxNVfGqDhtkYJTW+zBRsgQzesl8gzE7Y8HLB05GN0XaE
         082829JOAInJv8z6ZSTaWzi6JK0BO73OYkAXMsZwSq7T0HKEejWjrp1wC848knrfrtt0
         e/JoYMmGTHRVVDXNFET0+2x9FyCcQgzAckWSLeuEpmJeCk9czLIu5su2ycES4Fos0RTI
         tZBA==
X-Forwarded-Encrypted: i=1; AKwUvBw4Igw4zsdhJ+LJolsDGb3uMSVzc4Ox2JBJsY2sJo0a/WhBJ1XpfF/y2DnyyfMisRMxKt9bKBK81Y8bk3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lu/YiswTSp7AkX9He5/A+F/cLzK7lRRbWt+WLWlfm/CvZOWxz2
	6snR+ciG6OLSk5ljOPmA+pFgmbERoGnJFxf7DLWfVJ6VtYQr8AgaBFg1EpWni+QAbRawOAldBl4
	X1ov0zN+VUUsWcqi9VXj6g0La3iPLz5lXd+DF7Dc3SWdLVPgDihgyBmkFmglGxg==
X-Gm-Gg: AYBFou0yXosTV0Z1PW/67p1ffs9taGYpK0t22kgamwWwuSWI3wdpTQ0MXWvTJha7ROe
	8aaW1pnVa9fMf3sIES2BRHtt05D9bIsz74F/k4dLV+ic3pLFEvYVsEsnnIWNhn3KoOBjHUh2UqT
	6mS1jcWq4LK8EAhuZ4QhHd3d08y0y3d2+cO5PMxBFr61MSVSz3WxTPPjoGY4FCxyemsTJcQF/NX
	4IXkkRi2EvFKUvBrVyJessTgDOcpDSgdgNKWun4g6n1zBT8KXN+5sBV8Jd2tKNo/X4nqLo9wMaK
	aQ6uO7myy5AGILnWok4xD4ml3OtAXvNmZFk+zRy83Lv7tY83PPCQInP4wTi+Wf2Bdi9pCBmf5C2
	r0uMIqnEOBu6oVcofXxGjFRxEyXtVO/9Gi1muzo+mcj9KU9OdR7cBJw==
X-Received: by 2002:a05:6214:23c6:b0:90e:8a62:3344 with SMTP id 6a1803df08f44-90e9f26550cmr86849126d6.13.1788377299028;
        Wed, 02 Sep 2026 12:28:19 -0700 (PDT)
X-Received: by 2002:a05:6214:23c6:b0:90e:8a62:3344 with SMTP id 6a1803df08f44-90e9f26550cmr86848496d6.13.1788377298486;
        Wed, 02 Sep 2026 12:28:18 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec85a0sm25420936d6.29.2026.09.02.12.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:17 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 15:27:47 -0400
Subject: [PATCH 01/11] mm: memcontrol: take a const folio in folio_memcg()
 and friends
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-folio_memcg-const-v1-1-e2c1da22246d@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788377294; l=8676;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=0RRq+cNSMCUgXKQ4BRhzRqAGgsu/pKvi0Pw8sEiBxb0=;
 b=0xdzCUhJ/ycbjStokNdzxmTsEbanlqA5lDPa4ZHEDUzWMBvo8RjwzZ+nzlNqbgsggKr+KFjb1
 bnjVx9Cd1cZAVZBCC0+Ox9np8fi0siYMn/FZsunbm7gANDia8OngPWI
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX5Vh7jcJTeae6
 G47Eyk6diil8KLlHiQpzrgktAws0WZbulrW6EeqVJEsTddNru9EHtDGwOxbxFQAjLaFLc+EMNn+
 Ei51dZ21t7pGvgjtNzwoBKDlFD1a5BgV/qkQ3GtoIObDZX42X+0B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX1DOq3jTNgpTG
 UvOJkriydnZ++FqCEQXKRJhkC0QCVn8Q8PVwptjwQQIPEs4mENq5ExKu8f7/nJRqh6AMM+j2xxi
 UruL66ViWRQdhGkOAdAY4+bscbEPeaPKc6HH+aYjLjrwiFLjayr1kPK786rrxvuhVxQbZIPJrf4
 h0EqVV2/gzXcDlAh8SvsA5+pto+XVHXM+fS1e7MdNdPln08keRLs49KciNNJjMoxvCbt1UPKg8O
 ChcYv+Z0xyK9YZfWgORW2BafXc2lDH7k5BlfaE6ddfJN0wVhmn3KbeStrt8XWgl8XGfVqO19aIY
 Obx+AgiwPAa3HO+z2LYxwweQncxv1a1lj5y6esty6Q49Lz8d6O6jx/n9i3u6oDo/uQC/6Qvx6nG
 0S1U/aFWuYLCgVKerOQ9vtVz5mTT5BOuiOLZF1/WRQL5C9eYvp8hRLCNB5M1zDMiMMJ9oGUgF1k
 Y3DT7H4z5khbEvMXT0w==
X-Proofpoint-GUID: 1--ueF3rkIqbD_aBri5tCJRIfNMbbhuE
X-Proofpoint-ORIG-GUID: 1--ueF3rkIqbD_aBri5tCJRIfNMbbhuE
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a9878d3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=mS-MXv6ntEAvCgPac54A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=10 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=10 malwarescore=0 adultscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020172

The folio_memcg() family only reads from the folio, and everything it
calls already takes a const folio. Constify it, along with the page
wrappers built on top of it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 46 +++++++++++++++++++++++-----------------------
 mm/memcontrol.c            |  6 +++---
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 945d7dbf1bb2..91ca94667d44 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -377,7 +377,7 @@ static inline struct mem_cgroup *obj_cgroup_memcg(struct obj_cgroup *objcg)
  * or NULL. This function assumes that the folio is known to have a
  * proper object cgroup pointer.
  */
-static inline struct obj_cgroup *folio_objcg(struct folio *folio)
+static inline struct obj_cgroup *folio_objcg(const struct folio *folio)
 {
 	unsigned long memcg_data = folio->memcg_data;
 
@@ -415,7 +415,7 @@ static inline struct obj_cgroup *folio_objcg(struct folio *folio)
  * Note: The caller should hold an rcu read lock or cgroup_mutex to protect
  * memcg associated with a folio from being released.
  */
-static inline struct mem_cgroup *folio_memcg(struct folio *folio)
+static inline struct mem_cgroup *folio_memcg(const struct folio *folio)
 {
 	struct obj_cgroup *objcg = folio_objcg(folio);
 
@@ -428,7 +428,7 @@ static inline struct mem_cgroup *folio_memcg(struct folio *folio)
  *
  * Returns true if folio is charged to a memory cgroup, otherwise returns false.
  */
-static inline bool folio_memcg_charged(struct folio *folio)
+static inline bool folio_memcg_charged(const struct folio *folio)
 {
 	return folio->memcg_data != 0;
 }
@@ -448,7 +448,7 @@ static inline bool folio_memcg_charged(struct folio *folio)
  * A caller should hold an rcu read lock to protect memcg associated with a
  * page from being released.
  */
-static inline struct mem_cgroup *folio_memcg_check(struct folio *folio)
+static inline struct mem_cgroup *folio_memcg_check(const struct folio *folio)
 {
 	/*
 	 * Because folio->memcg_data might be changed asynchronously
@@ -465,11 +465,11 @@ static inline struct mem_cgroup *folio_memcg_check(struct folio *folio)
 	return obj_cgroup_memcg(objcg);
 }
 
-static inline struct mem_cgroup *page_memcg_check(struct page *page)
+static inline struct mem_cgroup *page_memcg_check(const struct page *page)
 {
 	if (PageTail(page))
 		return NULL;
-	return folio_memcg_check((struct folio *)page);
+	return folio_memcg_check((const struct folio *)page);
 }
 
 static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_cgroup *objcg)
@@ -494,14 +494,14 @@ static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_cgroup *ob
  * that the folio has an associated memory cgroup. It's not safe to call
  * this function against some types of folios, e.g. slab folios.
  */
-static inline bool folio_memcg_kmem(struct folio *folio)
+static inline bool folio_memcg_kmem(const struct folio *folio)
 {
 	VM_BUG_ON_PGFLAGS(PageTail(&folio->page), &folio->page);
 	VM_BUG_ON_FOLIO(folio->memcg_data & MEMCG_DATA_OBJEXTS, folio);
 	return folio->memcg_data & MEMCG_DATA_KMEM;
 }
 
-static inline bool PageMemcgKmem(struct page *page)
+static inline bool PageMemcgKmem(const struct page *page)
 {
 	return folio_memcg_kmem(page_folio(page));
 }
@@ -743,7 +743,7 @@ struct mem_cgroup *get_mem_cgroup_from_mm(struct mm_struct *mm);
 
 struct mem_cgroup *get_mem_cgroup_from_current(void);
 
-struct mem_cgroup *get_mem_cgroup_from_folio(struct folio *folio);
+struct mem_cgroup *get_mem_cgroup_from_folio(const struct folio *folio);
 
 struct lruvec *folio_lruvec_lock(struct folio *folio);
 struct lruvec *folio_lruvec_lock_irq(struct folio *folio);
@@ -871,8 +871,8 @@ static inline bool mm_match_cgroup(struct mm_struct *mm,
 	return match;
 }
 
-struct cgroup_subsys_state *get_mem_cgroup_css_from_folio(struct folio *folio);
-ino_t page_cgroup_ino(struct page *page);
+struct cgroup_subsys_state *get_mem_cgroup_css_from_folio(const struct folio *folio);
+ino_t page_cgroup_ino(const struct page *page);
 
 static inline bool mem_cgroup_online(struct mem_cgroup *memcg)
 {
@@ -917,7 +917,7 @@ void mem_cgroup_print_oom_group(struct mem_cgroup *memcg);
 void mod_memcg_state(struct mem_cgroup *memcg,
 		     enum memcg_stat_item idx, int val);
 
-static inline void mod_memcg_page_state(struct page *page,
+static inline void mod_memcg_page_state(const struct page *page,
 					enum memcg_stat_item idx, int val)
 {
 	struct mem_cgroup *memcg;
@@ -951,7 +951,7 @@ void mod_lruvec_kmem_state(void *p, enum node_stat_item idx, int val);
 void count_memcg_events(struct mem_cgroup *memcg, enum vm_event_item idx,
 			unsigned long count);
 
-static inline void count_memcg_folio_events(struct folio *folio,
+static inline void count_memcg_folio_events(const struct folio *folio,
 		enum vm_event_item idx, unsigned long nr)
 {
 	struct mem_cgroup *memcg;
@@ -1045,22 +1045,22 @@ static inline struct mem_cgroup *obj_cgroup_memcg(struct obj_cgroup *objcg)
 
 #define root_mem_cgroup		(NULL)
 
-static inline struct mem_cgroup *folio_memcg(struct folio *folio)
+static inline struct mem_cgroup *folio_memcg(const struct folio *folio)
 {
 	return NULL;
 }
 
-static inline bool folio_memcg_charged(struct folio *folio)
+static inline bool folio_memcg_charged(const struct folio *folio)
 {
 	return false;
 }
 
-static inline struct mem_cgroup *folio_memcg_check(struct folio *folio)
+static inline struct mem_cgroup *folio_memcg_check(const struct folio *folio)
 {
 	return NULL;
 }
 
-static inline struct mem_cgroup *page_memcg_check(struct page *page)
+static inline struct mem_cgroup *page_memcg_check(const struct page *page)
 {
 	return NULL;
 }
@@ -1070,12 +1070,12 @@ static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_cgroup *ob
 	return NULL;
 }
 
-static inline bool folio_memcg_kmem(struct folio *folio)
+static inline bool folio_memcg_kmem(const struct folio *folio)
 {
 	return false;
 }
 
-static inline bool PageMemcgKmem(struct page *page)
+static inline bool PageMemcgKmem(const struct page *page)
 {
 	return false;
 }
@@ -1208,7 +1208,7 @@ static inline struct mem_cgroup *get_mem_cgroup_from_current(void)
 	return NULL;
 }
 
-static inline struct mem_cgroup *get_mem_cgroup_from_folio(struct folio *folio)
+static inline struct mem_cgroup *get_mem_cgroup_from_folio(const struct folio *folio)
 {
 	return NULL;
 }
@@ -1366,7 +1366,7 @@ static inline void mod_memcg_state(struct mem_cgroup *memcg,
 {
 }
 
-static inline void mod_memcg_page_state(struct page *page,
+static inline void mod_memcg_page_state(const struct page *page,
 					enum memcg_stat_item idx, int val)
 {
 }
@@ -1431,7 +1431,7 @@ static inline void count_memcg_events(struct mem_cgroup *memcg,
 {
 }
 
-static inline void count_memcg_folio_events(struct folio *folio,
+static inline void count_memcg_folio_events(const struct folio *folio,
 		enum vm_event_item idx, unsigned long nr)
 {
 }
@@ -1861,7 +1861,7 @@ static inline void count_objcg_events(struct obj_cgroup *objcg,
 {
 }
 
-static inline ino_t page_cgroup_ino(struct page *page)
+static inline ino_t page_cgroup_ino(const struct page *page)
 {
 	return 0;
 }
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 5b9e0ebd42ae..b9bf655cdd2d 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -331,7 +331,7 @@ EXPORT_SYMBOL(memcg_bpf_enabled_key);
  * If memcg is bound to a traditional hierarchy, the css of root_mem_cgroup
  * is returned.
  */
-struct cgroup_subsys_state *get_mem_cgroup_css_from_folio(struct folio *folio)
+struct cgroup_subsys_state *get_mem_cgroup_css_from_folio(const struct folio *folio)
 {
 	struct mem_cgroup *memcg;
 
@@ -356,7 +356,7 @@ struct cgroup_subsys_state *get_mem_cgroup_css_from_folio(struct folio *folio)
  * after page_cgroup_ino() returns, so it only should be used by callers that
  * do not care (such as procfs interfaces).
  */
-ino_t page_cgroup_ino(struct page *page)
+ino_t page_cgroup_ino(const struct page *page)
 {
 	struct mem_cgroup *memcg;
 	unsigned long ino = 0;
@@ -1220,7 +1220,7 @@ struct mem_cgroup *get_mem_cgroup_from_current(void)
  *
  * See folio_memcg() for folio->objcg/memcg binding rules.
  */
-struct mem_cgroup *get_mem_cgroup_from_folio(struct folio *folio)
+struct mem_cgroup *get_mem_cgroup_from_folio(const struct folio *folio)
 {
 	struct mem_cgroup *memcg;
 

-- 
2.39.5

