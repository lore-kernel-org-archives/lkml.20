Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A89F468C13
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514437; cv=none; b=Zq8HbuX93NTreEoaRDk6kwdh+mcdCzPrYiM1E8ValIMOrhVcKhgqEhcugkLeaFC6ukwAWcWHANgp9hh8npzl4mdQWTfV4Z4VbrgcZqUMolbfodNeHxprg3ZUuCiTLcyuVRLnOWaIVbU7SfmuVzJGD26ik49x1Zq524v4tTUbUZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514437; c=relaxed/simple;
	bh=QU3UUXZVJYXJfewV6rqLP/CJmky95kyoP/VKGjLhX7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QB88MNHX2Sf3JdzFwICAWDHTlIkn8Z/g8jyvbFWYdgJKsNs+Ui+9urS9OVRfTlJ9ZRy9guGQgBTDap2d6kEvh02eMnxDO0QN6jRiiC07legoM5RqJMIZ0ecD8GJwtEIdi9W6pEJJD+zqSsb4qWEJkuFdBQX5ZhcM9CeCeVmyUk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=kJo8qCDv; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lAxpUVaR; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="kJo8qCDv";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lAxpUVaR"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FMbaNe4081924
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=syzB
	FL+Amg6nq5QuTRVjxU89GS8pkXXrDTFoGCnbJAM=; b=kJo8qCDvINEVZqP/5oth
	HLfSBaOLnWVkh7Re2h5liuZWA82jqqvlBWzwiOotHwZJh4aXBRx4H18KiT5ztxIf
	2Yu1WLF1GYjfcjoGfm++1wmUhLPTC9W8kCVZsiuQHjw/SAuPQzKPyLha+DmMc8Dr
	LSFoYs987JATwwVrnE7c71/2GbM9B+i7KBDpy5896pyNa1XsJtPAcxaOs/jruQCz
	+m7cTVX+opvJXhb4R5RgPp0n2bKb83efc4RwIlldPELbRHxzhzCnX1WIGGYaACCj
	pNFMW4DiNLBS1cmUIWTFYC16us+OV8Bl34S2O9/ZWQs3//qbkEUhrjjkNO4H4v0F
	Yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gqbwaj2f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:29 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so204348985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789514428; x=1790119228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syzBFL+Amg6nq5QuTRVjxU89GS8pkXXrDTFoGCnbJAM=;
        b=lAxpUVaRcm0bZXx6/c4zRi/vOHnDpL1xfM4Ho7ZxpMR70cUX3z3IlPQEIYP3hoVv09
         AO78s0FF9XoA3LWcJrTzfL3a9bb25uIXs1dCAzIBoaYm9EQhjyN2wlfsT8t58in0I+1G
         NpIA0EMYktNQzf0EsQeTVGsfyGnfw2+QeXSOoVBlqT5nAKZDCU20Dq4GhuykgYiONhJN
         zC8XXNxSll1CqMsSaHR8mZnLyOX+0Bx1avtUG4gcMeHp2RYaT5ll9BDbfAMg4KxVgnjc
         ysdpZEnEzcD+D3LmbTMxF/tOrh63/W8FNw2KJTJhjyW2VuxjUGngRmFl3lPSubDsJlvm
         IdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514428; x=1790119228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syzBFL+Amg6nq5QuTRVjxU89GS8pkXXrDTFoGCnbJAM=;
        b=bf1QWoBhsMU/gCfk4DFYRzBpgwuCJPFr5/mPmcHs13qmk47kr4hl2sUXIWOwvigBQy
         d4IPXPWst3co4TIlJHPyxYJq6kjtOy53iegJ7WjOFC2B738NQig7CB7fua7LkSIsT4pj
         orqkJXa56U8U3zJUVBlCiRlWPt1CoamMHnYZpb4F2oAbZlzOUggdQ9t4YhjYBD1fqZT8
         bveUXnR18+6jNvVSGqSl9kcwC83X2SN6wYUT2CNIPbYT894GKVV/eeyRpO+TJjNiO4Js
         EzEKdySzeR8PoN5IPaAWEw7OStX3PZi0inZvP+1ymqspsCGMrXGMCe201fFWkmB+Zrhp
         FeDg==
X-Forwarded-Encrypted: i=1; AKwUvBx6+YhwmBGp48Vf5Z3HumSWLJm04yxJ01cQKOCu351LjFShOW2f9okBgOLyVfdestJjmGCJnVsy4CT72UU=@vger.kernel.org
X-Gm-Message-State: AFuF++kRwIJUscn2XPjlhzasJA3S/EgMA/fQseB72vqUbiEyuv1QSoiO
	R4moUR6R6QjWfwqEeMLXVJUSTo7K8dJ1/FbcASeniggUFDxH+oSK6HcxQm1vQeCT2EOSSbPoAyw
	Jwh4fFe6VMfxaJs7NhqwoP8vU3xK5ei4W1xXuNRmrr21t0vjdLJBaZIgmBIWDcg==
X-Gm-Gg: AYBFou1XKOYypU9I1FfoMQWautIsE276ZhzQs57OEwZus1KtNd3FRRFySyOCyyP/KCL
	oM08sm0S9n3xX82GBlPpxr8cUaTUqI/KVwlJpJ8W/+1DcBDXIPMwJC6t9aDYjoJWOAmFon+tg6H
	WnVA68O8qBUJQh+H4z3pSxy4CuXkmPzmCc6gWzNCMmXEMSHKL/RLO1AtkNtqLsbPT6N5LXQ4em7
	7SKsgRwhoyggXiQ3VcsL7iMJW02Uex8Txb41IspMgg2VVn+OJOY63Rs6agGAk5pYTfD9vlF9U3Q
	iL7CwCf5fHniFNgigOGs1GEWxVLDjkzgVkvUjXEk1wT+MIsJc8Wemam+ey/lcp6toLxHtqbIbnN
	uY/ZV9OP8MAwlCojvcjVBWB/PTgR8BQPWZ5oC2IhX+M/JTqEn
X-Received: by 2002:a05:620a:2711:b0:939:869:a8bb with SMTP id af79cd13be357-93bb7715c0bmr57404185a.14.1789514428254;
        Tue, 15 Sep 2026 16:20:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2711:b0:939:869:a8bb with SMTP id af79cd13be357-93bb7715c0bmr57399485a.14.1789514427821;
        Tue, 15 Sep 2026 16:20:27 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-204.net.columbia.edu. [128.59.179.204])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781dfde3sm77151085a.12.2026.09.15.16.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:20:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 15 Sep 2026 19:20:06 -0400
Subject: [PATCH v3 02/11] mm: memcontrol: constify obj_cgroup_memcg() and
 friends
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-folio_memcg-const-v3-2-c239a6010b58@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789514423; l=1873;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QU3UUXZVJYXJfewV6rqLP/CJmky95kyoP/VKGjLhX7Y=;
 b=JA48nYviRKcNhLAAS6ffUDuwEht6UL6bjWqY7JWZ7J4zMmEDDLksEm2DyPuq8wbZkrLnj2JIK
 0WWHvP/d3RCCkeC2+GDxfaabWve5E+SsXaz8G4xxUSWglk4KCH+Uvzw
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: shAs-LliRXjbPJcFrqWWUxKYfCbChoa9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfXy1rHsSDvODgl
 hv8e2IVngzSpJoMRPHODElNC2pKoFYsfZCkbTiKSDP6zpx2oS5djcUsLmXzKDHQWXriAAASicgU
 SPCYlu7dvQBJLRSw8/4sh51YiTN41h0QldLxDvyVav1z8/PSbvR8tZjOBmvu8/V3NC3X2L+1Zxs
 dRbSIJh+9l5zpJktAsrS5guv6+555M5kZqAy8bY5aHQzjHDP+NsWuk0PyXNcgvDot6u/7I7Ift6
 k7bsArFEwgZoJP8ycHJsW2Sot6XEdjbqnAB9QeEzkEzMYhkQ0DYyaybXbmiulYdLj74TT5eeAz5
 PkizQmP2as1zCOJEd0L3fk+k0lLSL4f0Dc81QBxWaTq6eEYKzSTXLSULwiVtXmP+wYumx961hnC
 koWFZJWthUVkPYLP/0XtMxj/sWSWtryZw7YCysLF2owlK9Z1BALQPN9wL6jRFOnX8YV0PZod/ZV
 S/4JCioiqeOT+Nf6+ag==
X-Proofpoint-ORIG-GUID: shAs-LliRXjbPJcFrqWWUxKYfCbChoa9
X-Authority-Analysis: v=2.4 cv=JP2uIMKb c=1 sm=1 tr=0 ts=6aa9d2bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=hXAsoc/zAxyCEdIRhrpmVw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=HbpFEVrQSsppjrtFf58A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX9NCSd6yNRG0R
 AmTUh6w1QedJrWBIWpVatajLwojaU89B8c4NGY1/Ep/Vff8SPsApwx18o6XbOwUZdXUFGBbYywh
 1hELy0yfBfJCnxdxxY79s1M0HlH6UZSzoSQB24ozj223jnrSA/Iq
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11906
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=10 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150341

obj_cgroup_memcg() and get_mem_cgroup_from_objcg() only read from the
objcg. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 5a5ca6814782..65cb45f4be32 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -396,7 +396,7 @@ enum objext_flags {
  *
  * The caller must ensure that the returned memcg won't be released.
  */
-static inline struct mem_cgroup *obj_cgroup_memcg(struct obj_cgroup *objcg)
+static inline struct mem_cgroup *obj_cgroup_memcg(const struct obj_cgroup *objcg)
 {
 	lockdep_assert_once(rcu_read_lock_held() || lockdep_is_held(&cgroup_mutex));
 	return objcg ? READ_ONCE(objcg->memcg) : NULL;
@@ -505,7 +505,7 @@ static inline struct mem_cgroup *page_memcg_check(const struct page *page)
 	return folio_memcg_check((const struct folio *)page);
 }
 
-static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_cgroup *objcg)
+static inline struct mem_cgroup *get_mem_cgroup_from_objcg(const struct obj_cgroup *objcg)
 {
 	struct mem_cgroup *memcg;
 
@@ -1075,7 +1075,7 @@ void mem_cgroup_flush_workqueue(void);
 extern int mem_cgroup_init(void);
 #else /* CONFIG_MEMCG */
 
-static inline struct mem_cgroup *obj_cgroup_memcg(struct obj_cgroup *objcg)
+static inline struct mem_cgroup *obj_cgroup_memcg(const struct obj_cgroup *objcg)
 {
 	return NULL;
 }
@@ -1104,7 +1104,7 @@ static inline struct mem_cgroup *page_memcg_check(const struct page *page)
 	return NULL;
 }
 
-static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_cgroup *objcg)
+static inline struct mem_cgroup *get_mem_cgroup_from_objcg(const struct obj_cgroup *objcg)
 {
 	return NULL;
 }

-- 
2.39.5

