Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11010029.outbound.protection.outlook.com [52.101.186.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F49651CF46;
	Wed, 30 Sep 2026 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803480; cv=fail; b=aRnmHj6gsLyubzRPxFyODLXvl10h2n8Tl5NecEOAKfkqbpuoydCmZx7LxdQn7UetD2hat6LK8yTShW2K3Z4pMbOR0iNX/pIl59RgenAcS7KgEfpz6BV6M3a8FidLEN4vNsJzn/dwrUkH28fVnWXEp77NXcoCTZDDxO/qwjZsits=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803480; c=relaxed/simple;
	bh=pij2Q5LQcDLHWHRsiOuS6bahTzV1fWW6hXO4QZIyeVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rNVWRfysEnWD567XqD8hx+f8yYYGxJqDaBOCiROMB0BcG/M3Y88zZsEm4SC8SLsh5tnmYF8KbZJIrc0DUeOUTzdNH2toVH5ZMlHy1tiXnTp07lLbks5azMktCnPw4eFovgvUwUUPRBUFVhdfj7RvMbxj3HIOwIb82TgsA1VM39A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=v3viJEsH; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=v3viJEsH; arc=fail smtp.client-ip=52.101.186.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="v3viJEsH";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="v3viJEsH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvMekTiYQ2c6rGtJfFGcYhgYm+y5miulAhTVbMW52aImbCWMbIpCTL+SPxK1xAvoHHD128sylzH4Kqy2EKbslEIUk7/JjnjGzBKUea5y8eV/yBvrZUiSYEYG+8zswLjIZMdl1bqtwn9fZbO0569J/C+01uXarFMEHrVm9f6JYO2KOTo0BIaMdnp7ma1CCWsv7aM4qIz4nITvPp8jf3GYuez0Cgp0zYbJWDDpiSYirIuClGDz6ku0T0Vxqbt328Kp9byz7JOuWh3RTI/M8a1c29IRQnqLjbKWXS++SHihoShVsbFUchkubnl+5tyTe3eYhBENJDn5fJkp8FA5elnzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09MwIxQ861ji4YgpW8aaN8puNIJnr1MlY3b0Bnd1Rkc=;
 b=IcFPuIswkO8I3YGrPLwUGXzmfVKpK3vGbo1Om5bLK7pUUsAFM+WXfm+ZKkxrj4D4iYvydcos199d9mjmknU7FlqV9oBGLzz0U/eLt2xQZdMmFGj6/0NXNg1bMXmFM55IHWpXCvsggOj0pl0gEbLgGxXDEnXK2D7q11A7RydFRjv8RoE76KS3Eva8N2DgNgptnAZM8guA+foRTKJxhCl+yR/zkOyf6AlSqPR1dNBP9UMN/5a1Guiw9IJwbrRxY/Fnyz5Le9gyXnW2zXlK7KMljXFjm7DIG/qaQrCqJ/1n7q0CJAguZf2VwF16uA/Gpy6Pty1WFwyPCqM+k58ZCFZPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.107.2.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09MwIxQ861ji4YgpW8aaN8puNIJnr1MlY3b0Bnd1Rkc=;
 b=v3viJEsHZq0p62r8jbK938v7/lbt/TDg5Y0EvaRoc/BtYM79pNvEihtP4JZPOghctXFDjmhddHHg2qlDDr/vTkbMawoGmymDhlkeGlHqlBojjmWzAaqqfphe1ip74rZ0IdrjfWl/lXloJHgl1x9v4EyywFBMOTyEq57oSJUfzCY=
Received: from PR3P189CA0067.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::12)
 by GVAP278MB056831.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:105::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 21:24:31 +0000
Received: from MAD0EPF000008A8.eurprd04.prod.outlook.com
 (2603:10a6:102:b4:cafe::13) by PR3P189CA0067.outlook.office365.com
 (2603:10a6:102:b4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 21:24:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 51.107.2.244) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.107.2.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.107.2.244; helo=mx2.crn.activeguard.cloud; pr=C
Received: from mx2.crn.activeguard.cloud (51.107.2.244) by
 MAD0EPF000008A8.mail.protection.outlook.com (10.167.241.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Wed, 30 Sep 2026 21:24:31 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=v3viJEsH
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011027.outbound.protection.outlook.com [40.93.85.27])
	by mx2.crn.activeguard.cloud (Postfix) with ESMTPS id 9F52F7F366;
	Wed, 30 Sep 2026 23:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09MwIxQ861ji4YgpW8aaN8puNIJnr1MlY3b0Bnd1Rkc=;
 b=v3viJEsHZq0p62r8jbK938v7/lbt/TDg5Y0EvaRoc/BtYM79pNvEihtP4JZPOghctXFDjmhddHHg2qlDDr/vTkbMawoGmymDhlkeGlHqlBojjmWzAaqqfphe1ip74rZ0IdrjfWl/lXloJHgl1x9v4EyywFBMOTyEq57oSJUfzCY=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR5P278MB2072.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 21:24:28 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 21:24:28 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: kapenekakis@gmail.com,
	marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v8 2/3] firmware: qcom: scm: Allow QSEECOM on the Samsung Galaxy Book4 Edge
Date: Wed, 30 Sep 2026 23:24:03 +0200
Message-ID: <20260930212421.4810-3-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930212421.4810-1-mstoretv@cern.ch>
References: <20260930212421.4810-1-mstoretv@cern.ch>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0214.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::9) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR5P278MB2072:EE_|MAD0EPF000008A8:EE_|GVAP278MB056831:EE_
X-MS-Office365-Filtering-Correlation-Id: 80423c3c-e4e8-4441-e12e-08df1f39378e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|786006|366016|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 qUYF3UGS3VADvx2vuZp4x7KUI4kqLhQNhhl6K6EF8s9JMcbbl2YPJBSFB886MDFIdLu9an7VzNj44X64zB8adthyK8OoQgwIvab7nCDtMFWaW1g5xkPNuAigrDkMajP/PUnHrZtW6YtsmVZ/EwLB/wtUlDvV7wyJ0obXxrCRlqNJYOHXGTOvdTE6xkYAx1ntyq9+NNZQDViptZFvzB7WGfvsa7O/RUJpYPqvUln4sGQEO7SVD8smkWas1lhY3ot4AjHHa2TDJC3ScgBB8c/10DXmZf0E7UJX2KEpwzMJcCgMxyBXnVmjuod6FamHo+n+vW9zOSdme6AiZvLL/tl7dMuW5K3xgbn6ZFregoAF8VaKGPbZ4FitZFBtzOKJlsErCilhHNQc9ptmmbOIJOhTyDCQBeBniOuGAeK5w8Zv6fFCWenw4qpt3f+c8SOay6q1I1x/8Qiq2s9nFHPVfFroLJIn/CtPR5P8eHOA6s9/zRnYPFs4/lmUHZWH84APYehVrMVwX8alWZIr9+UpxTXTcY/U877j0b2jqnw58kWBOUPJ7mN5qpRpIGoVW6N0hp077A/HfgZXuCeoy9c+TUNqDPdOnA1/8t4y3XWpfYDiJfUvm7xhAODeDZJQuRLr3/C/aky/GkxP5cVobddG1qIcfKRy2Vp4EUqUa7Dpn8L1FxM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(786006)(366016)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 zohphvjrHcjc83674ayqM9vxE4iem2ZxKLrji+jmWlXXMZ89CiZPcH8T7uQQtl/toowv1y5Rr8k3eCFo+aIj9CHM5mQ3kK8+Y29lpQUKKrE1dpWf6sgbn3Irt7gFSr5MHW5dglY9WiqeKt+KgCyXo0PCJw8uGDnqLSH5G/NuEESfbooFi6ptasBXvUcgzzXLOFe4FlL8xnmK/KVx3A2khwMk9wlWf6hySwIz3kBtPkXF9Hm8s1obep/JLffqs/MbWi7Dt2JGfdHvIhuQbWBT1fqsct0K9oeUAnkNg7dhTq9Udmw1DuM1nVdp0FtgDQDS2893iwCZdSYLUaCq7nhEQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB2072
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008A8.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ccac6604-d0a0-4299-ebe3-08df1f3935ca
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|30052699003|23010399003|1800799024|376014|7416014|82310400026|786006|36860700016|35042699022|14060799003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	t8fr0krNEGu8UZxpzpnYm8Ts6mh5oi5fmTPJ8hbVQ/CIwjIW2sf/ZFzr3LwV+1Wmb0PLruEQ8XxQuzI065abGmJgrilUzvjfgyxP0anMDlYyNjKRBwUCPAjs5LkEYn4BjxvgH7oabMcBYDvWIgf+BuVOR1LCFHYL+vQHeWZdpKdaJU3phJKL/6nKhkQl1sxXaaKHDo7RvSj1eLGJw3v3pwfTmhKPTY+AVQroGIz54D84Qfci9woNQZY0eNcGe/kHmBeHd6rWym6Qo0m/d9/T8rzRWNVz2x4YEIILDKJBHumONh6QPNTiJq184o8zItTJxAwo4eiT8wAW1McVoA2bTvIMCTdbPt1aAL18iGWi/vfsGYrsuK773jM+VRBbQ42yaLk6fefKX7a3UgtzBhxSvlubhgtIOuRDVhGJJ7GVdsLiaLq3SQ0UIcBCirOMuRg2dxKtK4zox8k3ZJbAthE2lQKGRiirJo1VPvbZPCgf5mFwKWBXZwytesVCZaYZrK01pyO7AZvxcN23kv8JQy9P0cNCzywgN3bl+sQEIfDgZ7jZafyBKsyXq5h8gVfHzzlkJuswm61FjCGDex3BknOZOrnaQxgMo/q4+cDRfxeoTPWd0AyOfH7CWv5gx6m6qU8tUAU1dAq9vcDUMVn/gIw7r9pXY7QKhxePI3gKe4fWp0XN/xAH3drK6kQwj1k5blpXsbiziK6Ov6c24yvuL7vUpg==
X-Forefront-Antispam-Report:
	CIP:51.107.2.244;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx2.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(19092799006)(30052699003)(23010399003)(1800799024)(376014)(7416014)(82310400026)(786006)(36860700016)(35042699022)(14060799003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hN7Gc/zZHmGWcP6E6yVh8QJTJMANOKDEL6QPQ6yvj15q28N4dQWilTh3EhY3jhW9oKInErr4rFv9+pxE+X/LwiZSHHBWddYs3B/1I8HUCkcAEs9nl6jGZvq/cDWBLFGr4/35HaLaFRzmQl++4jaZtnnLyb0moIAJdGgY7d353/N8ltHRc8OeiHbDLgTP2XdsKy4rIhjPl4FkolbemmWmx59A8o6bW2jz445LouSJhuS6dfdL4xhh2QruXgdUeJgc+4Hq6f2GYzzE+D2jdljLRnOpt5MQ02VbSLgwks/VRJ0iJGEmcFOUsXxBod+DpdqRQPYeOTs7sxLOoh8v+tvi8OgGQ7S40QDkF+i+ZZJeuGmK/GN3GFIB3/q3+bXFT9clh8R7tBOvCVOoDZ1iFvZCg3m29nv/Lg9H+65ubARvIuUZgboDRRE12eu/6/duHDOp
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 21:24:31.4434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80423c3c-e4e8-4441-e12e-08df1f39378e
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.107.2.244];Helo=[mx2.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008A8.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB056831

Required for EFI variable access on this device

Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd..ddb2f5d1f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2253,6 +2253,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
 	{ .compatible = "qcom,x1p42100-crd" },
+	{ .compatible = "samsung,galaxy-book4-edge" },
 	{ }
 };
 
-- 
2.43.0

