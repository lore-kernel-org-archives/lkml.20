Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C276358038D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883078; cv=none; b=s/78c1hCvuFvhpj9+rcBr3Cl1igvIbm49/iEk5JxMiGDKOkCsWfn8j8/wx5YUlg6GabmbmnssBj23K8Smxb5WgpjNudBOsupny2UCp3LMAsafr3YCeZr4vOT+ER2DvHyWRACWZ5zI7t886R/NbdZaPtsomgi7jujsz0IFrPAyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883078; c=relaxed/simple;
	bh=kvV44+aJCJM4fB77OGbPL56etuSFfl3a0wSY86ZeaTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+MXNYxu9xV7oO1qSp8NomkEWzG31qfge3QdKKSfofeIbxo06cvx6ExgSCUGel4fOFC5ULvS71hrMxL8QG23wuhlj384wiGyxmZrZ1i0v7cJn1mmhQJA5aHbMCf8wcF3Fqr5DZIbFk91qKat5ij5RQcyRHIl+YBzMR6xteHUmUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=sWPgyd4k; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=LpaY1izN; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="sWPgyd4k";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="LpaY1izN"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FbFqV1064837
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=SxtD
	+AQL002KfnnDsmRr+07OlI5SPZR1PCTXeAbvZWM=; b=sWPgyd4kPNiYtY26W90P
	qYzZMBmjKfERC8GP8MEI+KU/9IAvN/2/7fAkKxvwb4eZLXY5bxazu5SnKiB2hOqf
	W/uVN4poCvg/Cl0EpaUuzJjmkPBltVMZot7yuXqHFCDBWBf8WZSSSOzVcAw4LJSl
	Qf24SrfzC60zPlewBKKh62WiueCKH58K5xwFBZFZpGWRo/KCRxOkz7KEsk14pw+1
	AA1coU29U+jptJ/YLzlcTKjV6BxDTQ9WoYlT8xhFIwgMnmYXNWS9tnO9g2oa6B2+
	2hGpDC7lyFLlblFiMqAPmL9LqgDsI6iQx2MxC3fcwPXgKgHIQdKmTyC3GlAKPUbs
	Hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjmwm8br1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:57:54 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5308af39ab3so25814951cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788883074; x=1789487874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxtD+AQL002KfnnDsmRr+07OlI5SPZR1PCTXeAbvZWM=;
        b=LpaY1izNUXUUOrNTAx26/DrCBJs5gb+Tv+CqnMBLz079vpJart6WlhbmmWGP5ibhHC
         9kvlPee+zHiev0I7H2i9odvFQMhCJa07b1ms9/L8iCKBuHt/Dv9boQvxmp5+W3VzTlrT
         wAif90UX7WMIfHbvtGxFstPeNAV6hn2jixL+LPpoXnPFmlBL6Pt0v/4zFS3aOuCy3SEG
         UR0c4Zv90f9E/6bhsx73jl/P0fQ+/5o6jKQTzbA52i5G2gdCaEZfYBmexoG2kN7coZak
         Y7xvB92QdGpO6EFBQbbFPsL/6UU6ogGtQHz1iRUs4anLmY1Q8IKlBrArWYAmI9QZ52/9
         IO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883074; x=1789487874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxtD+AQL002KfnnDsmRr+07OlI5SPZR1PCTXeAbvZWM=;
        b=o/VtA6M9Cv9i/Vu1SuH8qKLSYwRa2WZLo4FSI5LkH21wPLa6fT5Rq9DpKqPGMznX+b
         FbYRUFHVFwjz+ZqrclxdTJ7lHQEpYhmHzSzs6jAHVrJuljMQgdVZ1T0tKi59/rJt5B5X
         PNu1r0S7UZqo0SVrEVyEHjU7OiAtaSqTtgSVt9I0fEHwaU+2FFLPMAz8wPwp3Q3Owu3I
         iKsVIM2ZOUWnQxTsEEQANkHMUhq64o4OwOOw4rrtN6Rx0f99KculboXKdrWd0SJhNon6
         AqBMmgnBC2IKxzuxKr6HzOBuD3ZFWzwXVbN5M312jxxSBLFdvzxCOodGzR5gQ2Bk4Np7
         1vow==
X-Forwarded-Encrypted: i=1; AKwUvBytUyqt0phzM5tGsI3kRTk3tnz3eaUAuh8/uf03pY8O2mN3jk+9JDO/OKPR6jomXDQA7ed+/JWV1b7SoKw=@vger.kernel.org
X-Gm-Message-State: AFuF++lkwkIvJKlCopBiq3xfAw0Rro/s0T1RzibmT8zxlrmS7BCvqTbl
	5SlU1xB6MRAJmk5c+vobqlbbpNgiJSq2zXBFRGHiSzfk/VK8Nke0VnEBeJh8XQHrHPAD67046UI
	joxIEl6Cofp9EuWyGz0zoClGoX9SK7aITpNIK9LXRSd1HqkWewNLo21UJc7Se9g==
X-Gm-Gg: AYBFou2hO/WX3xldLrk018FQVXruSkPmq7fao3lj3f4Y+PnwciUzKdYUHbsptmJGAgL
	+ue8Cw+g/trBUrluslDRSIlTCnf1j8VrR8V0t+KaxsO8ZlvPIMbWVb/IrKJG+dVyRb4UiRey/gT
	iXd5nJukljBOgYTrLphLQeYvn8qlLt2tiLR69nncI+0bJMGyzRa/0Y0FFJD38lydpi1sTMVTHbL
	SpYKLOjFfFXBei6tBheW4ETpckvymFvjgYr0N9N4PUtircGb6/j2j3IaKBKkMBaDJ6WX7j1l+Mq
	HFzo/7flwxrQ+nUweSBjvv72xT61Bjcg9GEKmaaxlOnnXgy1PYQ2/IguO8QI6tuhtcYmYiyu/Y1
	d+uAvto2vBVumpqd4tjmSC7mDv/eBCPvauVcphiYmcCdLWGBq
X-Received: by 2002:a05:622a:40d:b0:52f:f5f4:e9b6 with SMTP id d75a77b69052e-53054858afemr325153111cf.20.1788883073622;
        Tue, 08 Sep 2026 08:57:53 -0700 (PDT)
X-Received: by 2002:a05:622a:40d:b0:52f:f5f4:e9b6 with SMTP id d75a77b69052e-53054858afemr325152371cf.20.1788883073013;
        Tue, 08 Sep 2026 08:57:53 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53093295584sm27830461cf.13.2026.09.08.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:52 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:57:43 -0400
Subject: [PATCH v2 07/11] mm: memcontrol: constify the reclaim protection
 helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_memcg-const-v2-7-811e9f443409@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788883062; l=3509;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=kvV44+aJCJM4fB77OGbPL56etuSFfl3a0wSY86ZeaTk=;
 b=ov3vX3rCMKxxUOA2NgB6If66E7ZEX7qrXVJ7T9lPrHGCKzDrZ99uuX/zCq3mtNsOMWHbjtwLC
 0waWXjMDTixBaKrxfaHAOjhASiV3wuC4Fo7O+xEpwx4PJkMcedwF4Ba
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX1D8fvagOOjrP
 Ifv2qC/g74c91S1pzfE9xxHlco0xCSkUPD3iDGx2k0QPffofh4bnP22nahYjmdXfq3lB9IWB5IN
 XFY7WcWaZeDj6dfq64ZnDLUwQQOH2rrGoa8fu5s5VnmnHYqePJ98OU4ELDY/+wK/SAICRWlVeiB
 AuMxQDZRdTi90qIhhCFos6p9BA1lHEY3kMj45sieH+8KwkZjG0206JZG4B+7yXehuyIi42hPNLz
 l/RB1F+n//cvw8Flc3H5KQd5aY2iodv78WFYXKgBtCnmPLhK3rwG+EoV2nruFvc6CotU1KBnmKZ
 PmPRrL/14P8AXKgokwzahfTnqsC0fBxYN8RZnao7b6JdcmYo9N8MJLcNZAuvqyociDeSWJ2nKJL
 RUTsvAlrX3G53S6EMyHwIriHRA/lVOREZG9EKnCuR2rZxV+6h+aCBUXJXWhrZ3p+bNsWTMvhJtV
 09FhT6/hk3ylCDZk63g==
X-Proofpoint-ORIG-GUID: 3B4ulFPgfvmR1VwfafR_0PjxEA4Rwy0w
X-Proofpoint-GUID: 3B4ulFPgfvmR1VwfafR_0PjxEA4Rwy0w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX3vRiJ5f+uhh2
 G8ccaD7VVhozrfygb8Vy0x4eV/R/ed2biJP4DjPtGRYiT/tOqkAH7dAQPYGaR25fR6QTO+rpXXI
 vMsYO/LE4Boh0FGsZyVpefvKn84EKLR/wYrjqqp84yW51CTerYIW
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6aa03082 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=daxEQBKrgOSOeia-9noA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=10 spamscore=0
 priorityscore=1501 bulkscore=10 impostorscore=10 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080172

mem_cgroup_protection(), mem_cgroup_unprotected(),
mem_cgroup_below_low(), and mem_cgroup_below_min() only read the
protection state. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index c434a567bf57..f04d2b2b47e7 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -570,8 +570,8 @@ static inline bool mem_cgroup_disabled(void)
 	return !cgroup_subsys_enabled(memory_cgrp_subsys);
 }
 
-static inline void mem_cgroup_protection(struct mem_cgroup *root,
-					 struct mem_cgroup *memcg,
+static inline void mem_cgroup_protection(const struct mem_cgroup *root,
+					 const struct mem_cgroup *memcg,
 					 unsigned long *min,
 					 unsigned long *low,
 					 unsigned long *usage)
@@ -625,8 +625,8 @@ static inline void mem_cgroup_protection(struct mem_cgroup *root,
 void mem_cgroup_calculate_protection(struct mem_cgroup *root,
 				     struct mem_cgroup *memcg);
 
-static inline bool mem_cgroup_unprotected(struct mem_cgroup *target,
-					  struct mem_cgroup *memcg)
+static inline bool mem_cgroup_unprotected(const struct mem_cgroup *target,
+					  const struct mem_cgroup *memcg)
 {
 	/*
 	 * The root memcg doesn't account charges, and doesn't support
@@ -637,8 +637,8 @@ static inline bool mem_cgroup_unprotected(struct mem_cgroup *target,
 		memcg == target;
 }
 
-static inline bool mem_cgroup_below_low(struct mem_cgroup *target,
-					struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_low(const struct mem_cgroup *target,
+					const struct mem_cgroup *memcg)
 {
 	if (mem_cgroup_unprotected(target, memcg))
 		return false;
@@ -647,8 +647,8 @@ static inline bool mem_cgroup_below_low(struct mem_cgroup *target,
 		page_counter_read(&memcg->memory);
 }
 
-static inline bool mem_cgroup_below_min(struct mem_cgroup *target,
-					struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_min(const struct mem_cgroup *target,
+					const struct mem_cgroup *memcg)
 {
 	if (mem_cgroup_unprotected(target, memcg))
 		return false;
@@ -1149,8 +1149,8 @@ static inline void memcg_memory_event_mm(struct mm_struct *mm,
 {
 }
 
-static inline void mem_cgroup_protection(struct mem_cgroup *root,
-					 struct mem_cgroup *memcg,
+static inline void mem_cgroup_protection(const struct mem_cgroup *root,
+					 const struct mem_cgroup *memcg,
 					 unsigned long *min,
 					 unsigned long *low,
 					 unsigned long *usage)
@@ -1163,19 +1163,19 @@ static inline void mem_cgroup_calculate_protection(struct mem_cgroup *root,
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

