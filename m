Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809651;
	b=nswd6sBrj0UY7ozFq+TOm6mVAeR/i1I8O2/qZbvJTLjzh//LmQITz0wqnxERqmXQjily
	 yjXeqrKGBoHVHiHkIriumLGzeB9qQKq576vOCPICFfTMld6dFQEdEH3q2m06aGTOVpVA5
	 8FQFUkxGjzWt2kU8bH0/555aAiz264cxMBmm2If6lhkIrLbDVIeV8lt6bwYwfrUgHR/+/
	 A3lY/QImMLK7kSgeN3UVJe2W6FJvfwdm1MelkmWlpQFFV1x/QsE4Ag6PTrKmuu7wap5kU
	 CH9enpS998wdaZ5NEbPYuRdTI+wuh9EsLdaZVYs+G0SFHhyRDI5Yne1b524jRrT7qpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
	b=OxVM5Z6Zi6MgBB4kPZt11Ry81qopDSlryXQKpZ0rDziB0Ji1LFxEa8CbMBW7YulzDJ6l
	 r7GeJkittfYinEwHLFyE6O/FU4TraeBXLRsI3L7GhVWreVBfp0XKeNCjqam5Mk2PQRCH4
	 QsjPwKBflfpWIxWwyGr8klDEtwCrjrLJEYF6uFwO1QzQIyLS2ZiXLRAOwvrNNLNcyCZnq
	 u8XFQ4pjre8yQIkr51S3pc3g1LI2cRysbMb7aKb0XNiybFv8CakSms8Y9/p4COQXLiSaA
	 VZTJqILE5gWHmpK9dMETvziWOKp7U8ktwtzeQ/v556y6hmabOE8L1Yr4Qm1oragG7gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwCY0rfq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LOK2lx5q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9C606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC9C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwCY0rfq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LOK2lx5q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LbLE214148
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=; b=NwCY0rfqi2Hq/opV
	fYU5/b+WxjM2res+3+q9Bwb+sZ0jFaJtTDIeU9Gzx2KAcJplQczzAqe0OmOjBtPs
	rGeklI7M8PT7P29hkSDxwwJPBspU/wcc987pRPBjo85hqBElL2azRjnGgVJyBL56
	qEqToHOAQiCW1FiT7+hdabQRcLeHOIj/8sHyG/ia787nDiiT7/tdsor0TTgFekta
	FCGA21Cy5StJN/0mvJTwmM3aNO26pE8CBNFDnGbwbTaPffmkTY4Laqw74eDXYdx0
	q3qlTijMamD/FJEVbnkJ6S+HCRt7Nt+yq+nkog8ObEu+ci3Hw7NYnHZauHmN9LnL
	Uhq22A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqn6gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:14:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so3552735a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809647; x=1795414447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=LOK2lx5q7f4p5rYU3CXzdPyRxMF03OibS4zjo2z2Le6zZqp5SD+ettJBn5Iw6lqhOJ
         GraK3trgh0tyBA3oGrf2t4Jg4XzlvrUzxmT6tny92iWtwQk0NeuyzglOiIws1L1HxcOG
         w0otrHLPgPTPHTLt2VxAAMMLLD80O6BdcPBsafHTcU12cBkcqkmf6uHaABVlIGZKiQde
         HWrur1nLWWLEcWJkldJX927YfhQYq99obNs8fym+SG8eLUho9XF08IdTAGZS61tDBx40
         LWQLsr37jU5vqM2DWET2H/p55HvAx++02oqOhJUClvNVmvdydUWHWZMwcZTQJbQiZiiR
         u2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809647; x=1795414447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=eRCbBycR8BKce1vO7vpWKxoFq0Ptb027R8Hq1b0vdW+7JU3iU8siNxVRuu74214PE/
         zvnaWA0M9TSbr/lbqw17cf8BlMYgR0r/Ug7ag8CCK5S1zohBw/XqhQYR3OXt5sdrEDs6
         Pj7gl2B78adjuZoX9XYu0En2YX6amDuKgatXk29WVQU+HYWZc/ac9Xziul4YfQ770UuH
         zwpH1fGgc+nfutUCgVnKNEOyOJmC98AAJf0pMpc83BvYd42VGjwxRgeoVjBlEL2SE8MN
         /k6ubEUVVyR8QoaedfQWweU9kOeMi9+gB0dTZtMq3+qLbQA03psAJvr26DRoLGPyPtch
         QbUA==
X-Forwarded-Encrypted: i=1; AL+hErHcmkx0piSAQeTdW1OCtG1yWHlYoFPABXIZQbRL5Ptr4H8rrnyHpmrt2oMwipUEHvwnQSX6kLHfvDxrK1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z88lDjaWOLcb8v7Dw0C/6er7axCl4GWQaN+HgFx3mLHJ4VXujJe
	L01qZXJFq5o1KVisc7hvom906HVSe4HdefC4cpMRBswz/kF8F/DNi2jcYcpL4yybyM03dP/gtGV
	iIPBWz0NMpT+4hb1RR8Kvlbtw3xjoj+gvGYgHKW0v63mydJURhGz0AzZufkY6VarMs7I=
X-Gm-Gg: AZFdTZchTxxxfj0Q5uSe5WRCQ0XMAyvTP4hrnki57u9Z9jjva74z+vvixQvUdQHxBFG
	AT3ZpnZs+RN9ZRzyc3WQJ7g8SCDG4PLR6Ik2UIPnZ9jVx6b9Q8QbV+P9N7F7fPZOzDG6Guq1bIr
	yhY73U3ovIGk6mvR8nYRIEEWc4cEEaihMIKWIg8D7RYqY531Mt7xP8PzUAcnMVfZ6dRaRfP0oYQ
	BDU6HTyzzusXaTyhlWePXen0xKmCtatYJp6idNInccZSXHBt9DCLU5HbIc2PhZ/1KdtcMGCyFNO
	WACMSRlGLSV2+zbXc9RvV51oM7ZaQjCcw8QcZpU0Ja2CjXxLs6xD/U1JAUY+9k6EbT6vV4sTZI/
	He2xYsQcYU3rd8ohIkWv8y9fXTcqBKGbusnD3OXnTIN9cGirgdZ1bENG0XBu2XztYFywL
X-Received: by 2002:a17:90b:5687:b0:3ac:bc3d:6fe5 with SMTP id 98e67ed59e1d1-3b1b089e26fmr9640090a91.7.1794809647089;
        Sun, 15 Nov 2026 22:14:07 -0800 (PST)
X-Received: by 2002:a17:90b:5687:b0:3ac:bc3d:6fe5 with SMTP id 98e67ed59e1d1-3b1b089e26fmr9640062a91.7.1794809646534;
        Sun, 15 Nov 2026 22:14:06 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:06 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:22 +0530
Subject: [PATCH v5 4/7] mfd: qcom-pm8008: Drop GPIO support
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
Message-Id: <20261116-pm8010_i2c_support-v5-4-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=2884;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+08zcnHr6A7yFclGJxbZHZCi6ixkui2rq8+7R3gOZmU=;
 b=/vsSAQbip/tHDFPtpttUpBSJJspjd6Xf4OE2fd5cc9VsOGTkmiBe8MQdQR5VzGi0SGfEAzwht
 /OQ47TlLAY1C//XHPSWVFkv2MduIcndSB7RQUM+FX5ARsyzO9jDt6Cf
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa9f30 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX68iaBiCAUENT
 cELbc3u2L7h6KLd2Bsw5DpxFNEwwk9gRPMZ5xveSTWTRyy12qsfbRp8yGe2ndbMCDsLMtiH2HE2
 NfV1kST2Tq/l5ZVFG6Q/3WAVwGkzIhQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX1SmNm0AHxnNr
 y+9NjXKWh954Ef1PMZPrawTW2Gienx7bVEeCIxXH0bxG0qRV+onUfEKbWMZw882U8/Zwsgu7DIE
 zawiF2aGR+Ukgsy12Oy45f/7bkxmUL5vHstBH6VqFIDfDhRI5QjZ8s0e3IisNpxNimc8EZXXFOe
 DRM4+tNu6M2Yuiw2w2SurTvA/xCSN/TT18p2b0Tvx5ste6j4NABqLrHtj2jnt/6hFj+ahD/XrQx
 qunjHRwoOHjs0deuBbNS/lropchMXsxngw8g6gVrjGAhOKAQ320K8FlA4QHFIc1IUUAzrwKHgd4
 S3lzQvSfX9AtyuCV02SxdTC3PE8ceoEqvqnQUoiC2X+zr8NWFsfZfznUPVPVzJ/KFlufCbX8mzw
 07sgiMGvmYoLn9sRG1zqEMhcF7vlnOVLZHaRJnwXfsDKQr33ax58HON94X7HWxrNdCf059I3t7D
 0t2PWyBvonMyxdd+otQ==
X-Proofpoint-GUID: 87CaT-F4AlCZm7era-_SVCKNpCmMQNxy
X-Proofpoint-ORIG-GUID: 87CaT-F4AlCZm7era-_SVCKNpCmMQNxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..2d6c01cf54f3 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -31,19 +31,13 @@
 enum {
 	PM8008_MISC,
 	PM8008_TEMP_ALARM,
-	PM8008_GPIO1,
-	PM8008_GPIO2,
 	PM8008_NUM_PERIPHS,
 };
 
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
-#define PM8008_PERIPH_2_BASE	0xc000
-#define PM8008_PERIPH_3_BASE	0xc100
 
 #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
-#define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
-#define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
 /* PM8008 IRQ numbers */
 #define PM8008_IRQ_MISC_UVLO	0
@@ -52,8 +46,6 @@ enum {
 #define PM8008_IRQ_MISC_OTST3	3
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
-#define PM8008_IRQ_GPIO1	6
-#define PM8008_IRQ_GPIO2	7
 
 enum {
 	SET_TYPE_INDEX,
@@ -84,15 +76,11 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
-	PM8008_PERIPH_2_BASE,
-	PM8008_PERIPH_3_BASE,
 };
 
 static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
@@ -180,7 +168,6 @@ static const struct resource pm8008_temp_res[] = {
 static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-regulator"),
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
-	MFD_CELL_NAME("pm8008-gpio"),
 };
 
 static void devm_irq_domain_fwnode_release(void *data)
@@ -252,9 +239,6 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
-
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
 				ARRAY_SIZE(pm8008_cells), NULL, 0,
 				regmap_irq_get_domain(irq_data));

-- 
2.43.0

