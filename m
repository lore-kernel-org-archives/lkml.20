Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564190;
	b=kpdxNM/iq+RlAE9tDIC6wWFKyJ5prO9bzEUbMqwLm8pcsW6Q+FQqNQbgVary3HZfdisM
	 Fd/tokCTxd/upm5JHpeNehFgaIvuCs8xBRFcukHuNtndWO2nPSDM0B98GcRdLo11pIHvf
	 lbaCEvxDKvdH1JXnKto4EP+PZZn/0TP3IIPkYQf4X1I8f5S03aZpETLfr0Gklw24C0xGv
	 sZKbBpz2fOapH12luq0dkE22W2TXzHZ/yhKwfjf14XcyitJNRYIGU3y5CIHnbNblZsffJ
	 TsGjRZqwxdl8YhmJ8IvlFezoW1ErbZo2z0kG81YOgbULvzIMfuDqYGy4mfL9hhy0NDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BtqvH3vjepU6l8Kv/btHJpUB6/evyy2CtbBRVPfKP2g=;
	b=0OOiy8/31j2b9KkH5NJ4STKHKYVwsRLvutZEAKKXoJ9o/xCcnOksrEpwOMQJexo5qf5I
	 ZYx3xXwwuYUXNVdtXFhlr7mpQEITIb7GmHWcflCBCdSPS28hrBPkjuZjWUxHmdJb0G+4m
	 zbgHwqFm3yzyWX3bBCgVZm1yAgJXhdPDwocLU9DTetB6FUVnsChOnjwD2XtN/FJKLieo5
	 n/WQqNbXoYjVsEjjYL/IcW9RNIWdnwWJr4YySowItQduRv4DW8vSakO4kPVZpTDq5tMiL
	 ZTFCN+fariX67GMg//roc8uUJpeA09xm1kG7AJ9V7R/6LouUss+TQKe3F+Dmc0/Z1ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="BOTP6sX/";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=DKuIAHzK;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F378606A332
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F378606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=BOTP6sX/;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=DKuIAHzK
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1Eoqli3063949
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 15:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Btqv
	H3vjepU6l8Kv/btHJpUB6/evyy2CtbBRVPfKP2g=; b=BOTP6sX/PA1KGMzNmpuj
	GA2x+BC6ZMwFxS5xglAmXbYWr/bJlTE5WAVQjiVB25TU0ySljkagQW6hjtyb69TI
	A2jtVV9bHmm851HLuUlE7y6ABcJ8SjzbKPxws6UcqklSqdkRqqz+pkVNSiQqZlRf
	etPckgxXVKmGU0hL4GUZ2aejLMKe1A88R8kxAzoc1M/TZbmK1x3pZaZ3Ou5mHX9f
	rwbFLfvJHNaYAmaraiVkSQ0TmDoEosBTkG+1Sk5mADjAku9Up2Aq5uCrTrZyCIOW
	P0O8YMygDnV16oy6TqganDPB8NuiiRfLwdfMbmy+HhEC3BJKgGKufEzaaQrFQhWl
	RA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hp7huhh7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:16:28 -0500 (EST)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso402985137.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793564187; x=1794168987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtqvH3vjepU6l8Kv/btHJpUB6/evyy2CtbBRVPfKP2g=;
        b=DKuIAHzKARzeprpqHeJ7BbvEloeJDiVMWpiA2qxqL0MlhLQnb+PX2qYMccKC8U0gSN
         RBJ2o/ysQu6l7IBFGQbUSSttxE+VJvqb2epClRSETJVc2jtMZst5OO2QbrubaRkdOFxM
         6Yzo5SgI/TqxkyjE/NakWTHP2uLk8GtoeUHpjQu1LqK7oFhL6NNBcGeMPQ0HnUkr4Rbn
         gsk73N7PLw2LIPHnT6Ha/HZcnTZPXgFBcE4I8F+o8AjOtD+8SJ/QCihB5buQpBgLNvXD
         zeQ/EJ2Bd9cSAJ+UaOlOpEU3GypslI1tlkCNWiXuqndhNfjo1AL4d3WjCspJ2qtiGV1+
         VDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564187; x=1794168987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtqvH3vjepU6l8Kv/btHJpUB6/evyy2CtbBRVPfKP2g=;
        b=c1UMW7zwkpDmxTIL4/vfyBG/tvWfN66YxYtGBtpSXXSPN9atohP8ExqHGTbteKH73B
         rCCYoYXK/TVavHLLA2SHSAooO7axmSUnR8HjpgyBhythNIIDmunFm/wN+cg0bE9fbo50
         ubBcyR9oNVzQZ0v0hulTdrwCSbHMuZPZCADeiQVPQrqXMvXuTpneHjhQXBt1M+SpHJuj
         N1Z5uQ6VeUmauAR/9teQXY7vHn/Ky6dbFj6+9t5s3/aGvtXXsixgx//LxH2a7w2DXh04
         m5IDWcuHJYJtJ7wcnQQ2ibHx+0JF2fm7VAcLRrKKTHgpH5hCEUBvyF7+jjRnV3s/dmF7
         LWfw==
X-Forwarded-Encrypted: i=1; AKwUvBytbWlSzpolLMMIYGHjSvvn6uVoq2NDk+7GV97BnvMh3bSpzwiWR1KW6xOUHI8aXmf3uoMTDz5Ic8fuLlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8se2gnV1nCh9te6kowQaW/J2JSYF3/R4RA++gY3a8MME6QxQj2
	Euon+SKFobvW9lpPnMWlvH5TkkgAIvTMrq5FdmeUZib6gL52MW/gBqkZEhK+sIBzs4zWUPEIWqX
	0lmefG5V/csA0Ws+rlgg6XZJEp4qhNs5vd7i/Xe+ySvEDYVCPEQUaTKdw83h44uXgGTWn2Q==
X-Gm-Gg: AYBFou3gGls6U+/fEDK2rD/HHmOdoTWQVgwy7DJWkWgxUJBbZZntOJUwcSO/6zyjaTI
	kC7nz2kP0szcy7ekLkQmRVoUBIQn4N/ShpcrCGb2AcgA75Yt8R75+sY9y3mXCUWuW4R7ol/C5Ru
	QEocUCgiELUA4V2GrMmYyeSnODSt2ywQRdh/2al3Akm7H0lS6XqBfV+41qkQgAI5iP/th2U/mZB
	KycTDV4mVoWrMOpuHB2h9OCedQumYIvPxp1U4aOmHNJ2D6wdUE890sGSGuFQPrtdkkDtkpOvxNf
	as+FT3mrnUA9VcrxlP+PfeTrygSPMbFRrlQFqeam1HnZiWbCyOX3mtFmyeHxNVM3GK/Lg6gmntD
	JuSYl8dN6DbsT071Cx1hhE/5iqQA9Ue/wEquMnd0/BF2g597QkZuOk9JpqSU=
X-Received: by 2002:a05:6102:549e:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d072719b19mr3163946137.34.1793564187641;
        Sun, 01 Nov 2026 12:16:27 -0800 (PST)
X-Received: by 2002:a05:6102:549e:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d072719b19mr3163939137.34.1793564187191;
        Sun, 01 Nov 2026 12:16:27 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm15661423f8f.23.2026.11.01.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:16:26 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 01 Nov 2026 15:16:13 -0500
Subject: [PATCH 1/2] fscrypt: remove fscrypt_pagecache_page()
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
Message-Id: <20261101-fscrypt-page-helpers-v1-1-bcfbfaf6a237@columbia.edu>
References: <20261101-fscrypt-page-helpers-v1-0-bcfbfaf6a237@columbia.edu>
In-Reply-To: <20261101-fscrypt-page-helpers-v1-0-bcfbfaf6a237@columbia.edu>
To: Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793564181; l=1135;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=j0hglxfyXQKr4eI/+mHHcYxjY14CPbJUF3O9KwDO6K4=;
 b=c4dstX3JRXxdB6ucCvo+OW3XPyEFk8X21W409qAFvQSDcMAN2YAqAMtnHoOSQjwrnwNU0mR0Z
 n6Lq7+BaLbEChSq9oA6w8DgvOHtoEaAtWbYw2K89wsCYwQD4tGXIeLm
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4MCBTYWx0ZWRfX+pUp3YCLk3Y9
 b9suCJg+1nnFQA9gDd3BbsSiFci+sDk6DdQJu1Aj8awulDPuI7cfzZCq7Bnvr57xR4dhzy3NgY0
 LQAaO1MzpoB+gFIUR8CNCKjTgHg8PFfKXlXbSdw4Qmgl/OKlmejgA4RWvRlayGAbApT5jOgrS60
 1m6NZCYn2hhodNWpFk1HDe+P0NbXPnbE588q0tx5+ah43k3vbdVox3fttTtzeIItHoYH4SSCXlG
 jbNYqveE+iKPEmclHv3GsrA18F6SrvHKuFaMp9zk47C2lykNmvKHGVJFTN9SmMxsDlWwJUhYZxa
 dZsYGk2rTCGVQQpv9s93iSnflkJn2KKcNulJEpP8oy26hFSNuXgnjWa9QdDuhV1pnggRf0myh51
 kCVm1qDYOUCqn96z5HVqWIKZIhCa8A5z+GaoD2H7NdIRuy1aHBRUFOxETrr/gN5FBLgyY+s5EDO
 rYuQNt87Zsyf/FV4mDQ==
X-Authority-Analysis: v=2.4 cv=SZJi5fRu c=1 sm=1 tr=0 ts=6ae79e1c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=JcHXAtbk2vn7OX0MrtcA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: sCP3kzofRa6Ue_PyG8PjMZBma0h7Tiz9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4MCBTYWx0ZWRfX0DsIWUvDFBXT
 /CEPARBG/kwMTikuLcQWfn3at54TAh5xnWJi+LDEjyjYOByy/hkP/Ws5+Fzm8ds//lR4/STV5xm
 yZydIu5gaYjCSJD5eKUUCfLR6M/l5NmYNIiNryx09rtizvdeDPbi
X-Proofpoint-ORIG-GUID: sCP3kzofRa6Ue_PyG8PjMZBma0h7Tiz9
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11953
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 clxscore=1015 lowpriorityscore=10 malwarescore=0 phishscore=0
 impostorscore=10 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010080

fscrypt_pagecache_page() no longer has any callers, so remove it. This
removes a use of page_private().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/fscrypt.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 28f2108e29f3..e70f630fab0c 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -361,11 +361,6 @@ static inline bool fscrypt_is_bounce_page(struct page *page)
 	return page->mapping == NULL;
 }
 
-static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
-{
-	return (struct page *)page_private(bounce_page);
-}
-
 static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
 {
 	return folio->mapping == NULL;
@@ -532,12 +527,6 @@ static inline bool fscrypt_is_bounce_page(struct page *page)
 	return false;
 }
 
-static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
-{
-	WARN_ON_ONCE(1);
-	return ERR_PTR(-EINVAL);
-}
-
 static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
 {
 	return false;

-- 
2.39.5

