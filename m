Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344347;
	b=YvUG3OMnzvpgp6VxKBblLG/DD8UuOyf5FJAZfdxg/EfHOYLBMhoSOvCyTvmyCp1PVuuy
	 bSjnwd/+P4klLshYO1w+a31CUKpeVY7Z60eMZvUXGqCT4CKpktmEYRBSDEL6T16TvdJGS
	 S5tEooJs5yw1laxxem7E6aMmF7E1buNcC5UZKag2gtddo6suI1jt/lT8KUVIkjciZzia9
	 Vi6bY0nLMW+0FIZWJUvZfiPf4Q7zOTaBcr5WZuQUP6C5qHr69MOuJexdTx/R6JLyuBTCP
	 5SEYcJ28mXFL8c00xcf/F1r4x/BXmPgR47E5B+DwtamtBQhy/0FzofTEFCNtYrwh+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qFT+rqRNAHe9ZehLPWsieIK4G697OzZYWHTxlznKNbw=;
	b=u5ko+A8sds6mbfbM+KDCL2fFTTPz4oexHpe9P6Cqiy10m3ObBJlSQbPOnFZ+hSg87ytJ
	 Eb5NJ3rYq38lpzw9zx5MFkWGI3n4ojNjJmoTZNbqBt9HkrcEZYOrZz6Wptd/9M3FcaNuz
	 9xqCaE7VH28KZp0NLnBba37B+UPjrVd6iO24Bblx3DaNEpH9Iiafy/bVpY9E4aT+wN1Dr
	 FteXxXBHQ8ZLb3eIVfFlm2m6UMxlxb57Bz255a1USkUEtC0dsNr3BQbE49Np0nLaAvo/Z
	 F8k7W+T6nhxqhJblP6BQ1n/xW8R+9AWeh0u1uENWvjzkLjVpntFXgAAbWVKhoJiTAWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHrkCHjW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NmQdmRxg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E187606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E187606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHrkCHjW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NmQdmRxg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F1Mw1979813
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qFT+rqRNAHe
	9ZehLPWsieIK4G697OzZYWHTxlznKNbw=; b=XHrkCHjWjZFVZFOMZtyQhNQgXzM
	rQ6vLczAloEGGCf0chqGtOnYmlU41RxeibazQMWodij7k0PT2YCqf85qqFkEGaCd
	L9QJyr9u3ag/x/nJQ1Kz2pFPIrg04EaSrBv+MFY8Bw4bw0okp0Dk+ApSxAhYQu07
	qoitc+yfmT4+1OoubgAgBd1Hjl/3UwaiFXNVRZdku7VzUBj9MqyZynS16ZFLXRyW
	y31CslzNQ0w1HeRjWefI3C/pB0z4/C6Eark0CevfSSojyreQ5QZHt79QChtWG7L8
	JIQb0C8oTYNyaSixwyTpzROOLQ+oJ/q/ivvwkr0nsy9uTokTkmDhoUg+zRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhq4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:12:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7cb9e267so5371066d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793344345; x=1793949145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFT+rqRNAHe9ZehLPWsieIK4G697OzZYWHTxlznKNbw=;
        b=NmQdmRxgf52SUzhPYaOLIBns3TOwg5VE86dfqW/ST5YreuOUAerKr93jI1G1go49N4
         qe4g3JXpsYaBr4bHPAwwpspBVjd1wORcCnD6gV3hVGdZ3VsZGtfPQVrR2qpz/EtWKBIg
         WO+wYbpgwAHRoKlhzhT9+PmLTd4mGhBOlpPLG+kluE+mBcGohOHuXwwcSyVUbt6Xdnin
         aRM5KnqM8mzYUsZco+Slam9l9McV9PozRKaGQKciJ3+LvE0rUr8YNEtSA3PmHjZGWchM
         86mgjN5Q/jdxEIIvrJYXfnEQgukG0WUjeEzLpeTRdocs89WQu7y8OPx1RgF9hFF2LFL2
         p0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793344345; x=1793949145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFT+rqRNAHe9ZehLPWsieIK4G697OzZYWHTxlznKNbw=;
        b=et5mUTsKtQMB8P0TUZCHmQhVZzrmKgdMzjg6DDbHGxvWBJgpeABZNKuSYiWd+ntFR6
         4Y8oxJzM37HM9PDZeBR9DdOtsjNik0TMr82XSI5rH1vpu36fYgeadm/g4T6TtpeldR3c
         AEtf+eZlh75i4CT1Rl5fjT5WOU1xoHnRZf/ZYZs0NqIC4TVJLkm6HWMjsdCcq/DYH6PV
         c0UwOjt8Kg5p9JieBQp53ktxxTo9+MK1EHEWHIlAN1EGT18oOp5oCUqos2JYv3w9NO4J
         DiYWqF6BmSFUIGuTq0JVyojiK9gKLr1NxP3nGZQVjJQCQopFpti0JgBqFrMYR42X+X6m
         sBhA==
X-Forwarded-Encrypted: i=1; AKwUvBxBUF/4eBvwwTYePzECnbHe+WcC1mv0vfDee4UCESw/fF8JmX2B6P6DmvuipP++LXCr/K+ssdycw3DBBTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1Xjs81vGnckwffm4OiOLUDvzI8IbDtSurVTPiQKcZlaF1stTX
	R5pM7cysloxaEdocqqQxYHNtqbQUtXOE1k3LplhyoGGp9oxy6XGYvx4Ir+aGSzlPN6ZwIG1SQ2h
	mLhwg/TtCMXxZ7tQHaMP5P0yZqfQp5Q9XcNokawUXKsGkomBs6Km3FTmMX9OFy1hVa20=
X-Gm-Gg: AYBFou2So4LoNmUcg7M4wVwHGF92M/YbAXTphgs/2xoOquLQNdivY9XVpe82Mb9/wNq
	5gn+UmMFwm6CANn4zUWPgrkZtMxXOKXBxuqkcO6dwLsuaCAGLAlLNPRiCn2y9PB0mMBrqz7LXU2
	DqxID0ipXMVvsGSmpxHiEuEHkXTayQ17Gz6Z6p84ld+jF6z8mb2an69WchncZXiApd8Jrg8IONF
	G244vFkpZysHerbjkmpTp6B0Uv1PNOuvKX1x3NWp/sZ7SdaGLsnm9q0IxMvIA9rm9LcA0Rfa7l0
	JYJ6MmjpPazNppAA014sCykO4MNZWvy9/BOXB1e2NFd1QFG1nNWBSD8QFwrLTOmteP5a/vMxLNE
	eusFnKrbhzPCgn1I9o0X7U3QuPKw8nca0sSng3b2ShKX2Vq+7iKlQFuRNkuTP9Q==
X-Received: by 2002:a05:620a:7086:b0:93c:c2f4:9182 with SMTP id af79cd13be357-944216b70dbmr248479785a.20.1793344345276;
        Fri, 30 Oct 2026 00:12:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93c:c2f4:9182 with SMTP id af79cd13be357-944216b70dbmr248476785a.20.1793344344767;
        Fri, 30 Oct 2026 00:12:24 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm28581165e9.0.2026.10.30.00.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:12:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] mfd: cgbc: Allow compile testing
Date: Fri, 30 Oct 2026 08:11:39 +0100
Message-ID: <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iIBMZPVdQPZ+Y3Em+kGpb62RltCMiF/RzmkyCWBCVdU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5EMtMkDa5LbSiL1INh6FUP1HLxKbLkJugs+eD
 5RzHGmpH0SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauRDLQAKCRDBN2bmhouD
 1wwxD/40aD2wfkNRVpF3wnlQvhEjP3/OceMSbSL4UVJuhUCAu0/tmiiDgJZ95wp5nCCVZCE2qXF
 W0d7hrTtjD9nGsHv6zA/kCbHR2j1vZxUgEtHyXPobDcHzePDrgiPRhJP4KafCUPXV9HOXCNHiM6
 r0B4ctgotq6T3MTBP4WUdPQH39fLP3pjt+n/y3xnp3VqpKUHxaKG1eVgR8tqzAjEdb8PK0wCmi1
 2YNFx6waJnQ/PQaVSl427cFso5F3or0NtkMFKiZczsoBiY80po/YdGW0c9NiQeIBwUfds+0N310
 qiugQWw3oJIS8B2OxWFHbRJHvz+g6TASwdIiJ6sfZG6BILjbSP1lEQ6JojQYOah0XpPPCcmgJzg
 N4vveaxJOgCc6eFRVvI+YkmAXOqJtDP9XIKIxwmcI5dgE5e4kj5h6af3Q2EWwhJuXPZRhEZhTbD
 9rTxN8F4W3XFQGNUn2Bnsu/qNmZucJyGhAv+yqj6ZDFwf64fn28Z4XC/ZbT84ZDfTHVtGdAMOUq
 Y/NUCND4hN1OZren913zCAYCU1l5t8ePRabwrrBKNBhGyAnooWu555WdavF3YbMPFzEMpj573hG
 I7nox20k5zqB8VBK6ABcXG+7Lq9JYbKbbscIpsmffA9U/OcMII2x26mzMKDHiDOXAQdEWWGy85U e3c/n5VTDl2XApg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae44359 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rKWnc9nNlL7eC5Y4R5YA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: eAY6jCSp0pUQ7C79radY7bp9omDVw9Xi
X-Proofpoint-GUID: eAY6jCSp0pUQ7C79radY7bp9omDVw9Xi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfX/xjJ5+pxezcw
 pguDy8oCTJQ01i+gP1FgS8aB5HxTasPpTdZXEPFft7PtFkgZsBRXWPwSrhV8qJ1VLd4NgawaTFn
 eni+bndjXcD6Y1wRwisIgy1muELDGkVh0Ss77z1Ek3snFdd3EO6xrBpfbZmRiy4GMN4D9hlbjOF
 JdIy6nWnKoZ1WbjQx4m3ATpjxcDjrslsejD/lqsuNkg9SuIpolWCdR5wTicdM/qM1ekdOHcX2C3
 tz3KG2t7AC3wpGc2wJJ5uIw+angqR5bR4/It8WdMB8CTSn3CEBcx8P0o7BoMyUa7KP9k4WVv5e1
 OjUODnrXQtdswZHzFVrgjklguyhAzToPucYjFtHjwzg6qVgBBIAKimS3LhXgoqbAh4xqzf0Vck1
 T0MSQyXSEF/RHZYN87OFa5QTDSMhkdGSy1OlItGmY+vJprULyVwFuBi/PR8Ud6u3G/xEWp/46w8
 /+Nok5uhQFJfYhQRzRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfXxJC6mLVJLYGB
 1NuTtzu6IL3+hE1jOA7A5EPuzS8/WyFPWDaOrFSjk1spI4HBvktAVl0ZprKdYQZr4x9+NGpRKJx
 MB5v9S9YfkqAR3alcV/8lIYhYLF3C3w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300028

cgbc-core.c driver does not use any X86-specific headers, so looks like
it can be build tested everywhere for increased build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..de957f574056 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -255,7 +255,7 @@ config MFD_AXP20X_RSB
 config MFD_CGBC
 	tristate "Congatec Board Controller"
 	select MFD_CORE
-	depends on X86
+	depends on X86 || COMPILE_TEST
 	help
 	  This is the core driver of the Board Controller found on some Congatec
 	  SMARC modules. The Board Controller provides functions like watchdog,
-- 
2.53.0

