Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164BE54A7D2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880620; cv=none; b=P3zdhv10Dty6Nk/zB9mVW2A9fQYDLQiSpiOm5iM7o++JlGhyJGxuWM3aE2UKCcPKCU86SX42L95i1P/S6w5bcVF3ysM6asAFmlPXDMDL0Z3jlfZwdjnqSnOdvGWRzI8C1giwFCZhsGRzT4jZ0S0pVkoPSKs0oq0TGwnSHPIz7Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880620; c=relaxed/simple;
	bh=X5qbXzCaQfbIvXd5MmRhi5GzAdDclgePXL2NiDB48ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbhLJ+ugzANFX8IjjCV9Xnzpg1FugjmH5LLTgYA3HF5USVgaA2ycv92JGDovg/kvpkCXprynVV/IWMSWRwr2WzCogQVvP0bAn+GU0NloEcrn4zL0wkmTSbgcjV3aEMcH5b+yKXUcYGpSoejqJ46hzfBgPinfgqD4seuhHyIL/Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=hR3yQeBX; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=K9UHFZ0Q; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="hR3yQeBX";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="K9UHFZ0Q"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYsnr1784898
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Gj5Z
	p+Hf7hb0eLuXb3JsQ3zN3lqZPzkqR65AkPfI+wc=; b=hR3yQeBXVrib9uXqGBgE
	H+c2oLr8jUTZ9b2pEsceow1ABxwqElSCI04sTB8TlbgrM+7UC86an1Gd7k8dRpF1
	3kydobGuJMXRBbQE0W088avJtKol4lLVulTgqIU0KELr/9m9qVAoOjhqgEJ1CkXE
	I25YQfg5JAiAOiUBcHZVaYj8qfB2NSRdMTe/nogjtExXhsEwqRErhS9UpGEXiDBT
	/uB664pRcO2HyoPP3nHpuuuOwwtbSk+vKCT02aD+pNvl/1oOtGaCTws+XEk8bDng
	NCg8Y+fp9biK5pMXEtZ/iUvLFQvJia1jTJzmwPPEeweN7bpZM5F+9hznMepTvTyV
	Aw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gjjjdswf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:16:45 -0400 (EDT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8563c2a53dbso87336787b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880605; x=1789485405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gj5Zp+Hf7hb0eLuXb3JsQ3zN3lqZPzkqR65AkPfI+wc=;
        b=K9UHFZ0QsGcPQn/42ucRnmRFCx6yiralpYx1EqLTqIgg0tNNkPC3m+Y13jBjUiI1K5
         RnKX394xDr1ioArjjivlUvkGggzQ7Ol082KS4saEW3K3P5/OjJAhNuAj05JhqJ235PpY
         igVpHkxNqbjo+A//4H1VngWD3Et/h+J6Jk33qq5E/zhOYMo2sTCOzDfhcwduQY5ZLafl
         zys8ZLOLU+i95DaPSk88HkFtlZcQYJV9gsfHIEeNola1nNPAIXfHE7/BfCu2heKynCrR
         ibO6kIdj44+hoyvdeAayHcm/b9CJa1w+unBGEzHhs/zJbZ54Qh5iE3gPiw0oBSvJ6sjp
         hdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880605; x=1789485405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gj5Zp+Hf7hb0eLuXb3JsQ3zN3lqZPzkqR65AkPfI+wc=;
        b=gEfWuHjO5D4eXwtgImFA9wGqnQZcYgumTyXmgV6RQ6c/UK6/Cnc5xiMyPLPzZmDICS
         ROeZr82z9aifexIkFitFBnSkTvcTB9kKzEiNL1EEAtkgbIbHNQmf/pV1fKvzq/LdI6jn
         TVf7vzBMdcw9FFW+OkQZIOUboNDSjv+04kgMl5tUlja+YFM77EarwaGPZLf9MhidfJD5
         iNVC9dBnc6RI6dDEJC0cwF8vBprLmkEaKQ+O3JN5Vsm+hEi7r1c/UdtYjAUkzia3Fo0Y
         ODOzaB5MY0FUAnHQCamZHS38H7N0/t5566dDSrfe4p3NRJ7tdILbfzktRtcckDR0v15n
         tQZA==
X-Forwarded-Encrypted: i=1; AKwUvBzloqniAQquiogobMd8x4OOyjWrq/dyVqPLSZw/tpk8dOqcOmbh/LHggbpUA7yP7+b7Jo/4ulIwGxUPe9U=@vger.kernel.org
X-Gm-Message-State: AFuF++lwJfryVGNFr4hjzIdX2iRbX91LKR73kbOw+8hEq5Tji811sAh7
	1ljcP3cajFgwSSXSfVJXcPVMcoan4QxabpPDS/Fj1P/16ZWtD861CYk8VMIoRq+5kn9cXIVxQyK
	PHZGf4qpztF8sQqkvQtVp4kjOhcJqU9NH3Jf94TdhgPqlhyZG1JaX+4WV27toUA==
X-Gm-Gg: AYBFou12eUG/PuAXKyaTQBSX/JWgmSmWFxqH/Hd4K0qvSPKaErBQjALnBYs6KqQORGO
	IsP9lAxGch0fZyEVvqVQZ920IDYlvb1bwRZ9QS6IOWX8cTnytaniDs1ydov84CJ3Eq+pDrfc+cf
	mqPT+8fc2UbgvBNCmq9rnQkxDUyOujz6yqU5kUFgM+xzgfHDJYFituyeu8Eapy2o5BXnlU0GSlV
	FDzcuoVQ5TSnBCiCy6EjGsZIBAOud2Miqy0qDETVlblGdDtzY+rPn2q8Mge55d+BKfmuVFS5ltN
	ATKJweXGb7Y/9wkAGJduYiV76H6kkgdOpSjDD2uym8VkSZpVCxvUBv44ZGXrpbNyNQ2QXG7tjPx
	s5io36uQqqMjotGpnT72SVOKXZ7Eqcjdql4d4viZFWR8JSfkwYJi2JQ==
X-Received: by 2002:a05:690c:7:b0:861:a2ae:8c31 with SMTP id 00721157ae682-87127848ae6mr116780417b3.29.1788880605020;
        Tue, 08 Sep 2026 08:16:45 -0700 (PDT)
X-Received: by 2002:a05:690c:7:b0:861:a2ae:8c31 with SMTP id 00721157ae682-87127848ae6mr116779827b3.29.1788880604485;
        Tue, 08 Sep 2026 08:16:44 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:43 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:32 -0400
Subject: [PATCH v2 2/8] mm/huge_memory: add a comment to the open-coded
 swap entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-2-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=906;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=X5qbXzCaQfbIvXd5MmRhi5GzAdDclgePXL2NiDB48ac=;
 b=uK0LERQcpXKQIHl4Fe0BtkcAaSCmFGqTL2NMvbL1j3TixZ7N83u2P8Bs4llT2jpLvN+8PYknZ
 j48zbH4MSCgB0VdKnnVQAwjEV5D1CfGWlm+Wjq24m4M0lO/kE4WpYYk
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: SmBOgTfBHj3sESCLDOVZnU6MmdyjSWBl
X-Authority-Analysis: v=2.4 cv=eszvCIpX c=1 sm=1 tr=0 ts=6aa026dd cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=uQMuDZbhYfZjsEHDzQ4A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: SmBOgTfBHj3sESCLDOVZnU6MmdyjSWBl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX+xi7s+W+T1EF
 3jEZ1MNkNAa01Glb/TiWq9rwgoowabap3ZiitXTI3/HEKIVsr4fYAzSdDILxfo6DA3JXkwNnUS6
 wG52ojOZLmZ8JGWDmM8EMcWE0QcLQu4zm5vRPbjKRsn0sdN8muid
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX8BKWK/EKcgJI
 T164xqHacbHIGMmWKSKamd/ydqbGV6s0dWYhCEMuGjW9a8pKj5Ph+zv4EB2J708CEmW20/yS53K
 KXmISItkOjRkKKcUVPwcdjCgyIiRd5fAyOEX5tlQfqSWDgbZH3DuZrwE2ro1Ni/Tm9DCm/qHxu1
 Wm+JNJwPfwA1HMVT9NiqnEuoIfUUmM1zm+XcRG15tLm0GG+Drf7uP1jdACCgbxg6zKhW5oKTDb9
 nKBa+tC3+LuliT0KpCxo41eSST3PR/EwNzOw+TMVyDl74ItSrfeaULIF5Hzu8kOrOK+TPXDhAR0
 Squ/6hJ4tr0ENTJ6XSbBe10WSyB1sy/NE/o4biHt3L9cIZFEyUZo1G1ZOoKWKV6jWcYCyqH8+A6
 UVPQPRQWrCXhKlSMZbgEZDRYt0z8b1fCoGfO/H1fIb7Z+XXvUNklmbnsqosqMdPmIoo0d25r0xt
 3mBytH3U7qANCsFZ99w==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=10 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080165

The swap entry of each new folio in __split_folio_to_order() is
computed by hand from folio->swap rather than with folio_swap_entry(),
because the folio's page count is not valid while it is being split.
Add a comment explaining this.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/huge_memory.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d1ce061601bc..1fabdcbd8c8f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3763,6 +3763,10 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 		 */
 		VM_WARN_ON_ONCE_PAGE(new_folio->private, new_head);
 
+		/*
+		 * Not all folio fields are valid during a split, so open-code
+		 * the swap entry rather than using folio_swap_entry().
+		 */
 		if (folio_test_swapcache(folio))
 			new_folio->swap.val = folio->swap.val + i;
 

-- 
2.39.5

