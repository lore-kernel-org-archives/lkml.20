Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E73148DA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789336452; cv=none; b=XeYWmjDclNU4Bf4z/qyR0cAV/YvcVt/2JfKq/lm/kYiyEzvZy0/+xE497fsh6lffMsmGTR+janZIcGMxFN8MDPIJHNNOAGazMtONme0Q5W9FmJtBjTl1TBCkFp7lWV+dK0Y165ZR3UxLl4hxm7HpBOa+I+gxZq1+5uYuWQcwTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789336452; c=relaxed/simple;
	bh=5Zo/HLRKdYvyZlBLIOUSVU9KGinfmR4z1zkBsYrROVA=;
	h=From:Date:Subject:Message-ID:In-Reply-To:References:To:Cc:
	 MIME-Version:Content-Type; b=nO/ackjNf9ntKkByWQzTE5JdJBekR3VwDH4+65o7Gg9RVxwqflrrlBWOU+tVHdzl87FOs4eT5ka/4XQ2x788XUgx7q3/iMirbMDSdi7S9D0EdyVZ67EmBIDE+0cArkYAGY1RfiggST6CFYUnPAvOXnwxIYMHxvVGKy4n5nlfkVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=a707JlvK; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=c6fCjpvD; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="a707JlvK";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="c6fCjpvD"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKXkWR646912
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fRoV
	tCxPXlE2WTj7/cuKQLp9U1WSy4uS8DQXyNSJ1GI=; b=a707JlvKtuC6saMFXszo
	48RTvnQk78GeFs5uHDcT6SKuA7eDW6+BrVTEhXs3jwE8cnNkDDD2dAWusohAzO3g
	HlznYoK2KnQND9jw4Taf1Pu8L5w/OZ7FP7tA9OXIDq363SIXMe0YGXkTzGg2nP/o
	SpeidmZI56MZiDB+5A0i0qzhEyjZ/AezDp1zgezSUBtVPC+zb8K26Delw4+zyxSi
	8a+aYiorEI9/lr7viJuNv23x1bUrvMToi6Gp546Kh9pYXNwC77vvO0qWR2yM46n1
	Ell5m+zd6BNAs2dmgp0+pMHiQbDoy5T8z2vJsVoGNU3MNp1BbZl+CkSkZJEoHi3M
	wQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gp0qmgsxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:54:08 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so415127685a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789336448; x=1789941248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:cc:to
         :references:in-reply-to:message-id:subject:date:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fRoVtCxPXlE2WTj7/cuKQLp9U1WSy4uS8DQXyNSJ1GI=;
        b=c6fCjpvD5yoyebu22spkff8bgrHtWb8H2oRO/gIHm+2L/1eM7BMlCggEpTYjs98dhm
         MIIS4YWT6umqk5sqqZmXsgrPDOdCzj1pvNV/M+wJA4t0rddRMZG1xzRBxOMUIiaoznAd
         81orb2/rDjj72Ul6ATNUTb/hnM6BzlvOD7Lo0lSLU6Ekrs+ROJPIjpvPKOxc+ZogwAIr
         dBFtDR04qtty3NhjjNyunh2He8rKvc/brJOulnibCQvA+6D+48TrNORoh9dew6PBuk2g
         ynG0sIriO700e+yaPeq3msRCN83xquNDxMGgq92PZchjO1C9mUbNXrlv4SzE4VWvaY6H
         Msag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789336448; x=1789941248;
        h=content-transfer-encoding:content-type:mime-version:cc:to
         :references:in-reply-to:message-id:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRoVtCxPXlE2WTj7/cuKQLp9U1WSy4uS8DQXyNSJ1GI=;
        b=dd+hUOmpLhMz++aklUKI4qeqpmOnXkPy8NaBvmYnjSZ5FE3x7pdtfSvc2f1KCce33O
         3vWuHs68TNhu4tW+9ezyMsDf1UeJFGn7Y2JvrV/+SHudr5brKG39/8ih4uneZHhZ1u7Q
         D6UFqWAJr+MN9H3QwxTHFDZKRRfbAte55pSPvfx9TLMeVOQQf1KkuiqYgZVZwg80+ppR
         7+jxgLJa1jPuU5gSqD2hwNPeVtAPb1/z8WSfziQdTm+l8u90eIUlk3Y1BoMsQpd7NW2R
         fYnyyGoh0frdqJ7rlNTraxJzvOPqgIh/+VRvUkiVvLHurrP3i04S5QqFP6xHHqtqdu5A
         qqzw==
X-Forwarded-Encrypted: i=1; AKwUvBxsR7b5xFmQ+ZGvQ4UVPN03ARhPtvdTOrItDy5aMZ513p2BZstaV/BggxM6EgB3ypkmN0ueqiG7xkx2bxE=@vger.kernel.org
X-Gm-Message-State: AFuF++keD1Eo1g4vIlwawRexGJpjJRH4hrMUY3ZOFpI0KwehOs49wXFb
	mXelA+KrHhgTKXRrdbKhEGitIjJmUmJpnpBUn6aodq+E62BkNR41fmQlPHPT9dvWPX2zmzMQRLU
	8Gs1lNw7RbaYmY88DjqpOE4r+euDCMQrOjvf18MauaPtuuxzX/c+gIRidPmr0uw==
X-Gm-Gg: AYBFou2GQuLuZfZs39tTknrscYVakZ2fFqIqUwpDFh0NCv2RVBlNgW2Gp8BsaejTmfj
	52b0lVFsK0xb9xgle9nSbM2CJfFPbG4m0FTfUib5RIDUk7TnpM44KqW9pn6bxq1NWlTh4lNHa/n
	4l0RAiZmWWYm40MfcEBWpN8//2JHGCyTaMvR5OojQqmX2Zh8apeO4/PN+S4SaxEX4xHXx3Y8jei
	ECH6pwOOuvCqfbUSlr6esxn/dDv2IBkIcTvmSsobfWUAz/7zgY0ij9Qi7xHdxWK3URGEMZ4mXLZ
	ZNkDRfP55BNlVt70Uv43G92D5GbJePVGrvZzoi+UdtbthZf6YSgVgxdVLXLBsUOoomm6hodClVV
	orujRwshPVeT3HNxbiglQcVqeHn9/tjvrkphDLP+Jho9w0Q6zWlWwgA==
X-Received: by 2002:a05:620a:2a04:b0:937:372a:b97 with SMTP id af79cd13be357-93a297fc791mr2911885a.17.1789336448488;
        Sun, 13 Sep 2026 14:54:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2a04:b0:937:372a:b97 with SMTP id af79cd13be357-93a297fc791mr2907585a.17.1789336447954;
        Sun, 13 Sep 2026 14:54:07 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ecc38105sm762619485a.4.2026.09.13.14.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:54:07 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:52:28 -0400
Subject: Re: [PATCH v2 1/8] mm/swap: add folio_swap_entry() and
 folio_page_swap_entry()
Message-ID: <20260913-folio_swap_entry-doc-fix-1@columbia.edu>
In-Reply-To: <2b0a6809-bd88-4133-a002-7a9acb2a973e@kernel.org>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
 <20260908-folio_swap_entry-v2-1-ee6d01dfa5e1@columbia.edu>
 <2b0a6809-bd88-4133-a002-7a9acb2a973e@kernel.org>
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMxMiBTYWx0ZWRfXxmFFFgF5JwbS
 kxq4ViJiMgyZQaFR93qF4Ji1nDSGmUv5FGcV0Q/ZXbIm1Kbpu5SBi8FQw9uiw1pGMjGo5kM8YQ3
 lTEOE6ls51YGNSiwd7Bn3JiGVub1bK4ysFbf8xDQ4zgujaIQt9EV
X-Proofpoint-ORIG-GUID: 27G4JAAt5Q6bBzKLgYMV0xqDUaSx4v6b
X-Authority-Analysis: v=2.4 cv=EJ6TQFZC c=1 sm=1 tr=0 ts=6aa71b81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=02raouAbq-PgjEkgBGoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMxMiBTYWx0ZWRfX1kK26jS4w1O9
 Lq2ahhLITr/LKCvJHjBWBebFJoVzhiTGjItS9tLajn+KT6qNegydTb3R/9yPZKjvYwifQcLKQNm
 yYizYOD9QrgFkOip4S8qRNQiHOPhO2gkCXU6xlYbHcz2+gn7SmPzAuOmRMzg2CBTS6vI9oEm4k7
 /MA8FTytq195C0XdQa6qgY/V6op3s8rg0lt1DOTVhkAKXusSyRZAHPEPekXtyMjQS9uNOGkijHj
 IRbw0oaLOPvKsx7fCdiAWAMVPCQYvIojaki8uOd2Ts+Kc8T2g3aLNx6Y/g9YplKSKk7YIW3GxT2
 q3ELrn3lqx7BgNl1iIPjJ+IXpetLk/sjoSISeQRDSVYiYV5/87FcZ6BPDq5BTrCdeQZqIM8iQ3I
 uIQjhyjjTlRKXS6i3dMADT5rrBoUCKqhSXQaMyjwyh086Vu1HNrmQkK/ie1dwMqhEJY+fPA3r3T
 FNtW4OOUdwWrKlScx3A==
X-Proofpoint-GUID: 27G4JAAt5Q6bBzKLgYMV0xqDUaSx4v6b
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=10 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=10 adultscore=0 lowpriorityscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130312

Andrew, could you please apply this as a fix patch?

-- >8 --
Subject: [PATCH] mm/swap: adjust the folio_swap_entry() kerneldoc summary

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/swap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 78974da6810e..43155e122b5c 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -273,7 +273,7 @@ struct swap_info_struct {
 };
 
 /**
- * folio_swap_entry - Return the swap entry for a page within a folio.
+ * folio_swap_entry - Return the swap entry at a page index within a folio.
  * @folio: The folio.
  * @idx: The index of the page within the folio.
  *
-- 
2.39.5


