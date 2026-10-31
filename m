Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793479521;
	b=uGPf+JYqnI+fmRxGSXg/y4cUTIi83lelK7a+yNHRvYwnFGwVcHza9LJhliApEqhkIWSW
	 1ep42+lksclOjfKj2vtPxqnAGjzwWc/BeA9iKVw4NSL/cxmu2PykwKY6WOGm+oj8J6mvL
	 5x/Df/YOTF7Bbu5tvNX8mAuGM18ApLEXT0/SPhCvCVkcLup290G9w5uqS15JbKAiCvvQe
	 /8qq2gvxkEhnjZhlnhcaLYIMzd4ZgtXJmOes11J6hUvzQn+XUisUZN+7U3Gsz0EbK0zX2
	 up1NYe7cDKJ3hktD4lMxoT/y14IWQCns/XEdHp5zvq/PCpTiEIxqxddxL/4eglClbKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793479521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ai8/m3ORx3SDFek14s5382kHx3xtwqviDFybZ71Yxpc=;
	b=YDmW2YFGvSGcdF/XVq9zOCDs5sSOcgZmgMm0Xq8Jx2hF7boxz2mVvtkOkCiXsfWqgoB7
	 QhyxJdoVOBrlZBw5Dti2MAmzWLZyY/UaNF6eiiYyy6KyQj7NWGKwX2e5EAaBicWi+/2p6
	 UXryHolRa46hlrUOaKQUWboWIegWr3Mx7pJGpF5g7eBirG/xoYCzm1YpEp1sq2V4qJUyH
	 NdqzLTCbPtWkdWM70i4eh2Ndie2tCJSjRaVp9zkIU3LCEBrsd3OIC48EHy1k5IaBXcXo7
	 J8ExyoR2Oq4g6Z2KSRnVlUrED97SCtB/r7HZaaV+z2h6PfVlC4V1x6XhJUoNY44UKDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="Fvrz7Gd/";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=oGblI6es;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EDE606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72EDE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Fvrz7Gd/;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=oGblI6es
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDmJB6061681
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ai8/
	m3ORx3SDFek14s5382kHx3xtwqviDFybZ71Yxpc=; b=Fvrz7Gd/xEKLA0Avui7n
	zfo8HkRANkh99NliYjIXJcykbv7MXLl5ZZ2keep9+WGLjOb0xzb8nsEq7yMHMeTk
	ZeKGNRdarUzg8a1d/FXOBnYywZuGhMbkxjoCvi4fM8K62X9iXO0QjSXqgsn86WzE
	jLIRl+jYAewlUJ0q8pVabuBMZ2EzP1qjF/a/3IJRGFvVu5EqolOM3F/c1BTyGPj6
	ODgGDWmnNqLgNlsWluAgIluiG9UuVEXZDAj5N0/H0fvKC0CddhL2cHBZ1BvMwA63
	gFKi4Ay+OLJ9MATz4mi/U487eZGq9gT2+tSw+J0d2NDwbREdzxvYiTkyMo1iz6RT
	+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hnccxu8d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:45:19 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so302991085a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793479519; x=1794084319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ai8/m3ORx3SDFek14s5382kHx3xtwqviDFybZ71Yxpc=;
        b=oGblI6esEhM7tDXmXA/RNU82u4nG7FCTd2V6LTrQjQU+CMf8tZKY5Kq9bgrw6bjUBY
         ZLZlyNr2K5LWTXf7rf4a81Y/ioYTATwqgMmcb3ItaA2QN5Nph51gH+dlnYmHhOsfQuaY
         284qCH3f95WW8fzdwQAbd8uShilJFj9c7i5a7x5umELw1Ly02jpykPi15WaOK6GMRiY3
         loNE1Eqzee/TbW1BqgLOPQXsvbIxv9ZtJ4aiZlJ1W1pzZlnRxZUeLG5y2Wd51QjkRlgH
         PeqDjLEyzVPuwPpTeLqbgJaJKDCO1w2MG68xnRGLI8rC2PjBhtcGWJkRGCeU84zz5hMP
         mP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479519; x=1794084319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai8/m3ORx3SDFek14s5382kHx3xtwqviDFybZ71Yxpc=;
        b=CVK7LLTd92IQLTcPHGLrYQh1O7W/tpc18s1cdCrX9JydUGOng86almDZsTFA5LWJ6o
         WtbQYIiJR8pLAqdoMAAFUYB4WZiGflrV9GYtoWFsc6xHJ/s+tuMLw+2TGftAUVR/+WGR
         VsOMeE06D14RWRolrUFN+hyLTU8v0GRJ6z7/7n6TQGo8Yv4+mnRRj5akZ7ifqj5nnBTg
         txAVzNhVaNWCnYLlPPF4QYdEZKBefQf7BUIPxumrCiFJE6Dt8LVVgExCu2Cpt4kURL8c
         QbU+QUu9VHndhbu+hdhBvTqMXuhoYcEsVrLsrCNPtC7nchbVBoV/rw1aPrlPxLhUHTNU
         /GCw==
X-Forwarded-Encrypted: i=1; AKwUvBzwNQoJm5TR8X4RkLBJjYsu4fwXymNpnhQMnrLhrJs+skL6smJOXmJ0xdG4QRcSugJghNp6NjFEa9CFvaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqPeUhUbxXiALUSNa5iF/RQhYEd+Oy1UgEwGY2eTs6ZZg2/4h5
	KdU7QNC2OX8cOE2z5DiNd8s+/fTQUjwIXvs9BhSpeA1xeZMtJjicgU/nXrofeeHbP5zmc5he2Pp
	GaG7f9JXTd0Ns5UTj6Un/R4fjyS56xfyh1VOeLTk2ww0WLhuY++6Hzv/t/gf/oI6Nk0cS/w==
X-Gm-Gg: AYBFou1M7LcZayS0M2BYfxT//z+GeXKlggiTNlXMCvO++uh0YlZ9ORMtipZw6o0EPcx
	rxKsMEUyaLNqHm5wfvZzdfRHNPk9+jo9NNhb3zbt+pGFQ8XYXuaO7e3nX2W3KoA1UNRiaPq68LL
	XFVHgoscbXfw/LFqTmrG/yxwgZm/r02MT2mUcw4Tdvm1G62h1NcGT8iR8afsSK+6FsdJ+2xkXw9
	DTBSr9KJSTcaVS9XIJ8SYjjhR5S9fzG3nZt3mmFkDdscAvUYrQ+07PIwt2mA5pS6vuHyR3nyVxn
	qcz3pxwJ65jha0OCBMhCQB2bpXjWG99fFbKqCy07JHHntcHKXvGStpE07qaQLLka4eIusmvyZ46
	bbA/H4DgTEJ8g0TosVLjfn2sshBwqYpOOgi/iV85WC3ZQwcgToLqgjuypiQg=
X-Received: by 2002:a05:620a:1a0e:b0:93e:95ce:539c with SMTP id af79cd13be357-94421584b5emr961471385a.2.1793479518774;
        Sat, 31 Oct 2026 13:45:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:93e:95ce:539c with SMTP id af79cd13be357-94421584b5emr961469985a.2.1793479518355;
        Sat, 31 Oct 2026 13:45:18 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.155.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm104242845e9.2.2026.10.31.13.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:45:16 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 16:44:54 -0400
Subject: [PATCH 2/2] arm64: mte: drop the huge zero folio check in
 __access_remote_tags()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-arm64-mte-folio-v1-2-a8bc2960d11e@columbia.edu>
References: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
In-Reply-To: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793479509; l=1038;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=wJzy+6jZ9FNUZA+CYa8tCkf+lYaM64n7ZqisEdf29gY=;
 b=pmuTULaOCJqENTjQZWYbUcM88382x7yBPaM69wtTYQIjChLdg+Xw7STo2k39LEOW2iJjyMrCA
 9E2Z5Ey/XGnCCLEEfhp55O31R0s88gukfg0g0/M7ix6SKPfv3smoAr5
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfX7AAqoYssaCEh
 BbSfJp1cQytmE4jXhmSl4g76rBs1hRGGrmIvIV/VqNm7YpWueCoU05ZJAcY//z1Yz5YKBrDmy/9
 vrlTJba+D9WOvI9AjRVWmYfo5x7jfjGZE01mFE98pshb+/G3y2U0kSKn0spk2Khddi2e7iBIRhx
 gwOgfFVxt4F+T3HxQ+RIagxqktvveVxrQU7S9V1L5ygUUxD8viCLiIO3x9Y21TRDtz9M2qobw5G
 hHx2/YM3om6jiVkvdw7BHPuk++SdfHnNlzGiU5NhOaXt56B1Y5kyO6WjjS1OoFmiWWISMpPYes9
 gmk/0IaW1Y0bT/ZSFyilx9mbB+YMsPgW2d9Tb5eTU+97tJAyFG5k9c0ivHBskal2BgE5/9eHS6E
 VktQnITy5S+MOpP57KScE/jr66uCDNMl53rlymts34aKFOK35uMi8itmhTzj0d0XoXYZ6OvnlSd
 EspslN2xXuDqj3AYFDg==
X-Authority-Analysis: v=2.4 cv=XKSl2ghE c=1 sm=1 tr=0 ts=6ae6535f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=OyQKmhT2Qqi7aVZxTY5mBQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=xKJDtGlsPQfC2qmXs3QA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RCPB9FhXU7DFgo0kMBCCn-bIR54PanS2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfX+8X6Uui8ADxp
 jxmEFwadAREYoHeNkiXGz8c97mMVjBRiFlUjz94QNh/0/owLhodGh0LPH+gmzj6n5sZQ3M4V9Ap
 rNQU3VrqfBX1L3Y7xwKKEie400UUICINPiJchjiyZ7mQySgBTLp8
X-Proofpoint-GUID: RCPB9FhXU7DFgo0kMBCCn-bIR54PanS2
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 malwarescore=0 lowpriorityscore=10
 clxscore=1015 bulkscore=10 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310082

Commit adfb6609c680 ("mm/huge_memory: initialise the tags of the huge
zero folio") added an is_huge_zero_folio() check to the hugetlb branch,
but the huge zero folio is a THP, so it is never reached. It doesn't
need to be checked in the other branch either, as its pages are tagged
by __GFP_ZEROTAGS on allocation. Remove the check.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/kernel/mte.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index f8d39e70857e..8615732567e6 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -483,8 +483,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 		}
 
 		if (folio_test_hugetlb(folio))
-			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio) &&
-				     !is_huge_zero_folio(folio));
+			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio));
 		else
 			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_folio(folio));
 

-- 
2.39.5

