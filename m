Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341296;
	b=Frl2x+uRZJGVo0DAbS75tT6Wqutm7SgQ2Xw6QJllxLiCSHrDx9Lf4bcyisv4qiymFWvK
	 REvwNpY2cDEwYsSu7T2QAutZI6IqxNLTPseGdx+S63ztC3EziYfIyMnl5nVXuQRyzngHk
	 WQWNvtIPIlWl+1tyARJdcl2hQYXUuJk+wD1+gLdWNlBV1eIo4IWlDM5I7JkYH0aFQlvxD
	 MVcy38rQ5TUCttWatMkxf36Aygw0VwL+rP7xJjo3PxSPuYGcFoW8lYpm16RYr+6l86kkY
	 AXJp2OX+g0uSZb+jUPujcwFRqoQSP4YR9uVmDViOl0V3FfJ6DekSrUDMj5fyY17HjXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dqxVrQEZ/oVDCAIoQ4x/SQi7P6d7X6DSSXKPwTvXdeo=;
	b=l5Nqbm9lMnWRJyUHnpHLN8Mf7DPn6Zahgzg7inXcgZyrQbWC3drL1+WbCOyM9wJ8vAww
	 jt6PkPl/NSgGSHEXtd3isCbxXTlUizkKy/+xm2Ch8oUPPVSM/M+q3igeDsyiOxEBaUdE6
	 fgNtK+b1fXl1nl8NP6kNjPYNDeAo3r5CNnaZzEK2tAjmhWFX2VFYRYLnF0o8RuJaIbKPr
	 kBKUHLxwz5ARBECcpBueuRXlz2ZfDI7eyVno3g1szGxP4dSI5WvDS5iIAcW6vluuddn5U
	 WfHpgYg8XYOwK/v4TqpcOUNEEywOU/ti72Bv/h7s7MyLXPNrOKgSGV4QxtqJs0z9MoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYKe3LWW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6zF1YGD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2028606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2028606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYKe3LWW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6zF1YGD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F4VN2286934
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqxVrQEZ/oVDCAIoQ4x/SQi7P6d7X6DSSXKPwTvXdeo=; b=ZYKe3LWWkPSDPz0n
	cXuRFf5IqmfVxT48sC13SyfypuJDGjeHdmv8jkLcJDCl5yPVzKSYLWMdhzHh3i/p
	fVGq6U1p/nWj91dJv+3X/DldsqvIFfPgxcSFKiPmA3+F97HTXb5rFLpsrm31GBvC
	XczNDNVkuFFE6wzrU45lxDId7fdfyVR2tKsnwgErCQq5sdP/S9ODGrTOF5L2Eyha
	PvyDdu8o9LVrG4XYjuYNLe3IPS9gdPGVC3cB8A33hvPJRHeY0qYji6XdgapHlXPD
	yLeiP/kZwLFQfpyzl13STZ8pYzC3zX5tbbBnEMo8LXByno1PmXBgc3ktY/D6fvSI
	A3xKAQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhh72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so214299a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341295; x=1793946095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqxVrQEZ/oVDCAIoQ4x/SQi7P6d7X6DSSXKPwTvXdeo=;
        b=f6zF1YGDxeCohhNDgRBTtrTGz+gC3RcuSHECmDTV8QD9x20qIkXXnNAgQjGLFUcvYX
         6/sqR0PkxIJy95XAQ/UfnS7d//aAthnitcwD1F3L3caolapAdwcSADhciQUE6wkNHiDo
         7LHp9CpzjryDuoxpPSDL8Sd228URvuvEr0zipFP9ahTK3RSDTuGnxo1He+V+KmE4dD2x
         pjld+aczVVUNQ41vmlgBIGgej6+garY8keV9aAu/g/NhwYxXXga49bPNg5WXsDzPeCMs
         wK3Cz9DN+1ndEQXm91dU65oRvZVPMuswv1ATX50AjCTrxULimaKZDT/bXfwVo2UdX0zu
         NWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341295; x=1793946095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqxVrQEZ/oVDCAIoQ4x/SQi7P6d7X6DSSXKPwTvXdeo=;
        b=fT4jMM6AC18S7TqW9OFLQcThpxQyT1D7iyBXFL84/5mcI0X+SEnSRdcA6FiiDXuF4i
         bH+Js2v5fzX6J6Q9yKMuR10DubHIYBTs8k9cwKx0qfVRApCuzEP0+sPp7DBsogDSs4/N
         gERi2Cp/1uEX+9JR3hHvarmglDYFM1xM+H4x7cf1h5jSQi+UmyMlkqik0B7SSlqloTiq
         tRo1TUV70EZVr6TEijWbkie4v9tIOd1WZjVcOPULoKF8jOa5BxZJZJeHP2e5V7TnBxfF
         miFs5KK7HCr6wLxw96hH8EVdf49L5ycRmEE46GVdGjLgNUXqhIRWD0ZKqhGA0I88RDrH
         S3fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOnMgKsEgWhoJN90PtTcwXPkr71o9KHFcQaI40OaS4FOZHLn5t7nTIWRoS22ndcVEkojluqfaD4rU+5QI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOkPselCWCZuY3Zg0twxLDuvcBrCRdqafXsFpZ0aHIsGSudSaC
	PK3PQU96vvT1yuS4Y7ZATe4run5uEoLlDZPMP5mrCz8EO0axgjTlJ6xUSnn1pyK4n6+LYXp+QTX
	LlLYVrxUuC7mJDAjrXXoYlDdNhqaPyXwXzuTGghm/PFFTnXEm2h7PqlNSSaeDlICVack=
X-Gm-Gg: AYBFou0cHqSKucKmRO7aUQBUYmwWUBuPbs47Hl4X7l4n04FRr1Fq1lp12xqGRg2Qlwk
	wLG+2dDQ/V4iganaWKoRzR+e9MNTT75JaNLaRYj65MW8/zesZdyxsja1kVie7SFkSOEJ4VJru2W
	t5cOxea0yrIiX8sap5DhaD0zxGBamF+mE9KFo7REn0E2Vfi/8YO2GkoBfP704SsZdhgdtFMIdLk
	59M/PeBzpOVlGioOirOwtdLaw64WDho7N7tR+PI6SnuZ7LLhTCe/x/VC9Ms2YzLe9oz5LI+W+kW
	gbM9oGoS1+QcSjx4HcYyhKPo9cILeFhqqwiRA1PP+CPZrxn1BRUWv7ZD0JjhQ+z8blXC1fl1EiL
	VDU0fbobU9z5BQ949MN+i1K00aBcx1YSCiuscx12Os/zYUoavwvDzdYnLCVQZRcAEdGM=
X-Received: by 2002:a05:6a21:7a46:b0:3de:55ce:75d1 with SMTP id adf61e73a8af0-3e9290515a8mr1251644637.92.1793341294484;
        Thu, 29 Oct 2026 23:21:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a46:b0:3de:55ce:75d1 with SMTP id adf61e73a8af0-3e9290515a8mr1251622637.92.1793341294020;
        Thu, 29 Oct 2026 23:21:34 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:33 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:53 +0530
Subject: [PATCH v3 5/7] mfd: qcom-pm8008: Add PM8010 support
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
Message-Id: <20261030-pm8010_i2c_support-v3-5-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
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
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=5530;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=is9tJ4J6PefOG9w6hMR36Wb/NnwkOqhvAGypJZBq25k=;
 b=kmVIOF4OU4owH2jS6p2Z+iHPtECoZj0IZZApbZn1G23y/MYOOI546bagjqsv6F/irMHry4Mwj
 0UOpDhM6OAyAhTPEx5bU2vSkyPeMsNYHRpxh1DePyalYrADtN81UoQ6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: XbqBDnkCfj0KxtOpARPQbGP7qjSXmQ0z
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4376f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LamtlsxKl8ZIB2y8LWQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX6sbKnrRNoMPV
 jpaNIQerD2bgKBQ92AIbs3JMCWy4jbJjGmKYZSlmlBgeENohwx5+3kWOntTKdHQuYwpKwsKgJdA
 X9Y9mfi6f/2n/1koqxjti8b357ohJ/RE++1IgzAFuArvSkYaLLfiCe+8WIu7f3R/ToI9J9hcY2+
 E8L+GCFumbe3cWrtcvLABuIHX9+WnG7EX+uIC/3xBA6xD79vaMMdaOpqAlUVtV6bV1vcWkXCbrV
 pAOAdF456obgn2+FTOMGWOK9fq6Tzq/7vsc+Po9Z02YKD/HVdXN8IEb8QHaDbaFeYcyEBkNGixx
 li8PAhDcyx7wadDMnF+oB/rLTfkfDTKI2aX3R8Ba0MXFgJZxHdiiJnDchJUUvJ6c0i9sSATpiGx
 WMuMkGzumiAPYhr3q/8CoZodQje+N2EacI+cp+2N8EuLI0XYPRL+QjG2cikhCQ3E4JZX2ks0UqP
 of0UVAOAtTm5HNosPbA==
X-Proofpoint-ORIG-GUID: XbqBDnkCfj0KxtOpARPQbGP7qjSXmQ0z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX+bXQMRun1RR8
 PMog6M+PYRAsz34LavqHHH0FK/wp43VpMk3Cqqf4KPbmAoxa5WPLf2n8jl4Ef+tU9fnOxx85vTm
 xtEu0k2V36khhqyTkK61fhgLSkQ2Dp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008. The device is
generally designed to serve the exact same function - power camera
sensors and the associated supporting hardware.

PM8010 supports both I2C and SPMI communications. The latter case is
already handled, since it reuses the same peripherals as other PMICs.
The I2C front-end is more less the same to the one of PM8008.

Plumb in the necessary changes to support it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 76 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 2d6c01cf54f3..39fae8d48e46 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -34,6 +34,11 @@ enum {
 	PM8008_NUM_PERIPHS,
 };
 
+enum pm8008_chip_type {
+	TYPE_PM8008 = 1,
+	TYPE_PM8010,
+};
+
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
 
@@ -47,6 +52,9 @@ enum {
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
 
+#define PM8010_IRQ_MISC_MBG_FAULT	0
+#define PM8010_IRQ_MISC_LDO_OCP		4
+
 enum {
 	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
@@ -78,6 +86,12 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
+static const struct regmap_irq pm8010_irqs[] = {
+	_IRQ(PM8010_IRQ_MISC_MBG_FAULT, PM8008_MISC, BIT(0), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8010_IRQ_MISC_LDO_OCP, PM8008_MISC, BIT(4), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_TEMP_ALARM, PM8008_TEMP_ALARM, BIT(0), IRQ_TYPE_SENSE_MASK),
+};
+
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
@@ -146,6 +160,25 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
+static const struct regmap_irq_chip pm8010_irq_chip = {
+	.name			= "pm8010",
+	.main_status		= I2C_INTR_STATUS_BASE,
+	.num_main_regs		= 1,
+	.irqs			= pm8010_irqs,
+	.num_irqs		= ARRAY_SIZE(pm8010_irqs),
+	.num_regs		= PM8008_NUM_PERIPHS,
+	.status_base		= INT_LATCHED_STS_OFFSET,
+	.mask_base		= INT_EN_CLR_OFFSET,
+	.unmask_base		= INT_EN_SET_OFFSET,
+	.mask_unmask_non_inverted = true,
+	.ack_base		= INT_LATCHED_CLR_OFFSET,
+	.config_base		= pm8008_config_regs,
+	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
+	.num_config_regs	= PM8008_NUM_PERIPHS,
+	.set_type_config	= pm8008_set_type_config,
+	.get_irq_reg		= pm8008_get_irq_reg,
+};
+
 static const struct regmap_config qcom_mfd_regmap_cfg = {
 	.name		= "primary",
 	.reg_bits	= 16,
@@ -170,6 +203,11 @@ static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8010_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -180,14 +218,43 @@ static void devm_irq_domain_fwnode_release(void *data)
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
+	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
 	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	unsigned long pmic_type;
+	const void *match_data;
+	int num_mfd_cells;
 	char *name;
 	int ret;
 
+	match_data = of_device_get_match_data(dev);
+	if (!match_data) {
+		dev_err(dev, "Failed to get driver match data\n");
+		return -EINVAL;
+	}
+
+	pmic_type = (unsigned long)match_data;
+
+	switch (pmic_type) {
+	case TYPE_PM8008:
+		irq_chip_desc = &pm8008_irq_chip;
+		mfd_cells = pm8008_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
+		break;
+	case TYPE_PM8010:
+		irq_chip_desc = &pm8010_irq_chip;
+		mfd_cells = pm8010_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
+		break;
+	default:
+		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
+		return -EINVAL;
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -233,19 +300,20 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
+				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
 	if (ret) {
 		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
 		return ret;
 	}
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
+				num_mfd_cells, NULL, 0,
 				regmap_irq_get_domain(irq_data));
 }
 
 static const struct of_device_id pm8008_match[] = {
-	{ .compatible = "qcom,pm8008", },
+	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
+	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8008_match);

-- 
2.43.0

