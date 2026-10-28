Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190939;
	b=z30CNe9GanNBq2oQXK7Gi/JcESpzXIEIFX0bkWZ6E6qf+3KJKl95f3YPJnsUCov6d9pY
	 TotnlQRXZWakKpqvC7pIIk3UVWr4pkAUqGKGRgpq3jn9eELbzCNRdgfLqgTDiQ7AEdLyG
	 yusOnsx60m+G5ZcH6XdsmQ9ZDkunACzYmdSR9Q7DpdDKZfrqVxQX+efyrOCliLRdVgUg6
	 REISt+Uu4BRnNHiVdUBpJboi/31ytiUa6rHFsMY4rBTDeJ8K8ggP168GSSHiDe58ZtJf2
	 y8c8Mdg6pitVOI6fwgUX66mZdh6EzJwH6tJSGq3Ans1WukjQaueGuBD2J8NcFBcABZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WrlFesQrP1Bu0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=;
	b=rUykyie8ioWF9KQS0cmRupq2hduHNLmLrBzJ/uRP7KSGfmVooUXBa9OJQW/XaGofs9Ze
	 n08w6oH2g+Fa2RhN0h4LZQ1SIueymnbaoMSkE/u5BHVZJb/Fgn/ovBdD8yg2ol5KBuSfH
	 CeE7nCsk93fwQ9LByUUT3m3jz2SgLUhvHWwqQgGQZT4CUBOf5iJv3Vw6dzkWoGrZ3iIld
	 tQGqNBDDmVVZivRNfgS1Q9Q3VL98/E22Oc6KdG0lKC8qODNUsG8RB0VvS1nvYEB9qQaYo
	 UzOA1ihaeSaqwlLQnVccNSfGDJWG2PiIsfSWnP34mrRB180PoB+hxVbk/9L70UVrmqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOev4zN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+7Iof10;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AC2606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AC2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOev4zN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+7Iof10
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2uY1538953
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WrlFesQrP1B
	u0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=; b=cAOev4zNDSNjtAQ/t0YzeZYiQDV
	8smOJeYqce1V7UlZpCGy8xGDec5PWmtlS9nZX9bRr91qYQhJVsGpn77YitYgOMrF
	NqUX2gXs8BylCkWbFfQCTS5VrouNHt8NGFB2HV4LDHUYXsQzPORgAxvxCUy7vwR7
	L+6f9rMiP5s8GEVMcro+TOI7BDfZikqDyWGz7t8UuxIjbQfYTMdY/6A0zJwID5NR
	jBKVEVenbh1vZOWe4kHED239xCX1AC2YLBVirDEgjTP2dZj1LFJ3mzhrr+WvolpA
	nN6ATPV/oHCvDjtaqeWpyMSvrk0uni7ZHX9vaFS8lGi+UQih7amAgEedhag==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rw0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso1297052eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190923; x=1793795723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrlFesQrP1Bu0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=;
        b=P+7Iof10/3f/TDLIEz/MxkDO276n7xMRknJq+H1bxfEmjv6hTifqr1GsTYBO/sHC6s
         7TXgABL9eaN2c6cYIQ/laraaNCaOKplRq2lhySRbdmPLTkyDac6+/tq7vtQS1h9TBMzh
         EBbsqhVu71dBp1yHi9NiHth3vxb79st1Lpm/eICtiGBLfCEt8d+3yFw3F4ZnKxyuo8UO
         di9Wckgp6mr18pTUkGSchRwAYRBDvj7r56n3Kpy7/DkmxeRmYG7TZZDzEkmk46kQb18B
         fPG1Vn/xlPkDhWqRJR2dmilVouo/sKd5W8yejZPxshGSmue/336D5B0Y6E52GrDwNcSn
         Q0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190923; x=1793795723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrlFesQrP1Bu0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=;
        b=ZraWJ0Wwy9Fm2iquRL3duKb79Lq5bmWyR6AbcToqdFa3UhOpwz57/Iox+ZpQFXNh7E
         J09b3hr//Zcydw2B2kORJCAkcKOVoILPmbXOcdWnnIOu4XLQAavlo5xWPV5dCuUpT3lM
         mGEUf2rPa1kWQXIE1NvxN/t7lTejRm/utpCLVyMI09GNbQazN11muO5W1W5/YqTWPfp6
         6fZ2euwdWSGiWjAQt1CKc9ip8wERHsXh8dhhgqNwmF3LjUxzaCv44NxGlbEdAsojz9vr
         cFgyly5ooQHLc7FnfIL3jpBaOqzsyfJdeeizyVF1e85+nGejhsrX4MLS/s9h2dpWizdN
         N7og==
X-Forwarded-Encrypted: i=1; AKwUvBzdPdx/m/PBMYxDmMJQUq0qdJZgHtT3ts8ox7YGG3skQ54xVwsm7GSms/L+osIETiRNley5kK8WIxyzoiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEQrIM65F2yHj+aU9C7vbsMCu/seumIMPDOt6oqRmaHfFPOkfg
	W7tqbLtiQUj3Skipis5FnFgOjTlYM6hDCU1JPaRWEqZXxGy3Szpss35EebVLyA30altSuag8CnK
	2ac/gFkjg3pPmq2DnLGsVAC15RcICOdnRyD1V+SKEF0ViWdkrH45bewPoz9s+65OXCFotnz+6au
	b91g==
X-Gm-Gg: AYBFou2xcdcrxNyhYQfGs+JLxTiYyL5tiQsT27J9e6F62brV7u/qCjLbUB7fzmTdBu6
	BHxw3ktzJbhDNLJGknOgdrF7ZCFH/RhKRoo3iKvbJ+CkDK+dMDchszDI4CCyPDzz5qu+KgnRABF
	nAF5uz6Eqvc40Ceriy9iakdUn12cPr3Uo0bx+nLlXxvHW1dAqIgL+TGY/V+KzlBpG+YjHyqusfm
	qEPCVTSzMX7siNbl1mJi4Hs4mk+cLBrYM9o4ZyoWFF8AQeYXmvmndJrFov2lyBZP9CJeOVOx1bd
	fLc9uVF3QWTcnh0zrVlCL8bwIT0INNGN1MRnF2vaAY2xADsYAbCO6lWDQU0WGajjnfLVgiVD5KW
	MXyQn/7wz1PN3Mv7NU8Fo800eUoc6srLD+YcQnTnBPdi9JazjtQMLxCjvNUUC02vht7MdgAoLk2
	mQU9A6pXutfCbQgFGFPvnbxPPBUh/ZpdqP
X-Received: by 2002:a05:693c:20c6:20b0:369:f9da:a70f with SMTP id 5a478bee46e88-36a200beebcmr3514453eec.17.1793190922597;
        Wed, 28 Oct 2026 05:35:22 -0700 (PDT)
X-Received: by 2002:a05:693c:20c6:20b0:369:f9da:a70f with SMTP id 5a478bee46e88-36a200beebcmr3514417eec.17.1793190922034;
        Wed, 28 Oct 2026 05:35:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 2/4] gpio: shared-proxy: Drop the vote of a released proxy on write failure
Date: Wed, 28 Oct 2026 20:34:46 +0800
Message-ID: <20261028123448.510401-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1ec0b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Vq87VKjZgZ7Zzh4gvRcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: jY3gZlYmqSulAHpVD4Juw4AbjfCP1NZK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX/adhkz60WLZF
 MzBD5u8+3RU8NxFKCVPdznKZqBYyVbTQ9H2BrQZITwxbYdfSkT1eRyw9hgsaIqPuUtWBqG0aAU6
 Bm78rlm8lbjAQxSk29AcT2BHPPJViEE=
X-Proofpoint-ORIG-GUID: jY3gZlYmqSulAHpVD4Juw4AbjfCP1NZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX7E2rKZYT607n
 IMumqBJcMJ5S1e24d4+UkLuZ2Lt02pg9wyVQx2rVZI0OR2Q5pr45Fd2GvtyFXgsyZVhW7n9guWq
 cjD6eGbO7arU0IkamR8qbRR4Fh1tY0fx5ibyA+UL4WpddN/2j8OtZAdCMdEVSMKZAVTfAS8XY1F
 lPmwYwmE7/H0L3889KaxX9pEpJy0RF0dGIncxkbI7f7U/C4anpUlWahz9hx1aqs57xPi6edT2F1
 X1vVWTcSMZFOhPLogPx2dfrlkIM7WWeazsNxvHyObYOPEgIM58Z36aItSNHAPQs2baOx0DS2ig5
 5LDhUCjRpH8Q/7Kd0kvemdyT98hped/jfweT900Me04LAtWoAXnh0Mvhd4a+0L8b4btbm732i/3
 Km5CuZeLPdwbkTf+97i3coo64pNmfpvyntN9kTvE2iUTOj5MNq3Wh2yTEZ5cLcqsUCzgJuKQkeN
 EVJcP+e1X+yANuo0yvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

When a proxy that voted for a value change frees the line, it calls
gpio_shared_proxy_set_unlocked() to withdraw its vote. If it is the
last voter and restoring the default value fails, that function
returns early, leaving votecnt incremented and voted_change set.

The consumer is gone, but its vote is not. The line is held at the
non-default value for all remaining users, since votecnt can never
drop to zero again. And the proxy data outlives the request, so
voted_change is still set when the line is requested again. If
another user has reinitialized the line in between, resetting
votecnt to 0, the stale proxy's next vote for the default value
decrements votecnt from 0 and underflows it.

Drop the vote unconditionally on release, after reporting the
failure, since the consumer is going away regardless.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 2e9ccd8a8d83..4eae3c9a5168 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -138,9 +138,13 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	if (proxy->voted_change) {
 		ret = gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
-		if (ret)
+		if (ret) {
 			dev_err(proxy->dev,
 				"Failed to unset the shared GPIO value on release: %d\n", ret);
+			/* The consumer is going away regardless, drop its vote */
+			shared_desc->votecnt--;
+			proxy->voted_change = false;
+		}
 	}
 
 	proxy->shared_desc->usecnt--;
-- 
2.43.0

