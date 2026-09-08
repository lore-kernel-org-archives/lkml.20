Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6050C58FD1A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883083; cv=none; b=a2vWFPhCYoTb/OIAoCuliAhzjEcGJzy3FWcfyhx2Ykduz7eUI32cP/XY7IMNat3vlMhzyACFcGc0I9behNGJj3tw73DfEvkAA7aOid6k+I8T0BCJ1L5DIzksM7uWb3NHxRBAAqWjFKNi0SS9ex23Fv9SCtG29hWIvzejEvb+nok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883083; c=relaxed/simple;
	bh=RGpNqosEM7mzuly6uvRrlBbYNHGessdlxA/pengEqCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SI76zN0zpbqWnUZzUKOvA7tbNpZV1wijuQk4WetV1JydC/iavXJe6emZhzexcTQEm7V+jmO7Uk3s780Nk5tmJ6X5a6j0lXnivouuVeO0cqJyW+ZKx3wubuVWg0/MT0vCY+fkPoBF5nrT8gODtG4hN8NXTE2aFjWmzdLMxAcc3DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lxeRvEac; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=KnOw+u/o; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lxeRvEac";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="KnOw+u/o"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FbiRa426547
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=y8aH
	Vipjt+6jENEFJCbll5KzX67toHrm1mK00n1KR1c=; b=lxeRvEacj2CaULKnGj7D
	G070QUPMJYU2sjFsGzNrfg9ZL7z5QhvqjAiT2NZaVnRKkEii7DomukliQ3x0q9vN
	y8ICEDwRwh1u3TvZ9muB9RYSmrMHJIjcVa2VSfutXdVGbvjKyQGSY8Z9aV5l5bFH
	AVNkSf408qYKht7bAbZxIKCdu1aZyG8wtfv1mqqRzqUI02JsYeUuxjLVNutaItyN
	MHTK2cO68UnylVxld7WZEmCnYJdQd+UiQW+RIjbLvmCuc2DOc2Oy4a8zCOHQ8Ti1
	QfGu98zQ1mh7IXZXoNbSDCyu2oY6HMtbTTCFNPFATLiMLau5+y5XVew8TgWLUwpm
	XA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjmv7gf1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:57:57 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5308a3825deso30428411cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788883076; x=1789487876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8aHVipjt+6jENEFJCbll5KzX67toHrm1mK00n1KR1c=;
        b=KnOw+u/oVS5MCWoWvKYEufwB9FrfoB/pwkHU/s+aLRr/U1Z76P/CffWioDIGpm9a7g
         569czVuSynFBidbakHHswEUuw+WOfnpjWkk0qn7fokepRODt9WIrR87AUS5UnpAtDZz3
         jouWYZPdp2k3tp4hbKXMHDiDltG/pHuOhKahTbeApl5qaVgo3pzMTLnsH5nhFFw0OPjx
         AtoIq1RI1pvSi5vP2+CxlV6u/cgzgQnUxeRWittu6LBKdLtuv1EU6Hyl4RsvG+Ln1ybl
         vlyqXi0n5crJg2AQStRn8RVVcfHuv8UTSJ78AkE57NXeX3m1s43z/nEizgS+T/85A1XD
         YhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883076; x=1789487876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8aHVipjt+6jENEFJCbll5KzX67toHrm1mK00n1KR1c=;
        b=MiCRDLb2DpR519h/1P18F7PIkiHMYbs441VKIcWI8d5SIv6jAHJvdBgrGhfZIG0sMP
         RKFyTo9VPGhGI1cYqaTXDVnhyXXt2CYl7BXIJq47Tg+fkZlFd60dZAmBeQprBCx8zxFc
         GnBUwd/d1caBiZDkGB9xb11gVCj9p9OrGgWmOVYMKfN80n6iJi8cpTm0+fqQEMrVYedz
         YomNWKHD8HCH6cQEx/S60/qmSrmdxxP8/cKRtBaF3arsd0mvdDU3OZv/QToVkRCBly8N
         2oN8cpcN9C3imO/zFDNTWBLHNWxBXwbxVVYZ88UGHO1mb8izyGrg23REFnnMMpCg8M4W
         wD+g==
X-Forwarded-Encrypted: i=1; AKwUvBzCw+WTqpsiXV+WuiP8qnjYLjo/j3WivFoi8mYn7Jz8RjKPM7ebyJwjKX9spFyvkSyDnpf3GuShY/NvU0c=@vger.kernel.org
X-Gm-Message-State: AFuF++lh6u2ZKrlp5FB47RpTVMrFtxSrisCIgn0d6xPULJoPYqhl/48q
	3PMN83Q9xzdgyi4zVQ8Dp8nVHwV7K+n0udNtpcQRz7caG3PzCZtgZr1UFPziXm2niVTF4NeK055
	k8m11qgBNcRzVfGhmiuVQtfGYaIVCZFfgCy4Iews9RxzhFfAFeRSLpLelqfS/b+DxLpeWqK0o
X-Gm-Gg: AYBFou3TMAHgULH0O10WAg6Ck2CNvJeouHeooYwBMp+nRdI2VSKfhm0TbBiVPUoZ39r
	nEpj/9O75lGgBV64KkRnDbqyajAx7Wp5AKSFVtj2HDgkU9s496+3iHme53VSYoB40VFE/J3RgAA
	K43F3jVuPPbK5iLNnNIykcLVZu2JA47CDlb9VRirv16Px8k7u/e+AWCc5Ld215wNvr7FFyfhWkG
	j3QJ4yKRFVYzMRXPrp/8ZRWZcitbHZi207T+Q2RQGQA3cKTNthP2GZUeGpFw9VcBX49RkWbdjHn
	ludmoGB9I/n0PFc0uAJLl7798fedPHIAgQchqjHn4Twg/UhyOYN30wcjcdwc3Ohl+LMEH+djthJ
	Da8hMqdJHn50XwbmSpiZXY2QDBkNwRCj+miFdZdQME9K34+xW
X-Received: by 2002:a05:622a:1f8d:b0:530:42e4:1b5d with SMTP id d75a77b69052e-530a2dc44demr11255841cf.42.1788883076212;
        Tue, 08 Sep 2026 08:57:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8d:b0:530:42e4:1b5d with SMTP id d75a77b69052e-530a2dc44demr11254981cf.42.1788883075618;
        Tue, 08 Sep 2026 08:57:55 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53093295584sm27830461cf.13.2026.09.08.08.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:54 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:57:45 -0400
Subject: [PATCH v2 09/11] mm: memcontrol: constify the swap accounting
 helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_memcg-const-v2-9-811e9f443409@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788883062; l=2888;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=RGpNqosEM7mzuly6uvRrlBbYNHGessdlxA/pengEqCY=;
 b=PCxMwC11hDWIhBZYDJPTOn75inbk2rXcicdxcrk2psxmlRzrBn5H/SvPaBYgZlzebUmYpnvK9
 p523Ms9PBDrBJZRhUDFKp7xLpQVujN0EmkmE022/SnEWdLWMrHaAH4e
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX6NThwoqzukK7
 A0WgPisUF08sckG068E/oeP2L+zQan0ezk1aX+aH/cBOVf29JpIkoyAYFTXH5Xac9G7jvND/W6S
 wj9DbU3+uklRe3v2+hqBJUC7OWc57mcEZiOY5iywrknjlYVbiPTE/Y1AkoZ/Kp7gzQ/+IuyYcSm
 7NSmcoprgnfeeM6avqRkq59ubCwGOI4WugjUACCWpZ96LP33V7zJBuePLTwKJDEm3ea+huEhY+1
 kG0Tw6VNmAtxggEAbKf4iXMUIusgn3Z6L3s5zs2MTz2PEh14udmtTSWgCUQLQDx3OyEq81Y/M07
 cZbR2yVVfml4ImIIIntawoCh9Ymp60ny0nA2SQi05uh5kOgXAcZtMHl6VUTgx0j3JDSuksIh5uO
 1drNH5LirZNzl8TRfzVUN+S34EUWb2FAfZJvijZCDJFyJF/uwfmM1vv1bvlj/rnyua9ol5UqAsR
 3qe+iTnCrPVABjhTziA==
X-Proofpoint-ORIG-GUID: j3zDTd7YA-JeE_8aWhhflWDJ9XY4KBcD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX+IxjYglQqw9f
 RaIlqxA3VEsWjjqOvtqqHKZ7NAWjhjAZaJy9tvmcnPkUmDGnZqhE1m15GkNPqJ0HEf7jNiKJ3FM
 CPIWZ+Nt5DJtiEEG+WJ4RuCNtzgSjXmd2mzMN1duqjvN0YurzUyS
X-Authority-Analysis: v=2.4 cv=fpnsol4f c=1 sm=1 tr=0 ts=6aa03085 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=vlTQYXqq4tgfiFTJlkUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: j3zDTd7YA-JeE_8aWhhflWDJ9XY4KBcD
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=10 impostorscore=10 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080172

mem_cgroup_get_nr_swap_pages(), mem_cgroup_get_folio_swap_margin(), and
mem_cgroup_swap_full() only read swap counters and limits. Constify
them.

Remove externs from function declarations while at it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/swap.h | 12 ++++++------
 mm/memcontrol.c      |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index fc290e29e4a9..843d70680b8e 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -505,9 +505,9 @@ static inline void mem_cgroup_uncharge_swap(unsigned short id, unsigned int nr_p
 	__mem_cgroup_uncharge_swap(id, nr_pages);
 }
 
-long mem_cgroup_get_folio_swap_margin(struct folio *folio);
-extern long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg);
-extern bool mem_cgroup_swap_full(struct folio *folio);
+long mem_cgroup_get_folio_swap_margin(const struct folio *folio);
+long mem_cgroup_get_nr_swap_pages(const struct mem_cgroup *memcg);
+bool mem_cgroup_swap_full(const struct folio *folio);
 #else
 static inline int mem_cgroup_try_charge_swap(struct folio *folio)
 {
@@ -519,17 +519,17 @@ static inline void mem_cgroup_uncharge_swap(unsigned short id,
 {
 }
 
-static inline long mem_cgroup_get_folio_swap_margin(struct folio *folio)
+static inline long mem_cgroup_get_folio_swap_margin(const struct folio *folio)
 {
 	return PAGE_COUNTER_MAX;
 }
 
-static inline long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
+static inline long mem_cgroup_get_nr_swap_pages(const struct mem_cgroup *memcg)
 {
 	return get_nr_swap_pages();
 }
 
-static inline bool mem_cgroup_swap_full(struct folio *folio)
+static inline bool mem_cgroup_swap_full(const struct folio *folio)
 {
 	return vm_swap_full();
 }
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index ad9f5e558814..0fcc0ff587fc 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5958,7 +5958,7 @@ void __mem_cgroup_uncharge_swap(unsigned short id, unsigned int nr_pages)
 	rcu_read_unlock();
 }
 
-long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
+long mem_cgroup_get_nr_swap_pages(const struct mem_cgroup *memcg)
 {
 	long nr_swap_pages = get_nr_swap_pages();
 
@@ -5974,7 +5974,7 @@ long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
  *
  * Return: Remaining chargeable pages in the folio's memcg hierarchy.
  */
-long mem_cgroup_get_folio_swap_margin(struct folio *folio)
+long mem_cgroup_get_folio_swap_margin(const struct folio *folio)
 {
 	struct mem_cgroup *memcg;
 	long margin;
@@ -5991,7 +5991,7 @@ long mem_cgroup_get_folio_swap_margin(struct folio *folio)
 	return margin;
 }
 
-bool mem_cgroup_swap_full(struct folio *folio)
+bool mem_cgroup_swap_full(const struct folio *folio)
 {
 	struct mem_cgroup *memcg;
 	bool ret = false;

-- 
2.39.5

