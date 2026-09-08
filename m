Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B864958FD00
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883079; cv=none; b=p4P7BSJIiyUn26MT1pOhNo76Q56UWkVk0qNrSAhzeG9582sFX7h0b/NsJF5/wriE4JmGf5AjBF23aABoW4mHfIRmbbZMTbWyYZGmeo2UMQNl8GjY9D+/5f3jF1IC6666Gn3kljxXH/z1ulUN+Nrs+zaer9WR7ZeIR7u+hDRurPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883079; c=relaxed/simple;
	bh=puRmIXD1Ve7ElQt9KP4DSIyIaDfy+iHVy11lX8uUHlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvG5I2ASJqZy/RHUDm2jNy0EPV9S1BdV3OTylGJv/m/54508Pc/sJL6Vb5356V4Q7hGTpo+9QTkJ7sEw6dxu4onsjjqC2m6iatbLclOuQnpKK9HadG42N91i2xeDZfEqjK/9bEVXpYX8XdzbVNsHLN83/M4/Ty6NFWMTwN+8lug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=X6wJmGAB; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ZDY7fSWt; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="X6wJmGAB";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ZDY7fSWt"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fbcw41154439
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=W+SY
	Tc9YgTwbyvQtPG0l4mF2QbsfRfThQCH4AEEmni8=; b=X6wJmGABACvVcn/8A580
	VUgc4bV7zmwzLAWYWl7bPh0WrxFjtYEvbCCmiqoIBKQSAJqduelA4iHiY1zEnHo1
	QenyZxHNHaouUWRkC5nG5Ffsgq29G+oQiO/hcD1QsI7lTkEFGAv8foaMB2LGtlIf
	oQivZkspUeNV+lgfyiXLzmqwqvTpLMIJMTQHPuo6mJg3NJ0N1Z4T5I1LCNZfVGS4
	4xK9m0dQiLswilzwD3wzVhh/phO6hpwfJxgH9wwV6NNVsx92v3xhhzDshASIksDG
	/Na67ZvNnhcTdoHutnkY1J6/BQPjqLYLJ1u3LuL9VL7zm8DZh3pLenrQJlafdrwx
	lA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj50j5h35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:57:55 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso115409761cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788883075; x=1789487875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+SYTc9YgTwbyvQtPG0l4mF2QbsfRfThQCH4AEEmni8=;
        b=ZDY7fSWtnIgHEE/plhBv9vtP/RHqMddzbqSn3HpiInvKCuGSKxMkPqoR3Oip6aeKuO
         cWCbvdDvIbe0t78K7hweq3zOVqt/gw8IYDzhJ9a76LxfHydTG5Y/guBnAmSoSwFGpEPG
         zjXE60pAovsaUv705zlxnYnTQ0iT83dAPMJNHwVL7AMY1zD6B6ttustGzC+oVqoi69SE
         lJYTcaWkmMOZVSbPywaiZTE99kqVIHJmJUju6DpzjGvV8PEaQCZyWrKUCuGI9xCZ5hZE
         JiUW/DzO8BQ64VdLE5cpW1cyOmM8VIrx78Tw1bbzRQ6aU8jXvuANvgN8GhtR0XmrAwKm
         B2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883075; x=1789487875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+SYTc9YgTwbyvQtPG0l4mF2QbsfRfThQCH4AEEmni8=;
        b=dhvP5i0kF3pRJakFUvqbWSpCbn0PR0v8Op29S/5PTWsaj96MhOgSU3k2r2hlF2ovQo
         v6wsz/VYMGt9KHJIojK7SlQNqOaKi3O1dk+56nRrnUT59sGrikuoaLNcdf1NCSW6ScTv
         8u6Hz71YQSy2wYfTrrS8v8nUS0Femqj13ZUUPttXULbXqQ1LkRm2aUCYCHDGclvDPuml
         Td6Fy0oCEX0WBvjfgqzhY1niKpO4qbKmewQKD/4Oj/qJ+wICMq3EZuJzK+CzFGFDoAiM
         An2TqM3UL6Ixz6+hMX0UpEk9JRbQztcJ2Gwundq5TOpq0oZ6rEQxrSJk+C2qUadgWoki
         r1+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWTl8nvu3zGjDb0PbCWb0SLwUelqOudRmRIbwMYplfp9PUiU/I1bgxMaWb7ZRH8afVEBn38bVuc4cdYNs=@vger.kernel.org
X-Gm-Message-State: AFuF++ltE4HLz5ke94vv1nwm0AB77LxZZQPrEurzzl8cbp8rZK2rVIH8
	7nAH1Ku22f6LjuTObWqxLHwUTGmI7cFmdQvpVWSYXbrcUnVP3nwqpxY7IyzbeM6sceL0fQ+Sm2z
	wAgbfHRTguS7ukHlp9jlDG+zEUCXo8E7pvxtD70MJim9VhTTerL4BpsWIXDks8w==
X-Gm-Gg: AYBFou3R0pwD/K0jymylKvCmpXUXDr+igEM5JZ2sZwPeFkxkNCkxUPArhMpPOmzrNIo
	Dq6t+/HWPTnYz1KSIJcuREKUMmMlnLuE3EbdMQS2HAn/j03BykilXhJdh1+sySyLMnrS/q25g9/
	Uq42EP8xMsQX3o/N5yH3Jzk0RGl3InkAo4LajXx0m3trN1HE8rW3ywDNIn/tVbv45KH1vjfAcks
	+lgsQGYZtm26AkpebZBn5Qqs6R0NFhRaRWnvaMHIg0r0R1xOscRbYihtQlQ/n8ri7QzLsIa/HUj
	Ci0dHVxUzazBZ3LhfnqN6xnqIGt/gnv/+KwG7YnLKYdDXqL8C7WNj8cFSOw4/9r6ETb3lJMcoeO
	NvUsPOoYlRm5lDyMXy6jKSWwEcePO9Ia4DUjYuX/O2cKcDWC8
X-Received: by 2002:a05:622a:c7:b0:530:4327:6c8c with SMTP id d75a77b69052e-53054a35c32mr336959991cf.49.1788883074575;
        Tue, 08 Sep 2026 08:57:54 -0700 (PDT)
X-Received: by 2002:a05:622a:c7:b0:530:4327:6c8c with SMTP id d75a77b69052e-53054a35c32mr336954491cf.49.1788883069421;
        Tue, 08 Sep 2026 08:57:49 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53093295584sm27830461cf.13.2026.09.08.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:48 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:57:40 -0400
Subject: [PATCH v2 04/11] mm/page_io: take a const folio in
 bio_associate_blkg_from_folio()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_memcg-const-v2-4-811e9f443409@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788883062; l=1933;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=puRmIXD1Ve7ElQt9KP4DSIyIaDfy+iHVy11lX8uUHlg=;
 b=8/SxO4FLsM5OCzLi0nlD3CTL6XF04Y6/eTXATxHGLojvR37DUuTf/wd83bHyMJ3AJGQZnLJV/
 uEAVipH37guCcOZoITV71ESfMo/6Y7Sc8NLmzp0LsxSiktRTH57GuJ4
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfX9SVPFixLQcFQ
 iZnemoAaYr0/JHBStYZ4XNEUqVy5er+Nd+XSIDLgtuxt4DFf6lR9akMU5Y3G33MW3W2MAqW1nMj
 56VpDpoNnPf71/SFOMXvmvUKiiucR03OX5IclP45e9ly0HJ0LR48p+T+hkhGfviisHRY+eAmczj
 PHS+EF6IduQXAOvnzKKfwMQ3I3Pn2wMfNp4Yzn0GIDbrSwUCtVV0FklFLAtk2o7JPyE7uKLhTL/
 5k4Y7G1MvvEMxk4i23N0UiVrm4iMJM12RxQ9XptMwmcbvoreuAC/5jiwo3ZidKFhg1paA/lNgYt
 Lp6r1blVf0hAp7LOF2OKGu7djhfwzKhYo1kZegoMvkrsDrXyjT2Syp1qelegk6hEn+ppg0+dHfl
 j3S1EbuyDk88fnsMShVQ9ZZqW64J0s2D454oKwd+et4BMuwbrwG4Kw1JWIsjReMR0oc3/iRn1hL
 ibjuJLGkm2sjc5ytGpw==
X-Proofpoint-ORIG-GUID: IHXQuf0JIngd4x-zQfMUZLK3dc6fPksh
X-Proofpoint-GUID: IHXQuf0JIngd4x-zQfMUZLK3dc6fPksh
X-Authority-Analysis: v=2.4 cv=O7gJeh9W c=1 sm=1 tr=0 ts=6aa03083 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=4JVmFDg4bpWGYAirTr4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MiBTYWx0ZWRfXypAnvofPYtDz
 NdAKf1XtKxgk9UJFSjOVMQDTAjI5LduKg0xZTLa7h8160gh7SbjuaHq8bADK532FdOFc8/VczrW
 J+ZVGok2SHu3bK9tqU33ZUHNNDfRhtaw1k6d6leWeuv/ItQ1UgRT
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=10
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080172

bio_associate_blkg_from_folio() and its helpers only read from the
folio. Constify their folio arguments.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/page_io.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 1da4ff484f09..5f7756e370f7 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -256,12 +256,13 @@ int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 }
 
 #if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
-static struct cgroup_subsys_state *folio_memcg_blkg_css(struct folio *folio)
+static struct cgroup_subsys_state *folio_memcg_blkg_css(const struct folio *folio)
 {
 	return cgroup_e_css(folio_memcg(folio)->css.cgroup, &io_cgrp_subsys);
 }
 
-static bool folio_blkg_can_merge(struct folio *folio, struct folio *prev_folio)
+static bool folio_blkg_can_merge(const struct folio *folio,
+				 const struct folio *prev_folio)
 {
 	bool can_merge = true;
 
@@ -277,7 +278,8 @@ static bool folio_blkg_can_merge(struct folio *folio, struct folio *prev_folio)
 	return can_merge;
 }
 
-static void bio_associate_blkg_from_folio(struct bio *bio, struct folio *folio)
+static void bio_associate_blkg_from_folio(struct bio *bio,
+					  const struct folio *folio)
 {
 	struct cgroup_subsys_state *css;
 
@@ -294,11 +296,13 @@ static void bio_associate_blkg_from_folio(struct bio *bio, struct folio *folio)
 		css_put(css);
 }
 #else
-static bool folio_blkg_can_merge(struct folio *folio, struct folio *prev_folio)
+static bool folio_blkg_can_merge(const struct folio *folio,
+				 const struct folio *prev_folio)
 {
 	return true;
 }
-static void bio_associate_blkg_from_folio(struct bio *bio, struct folio *folio)
+static void bio_associate_blkg_from_folio(struct bio *bio,
+					  const struct folio *folio)
 {
 }
 #endif /* CONFIG_MEMCG && CONFIG_BLK_CGROUP */

-- 
2.39.5

