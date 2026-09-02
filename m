Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634CA3939D7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377330; cv=none; b=N6MJJreNBQ8+yICk2E7pD2kWIO9NwYefzrkyQVRYBDer4AJAqE7Qa506tuzo/k704Bg/p7/y3BXQ6jQs2yp+yYvCm3zJL03NEqfe7mh6zCukjPVVHw7XgLJ0aHMdTTo2HnFt14/6h/rnBp+qvCnk1Xq69n+rh22VzRYVYczhoak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377330; c=relaxed/simple;
	bh=HtQiag/hQA4cS07wJ3eYyM1OfLA6EMF125WNv+tbpXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QfytUUpWHlnM1MtmWSJ7gAchKVc+NcMrvqvbiExxLlQLI0Wu5jVtIXPfkvDzxT7PYGxncEqcJ3jxy5WlYHOmqnAoOxFVhxFhxf8VK09mqQLARBGmF0cgVdw3akVUieUgeHXkmcd7QJxt6wmIWfaFbCKe42XGW6Rat6wZaKmCVmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=CshMvBTt; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=kxxhBlsQ; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="CshMvBTt";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="kxxhBlsQ"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682IYefb1996508
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=etso
	Z1nYpLyjnqIEyDkj4czRZjNiE+7y+Zy3Gx/jez4=; b=CshMvBTt0wF7fZJmdvPC
	razO8mf0NSOk+9J4nMbIzL8vlPorpEzQUgjjHaq8H25LbGzVeeNS8lNLDdVam0pR
	CQsbsnA04zZ9ZozyejAJej6oYlEMJn/ryuBggtxO9yqSF9j0c9yfQcY71E9YT8tM
	jY0aBy6TKDqUAoODeqdvUdUlzZeXp6rJTrAq9kn8ciAKtFn5A13pjrLUupg4OL3m
	fZw26m8eIndVQyPuR8SujTSzqSPzleNiGmM3aTB7KcBNCJrDPCOi8Q1q4+WSStWG
	yTIscEgrjSJpDD5njOHSe3hwlKZ8DbmWFGc6p2IbD/kNBH4+XIDxyccZgZcW8Kxh
	Ng==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gepdj22ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:28:33 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cd16a0bc1so39821506d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788377312; x=1788982112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etsoZ1nYpLyjnqIEyDkj4czRZjNiE+7y+Zy3Gx/jez4=;
        b=kxxhBlsQg98Dvv/qvKT1NpIJHhak5ncPVvCnnCNgGSbSPEb4Insi95MBq84EC/l7Ai
         eWp4BujQ6dDqLbruCqu3LWJVwbvgVGunD4ItYtVm8iJqdViv8z3kYD9q+8VPyRnd1vl/
         uaKhzXAeJdvhlAO88Q40j52BENcWcu1OZTzOdzkcfglZkhEONEa5x8GidH4fByWQUrOB
         UQMA2Kgu48y0T/Hit6+cMc6BWjvCpGB827sJbMf+xqJvybZBu/AmS9t8GINDUT8U5x9X
         JzLkAvhHJPgMjjxv5oRmekQqVlRex95wp1qRRFG/a1zhUCmks3r/kGdfi5sKwK4earpV
         hfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377312; x=1788982112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etsoZ1nYpLyjnqIEyDkj4czRZjNiE+7y+Zy3Gx/jez4=;
        b=anDBqkZR2+C8P0BK7fK39Jhq6y1bfb541zfdIQuDBBpmmWHpm2MZPxa1CtszT9MYOJ
         qOrw+F3F0Q/SKiZ/DwV655mWYtLcu0/dDwQmDKaaDx2xRWc8H7mekV0gIiT3rdXWwSgF
         zkvkbRoj8/SkppROOaA+BkUMWx0P/sAXm8oIyn6BK0665hKCuCvWwqU69Oje6QYcomnw
         iCqFuGf6F3D08EQ7DyGIxllIkOZx2ngTWzDxQd1Q+eYql5LA9NUkPaoPqGtB2vZONWVb
         mucn8MKq372Xd2KVunD00qsbFomv+HD6F8RgfbG+h9PzER/FJ7+nX1FidVo1mBAPGoTs
         T6GQ==
X-Forwarded-Encrypted: i=1; AKwUvByTTx83dN3m2H9pBISQy3PQBbOeYNluSKvaTmzyXb42gcwHRzj2CctTNSu+Ri+ea5LWKRQ8K4/2vc5Mv88=@vger.kernel.org
X-Gm-Message-State: AFuF++lpJvQzaNqpSz0o9hC/xBwxR/fPLVllXXgvHlT6e90/6Bau1e26
	0i/963yXoJDdQ9rM+Vtbjp+f4Y4wdS1poHbJtNQm+z9EkeeDywgdnlKhUWdLfYjfr2TeinjhbhO
	4vpeGrSXBMDX1TAmqeDEVT9HyBfT4LY7R5piAzzZeF75i1USzMkdjEMX4gm+0/w==
X-Gm-Gg: AYBFou1rc0u2pxzYjhC/j0kIYxXbyJJi7TvqcPn2PXXj5351slSl4lOsL+GzHq0+4cT
	gJSzcrxZLJpoU0IM66YuQPFw8DItXGOZrmNXNN3nOxUv/877zzJJiLsLml/ZlHjwljKQKRSc1S3
	KTm61pb1HRTPgtDJzVo72cImoqRcLQYYllm14MTZBcb3hIS+Esvt5r1/rNMZPTECRd6AVAH5tTA
	hRTHZKy9oql6yD9XwcBqoPkVKHr8bG1Vzvgk/WZMbDu8AJ2mn7vPOR6sL5AtCJfZje58Ab+Bwzh
	oy4hOSBRy9OacJP5t+UWfxyGpNayN+MQE76m27nDdyp6OOzHghMLrKkMLM3SO/J6JpLSgE20CGd
	Pvya9LySamwxk5ncfuCMXZ0/KPGw7lmqtyL1ujfG/ogZaRl4slliGKw==
X-Received: by 2002:a05:6214:dc5:b0:90e:8a6e:1c98 with SMTP id 6a1803df08f44-90eca3a4b8bmr84521666d6.25.1788377312474;
        Wed, 02 Sep 2026 12:28:32 -0700 (PDT)
X-Received: by 2002:a05:6214:dc5:b0:90e:8a6e:1c98 with SMTP id 6a1803df08f44-90eca3a4b8bmr84520976d6.25.1788377312017;
        Wed, 02 Sep 2026 12:28:32 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec85a0sm25420936d6.29.2026.09.02.12.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:31 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 15:27:57 -0400
Subject: [PATCH 11/11] mm: memcontrol: constify the zswap and socket
 pressure helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-folio_memcg-const-v1-11-e2c1da22246d@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788377294; l=2712;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=HtQiag/hQA4cS07wJ3eYyM1OfLA6EMF125WNv+tbpXU=;
 b=6a2WpH9oLcDssQ0P8DLsdO7NmO3ejtxK7/mvXW3DHkwMVn/VmhoY1ToJ0PnMjGbOpdLk/bDF9
 gjA2Kj0xjyGB1U/eaKDMcjnt6vS+w+mfAFv+gB10zbtyMPoRQCs9x2l
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX2SDZttCvD/8/
 iOY1ZODhs1qqbJIRWAapYPtlnGXI9xrppUXdUJt/LhyxsG5xe9mhx3j+ORgGw2lCjQ0edJDtSJT
 EOTX8fqtbzzOl+lOM+yqO7M1AvgZsnzedLYRrxnhpfqCy5IWkRof
X-Proofpoint-GUID: r_sxUJTsnspzzJIUPzXLV34yfxvqZcfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX6KzbDoSmJC4u
 A97gSYRMtXzIkimQVxwzOY8uoywV2nLQ0UjBBR1qFz+rI0zZinVMLXqrNS1+gupwnxS5JU7947G
 88QfKYydbtPjcaHSFqfP9swBG/FQww2n5znaNcCPP3Mip00kHd3w9nJIc4JWvpxZm09OddQVCIO
 Wm4pe9EWcLvjWnVwa6xLkICNiG5JSKlkGGQjY327tA2XiGbiyVqCNwEi3BYWTi4vHMxnKL8jihb
 vptj9hZJD5yd4eUbq86E8e0dQzEYmQhiP1AfcS4MjWwNe/j+e1BUoGD9E/cP9xv8qOFn+T87VwC
 tJzWrOqUIBDv2CbcyCGsG1kJ4FgDxh4Isa7/eiI2vfZBpD/Ita4kyzFbYPerKNSBaTo4FsHeuJo
 CyTD0vWHOpAG/mbkk4e9X9ZxNk87h2A9fHlsSHEbwWilqU3OwUOYiT36lYlklvFNTVU4yxN80QF
 Z21bIWNpkjMg5JhsIAg==
X-Authority-Analysis: v=2.4 cv=XLUAjwhE c=1 sm=1 tr=0 ts=6a9878e1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=JD7xpo4jQ08vE0tIMKUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: r_sxUJTsnspzzJIUPzXLV34yfxvqZcfa
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=10 suspectscore=0
 lowpriorityscore=10 adultscore=0 bulkscore=10 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020172

mem_cgroup_zswap_writeback_enabled() only reads the zswap_writeback
flags, and mem_cgroup_get_socket_pressure() only reads the socket
pressure timestamp. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 8 ++++----
 mm/memcontrol.c            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 2d5e43dbec4d..e18b44965d05 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1644,7 +1644,7 @@ static inline void mem_cgroup_set_socket_pressure(struct mem_cgroup *memcg)
 	write_sequnlock_irqrestore(&memcg->socket_pressure_seqlock, flags);
 }
 
-static inline u64 mem_cgroup_get_socket_pressure(struct mem_cgroup *memcg)
+static inline u64 mem_cgroup_get_socket_pressure(const struct mem_cgroup *memcg)
 {
 	unsigned int seq;
 	u64 val;
@@ -1662,7 +1662,7 @@ static inline void mem_cgroup_set_socket_pressure(struct mem_cgroup *memcg)
 	WRITE_ONCE(memcg->socket_pressure, jiffies + HZ);
 }
 
-static inline u64 mem_cgroup_get_socket_pressure(struct mem_cgroup *memcg)
+static inline u64 mem_cgroup_get_socket_pressure(const struct mem_cgroup *memcg)
 {
 	return READ_ONCE(memcg->socket_pressure);
 }
@@ -1887,7 +1887,7 @@ static inline bool memcg_is_dying(struct mem_cgroup *memcg)
 bool obj_cgroup_may_zswap(struct obj_cgroup *objcg);
 void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size);
 void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size);
-bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg);
+bool mem_cgroup_zswap_writeback_enabled(const struct mem_cgroup *memcg);
 #else
 static inline bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
 {
@@ -1901,7 +1901,7 @@ static inline void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg,
 					     size_t size)
 {
 }
-static inline bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg)
+static inline bool mem_cgroup_zswap_writeback_enabled(const struct mem_cgroup *memcg)
 {
 	/* if zswap is disabled, do not block pages going to the swapping device */
 	return true;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index e28b2a4f278d..f56e958948ac 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6140,7 +6140,7 @@ void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size)
 	rcu_read_unlock();
 }
 
-bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg)
+bool mem_cgroup_zswap_writeback_enabled(const struct mem_cgroup *memcg)
 {
 	/* if zswap is disabled, do not block pages going to the swapping device */
 	if (!zswap_is_enabled())

-- 
2.39.5

