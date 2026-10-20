Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481955;
	b=sQqfLTMG07ZhKaQOK1oUkLSg/6j00nymRThLEgAYD7GjaXF0mpAUWgTkTEkimmQjxsbj
	 UyMG/htw1NPRF8vn+qYwQ5B5kOOGqS5abRd3hF8Q9BL7Xs/A12rLV9I9k/YXXeYGqF8rN
	 vmRiy/Ujj+6FLN6i4q20EUfkZDS6ZH+2S2aRRrYqx5KVUtV0ZGYLCRHWXQJnRqdz0TnkU
	 9enKwkYu4zpRoiRUpy9X1DqJ9rTVelwbLgZsIUIIrvSHJzAoXhrlExpzjiWApBApcF9B0
	 I4LpCawSe1JJconwg9mUPzXApwcxmusWSMGBc1n5I6EZBBY/kYOqnlFspYSS1dQyEAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qoA6ADeVtXSq9JMrH4L+llb/0nFEv/ASnOYsfH0syRY=;
	b=BFFqhxXzN6GqEmYlSIYiT5HCUe+aLHrlNX3zUK8vQPoJu7AUip8cITNptv5tb06XOGSC
	 XMgHeB3ABzOgZLPZN6Ef1jaBNT/2mf8GugwdIW/nb0CNEXaKgNFIFJykneoK1T5qV5ult
	 lPQM90jAyAwjb03bcaNbmRQg4ARi5mcZTj6HKq8PzgeoChT+qp5nrPDj1bX+gIpc2dIGr
	 DmHrq8PBrUiIeqJed+SCI49nX5/cGBk7UM3YfNjUQyg8SJT/aMpI47NXWSztMX74AXwLd
	 Qk3ClRQdpXQgbvH/Ic8bhHmrn0kbAdiE7WdNC8wDhUQubdOKQcaAQ172V42xskJIVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f4Kuknhs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XeR4SdIn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3169606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3169606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f4Kuknhs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XeR4SdIn
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tOD13807219
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qoA6ADeVtXS
	q9JMrH4L+llb/0nFEv/ASnOYsfH0syRY=; b=f4KuknhsLH070xKg974nmwJrNAc
	lBI3yzn4D6mV/ibCdntGHPF/AgmRzylNGT/On/T61J1Gt4s05eAbQ+K3nGnMve0R
	p9oLw52f0zZXvwnE5C3AR05Ug+9d48+RvLLWr+Q/cSXxsfml6LmuTq4fkt0s7060
	/B2s0xOrTotlWT1iPd8f5+o69Dfh/tuwTFya9fmbmwrK2rmLCCWHCFoFKrNXETQU
	A2BYXS7VnQN7aW8H+Vc/mIRDuOwgAiYcSlztqSDQ9mzqKw3o1S25S50IfiXJh+Wv
	sqowOVmkKPFzKyUm/cq62SjJ8MnekRP4hmWgM6ZHzlWGzaGOmfdHNde1xUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9e5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so593884685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481953; x=1793086753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoA6ADeVtXSq9JMrH4L+llb/0nFEv/ASnOYsfH0syRY=;
        b=XeR4SdInJhz94oiMk/A+U8I+OkAs4wBG566nVN+OGL7Sbwk/MMJmbjKQXLWZnR7tN4
         8f9tgt7n16MghqJsh4jC70+Xi8JJwzu+WoITMLyQ0qXwTJt9gX9ILLHWONLKcjJXTC/Z
         M1u/MQdZ14l9w6QosTQCtgh8PjT1p2UkD/gVfwltSHhWIHUW26eUrjRrT0/iW5Wl+/dF
         DcAgkyFuG7fL31BOPjoWZZSZlO2OnGWbM/1wzX4STvhpVvBbgIXGae7FxEsMs4oc0dxg
         eB1pFHuFCTmgYBdW6HucBmrVVgscxK5lbrw1H4TiQwRSHQpS8WWpFdFzP82I527jiDA1
         mhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481953; x=1793086753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoA6ADeVtXSq9JMrH4L+llb/0nFEv/ASnOYsfH0syRY=;
        b=mF7SoFjV5UdKG80/MygIe+Qnk7CqfNOXgvSabVhpHBeknHkBaUfwUXA90Xgi/+rOmW
         fWrrcyA7fuoWGjHgChGUgyjkrHkwRhvDL3Mk2HALojkgTgX2emNRayp5e21KNrPBEMUr
         3PVTC017h8nFmQekBYQwi7Z3A1dAB7WNF3nOKYawGAFlJ+wqbkJgAAv1CvBPlrQH+n4S
         KcMXm9LJqF3Bpj37+YLCa+2oQqHVFETfwyD3pVL+kTUFsgL5pDB1XRDxgc3oqpEydwAY
         3//k2lOVgcHoWE6JcGlP8Jnv3lFLEbZUScxSwEUzGAx0DaVo2kE5KMGEwz5VbQACYrSk
         fIcA==
X-Forwarded-Encrypted: i=1; AKwUvBxftMdGSj8Pq4w1rZ/B2NK0c/PNKfqDCLclf47YnpQpdjUiK1q+MzNErAqLTE7EeNDkkYMQWLUEpj8EuyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLD4VKPn1k9ua9BNcIkEDo1iuLgLWBnZxVWREpkKW578CZBF5M
	1FBHXd1m9oO6lZOWIfa2B4NGarcjqPfEHNJpwIfY2NTPpSwfocX0bOKa1BUR/c6eGlXnRToZr10
	9eu3Q4bcnNiMI79Fy7wZ5bZtSWfRmWn2ARwk1dgeZrdHxa9mC30Uuf/Q2N6OUeCF/zE0=
X-Gm-Gg: AYBFou1fmesv/zfqY2QnQSdvnbbZR03nheIf/763NvhQRQqCKQ49KeO/FdCliRFG9fi
	pjyV9e+uKfxzqYuJjjHvBS3NvRz6dTNbgRDHy9S73yc71kz1qgE079t0f5of06oQqy4hDjj5gIz
	y1yWZVZ+8uW6S8iOkxFhFaP2sg+RH9sRVdKpyv2lacXxb/uGxEEX76IFrnIIxLvR3UzL1swoqL2
	xF77siGyVza77vuOTfvKtcuswwA9EygZLYTusFEhmi/YwyCKMlrcNrZtNDtOSpigeUwhSqI7tAr
	IqYYIL1TcMj4DmdzD0OIn+Y6uX8NVOGJfkpWp1yj2QRkmoGie7MvQepZG7nX9mRDuL9YOGZuxY0
	bd2gWRpJ2qjxK
X-Received: by 2002:a05:620a:3190:b0:93e:f499:43b0 with SMTP id af79cd13be357-93f29cee012mr1765041185a.22.1792481953170;
        Tue, 20 Oct 2026 00:39:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:93e:f499:43b0 with SMTP id af79cd13be357-93f29cee012mr1765038885a.22.1792481952471;
        Tue, 20 Oct 2026 00:39:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 3/6] ASoC: SDCA: re-enable IRQ on pm_runtime_force_suspend failure
Date: Tue, 20 Oct 2026 08:38:53 +0100
Message-ID: <20261020073856.1177749-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: kq8cZ4ZbrR3YPBXqHOSL8i2Vz79GqJfp
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71aa2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=EUspDBNiAAAA:8 a=AaUSbDpTSIYfnfK-pzQA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX8pKWSh7tIxRn
 HQF8FhVVyrg85AQTGdDjm0ze1rY3RmVPG7j2q/bEM4zSZaY8/caEmBaIljp41OHuYHawS+GShhN
 VLpZUObwkLFx0Vh5pow8Ocs96ixlF22eDsVdHGPxjd/9059A/jd7Pa6TavGI/nhK9m0kQdjwZn7
 mGN+/px4a6onu7bHbHy0/s3+3tVbZCMqOs8Qsj+b+TkuKaPgbGGf3XZEyoZtBlrYK2NdWHUWRlr
 iTeLukH9IXYWBp4eDGDMGs4hA+NbL0zLv44RIeMaDIbllso3Mw9JZDheu3rTsRBsklrZ+N4GIVG
 sELJql/3vvHVgRD9oKwFDne5SFpJz9gET89A9KenFE5JfJIxDlMjvZTz2PHFSk+vxauJbofuQfW
 6ASJQbTs5w5iqawwQKSbyHoAIOf2QhFTfqRR0lMoA80Cgu3rU0s8S9PrwsNI7VQAMKys5k4VU9k
 7sOyZzfbWFVZoAuD01g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXy5zDFNIJMqP2
 HNmVL0wnw/29w6VokPLhnyIuNRIc47UXFQJxjVVy5uadjZ9zJY55aUJNl1WG2sLXpyrDxpu2NdJ
 fbwyetR/+sH1n6Ji3g5uga+6HfKzrr4=
X-Proofpoint-ORIG-GUID: kq8cZ4ZbrR3YPBXqHOSL8i2Vz79GqJfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

The SoundWire IRQ was disabled before pm_runtime_force_suspend() but
never re-enabled when the force suspend failed, leaving the codec
unable to receive interrupts.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index ca311209c6d1..ee61c983dc57 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -265,6 +265,7 @@ int sdca_class_system_suspend(struct sdca_class_drv *drv)
 	ret = pm_runtime_force_suspend(drv->dev);
 	if (ret) {
 		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
+		enable_irq(drv->sdw->irq);
 		return ret;
 	}
 
-- 
2.53.0

