Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFFA58F087
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883077; cv=none; b=fI6d1fWiZ29DReooiEZ2SlU49WdPdwpj0l0obAu7+ztCu6qtW3B15Su+fKwMEs53sPkG6SxysjdBq4kQNEf2vFCsSsNONnkLOfGm1ibPbHLM3tsxhrpHkqWh9jfj4viAqrviRF1KD4bV3+4PZL4PIZKfTABd11k0S1oX7RYxIyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883077; c=relaxed/simple;
	bh=ilFeF7WzmkT3DE3smE1F3wtCBJfDaUSUcaDgXIyabqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXe4ck+hbjVOpgSJmK9S54vehuw58ab3TDzW/WeUrmCLKyH1rJqYsg401FyWuznnQdtClHsr5ZbqoPK2vj2NIJWgAKDAAULeoQfncPhKhOnnooVVCF7/hn4IDv1Cl1zPMEftmS/Mvm1apBgYmQ1Rv3AUWRoEoetM+QSYoNs8tWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=HWoN4fX9; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=M9428slS; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="HWoN4fX9";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="M9428slS"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FbhjS426486
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Q9N4
	IW0Q0HkN9KT6h8CVRGegPfku8TwgZZjZ8yH7Mw8=; b=HWoN4fX9O6PM4r7xxWZK
	B1LWKD4v1Hu5nou4SvaRMrpd6IZO7jqvWe2U+PVvmOrjbwS8ABb7hSkfsI7BhS0Y
	TuDA8AuxsSOfwWwQnYZCfipiIlEWKUEgpdMZzlWt+afPmD1nrMhVXJeqLiLrnNvL
	AbjOkKB9GLdmzqkpDBdNxUStkiMDje8SrS2i+2tLY9hnBi+7/qoAZIXUrHZMm1dV
	QUg3dxoRkTDKlgR1CHPtvh6jmHrZpXiQwXQzyvsnFi287sQAxd07X+9JSMSidai4
	8EcJTN56/hm9KzhA2xpbr/Aq7l5qlYd/Lre+ncP9+Gof0Ky0r2792JnjgxsBG37K
	TA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjmv7gf0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:57:53 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ff59f2c47so111360601cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788883072; x=1789487872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9N4IW0Q0HkN9KT6h8CVRGegPfku8TwgZZjZ8yH7Mw8=;
        b=M9428slSRHu2Es7IXWTw3BCT/3KAsKlC5clk2+1zXHoECP2LldwzLjHu3Pbavj/R59
         xeQyZFATgqbumrHcZP+eBy4RQRCmovHz8fpqh38tR0LPR5NkhmhgEb2p3QUVLmCZpQoI
         TLLyk1m1nztmwgf0Bq1G+gyFmZQHAzXARP0QGzoZQzC+ofvyZtTenDVg+ncowIP4t6An
         dMABkTWQ8h5DOsL04rrmUC0aEWDgNNMye8ayJ7dnJVI7DcxWRmKgB0z5NrzRq0Y6fUcg
         jm501wFFuCPrf4kMyWQGGjfzJZhD1kOnkZupgq7G0S/QSuxHZn1vh5XIWIeWjs9tFFSZ
         MVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883072; x=1789487872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9N4IW0Q0HkN9KT6h8CVRGegPfku8TwgZZjZ8yH7Mw8=;
        b=cmlfsk3/nDQpC5Y9mFcXlvoRRhpS74WTYmZ5QgMPnZSnYuXA6orzo3RWztMtGLuHm3
         9WSJy2VdoW8Y3IlS5SmP+832DMex0UlxoAaTuwz8l7Njn5+gvD9Pjokr7SKWFRV9twl7
         tnUtNNXYjxLch4f7AxMynk5BiRm2kUi4MU8nnNQcGGOD9ZsLDZ7VD7TnAbdQyk50iNAP
         rViy8G0rKMCCFgxo00s4YBW5zNJPGpr4bTfs5RCtso41Eyc+DiP6EhqO/awjc4GftKm0
         0y+tFYBi8q/oySk6Jyqo/dwkVcLdKkuysz2Ak1n3hXKE4Hw3p7Fkgnqe0AC4cZUayt5e
         zSkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjPh6qZyHXUhbc/oR1z84Sk9jWibBWyvIlxcK41cnhJUPDPbb2CJHjaQLruk8tpgD8rMvq2a5sJQM0eCE=@vger.kernel.org
X-Gm-Message-State: AFuF++lqhl4jOCao6gTS7Z6oKZ3qAWuyYA4jJS0oOLIfs8veqf6TOR0w
	IO8EUlDKVJG0i0vvVp+xOHWXhnKmhWyGLIZWeeCHoiojAYq1Ms9w1jXcIg4Za7b6Qh0VdUebKHM
	GWrmzhv4CxCxdlH2BhVlEg07PIbkJDV6Avxg2Y+ZZ+f92tUrYt4SYUSnL1MWfgg==
X-Gm-Gg: AYBFou1dAtS3QnPun/ZP7rxhCiPBLAamGEQ54GPCR6mfRb5ctNQOHO4fa4qZqdXiQvU
	VSaI/et/oBo0kpMK4ZOYYeZQr2qbdO4tNYX8YVPTNdPRJ0GvADNJ/jnYMGc/4Ypleo6c0Pf9ph4
	mp5yUcedxOCM8rw3D3aJfnW8MW49kmxU3IUW7bO4jJdefPX4G1cJmrgecn9XCnRs7sNFUhHLSsr
	0aI5WQCFludZUpw2AgSG/fMC3ifrrkiWhPhw9kMGK0dBSGNOBuAesKq80c4TposUTrn0h4nce8t
	24/64ldAcKXzy2/bGABSR1dAa9UJHAwPXjPsm0EEzz0lpcKvqQpk66d6JWjwy2J2bU3ItwsrbP+
	r8I2uEu5y+VsAlPdj0LtQWSpDgGbqce4bZcqIX/Iv8BbyH3dQ
X-Received: by 2002:a05:622a:1aa9:b0:52f:b372:2ef9 with SMTP id d75a77b69052e-530913411b4mr76747481cf.20.1788883072381;
        Tue, 08 Sep 2026 08:57:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa9:b0:52f:b372:2ef9 with SMTP id d75a77b69052e-530913411b4mr76747031cf.20.1788883071826;
        Tue, 08 Sep 2026 08:57:51 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53093295584sm27830461cf.13.2026.09.08.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:51 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:57:42 -0400
Subject: [PATCH v2 06/11] mm: page_counter: constify page_counter_read()
 and page_counter_margin()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_memcg-const-v2-6-811e9f443409@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788883062; l=1723;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=ilFeF7WzmkT3DE3smE1F3wtCBJfDaUSUcaDgXIyabqI=;
 b=qs/aOiqsuEwnuRCgRoj5FQu98XRLg2KKKEUPKSnBKV8A8y1YbwgcE1thOj8GxB+WCzIUk6eKx
 rHBTQ7yU7hMAMKRu4yHXq5htNrT3t0tXfWjfpvFQvUXQOrRY8cOdrEt
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX6fqmEsvOL6Wm
 yipZGz2kmV7Ao9us/x2gkFWrYBVsXhoVTeVF0yLlX8cpv2GJj139aCU2qPexMOdfL4QBxsw/4/T
 5O9y6telEFTOaFoQmxjKjf2Uxu4DxFEka2O7fV/qFjr9WPgFm7T5Wzoi/s+ADiPJwzLxAHAeOkp
 BqINYgfq0NTVKGneYkU4FJsYFw385y/PkARLgAbD7Z34rFISy6BNiFUwV5XSwRwjVU/K+9PG7Gp
 3kwRuoow1RpWb8G3BnKdVIX4sl+VwbA6bKyOyeBaZrBoeGD79n2Rtm6Wc2zSQElsF9sf89+72DN
 Ej3Fp3DrsFq+AQ3D2kt9CsTese2lxp3FgOL7xRcduL3YrFhLOCYI0pG3cdgDaYJBf4wzi6an+qV
 gT2VaJYNiyoXA1sbnc+eKe3ZJDtU7z0/XmOwcfP8AaoAJFbgoppbFjpC0x3LIUoUASSe7jtGWQw
 lzD2w9hhT4bfoD5To7g==
X-Proofpoint-ORIG-GUID: UgczFMwJhdkKXbjwHHGC1ksUx-FOcdX4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX1IiFTPmIGpdR
 Eo9NbBGZsCIxe6THiAgjoMiha8u4tMYnvJpCexL9Y72SpiXqKD1jz1gy99KfdtdMnAVaXC+c0gq
 Ye7Y6SCRRM9/IVh+xyv9M/1UQmqMZ7D9htupjT7a91PAJ7SWqlTj
X-Authority-Analysis: v=2.4 cv=fpnsol4f c=1 sm=1 tr=0 ts=6aa03081 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=qClW_BUTj_2nsftnHKoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: UgczFMwJhdkKXbjwHHGC1ksUx-FOcdX4
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=10 impostorscore=10 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080172

Both only read the counter. Constify them so that users can read
counters from const memcgs.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/page_counter.h | 4 ++--
 mm/page_counter.c            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index 07b7cb12249c..2baf7a2b29b2 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -63,12 +63,12 @@ static inline void page_counter_init(struct page_counter *counter,
 	counter->track_failcnt = false;
 }
 
-static inline unsigned long page_counter_read(struct page_counter *counter)
+static inline unsigned long page_counter_read(const struct page_counter *counter)
 {
 	return atomic_long_read(&counter->usage);
 }
 
-long page_counter_margin(struct page_counter *counter);
+long page_counter_margin(const struct page_counter *counter);
 void page_counter_cancel(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_charge(struct page_counter *counter, unsigned long nr_pages);
 bool page_counter_try_charge(struct page_counter *counter,
diff --git a/mm/page_counter.c b/mm/page_counter.c
index 450543f4b318..8c6f3b45136b 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -53,7 +53,7 @@ static void propagate_protected_usage(struct page_counter *c,
  * Return: The minimum value of max minus usage across @counter and all of
  * its ancestors. The value may be negative during a concurrent charge.
  */
-long page_counter_margin(struct page_counter *counter)
+long page_counter_margin(const struct page_counter *counter)
 {
 	long margin = PAGE_COUNTER_MAX;
 

-- 
2.39.5

