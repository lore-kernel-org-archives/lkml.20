Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD005314D34
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030578; cv=none; b=JcPV2roFhZOxbyUZ4+P00hWFilLQAjdlt9ejeAmkv97+yhy3l9Rc4a3GjCwGWdhLQvjNjKTBrxD4bw9bX0iNeKgmXQCNKvG0PAPkMiHhZz0iBtYeco91/4wqgofo83m7lwwD6MHCJLZRryuvNzGfPsA4u76sddKuDl2k+RiMgig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030578; c=relaxed/simple;
	bh=QedbLtwO1bl04qwn37+9AdqEh2edhW9SRIQ3dAFkoUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLkthKnfFDPQJIrOAZoJcWHVw+ae2mZ49cHLSShxDJz0oCz46AarQCc/3zl8I+coaOIgQIMPIhiqsKJ3PZ3S03xP+9+W5nfap4vCIgEaf82lccp728CIhfC+7/dL6eNLNudBzyYGWMLGAQLZUxBK3sXJSsKjYdk3AZt2oh27knQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=MbNwJo/o; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=E8pkcVCa; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="MbNwJo/o";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="E8pkcVCa"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIZoxp1326937
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=nQnT
	j8WyNgh95RWq+FBqUqVmKUSQV9sehx4eFG/qu5Q=; b=MbNwJo/oOFvXzgGaKqxu
	dArcfBoaWYaY/Rh5AYkReelp8z5kl0rUUPGnU84J/adob7VIpR6/daVtf7oVFzCE
	O8zt9OlsTYzv3xwYqJj0xKHRyEHc51l5D1LeZdswdhDSPdX5Qby7FZXSWQhbd0Iy
	byQyjRmg6uLAvYkf9hYUbXuma6lXnmNXJNBk81NVXTSrZw4W82dV83S2m25pweqB
	VXBbbcUBaSv936NO5brWM4bbLNUh958dCVCszwNEMw9sJSd0aZe92bWr8g9txi++
	oAoe0yKJ1xmhXcZBy+rfFCdGIjCE3cJQ2D45pfRmx4IeXCntEFYtAIC9JliQQS63
	hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbqxhb5ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:35 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fc0097865so51176881cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788030575; x=1788635375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQnTj8WyNgh95RWq+FBqUqVmKUSQV9sehx4eFG/qu5Q=;
        b=E8pkcVCaYYSDSkCHTZnSskkXnyJAGEOXJCKZMEWaRVRLB4zdyfnNRt1OkJLGrmhF5s
         Y8CyDApzZwUAnAzLPgX6HG2DttUtP+Pbj8MT3qKNWI7nk42ECep2RPePuO//yQw+X10f
         8vEGqJSycfn7ksssp/J2xPoQ6btSXEsMtmBLmnkK0iaZALeonAWIvn7FkTYihRDQD9ez
         0RT0y9psE9G11gEiCSi9azjcnmQHN+3cFI2DQv8g3cdoOFV7/hbBjUG1t9gI7kfu9XR2
         zUQuthQenm3Mfn0Ksm5ezAn3W53RY3i6R/6XbR21QXiMak1iEeIiAIKL5oMZdPhtwnVp
         xFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030575; x=1788635375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQnTj8WyNgh95RWq+FBqUqVmKUSQV9sehx4eFG/qu5Q=;
        b=n0B6zsPU2jRtTJmFarVLrh/GwqQL9GB076K/YLviW2AaDG2QFPsG29OXbsvQB2xWA3
         FODw3oBJ8XsyT+i2hKZVb06F/DT0AmnvmTbHQhS0ymykK3/1mea4t9WLdjqqTNI4dXpC
         Rs44yKpB2jGn6OfiRHghQQvfkte6hYF2JQhanfj6FBpGKMWoVB/Ed7WYN5UP6Mzbvu0C
         VTzUndhBrOL+JLa3i7LGM/ZXmU9lY29HicGuaO79yXq6vU3KTVBbzSs6+f5EoOyEAdK9
         EeiQAjPaDOJSXTiWVgI77xl7UiUXJj9aFiirVW951Sefcx5dVYMZ5/tL23dnj0uAXMWD
         me5A==
X-Forwarded-Encrypted: i=1; AHgh+RpplrYfBmULW3lYl4A3lEMSjfy7kWQ1k5z1UfHeJQc47DzIG2yCP3Cz5xKIqt3h0Bou+mPJYmKb/XDK+wk=@vger.kernel.org
X-Gm-Message-State: AFuF++k69I5+nFhf7jN/GcGproF45g2nFDjJqrYguzmbQm8u45ZCKPcr
	MKaHR6glkfeDq48Lyd3x0xUj7je8vyEmDywxczaGOBIe5mHKHYkiMKLzfLd1LHticInBCIzOrBj
	b6Zq3J958tEjd9kc0BuOWNrLJByQ5Zh6lYIjGUAeuxqhu/P12PbGOT+T6jN9xgQ==
X-Gm-Gg: AR+sD13mHb96MnaGTTfZK1F17mC2q5xoKilz879y1JVEkcBf/B21wgT1nLUpMZNZDCr
	JTe3P0LRqEe0xKan8f/KtHnNv0PSDpAZLyPX8rPug3piY8WrAFNvKrZGeUuCxFfeeV/HKKrqU3t
	H94VVGfrLH3CLNhTeUOTw3gE/l5FEYypxbFNtqX7eUO2Q5TAy+vbj6BRlKCm/kDUuUjhtj0cfxJ
	Tnh5n4XigJkEbHjyZ+ld07qJXtOUn1unDrc1ge2+GzhfbfjeCT+WRFvY9DPptVVchuhtal/c7kt
	Pf+oiELXvo5XIgIsuBYXAS1Rh6oKAMx0wpj5eGAVLqyrteCWeENq6cnZ3y7N6fIg8dSkXSULOL+
	ykx+Td7aWDMRfx1vKNq8Oeje+5zCd3AN9WoVw8L4x6w==
X-Received: by 2002:a05:622a:8414:10b0:52f:f73c:3269 with SMTP id d75a77b69052e-52ff73c39b4mr56517141cf.36.1788030574910;
        Sat, 29 Aug 2026 12:09:34 -0700 (PDT)
X-Received: by 2002:a05:622a:8414:10b0:52f:f73c:3269 with SMTP id d75a77b69052e-52ff73c39b4mr56516771cf.36.1788030574464;
        Sat, 29 Aug 2026 12:09:34 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm239150095e9.10.2026.08.29.12.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:09:33 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 29 Aug 2026 15:09:04 -0400
Subject: [PATCH v2 5/6] mm/page_io: refer to folios in swap_writeout()
 comments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-b4-page_io-folios-v2-5-649728091117@columbia.edu>
References: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
In-Reply-To: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>,
        Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788030553; l=1249;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QedbLtwO1bl04qwn37+9AdqEh2edhW9SRIQ3dAFkoUI=;
 b=U8hj8IA61aQIhcJjWSFwrECbO/7tmhgfcOkLobf5HmVWEn/qq18Q98/VuNH9J3ybPrBIFVkco
 FVCx1y2MZkTDta4hk9UW3dzHIwoLpBRw+5wVCYLfTVlPZ5mOOmUCRqg
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX33piVu1v4sW6
 xpFvtv71HkI0siHRURIMamuNjUqx3UXLgmNgmvZM1yghJPQuwiB3Zn9ChJ3Izet4YMbPtFLC/8m
 pV+a7C+yWCCVccdccF3pXIhn7yDtXjXqEZf8IEBsZjpTeB2urPMu
X-Proofpoint-ORIG-GUID: YdI9ZXJn7sCCUVbZYqy0mj3nyhYmusPD
X-Proofpoint-GUID: YdI9ZXJn7sCCUVbZYqy0mj3nyhYmusPD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX2nF6ZoQQjhAr
 cD1UZX7tRvvmh4B5jTnhy1Iy3uqrwg3KPg4UePtRRijFb/fI041zl9fkE+WhY/J9fWTgLoQl24a
 w2+alo9you0u11OIK5w+dmkf+H852sFH8bUIf6rS0ktWJOhAqYHz17jy9h8/ONi3e2terkIgmxl
 cgPLQQvFgY2E8iQHLmGOWMtGo9yHdu8nwJ7nsm6p/QGDHrm7xCrYSpElD7pPLSzhdWcwPNHmjdx
 1Ce8e25/++zAB4ArR4hdiWEfstZ/jfrpv0tJvA4VXLY+gjwAH2gd0iiwYDRR4YXapgrfaP8hGCe
 KcIvM8KEKNHuWaSGNHpInlwQA5UWhvvl2EK5b+lfb3CGm/63Wp87neFdE593Omn4KrReGRkMiNg
 7GsDByPIlgOnrAZu5FoSH8yH+5fuS6qlq+605gv23NjvxFuRSS7bDHK1WR4sRi1bMp/E7VtSv8A
 zeu1TtRL7Ui0hxftFAw==
X-Authority-Analysis: v=2.4 cv=MJpQXsZl c=1 sm=1 tr=0 ts=6a932e6f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=ufHFDILaAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=o9dMDrf0hGvVio-mgDUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=ZmIg1sZ3JBWsdXgziEIF:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 bulkscore=10 adultscore=0
 impostorscore=10 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290165

swap_writeout() operates on folios, not pages. Update its comments
accordingly.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/page_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 295cc6ac6244..36466159cf19 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -209,7 +209,7 @@ int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 		goto out_unlock;
 
 	/*
-	 * Arch code may have to preserve more data than just the page
+	 * Arch code may have to preserve more data than just the folio
 	 * contents, e.g. memory tags.
 	 */
 	ret = arch_prepare_to_swap(folio);
@@ -220,7 +220,7 @@ int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 
 	/*
 	 * Use the swap table zero mark to avoid doing IO for zero-filled
-	 * pages. The zero mark is protected by the cluster lock, which is
+	 * folios. The zero mark is protected by the cluster lock, which is
 	 * acquired internally by swap_zeromap_folio_set/clear.
 	 */
 	if (is_folio_zero_filled(folio)) {

-- 
2.39.5

