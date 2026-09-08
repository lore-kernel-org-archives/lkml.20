Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797F558FD26
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883083; cv=none; b=f+EMHn+zZIk7dIAfbl5azk5bD7CFc89CdfxiAeCpIeVQ57qCBU0ivElYRKbKs+7j5eh3VqmULsa4JJ010ObpMHxyfBSp/InuHak9jSRpGysYb0FMR7fTIqPmVQzR3/Hwf/j2KbNNvsTUOVvr/542bPtH5+vVs6QYK5eVCDKDyKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883083; c=relaxed/simple;
	bh=7T7rpGdGl80eIczyk2CHyU6fksQb5qaA/aOGDxxYlJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojc85dP4Zz790xwf4x/pYTnASGxW9PSIqVGI7x3JTwwM9i8m23N2IOPQLD6u34LFvnnpAsVZO6zM94UcfukhGt3JA1v0f3jALZuBEs1LO+xYsXwuJ8MSwWBiQN1db4aXu4/gdOuUCjfMqCI53cvzgRc+i/B8HmrFf4PPqj3sMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=UgbEefNP; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=2h5m0sl2; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="UgbEefNP";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="2h5m0sl2"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fan8h1774579
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TeVV
	sQIvBZbi+49h4ozI7i7qVRiYtuqemdFb9KMPB8M=; b=UgbEefNPOgcTF4tomGEG
	Q5ckKSUVWPesGosjIwCjoZW/c93h2cEjk4vj+EOjeFstLD2SKjXZuHIXDmPZT3Dy
	3Eb/xPtzA1TLX+Rlak+xLw0bV3udWMJJgUxhYS4eyUTbGqrwIDDi8uNPfgF+w3Kw
	zpaI4o3DlnqODxzJgxaoi458HauGdx/l9LA0HQ1Po4YuE7qk3HyEpcnXRt5AbkZI
	a3MKNpdXaAfSbmNwIpAj6H62OMgwjK4f+cdOJzPGoRsYJfSsdb3AO4b08QEW+1zC
	F3VCp/Vbkbkbjsuxkl3EnPdl2J7lK8pJNyL1hOVVHY5HqpWyj5Y78QGC20D8Fxof
	IQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjmwhgd3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:57:58 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fa5c5a4a6so104345801cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788883078; x=1789487878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TeVVsQIvBZbi+49h4ozI7i7qVRiYtuqemdFb9KMPB8M=;
        b=2h5m0sl2Ax9n15wk5Wp7i5/0fnffKTnNFehx1FTQHInbI3KmHcVlSqmO77XZD13V+K
         806/M/6ORJ4LXUrX1TIY99lTF1GhkeGfHKZjWIJeoRAh1Fk7yI+4cpmxeDZOwD4Ot+dV
         g8wbb+7pKoTcqrMF3b2H3wkvkLs9OTN8nrtGIzbv4DH+LKJqZOLeZzYASDNryXe8XHPY
         3uvNn84SxjBiuDnHQ36anScg7D+aQww02HtVxBs5Bfxr+LJ04IN0hxgk6b8Fpa3/7jhu
         JWM+kE/jExAUvNYYEwxSgxcDJ3q0gFVzvocOoOL9EzhAc8Y3I9yIe42PSjYYyRfQSKYj
         sE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883078; x=1789487878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeVVsQIvBZbi+49h4ozI7i7qVRiYtuqemdFb9KMPB8M=;
        b=JC+YXsL6lRpqvgv9uktFSe6SWkFaUiPYCDnNVkB3BOWZ8xPofzJizwZdIOxltBmuBU
         cNUNJ5P8BBByE8HzYSSH7CCI32yFUNHT3rrIdtB9qiDYYqzisU88jPIkLsK4W869JsIM
         O4pO6VUhL9I+6PP1QucYmYczr2M8DoVd7dwZHiy1AdJl62wPvXFLDJjvJd7OEypk2Ik+
         vcBEGmY2FUcyPySeMG5k7TVgED5+js/ZyVL794BBFVs9mEgUbtCbBMDzp4p39XqS9zBe
         vFojwKO5wuWHCmu/52om/C2kuJ2/KGiyy+lKEtRVBiUq8dFwX0DfHu4/1EKePiXPKRYa
         y8Yg==
X-Forwarded-Encrypted: i=1; AKwUvByiZ0sAAekTGrBAkuaKUS39GfzojvS4lpuM8KCS0VfyxnNrYIBz1QZMj1cGbgPQJjSL4pvBEKYXYIkFMhc=@vger.kernel.org
X-Gm-Message-State: AFuF++n3IQ1ZXgji33BaBRniP6K2QRUTk04of3pj17ki8KJaP7sFVOt8
	YGhmNoVMjli7G+p1K4Kf7Mk5KB56skA8qJ4UjsY6ERwmjo8eq8QW+GoUPwjscJrUrK+UOs9/e0Q
	LIiAxykhoj6qz3umzK9VyA17+qAyKOXp9/I+/+KgvtWxWg4K6RacPTEUz4y1Z/z3KEjNWD6K1
X-Gm-Gg: AYBFou3j6sLWB/rY/SYPjKlb/EOf2fiWhqdzrQJi6UCS3dm3xHRS2gTFWZ4OhGk4eyx
	S9i3cYkTYt0djNTUhYhhUKXAUc/9wCMwjwooxyo4lHBnLAz8u1LfYIMvYi8J1ROeuFg8QNdqQuX
	6EK25hGtevkJlBFvMlb4+bI5ggsxmGBEdA6ILELVcwW8QiCxdhcwLHx/VhSyv4H9kLHOoSVpYn8
	/UdJsBwMiTNE6ddMoLHBdqTu0MHXd0E0DqcHDswGfrP0qMcGUInet5OmgJ+XfJRD6i4ZqGV5Y2t
	f78zlwNSz5M4ohClzH2pwOqKoauVIEvAVpjehExpbKhbQ0LM7NWzVnK8KDjvjVhqzi4FRMlyRMU
	LzsWt/joC6AELQ5qfyD81TQoAuaY7Sw4/U6GEnJK31MHDf9AX
X-Received: by 2002:a05:622a:5a10:b0:516:d699:a99b with SMTP id d75a77b69052e-530549ef2b5mr388066671cf.40.1788883077589;
        Tue, 08 Sep 2026 08:57:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5a10:b0:516:d699:a99b with SMTP id d75a77b69052e-530549ef2b5mr388065961cf.40.1788883076997;
        Tue, 08 Sep 2026 08:57:56 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53093295584sm27830461cf.13.2026.09.08.08.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:56 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:57:46 -0400
Subject: [PATCH v2 10/11] mm: memcontrol: constify mem_cgroup_swappiness()
 and mem_cgroup_get_max()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_memcg-const-v2-10-811e9f443409@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788883062; l=2036;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=7T7rpGdGl80eIczyk2CHyU6fksQb5qaA/aOGDxxYlJY=;
 b=dvicXk+cWpKuYHJz87hjtQBtNMgPgIsy8I6NedGtASQpZSrvjzaXdf1eVZoDbdE5vuWL5jJic
 VYpcQmfMVY/A2GP80eVvqyCVEeLqg9nsU1PjNsZLY5vt+AATTdIhosb
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=Zubd7d7G c=1 sm=1 tr=0 ts=6aa03086 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=LvCEVWXYBYKFGHUOtEoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: aPqxSSX7PKj0o41QIXthOeKs-eBtE2l_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX0dd3dvJIXOjg
 Z7VCLnQWnDD5DToWIVwMPJOZ71BJGbSdlIuulXESIPylyXbo9U/18eWv0tIrACnZc6A3wlUpTmD
 ein5ezDjmBY0eFj5HbEYjh+XF5bTL7bdF+7cj/uY30viIYQyIRGnj4C+9fgw/c9vm7Dd5JkOSLx
 X0rSB+p92Xu1bl6b91SlT/ZGoyXXQ07TSkJp/xMxeZhB+e+Drxl+4B3KGXfbztKM6YGJXyEcjS2
 8RnWuOpX8htIsus87ScUiDb0z+PVvPMTNdQ4KNMZiKe0x0TklURE02tgsKTPs8duyshOQHyer9x
 ey5NjrRBRhmwL0PT3+1WzI9rtujvhMF4OZVuXZfUkQD2cwdSHZl+VqwEP6lnV990x8nk49xnxDN
 U7Zl6UL2N2o+XRk1PJxAs92VIp2uQR9Y36MKmSBLfgpBcRnDjpnw3q7s9LQADCQ11awDN/oQ8Ts
 581fyYmBrTXJ1PVVrnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX7S6mFfR7ulmP
 LYsgpD2YSMmR6ce7ObuC8Qqvjkn2H3iC20tYRks26wpNENhkKmqE3JLRObzb9YJzVyeF8wORxSf
 iwnvMjYmYZWy2fxYRqNh9JCivlIcfqd/RPmnnX5B4osGKzFKGIrC
X-Proofpoint-GUID: aPqxSSX7PKj0o41QIXthOeKs-eBtE2l_
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080172

Both only read swappiness and the memory limits. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 4 ++--
 mm/memcontrol.c            | 2 +-
 mm/swap.h                  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index d8600f1444df..9fade4667d9b 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -941,7 +941,7 @@ static inline void mem_cgroup_handle_over_high(gfp_t gfp_mask)
 		__mem_cgroup_handle_over_high(gfp_mask);
 }
 
-unsigned long mem_cgroup_get_max(struct mem_cgroup *memcg);
+unsigned long mem_cgroup_get_max(const struct mem_cgroup *memcg);
 
 void mem_cgroup_print_oom_context(const struct mem_cgroup *memcg,
 				struct task_struct *p);
@@ -1372,7 +1372,7 @@ unsigned long mem_cgroup_get_zone_lru_size(const struct lruvec *lruvec,
 	return 0;
 }
 
-static inline unsigned long mem_cgroup_get_max(struct mem_cgroup *memcg)
+static inline unsigned long mem_cgroup_get_max(const struct mem_cgroup *memcg)
 {
 	return 0;
 }
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 0fcc0ff587fc..4de2aee45ac8 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1884,7 +1884,7 @@ void mem_cgroup_print_oom_meminfo(struct mem_cgroup *memcg)
 /*
  * Return the memory (and swap, if configured) limit for a memcg.
  */
-unsigned long mem_cgroup_get_max(struct mem_cgroup *memcg)
+unsigned long mem_cgroup_get_max(const struct mem_cgroup *memcg)
 {
 	unsigned long max = READ_ONCE(memcg->memory.max);
 
diff --git a/mm/swap.h b/mm/swap.h
index 0b5d507739bc..94714d9dd003 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -82,7 +82,7 @@ enum swap_cluster_flags {
 
 extern int vm_swappiness;
 
-static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
+static inline int mem_cgroup_swappiness(const struct mem_cgroup *memcg)
 {
 #ifdef CONFIG_MEMCG_V1
 	if (!cgroup_subsys_on_dfl(memory_cgrp_subsys) &&

-- 
2.39.5

