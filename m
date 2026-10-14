Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C8A4EB865
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997717; cv=none; b=GTvhpcGsEH6V6Ahf9WBVCTwcrIcudva4Y8udUTmj3wyZgGJEneGy7Fn/smphwuo3EarVgZROqf0AmG8AA/f29Q4BygR4sxeCVgNfGyh1LUxHvEBR7MFs2SfVczOy/SnhzmJaAPqb5Ge+x+/iMUoKyH5f4J4uoyRusEIRN67/oP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997717; c=relaxed/simple;
	bh=hwfXrW/EvomtAm4NrtmoVlI/5Xl6aGcl4UefFobW4W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yei30yIiip5RttiLyetxOjqt6SQxkRNaWoLTxzpFnw4/GC+fxwE17rnIR/PKhJLneT+VvNWfKmUh/snzmm/Nk7hNaAVt6mG/7RFkXhDLlDqtoG3V2V0JV4aw8qdh0x9BOsDAhIWSxV13BdP7AlKQIxZfjiJSEauTHSz+xaUJNy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=LsXzq1cv; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=1SJjmi1g; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="LsXzq1cv";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="1SJjmi1g"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGYRHA3099203
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=wvjq
	WmYMUiWctt9uBifSZeGbTvHPcL4+6cXa4k8By7g=; b=LsXzq1cvAORo8xB3WYL/
	M79uZ9MXS+5I2WdaA6VMhwqPsLyjj/cwfATCQIqVbZoSasTKw7AdYnwUsaWdGC6A
	hcMfTZBz7X0XuOmSvcLmG5/RwI3YpcZb3cLTc8MOkhHJTwYkfz1cA/AvCX6VlAwm
	vCtoQufw9pAfJ/Q8mfiynMRT8ZtUJ2JVrtIysCWCLbQetZgDQt6yxj6vuhyq8dhs
	0tWgnJ6NU3AXFiDN6+XyZc7tSoXQWIYoVnzXn3OP8Z8WSCTxmy75aCbKuKFtYYxq
	CoJd20bZvdrFHlgCYpXG4qE8AGjMAjl2o3N2+CcPpQemJnH5mfS3PDrvueNREq5g
	fA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ha9ctk2ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:08:29 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b529a8610so12818786d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791997709; x=1792602509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvjqWmYMUiWctt9uBifSZeGbTvHPcL4+6cXa4k8By7g=;
        b=1SJjmi1gA4WWGufr4YDhfTqAV6EAcbnUtTZbQSsP3pIKv1A77p7fBWbMoa9O5TrHRB
         WkbUE0xCw3MEm8SfxjjVY73LMouFWrSbWTNgTL1GCtYj9jEJERJHBn93shyXmphsCVJh
         4rkhdvAXJEbeS0bwxIqoK7dUaoKhHAUldXWTnhWx0GbWGCNQ6nTalQY0nVPaQqGxqz30
         qHJxD7smJbi8ukVeZ6woatzrzm0+/QjnKRMW9vZCvKNX+ZNyZpE6sHKkk6AMfk+hKLGP
         rldnSzm/0OQc1EFJZ5q42UIWZWySjoCSrbSF5bxOu7qj4jX1PSmyokwQPKx7wfMNn4UT
         Lpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997709; x=1792602509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvjqWmYMUiWctt9uBifSZeGbTvHPcL4+6cXa4k8By7g=;
        b=jgNC0LSUEo147r4nzziIFTUAMs3BDzORyT/qIU+jMVxbCWs4c86USem1SQTTKyJxDC
         eOFkhhi49n+HFVlNilkGy+yfvhXOUXbe0MErRx5V6QkHfuBO3W/TH69q2ig1SfqxyF1N
         Wr4Avb7uB//XIvQsrjtmXR46abBMeFyHmq5ZBO9x+MhRRGRd8FZR49QA+R0OJqNJkmDI
         EDACXZzn1WAN4cIaXfhsd1wy0eFDhkAOVFNWLBQXhHV2CxV+dkwDCwnKKtAWw+eGkvdK
         WCeQrISvdXI7z/bOqUe6862Cc+o8v3l3S3cZwyRkz6uNSpzVnXtnDYpaNqJpPEoyUqbP
         bC6A==
X-Forwarded-Encrypted: i=1; AKwUvBwsdlm6yeDSwHHxhnc89KVNsLhh2dE+ayw+SePxJRhSZOEC7oBssLOn4MYXSuUVtQgoOE5D1hIVO+30JhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE6UkDx6Mx1fKFUF7eEioeUBmeNUWuZ4JJVA6pCsyzV3NMsRaw
	iLgwEZBNq5StLvhzShI8LUXTjVmOqiuqDGUmuA9fKCjfFmOwHyBQCk9C7LmYHVUiJ9YyzAmgH+s
	KmruTjG7dNjC+GGHeWE/66oBlOFO1AQm87iFV24Hq0OO1PXhF8qhU/lYMROb1bg==
X-Gm-Gg: AYBFou1X0AesC+lNGUu65extp4nWVP/49CWXutKRt5z8mgc9VFBwtpY5mYVxGGxd2wA
	kSdHs9WlcTjSiVKa8LPr1LTF98hwaDoUR/E4FF3eAgcIoSaeBgGtz/8lXd5HuFuNLONt8xDbYYs
	hHdM1HaoVIf2TFhoWojPMMlNBHOyMHmbiYuLZ+2pST3nCW5FLD+4p+Jfujlj9CuHrSITWSrQq6W
	SjJ9uo9czpLExlyWDD99OirG3fb7OMyWOcpQd0FGpOwu/TO+9/qQI7dEBZ1CvxiezvGE8aEGUoY
	sln6LA4koNhIcpzTEho5CRKUaCew/LIRAf0wzA6oewe+KkHFFGMdC2SeVDnP5TWwcbZKgQLAQ0k
	mEo6vqwBSwhQgPHgqYMdZ3KkNrr+qwjJBKZkruy7DDTwf0OU=
X-Received: by 2002:a05:6214:2524:b0:917:aeec:a168 with SMTP id 6a1803df08f44-91b5532c8e9mr267544046d6.2.1791997708774;
        Wed, 14 Oct 2026 10:08:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2524:b0:917:aeec:a168 with SMTP id 6a1803df08f44-91b5532c8e9mr267543326d6.2.1791997708075;
        Wed, 14 Oct 2026 10:08:28 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-148.net.columbia.edu. [128.59.176.148])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b9bda8643sm49190116d6.25.2026.10.14.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:08:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 13:08:21 -0400
Subject: [PATCH 2/2] mm: memcontrol: remove page_memcg_check()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-memcg-unused-page-helpers-v1-2-240b37c53831@columbia.edu>
References: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
In-Reply-To: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791997705; l=1282;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hwfXrW/EvomtAm4NrtmoVlI/5Xl6aGcl4UefFobW4W0=;
 b=TZ1ZoYpyxWx8/N/dvvOcZk3ivGbLWSEy1vFeU3AtXGJupMue7wcYcSNO3eJG9IivQ0ZJ2RAhb
 y1B7LNZP21rDHAEmJ+aoDG9vlhr0/yR4e7puZzOKm1fw5Xpuis+XXPB
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: T0wc1cOqWTuuGfOK4oRvuHVbbIpZQp-B
X-Proofpoint-ORIG-GUID: T0wc1cOqWTuuGfOK4oRvuHVbbIpZQp-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX9hWkUnQjVPXH
 gOhp4iVB3mZ9cSisxIW5d6nj6avOuAncDi/ms0MgJgUyNiQNCPAEKKkG+8qDF0eESHc2apvOmzk
 aR3jbnzDsFF9hoxTIhUONHjLHpAMjs4D4lIKNLr0D7omh+3KAPRq/UuyYmBMdmQ6aPngjceOPeb
 HAYpLpyKO2+UdGitPs3UL4O13l+a2eN0GamZwyR9nX0fWs2MGHp0XSlchPFC80M7wv9G+weDFaf
 UXiHOR7ustYtLfcZSk0d21JgFozABxGAoGecSEpAZuo6h6vZ5g3AoA3WdeJ0s0gfJVYgetV9lZ/
 M+EDGPj092wnU80JoKjp+zplqRvXrQvwHWIfTBN8RC3RM3grvLR2hK4tYFwy68/Qrl48h491Gz7
 zAPiPEfRX53ThkuEYczMqW8cMfjSVIi/kkRadM59I4T4IsjhgVE/rkzxxqQd0WvSbW6Ud28ahad
 qiraF6tlpOzpCf/RMvA==
X-Authority-Analysis: v=2.4 cv=FLCOVOos c=1 sm=1 tr=0 ts=6acfb70d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dxtdfZqDOO0kCslK4e47hQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=ji2j2xl9BP2pTznAyDMA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfXxdncIbYAxPX/
 3fkbayKfO55fpt1cDH7Fc52tNud8/gmu7fjEedZL8sJ/lV2cNJvDT/XnYXQZkml+NHZLIn16YhB
 zrUIYcwDZEpAkmat/+xFbUZOmRangErSAkKzjzNY+jQbdAvaB/kj
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=10 lowpriorityscore=10 impostorscore=10 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068

The last caller was removed in commit 90f095b816e2 ("mm/page_owner: use
memcg_data snapshot to avoid TOCTOU in print_page_owner_memcg()").
Remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index b65a2d0fca3a..33439e285d94 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -499,13 +499,6 @@ static inline struct mem_cgroup *folio_memcg_check(const struct folio *folio)
 	return obj_cgroup_memcg(objcg);
 }
 
-static inline struct mem_cgroup *page_memcg_check(const struct page *page)
-{
-	if (PageTail(page))
-		return NULL;
-	return folio_memcg_check((const struct folio *)page);
-}
-
 static inline struct mem_cgroup *get_mem_cgroup_from_objcg(const struct obj_cgroup *objcg)
 {
 	struct mem_cgroup *memcg;
@@ -1089,11 +1082,6 @@ static inline struct mem_cgroup *folio_memcg_check(const struct folio *folio)
 	return NULL;
 }
 
-static inline struct mem_cgroup *page_memcg_check(const struct page *page)
-{
-	return NULL;
-}
-
 static inline struct mem_cgroup *get_mem_cgroup_from_objcg(const struct obj_cgroup *objcg)
 {
 	return NULL;

-- 
2.39.5

