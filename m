Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223F3955EA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377336; cv=none; b=kXIOq/4z8uzkMAA2viJrKGMZ2D66NE5cYUb230tkboF+oh4tiBpqTMy0MOg2i3KMy0FEIP/VWqzh4j+/DOw9ZoVzheHWK3barTiY922iFhbQ0xVicgXd4lSQPnqgSXHHNV8aOX4v4nbXL3Kqav0ZTiSLpyw+W2LzwqZSg2RYmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377336; c=relaxed/simple;
	bh=qY55MTnqibpTPmaITCcOknY/TskrjruIzBjhjSvoJq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnzGuD+WqTVY+tAcH1PCxhGUqLngOveQVRHPxt/bX50WiIOfKXb+dYnbKlGkJ/fk86mpaauZOKoP4JXtL2N5ZyLgx10qTfBYyquWhcd+EGgDhU64wdTPb+O2qxJ6h2xEOF2wVx6CJzdfHs4RWwEC3LGA15XyuHhMeOQEduNYQmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=VcbRIp4J; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=bL5qUXmz; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="VcbRIp4J";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="bL5qUXmz"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682J6mM6805268
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=zKnV
	zljslWEn654S8LhmKqCkQWwfR1ZqpbkHiEttZS4=; b=VcbRIp4JVvQ/3ejpIWPP
	caZTh/F5tjCRdvFZ/W4BJovJXlZKNdSkFZS17kv8udRIKw5cuUQxZvRHb38IW5OD
	LQ/GwWFWKi14Q98Qqt8pl4Zi9ZCNICDsIn/zbyYdpBtISVYL0Kby7OOydvSI8Pjq
	GO3ILRPBcard5zQIfPI+Q3RZTHtYbgkFru8pWAOQ2/f00YWwHgWwXMiHVG6WqiF1
	vGSEFzCpH0/td4+0cbc7Ng5fnIRrgQ2h2PEalAq4fw+Evle7D/vWnFNjVTZDpYqL
	96MXSyd8+P0h/PSauYCwlgtRfq/U5iCS3XyTMdzODvpYYJft8/oEVhN+Yx+GC131
	4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gesp0g56g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:28:38 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so283430185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788377318; x=1788982118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKnVzljslWEn654S8LhmKqCkQWwfR1ZqpbkHiEttZS4=;
        b=bL5qUXmz9DdFE5srnZUpOpIqHLn5noxag+qtCYuKk6KQ3tg5kP5zywaYX3u31lUKT7
         lP8sS5xZscmfNQPY4CHuWcYR0RTGMUfxvMMF7nnd8ccOYoWgJNApeGJ50poYV5qqcVP/
         eHjopj78fAL2Y5YavNSRJ2lbqUc8/4VkO69mD3cN5gsKvJGo+BOSH81xrrpAZL3hck/Y
         ks4TX6QWVkXz0aeGsfhXlK9j4EiDKHit4BNnMYRb1L6gcGM86TVH9MKy0RPKea1Rpm5r
         2PgDV4IjQT4NO0iM1ubOSg+hQR0dLMyBNtxHvJbBjm1TRXKwreMyMfys8440xfGNqw23
         UClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377318; x=1788982118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKnVzljslWEn654S8LhmKqCkQWwfR1ZqpbkHiEttZS4=;
        b=AoxeJjNd5Y1qSU1US2umj4Q9IQI0u8sT2wnG650+R0qwC6pFb9qxxxKbyKy31wy443
         wMgrTrkUay2D0gej3ntyz/vwB0crP73v1PbS0EmB8mwwo2lnmnGY6zT1ZhomJdd+dKgu
         MlrUqkuo4mLgG8AXYrtgpeX4kuAtd6Hezv8oGW2++1IfM1MCeMDgjJL9RKYHwUFBaPkM
         rN7ZIn7NjxoTVSg7spTgDS3B4QKNXidANlY0P9dshQ8/KVz0Wc5rvZVkq596RPSA+OiJ
         Bc2cHCXES4MTm9WjvjkIlhzg6Sh5gOCmKAR1tpbdVS8Ac0y/pr6fiTUTRGR7YaXHEPJq
         yLkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+0c3/popI/Z2AUyk+v+H3RMoAbvGqzNky9ALwA6X1/R9xsuUqJrYajg+lL3TPMMJ8JgBoejeMx/vDF98=@vger.kernel.org
X-Gm-Message-State: AFuF++m/8ThHp5g/PoY6ko2K9iyAkl5A7K39wxh7Q4hZn6xY5f2v7cZx
	pZQBptw0w1Lzq6WHAGE17h1jVKbx9OOpRS1SwIwzT7e3ke58GgsvZ65Bx70hjXMSWP5+aDEqeZc
	75/BM+hoK/R+UCw8DU5V0La4jOyTLUns62WsJu/AhnW1XF6KVZCHFt1YmqrlK7w==
X-Gm-Gg: AYBFou1G/1q2tel/jPkpgVlpO0AvkXyeBMZw60mZXjp3DqGM5NZLoFoqxXH3jNmqO8/
	JerbsQgItYveZ2xur9j2LWlf/qt/MbLkoU2zes7o5dXrS4rlW/2Wbw8mQucnitg4AMmbaNvP0QG
	jE8m09mANgSBY/zLfo0KD9XW1MgEL/+IGORBndhJBUr6oNZOGQHdlaBAh8b0+cJmtOpn6ClbgQv
	LUMQ6GEy9STLsGaGs9VmDKEP0tkFf9Zj0kCqApvdE4E/79DAAQiDexz1BBYEyMQtV7hniS9d+4b
	FMCdeykPojAxM5S97iq/0/R1cmtaUF+rOOsn+g7I1SiTbSyaFBFI+aQ55ulJzqeg/sM6lTYdlEr
	4A4RUdUm1cEmrK7xWTVGNL2eAEl/LoIjzfDcfBa6GqPOQ7Ke/8gRczQ==
X-Received: by 2002:a05:620a:4448:b0:936:a407:98bb with SMTP id af79cd13be357-9396f65f15cmr67782485a.9.1788377314169;
        Wed, 02 Sep 2026 12:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4448:b0:936:a407:98bb with SMTP id af79cd13be357-9396f65f15cmr67750685a.9.1788377310673;
        Wed, 02 Sep 2026 12:28:30 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec85a0sm25420936d6.29.2026.09.02.12.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:30 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 15:27:56 -0400
Subject: [PATCH 10/11] mm: memcontrol: constify mem_cgroup_swappiness() and
 mem_cgroup_get_max()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-folio_memcg-const-v1-10-e2c1da22246d@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788377294; l=2036;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=qY55MTnqibpTPmaITCcOknY/TskrjruIzBjhjSvoJq8=;
 b=XBJ1VxJgkZ7z5/jJpbpfdgQJ9HTXTIu58edJVRrSCFJGK7C1hYYjRFweIITZPR6353Ht7J0S6
 Agk9F/63QbZCBLqPgyFB2x5VwRDyz/DAkCE+H1xfhE5G+ha32Pkhl9f
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: c90ipugFmwOwc9INhnrexvJyBD9sU1Zq
X-Authority-Analysis: v=2.4 cv=PqejqQM3 c=1 sm=1 tr=0 ts=6a9878e6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=LvCEVWXYBYKFGHUOtEoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX2mqeDgGsAPAW
 13XAzIa4rlOYm7H4fbq+TfGugJXkKZwP/YDvKyduKITDuhnOkcKVWRKUb04TDGKU2gBHBOvjKhX
 UWp0JUfFA38zt5kS9nJIxTQWMrZL++OsfX7L6vH30jSkL8V4OLhb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX/FD1S5W0XwPj
 P/YZS0T/aTkrpSyMMTbFiJBCR4dOp4NWXTV0mxoccVZ3FYrFH74rb48hjvdEKWfXuNm0lg3Hh3X
 Je4C4IXIVYG1zr+7FwMUPqtM05T0MWOeB9KN9VjDdf8L2+guqHB9r5rnkrEupjvZcVtfZemfkTU
 63HVLs5QfLtI6DzVtOo5XQS0EfyZzVtWV87c1wMEj9E3x2kaGGvQK3DUjTV/s9XjO8PoUXu7rWp
 EmDcXf0MuV3drEDloD3zR1h2dHEXa8/Qxnx/tCSyTfyh7FVE6pCf/W12KUbbizK2EGSAHoGApa9
 G4HF+sMn7VHKNZU6vKWp7Z59sQBUy9IrCsyjJh+EFP5ol+1LRFklprlvuNjV0qr/SYxYuBOgwIO
 E1foqpZ2BD0VhFNPesXuhdzehx5D4fQHB8wad0wExrq/AFV6UURHw2n9SAEX4SYdpHWqGGxHQz7
 Ds0HlO9viJbtaGtO8Ag==
X-Proofpoint-ORIG-GUID: c90ipugFmwOwc9INhnrexvJyBD9sU1Zq
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=10 priorityscore=1501 malwarescore=0
 lowpriorityscore=10 bulkscore=10 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020172

Both only read swappiness and the memory limits. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 4 ++--
 mm/memcontrol.c            | 2 +-
 mm/swap.h                  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 10a197886f31..2d5e43dbec4d 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -902,7 +902,7 @@ static inline void mem_cgroup_handle_over_high(gfp_t gfp_mask)
 		__mem_cgroup_handle_over_high(gfp_mask);
 }
 
-unsigned long mem_cgroup_get_max(struct mem_cgroup *memcg);
+unsigned long mem_cgroup_get_max(const struct mem_cgroup *memcg);
 
 void mem_cgroup_print_oom_context(const struct mem_cgroup *memcg,
 				struct task_struct *p);
@@ -1332,7 +1332,7 @@ unsigned long mem_cgroup_get_zone_lru_size(const struct lruvec *lruvec,
 	return 0;
 }
 
-static inline unsigned long mem_cgroup_get_max(struct mem_cgroup *memcg)
+static inline unsigned long mem_cgroup_get_max(const struct mem_cgroup *memcg)
 {
 	return 0;
 }
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 2b8705a88f6a..e28b2a4f278d 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1878,7 +1878,7 @@ void mem_cgroup_print_oom_meminfo(struct mem_cgroup *memcg)
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

