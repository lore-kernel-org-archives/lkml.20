Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEDD51AEE4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749826; cv=none; b=LQiMI0OvjYkkJeS20LcZzG5Dm3SmeRS6Qoha26wLevwYkxGNDqBL4BzmIeSFYqtMWggwcP9qoOQBKDoNhANAzCtswWWcL1sIhMontKzMdEoVlmWBAJmhMHofgw2EkGaFRtNYgC9WY6IvIl8DXDha19SUL1qvcrN/2a7W6xcxkOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749826; c=relaxed/simple;
	bh=FOW8Kiq98EhIhu/7tX2AAc+0Y+6AW1oGnc3unjB1isE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nOgz/il/zQbyzAkAQhq9/UVWZBos2dv+yI+cWKXmYkYN1tHbUkRs31mGNBV79Gc+H28A4vx0N4hw83sUoTDg5oE003f7DBpj+8sO1fC8MfoIgB0Bmda9oSMaSesq+AZWuuzQVB2W3Ts20nXu2ZtkbBpkX8hgdVJ+ztrlGjyZz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFRICBs7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJI5n7eG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFRICBs7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJI5n7eG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IFcYGk346161
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEDVrcahh51PBiKZ8KgTkpBndUo9irvZdAIZOd73FVg=; b=BFRICBs7H2Q1TSqJ
	rTCdJS64OpIRKjeO561FqY7Sb+fxzB0Y9dadE69fifQTyyvJ4hcIjJUMIAjIllOw
	Ty/tQQcPbKdQS64/5gaMcLPJwg9lTkGhGFUfxC+vFgDw7HZij/raQlcxg06H8Ap7
	7BDJnSuDLgca19xjg1rM9TbOhiXFilIsYll4ZBxd8xEALU7BDVC0fMbTJzNpD/rO
	fPEf2xHVS1eKRPp63qh7Q8UMw63CEAEv7Hm9H6NCZyNckS3+v3Y6HjBxrwyrI5At
	YCSH18g89N9Ko1jzpZuLi0SpLGMGWAS/SXy+gwCcgrsoge31JTrJPdPjhwFbRLFk
	aIYPVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs84a09yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:43:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1452870a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749822; x=1790354622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEDVrcahh51PBiKZ8KgTkpBndUo9irvZdAIZOd73FVg=;
        b=QJI5n7eGHvx4NP8G0PWFz65MQF13TXjGDJx8ta8I3T3s2iH5ihXxr0rX7ETc3WAmrp
         IVxLA465SAtLmz98M2O51jvjziu0kdKGmGlipi6zxy8VYJELOQiFZxe+kJ5Kle2wZqc4
         3UpRulKhCNKWNe4ZDt9qMA8zsBqqXzxbd4mzibF+bmd8CnZeZRjC3B7IsHOKJPEMFOJo
         JKG34DpYUf9h5IU/U8U5HDsHXZ5qGHdv3uUGG61JeHO7foEsWLKSTmN69tMviOipBvh5
         EXRlraKokMHTOe8VzE8+QSqJjxIeEgK+uuOoy9S4Nfa5yanRdKp3Ia35tQM+XXmKnZoD
         Sv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749822; x=1790354622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEDVrcahh51PBiKZ8KgTkpBndUo9irvZdAIZOd73FVg=;
        b=kHy+HqL3YWl4dFMqXEJ47r8xGojG4Sqs7Yl0CSoay/gtTgm2477/25CoTx18FQdYB/
         IxUck2pMuGjVyxYcLpHigl4AD5rNrOwXhbsk5TTA+ZhNx+GnhebC1tIJhqHhXok+RQD/
         K0nrW6s8R0cB/KVDxA+2y2CgQBg8GCqFpR2yiBdKWzWUchdlhIPuQZWbVf9ITes6xsr6
         aDsSxIOCTMJD8Xe1F+mUgLDjij+hpbnmBnbiXWfu8107MazJUbT3ZbzTOGYUPOi2+htf
         sLcS/GWC9D+FEZ0sefHLOKQy6M9sUs9+/4bswt4TUny/80M3bhpIiN5Trh0Op4dQ01xl
         BGhw==
X-Forwarded-Encrypted: i=1; AKwUvBz+nU/IlWN+n++3ZzrKcjEWlB4uliOBrelFcFxNaS8GcK3tr//5BI4tbJgP0guQ3IaCUI89ZNPNxjh+N9o=@vger.kernel.org
X-Gm-Message-State: AFuF++lfHAyyyDmiJx1FuA2BXqEgJ5JWZYKWShoX4VJgf+rw47xHxcT4
	ina6VMHxSo+dVa3hwEPPIIZwsTw0GLgomT2oEjjjauu3YQLYDzusNx1hDMwhmqSqEMFE8VQMf/+
	D5OlNd1Q4uhv/2974lcMOaWUbx5tfbNRb9mOnWyv7CfDp3tiIHq1hPazUXTfQXvMNJ0Q=
X-Gm-Gg: AYBFou0zvSjLhQ/d2WYT9PFZ673UYIxlRHTJyae8ESvCiclUHU9ZJUJoqNTszu2hdmK
	LVcnOGCBY/QjoeCf2KNPMQcjpk+8rlGdvtcqNYDSs5bsIpXLbAIXaEHFwlbBedJn8MKwsrVpARW
	jP4CqVrTsu4kWuDZ5M3uPI4mRoELoIGPOSmCvwMWCFhwtLXVHbPqWdL/T7qPRYpb4HBsgw9H9Rd
	oFs6V1vqhEq056vHEe8zkLHpp0HAmFIPHf6pOPoJqZGjng5Qg9TsYoxtvJ3fUR7fM6dPalc+eVF
	Kam8rwATllktDMHORxeHoIKlYCXbfcL7v6v7NLdNjkswM3Gqee6nzWGFdl7Oxzb0RJbkfXhJ7Bs
	wI4NfQXQYTN3Z0IUy+w==
X-Received: by 2002:a17:903:4b0d:b0:2dd:c100:424c with SMTP id d9443c01a7336-2ddc100456amr2489345ad.48.1789749822422;
        Fri, 18 Sep 2026 09:43:42 -0700 (PDT)
X-Received: by 2002:a17:903:4b0d:b0:2dd:c100:424c with SMTP id d9443c01a7336-2ddc100456amr2489015ad.48.1789749821987;
        Fri, 18 Sep 2026 09:43:41 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:41 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:47 +0530
Subject: [PATCH 3/6] regulator: qcom-pm8008: Add PM8010 mode support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-3-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=4607;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=i6ectjJil8esk9p4hU3NPt1eTg+wiGzPdvJNMouCs54=;
 b=SAwQrv8FslWXdd5QvnVMWyjRwqwDnresQ9lLZDNkBJQ370keYuY5l4iH5O9h8IC/wmZ2QfT6s
 EWV4NgY7QWtCjuF+i9nygstwOT8DZ0IB1L6li+DFqOMYnBY06apkxtB
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: jeRd-YM-EcRvqOPoNJoL33_DAYUgmzXY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfXxh2t02gtg5Xu
 /b9CnJUJRORl/RTo9ThNpE5ZC1/gqgbT/JoUb7biQwzQBAGXmkSRN5fQoIk4RV3i9P47Et+hfM0
 l4jIomGwNy1DDB9WcUTqeDxamYPwca8=
X-Proofpoint-ORIG-GUID: jeRd-YM-EcRvqOPoNJoL33_DAYUgmzXY
X-Authority-Analysis: v=2.4 cv=MLD1C8Zl c=1 sm=1 tr=0 ts=6aad6a3f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=azaBX0EM9DmJuHldzdsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX9s3EZEcdFEkj
 joeToM4F4aSw5k3etxSb89ogRHGb/R8teKoCmK0VwkX053UvrOXP6BFQtGwraQbH1IZM+uYBaIL
 0PeFIRy5UArd0L5l7LvO3Y5fNO07CC8jnbH5F3E5yMWNEbt4XQ1bUfEuniq46Ng8Wa+Z+Jb/GHg
 3dTfwYqrKgqT1KyhoKTaNPGLY8BCsjcfNfG+W/UP+SEjxzhtt2ZET35IsFQ4qKa/pP+MkAi3665
 LUhFGJcpVrA79ZPXrCJ6OPSxYDIjYhb8RbtlBOVJnKLazBWApAOdUIxL9iFd5EjKx48+jUU8czO
 GMGn9jqckURTssMRZAmqbk9yVrNcbsG9L4bnS3rE8fVFKIEqQ3CUB79unia5HdoP4D98SiArKDY
 yQAZohYgslieayl4IvDLYKGurm+ObzEB2Nv+7jcFwgLEzh7Tcdw7lY2cWfw47u6ZVC13tGS30/y
 r7y0Xyaeq4DdIMJCOpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180238

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Implement set_mode/get_mode support for PM8010 LDOs using the mode
control and status registers to allow clients to vote for LDO modes.
Mode voting is not supported in the PM8008 LDOs.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index b484c0f73eea..9758809a6322 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/device.h>
+#include <linux/i2c.h>
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -24,9 +25,19 @@
 
 #define LDO_VSET_LB_REG			0x40
 
+#define LDO_MODE_CTL1_REG		0x45
+#define MODE_PRIMARY_MASK		GENMASK(2, 0)
+#define LDO_MODE_NPM			7
+#define LDO_MODE_LPM			4
+
 #define LDO_ENABLE_REG			0x46
 #define ENABLE_BIT			BIT(7)
 
+#define LDO_STATUS1_REG			0x08
+#define MODE_STATE_MASK			GENMASK(1, 0)
+#define MODE_STATE_NPM			3
+#define MODE_STATE_LPM			2
+
 struct pm8008_regulator {
 	struct regmap		*regmap;
 	struct regulator_desc	desc;
@@ -134,6 +145,51 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 	return regulator_map_voltage_linear_range(rdev, uV, INT_MAX);
 }
 
+static int pm8010_regulator_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+		val = LDO_MODE_NPM;
+		break;
+	case REGULATOR_MODE_IDLE:
+		val = LDO_MODE_LPM;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(preg->regmap, preg->base + LDO_MODE_CTL1_REG,
+				   MODE_PRIMARY_MASK, val);
+}
+
+static unsigned int pm8010_regulator_get_mode(struct regulator_dev *rdev)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(preg->regmap, preg->base + LDO_STATUS1_REG, &val);
+	if (ret < 0)
+		return REGULATOR_MODE_INVALID;
+
+	return (val & MODE_STATE_MASK) == MODE_STATE_NPM ?
+		REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE;
+}
+
+static unsigned int pm8010_regulator_of_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+	case REGULATOR_MODE_IDLE:
+		return mode;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
 static const struct regulator_ops pm8008_regulator_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
@@ -143,6 +199,17 @@ static const struct regulator_ops pm8008_regulator_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
+static const struct regulator_ops pm8010_regulator_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
+	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_mode		= pm8010_regulator_set_mode,
+	.get_mode		= pm8010_regulator_get_mode,
+};
+
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
 	const struct pm8008_match_data *match_data;
@@ -155,6 +222,7 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct regmap *regmap;
 	unsigned int val;
+	bool is_pm8010;
 	int ret, i;
 
 	id = platform_get_device_id(pdev);
@@ -169,6 +237,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -EINVAL;
 
+	is_pm8010 = of_device_is_compatible(to_i2c_client(dev->parent)->dev.of_node,
+					    "qcom,pm8010-i2c");
+
 	for (i = 0; i < match_data->num_regulators; i++) {
 		data = &match_data->regulator_data[i];
 
@@ -185,7 +256,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->supply_name = data->supply_name;
 		desc->of_match = data->name;
 		desc->regulators_node = of_match_ptr("regulators");
-		desc->ops = &pm8008_regulator_ops;
+		desc->ops = is_pm8010 ? &pm8010_regulator_ops : &pm8008_regulator_ops;
+		if (is_pm8010)
+			desc->of_map_mode = pm8010_regulator_of_map_mode;
 		desc->type = REGULATOR_VOLTAGE;
 		desc->owner = THIS_MODULE;
 

-- 
2.43.0

