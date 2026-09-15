Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6864444C51C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514441; cv=none; b=ZJzYHVzorwoEJMZ20x2jMzX73fFu3FYiEiEhFc7YUdwnau/prqbHeDEy9DeKFWbOX8WONZmpXNPo1PhjnQW4sKiaWwkYR8zYeMaIUW9P6UIPTW+L7M2Lq2N3XS/g82FrbrZJbhW8zAZylLc8NR8ZKuasjksKXaHZSa/hZ5CQzOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514441; c=relaxed/simple;
	bh=puRmIXD1Ve7ElQt9KP4DSIyIaDfy+iHVy11lX8uUHlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfT+09Jxc7+oa/ojQ9XBMpcXUhbG0uMoSscXCPb4T3RFsuX0QVd4FQ+DX2wusVDzsZo6053Lc93g9KKLcjo6iUstQjEU0bujvwlze8UAiwB/3njH3wqghC6g16DS4hN/qvh/yFYgvj7FmOs9vQ5KbqGH8/PNV9JYnlpb20A9LcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=WbCDuyao; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dgKgnxVh; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="WbCDuyao";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dgKgnxVh"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FMbv2Y4082618
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=W+SY
	Tc9YgTwbyvQtPG0l4mF2QbsfRfThQCH4AEEmni8=; b=WbCDuyaob2YbGQCiOozV
	yIe9RC4/zmMA0eLFXwM7A73YQNwsOwZmCv8DBOlacrAHw2eYuzW+Ia8uFSxjLlpx
	iXtbUFdPD03BZEqAJh2oES9GzKodFOni9hMXu+dhWUkpEahBYODAw8XpEL8hil6w
	JMErRevg7CLUpghoITPIUnJN2Fb8toEGDGAOzchUxuY73PxZK0hf24WEE+Ne991c
	cPmiQdPC40zNLagsBqSmndt7DVO6fl0oOUMqhN16VdF0E0taTzXeUc7+mBizPKY5
	WKumJ8gBkpFfNZIRzIz+cEP9mLpYCpHfbKctlMN4YSF7hUJ9rAIbpV8Vkr76HIrK
	ew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gqbwaj2fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:32 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso940004685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789514431; x=1790119231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+SYTc9YgTwbyvQtPG0l4mF2QbsfRfThQCH4AEEmni8=;
        b=dgKgnxVhuIYMG8G63SuNkfLW9L33RPE4gDyR0bph4Km3PtGx1Q4vZ3MMhZxGuqDDt6
         ml8xc9d7ILiNUbxhobG5Beu2jpMBmN1GNknAKp6fr34xbjmCsYip+yH1+lxo2ZbSePzF
         fdVlOsUMC4rXkvtHJNUwO5tFx2lw2c6f0WK2ykemhSLgXStWH2rBzEyAgJSSDESrZ+wG
         Iu6eNqrOFw2xWJfCGTrCTNQMKIdEQ2H9JHBV94ZDGAqolvPZtZVStjfaX/n/7jYMgSDL
         cX4NKJxtc0nv025myem2KyqVMFzm/60JEnqthkSsPqGUfbENAxGFRbUUTk7DhQSQahFp
         Kjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514431; x=1790119231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+SYTc9YgTwbyvQtPG0l4mF2QbsfRfThQCH4AEEmni8=;
        b=sgoP2Dicfdi6RxllYeB2IIi3BvoY4irLc3twLGG+GwpxmONDyIJ8mHiOvooXgWG+Go
         jNEVwR167+IOre4ZMcVmkWHb4sjygF6fLRexrBvTBf+tVpkDs3jhcv9MmF8xoMY4Nm4d
         xF2JUYZ9ND2vhFYOdkMeEXi8ItKxBL9TXp/rps719iPfLiZpgs6BHgG4QNPWLumiarW+
         6OC6a+wze2dE39sUD4nZPMFwccLEqVyscw06+iUfih/UnstZetaQqik5GZ5PMm14aoFq
         ydspv2aT3FINaHor+BWgJejOLDL0eF368ollC76yqNu/3Arf2CTHtjP8ljJY21WNkBsK
         /1hg==
X-Forwarded-Encrypted: i=1; AKwUvByIoqFvC4nF+QWnz4CrN22bCuCMND3geYe9cFWQTn3ORyI0vn/e7SzaL4Cg1YX1znwaFJpU41bClpa65tk=@vger.kernel.org
X-Gm-Message-State: AFuF++l6+v++1eqdOX+o7cFFzNH/z2MZ3iYMwgZguy7sQ9WMnSzfWSAu
	tzy+xr9E2iRvM3EPxG5uXKd/cUfjopzpNGZFzNnWuVVfmthpeBzkB1Hf9yUNrGRTmfqPAIZzdnh
	0FibnOsbr98ennrL/TE2zbktPW3eR9IDUuilciWSspmHLVw1e/ZHBX1sAfqu0Kw==
X-Gm-Gg: AYBFou2Yl/nBS4tLxYioIow8z3Oe0Czb6rXF9P8eDG8GQzd3iZ/id4T4mmtXWZhOeUl
	IVS7zEkd37ZLsJqtTeEGyz4ZHY44SkT/wtNbbqtZstlXzhQrzPo3oPQsvzpaV1kU086SJpwjO2c
	7FmoMzKdLQCPwGa4QQARQ+WlUNh9Kjf0kG0lCEcuu925q7FCmEGbUtrMuoui6d+9bKHRQWwQywi
	Uq4Vzm65PXTXNAQzUVPtaTJ26j+HShNJjLDx0HTQBARxCA5q438BlR1fA9V7rRKl4apW0p9Dk+j
	OQdTJKY+w2AOiLHA6OAGM2HvSBNSn6lnzXKqLMVzec8EYoyDhZOjvn01jaQ2x/otHIqiXNNWMNc
	h3LKOlwz1+9nr9bNOlv1uzKRwDSgQP8t7ZvEsOiSqDeFEIOpe
X-Received: by 2002:a05:620a:390b:b0:939:9eb4:888a with SMTP id af79cd13be357-93bb76a62dbmr56956085a.1.1789514431096;
        Tue, 15 Sep 2026 16:20:31 -0700 (PDT)
X-Received: by 2002:a05:620a:390b:b0:939:9eb4:888a with SMTP id af79cd13be357-93bb76a62dbmr56951585a.1.1789514430668;
        Tue, 15 Sep 2026 16:20:30 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-204.net.columbia.edu. [128.59.179.204])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781dfde3sm77151085a.12.2026.09.15.16.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:20:30 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 15 Sep 2026 19:20:08 -0400
Subject: [PATCH v3 04/11] mm/page_io: take a const folio in
 bio_associate_blkg_from_folio()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-folio_memcg-const-v3-4-c239a6010b58@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789514423; l=1933;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=puRmIXD1Ve7ElQt9KP4DSIyIaDfy+iHVy11lX8uUHlg=;
 b=ErI8Po+B2rZxjluBv2tCvc/GAMAH6HlqV7iBCu1F52BrrDIeskYGbPgmeP+1GO+PyjKeg9FBh
 iNkFxzPrOAJCLaYd58UfeF2w1r5vQcFDYNXXhpcTcYTxktylhrjEiR8
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: F7baKtTk3YRbRngU85rNoeGZudv9VdJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX1dVYnPhhMbvh
 NISoPT2MsGL4MXLdKmMBV3OXey++4u4GJiZ/3yvZAMcEao0RGcHmOprIrQFk8GdTPjgWgFaxpCX
 sJB5lPKG00s734nevDhm2RtD2cEkb5GfUsna1vn8PPztb31XGZ5PlMqPjatyHYS+Sf4PD8ytHwc
 8F8Ilr6p9Rpw6WG8675/9LGw4CnMWCITOe5Qqmx0N11b+udqYYAdAvQqtPzZ2wHHgC2+4nuXiU4
 sbOJ54wdGQE8KKsyvkqSmFPFC1UG9RX9M6zXVr8rVsSBZMzy5X+oHujf0sI7qbjLSz2OPW/dSSn
 l2TO2UnYTZt6dZGg9A97Chb1OJZckDtOPH6wta5iqlcCvbX2AKhW02WSQ8aiv6hsVHKCo1dN0C0
 aiB479ZH6riJBXhO21Mg+n+4KAVBqoZJAnzZY4A+kzy7X25xWOlQiPL/LDBZ3qntNoX6VWKNCbi
 jMu5OKEOY5+FcxMT/Ig==
X-Proofpoint-ORIG-GUID: F7baKtTk3YRbRngU85rNoeGZudv9VdJu
X-Authority-Analysis: v=2.4 cv=JP2uIMKb c=1 sm=1 tr=0 ts=6aa9d2c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=hXAsoc/zAxyCEdIRhrpmVw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=4JVmFDg4bpWGYAirTr4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX6YqH2CB4OSW6
 L09ambiNreXqqF8AYp96BtS2qAd0E9mO7IeggS/pSRv326TF3RTevCfEq8KUXBUZbHXumMxE8+I
 6P/RIazqr6Vkuy9bfouqTVceKzTorv3kau23wLJxioslXDsvl34n
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11906
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=10 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150341

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

