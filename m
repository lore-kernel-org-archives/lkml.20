Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87740BCA1;
	Wed,  7 Oct 2026 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378551; cv=fail; b=fOXIR319Oorpci+wnvI33vIBywNXNht3k1XWcqgzVUoVDU6FDttmnO4wPEx3JlV4pwwVKDh9zLzT7xKKfoqsywPnStrAKjnMRiLqbAdALte+wDMI8pd7BthRTzXVQuMLkuR4zlyRct4l2sU42Hr0F2WEeqJPT8z55Hpl6Ro6RkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378551; c=relaxed/simple;
	bh=bGuXOzmwc0hgYIiKupeJiTPlnbvmWHtuy8VYy9znHeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZvzZzEo+cWyaNN5hjcRMi/jTAfhYthJM0xiKh9Klf/Z6pEkR1gZjTl/5AhMwUKvdPrTO1ZvxJ7umSiV/lW6E+4okTvSoumDwwgsIPDJyFsL3WJ9qdHs+515WZV8uu25BVNs56CJSf2XekzlU9emAO+fAnakg4Tt93F8TXiAUvXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZvFNGPEu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oOuRbUsV; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZvFNGPEu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oOuRbUsV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697Cp7nO2398826;
	Wed, 7 Oct 2026 08:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=KJcPPgFEBBM6LAUJ
	pekwCosFEY7SxV8FI5O3ETi4EOU=; b=ZvFNGPEuusgZBqBHxa6zhHiI4mAwDzDL
	AySuKyjzGKtK/AOQz/sA4CJZYYIRagGVqRwiZFbrVjWA5ap5s3VQMBysf8fyO0Hu
	8A+Jj+N4gzhVmN3cZfE8Sc8Zc2mTyBw5hs2O6MflL/hPk0UirvG431IR2vxSs1S/
	2LDhc5VOKW5oj0cKAlk1E30m9bifepP5v8csKo/1vGwpDZuSJl0VwjXUsALTdFFN
	jRHkCzpSCbZTMMdCAuxcA2YnHEZwbQ+nvXPCJI6D/ZS4WolaN9YhDra0s8dVyE2Z
	YvbBf/XqKyZd0F3gFEeZ6lEf5K8IkM7a8Y7rUBCFv+p3IrQ/ttBMbg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021094.outbound.protection.outlook.com [52.101.52.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h2x4hd7v2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 08:08:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkniE17wl5m6BEFeplvYNr5NXk0OWLuele4twzw2dKQMtVS+pWKQav6YxX2YAXQqvYKOnsZ/2COx4MdpFIv0KcZqH+e/u89+R1unq0ioiyXqq+A3cbGIgXA4XjLFKQX7/l0T6ORjo+iAYHxugwG+hfdi9ny17bnJ9TjWcMPmCs4KU5rKxQB4kfLG0GI6n2uU3zzz4jcXEBObqhBIr08xtQEEUo2yFojS4HAy28vWnJQwihftFo8yxqwpjkICDuNwY8O7L8X3M0AZbEOJVVH8ZDKjH6XiryAP7BqrhQQIRhU3F58rvLQ29OqMgKcnXfJxUq+/Q1eLpB8kKkJ6nUludA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJcPPgFEBBM6LAUJpekwCosFEY7SxV8FI5O3ETi4EOU=;
 b=QIl8ea/XK5UR7WAKlf91VUr5QINMeKaagbn7pacCCy9OBnDGT/5qjjLboWty7CUvq9MqGoJqbgb4mq1XkCT2hQSTb16VqSih3Mf3VJ8r4hvI8uLagKBns1AS1zMJ+f6uFATwH1Bl6g+izIOmOzqQN2m2lYMpOwB8A+dLdQa0T9Ld6uVxbWUeoCya2BkqYuV1T6SkYCIB0HmAWGfhgfbz1u8dZ2gnFMqOq2WTxU5wybXCbot5sI5BQezufW2tOPAMzbQufEN8hT4e06pNNCbBoCMCtsuh7TvtWCoghLuRJe57SsKb06QX0O333b9zVt6WBNkqEFDlSDicNc3mDB/+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=amd.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJcPPgFEBBM6LAUJpekwCosFEY7SxV8FI5O3ETi4EOU=;
 b=oOuRbUsVZaSqDz2gXaYkRXtHZVVVTBT/Ssl1Qy9Wqw9yr/D/j/2HGVA5YtNASzYkaL0a7yubAljpYFFE9xXHNnF/450WuJ1razvF8c+/6MnNbDV5K2p5cLXCqs7ZK0jHbs0rV7BzIBvTYiSY4y6YZ6+qqIdwzb6tFeMsGZbUflY=
Received: from BYAPR21CA0026.namprd21.prod.outlook.com (2603:10b6:a03:114::36)
 by DM3PPFFC069F513.namprd19.prod.outlook.com (2603:10b6:f:fc00::763) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 13:08:43 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::57) by BYAPR21CA0026.outlook.office365.com
 (2603:10b6:a03:114::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 7
 Oct 2026 13:08:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.14
 via Frontend Transport; Wed, 7 Oct 2026 13:08:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0044E406544;
	Wed,  7 Oct 2026 13:08:41 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.190.226])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C0E0D82024C;
	Wed,  7 Oct 2026 13:08:40 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 1/1] ASoC: amd: acp: Add DMI override for ASUS EXPERTBOOK AM7406CKA
Date: Wed,  7 Oct 2026 13:08:35 +0000
Message-ID: <20261007130835.102325-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|DM3PPFFC069F513:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d2cbbc3e-39da-4bf5-c512-08df24741cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|61400799027|18002099003|16102099003|10067099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	sQuKIG7G5s4o2MXO4mhDCrz5/uvo3saD5L52mA0yZraf4ENd9Bg8i46CxUiqWBekGnsYwLPP4y23dxBV1RhwlWft0kiHyBLOHSaIrAZylCuU4Pb8WlaHEpjUiKv6tHh5cmlHqrxSqeTr160gqTHrr88Ul0dJRwIHXIMl1dOm9MVRjbu0qm0/OyqVDoH3Nq2saIxjIus9jv+4+dRSupAwHR8ckplxeFGnoUYZ1jiRZ3C7QDWh1CjtuMjYPRPytasp0+RC4Oa/GTTXh8/5faID7MjziFWTTdBP+UY6pR46NXbV74HB+MCeToi/J9oqKdfNgD+xXK96diknZfvrjQwgQJSQBAcONYMZlZWAj7Ci0IE3nbaTy96Oi+BNiUrclk+i8Q/TusWTu2CPO6UPKoMUJCl1JynTJjSqAZDCvmLia5u7bAscAybZCsZ7igDoShtA52JR7sJ6PvVJZ09f2SSj0pELSDIGPOf8MYoytqKU5PkQkzm5Y7W+uvxu17zHZImAKQk1JKCCxP9fSf4WpswXk6RvmhgfIP75rc8+9aSl8kfTl0284Aer/+4PkTV4/MTQxNHqQl60FVcYCfmN7I09sp43jpX01l2V8UNqJ0eSVu+XoOruVwJn42mpg6GbT11ClIpDZF2fcc2Rd2BEru4TZuvtYcKjlcv9uWnSGeWUDLHOPiOYg+jR/s1OaP7CYwXThEwLRFuczOzzlLumNNeSoA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(18002099003)(16102099003)(10067099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UFCWZ71fxcdGux5wqJRnGX86C5eXmignNQn+IyIjR6Rh1wvt6qTAqtyGhZ/mqOItFHsEWFeBNeGwRLhkI3QXEPIBmIm/Hx1gha8cmjoewXks4r+cfgqRddMLJTpPTjbfe2EWqP9D3VsEyq8ZUCFYBFeUy6Z1UGQbIJ7aaGt++GXPWDCVaLyhAUOPRor1xchefctTdAoA1a+6Yrs/4jk/GC9Dx5xVO9bGKnhK7DKQC46ltQegSdiAkYrISEUyA9Lms7Ybl35y5E4rpRe4g55ywcgKqQOnuGPOUaHKSLsZCfVN7ZXWPEzlpJnvlNywjxzeOyAL5OoxyQGCGsum8kJzYJuHMVpvJI7eyx2CgnxpKUqK6h3fFWlW5Gzr0t48nljX76fpNwexsWQxeLPA8KcvUScMnUcNQ7Zdp/O/5iYhNKcH7ctdRCKpPpMdkxkzcyTE
X-Exchange-RoutingPolicyChecked:
	dJFu+b24Upxr3Pca2hpSo0KDs9qhpKCYS0pYb/hFrMUV9T+oZ9Cco3jwgpiO8p+zpYP30hUIK0fhywI7tV1+P8XHR2zEcIbEwIBGZOf2DpVnyrdmtdcbiaYNE81/d2Gb8d5ycrobSqcRz24C2u1IJrOtCJjhf/arQAl8AT0rgT9rf1rXcWW2fQJ/8jVXnBmLgkDbHv9eNh1RNoS4WB94NnCcoVVoYJySSQR0pnpUgiLnpE+VQ5tHHzKoDKikUqrXrZc8CoMNZUJlA95PjV5GdgvyUyo3vi8nuuWJ0p0rbWbjFiO/Xot758ZostD8b8LHU/CH2pkASTvVFkl3Spie4w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:08:42.4191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cbbc3e-39da-4bf5-c512-08df24741cc5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFFC069F513
X-Authority-Analysis: v=2.4 cv=DuLDa2/+ c=1 sm=1 tr=0 ts=6ac64462 cx=c_pps
 a=8OTw2qS5QgwVLUZ+0dTndg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=QKHv2cfge6kAjlpXhsEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MiBTYWx0ZWRfX4RENj582woKG
 qEH18p8oQdKL2gc1ckGyU6edw2tY9xN4QpQsqckfRBkJcsXytnVQJcCqgJ+kamtGQTUj7rjTtqk
 svTPT7szMgc38T08IvLRAc6mM69+cns4Q4D4VS0Lcte/JyuZ9Zo02pylbHAzNqcsqa6jtmruP9u
 Kk6OVM1dh44/Hs5ljIgUQs4TenDqkC4+TwhErkpQYPFVN0XfeTpd9ASeqvbWRvOBoFMmKs/dTO7
 FfeBAvZTBSrvWN7pTEDCvRSJOT5LIO3kZa7tl8tvyRDG90zEyRO4cTnxzjQNQRhk5pWaWEDUn5d
 rs6/ZNGktXhVKOux7AUzjkmoO4i853OZdEjrhvuYrNIQwNiJ/nUSKeL18gkyCahbFWaN6U91Oa8
 dgwEyhFUhHZna5u1yLY1JvcLCNe6yXmMeUEQFksl3dT77aoPdP743oOhnA8Hal06K51yhumn63t
 psaa57LtR39K+4CRjWg==
X-Proofpoint-ORIG-GUID: dkH8s6xIn9Py_O-O0iQr6wAV9a4fN28m
X-Proofpoint-GUID: dkH8s6xIn9Py_O-O0iQr6wAV9a4fN28m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MiBTYWx0ZWRfX7s16IjAM8lBJ
 2h+qmOzzwuKau1VAOmdZSm7PY2jno3k6UfTJ0lNNt7QNJaeLdMF6Bv9vDvuitoXK4jlGL5J2xmH
 Y7XBMCR7ZoQn7V18V6WlgSMLhFJMo2U=
X-Proofpoint-Spam-Reason: safe

A BIOS for this SKU has been observed with an incorrect
acp-audio-config-flag, add the override so that it is forced to the
correct value.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index b3b73096ac74a..3d48bb0f100f2 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -30,6 +30,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
 		},
 	},
+	{
+		/* ASUS EXPERTBOOK AM7406CKA (Kraken Point, ACP 7.0) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ASUS EXPERTBOOK AM7406CKA"),
+		},
+	},
 	{
 		/* ASUS Zenbook S16 UM5606GA (Strix Point, ACP 7.0) */
 		.matches = {
-- 
2.43.0

