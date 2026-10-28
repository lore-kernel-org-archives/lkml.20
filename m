Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190927;
	b=OGkvjrFsAEK2InkcU19RVB2KcYTupsjhzWL+sSytbURO5io4H33xgFwD2Vzx5sgBjMqM
	 0OhQyc7tYcfioMa8u1O3q5K1rJ9kYzRoGJOEB8hEVdyMhxw20WjLiL6/2UT1hBrtFD/E2
	 Cx8cfmkuhn+WD06Q0Ie1WbA7CYFILoD+tUzaE47CRUPX2tDTbT99w9Nb3tWCV4c+8ZNVy
	 CfhSLjnNN/Smhn81hbyKk3CNa29aQZQPtHlQNa2YM06jkJVUHLMN6DwxrQhgyCwtE9x2n
	 7Z7nYUG6m05BM4ZQ8rnpN3OEhDw+sf7TbDsScSrU/KCreBlU3chAKWa5peHiF7HIciA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VrXv9WGeoSLtqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=;
	b=XEJibwRKsLbIecoJLl1u+dX0p7DLC/yHOcsfeDToTR56W5x6I9pFW3rgs+VewQ3FYwEB
	 xIXqhUoneIO5volXBDotixo86Mq8tNsmoSMjiDZ4kcOHuuSAI37dJmPtvNBJPR2d+xUQr
	 Cl8hfeVl+ilOWrkikP7BJlNyEUOZitFMyCQRC8GgTiMTxSA7VngpTssTxGU7Ri6ihd+4y
	 gN2Y0HpEzPq5cKyjyNjgWGk3jXoZJWkTwrnZc6w/cx+WhFWYvDRdIYMnub/ZSYOqNJGbi
	 soAtMubywniaWnwtVy9yIdJF7f2agzThwCDD12V1WCGhdGZRf/ZXkdB0Qnsw1VDkhow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOmFV3Ci;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtiODmxG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BBD606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BBD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOmFV3Ci;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtiODmxG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAQ41606934
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VrXv9WGeoSL
	tqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=; b=EOmFV3Ci++b0gq1Fg/2pk4+xwB7
	fbyg5BdNRkHs9tcWltuHb/jt920jdY/GobZdEonla8s8NX3ZJ+TgFPAGmly9/9Ai
	Hst9zg6sV2lI4lASwyQI8V9Y631t5/G+3hNsFpEJSUW1ZSqHWc6rauFyFBrfuI/o
	EzqxYqULaV5kWkMPiXUkILSe6B/Bmhax2ECYKTGSRgAL38L7NhY2eUDyWUg/cBg/
	mZSpnoo57OSqLSr8MLjdTPoGs9YK1Nkb5rGBPWUXle3FiG6yB4bXBVZ7yOVC7PUv
	wUeHDk3rsN1eY2B382XXxM8rRZWtX3yuoxkQmHmD/a/f8GRfuC0krArqlEQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j5qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so1688112eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190925; x=1793795725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrXv9WGeoSLtqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=;
        b=PtiODmxGWSeqyiZXlQ/9FVMQhWWz7irSNj2gqTd6qT2JUHTH0ptJs1nAwg7k8Ib8i9
         4CIpC7E8iFqxl2R8G4PCYVrwmEk0nlPDxKXq6LUvUZxHi8U17j/EaoyxzWefml9bjXpz
         KcOFzgYbeaoRJhskuopg6NuUCfpXQBig4PJZ5O1g+jKksN5Rgs84v2M1aK/CzgnxM1fZ
         MtenjcrJ3H2Sam9YJtXm+ErAoHwsxGCriuh6KYcHVZheEcKpwdov7deYsodiIdmBdJD8
         el3ZqP7RO0OLLY6xAHWAX/3N0AG4YSXsxTlan8ra+5TKDrgV0aUUO9ygoQMI1D3Om7xP
         7a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190925; x=1793795725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrXv9WGeoSLtqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=;
        b=zAqM9bfeJ/YobEKx36iOW0a24sV1bp075+GeF1LAJeae1RK/cxPm4FpGydI5oICV2m
         597rm/XgTms05xyVFzeGsUN5D8rZyV2MCAj/wCmf2n7QVcMo9LZ5sJd/diEP3p+pRWvE
         lLKxiwQf8rLNdioJSoWmLBJtSMpJesHbyJd7kJ9c4SA0fiwfl1D3VzMQQtXULe3RvWDd
         AAre+jBwHJZ2DbtE7KSdzYW7aQryR/8NHAB2/GOR+7OSw9UOF+Y7r9OpdXwsWK2P3YN8
         Cwqi14umlnxes8JL+tslX3dnY7tnAAn0iI3AEppY87Jlwz9rCF7mRRAWZ9FYu/lWlaLT
         4L0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzoQB66BHJUtThGC7YRY5pg3mek2JY6KwEBE4DTrCNG2+rEWU1GHxuVjCkAxnQLiRX1OuWcIecHGDlr1Mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLalTwGE3rizkuSGkNwvi+1GWLPy08siY1KUXnkOqc00RzOEG11
	XToG/us2ZHhBheFqTGKAASY73CHj9zFEoP93BKg2Ake2YIg6DwHoZJYjt+Z5Q4dY1tQh1dZQGLJ
	OHUDbi1F440dv6F/b30nj+H2gZfRhZoj90Qyacdi4wu+//Wbz3l+LALb/o+67gVTHdqEwI9sisU
	4vQg==
X-Gm-Gg: AYBFou3BKtKGhI5zWLDuYY+Pv+p75Ri8wVpB832rnFarhRYsjkuFbgW8WwsyoALGm81
	fcN4EPpkC6O9I9WkACxROGs5FqnMkmkthGWfZuUPOk3hrfFqiyGwMOD6CZbb0JEaBOlAicYs3a7
	t3g7nCIYPEkORKPD9vc1ydHKKRoCF2Kg+ydsgky95ihd2rmi2O92MrAvQ6ud27DENm8zWtIp31z
	l+OUyaTY9rUfzFHYAv6Z+F/cHtdNFFTrRA9z4Vl2Nmb42Ycq4k49p4qXxKXFX6ARjY91jdgWZw5
	MABqC473Acq8HY/90xB2hWbA0WKRjogET9J+NGSTtmrHq9e6TAG2LUmXtHnPSl+IdlY6hpIVpzs
	Fw5tJS8y+gaA6vboyXrCbtzZ3fKrGGyaiyqqzJlqqMWHiKmwGUbMRjp+StV5xwTuGHyPkWQZthf
	nQS6WAdzTpVF6hqSX3p13vQeAoJYEM/l9c
X-Received: by 2002:a05:693c:87c6:10b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a20459a30mr3508466eec.22.1793190925149;
        Wed, 28 Oct 2026 05:35:25 -0700 (PDT)
X-Received: by 2002:a05:693c:87c6:10b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a20459a30mr3508431eec.22.1793190924561;
        Wed, 28 Oct 2026 05:35:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 3/4] gpio: shared-proxy: Drive the default value when no votes are cast
Date: Wed, 28 Oct 2026 20:34:47 +0800
Message-ID: <20261028123448.510401-4-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX5FrSRAfv9wLB
 8Db+FMdPpwYfb4x0ui9o9of7cgmPlQH6yxmhidiF0RMy5+wBiwCr1ItLiLGQeQzPTU6gA4z6R2+
 Iu3ce16QeU+Txf9hqP+afu7HFmQMtJU=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1ec0e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=oUwo9orgbciHMXp9giMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: uh4Ga_1AugOYwf2X2SC1xdl8RIXpThvY
X-Proofpoint-ORIG-GUID: uh4Ga_1AugOYwf2X2SC1xdl8RIXpThvY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXx8exG9L02YL0
 vdOkx6a2Sb73jglgSAaSLRynxLQW6DIgwhv+aaxncQnSPpsbBz1eRaPjJIff+zWwhSRAMnCszWI
 iEQak2rCy20jp3SP1KiFcva6F2jX1gA0RUwzAHXuqW+hRX+8UIJTj+pc8vfFAyl5KqkxPeVz5Le
 WWTRXZotTR770AD4Q0lQbvyKchr5w8gUB8jAFnjkNLctwHi909M/cPBWZnmb+he5np80l+93Hz4
 k9VFFa5F9uluoYn0Zh6OCe/KGt2eu9QKaAjCErYnJ5fuSMhveKBwV+1HppY9pMHIpF3myGt14xX
 ix47BBK4C8Ne5WE2ENCF13ZjwUQ/p6QQYup2VchSLbbgQ+KbCOV15Ku7lGHeSlrb3QTlL/Tytx0
 17B+zdOTMdSzZxyoLw+XtLm0AvIyvmnWwA1uhAq5tKABQZTZj5UE5lAHqVALeb4lLpzysSSBTqK
 HvSwaGfvko4fKOYY51A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

A consumer that requests a shared line with GPIOD_ASIS never calls
direction_output(), so def_val keeps its initial value of 0. If the
line was left high, for instance by the bootloader, a later
gpiod_set_value(0) from that consumer matches def_val and the proxy
treats it as withdrawing a vote it never cast. It returns success
without writing the hardware, and the line stays high.

The consumer has no way to tell. Its request to drive the line low is
silently ignored until it first votes for high and then withdraws
that vote.

When the requested value is the default and no votes are
outstanding, write it to the hardware instead of returning early.
With votes outstanding the request remains a no-op, as the line must
stay at the voted value.

Do this for all lines, not only GPIOD_ASIS ones. A line configured via
direction_output() can be left at the non-default value as well: when
a proxy releases the line and restoring the default fails, its vote is
dropped regardless, leaving votecnt at 0 with the line at the voted
value. The write lets any remaining user bring it back to the default.
In the common case it is a redundant write of the value the line
already has, and it only happens when a proxy that has not voted sets
the default.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 4eae3c9a5168..75d0d617941f 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -85,9 +85,16 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 	}
 
 	/* Desired value is the default. */
-	if (!proxy->voted_change)
-		/* We didn't vote for change previously, nothing to do. */
+	if (!proxy->voted_change) {
+		/*
+		 * With no votes outstanding the line should be at the
+		 * default, but a GPIOD_ASIS line may have been left at the
+		 * opposite value. Drive it there.
+		 */
+		if (!shared_desc->votecnt)
+			ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
 		goto out;
+	}
 
 	/* We previously voted for change. */
 	if (shared_desc->votecnt == 1) {
-- 
2.43.0

