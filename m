Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5050A3909AE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377323; cv=none; b=KULw8nK66nJcU83BQkE4RAmY6UsDsfQu42BkR8PruAltSpzYTADOxLyYEAfaYCAK7PfFxr03VcygLXrRV8vuv8K6Fes4R7pduUL5kSMhMZQfs8X9Gbv54TjLUwJLITBAwETd9PrBWLO4mf77F554NYhOVB3zzLftfsiiMyVumgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377323; c=relaxed/simple;
	bh=32H1t1WqS50OuWNOahh2XKuh80JbjBLzpk9HxQSJAR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPdnRDKh7l2uoqImlLjQinhIBJ+Ajr0EJsyjlsCFEbqVXcFNqipv6e7YSxp8YKafI923B7xLe3cDWKr/Mm7SvYSpPIkCMSszNw55TijetqQNSgI1f9k+IHzqdADLrdZUnKWrR1QCNO0pbzl5+vuLOXcs+W1wwrt6X6cu/q9IzxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=FmkkumiG; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=5mNqDga+; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="FmkkumiG";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="5mNqDga+"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682IvWju3642402
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=XPhT
	KwWu0ZC070eRJGAvJA7RPQcJokjsS4EySLq6rA0=; b=FmkkumiGvIPuvU0/9Qvj
	84xeTxIV1I02wmmXEXUfGdjLVSTnBDlnqF6ByVz85HH3FuFHtKxvn5ZJH0iHB0Hx
	giH0atIN6rUAssr3pOn2bvSD8+TLFgh/TtC2J7uR4BlfeugnCwytCZTyotKY8BMM
	Tp4PZECKpx32ClZa7uJ0bTucn8T1sK1IbkaNj0JPpt2WWf68R4eR24aICHB5H+cG
	h/PgeczlHgCmMxPU1eL6Cie44WepNfrtyFl2qxQcCx7PL83478svCyyqzhMtKYaN
	H7GFr4HsFSvzR4LMKhiOP9dUqAbEt31bNdV0cbCIPAYOAkoAJWvK4Xq+MKZpBorI
	WQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4geshp08ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:28:21 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fc0097865so34288191cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788377300; x=1788982100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPhTKwWu0ZC070eRJGAvJA7RPQcJokjsS4EySLq6rA0=;
        b=5mNqDga+RgJqWWIpE+7QB82OQFdXCfPc5nb657OqGgv3bvfqQgbUZi4m7nNu0Ngx78
         5/DI+ERnGnN5NqLKVXTWrSf4Vkyft3knNlbzPI/giYwhPhfoM8dF45tpa4FPpVkz5No+
         3Kx8kVNiFIKztxSrD+JDnE1Nz/7rEVQHfTYg48bmxGMdc9j8pTOibbpMjeT/3QndSgPL
         LCzGuhVxPAdP7Yjf5TEaj9gQrr6YKwg7jub6bJQSPUTcQYpYK5N0v6LZGmS6Flkx4vc0
         LP9zMGt2tlE/3hhCSEfLGq23c2D8pWgdOcQwG6qQ4W8ki0EE9UWyVWB6leIG3UA+9rVg
         ULNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377300; x=1788982100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPhTKwWu0ZC070eRJGAvJA7RPQcJokjsS4EySLq6rA0=;
        b=DqwHq8rM8RU8VDpvyABG0+dGRNcydbvQLMrFFdkj+tIVltmWenKNwn/xku6KjeGrOo
         qIEfIAuLIVgiqsMCgKSkhcJhekZKQr/TL3crABnAEm39ieztvpg7UOfCjGbgnhiahX2R
         2lMtym8XD8kMy5Q/3+Ej5ps8fvF7m89Rynn9aeWVY90CKn1Zj3fPiWBYM5fqPOmg6d3A
         OK2IveqvFh6K5jAvj6vcU2Sj2HN0XHT0bBNwBS3EeSxTltJSpX0cW7ls220IWHMNdDX1
         pugkTRGRBu+pvGSlapj3EXb3jECQ/6jet60KEvu3rwWeWte3vYFnlDoHt2vVzTiFd+p9
         xE2w==
X-Forwarded-Encrypted: i=1; AKwUvBzJxeK1GAa4smPd0lhOZDo8jihp6rKWHilpFrDxZLXYVMW34Hy0oRb350JLX59fJ0giIuBXDy05DnsMX4k=@vger.kernel.org
X-Gm-Message-State: AFuF++mk+M6wd6awmRtv/I6NqI290NNIDnnqs57/22a2OPMU8ggYysHO
	OyYYH+7u/KltI8NdKfsppgzJZzAch3AmKsRLlYfNdk3pED9Th8MatEWwN4hkTLTGzZJb8CyqHlH
	VzSSgkmtvAHhkvQblCdjheD+PW9Z4viEPEzAnMlJ6OuTjbZpwz14s13UhWa979Q==
X-Gm-Gg: AYBFou2vrcVzVsZdWJbt8kTfSN7e25CGDiYXhojrlyQXDIePW8c671XmAHMdCk7GQVe
	b5fEDWl7FdopyijHlCcwwljsPpp2nlIGugn8yDRyvrdgABGGLzbJFjJcgpdpPVkC9vrREQyroZV
	QDnu93rpv3sWIDM6gAj0SymqucndPBIjlK+CsMWddyCH6eHudTILvNmQBsuU/sM6HSSock4NZ5J
	e2Jwm2ujhO5I0+nSj0qfxBJbkFsj6osWL0v1SSxWHOO54s2vTb+ciz37wDlwth5YYKesK7Dolbb
	OPX6SE++Ruj3a6R+CD0Aaw2aMdTVZ6hFdf0tFQ1+wBmQb5sfPSIVF/ixE2uimQiRS1eleofkB2E
	JPFPyK+bHjr/WFIkd/O8qk/5a982YzRSUiIClGmz6TzkRQg47fxY7OA==
X-Received: by 2002:a05:622a:1906:b0:52d:918b:92e1 with SMTP id d75a77b69052e-53036b93351mr82217201cf.5.1788377300533;
        Wed, 02 Sep 2026 12:28:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1906:b0:52d:918b:92e1 with SMTP id d75a77b69052e-53036b93351mr82216511cf.5.1788377300021;
        Wed, 02 Sep 2026 12:28:20 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec85a0sm25420936d6.29.2026.09.02.12.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:19 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 15:27:48 -0400
Subject: [PATCH 02/11] mm: memcontrol: constify obj_cgroup_memcg() and
 friends
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-folio_memcg-const-v1-2-e2c1da22246d@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788377294; l=1873;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=32H1t1WqS50OuWNOahh2XKuh80JbjBLzpk9HxQSJAR8=;
 b=LYEgMgFYhn+Wku6NCeEdHf4ev23GptfScBM0FZS17DRElY3nFhOjx7LrmufmMei8aKlnIoLdP
 PVtuZrXpv0XAT4Snz1hQZnXyChRYU0Yp4h2nI9ex4KXJVsx49m+SSKe
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: -I5vWVubG-U88jaRtyZc-tXPRXrxPsTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX3SFptQKAKel5
 X55y8OKSQll+6Fe3gR8TJAfAaxz7YhswaXyOUDqBlEkdayjNhgFEL8BL+rnZzGRFZem+XtKXAxZ
 Gp150UUT/sDAJSpdCcRzigH4SEG7pwvyBrby19hDPEy6KMyH7Rmf5PiV9UYFiXhOGuE7qRga9zi
 h9kbN+X2BFDnR4LvkSXXgVhT483D0aeUNnfCyZNPza9byvyoMJFHuTYLEyjnyB/MJQRQxp5c7d/
 DSOtv19DUNAN3JxwgTChAeSDlT25lWWWNOEJFqSWvOI3NwF0yguoNZ9qrAk2SBEPNb187oW+hKC
 YnGGM8GA8IgLVVmM7rYoAQyolmjzLulMSwdNs7fLYo7EEBHY8xiPRYk9K3SlkGXwcvSEBt0s8/l
 4VTolCK48NXzqnOwIC61S1w4SXV1mExmQzo7BylqfFAh5OiOGfu1zzDYm03gNp/I+tleWTLRCPC
 hJzpUPQ2NFtYAfrKT3Q==
X-Proofpoint-ORIG-GUID: -I5vWVubG-U88jaRtyZc-tXPRXrxPsTS
X-Authority-Analysis: v=2.4 cv=J96aKgnS c=1 sm=1 tr=0 ts=6a9878d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=HbpFEVrQSsppjrtFf58A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX1x1+TO0ZODty
 mSYRSk+zsNtZQ4k+MHq/s0/R4IqBmTUo2xzKQfDDZpVGadQh3ho0z7rMAdKSiABC00MFSMqvrIJ
 Ppgsrg/vt2Li7U/DuxFqRq09wwV2bRRwWeoukmIW8uy0iWHYkMu9
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 bulkscore=10 adultscore=0 spamscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020172

obj_cgroup_memcg() and get_mem_cgroup_from_objcg() only read from the
objcg. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 91ca94667d44..2b3b62e84ab2 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -363,7 +363,7 @@ enum objext_flags {
  *
  * The caller must ensure that the returned memcg won't be released.
  */
-static inline struct mem_cgroup *obj_cgroup_memcg(struct obj_cgroup *objcg)
+static inline struct mem_cgroup *obj_cgroup_memcg(const struct obj_cgroup *objcg)
 {
 	lockdep_assert_once(rcu_read_lock_held() || lockdep_is_held(&cgroup_mutex));
 	return objcg ? READ_ONCE(objcg->memcg) : NULL;
@@ -472,7 +472,7 @@ static inline struct mem_cgroup *page_memcg_check(const struct page *page)
 	return folio_memcg_check((const struct folio *)page);
 }
 
-static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_cgroup *objcg)
+static inline struct mem_cgroup *get_mem_cgroup_from_objcg(const struct obj_cgroup *objcg)
 {
 	struct mem_cgroup *memcg;
 
@@ -1036,7 +1036,7 @@ void mem_cgroup_flush_workqueue(void);
 extern int mem_cgroup_init(void);
 #else /* CONFIG_MEMCG */
 
-static inline struct mem_cgroup *obj_cgroup_memcg(struct obj_cgroup *objcg)
+static inline struct mem_cgroup *obj_cgroup_memcg(const struct obj_cgroup *objcg)
 {
 	return NULL;
 }
@@ -1065,7 +1065,7 @@ static inline struct mem_cgroup *page_memcg_check(const struct page *page)
 	return NULL;
 }
 
-static inline struct mem_cgroup *get_mem_cgroup_from_objcg(struct obj_cgroup *objcg)
+static inline struct mem_cgroup *get_mem_cgroup_from_objcg(const struct obj_cgroup *objcg)
 {
 	return NULL;
 }

-- 
2.39.5

