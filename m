Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7B73603D8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267571; cv=none; b=oJiq9ZEX1Uqbyh6PezWK9CiutTuN67y3aoSAa7/ga8YG0Vm5N/QoCXqPy7svLYLhYmXXxKtAOjb33SQomdAhHDUfXGjNfjz+1h6jqAtdrNfvTXyi1qj0ueW7m+v2ccWY4ernC6Ix75YeHuKkJ4f39bM+f76cC1+CjU0+MPCIyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267571; c=relaxed/simple;
	bh=+y26FGfjN1LnTKbYOvV1M/8MSd/C0SMfb1h4AWi2sHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ms/E83bvw38sOw1PXMPLN8U41L9oqTglo732H5LAvfQQuT3SwOvS/CxGfsfktuDzhtUuPjqWUrG0wfFXKHjONOEizms0Y8v/hZ6JUYbWBn9j+YnZCb8SU+FuK41g9LPfcJ8YaB3feRKpo4E74aF+9kecrtwBUdC06e6DmSBzoDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=XazXTHZQ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fzGqLESh; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="XazXTHZQ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fzGqLESh"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681CXkfA1569437
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=nG03
	EFrhQ3xdhPt16h2vqt87y9zGCEMcI7dzmDL+xeU=; b=XazXTHZQbCzJHYJ6TIds
	CANk2snNeL3o34m6FnOzbDuUfVrGFtgi/oHJ6LQ//KMXybfMTM4x+DvjwaMWYz1R
	469RsoZRPHTS2lK82S9G5Mxg5fzQ3IFB/5MmLYmK84c180Y+RfIWZGRIJ/NqvdFl
	AE+lFoQNNFgt3/xN3Q1S1+deQAc6exLhs2zxbg0pzu7u/r/X4YliA4WClTdwJ1R4
	2W9UcQSE190FlnQZe1XG57UMeFzjbif7kdeoTQ5/RoYj88u1J1ez3xarxsS9Q876
	Ta3NZ3WxTqmkYqA/FJy1R9hd0A7s4icaFxAAhBH1yXeEs4kzG/Hsspv3pmJQPvok
	QA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gdhfhc048-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:59:28 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fc16ac179so19004171cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788267568; x=1788872368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nG03EFrhQ3xdhPt16h2vqt87y9zGCEMcI7dzmDL+xeU=;
        b=fzGqLEShaMEhT7LytwX6lleNhBj/KM+z9Ct3USjDkBxXK13wZjEQvxWaJ3rHeYzQ6+
         cqGAiLcs9dcv76AUSKecs69TUESGjrCUUUgnrZrR4l9bL25zWxiFIkCv5j8Z95RYMPfY
         XIqZBf5c6EznvsY/INQU+8iGcOSf7BPA14dfDWlp9ARlKUJ+OfCpW+ND9zx9Zz8Ub/zv
         WW19tc+AyYK3c3wvhyh3Xn1TSNLhizshCUZmNNG7QOK2Xmulaf/hDkSeEEVUYoCQbeiW
         l/DPY4ShbZgFyKRogoyE8Kpa327C33GuQMGDnWPHan/ukxkXwg1Lay8hT08MOi0UsZUJ
         r86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267568; x=1788872368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG03EFrhQ3xdhPt16h2vqt87y9zGCEMcI7dzmDL+xeU=;
        b=XXRYOKZpEcQQz2LUdWss6OD4+4xnuLulQ/N2FZi4FFJ85C6zgcMd+wXM1hWBR/d2A3
         s6Ue0KJUFJ0MoCsDsssnfjXSZvOAFwTjBd61gz8x83AkJO0Y8D0xMv3SvKQN40542/r0
         eCdkPAune1YBlu0rfeyweWyi8X3rSR58ZsZMEIL9DwVoS9EfG2TmMmvjCA4v2Exc1Rsi
         2A+c46P/tFpZKH79rFnf0UiWh413492eQTAfyWlObW9pm+OdyZLxFqtS74j7KlHbqyaY
         VT94Xaxxx0BjJSNIPNgQ4WqgJZWuDoC2WbajwIF40DeFnIZ/8XwBLhsJcILf4ffxdDX9
         UPIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbP0ekYoul3L33YrZi1uCsmK9ilAR/e5TxlyswmgBkxfLAjGjSipPuKIWAIGPyCvh5BpSmhBFm7kZWGmc=@vger.kernel.org
X-Gm-Message-State: AFuF++kxdJMrDJN/x02MI+VFxB9XsfvRo41WgFcSbhxnywB6hj4Dt9kr
	QKxyUukuvDus6y8Ct4g/doMZf30gbhH7Y8C8d7TNiZbEl9bEgFc7b+qnl0cKDekxMaF87gaRTIT
	gq6KlxhSuUpwvto6jGlQMXRCEX4nCa6y0AtXyhwzHnfKnUCGpTUCL4A7C+sV6qcgi3mKanxgxAr
	I=
X-Gm-Gg: AR+sD10i51eOfJLT/3nX0TACKsHVVRt7KmhrYWV63f8OKtKLv3lcpLbB70W52i2rxTY
	KYMBzWfwp/iBldTjmtRch8EXvwbD3SVVcYHONozMd4zVx4bkLTzLQFvkVUQybT8Z3lSgTiUEsEt
	TO4UfqcVXuKlnfVDHUGfERdQYfzfEzTa8HzT+ZpzCJZI5Yr6QKC7kjk5a3m3hGfpWlzzy9adCQP
	ib1DdRNw0g/Elb7tClcGYMj8047lyWmpA8pka7WL/Fr/wcZD+D3G/r/YWadYQfsFyaTse84LLnV
	FL6+FAxvXzCtUZa366IBkbQg3rJGOJIadWfyAq06UW0iXJ5u5OEQ2X1t7butEiTkxrBKVuV6NuR
	Ez3mvp1sbAixSvhCLyQxV2mtY+d1PYfuC757Gf/cnG9QnMO6l4Js=
X-Received: by 2002:a05:622a:1aa8:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-5302522caa1mr66139331cf.4.1788267568226;
        Tue, 01 Sep 2026 05:59:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-5302522caa1mr66138571cf.4.1788267567695;
        Tue, 01 Sep 2026 05:59:27 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe830222sm96194331cf.20.2026.09.01.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:59:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 01 Sep 2026 08:59:19 -0400
Subject: [PATCH 1/2] mm: remove unused mark_page_reserved()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mm-remove-unused-helpers-v1-1-f092d086f7dc@columbia.edu>
References: <20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu>
In-Reply-To: <20260901-mm-remove-unused-helpers-v1-0-f092d086f7dc@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788267565; l=769;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=+y26FGfjN1LnTKbYOvV1M/8MSd/C0SMfb1h4AWi2sHM=;
 b=khNF4ndV+FgniVmsA2xC2A5tULhBAoUaVrGa7vzG3126nk6/FaEMXk8v7zbZyfErmdJSCQ0EU
 grp/fjxsFcgACYD68GWBfOScmvnA8KKhnIylAzpqkrJ3iR+dmexBgfn
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNSBTYWx0ZWRfX/LJE7FOBsrHp
 l7+5E+VU+9coqZxECJwM/mUqKizbvKD+MDr8Xr6WB0wfvJVhdsUcevEhlTpOj5USlBLJ363ogHK
 R4zllBhyTmrbbzX9fICy527me3FNVE56V7LY3P3bxCa83b9KoGSmPgyeG5tKl7is1yjqfsWtd0v
 7dIJ+JwQRIZJ6A+l/rF6w1GxbvfNSQqN9lReZFFc2KCigk9L3nWLwwKo1kQ5hDbg2bFikzmz1Cx
 7//xsU3aRxQjMvXYV8ggvvZm1tgbcU4Zlm4bNUIBGb2Crb42RLPgv1S0WKdVHizGHLnjynDwHdM
 cnzlUVOPkaQY9WmNaeTs7JkIDXncdPnh3dYAdFEKEzqxAlfLNFMsyJVEg+Fsy/BqLQHMEI0pq7v
 +CozvtMJsfk65UBAsyOQ500HaGWnm4IKlUNw+5kSOVpsKLPZLAXNFjddD4cEwCVuD5Xpkt3PAgW
 bjiBSwJN3YMZ0EQNHQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNSBTYWx0ZWRfXxf+o+SlXN7L6
 0SjXp4upAYzzV1T4PTi6CmSGlkM62I2+43HVKm+k5OvSTr1TJydas5/WuTdN+w+EclelRcEWrhM
 AwevKiusYO7fzSRWXdChpCLAfZkDMwJkSWrFjNDt7m+IDIUqutB5
X-Proofpoint-GUID: 7zJHGziYfS6b1Uey4Hxa_YaIK17vQdp4
X-Proofpoint-ORIG-GUID: 7zJHGziYfS6b1Uey4Hxa_YaIK17vQdp4
X-Authority-Analysis: v=2.4 cv=Y8DIdBeN c=1 sm=1 tr=0 ts=6a96cc30 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=XhWKxFEwkI5CrsmnjUoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11892
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 suspectscore=0 spamscore=0 lowpriorityscore=10 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010115

mark_page_reserved() lost its last caller in commit 6215d9f4470f ("arch,
mm: consolidate empty_zero_page"). Remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/mm.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1b28e6fc8d5d..e3736c42c4db 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4080,12 +4080,6 @@ static inline void free_reserved_page(struct page *page)
 	free_reserved_pages(page, 0);
 }
 
-static inline void mark_page_reserved(struct page *page)
-{
-	SetPageReserved(page);
-	adjust_managed_page_count(page, -1);
-}
-
 static inline void free_reserved_ptdesc(struct ptdesc *pt)
 {
 	free_reserved_page(ptdesc_page(pt));

-- 
2.39.5

