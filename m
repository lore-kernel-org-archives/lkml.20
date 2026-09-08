Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1D855C33F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880627; cv=none; b=UBxSCzaakchT6cITdYAEoxDveIYFx7fUw8mabmpsF8U+XtsaXoTUvG45/HjZygp9PMCi5fcUCvRHslTWsH+cN/BGNWx26/umxsQqK9T+sXhX1rMPLhPErNRHUvmTuv+Wil7RAlTIGxoJLzqtQQ/fOk42RHQkjfrBmkKpx11ka0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880627; c=relaxed/simple;
	bh=CwVUhQtJV5BBiMFIF7YsJllNsqsS2ZgEmWIprGlfLYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdlLWAprDv4GjB8Jt+S12OJsNBQnnRtv7mHXFyxdIaAm3aX4pOxy5TqZQuDrU3/unsXrPqeClCZnb2tDm43sbZ5RwS9QveEaXrSKgbR/8W/WNDqFSYjEeWe/PZgai93La1uJO0HVJn4BpCDB1gvNQx+H7I5WYdMkklBdk4HhkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=URL8qlju; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=QPAuoRNT; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="URL8qlju";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="QPAuoRNT"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FGqTs383538
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fX9N
	ElGdJ1vvg7lNn1ooXtrYJaw0f4RzbfQAdaHbR/Q=; b=URL8qljur+o26RNDCwhc
	3otxNMr2qFFL7YmqHUgEk4Ox/BW7+OhP1HTONIGtt/wEcTTAEhw4CQav4KHY3grd
	ycpKIXbs9EvBw3TELRqqCd4D19Yv1uRnkoe94QRpy4O+KSa0cTHtWocpZTOzfMUh
	ByysD6ZPx4pnuvP/y+Z5zt1XCO0iHb2IJuuCTtN5L3vkKydqmhlPUGYpu3CPkd8m
	d8QgsZS7oDb2/z0OieyYkUORtzY2eCGqAUfpDe1GSNgcd0EGpcmInARCvRzL2H4f
	2cFO7Jv7ZAVanKzGoy7vuxFsw+KqKY0Cx7Y20Yh2Y7rm+yM5ukMDuOmSAkJ/Z4z4
	AQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjmv7g03h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:16:53 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8dd8be81so56252846d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880613; x=1789485413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fX9NElGdJ1vvg7lNn1ooXtrYJaw0f4RzbfQAdaHbR/Q=;
        b=QPAuoRNT7vXeBkcu1vUn4M77+YwQYD/yixV41lUhUy23xbp1JTgni3VmHheFxS8aw2
         UEeCYoAzKa3bSrai6k6w16fZwl+efFKnZ+Ngi1YUy+3eQhejamuTOYNMIdncfVOi2bRl
         YYrzxLgtL7vLfhjLUhgRsQMhRRwzhmPZq+Z0qBoq6dG0UAc4KYSzV7y5L7vzMuql5shx
         prOguZE5ZIPUPr6rXH/nuOuPRtVbMXMIGVKUthmYru38NCrnlYoINR1xAj+Le5QqBZN2
         WiaVm/Of0us1PJl4N05+nzOg5G7cfCpzgQeBLEnqQO0RHfP95UJSVhb4I1DMs9AM9RNQ
         4+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880613; x=1789485413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fX9NElGdJ1vvg7lNn1ooXtrYJaw0f4RzbfQAdaHbR/Q=;
        b=Cs+A5sLNHK6PmAO7GR9La1iJ+flYtH9BKHG7WrhQy4p5vY2O/GPYnKqM+cfXr1pynb
         mx2ZJAofv8XiT4cAA0mdGuI2yhPilmald6SC9XL2F+00Ge42UAc6Bwlu9txAnFl8e0p3
         B0TsN19SRaf/DntCzeHTc3N7WXJ5cYxjHSSPEI3jg22kIpM34K43S4GDnK8kmk4jVgch
         VHRi7k+T5d0JSsub0i67Vo4cVSzwOFFBDwaw2vOEJR21MAatBXSKTl/jmWQCZXkG5m0N
         B015qpf7QlnKw6u+nadxNJrdJMzghvl9RQxhS2a1iq3/Iq/5RogzEYfQmG9SRPwBOw8q
         4ZGA==
X-Forwarded-Encrypted: i=1; AKwUvBwtwb78t/ycPs5Ui2wkKBwsjfNR8OWcTHm+cRjHDyHiMrUYojNsa3bDdhPhXLhAzijCDUey1QXwkG20meA=@vger.kernel.org
X-Gm-Message-State: AFuF++ldx1BM3c3CU/XHDHPO5Z/7LhGdbvvzU9/ou5x2DEWZel9zsClM
	fjsuPVY3NyjfmJwQ8hvTuBp7aK0L7YzaK8S5wbaViSmW5ntK9vsfz0vzg9gd4l7qh5Nh3Kw0raU
	8wOgy1FuNIf5zWXzVFv1tYJMdjjZmcLHXx0SyZdIz5m/AzQkhYuN2bFyo8cFlBQ==
X-Gm-Gg: AYBFou32T3RuPBNHgpWY4CSHsfkT+QsOFxJXOGqO5t7HBnhHoJdypw71veCl3yWj2hd
	Teo+QOpNv6gVEuPDiMbDGMB30xvkqTJu71Q97Bx0K0XGUabgVwgGWgEPxzHf512midiwh5TKEq1
	UAXtELJvTVV1bX1kLN1/+YiTAmPZPPhZlb6H+a2LBdONZWTUr55nl5G+cCiZOAltkdfDlxT6/Wu
	l6asmndpc9RxmeAedZAuHD0KXL+YWOUsWqgiuc0s24dcHo1bB73vDdxncqsaRUkLMWDObX9pGpG
	xevymTQR84cBl+wvLj7VS7ytA6OqwybxmLtSccuss2yTusa/VHsWOEowsNWdZO/t+WDJlZ2uJqs
	02n941TMP5s7OPEGE9vcuSkrayO56xddJI7GbCxrT8Jl6d27VcZifeQ==
X-Received: by 2002:ad4:5aa5:0:b0:90e:838f:d282 with SMTP id 6a1803df08f44-9103ef96606mr374577836d6.18.1788880612900;
        Tue, 08 Sep 2026 08:16:52 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:90e:838f:d282 with SMTP id 6a1803df08f44-9103ef96606mr374577136d6.18.1788880612245;
        Tue, 08 Sep 2026 08:16:52 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:51 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:38 -0400
Subject: [PATCH v2 8/8] mm/swap: remove page_swap_entry()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-8-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=860;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=CwVUhQtJV5BBiMFIF7YsJllNsqsS2ZgEmWIprGlfLYs=;
 b=tyPDhjc61YJsztH5Euj8TQKxOFLCx/bN5LNbg4nPR3nHokHNyj+eIbeFvKstLN2ZgLUq75Jp1
 TIiTx3V2yBJDm7QS92klbDglsyL+bdllOp4LdCCYZmItGrGmI/LXvyx
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXwlQQK9CC227B
 5E2dULQ62O4JWV0AdXKcZxrvb13tFTMGF24Gy/6q5REuMZSDe9v15R/QT0h2ii4Z2okIXpCU4LI
 ZyYM4mLUz3NyYb/HxUU4mXNXg/SLYGdp+wyX7gl4Jv3gdIM9pgy8K8UyMmLzVIUNGC7F2n/Jj9c
 K0HZ7cc3LVkPdHuGr4orCmAEPmRSqp3NWMvEGx0k+fdDaB0MxHtGgfTdt52qBIoT2dDFJZpIGFL
 Y4n+jqG4yq5moQFDKRKNo+vn5qsEODR7lV64ZDOqoC8BnT4Gr91eq+sdkCXDEimlo6HHCRLcMMq
 GSlAT6PYwhdodoEF8+AmwAGqTIjaYc8iox0aHtVsVJ0cBlJXwkQFw1V6xshgxVgCviNEO4bczcT
 u7wJLMWUuQELNeG58vNv1wIry7uIDf8RCw3tT8YcmhdxezbNENnJk0uNjm7XqwCWIifCtGJ5Qt3
 s4gxeZ5V2620zPI01Jw==
X-Proofpoint-ORIG-GUID: 7ku2CddmqmUcZXz3fznd78fsx3c4lvmf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX1vqOHH9oEyDx
 pEui/1ujmDDA74nD+pCtb8eWaQiD7jAGvglKqVgZSflX095jlLai5+bswdC133VMt0wenADjc9U
 MPMddoXUo78GSQWPZGQ5dok3B1bzWkQodfL0T11oUBoNzrRNHL3X
X-Authority-Analysis: v=2.4 cv=fpnsol4f c=1 sm=1 tr=0 ts=6aa026e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=t2YXVXqu3yB8mPBWm3YA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 7ku2CddmqmUcZXz3fznd78fsx3c4lvmf
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=10 impostorscore=10 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165

All callers have been converted to folio_swap_entry() and
folio_page_swap_entry(), so remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/swap.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 1d979e76e78a..8032a0f3c319 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -305,15 +305,6 @@ static inline swp_entry_t folio_page_swap_entry(const struct folio *folio,
 	return folio_swap_entry(folio, folio_page_idx(folio, page));
 }
 
-static inline swp_entry_t page_swap_entry(struct page *page)
-{
-	struct folio *folio = page_folio(page);
-	swp_entry_t entry = folio->swap;
-
-	entry.val += folio_page_idx(folio, page);
-	return entry;
-}
-
 /* linux/mm/page_alloc.c */
 extern unsigned long totalreserve_pages;
 

-- 
2.39.5

