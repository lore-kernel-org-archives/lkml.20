Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B671A9F90
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974010; cv=none; b=e+5JQOgsjxSj/3cQ+y3JrVes1VjzAlwO+S5g5Fzx6B4S6REiWFhZGkwoaX7bnMqon9l1+HBAFGoek0PpXJmmvrmFCIEc4B/BxZCeYpEwJBNbZQKfQqKyY+gU3t6a7dPsPNg622PEwPVnFEiZAXLuL/PxpoZQ7T0RbvVFSVG47SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974010; c=relaxed/simple;
	bh=nKpyjZqeImxNCSJaq+3VeFOj7UQIeMfj5eT5LpaG0WU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SlDIbVVEl8/RPgCKZD0Rv1aoZjjWKiqHOC+AbuncKAqpSJdvOi8EN6LwyDwOFb8W1wUxfk0mRU0pNbK/d1gEor1aHejihyNU8wqVH7YD8cZzxe+G7nEmuUlZJTRAMNeEjj2c/1SGZ2wqgRwv/o9nr48OtjqPvegIRM22sk0dTEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l44pQ44g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjZv+jyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l44pQ44g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjZv+jyl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6d8kQ2087981
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9To/C/5ILqecaf++QZfKIUCwyaf5sTpD6boha6uClss=; b=l44pQ44g688kRei0
	1aHJ9R8fGJU9h03yeStkxOeFtBPE+aO02Z6kaLoDlEB4yOz1VBC2RjJGjGqj9gIf
	dBRbYMVPZdxOUZcJW1Jddf0mhSqxXtLCGMcVmS1/vJwEbZKJ04JwHlbfNtiJNUZe
	xgcMGBdbecsAJfCOkOJBJjAAAsHKsm3zhKZBYcwiEhSSzKpnkTk+/d2WMvPZ5vzW
	0k9Ald1wIWW+/Hf7F3vW0Esra04hJr6B2SWXEnGwjU9eJYKyTfxy5qLSUmfAEwla
	x9zYfOJIwIXBT6LejovMAgQAPbW5nYnn0IEZ8EhH2ckpPHP4IlPU6NogVIIyR7Ya
	vzX10g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49jcej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so235277a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974006; x=1792578806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9To/C/5ILqecaf++QZfKIUCwyaf5sTpD6boha6uClss=;
        b=WjZv+jylFWJQbOOm5QwVkacNTyHijlTQPKnjLUHOLjaUzd7EYUOam16orvTHMHjZPL
         LdHhKmnC4p/Xp426kgUEzq2wzgktom+owNO6roKxPq5uM0xMLpc1lLMplF2hOJ1NcWZC
         wpIMPCqT6uEGyV1xg5B0HbtjE/j3y0Ao02Wz31YfUXMfaTq97UpxiHmvbV2vGmpStej/
         7wO3vkXbQraAHWKZmJqVzkMO4iuXHz0Ca1jPlhSBC9NHhaHKGcaW5x4+CjlBOuRlDV+4
         GPYjuwy7CF0/O751iUx+eE8V0ZXUKZTQ3GBzXATzmiYLzb1GEX3kHf7MAFl6BdBPANT4
         KFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974006; x=1792578806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9To/C/5ILqecaf++QZfKIUCwyaf5sTpD6boha6uClss=;
        b=WJW5rYD1bCbvbQyhbikXa7cWXCJmiVZW1083YH+P1gSgSL0fbpGjD1roBYpQxlmsbr
         pw4Zx0OCTcXR72XZ8tCnHUJG2gXDU8s1TBawqtA41WlYXGQBfgb9WPSaI81EbDJO3EJ5
         gxES2KdRpbCVyFkeokSIJfDNHrekY3rqfhPTtQl1cFCLq7TuiipC7gwD9jdh4K/DlIXG
         EE0NdNqaVJskV6ChXsiSHoUA4lFTTIVfWCsBlpBmChwXDXax0ZXAFhk+qDJ4BNXwauOY
         MAsno/ePKQxJHPaKx+fuXxlLo/221qWWH54hXPln/yfLH8zau434mIpSivl5Wcmqnd7T
         8nVA==
X-Forwarded-Encrypted: i=1; AKwUvBxn5DYcdzcc6CE3kPW+B7KQHIEVs1AO47A1vDiCJG1DIWzJkR+fG7ZXz1Y0INUNSxBWeiVuNlrapbm4Yyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJWfUiM1U7XIVEWy7NCB2T2JCCGJsswfnNwfCm2bBcHhOEQkDr
	BMzdC5+aFpsa7FcR4P0rsIvpL4obABCydxKqBMV/cVJrfHo17rMoHH3occvL5i7dbg70TZNFsUG
	pK2JTMD+FD4IWXGFHdviK9ulh4IO6gV9mSfOZ5sYX+EFrp/0v7yLWKhEJx3Nm3q9cce0=
X-Gm-Gg: AYBFou3RjcT8Z1PJvg9GI7+iKu3blfi20zMmQDfeWCeP1OY8c14HJLxwvvlOM/ZaS3A
	X88AMNvWuMnTogcA8gYtdhppAZC5+kgf0cHcjMMGRPMfsi2jgN1ISCN2WXvJLtPvU1uabUVg7wj
	AaHsh3L7W2cTPm2TJ+cxJJUIB7d54AsiPukC+IFTUOnOy38SvukjS75IDTHhEKj5WIY3PfOt/n/
	PH3XnuW0PoQCklGbeXcjINXARt6oAzfdwqTkIFZU3ufCEaxRa4OQQ0PnDBSkrxsphewq1ssZb2/
	BmYr5/QAavH3WwjD3BvJfNYaRWUMvDEm+kCq3k/bxHD9c5vVSm6RvV4Prvgmx/chc2RMp186Dzz
	51T1zN32xrrvs3r70cAw=
X-Received: by 2002:a17:90b:1d4f:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ab3a954001mr12770333a91.30.1791974006069;
        Wed, 14 Oct 2026 03:33:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ab3a954001mr12770300a91.30.1791974005463;
        Wed, 14 Oct 2026 03:33:25 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:25 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:01:59 +0530
Subject: [PATCH v2 2/7] regulator: pm8008: Add PM8010 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-2-b395d2b3f668@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=7897;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=x3r84kKfjqPTxAqPbXtj7jZvilPtCOTLr7dgEbH92tU=;
 b=zkhRadOSrLFQXUzJRZs4fStdjeXiwNFEohHFvNa5LYD3P8eYaw/PlpbJ1IUEHqeQ2GzINCuzx
 r8SPXGFy/AKCsQ9JY+1XzuB7+PSTwTSrl9SZVGsjM/MsqMdWBVP4WKT
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf5a76 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=CF1g25cjMhU89PGl3DsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXxO4kYimvVmiC
 ++EqGYoI+01mPQ6DyzK324cIHXFbikm4nTPDr6+6wodNw3yjuaPBeDf8KXPHZ6oejCnpN5I1BDH
 IDn4Zu5gWeIA8R++Vozf9gFT7iUs6WJqPcczT6ArA1LcGg47+asOaLRqSjGmDOLzYLtj4pxOj22
 UvQUbKO7uP0imC6kgd8drRBCvD3bRiJMutKxiVXjn8PGdJPTnYGSbbeaZqqPTj14/KPHYqEEWAi
 LCrWVmoLbTlvpUjUHa2gbX5QHKysJq/meYVjG4Nj1xuln4Sw+pZRZq+tYgzmYuI4ruPHNOC6BWs
 EjwGS/+Q24psB+oeb3KmQplSfIXx6dn0oH6zYWwRMxsy0CN1a5Wf27QFpaMF6AHC//mv6CjMTQq
 52jATctBbEwYMkWuQb+Rl8ysS32Z4KVFWwoktVyKnC/jau1eUvZHnSiYhfRn59x0r0h1RqgpIlA
 eBg7Ihu/Yzr+QQnIM2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX6keaHKcsqZj9
 AV0BEgd2k8AEWx0xDlrMGYNLZ5rNVqAtDrmZjxlTJMdKyc1O6aXzvIrhiRdHTJK5a0pzJSlKNDw
 gZSLaS7BP57r9m8EyJBlOy5AW7Fwf4Q=
X-Proofpoint-GUID: NXZzYqxWgl6J08S6GjPMMskELDawuu-W
X-Proofpoint-ORIG-GUID: NXZzYqxWgl6J08S6GjPMMskELDawuu-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008.

Like PM8008, PM8010 also has 7 LDOs under it which are used to power
camera sensors. The PM8010 LDO are of different types from the PM8008
ones and have different voltage dropout values. PM8010 LDOs do not have
a voltage step rate configuration register.

Add the necessary changes to support PM8010 LDOs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 109 +++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 9c9b8be2e15a..b484c0f73eea 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -39,24 +39,59 @@ struct pm8008_regulator_data {
 	unsigned int			base;
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
+	int				n_linear_ranges;
 };
 
-static const struct linear_range nldo_ranges[] = {
+struct pm8008_match_data {
+	const bool has_stepper_ctl_reg;
+	const struct pm8008_regulator_data *regulator_data;
+	const int num_regulators;
+};
+
+static const struct linear_range pm8008_nldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(528000, 0, 122, 8000),
 };
 
-static const struct linear_range pldo_ranges[] = {
+static const struct linear_range pm8008_pldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(1504000, 0, 237, 8000),
 };
 
+static const struct linear_range pm8010_nldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(528000, 0, 127, 8000),
+};
+
+static const struct linear_range pm8010_pldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+};
+
+static const struct linear_range pm8010_pldo_lv_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
+	REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
+	REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
+	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
+};
+
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
-	{ "ldo1", "vdd-l1-l2", 0x4000, 225000, nldo_ranges, },
-	{ "ldo2", "vdd-l1-l2", 0x4100, 225000, nldo_ranges, },
-	{ "ldo3", "vdd-l3-l4", 0x4200, 300000, pldo_ranges, },
-	{ "ldo4", "vdd-l3-l4", 0x4300, 300000, pldo_ranges, },
-	{ "ldo5", "vdd-l5",    0x4400, 200000, pldo_ranges, },
-	{ "ldo6", "vdd-l6",    0x4500, 200000, pldo_ranges, },
-	{ "ldo7", "vdd-l7",    0x4600, 200000, pldo_ranges, },
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
+};
+
+static const struct pm8008_regulator_data pm8010_reg_data[] = {
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 296000, pm8010_pldo_ranges),
 };
 
 static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
@@ -100,7 +135,7 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 }
 
 static const struct regulator_ops pm8008_regulator_ops = {
-	.list_voltage		= regulator_list_voltage_linear,
+	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
 	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
 	.enable			= regulator_enable_regmap,
@@ -110,8 +145,10 @@ static const struct regulator_ops pm8008_regulator_ops = {
 
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
+	const struct pm8008_match_data *match_data;
 	const struct pm8008_regulator_data *data;
 	struct regulator_config config = {};
+	const struct platform_device_id *id;
 	struct device *dev = &pdev->dev;
 	struct pm8008_regulator *preg;
 	struct regulator_desc *desc;
@@ -120,12 +157,20 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	unsigned int val;
 	int ret, i;
 
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(dev, -ENODEV, "Missing platform device id\n");
+
+	match_data = (const struct pm8008_match_data *)id->driver_data;
+	if (!match_data)
+		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
+
 	regmap = dev_get_regmap(dev->parent, "secondary");
 	if (!regmap)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(pm8008_reg_data); i++) {
-		data = &pm8008_reg_data[i];
+	for (i = 0; i < match_data->num_regulators; i++) {
+		data = &match_data->regulator_data[i];
 
 		preg = devm_kzalloc(dev, sizeof(*preg), GFP_KERNEL);
 		if (!preg)
@@ -145,18 +190,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->owner = THIS_MODULE;
 
 		desc->linear_ranges = data->voltage_range;
-		desc->n_linear_ranges = 1;
-		desc->uV_step = desc->linear_ranges[0].step;
-		desc->min_uV = desc->linear_ranges[0].min;
-		desc->n_voltages = linear_range_values_in_range(&desc->linear_ranges[0]);
-
-		ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
-		if (ret < 0) {
-			dev_err(dev, "failed to read step rate: %d\n", ret);
-			return ret;
+		desc->n_linear_ranges = data->n_linear_ranges;
+		desc->n_voltages = linear_range_values_in_range_array(desc->linear_ranges,
+								      desc->n_linear_ranges);
+
+		if (match_data->has_stepper_ctl_reg) {
+			ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
+			if (ret < 0) {
+				dev_err(dev, "failed to read step rate: %d\n", ret);
+				return ret;
+			}
+			val &= STEP_RATE_MASK;
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
+		} else {
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE;
 		}
-		val &= STEP_RATE_MASK;
-		desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
 
 		desc->min_dropout_uV = data->min_dropout_uV;
 
@@ -179,8 +227,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pm8008_match_data pm8008_data = {
+	.has_stepper_ctl_reg = true,
+	.regulator_data = pm8008_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8008_reg_data),
+};
+
+static const struct pm8008_match_data pm8010_data = {
+	.has_stepper_ctl_reg = false,
+	.regulator_data = pm8010_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8010_reg_data),
+};
+
 static const struct platform_device_id pm8008_regulator_id_table[] = {
-	{ .name = "pm8008-regulator" },
+	{ .name = "pm8008-regulator", .driver_data = (kernel_ulong_t)&pm8008_data },
+	{ .name = "pm8010-regulator", .driver_data = (kernel_ulong_t)&pm8010_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);

-- 
2.43.0

