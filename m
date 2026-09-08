Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F02C58E2C2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883068; cv=none; b=V1ks6pfa/sevFScMNlEqY4UfjTn5x23vqZ/XsQGaSAiiWe3g7GQu+yo/VrLTOpSdCxmhMugM2wsXyus8ayZdLC8B506HUzfyAEuhzK5jrMbCRPY9ckiJRWkOtaf7trR1ci+7a6b7LTevDGcY7PxqKMzxV2Nz13JVImSbJILrV8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883068; c=relaxed/simple;
	bh=hj+Nv0WF1d95Gjv7TrdlCtnL4rlx46A03j7UOfRM5nU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IRR8xsEjW9rEMYXk4i6d9t/RVyqc6YR/wodGEXsOyerDt8D1hYfmk+p/fGr5ppYW4jltxuoqgvqkPRLwiQP9uhnivXBSdSZmjSe8/NJ6LP/SYqXuAAZHs29YlPZYA0mfOr/otI7Jqz38dwG+neDyThf+BhA+nEKonSIZ+Jhh6NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nbNFtHL9; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=HwcXoEba; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nbNFtHL9";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="HwcXoEba"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdsJw2593987
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=NifX4Rb1WDw0wxtWlVThAQsW+j
	ygu9Vf8Cny+Iwc1Mw=; b=nbNFtHL9MXnWtK26BxA1gyl68MUKnXXXxoueCQqUDN
	PlAAxqnECyGfrI5luVVHgkn5aO+soguWzHRqqKc5XoFDmbdhwuvLilMM99IFcYTj
	+JMRcn73qCpmaZ/fWTKKkSatKo8L/US1KBq7wxr/gMhukyyBM3tqhRZRDJqV+PTz
	BNPwJMOiHkFnv0ilHeV2vGi+c+rMDYMQ+GRq2EIfM5V8QkTFK6agkdniSQrtaMGv
	5nwebsxdCctFhRbY1bic7XQ+mrRjg0RVx1tPhg9fdt7WBnf0r7ukd4MtVXQdEI89
	jlgmXgdAt1/o0W4fgk24CIkvLrkWTwRHE5bwZ+V0zgYw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4d5dm6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:57:46 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283df62d68so80868941cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788883065; x=1789487865; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NifX4Rb1WDw0wxtWlVThAQsW+jygu9Vf8Cny+Iwc1Mw=;
        b=HwcXoEbaTAwmRH2QxWJltWnPsYtWr4hQDxDV3oliZTmaezj4cLpGGb2fAdKp/EAxIz
         OKgRDw1WL42dB8A+3BCWeSAYsJ+6IqBmMAvEZFh7IDN+KmAg//lOWcJX0+v6dZWn15OR
         Zbs4/gu/5bWblvlSt2xZ2xOA3KpFqxalq5z0LhYRrLMQFPXyVpUHkpp3cBe5/e09M/TF
         TBIariIH0BuKoOWYukmVvYRe8vaj7evSq8Zkd9wm6s3bc2Q6DyRHlXRAUBqtQQKhSszm
         kX813aWVserf/IBkXUoCdFiJlU/Ib+cKyI7VyPk3KrVw69NCUVaumlCiV6I0em7stSNc
         mpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883065; x=1789487865;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NifX4Rb1WDw0wxtWlVThAQsW+jygu9Vf8Cny+Iwc1Mw=;
        b=dAcTSfUC5uXSP5lWhpoJRlrdBxOYL42K2K90iNWc7tnXX8fpu0OWvvm2hUiSdtAp7G
         CS8cYgKnm1CpgQSBFUoDY3soWdz7D6BoRK2xjbnKrK0f+FrB7mxbWqPkJVGk8+iCkDm+
         unaqTEJCdY1pVDVg69hEPJ5Ogz0wLxTtlAyR8n26Y78yY9S6CXxPEK0MbqF2ynWSnQyK
         DPlkZSUe+ZaUYNRqLOPxQVAgjfwSqeNJf+f/PU1HgdLFM2eulsaKLTzGlh9zN3FVOKtV
         3RTOL0Phiv2F6AiTwjF/JkANOnmWho0cv1ZxQ1VIXfGswagkzaAOcz6dyJIrSf2YNg9A
         LD1Q==
X-Forwarded-Encrypted: i=1; AKwUvBylXJgqGYwT3y4CJrzkU84++2O1Iastoo/Vp9z497vTWtvzDF+eK/tcBzjZtXbw7D2Y4sLlvOoppGWW2WE=@vger.kernel.org
X-Gm-Message-State: AFuF++kp5/8sxVwvS7qJbPZlyjUbb3QmxT+OIDwwmvOceU6cRdJ4KUgx
	+8FL1ZZlxRD+zvcTea2f7E54HrbB9Aq9/0O6ddbH6cQ3HX8c1nFtTG3KfVAELHvUtKiux07LJMF
	Zzlrd8yvy27h98PmvoDVT5At02Gj0nAKH7tugm6KOw4noBkxpb6VBvJ8WtguRaw==
X-Gm-Gg: AYBFou1RxYGrnon+IrjulQ26coN+0xhJ3idW5DIGPdyXboouygfFF68tSg6siyx2WGy
	i83yP/zQqatRS36HMbqf0aH6W1JLOJhjWgB/1zpFvsnM5hOuoK/pUaZ5MVrdt7UcUSqWNoIJpN+
	Tm15A8z+zpR4Oow2BYtXMKpzYD7kboaT49wPH6H5L5RP1dM3gWwZezIWvwQNL1nJUF3xErmzqRK
	540vreJV2FIoLemm/SH8b8VyXZHm3E5BF3kXvSnD/1kinyiFtIT7h4AdFg6R6fXhR4PcXJAf+wZ
	d/FYruUF4taLcJv0+TKGEW9xH1Yf3mTbA2NeZB1bn/B2iYEBKHLUB7B7i9/Vmj7upc5TRwKKdCN
	JeAEMot17vl0RtntB/I5v78AYJtggklLH4AwPwON2+bSPF2qL
X-Received: by 2002:a05:622a:134d:b0:52f:f072:a1d1 with SMTP id d75a77b69052e-53054819272mr349899211cf.11.1788883065106;
        Tue, 08 Sep 2026 08:57:45 -0700 (PDT)
X-Received: by 2002:a05:622a:134d:b0:52f:f072:a1d1 with SMTP id d75a77b69052e-53054819272mr349898481cf.11.1788883064429;
        Tue, 08 Sep 2026 08:57:44 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53093295584sm27830461cf.13.2026.09.08.08.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:43 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 00/11] mm: memcontrol: constify the read side of the
 memcg API
Date: Tue, 08 Sep 2026 11:57:36 -0400
Message-Id: <20260908-folio_memcg-const-v2-0-811e9f443409@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAwoGoC/22Nyw6CMBBFf4XM2poyqYCu/A9DTGkHGAOtaYFoC
 P8uj63Lk5x77gyRAlOEWzJDoIkje7cCnhIwrXYNCbYrA0rMZCFzUfuO/bOn3jTCeBcHoXSWk5J
 WFZcK1t07UM2fvfkoD45j9SIzbKHNaDkOPnz30yndvKN/lfinP6VCCkKTWo2IKrN347uxr1ify
 Y5QLsvyAyiWWWDHAAAA
X-Change-ID: 20260807-folio_memcg-const-4a67e40d485b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788883062; l=2237;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hj+Nv0WF1d95Gjv7TrdlCtnL4rlx46A03j7UOfRM5nU=;
 b=Eq+dpJKvk9whXLlAXSzv+mq7m+3iea9TQG0LeUDcbezPns09wXcAvBEa2NVPavbZ7BAUmO63Z
 PSK81m8Ob4hBtmnLts5McXIWX4J153hefwW3tg14Hbs4ZiWO0dXw4fN
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX28ttucfC/6sR
 /LCWKw3sK60yeFBsQK6EdmFtjU50LWYu1gWfdrmVTWwyAQu/0y7sQqHdtI/RFoN0F09lUpwTYZq
 6Lq9K932bv0LZpibNxhYgdrGrVf7AFXWK16SW82rLLZd9LABMFm6zfwZKKQo4T7Wuio/n9hn9qM
 iXhWp0FbE6XAA7EAv02DukgFtqVxAtCgCfu0cACt9/5x1R2YIZ+riUm7clDXfPPmW6M/oQ7DcIh
 Gkv3H0/shXPwemPGh9n7kgCrZzenG0wbFRIp3Z1LwN8uF8I15qIp6BbQpTbi+3yFE7lcp4FJRTJ
 gzklBHtesrQoQJMXGUMfecMffI4elcFmd6NtsCx/92hzsqla8C8w6Yr3sN969QgiHs0vKbDjxnU
 HBH89Wgvu6EbTDBsY+S6d/dwJWVYArB5cNg6D5aAropR8y4AWjMpHrzPNgkxttlFgjTnOu6qa+/
 CLXtdv3nNc/lRqGGBLA==
X-Proofpoint-ORIG-GUID: nlDNryAHazIv-y5TK7vZx-EtuhjbJzxz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfXxdli3lH7iOOO
 jBPtWbfPYI2ga8hma+sGENYrY7MBqJJQo+1eYEFbWmb2wKh5AfJWwWmkO3nEg+M1qSP1laBEnJ4
 1+1o1lzIVhtDdaIK3jfus5NoFl2xY0xv+CNiGfJB7ys/5oMPBmPh
X-Proofpoint-GUID: nlDNryAHazIv-y5TK7vZx-EtuhjbJzxz
X-Authority-Analysis: v=2.4 cv=BqCtB4X5 c=1 sm=1 tr=0 ts=6aa0307a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=bC-a23v3AAAA:8 a=b6ln72opZJ-VCPk_GP8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 impostorscore=10
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080172

The memcg accessors, lruvec helpers, and stat readers only read from
the memcg, folio, or lruvec they are given, but take non-const
pointers. Constify them, along with a couple other helper functions in
mm/page_counter.c along the way.

This started as a follow-up to [1] that quickly grew in proportions :)

[1]: https://lore.kernel.org/linux-mm/anYqSDnC2BbJXv1h@casper.infradead.org/

---
Changes in v2:
- Patch 3: Constify the folio argument of folio_lruvec_relock_irq() and
  folio_lruvec_relock_irqsave() as well, per Sashiko
- Patch 3: Note that mem_cgroup_lruvec() updates lruvec->pgdat in the
  per-node structure, not the memcg, per Sashiko
- Patches 3 and 8: Use container_of_const() in lruvec_memcg() and the
  lruvec_page_state() family, per Sashiko
- Link to v1: https://patch.msgid.link/20260902-folio_memcg-const-v1-0-e2c1da22246d@columbia.edu

---
Tal Zussman (11):
      mm: memcontrol: take a const folio in folio_memcg() and friends
      mm: memcontrol: constify obj_cgroup_memcg() and friends
      mm: memcontrol: constify the lruvec helpers
      mm/page_io: take a const folio in bio_associate_blkg_from_folio()
      mm: memcontrol: constify the mem_cgroup accessors
      mm: page_counter: constify page_counter_read() and page_counter_margin()
      mm: memcontrol: constify the reclaim protection helpers
      mm: memcontrol: constify the memcg and lruvec stat readers
      mm: memcontrol: constify the swap accounting helpers
      mm: memcontrol: constify mem_cgroup_swappiness() and mem_cgroup_get_max()
      mm: memcontrol: constify the zswap and socket pressure helpers

 include/linux/memcontrol.h   | 204 ++++++++++++++++++++++---------------------
 include/linux/mmzone.h       |   2 +-
 include/linux/page_counter.h |   4 +-
 include/linux/swap.h         |  12 +--
 mm/memcontrol.c              |  49 ++++++-----
 mm/page_counter.c            |   2 +-
 mm/page_io.c                 |  14 +--
 mm/swap.h                    |   2 +-
 8 files changed, 148 insertions(+), 141 deletions(-)
---
base-commit: 9d3243fc689fef444f87e0a703b4c99653137e1b
change-id: 20260807-folio_memcg-const-4a67e40d485b

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

