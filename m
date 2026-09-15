Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21F7442374;
	Tue, 15 Sep 2026 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468296; cv=fail; b=cvdyqNvCSaX3FVKLIEW5fIRRiEVux3QXTkIWeGmPYyrDLA9Dp1iKgGNBo2wm2hnpHxcPY+GAd7s1JkZGWhkkByVveB9h+1OOVboiqn12JpIbCp3Txq782ffMiWYAkUSr4pIT0LUqZ028dFJKeFDC3MIa6y4CeRCXCiaRbPg66k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468296; c=relaxed/simple;
	bh=EOa2j+Hh/mQPdt0TJ2iQRqvJD9G8FSrR+XyF2N90Oqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PffEV+ZYs1zSoOUs8UqKnX8+rzyvsF0caYAmkeyH5Y71P+1e4+41hY1mSg7NPoT/wee8lMadfbksGFgkgzLwHJlI0sFolc7pD1G8AxNU1pUlrp2tSaly0RdgBcoO6imEWHjJTP7iWrf9da1RY4I+3SZtFpCzUpI/Ye3OPMET2rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dQbIIVbg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ebhtirpH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dQbIIVbg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ebhtirpH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6KfDq3350193;
	Tue, 15 Sep 2026 05:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=st+h/myBEInqUkF0
	UdZau9KjnJpPPp9m1PU1ABUmnUc=; b=dQbIIVbgeTPzTozvjI/dfrUhcpehlFwp
	TLuqDyPYcLYcZSEpYV+rn5FKfxmfxJYI2QiA3G8BBUcV3ORWBxcPiWOfdeaPSinE
	hssVjz2rfkKhz3gzFhfoNUUcyaplf8Hy6iwWH081smjhj1mcPtdmZadtuTZF5M8w
	TTyEx1Q/YLvtk8PpBOHvxBIE9w33TQRDg3VB8yhSMzMSTXIsHDvjJF4uJYPI/jOe
	n2YbQpPLjkDeCiO451jSWWd+8yK5oskprs2YxLQmG1GmwEAFPMsoD4w9fERvNw4b
	2FlLoigElfCW6MrOqZPVElhcaZyq5efqE3tcoKwKr59ULJ/jXsikxw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023112.outbound.protection.outlook.com [40.93.201.112])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44wb93s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 05:31:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCJbKQZP1kGjmG48JM/zUaao+wxWogeWl45AEBjjDsfii7lYhZsMsIffEvhMmSt1KLauwy2r9syAK4Xxcbsb//SAgqW0T/xYKlTo3/B27pU8SgDT4ytgdx7wQccRquUIoiUB7perteRZMkRv/9Qet/+BDIfvOTOY226WJOMOdr28FL/7dVpsQt5w5V2h7aLujIPlFawz/lOo1FSjUVUyRsvfoHjbssV00nnVOOsr/egPR3E5TqrDt0nLXESZpNDl0ExmbcvI15kOHFtWAM9/RIGbtGl3v+7jTHC/ALrTsoWTEp6gbt2dOq5OuMm2TkxUDWijcv6jXf103R9FoBCqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=st+h/myBEInqUkF0UdZau9KjnJpPPp9m1PU1ABUmnUc=;
 b=Nd4Vhpc0zKtcu1TFPNYGaSegp+p7BT4tui9MiHKjaLDQceO6tDHsWylnzJrjP06o/azqqj1jVvyCgWg8a7irTD6jy9Uwh60kGsZaFYe2K032tATSvBWeYGN/BgmE6mHGI/kmKOVlTcrUVNPxzbu+05F7F/9wWkk89tRTGQmx/0VKnV6+l703GMgdm+7/thca6Nkup6tBGjl3ktX46PHe+c43UVXyBEgIQda8xt0RK0NlvIWXm7j/lu/w0/tqgdkVE1d43Lm1cS3m9xoRBXwYxS7BRnkA4tGdkpOZiutqQk0czaiu+h+d1fDzr908O1byHwyxmWIfaWYXwtZwrtOm5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st+h/myBEInqUkF0UdZau9KjnJpPPp9m1PU1ABUmnUc=;
 b=ebhtirpHude3/PCj8MH3nM5GNMGlaHVme/4egmAe9cpw5yE4Cm8IjsMCSzzQPPxq8ACSFCI0+7ktxrvnADbPNx/NtjlYOS4ObHqPV9y6jIEJIJqTNhfbiFElmhiMgAi+rc+zFFaINFqZrPzdE1OQnGHqKVoZi4GYccajm931R/w=
Received: from BN9PR03CA0770.namprd03.prod.outlook.com (2603:10b6:408:13a::25)
 by SJ2PR19MB8026.namprd19.prod.outlook.com (2603:10b6:a03:544::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Tue, 15 Sep
 2026 10:31:23 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:13a:cafe::72) by BN9PR03CA0770.outlook.office365.com
 (2603:10b6:408:13a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 10:31:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 15 Sep 2026 10:31:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 94BD1406545;
	Tue, 15 Sep 2026 10:31:21 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7793C820247;
	Tue, 15 Sep 2026 10:31:21 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Add KUnit tests for regmap defaults table
Date: Tue, 15 Sep 2026 11:31:21 +0100
Message-ID: <20260915103121.3306373-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SJ2PR19MB8026:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dee6f2a4-3ad2-4e5a-8685-08df13147cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700016|23010399003|18002099003|16102099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Edpmzkc7khLF4tQmibUrLBO26BR0hx+qp6JIgfvYVEpHs54geosKA8+Dr9BO6kW1XIhbIQCyr8DOefb/9M3PDkAAZ0U4SCPBsCpmudluiovk2B5zf5TI7nG4PuCSCJkmrv//55p0Fw44fWm6rQxYICah7c04H0867wKgvoLu64PAuNWnXU5AW5Hr3SPK4ppMqXtqZxG396UOHZb/CzTRKdre7Nh6MXcZafWKjnHNfAvRICkyiXQqd3ZrkxZw7KAz+jqoNT/RVPri+1FO5z3oOLYuz9xrddRRAQ+x5XvGz59DCj5RLf3wAU5DWQKNy4/aJ+e3rl3zNTFP8CszwvQQxUa/tBLhTgvcZL197MfIm1ZCCFNC4HnAlKFiBpLm7qgE+N3AFNqJ8C9P6Q9VyNeoaHoago5CKUCrd7cZorPGRZjfs6hPru4apAGruNNQosp+hvSoJPJwVGEK0KywMiPaF9vRSDTzP2tXU0lCqtTGt1XDMDwjD0Xlv4x8tjUV8AF3165ItC73rlW0MARXTHwFnvRZWkz5Y+fSFKGKYMiKyzjqTGFIwPW7CMLpJ7mzuQMRJvhMR7fo2jEbTiIzRfeUiyV9YTUoHYKqkX1OdX+uDxmLfvsSKR+LzjUbUEnXJ0wdKNAI/kgwxGUoW2Al2wKKDqxONLtUKEwUYFORbxo9ygLm6MQrbYOFXNFeh1dtb4Y8VJlUuCwOlMX+PdoxaDOHLA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700016)(23010399003)(18002099003)(16102099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i4kp93UYRnMq7jApnPWjqj/tVEH4D2VJ8stWQNlcL6Ct1BmL+jrY/WV2Vl2C1DpUzYc/0VheR2llguN6yGmzv+P37NfUso9X+uwSvIcDktYvn2fMsQJ8poAnee/mD8wN1z+N4AlhTC4xxTlIEn/0C+SS7rpPyXbhpU07M8OE0RYk/FcAxpEv9pR5y7WUu1q9VdLVKmsv9FSM/jVoBpAl8IWx3sfryYUtfKJ95eeQM7PBV1NzGErIXuFxgTefx6zAf49sASlp1AFGsfyO4wDR8L/Bpqo+6FNsbY/glmMNalW5LX+BVyse9xqaUP4R8RCCo4RXpp+Lrh/qww0vr7E8Q+4cfW8x6B3jbWDRvUz1m6g0P77oN9Mgzk7FVOCnvioUqw5ryL6mPTQYDIeb8YEvt5wK0bPMh15gFs5Z/U6uWcaurkX1hQvXlR1iYkE7zF2o
X-Exchange-RoutingPolicyChecked:
	SGe/EXHK2JPzDyIVIU2K6a0I5z9HNajbNFI2SnMduDw0RGGnsuKdSDcR/BopRExZxWVGj7M/esIZ6YvsieNVin7krYL1+3XZ272EpHoNkOz3BzCxfisZXRhR515QupHcEt1J5ydaIrPkWsVa/0RR8kU4ThjoAsrlXVq71PJGqJcMZ3iCr7uZAxg9nnDo5jFruYH/9f7uDxUX04k9LraDe7tITAvJ4tanmJ45UjEvo6ASn+zca8BWHH/v6zkrd2CfpSKpfbRyDI4QaLTckfxi2Q9JolC+9ZsTBvGn+prKZXegD+GIK/n+284i/jO1A7fGt/BE8N21wP5pNFRKsm+COQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:31:22.4946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dee6f2a4-3ad2-4e5a-8685-08df13147cfd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8026
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa91e84 cx=c_pps
 a=PHaUbCp9QDmb2vRhnXpo7g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=6jNZZI7zJIJ-YpDzOZMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1MSBTYWx0ZWRfXxFqY+FsEue6W
 b4cQ/KHbytCeFqIfsEJCDmyTV2VToyF69jSVXDJCc33VtPdSnemjD6He0qWVPE9FCUjzEvrH1+y
 0PdQiWojxD7Zng+VqUzhxbQv/ckD+iiWExwbUoeTkeDuZT4iOc1eVsKHKDdIquoJgQm9GvuzZCb
 q5OvIsTzC+Sk9tS9TlYu3nu2e8euwPuDS4E5WGoz39TBMG6oxo7T5RPrRZBLP+vrEU21+zBkbLg
 jUNtgzk57w23WWu1SxG+g6dOZpkmax0qk4YQKQO8KFO9/X6GNtIvHQ480vho9yTY1ydH0duHnCi
 +1WjgdB9kD8gS98hnjHkAPE8tL75nyMXCDSjzxHk8RXVbgzGCsWxTde7eKiveKB0hWkD3dV7Jgg
 Pc6HelTvOKD0jSROedHKkw6TaZnJ2jxZtAVmhvsNhQeKnkkaJxSp1L0cjOuG13fDzRVstn2agBt
 zeQe0Qm288XuA11Do3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1MSBTYWx0ZWRfX42H1T14EUcgx
 soaRipAzKsyd7zCddmX6PdakoLE4VRRmYLKv8A6Gjd80+Lg4gRGQuYsHlHOVDgbZd1E0Z+y8jKC
 js2xWBVGD5wKA89ZMT8/uLiS0Cm7YWA=
X-Proofpoint-ORIG-GUID: yF1d9-W9HjwfPWEKGGjyATTP2WNMpn3O
X-Proofpoint-GUID: yF1d9-W9HjwfPWEKGGjyATTP2WNMpn3O
X-Proofpoint-Spam-Reason: safe

Add test cases to cs35l56-shared-test to sanity-check the regmap defaults
table:

- Table is sorted in order of increasing address (which also means there
  cannot be duplicate entries).
- Volatile registers don't have a default.
- Defaulted registers are readable.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared-test.c | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared-test.c b/sound/soc/codecs/cs35l56-shared-test.c
index 4f52c8a192e55..34bb3d44b51f1 100644
--- a/sound/soc/codecs/cs35l56-shared-test.c
+++ b/sound/soc/codecs/cs35l56-shared-test.c
@@ -29,6 +29,7 @@ struct cs35l56_shared_test_priv {
 	struct faux_device *gpio_dev;
 	struct cs35l56_shared_test_mock_gpio *gpio_priv;
 	struct regmap *registers;
+	const struct regmap_config *regmap_config;
 	unsigned int reg_offset;
 	struct cs35l56_base *cs35l56_base;
 	u8 applied_pad_pull_state[CS35L56_MAX_GPIO];
@@ -614,6 +615,55 @@ static void cs35l56_shared_test_get_speaker_id_from_host_gpio(struct kunit *test
 	KUNIT_EXPECT_EQ(test, cs35l56_get_speaker_id(priv->cs35l56_base), param->spkid);
 }
 
+static void cs35l56_shared_test_sorted_regmap_defaults(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	const struct reg_default *defaults;
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, priv->regmap_config);
+	defaults = priv->regmap_config->reg_defaults;
+	KUNIT_ASSERT_NOT_NULL(test, defaults);
+	KUNIT_ASSERT_NE(test, priv->regmap_config->num_reg_defaults, 0);
+
+	for (i = 1; i < priv->regmap_config->num_reg_defaults; i++)
+		KUNIT_EXPECT_LT(test, defaults[i - 1].reg, defaults[i].reg);
+}
+
+static void cs35l56_shared_test_regmap_defaults_not_volatile(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base = priv->cs35l56_base;
+	const struct regmap_config *config = priv->regmap_config;
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, config);
+	KUNIT_ASSERT_NOT_NULL(test, config->volatile_reg);
+
+	for (i = 0; i < config->num_reg_defaults; i++) {
+		KUNIT_EXPECT_FALSE(test,
+				   config->volatile_reg(cs35l56_base->dev,
+							config->reg_defaults[i].reg));
+	}
+}
+
+static void cs35l56_shared_test_regmap_defaults_readable(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base = priv->cs35l56_base;
+	const struct regmap_config *config = priv->regmap_config;
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, config);
+	KUNIT_ASSERT_NOT_NULL(test, config->readable_reg);
+
+	for (i = 0; i < config->num_reg_defaults; i++) {
+		KUNIT_EXPECT_TRUE(test,
+				  config->readable_reg(cs35l56_base->dev,
+						       config->reg_defaults[i].reg));
+	}
+}
+
 static int cs35l56_shared_test_case_regmap_init(struct kunit *test,
 						const struct regmap_config *regmap_config)
 {
@@ -645,6 +695,8 @@ static int cs35l56_shared_test_case_regmap_init(struct kunit *test,
 			kunit_add_action_or_reset(test, regmap_exit_wrapper,
 						  cs35l56_base->regmap));
 
+	priv->regmap_config = regmap_config;
+
 	return 0;
 }
 
@@ -862,6 +914,10 @@ static struct kunit_case cs35l56_shared_test_cases[] = {
 			      cs35l56_shared_test_host_gpio_spkid_gen_params,
 			      { KUNIT_SPEED_SLOW }),
 
+	KUNIT_CASE(cs35l56_shared_test_sorted_regmap_defaults),
+	KUNIT_CASE(cs35l56_shared_test_regmap_defaults_not_volatile),
+	KUNIT_CASE(cs35l56_shared_test_regmap_defaults_readable),
+
 	{ }
 };
 
-- 
2.47.3

