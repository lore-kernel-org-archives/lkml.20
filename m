Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648E38839E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759998; cv=none; b=SIjwgcKoTUIGIdycw0YirGbsyaJHp7oo8O1haoLmhJJDrQDTU1H6+8WiQ5U0O9w+P7msSgPBiwguIKbN2vndG/lvIQVnce2OepwPz5LFHgGT4NSACvDlrM4Ec9V68NvbnK5GINUO2xEEbHgq0oDnqkN49g9GfPJm8KUoA1ELfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759998; c=relaxed/simple;
	bh=rL0frKHxgnmCItVj9IJ67HgoHPnZ3HbF9GZQ+/YiYjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DivuPfgu0itn7/ycfr0UsM2lIB4m48Lb2l2G6/BTVY78Q/ScJdVXJCIdNTG2JEdxKybqhTBfZbbbWHR6lx9RwztobjIbd//5QZ4uK2r46oBaxVtLA8O1YG60Ft03ZZ6oYycIXj7ET+ZTpkw6Fw0mF3Vw5K3ABbzVFpiXmrdk+Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPlBoK8h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvR/xSXQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPlBoK8h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvR/xSXQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l4Y33712334
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 05:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=; b=NPlBoK8h0mynd9mq
	4YJSOleCwCJWEr5/+aLxhPSrsmSVoJQarbKlm9mzaeDTHLcW9AjehO/v05J+KNiJ
	cpV8zc1WcR7FIOmw4SqRZpLURWvYDhoBeL6ftfyL20P3UhQP56u0MnnfHgjjyluG
	lpsMkgVUOd4Iw6XPuwRYDLpS/k6F3payT9bAq+JylmIvU4wCEBsS2hiGmvtiZEvk
	NF0eBoTm25YibJeN4kjITrO39+81p4HTuZItooxfW2LbI3iNgwdVLctMho0NsGte
	/B9fvxf8O64eiKMZiDm0r5GaBwjOtu5hvMpQtvMio+NPT2XapdZWTKy9uRkwEcOF
	Ckzd8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjh045-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:46:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so4707815a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788759996; x=1789364796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=;
        b=OvR/xSXQ88MpcrSGgqykTQ4TqH9fNf6f/eKza8EZmFNwOazCZ5/V791YEyf3aZw9dD
         Nm9SOKFC90wGR2j5fgQsPULGGdsCbDUHsTbTk8b3jzjWxjRyfwMUR8oA3cglU0r2/PI6
         2ugpgSkCWbTM+dv58USyWkQzjdqiJS2YCvS4nr+TVakiyq6+Dv1idI6t4zP7xVhJDrGO
         RVeMLTSXynfP8MEhbm4S0H0Ox3Gwdo4eGTkdF4h8CAad0OnzrEzTK7ttoSt+/CesgQHN
         iCeD4BcTtOJEDLtUOzUQZ4KmV+3GtHvsiiG9XORH4UvV2ayPS9nUjikdsStiLo1MbPM2
         Ovig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759996; x=1789364796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=;
        b=USWtdtd6oPEHOo6PXiaLNefNJujy8ada55+OeDUA8RU1jj4B2sr9MQ4f4EB+Z2HXpk
         Eu67ZMcNxsdPGRlnOBJ5nELpoYUCLSf7Ad1HAA1fBAKm3FCTY3JP7fG+HK45rUz2bD18
         /NRFVZyjt1qJvGUzTZ7XxgnpqI8xQZNce2YvqE0L3C7Z2gX9eDaLuLgra1s8LuX0W4XS
         YqXIqs5yLMfYD3+z4UjFRPfhLkYlUgBG22sUa+VeaGJFDwoD/6iW0/1DS7OKn0fQciwR
         RTEOTcTFH0ZoJySUrCsC/aPNK06jenR5bEv54pLkWsVaJ3+iJiMBgcMRsa9HAA6uILFC
         CWig==
X-Gm-Message-State: AFuF++m8aZAtJtdBl6DuSsnUroO3eXU0f7EKd/tDPWFWwoaESr2cnzN9
	azYWm1hJRi+FFS6VzWNxqR47X39dnGeu0OnOWq1/v3JyRqjKQOrMX4CFy8UBpof1SbNXRNNukaU
	LNAYJWKV344+PG7E90XqPo+SmXGHisyScMPB2lCgS+M8IVcPbfgpWPVBRFucMvBAHo3M=
X-Gm-Gg: AYBFou2HKMY8HQbqhPXNZ3GU4stp+EMhyzd7qCT2DtrSWMrQF4kW0AmKYbvXuRjANTz
	bqrPlP5ZuYAY6UX+dKCLZT7HNTCwihG0oSX7S67/hNLKZBS/WwAjwRdRlv21jhXhfhBdmMPV7Ek
	2VCCpIjCP94VgcwfZ7cExcngpSPFH4zqLBm10jCq2AoQVgkKUFYPh9vaMnxHXKcZfbYWcy1BLiq
	/x6i+9qlkEu7XeznxfBNv9mhvCTR0jjaNTdzEoHmXQW5cVhtrsDHQmAeC0tg0VYbQI2kPk7iL+c
	0xHf7YKRExvWX9Hu+Vf6xYuuwLPlpqsULNzNf44/y/rULlwtabXVXPaScA4Ks69LM2wiYKQweWu
	zN8u4efsBwIZOedaPDoTXOJOYrokGtGfGQpUb
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr30855625a91.22.1788759995960;
        Sun, 06 Sep 2026 22:46:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr30855586a91.22.1788759995515;
        Sun, 06 Sep 2026 22:46:35 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24022589eec.22.2026.09.06.22.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:46:35 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 11:16:08 +0530
Subject: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759980; l=1489;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=rL0frKHxgnmCItVj9IJ67HgoHPnZ3HbF9GZQ+/YiYjw=;
 b=VQFs6XoU58lnpmyWscfaTZVmMbtHPpwPPRNycQpO7D3W2XAg8qJ6UqWM1apJfX7GzZjDZSxjW
 XaHkw5kMk5sBNt22mxtR3UZnIOUM09SuTnpjRYEjsegYfJn6NF1NxMm
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfXwb5Ftf80D9fG
 TH1iG4bcHQxDizOEIvAdxvrcI37/A72jnJYPtB0pV9iPaLyyCa9Unt4N+ZDYYx9ORz1x0iJIsqj
 gIdbafDYyN3mNqXPVG5JwwrC4snMH54=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e4fbc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fDsZdG4RzIHTu_4XfosA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: BWmBup3XkNwY-1t7_S85DK12iwHtHxlH
X-Proofpoint-ORIG-GUID: BWmBup3XkNwY-1t7_S85DK12iwHtHxlH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX/RJfvieqbbcc
 Ttx7LUIeSTD7gaAiDd3nswAyqMtPMXqziJRZMEZgpX12Ry7oPeJl7mK3mDyJXnOrnTKRQfg/n0P
 +2XRbVre2+H6JmIr4qiInPM86q/e6u8AJWiKPyq7Ezja2UipKuKwb9boC1f10aDcCTzZ3ujBqDY
 I17gBgXGMMBaSHiWarCsikUT0p/YRhpebMl594ZRiDA9fKKAcsfS5kcCv2ESNvZkEteS8jkSmmB
 kqEvLDuwACb792fgE9r9oVrhrOsc0dxmjWt6e5TMk5DsZfU2YHKYVL0c6j3wo9anTHTs6KGBYdH
 0Fg/C1oZa6eqYaRS3nbwPctzGyzp28nD7TtWrPtvFVCn4MwGFL7KfUtR6ffSTq8Hk2kyc22+c8O
 qWU0Bo5dy2jKMaCN94EMhcft1JpklTEoC5nCF1ocsh41XAmYf+grGABUvyQBTp6UzMtohKBZqNi
 IIDN+nMk6xa/osJ7MEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070060

The Raspberry Pi 7" touchscreen panel V2 MCU requires an external power
rail to be enabled before any I2C register access is attempted. Use
devm_regulator_get() to obtain the vcc supply and enable it at the
start of probe.

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

