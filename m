Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C424139891E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377334; cv=none; b=LGMrwPmNYARKY9D78heEkvThcTZkK94eIzeXkqK7rbCnXiDoFolgKiEZTs/CaC5uLp/cSnHpRGAsFWpni1umxAz8P1o9J+OiD97DcFseKTyrfCMaYGTzFHw0dMzgzLPpdcUPqmDodv/yZNsKCATIN1q1l70EeBfswRcAeR+nCbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377334; c=relaxed/simple;
	bh=YiGk7IcTyC0Eps0s3N/NbbC9x/40tMeZu+bwBaHwqiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=es15ObwxlQbdV/WDM10Dm04DxvR8YdOctuBeONl8ojpaHnykj5V5yMZLUV/RY+qRsGerOJsTAywqKQUoaLluImRKR7tG1R+sfoVmSaaOVlIR6n7iMayOUWkXI2PHGTvyO5jCoXt8o/1s41fcuC2F4VQHdkrjOKZgaNOpzAXndLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=XHD8wSIc; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=pplFgONP; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="XHD8wSIc";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="pplFgONP"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682JGVn21442292
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=0VAf
	iqCv4eQS4h3nZSDuv6RC9EOG5S+Brh1R9wZYHWs=; b=XHD8wSIcL8iM08UN/g/6
	dIoF8wDgXZJ4Dnlg9+79gn9pf70m/nnqjC/OHKQpxxHI1SHWwsYJzkxnZsmU4Mss
	CRV/C6DkaZvnXRTDQcrg60W9/361LGUz9RJJmiUSHsyRhaULNUBqFU3ljokdNG0S
	rtfVpeupCo8yKCtQmpamprXqf1M7BTku95awlwwBK52HE5YcfRJYJEFOrhDZbViT
	gwrUzT5lP4EbLyrk1jjQd/7xXfS8j/Mue6yCMDBSJCKutDeCi71fE0yvkrzFZWT0
	u9afCEMWmtwZzfaBuJdkV6XeiaPrPcZ41hxu7LsXU/J/SLxk79mfucz///VrjnWZ
	pg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gestjr2n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:28:28 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90f8b463ea3so5164816d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788377307; x=1788982107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VAfiqCv4eQS4h3nZSDuv6RC9EOG5S+Brh1R9wZYHWs=;
        b=pplFgONPXH+L00sZW3Ddyav3KWlt9ZlJ3q/8vaDM6Ed8TdBIBWRsqu1wmnfvH9bvwT
         6zFgBcs1yPAWnHdWHKh6ArQKCd9o0MN0w51tnrTeONzqwSd7A704VKkA4ixl+BItOgES
         DU8G8QkkFOq2BiNOshmz80HMz5VY90IlJsmC3z1YlKmHir75yj8kgjDwhicIvgx6wxEG
         wde/EISPstiaJVqbAIZbx4hTPaIsOlXjWcsL4ORfw/xpMl0NW8I9yGZOLrBcVA1nwaxM
         54r5NgsceivKD8LbbgVtEa1JBsk4ETQ7R6dvpNCBogMysDFyeFFWuBVffbUgLrpZ7HoZ
         bsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377307; x=1788982107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VAfiqCv4eQS4h3nZSDuv6RC9EOG5S+Brh1R9wZYHWs=;
        b=TwGpR7HP7vhB7W0BuWhfCduCAsTljZR/ZDfXVqaDgNLjTmNGzuFuutT10RjDt1bS+I
         3/q+j1Ig5hlcMHsAXMzmQbp+N71A9C6g2L9zTB9V3fY3EzXHrcP/H2BYt+ZjewSTnmlt
         Brd+YrHOVYbCN2rD5JhNoj0YIJg+nNG/Y6jiTsN7RXoOBVICycQD1ciUxkOYdrKp1HJz
         YcLX0xulAlq2V8KtHDMwRckPffujZW1ItpdZFsL2451Sa0bYSr0hjZaWO0xLKV9rln+q
         DU9o4qwNm4kRcvaiQ8NemK7Nqrr2r+7MMn9rEruEovPMfsEhF3poaqfzDuy7eVlYNvJs
         7wRA==
X-Forwarded-Encrypted: i=1; AKwUvBy16CEGd/d5DouX0XWCZKPZlAuUuIq7ncnka16NEehigM2MiS5WKlRJCfHR/K0J2aamX5Eq0wBFJ1YyxcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lGsDyit35R72HaMGK/0xj7ADXBx/vyXasV4NH61Ba7yd3FQ8WL
	GR0RvvBNO3sUWkX60ndrGKn6CROE/HTrzZ8Uohz1YzH8n0F+qjGNHjw17L1czaroXn03y6HNjgW
	R2PQnBjO1HLMex7gXk2R+z6gu7jZ+Zbd1lSpX+IQLCot9O5cygkIRIrw5DNaDrlUjIwoqUbBP
X-Gm-Gg: AYBFou1UQJZ7ihgAMyWsgsn87BQJA32Eq8PaJOqxrLktg563zTmrJR684hcBhlIrNBj
	AKMIIqjvkm7d6a1JTRD+zL4Q4el7KqYbb3jUO21UWsFjWVPs1uVtUelVFj7NPo44Qhf74ZViL3K
	WHed1nRlmkaHTCUmf6Vd4kOtLMf3l+qtljIDBV457bCa+pT7QbITFzJ8P38rl7tiiF0WYY5/kuY
	xUSyTV6tp/MKRqAy5A1+q88xvTqIh80SlgbFYnFOiK9X3e3Wv//ZjK2jwBN9D0zFEZWPkrmZSvB
	g65vuZ34Vm6yQwA3K2hQjHrDR6KN5UW+bYjS0yeKoUYWdD0OzVVvc5vP51GgYiFobfVw1yfxZRj
	FL2VkoPdCknyo80wgoOx1kuXyJwqNSp3ZrJqPf7g7T8SSsdS8FCFgfg==
X-Received: by 2002:a05:6214:d0c:b0:90d:3c75:138e with SMTP id 6a1803df08f44-90ebab5f849mr91931036d6.17.1788377307479;
        Wed, 02 Sep 2026 12:28:27 -0700 (PDT)
X-Received: by 2002:a05:6214:d0c:b0:90d:3c75:138e with SMTP id 6a1803df08f44-90ebab5f849mr91930346d6.17.1788377307002;
        Wed, 02 Sep 2026 12:28:27 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec85a0sm25420936d6.29.2026.09.02.12.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:26 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 15:27:53 -0400
Subject: [PATCH 07/11] mm: memcontrol: constify the reclaim protection
 helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-folio_memcg-const-v1-7-e2c1da22246d@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788377294; l=3509;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=YiGk7IcTyC0Eps0s3N/NbbC9x/40tMeZu+bwBaHwqiY=;
 b=+WNVrqutl1n0CQduNp4rYfXSeoz4yiffisjzUinopL3RaPXOQZV9JDwvQLXCYFHMgo2xokdY5
 lcqg5i9omW/CqrsaFK/UszHRH5fR0tR1CM3irMoIXnvbmUTPXB6vbRk
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfXwRRI/U0QBr+p
 8M1YE4HK+rQLqjM5QoUYRuGQu9shYaZW/Xut2KoVEMx954Kyrvi+Ny/eCZciP1Vabp0pusoW68Y
 3LKFc5nQdrTxf1hE40TJQrpmgoe6F+Ybwvvj3czKyyBuWvwJBVGP2SsR4U/zm+s/S/LKVhvj5UA
 r1d1TVfVcYFMN/SJasrEgGmxPZhJQV/DgDb5FiJx/UYO+aTjWJp+u6yjP6VxLWkCEj0r+Moja1L
 CZz3Y8GGXg4LMh0s/D7KMPly/WghM9gYzlXilEjvp6V7nRDcWyQYWfU0srn9dsx1gT5J/zsTX62
 C+XYttDlLDtZuoZ2V0eKAq3usyYe3Y5eNP5WJocYCqJKN5IMnmRYZ/bbHfwzPbVhjFcQep4ewr+
 EUepYLv0PyapeKf4OhtpCyS9/kWf0HN2oR1oBt6d8i1Y88ggg4WDpLhtBwuwL4ezvI4RXqrQ4Us
 eXbZc5WVY5+4I3hiuaQ==
X-Authority-Analysis: v=2.4 cv=OZKoyBTY c=1 sm=1 tr=0 ts=6a9878dc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=Qozanl9KyY-oOybludYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: bHqKNgjwl6LmbGonbwuiWCJMGqv9r2cc
X-Proofpoint-GUID: bHqKNgjwl6LmbGonbwuiWCJMGqv9r2cc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX9XNVRpNFdkta
 Zp3LrhcafWBP3PGEbBcgAzAboICJjal2D2L5yI7LefWgbkKasASH5X9JmqKO1cl7FH5RHRM98ZB
 NAe75D+zgv/sTyQ79Q86m937VNd6Jd7/xrKSUNyjYb5o2+A2xGsr
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 bulkscore=10 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 impostorscore=10 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020172

mem_cgroup_protection(), mem_cgroup_unprotected(),
mem_cgroup_below_low(), and mem_cgroup_below_min() only read the
protection state. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index bda969b3e1d9..bd82628d0d72 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -537,8 +537,8 @@ static inline bool mem_cgroup_disabled(void)
 	return !cgroup_subsys_enabled(memory_cgrp_subsys);
 }
 
-static inline void mem_cgroup_protection(struct mem_cgroup *root,
-					 struct mem_cgroup *memcg,
+static inline void mem_cgroup_protection(const struct mem_cgroup *root,
+					 const struct mem_cgroup *memcg,
 					 unsigned long *min,
 					 unsigned long *low,
 					 unsigned long *usage)
@@ -592,8 +592,8 @@ static inline void mem_cgroup_protection(struct mem_cgroup *root,
 void mem_cgroup_calculate_protection(struct mem_cgroup *root,
 				     struct mem_cgroup *memcg);
 
-static inline bool mem_cgroup_unprotected(struct mem_cgroup *target,
-					  struct mem_cgroup *memcg)
+static inline bool mem_cgroup_unprotected(const struct mem_cgroup *target,
+					  const struct mem_cgroup *memcg)
 {
 	/*
 	 * The root memcg doesn't account charges, and doesn't support
@@ -604,8 +604,8 @@ static inline bool mem_cgroup_unprotected(struct mem_cgroup *target,
 		memcg == target;
 }
 
-static inline bool mem_cgroup_below_low(struct mem_cgroup *target,
-					struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_low(const struct mem_cgroup *target,
+					const struct mem_cgroup *memcg)
 {
 	if (mem_cgroup_unprotected(target, memcg))
 		return false;
@@ -614,8 +614,8 @@ static inline bool mem_cgroup_below_low(struct mem_cgroup *target,
 		page_counter_read(&memcg->memory);
 }
 
-static inline bool mem_cgroup_below_min(struct mem_cgroup *target,
-					struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_min(const struct mem_cgroup *target,
+					const struct mem_cgroup *memcg)
 {
 	if (mem_cgroup_unprotected(target, memcg))
 		return false;
@@ -1110,8 +1110,8 @@ static inline void memcg_memory_event_mm(struct mm_struct *mm,
 {
 }
 
-static inline void mem_cgroup_protection(struct mem_cgroup *root,
-					 struct mem_cgroup *memcg,
+static inline void mem_cgroup_protection(const struct mem_cgroup *root,
+					 const struct mem_cgroup *memcg,
 					 unsigned long *min,
 					 unsigned long *low,
 					 unsigned long *usage)
@@ -1124,19 +1124,19 @@ static inline void mem_cgroup_calculate_protection(struct mem_cgroup *root,
 {
 }
 
-static inline bool mem_cgroup_unprotected(struct mem_cgroup *target,
-					  struct mem_cgroup *memcg)
+static inline bool mem_cgroup_unprotected(const struct mem_cgroup *target,
+					  const struct mem_cgroup *memcg)
 {
 	return true;
 }
-static inline bool mem_cgroup_below_low(struct mem_cgroup *target,
-					struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_low(const struct mem_cgroup *target,
+					const struct mem_cgroup *memcg)
 {
 	return false;
 }
 
-static inline bool mem_cgroup_below_min(struct mem_cgroup *target,
-					struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_min(const struct mem_cgroup *target,
+					const struct mem_cgroup *memcg)
 {
 	return false;
 }

-- 
2.39.5

