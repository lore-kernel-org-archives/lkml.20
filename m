Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793502559;
	b=Ca0VSJ8F88CQHa1XbMVwZhaVNJTFOLd9KKDTsDGEo8KHSxZdjSu1BhgdJ1MJhy1ehDtO
	 AFsyMoe0vJOXaAsMVy2ziVecgpEibyAoWTAabWFn+gnYSQC2OotavMQo5U9uOYwKR1Fpr
	 nfrcDINlGitT/YfUSNIyoWabIJJXy3JC4N+uSuFkb/Ng+E06gLaTYbtmdngwiFALErLPO
	 cK4xvT2d2vI/3S4LpZ9aIuGtv57U+jY7ukoyVe9lZfj55bBm86RpdZffECkbw5r3SxkXV
	 TK8RVOk8vJwTobG/CXfXF7KGwZSq0vbTtIk/M5SYH5Uuvhr6SIV29zspNHpoBhyylLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793502559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q0jHwfNVFh3slirz73VjZLLnlDGT14N7xEqd/JdTqoo=;
	b=fmQk/hKZi2z75H/v/WhsUWQVWoKlK1ebF6Stxtm0M5mXWBFM7B7jfNsnVVvTmri1+H8v
	 A9vbX3NVH7t4SzmKAO/DI7FDal4Yx7bz7BgIIa1mWWWyX4ugDsicrmoDr0kzqtGl+6TvJ
	 Tgy+py+erzmzo5BQSjenKAbyWLkxeIs4jvpPRX6QLrLBN4Nk9HYN0mmLCBkSGxiYoekeF
	 3CmdzERchg9mBavZwAfuWaMpImu4jbjI2As9q7n+7yypoutYkEcd6XReq6lEwI3oqvHw5
	 pgzM+Zrei7R5oAiodiPsMP3w2NWo7xqU4r7keA3PEODe9JRBlIjt4l3XuZOvpoka0mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMJ+yuQZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHyN7F7Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA7606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7BA7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMJ+yuQZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHyN7F7Y
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A11xtOw594946
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 03:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q0jHwfNVFh3slirz73VjZLLnlDGT14N7xEq
	d/JdTqoo=; b=bMJ+yuQZI5dzc6xhVfHgqnI14aoiI6XgEhbaq+L8j2t4GdDRL+B
	ML6Xn/sBpBUTrzvgdxpGAyNRTVebyIR3DqnUo/lAXqxAdy9HWnjgvN36BeLXMixf
	S7JaMSkK2pSuw1vtR/hx6vUq5n3F+Q58NSGUcJkKyPWht04GmDxc6k/1UUromGq6
	+FuRTLnPq3M9vlpZF0UMU0u2YkVuMmid95yfTDOwe3P8phjESIjOj62h1i8GaODS
	42Kn3mLOKe1yMS00SZTtptSoWl1PaZxANCOs1R8Pg+OFhPM5fBOI3xq+egRTY9rK
	Tvy3RA8lM5mw54fbCUkKe9NKRa4axxjbNFg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rtp0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 03:09:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a223755e4so8142782eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793502557; x=1794107357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0jHwfNVFh3slirz73VjZLLnlDGT14N7xEqd/JdTqoo=;
        b=eHyN7F7YKbQjVlgXeV88ThJT9gM3h6I8CIjDWvkBQsC6zCszOaw1FPi77L136beH8C
         X+kNPsXmLDNoo0gEeK2ZanxJoRWXu7R9h3JlOpt4gWHAW7LKnH2hW/OY+s2m1QUHTTfT
         9pmBOrp4r6veyAJn6WUGqi3sLJkK/ejd8UifHBIkS0a6rVJGI7nLno44V7qFLM1LXbqF
         z62qtKzag21KkPi84BLiiY77hmUfp5i5pjLpqKYw3o6h4dnWNQXfrotdtEHbuBvsHP/m
         mymrmhdEi8tHJZlqx1YyiJRXHNDlJK9s3qXOVsTnJrmcF1oIiK5NaI9JsWWphM0nLO5D
         FaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793502557; x=1794107357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0jHwfNVFh3slirz73VjZLLnlDGT14N7xEqd/JdTqoo=;
        b=1qIWM4+83XRric7/uHl6xHfS7vaNL9EjZvxdE1rcvkRVCzVJrZEszmUSmuxa3bsSVh
         5ocj3P+rq/Gx38ia8Vlkbrpg1G8DqTwgnrTTEBnUNs4xB1Lr8YKIoD26KWgZ8qbapuEF
         ihxDtjn6tgXTfSaEMH9xu1ci5Uj5f1GskX+tYvDDhCDn8J59tzArcIxH6DEngMR3Q46u
         VbL6VBvaRiUztprd15vByZ8rvfUXRgocnDJGEODrNz/UHWOIO61b4s3TfSG1HLNi6tP0
         9cFDa9C3WYmSVUoTT4FvKd48ngs36lwKy583+lj/nOnQ0sSE0emgYsD8jsGXAAlRUoId
         MsVA==
X-Forwarded-Encrypted: i=1; AKwUvBzTj3fHaxMXuaNBxKqBSbLooCabS83iINxbpUCzWxTUpQ6LPL4pOq+omn6aOfsvUdmvUELmJyJP3hzOKoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLT1J+z77CF8iC32PY4MLLkVZaJyahW1tqexKI3+z3Dg9+I7aLY
	eJAj8XOLLjZeUjq3WMpzjUDD5jovW4RPeQ+P3Fp2bmStgY2T6nnU8bI0f5FuxeP4zwBdnCON6+T
	zRrrmFN7X898i51sxzH7KftBbHsnbmXTjusTxwvdDYEegt9+TXzmn1VYayxeX0aX8zmU=
X-Gm-Gg: AYBFou2pBUSziN9q4n7b4mM278/n8u+pg0S7/RG9SZwDSPpfJVQL4wJNzzSznHH3zjI
	A6UGgA+Wp/c9PJ3ziPngnWm5faFjfRtG+MGk+1SF2xo17A/Sl4vqiKD38gp6sUw8lcBFQxoJcIE
	bPhQqXXIHVHU9ElIKMxBPcc4wX4mbUlNs+g3taPk1Xr4dnemLlD8ZFoUAuSSshrDGYItf2AyJqs
	cDWWn+I/2UWsOlwBiU7xcAb3JikDxyQDUjMXXUaLuq7OD+o9+uTLjpNQShWbxvM0W7LMEAZR9dj
	YKC3XQt0R2xffk+ClDKllHm+WtQoHkO3CU4XTRgkK5mNNG9c386TiO5EpoCYBOPtOxG7M5JcdVT
	qkhPoj22Cs6+XHufTxIp+2KrWrflt8umaWJlZp+XWtc3YB3M8cPN5ElvpdzzYg/3vt8tFdJw4Nc
	4ONx+dbru2Ju4wyP3hEtdBw62ImclJsYCT
X-Received: by 2002:a05:701b:2702:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1ac55777071mr9201345c88.5.1793502556977;
        Sat, 31 Oct 2026 20:09:16 -0700 (PDT)
X-Received: by 2002:a05:701b:2702:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1ac55777071mr9201318c88.5.1793502556399;
        Sat, 31 Oct 2026 20:09:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm19577174c88.19.2026.10.31.20.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 20:09:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Reuse IIO device ID for ADC_TM aux device
Date: Sun,  1 Nov 2026 11:09:02 +0800
Message-ID: <20261101030902.1387122-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: CT1vezn3E9YN4cjY98kpAgncgOOG1P4w
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae6ad5d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RKMC9uL6Q2GlzZAgUaEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAxMiBTYWx0ZWRfXxc8YocuRfFtG
 YOjakLdJXk4WimfIwVqzRMVV4/UQerfC6yacM6RsyII+1MFhf/j7foRgiCwo3ntd49ssXFSIyFH
 O085r6q+1Bx+S4C1SCOLzgNo7YC7Qyg=
X-Proofpoint-GUID: CT1vezn3E9YN4cjY98kpAgncgOOG1P4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAxMiBTYWx0ZWRfX+XMXbG7eRiv7
 /sYFIa9QaGVda5zD7R8/QIW8/HSjE/pLmTO4WmpNWgeDpD2uVLTzog3EPZUwSiwGLqZcEReHQP/
 kGJrq9RpFNlWbUq8aZBVAO4c/mbUu8BGeameF9b8awNnkm6SDUzTikrRccDLsFvsJbF7rzxufoH
 sKL/vn0yrRTWPouLOaL0b2VfMTxOQJ3XZ6CAqb5fV4DXAlLeAEpyMUvNHNVbUoXPmFPzDjqnycP
 O9PZ+SIgzUV0WxJmpoTNQm/2v2uE8XCRtgBqYM6OiNuqr2QqPhBcE8nDpuqyOnF4Zg1RX03VwIL
 Nki9BQfQKc/ETbxK1F/MNGoUIa8hRGI5eSOgTvQCvF2IufdwYkWqPucCkz/pJOvmQKp4CTejfHz
 Ja9fXiElNIgIXBIQqKzwN45M4xytVDErq7Zx+maWc9fohFBDDDu6bJSuBgDTDI5oJ2fw+UCOaD6
 EhqLOYzVAtRhJrVVL7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010012

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
to register the same device name. With ADC_TM channels on more than
one PMIC, the second instance to probe fails:

  sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_spmi_adc5_gen3.adc5_tm_gen3.0'
  ...
  auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device failed!: -17
  qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Failed to add auxiliary TM device

The ADC probe then fails as a whole, so that PMIC loses both its IIO
channels and its thermal zones. This shows up on Nord, which has
thermistor channels on two PMAU0102 PMICs.

Each ADC instance already has a unique IIO device ID. Use it as the
auxiliary device id instead of allocating one from a separate driver-wide
IDA, which removes the custom ID allocation and release handling. The
ADC_TM driver matches on the device name only, so the instance number
does not affect binding.

Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
This is the squashed version as requsted by Jonathan at:
https://lore.kernel.org/all/20261101020047.66034613@jic23-hlaptop/

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..a23eb5c9096d 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -610,7 +610,7 @@ static void adc5_gen3_delete_aux(void *data)
 
 static void adc5_gen3_aux_device_release(struct device *dev) {}
 
-static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
+static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc, int id)
 {
 	struct tm5_aux_dev_wrapper *aux_device;
 	int i, ret, i_tm = 0;
@@ -620,6 +620,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 		return -ENOMEM;
 
 	aux_device->aux_dev.name = "adc5_tm_gen3";
+	aux_device->aux_dev.id = id;
 	aux_device->aux_dev.dev.parent = adc->dev;
 	aux_device->aux_dev.dev.release = adc5_gen3_aux_device_release;
 
@@ -799,7 +800,7 @@ static int adc5_gen3_probe(struct platform_device *pdev)
 		return ret;
 
 	if (adc->n_tm_channels > 0) {
-		ret = adc5_gen3_add_aux_tm_device(adc);
+		ret = adc5_gen3_add_aux_tm_device(adc, iio_device_id(indio_dev));
 		if (ret)
 			dev_err_probe(dev, ret,
 				      "Failed to add auxiliary TM device\n");
-- 
2.43.0

