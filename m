Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D6C4A3F1A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514447; cv=none; b=hw81VkdMQGdtD0/6vo0P+DPbWTRnDMbDuXUPJF68EcQOGUDR72Ofty5/zeh6xao/+A1kb1YlxitOHFGSJZ3xpwpr9pBvzcV6wohsU465s5Jl+enaRjFUKaVb+haS/NeFckJw1l3MUu2tJH2YVG8P+shrWXyBmIh4Dt8St4njQs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514447; c=relaxed/simple;
	bh=9okpZMTMnyXLmB2Ry6c0Ho0fpCdh1VUMQUGi454i+qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSTY7wJp5yRp8Cf8n4RoCRSsemF+NILrjV5XGwNkmnPjdZ8hk3WEGs1XvMnAs8Ksjx7+FAdluH10CevESEvhG6d6JzQ3wsByHgVD9CHAksfBhDH0iFNigiX2NymnU2wzNOJmIjXAmrWHMggNMCPgSWpvX0dZb741A3bGpcW90W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=KyNFFuFb; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=z7s1AkiX; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="KyNFFuFb";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="z7s1AkiX"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FMbNmY2571350
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=HMhj
	gHsliwPh5UROcPmv09nrjwRg6d7C9/cMqZ3ArSQ=; b=KyNFFuFb9uuMNkmZ/nGZ
	MJxQuTaGbvpjICGU6Ngu4s/VAVoknIB+GaN/H/ipDGxEBq+pRj2Ja/zCsTaNyMh8
	rTOgf2pf2FBnV+O4Vrj6n4TRBTaeqpKC0yCpqjinkj1J635s46VL0nCAwmfyDXDv
	21nj21VnC7bjU8uQ98XSkcPNx2DUQuBA5Oz9EHiMP/h5PZhblHSVwq/PAdjJl8dg
	4RrUoFbY+u9DNOSI2/UXiXR7I4qivI4I50mklJ/B/osSLT3I7+Nl5XBsTeXOfZB8
	HMyB0aorOW1vIrddY9qQ4mkdBe9dVSnWmpY9MgN2oJRiiPS1SaTwDP5jxKEO/MxW
	pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gqbwd9t1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:42 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so967785585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789514441; x=1790119241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMhjgHsliwPh5UROcPmv09nrjwRg6d7C9/cMqZ3ArSQ=;
        b=z7s1AkiXtAylW3LflXZWUQawdrHChcWUiCKy40Dxj1tMHNz8IUv4Nto05pyLnd1bqm
         pl46LqabwE8+VLMIsaISQg/ik4YwZh4pNcE6nBKq3L7JLw83nW7rVtJOHNb19SHz0qT/
         hFAHjqLqmiRAlizrYiiIeBwbR7fOH3Y6bW1Ub8B3xWSQi+354AfOmTPJlJuEMbgKh5DA
         uXvQdFtEA6Q3V/du1AFUM/V6hyBgQ0nS1cR5YWq3pn9QxdsbDxKI/+syKf3t76CJZW6s
         5FK75Ti4YSEzTe19mmX9f2ugm/rXYqmBmvRErblOmTx5k/9GgMeYZSS+jrdli1Y4eOBI
         px1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514441; x=1790119241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMhjgHsliwPh5UROcPmv09nrjwRg6d7C9/cMqZ3ArSQ=;
        b=wpfCZSIq62gzn0IdjjCVdzGltxPhSeALgk3chmMnBKyC5cQzxQp4nllveQusVYigKp
         C3W1I+LDAA0ca3ahu9iMN1G11gI8Iuj2bu1LU46VHKviDa4UA8acUJfdLS4ZoLUA5LRc
         J3nDtbTrXsh8rGKkMK7j8uLclWqmEtTPImNEbNqTScLoFmo2J+1IAgnaL//ohLfEtmnp
         Ebo2tgX1EjLPEcVEx7PCX3DVu8OSmoEsO7ApgCXfyAoaaJ71IXsiiWHEElPxxHva/pSw
         6u3ksj8Uw2qpk+eqkWGNRHi6CavG/PMLmXh3XQNfHTeqAJ9lkhJ4anVaukNyHerQUBDF
         0tgQ==
X-Forwarded-Encrypted: i=1; AKwUvBydkG+KH2Fa7GCk54OtV+fCDaMZHNfLuM9C5m0dHSYhGgjWvE3fQul2Y/mKUSROfMycioj3o4wYJbtCl8c=@vger.kernel.org
X-Gm-Message-State: AFuF++mnWPnG6eEhIqtnntA51z6Zf4YYwjsI3EloqYECL2VHvw++FaxQ
	0TAkfk5DhsiK3MXFlmHqKyUwasNZhTqtTnWPkbWuGzjyS79OUZ/ea3lJo1Ma3k9nnOgcb63lZXZ
	I7A63t++nJSXZ0wmJvSUxgSHOVL7WfNDTJAk1jUS+MWjIyo6XeMSD6/dLoGR6YQ==
X-Gm-Gg: AYBFou0HOBAF1kd9f5OQ4/sNMf4zn5LiGdQEzyyqcmgbJ3fJjzuvLOWszDCNWxILHxD
	BhPplCMOeUjwu8gcEWaOVRH8D+0q2SnCCJsn3qzCvQgTxs3P/EWJzuVY4kiXjMoEuHjweGLLR0D
	RR68VNAJCRtENfd0NlBdZxDRL29i4gj5DAePpULBIAZ7zpd9zC6UsvvZWpkGsxxl7JGYxQuHjxk
	IRPYlLVFOhpSMraqkP9xK/5DUmEyCuPODk6GmJmjN1fYsR5EZG5w/dc2T3cTBczARtXX6EMLnrZ
	I4cNTCtD+KmYNLo4hwtNMHuDtwQk0ntdNa7zR4UH7/2/WNZImTjQIzB7evFAp0dMyCvy9M2p3IW
	N5KaNBGx+FWRyhNjP5hcdWf5h3EcdeOh9Nqz3pEOvqE/BoA2w
X-Received: by 2002:a05:620a:2715:b0:93a:2239:4ac1 with SMTP id af79cd13be357-93bb787fabamr64990785a.32.1789514441306;
        Tue, 15 Sep 2026 16:20:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2715:b0:93a:2239:4ac1 with SMTP id af79cd13be357-93bb787fabamr64985185a.32.1789514440925;
        Tue, 15 Sep 2026 16:20:40 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-204.net.columbia.edu. [128.59.179.204])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781dfde3sm77151085a.12.2026.09.15.16.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:20:40 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 15 Sep 2026 19:20:14 -0400
Subject: [PATCH v3 10/11] mm: memcontrol: constify mem_cgroup_swappiness()
 and mem_cgroup_get_max()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-folio_memcg-const-v3-10-c239a6010b58@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789514423; l=2036;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=9okpZMTMnyXLmB2Ry6c0Ho0fpCdh1VUMQUGi454i+qg=;
 b=fi/2DRaM94/2tgQrx1Km8UqYFSnS643KGtWcuw4p72BsEv73LKIWc+7o20uPW2rGtmzVXgwVD
 NdaMZWxQM9QDr1iBOLN5X4QSyCwbT7wdxmvFu2Zj1i7et6qcP0Mi0MV
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=JeEpPkKV c=1 sm=1 tr=0 ts=6aa9d2ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=hXAsoc/zAxyCEdIRhrpmVw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=LvCEVWXYBYKFGHUOtEoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BRMdHNqcKr64QEvV6eRscw6PjQ4ZE3n7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfXwkaJ+amDknZ+
 +MBkID5iIhrdx3452PTvte01kW1KfLVkdFHRv4rOxn3nbiOB8zPphsBMuVhsOcWx/ExLQik5FdR
 DGZu93+xpNERW2w8kZ2/rx4GINh+R0Oj5IDJVSgtX1uVAzoMl+z2eAEOt/TgxIwzxJvAKL2NgGW
 SIksOx0pWrR6lrrmhl+U2y7jLQjKmZR/Df/oU88i6DwZpWRnDFlGHq7r84LpNOkNNrI861wTWX3
 zwDLnxjf10TLxU5WcOmZP1YnLqMLcQZDFsK0qfoxBqcm4F52JX6dzVxCBriv5g/x7Us2OBhGcYf
 +gl/8KlaKBlDS56FWpiZ41K9PWputiRawGU3yGu9wvwUp2y/FJ4q0Fj6hpwqnCvUbHaykE7lZXJ
 ExGvcDgHFRpj3+LkJB7z19kYNe2GeikA/j2E+SwAIaImzuOCOM8W4nq0Evop67/ok206ghLBVj0
 ENN5VQpUZmjWH7xQnCg==
X-Proofpoint-GUID: BRMdHNqcKr64QEvV6eRscw6PjQ4ZE3n7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfXx5u+DNgAGpZZ
 liM03UPijrbIu6Y3DIfTRDpQJbAg0Gp1rp21aofg03fl7LIgVYWMX2+7KfaGQFH8NLiQ7Y2dtr0
 yBUkf87h7aGNV5v0K4B3Jqp1uvl51oPTn+h+STXya8sDWGwiTTOE
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11906
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=10 adultscore=0
 impostorscore=10 malwarescore=0 bulkscore=10 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150341

Both only read swappiness and the memory limits. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 4 ++--
 mm/memcontrol.c            | 2 +-
 mm/swap.h                  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 9beb065c0879..f11899085473 100644
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
index ebf325af7acc..6e3731b97690 100644
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
index b3b54c28929a..1957960dc60d 100644
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

