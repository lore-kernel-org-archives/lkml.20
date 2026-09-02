Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D04CCDC9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377327; cv=none; b=KSoesV0GB2jPGKLerj9995x7+y4J9/9RCwNs+BISpsFJrfARR3S36IKi5wfCDlG9hUDDa2LnqWKx0NEitiNeHgqMgNpV68qJjeTlNrz/2LvXQAJoT8DQfyockxtaCfJNftaCIyXA7hHsnw2DcfOTaKfKtayEtiOoiw92jYh77Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377327; c=relaxed/simple;
	bh=TSz32dlKErH2sHKGkXoZorQQsSCc5csvXiTKsSs8af8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T76wU3JTQF7mGjV6I+xebQVqxD7+0bGQpNuDWp3udG9Fxk/ZVRw+C+SBHbV5e+lLXcF77x4VYac9qbifiPkaYSx1qPfYzaSv/gusx4xN+5GnA9HFex23yCU6xJ1MKYYhSnLyBlhAeeYTnh27pxBNJ61FPUcg7Ja4WGhWQWtDgE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=K//DCJp7; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=YWhef4Cg; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="K//DCJp7";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="YWhef4Cg"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682J6l7v805185
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=RRD0
	l8Ri/Xtt5YOzEf8unqF1fg/jROr3HiauectlFwY=; b=K//DCJp7WgpW3EhluvHb
	mxXUG9Fb3PRtnkEWPz60NFmBC0MAx91TgdqCGDany6pjl/eemgTV9tqsZCdZ09b8
	Pnfo2Z7acPGF+Kf2yjLzi5rlDdcRED25bblFwXz4C5GTQCpVDDu4YmsxUGebXn3x
	yT3z+zt+7t/lDyD5M5Yz/Y9OdXJc+07bkCWLG2OaYNInncTeXLPlIz+62PQASuvV
	hP8DulwrXxGCDEak4wZKQ7QOH8IaVzDSYslbmyB7qCJ3JN5/w3PweLz5mlLgFiCR
	tREMaIy0dW12A5PGs+cht8YW9hS9xBFMhD+wChNjsfk0kiF5+zuwX2a8A4jiivu8
	GA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gesp0g55b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:28:30 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so40056741cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788377310; x=1788982110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRD0l8Ri/Xtt5YOzEf8unqF1fg/jROr3HiauectlFwY=;
        b=YWhef4CgFMbMkeiRKbkrOQqNicNgWmNXpprCNK4PmZlS1To3dQiUywJnb0iWdTq9Ue
         pfNqQqz2DLlKpBqWn34iggASauLmP0U7b8Jf7Iwki7pfYgDSWXz/ywCrh48AzZU/EJPT
         IM+CNqjofKU5bc4h+lX2Y7Cisaq02ketXRweu6eJFo5Qj05QZlantkYyv4ooiU9AevN4
         /7xPQY8WDUuP/pV6cdkOeVTzDCblXUGGSqplK4GfW22LGIwVvf9kgJoyobWmGC23x2qF
         7tUQwUw2y10hTbrhIJa65HZbg4Je0CN0Pmz4er+2dAJ8TjtoC3KVc3GIBQteWC+nkgVI
         e4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377310; x=1788982110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRD0l8Ri/Xtt5YOzEf8unqF1fg/jROr3HiauectlFwY=;
        b=IoKV4bqpqf51+bK2jxG62KeuDbjBreW5XCZjhsUKZFTgVXZgBfjlZfs7fDHxaAgi4M
         /3Lw1rEHGFU3eWD7izIE1DtYDL4+8mNKkS38Hb1aCoGo8OwAO3jG0vMhK8G01B0Mr/4r
         uJb3+4tVPu/ABCeCJeAUdTz/RUbKse1ZgNDBQoLhBMQWsSpMtakEenTvhhQr1mD5t5t8
         rFA6xFHS/sRkiYCNASqU58v1x0kBghumxNyVVPa42rfHqz7yY5foz2CTJJth6bQrG7Tt
         zcgdlJs7SNEShIlar8Awo5A/YGqnGZPQx6Cj3NBx+iaFMZFS0QePGx2W3C90yqXIEN79
         pkDA==
X-Forwarded-Encrypted: i=1; AKwUvBw7M62Q9GWzONIaqtGmZIySMMK33/v9/zUhsgADJFZ1ziN8KFYwqGimRbS6OPzji6trKE4+FJcNWAag3vk=@vger.kernel.org
X-Gm-Message-State: AFuF++nR61cPoJtVw/3PwxDlmDf+0wqMEyk/C9sjZRp3E07mjI20WjTD
	bFUtP+o7N6oHLDSA9dM8/zlTyCGc5hbKgZCLuN0dKooPGdzncBj4OJbl3iOnWN9XuOF6kjvb+mQ
	2MFhuG8k2gQ0NGvAsA16AZ//NDH+F39v3VP4vJUQpym0nKW8DGdV4f0lP23tNDQ==
X-Gm-Gg: AYBFou0z7TacVP9miMrfIUQUQgl5Mg409iiXJTg9ZedmCHMk5vexPWftqfbE3Int2PT
	lsBgK++q5PRWU6BFSWCd+FmcIdv/QsL7u+d2iwBqS1ac2kFHIxoyqUz+2loVap7FJ+cYIw+0ESZ
	KCQBk0tElZUhtJGi6Flvj0iFUFGqwryf5cp9AXf+0Bap3MYW9SiiZuEqulENQkVzJzpwufZU3Xu
	pVxni3sTKV6deaYiUAHi5ccrFk3l2lkAv7On6RWuemEWPHuTFzN4PM0iMbQ7ClpOXhoQAk6Jaf2
	ZJVb5BJ+okaGtcOX8A9zI9gp8tEKgBNLmy89YHP0pZbhCV/jWGBJZ1+/gqmg34/8yyx67Ajs/fD
	rzYTbMPgYWFuNzBbaQDYTbTIsdDxPkJrmQZ0dflr0TPk5nxsCocE4NQ==
X-Received: by 2002:a05:622a:a08:b0:52d:8679:ba91 with SMTP id d75a77b69052e-53036b915a4mr87035261cf.8.1788377309990;
        Wed, 02 Sep 2026 12:28:29 -0700 (PDT)
X-Received: by 2002:a05:622a:a08:b0:52d:8679:ba91 with SMTP id d75a77b69052e-53036b915a4mr87034531cf.8.1788377309441;
        Wed, 02 Sep 2026 12:28:29 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec85a0sm25420936d6.29.2026.09.02.12.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:29 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 15:27:55 -0400
Subject: [PATCH 09/11] mm: memcontrol: constify the swap accounting helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-folio_memcg-const-v1-9-e2c1da22246d@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788377294; l=2888;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=TSz32dlKErH2sHKGkXoZorQQsSCc5csvXiTKsSs8af8=;
 b=Ofsue+qcEl7OkCtIeQUm5s0CmrvlITgSUOJlrBEvUC9pTU1FWzglzUQkk9b6peUbGaadFs/oC
 dhZIsw1VOyXD4Lhobqfa8HoXX2OiRc6aLAq9gXxycrY3BVJApmYidjS
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: gNM4KgHyGW_UzSz3splMdg4YKvUJ4b8A
X-Authority-Analysis: v=2.4 cv=PqejqQM3 c=1 sm=1 tr=0 ts=6a9878de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=vlTQYXqq4tgfiFTJlkUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX6plqV3w3U0HW
 Gl1TdVTtrzUEwGaGwJSG7ZBD1BiDa6fSiS/k8jJ97t6Ls2JUpVyLlNxFLUHHGBeph+W71MhUAVG
 cTVuhKGMHf/FMy0w9ztlxPBOIBNuFoBzfnl5j6hGoZvQB5E0kKIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX60LVSNSI+J7T
 mQBfSpZV6cLsuGXhP9JpXSKdVqU66r6EvDRQ/CACmJW9DmNJHkiLmVgsVvgg2oEYotb90B5kY0h
 nap+ncmNdbwkIFDAq1k/xcW/QvXX+z3Hng6f5dJCqYReQQ0qoSwkyiPS05ZjE5Qvnml2QSpakoC
 985WifIR1dyO+R/RRxP1/je7COghx300PXnftvf6K+36RlOoURu36ROyN1w2vWMrOY/GLfuL+Bx
 MzhVgTugnLak28bDM1cr8WCObTmCZThkxxKRXy3z2Tanwlb/QGRBIPBsp2eh+Gn0na8c0n+QBBH
 EvOQHu90G66rBb63KN5arppo8QpgX6V1N2kscTdOmg90lUdarnlPx1gD/u2Bl0GW4gqbDQlJe1H
 6t1M2BSws2Q8r9KQkVK9ecoicKV66NJzezpExNuJ4A95OIWIbXE5aRHlsspNu9ECNQPN8FNkqhG
 dkpqMhIbV8Uv6BcRLzQ==
X-Proofpoint-ORIG-GUID: gNM4KgHyGW_UzSz3splMdg4YKvUJ4b8A
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=10 priorityscore=1501 malwarescore=0
 lowpriorityscore=10 bulkscore=10 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020172

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
index a72ecf12c00d..a64b5d37bf36 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -510,9 +510,9 @@ static inline void mem_cgroup_uncharge_swap(unsigned short id, unsigned int nr_p
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
@@ -524,17 +524,17 @@ static inline void mem_cgroup_uncharge_swap(unsigned short id,
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
index 3d3eadddc130..2b8705a88f6a 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5839,7 +5839,7 @@ void __mem_cgroup_uncharge_swap(unsigned short id, unsigned int nr_pages)
 	rcu_read_unlock();
 }
 
-long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
+long mem_cgroup_get_nr_swap_pages(const struct mem_cgroup *memcg)
 {
 	long nr_swap_pages = get_nr_swap_pages();
 
@@ -5855,7 +5855,7 @@ long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
  *
  * Return: Remaining chargeable pages in the folio's memcg hierarchy.
  */
-long mem_cgroup_get_folio_swap_margin(struct folio *folio)
+long mem_cgroup_get_folio_swap_margin(const struct folio *folio)
 {
 	struct mem_cgroup *memcg;
 	long margin;
@@ -5872,7 +5872,7 @@ long mem_cgroup_get_folio_swap_margin(struct folio *folio)
 	return margin;
 }
 
-bool mem_cgroup_swap_full(struct folio *folio)
+bool mem_cgroup_swap_full(const struct folio *folio)
 {
 	struct mem_cgroup *memcg;
 	bool ret = false;

-- 
2.39.5

