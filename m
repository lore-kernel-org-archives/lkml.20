Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD754D09F8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974021; cv=none; b=qDQ+AJKtO7VjLPHVDct2pk1+wGYpsB/XA8774FPksmqlSb+drUiBvGR5AVfHVtZ97rhpZu3o0Mzi0XO1FGH99TIA3sLeiKomStXgm9h3wbqHzLAQyX7Ud/NM54iGf6lGDLCXoGZuX9uMsEsYLUXZXGsbxWucQ4owgte+dX2mIJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974021; c=relaxed/simple;
	bh=hxIjusSCBorTVqOq5RuZvSDPBIP7IUeJuk1QW4jovkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hwj8JoCnlIF9QMNFt0xFJ8ctbmB5AfE/O6Xud57uSPWD1FRw9FVUn9B9jqbhtTet0rIs09Mj77r59XkVV/F29WQv0+8F/UG49/VJOz3URKn1dhe6AwTmWqXSyxk9IbTTHn8wvlOjmvcevT0gXMJelhz8Fs88iC9p/C9VsAwtZpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAH/+4HA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDTVZXcD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAH/+4HA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDTVZXcD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAC2P9806986
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=; b=kAH/+4HAiNunpkmQ
	QTW4kTAfdcM5OQpSxHhwyyLB69YptJeAANXSBbpsX8ZRLCfYXYJqKZGuiDhiURp+
	LDuzZ9OdshcuIVQd9/C7hKG7MN0CaHQt3OZpp63gLHYZOPh7t33Le0XC887NoE1U
	4MpsuRoJtA7Yvb3Jx2DjG6DIp+OJq3dlsMjtMoxiyZP/3/ZWS0Dvc+IFa5A5UrTD
	QwamdLLhf1YWdV16oJw3QMQ65R+J9IH7k+Cw71pVQZcOocViE3pfBBHBe2wtUMZY
	IsgNcvRClptPAr2CXFr4/p1kFqch/IJcFefZh5l/xZTESFksP6dSaNA4tIYanoeR
	8+99cw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6b08d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so5198133a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974019; x=1792578819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=;
        b=TDTVZXcDQXxBhCHfk0wwkbcGEHCP908vtFTzhTFYlbBE5Xr20xNEW75vCf9CrQK2ay
         /1rEaTckX2hCaySt1Q62g6GcwCQV8yDQifyMxWJ2TzCGGHrHtnxhtoDVss+kKY+CLS62
         8RDkE91ig/SlB80QPnjO+tvejIn7Pu+dYkVrtu85sryoLpQAYWljqTFLgOmuUe7THlyQ
         uqo57ZPX7XvIeO/IwzJinQY4SlOeIb4CK4cYZcupFudJPxprGnPR+6PZ6g109IPgwlq0
         4dAmvKdURLw3U6C/i8u+ybG3QHrvzTJHDz5PH8APcZ8jPCKFfV6TD1KgW/ZUPGFi5BFa
         qwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974019; x=1792578819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=;
        b=aB0WrhTkfsqDGeltf/Nc4eEXTx8Wgly8edxEzof5cmteZBehNN8pS2wQUK++ACw+Pw
         cpElWo7JE/0P4WS+mHSpJClrqRsG+UWAf6OW3eKyhxDjWtg6tgcok1zwYEALcVdvciw1
         z8faNcoaxTh0d5J+luYvDaWdSOqlSKPg7G5bA3xNIStg3Ako3+dg9VB0+wv9whdFr4LQ
         PICIgKWOGFoS/Pdv4A28S40Gim17Otjt1y58Q5X18/G1EnlNIQyXcnomR8XymR6HNiZz
         RdMSUF35CF2totk3ZsbLBxO2vPCM7d1qYkBkwu5xJQSbTGphSlQGYwAF+u5TACL2mDjP
         U4sg==
X-Forwarded-Encrypted: i=1; AKwUvBx/QlMa1iU3amaSr7xsdjpQKG+YIP1DiMidnpwtKkLXRNVpHsSrJTxDz/uA7PTFM6ckIcLFiftDWHg6sbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwtkUCKmOLwaMFP0F6RorSAGPj6If7YiyoRDxhpDuEiTNuBb7M
	4hEcrT7nMovIne1vikWELnatRvfg5nyv2qlgw4PsLeDrzZw9I+QldF0caSLL+bDPOWwsjsLL2cq
	ZkMs5aWTnBGnFuDLfca/jqszx+0e1HBB5HTUk1Nfg+8E6jYtP5PTaq/xxJNuHYB9BEBc=
X-Gm-Gg: AYBFou0Bj6cQgiDr3CeD0ZZv6bTbHshmBSEFa1RBSH7jq/vIV9j/pX1VoPaOnQD5i2c
	wn7hhk8JYbkgbboES0RDjB+dcy5jkJHWSQOFQxPkVbziOGb7Pvb0Ja9KcdKqweYewLSUU73cImE
	3uyBQGKQqlBXW+3pzQDxCMyR0W77jZ4IUthkGHI5W5qOfDEZDGZpQH1bGEFW4y8ABo+3hNiWIWo
	uKAxQLk29iMRZdAz/heRR9uXtiJTWToxMnIsmCd6y9DzuXRqMPVoQxXd3gCYC5YAmSKIzaWRIWt
	SOOyiU9uSh3mFai5FJZ5ZjOYJJev8fXkrmbNXmYsG97QoG10paqLVB2z0hcJEBegEhCZzGW5BKF
	eYtu5WZLMCC0w7OqS/uI=
X-Received: by 2002:a17:90a:c885:b0:3ac:7c98:dda5 with SMTP id 98e67ed59e1d1-3ac7c98e242mr456424a91.51.1791974018511;
        Wed, 14 Oct 2026 03:33:38 -0700 (PDT)
X-Received: by 2002:a17:90a:c885:b0:3ac:7c98:dda5 with SMTP id 98e67ed59e1d1-3ac7c98e242mr456410a91.51.1791974018007;
        Wed, 14 Oct 2026 03:33:38 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:37 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:01 +0530
Subject: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=2664;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=hxIjusSCBorTVqOq5RuZvSDPBIP7IUeJuk1QW4jovkQ=;
 b=AElc/WvIvPXIUJVp0/t2t/wfMdZneAGVDMqv6c1eqg/ofRpLZRnZCcWvDZpBFXFjwNWwthwB/
 qvtaWtqShfSDU/dqcmBCTSGlT4kRgk90gPSK8IDpPe0RlysHN7nvVKc
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: 33gILn0AH5i1PQAmssYeT9FRuTDDNs8y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXxNKOZChqkuOx
 k0vgKouV40eIEZ0eG9hOzldw6A0omaxCyjomM6JLsjB+CXuTO3MLwB0dHLa9t+YxgUHET0uNV9Q
 QNxBdQPQiR4kbUPEhtlysQ9waQ7Y8+g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX5+T58rYpfErs
 vdrPzdyC82sVbsBp1qrlWzygpGDUqvTNMn9HPqQE4guYusRP/o/WLFroNq/QtJ1jhPduWyBLxXS
 J0EnTNCxFbeCM+mlRq98CRHfOB8c6vgMih368A5Ls36sS2WmohR3D8PY6wAvZ7OUsZs5hzJ0Zbr
 MoReDi96csHR29Nn8vUxFXvrl1TFXwC8tKW4g6LW2oEOOSzQg5Gx3J0QnMuD+wzlyniIgCaBDK1
 XNT5y4/xFeJeOiMggCmR2sp5RrLyaehyVvq+tcAlagoE5D7ysi2ChUMQNk0qZLncR9j2YrIpfd2
 W+mDnA50Hrmi6GX++Q7gCyVYprbKHHILmWwkP8fZ0jv4AUuF69mVA7Fh6CecCe3fDNSWq4nZhKY
 mRwavhW5XHe97OO+0C+8psoQ+GS0EWfpl78GqH1XB81kM49EtlIDgqFqGwQCdp4ldul27dFR0Sv
 IRZmI1ASTlICUxnvkSQ==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf5a83 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 33gILn0AH5i1PQAmssYeT9FRuTDDNs8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

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

