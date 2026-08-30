Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E7346A0A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086020; cv=none; b=BFwSKekytxf6pOEstG4QortRzbA2P72cIBxXxHIM7PedLtGEvnO5fxCUVCUqfEhE1QrDG9xMcPZ32FryR8Xk4wZJLv63T3fEgAk05xe3Fnq6kd85QUyn2YoXHvyCBu0puYaiapAkaC2tySpkUZKUoAM462dbc+psnYwNKrL3N2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086020; c=relaxed/simple;
	bh=hjPNw4K1yXPTP98viqWADLFrOSoXMJ7N2Y21LKrNJ5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jakOlVt8oZ9bbAvoN2F+X4gYoCc1fK2U1zioJqrTFvdVnTRv3piUwNxd3bp49MMBepjrB2Hh479R9jZ6SQ6kBdFr8TXmNJBvwPBEBRLjMVhFsuXyepwU7wd35LssImgsYlyk5hCCgsu2B0C8G5U8QbOYQ7mEv2VVBnPWsqEAmRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=CGyQ1V6v; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=FjIjfHds; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="CGyQ1V6v";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="FjIjfHds"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UAWt3f3409044
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=iltX
	E0WYwKKMJapYaKnipYxUvczqFD9fAUv3vS9XHEs=; b=CGyQ1V6vUw+MCMQcXjjo
	5rUZAS8akibjKgiY8wGGK9WLmQ0GU7BqMd6S9+BqN0/qHudVygkiakqm4Ov2LWJC
	5RBnuR9X4qi7+vS4QpVPwUTbUU+iBrac8S0BqC59hPYZicmIwGSrHs8MrAi5cyrm
	6bfhzI8wlFaGiUdJuVRH6cHRo1ogOeWj1GZYV7bSQgYXlKGk/0tdG7r59QAKSmNo
	Sm8PhhQpFEpEfg/7fkAyBsGDGmLJtn3snE7YARtdSqC5Fn/zz5NNhwGNMTqtdUIM
	q47YT7PxWyyhWsZP8fUDU8U6c5DF5aZD9aYhdIQBBTy3nAknLGuYzs8Ez7q8dXH5
	Nw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbuaa4n4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:37 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52e7a49452aso40183081cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086017; x=1788690817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iltXE0WYwKKMJapYaKnipYxUvczqFD9fAUv3vS9XHEs=;
        b=FjIjfHdsVFyzav/AD6nZhdvwYz4asKaHryiVxkFSSpzJspP5ZGf5Zpv2/3/FILcanX
         lB05EldIiBr4uv0KUKzn18i6xLZNRwPF4PimGtaE/9690ZdjFpU5sjbM/OmfgmPbo+MS
         NnVkUQHwh0oHts0bBnWt44O98l5ZIUjsquPR/RgFIijYASCJBvMyLTvsCOd99NxqTvXw
         CzR6mGMOKKFS/hLKq0ykEdcefBX1sAN9CnDx7qA4w8eQZTw15RCj5L40q4BMAjKUs0Xf
         ZuG+/OUt7zW9ELIakK3HcgFUdpMc7Uk8bL1RDSEcI7NyDIdwkGivbKDXZtQx3oMfJMyR
         73iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086017; x=1788690817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iltXE0WYwKKMJapYaKnipYxUvczqFD9fAUv3vS9XHEs=;
        b=RQ7e0DosxTjvJ+WQSi09socbzuPBkvpOSp1MJV/+Q/XV2UGIRXhbSU79olSV8tx+V8
         HTu7hODwgxdahpEdOms0c8T4sBzXApjAdYQDFW+XLcrR6jUIwT7BffO6I2GbLRwk4hjO
         RvxvLcIzAdxzNl2sL5GVDqSY9YiufDV0vLaj5lYExVkiJRduyVCfVmLonKArDlcQUWeO
         JoMxpe14xKFVUuvzcfQlv5c0t++iGdPRGQ02UJlpOTqGXhVcJ+CCW4T/pTenOHICe5c/
         zneOb7PNrG5aLLp0JlEvNGC+6wQEbscPF+O9PWryq1wQmoY3rrgsidGKxB0LAj/jrc7E
         U6tQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxuFQdlfDYRgR4ACF26t3QMoZ17SODuiyPokqoZS0PbB4yY5gyAlfFDK93ziyfOlowrbTYLcOUCaIiY+0=@vger.kernel.org
X-Gm-Message-State: AFuF++mxbDgSzspudd6r/PsIVUdIiy4Et44Akb8S2PXXXWlcZde3BrZu
	s9BGOC0hOjIPag7zhji/RLy8Uerqu2L36Y9ixzyPX81YZTuwDz6XjwmChyG7tVV1eGu0d00KDjV
	AVEzpW3NBRzCT59Bxg9dwUaZUt16+gd4Xckq4ICY/qkLgEjddS9B+98m7+IrImxqzts+DQrZ4S8
	E=
X-Gm-Gg: AR+sD116VOU9KvJm+XFUg3CWoEAduQQbr6wkwVhFGjolTRZNRa9sG7UMkR/Zk2GFv6D
	fZD2tFRN1Wr6/B7/s7+QhbqlHrsbS1bsHQRL2eJiMctg3Qvz4vThMDmK/aPXhaWrsfIcc9AhGDR
	vPqFOQRsQTHRPJDOHgjoiC+SIxO5NqzYJ3HWdEv5faPK9cGsV0y2nE4yRDSf3rIM28ubxzqAWMH
	E5eTV8rZA9AOH3eMxDZA3xtt7qfD2B65dFEgwiHzwRXWsTv92JbOcb3SukmAKPfgkH5Ef6jPcvQ
	xmXfmpInKayS4EsdtwZDtv08r8CcHwNVVY/F1b47bSydxUSf/79vO2wr3LY8EeezriYbrJhdm4M
	mkn961rmtp6JeAVy/DLbTOLCQigqanjVxQ5+sf0hK+Q==
X-Received: by 2002:a05:622a:3cd:b0:52f:a0b3:bcb9 with SMTP id d75a77b69052e-52fb941f705mr207116631cf.10.1788086016951;
        Sun, 30 Aug 2026 03:33:36 -0700 (PDT)
X-Received: by 2002:a05:622a:3cd:b0:52f:a0b3:bcb9 with SMTP id d75a77b69052e-52fb941f705mr207115921cf.10.1788086016476;
        Sun, 30 Aug 2026 03:33:36 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:35 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:25 -0400
Subject: [PATCH 3/8] mm/rmap: use folio_page_swap_entry() in
 ttu_anon_swapbacked_folio()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-3-7786b52acbc8@columbia.edu>
References: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
In-Reply-To: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=796;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hjPNw4K1yXPTP98viqWADLFrOSoXMJ7N2Y21LKrNJ5w=;
 b=SqXdQ6+SfH8WrC7+aQn5jmiLp05F+QV1V+8t1xTPP9zyb0Mm5AKQJxBCFYXPXhX+yzVhjrhEQ
 fe4zwW7ILfhCLYAj2in2hlUqvr8G6n6pplJ43VNfpGfmiyLZR5wFFBQ
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=EZv4hvmC c=1 sm=1 tr=0 ts=6a940701 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=gAJobatAmFEwf0K8sXEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX6WVz3DBjY8f8
 KhnWohqRra2HApxiecYhEwhvcYiHnIFTZzyN33G4OnfPA2fTrlwsy5GTP1UPQ9LFlfyA4485ok2
 UvzV3Be0sqpDfYriN8XjYFL3wz47OdCQk8KCbBkqSTO0+NDv/WUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX7/sxG+y57yN6
 i6oryIYBaU+6LjdnIIJdtznk5lFthqi3F/o8XmadpeSGgPjNrLPt4+0eGSsHiiGAkmvPIrfqw0H
 P0HSfMV2xhtyERXUuRvlVMLIum18HOJyZ1YRAD3mV4s/OedtyiUJJ6cm7HveUyauHq4YgPJsGX2
 6OOVD+DbKx4AaQJV3nKPm9aIj+zPcNktmieQDAg1Jc6KdEWffK+c33Ph9wsDD4p4DzpmcP+wbj1
 L3x9v2Q0YLIBoxdhRs9oKK34AX+9zdqIOOLr/cywpGp/aPKXzt+Aymoe4TWKJe1DLWOVQHcFbZd
 YmwLpZgROe65fsXJj1xOntmoGli6ZP4ZuNfTbi0aOFZrxL9rG2aL2f9JhywcRIO/yUfFRx74doe
 PaocFSzD0rpnNlcz71dxTpToEpKJN7R6+AzU/T/gXoA7opDdUK0KOtUCiZD6XgpEM7dEAYr9laV
 UyFNi6tLYVMexj8HBXQ==
X-Proofpoint-GUID: O0ygIBr5pnd7kJ4F2AYztrPtyGY8s8sV
X-Proofpoint-ORIG-GUID: O0ygIBr5pnd7kJ4F2AYztrPtyGY8s8sV
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 clxscore=1015 phishscore=0 suspectscore=0
 lowpriorityscore=10 adultscore=0 malwarescore=0 priorityscore=1501
 bulkscore=10 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088

We already have the folio here, so use folio_page_swap_entry() instead
of going through page_swap_entry(). This saves a call to
compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index fed0362e0bd0..ef34126c6ce8 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2143,7 +2143,7 @@ static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
 {
 	const bool anon_exclusive = folio_test_anon(folio) &&
 				    PageAnonExclusive(page);
-	swp_entry_t entry = page_swap_entry(page);
+	swp_entry_t entry = folio_page_swap_entry(folio, page);
 	struct mm_struct *mm = vma->vm_mm;
 
 	if (folio_dup_swap(folio, page) < 0)

-- 
2.39.5

