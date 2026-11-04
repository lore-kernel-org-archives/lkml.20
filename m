Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779871;
	b=kOhQ6XvBzfFTbudxtEvmYWPA1FEcz+QJypUtK2k4Em4UZj4PRBBy3trobAzQpo69TI4O
	 1I/dcdGE2MPadFGG1tWkemDd8c1zbTtM0xB3AYi/WvT975jMjxI+5+jBW/21DWi0xCiPc
	 0qsKcpitEJVyfcFqqlI7sh3CMBola0B1N9pgFag+HoKyvmrN/bw4SFeUO0bACV75epwvm
	 O7MXVtiFZ3TsJN2QaB0zAD5XxitiFCwlnHKxF3e9iayCncfnK1b0/bA+SJ664DUWnl0/6
	 Oq2Lds6Vk790Zg4CEAiBde019WIcO5o8Y5u0gtDsxb6bvA1zapqpWG4X2SXGIUiZpMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
	b=n/csiHUIx7xp0SGZALWL9QtFocrq/4Ci3oquStnTa+4eQBRE+8/oulKTCZyzgHFi3sNG
	 PbHHHaRxUrVnTQ28U+WN7nhwB8mvsr0IZeAR26JzdY1CCCRAKGXRPNQJfbKh44Z1wogEp
	 SxnEp72/4GnXAgGV6SimmrUQ/rsLAE8vtvlf47dsYlnhXVNBQL/4EK2NM/QyvNebb7dXA
	 No1xDT4phHP8ix+Dh5A6oxhRij6C5L7TVzQvqOQ5gkIKoOwaXnrs6fgS8fPSt0eRe++S1
	 Bc7fk+11UXNPgM8bw7YJULJDRqBXlqTaX+aDSP9H6vuZi4NXiU6+th+ISga2URXtAXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Q5Hl/FUK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQb2yDYF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C057606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C057606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5Hl/FUK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQb2yDYF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43OptA267281
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=; b=Q5Hl/FUKLsIrDvnJ
	h8l8F7cD8QbVmi1BSMZG8XyGAH5dW1ezAryoqO/XJfHg+nX4NAyoJ6PdsM0x9GLg
	VRngGW9BW7IJOcTGX3Uu09gfTfMFzaD+wwO523W7RDyECOfypRcA6UVn4FrBaOhJ
	QYmcIPPsJhWuUb21Q4SQrddWJB1h5T5BU2qjHqe1MgYSGn6vcodLGKe4Siot/hAl
	wd0eiAb262P4cbEVNvp8buNLUV4DvkFlMKHPvJkidSj9zewJrWXFPxPvVG3Dtq+c
	gJPI46lZtSavOb9zAgpOcZU1cL3Xk1bpHnKWYK1AyMNBEquY/A0xjKMLqaSD+SKj
	1uU3Tg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg915y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:11:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so349135a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779868; x=1794384668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=CQb2yDYFAcxyGGz7u7syvPzZMAdvGU68fPbr2OQlIcLfapGtycojdEXXCCGaqhwbxJ
         +p93HZKia+ktdlMrtxniuOSrrbGRB+ke5pk5qNNwpluEU7PszTZH01ltd2jFU0mR8/wS
         SXOLSMoYIoxtZpAL6eM3xsuV/RvZQ1p6Bw4JL352lrun3SaykOGQvazN5cWkDOzRqZyu
         7kfJ2NaTLZJ/nv4s1lWkzAF402W4juEz3e6i9YcrvOD+RfXbWsH3DTuR2aI3JWo9yHRA
         c5F/OyDT6lnLN8+hOPo0elpJzKPRbBI54SPCOyyqS5m1Ez57BblcVrDFg5Cwj1M9/2Dp
         pffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779868; x=1794384668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=oENOq3O8T8i8T2Gc6OrxeW1kl/KD9YcXUuMHSpb2K1yufEaB05GehxXFvMVuSYALIz
         b+yvRddPa57zLcSXVYT/+QTKSKXOfwLi+0Dl4daiLPz2cwzOLRksE2qdtiJVIJrYAeP5
         vWdgUBBVTsjofp6debhfzpl1DLD90z9NzI9f8/C9+IzeMLZqSeMZzLCb4TeD/GPBTUM5
         nPixP1jx3nilYY1Uy+xOwTw2SP92q4HJRh13IVNL27bHpfBlfDDizUpDpJzisprHsLQR
         iPxwShq6QBSI60+wpxwWD4/oCvfpu+aShSIEiuWqtphvP+HydHZbsyBjmw5zPm+u5xgj
         wPyQ==
X-Gm-Message-State: APuU4Z+kEjLF4WUuWvT5dnvWPzuVO18xGQ/HIq3lO6Qed4614ypbJsTf
	8SJmySSTaXyHNQPN8WKLd4bzUIAc55OYRKnrQoeEIk1JSr9W2gKRkYRHM+IE0oydjdijqUUN7Sc
	L6HI75w4kf1Vao7r1PuxJPLAR5iyY0ajoeiYHjCbFa1aHBnN03N/ilO+zrARE4UZVha0=
X-Gm-Gg: AYBFou1lGw6EcNabOYkcY1CAPsP4vdh1ITrk6+EJhVv/LYMPIgYDQNJJbDPSSaw/Fgy
	GxHYKGfjfWj9XXrihEuhdnQEkSghFZ12dudf93OrIdHx2BNSMMRbc25AISFt2EDVkLOW+aZouC6
	W92xrxjniZaL3qhzG7R3l4LTwztteoBg9Q/EHj51e4US3ebbdFUPAZK4Qshw+nQRnwkKsu9sjmr
	7hV6suY3WQrroJFVY/KqzI3+3kwkb2C3Kx613LzdEm6byRe7HZCqCgIBDAA5nSmfiiLhX5sqAbx
	GQm4JtRBNxwV1UijKgLVwP1FbLs56N7NVyLS4dmgoFqVXCoiAyc3+qqOvgpV+Uz2bxa2SR+8hsi
	ssFRZ9ESe3ryWgOtA8VC1heWpBNlzjmEQgw89Vmbdqq3xW47j9neR+Jq+6e9aGtXAThLDG4x52s
	LNInBCANpABQ==
X-Received: by 2002:a17:90b:514f:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ae897e224bmr11430310a91.40.1793779868309;
        Wed, 04 Nov 2026 00:11:08 -0800 (PST)
X-Received: by 2002:a17:90b:514f:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ae897e224bmr11430278a91.40.1793779867692;
        Wed, 04 Nov 2026 00:11:07 -0800 (PST)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm6089920a91.13.2026.11.04.00.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:11:06 -0800 (PST)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 13:40:48 +0530
Subject: [PATCH v4 2/2] regulator: rpi-panel-v2: Add vcc-supply support
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
Message-Id: <20261104-rpi_reg-v4-2-3578e794ff45@oss.qualcomm.com>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
In-Reply-To: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793779851; l=1681;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=QWiYTLoT7AkiN37vBI/AE7LlJlRi/CqB8G17hwaEjjU=;
 b=DVVLCw4My7UiHN4FMaawHLE6nfj1PEFdkTtDbGuC4Uc8xs2R2kBnhY1R2CXl59nV6prVtRdwI
 MNy1Pr+uH0aAnwZmZJz/05OZFSF14PXJ+wjAgHFDCkkHC+/mCBWii9h
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeae89d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RYO69U5GnIJllgjd4B4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: NU0hvo1e_Na7P_lTNnBQwrKHjDbJyrGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX30u58dGpH5dN
 rKaoWddTztPL2WkB/s5ahAO0Erl8qzssoD9ivzSU/cEv2sm0bq2g5Zc3ld0lUjJaFHa0rGrqnGF
 7Q+gnNK40Yts2B0eYeDCE4OjEX2yYZK+2ke087m0zwwnIiS7gp+AW9SRNcrHJjgkdzVCO1CqOCn
 dJPwiWlTwBTfRSWXY22ky6IGSlL3vNjnriPISU/WsLM1+u8D0njgkS8XWXeOcGV9Tp0cT6DhXlQ
 HIJ/zzXyBQM5130fNYsFw+OxFhRubuLOyFb5iJS++ciMLbC6eDAMXtNQwCks3hBwZAEWr/ACZUE
 CNuNPKT4ODL1ZKIOYOwKs3R/dMYAGnCjIWCbd9L3IbkDbHj1DHud5pARDJHolLJ6LeWod6/Q3EP
 x6DGzdLJWBO1jKDBNyuDKvRgUj7OAGvO0u+j90dG29qd4lGKgycyWvY510rkPa8yFVB/DdCXbAR
 nfap8GWfhy3wgbBZa2Q==
X-Proofpoint-GUID: NU0hvo1e_Na7P_lTNnBQwrKHjDbJyrGF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX1mZN2LLtjtv8
 hsEVXskACK0mXZnVCTynS35o6xU4cjwRt0X3uOLM0CajSQnn2qT6i5W5i4Of236CkKNJl4Gcg1F
 eIZd+rL1BcvupOLu84wuFKPHnxBBwoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

The Raspberry Pi 7" touchscreen panel V2 MCU is powered from an external
power rail which has to be enabled before any I2C register access is
attempted. Use devm_regulator_get() to obtain the vcc supply and enable
it at the start of probe.

devm_regulator_get() returns a dummy regulator when the supply is not
described in the device tree, so device trees without a vcc-supply
property keep working as before.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 drivers/regulator/rpi-panel-v2-regulator.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index 30b78aa75ee3..e54d675962e7 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 /* I2C registers of the microcontroller. */
 #define REG_ID		0x01
@@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
 		.parent		= &i2c->dev,
 		.reg_set_base	= REG_POWERON,
 	};
+	struct regulator *vcc;
 	struct regmap *regmap;
 	struct pwm_chip *pc;
 	int ret;
 
+	vcc = devm_regulator_get(&i2c->dev, "vcc");
+	if (IS_ERR(vcc))
+		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
+				     "Failed to get vcc supply\n");
+
+	ret = regulator_enable(vcc);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to enable vcc supply\n");
+
 	pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
 	if (IS_ERR(pc))
 		return PTR_ERR(pc);

-- 
2.34.1

