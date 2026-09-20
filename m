Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11010029.outbound.protection.outlook.com [52.101.186.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B8250BF2;
	Sun, 20 Sep 2026 18:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929726; cv=fail; b=o193iF3IqUv3y7/3BldTo5keOWxVPmYePous9HXotW/hJjW3YFlrYbpD35BssSiByrh8VghYZ2WNJBHXh+MoZkKRu9G3SsJ30eIknQa3U94mDj7e3defUGOniLW+zbUqJfFlrheOIAKFPhU5JmcEzpWsh9U7H9H00mozina4gfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929726; c=relaxed/simple;
	bh=pij2Q5LQcDLHWHRsiOuS6bahTzV1fWW6hXO4QZIyeVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nV91i6/tWJIXzsm5JrgqmtyKrFEB8KDjP6iCuzfWZ9BKcsSl95jGyIf+Ib309QFBOBARXF7bvjiKawkbjAVQqT2cBZPsHUh8ihB2rCndDuXyCwaI7I2ZbZ3hrrWTklomSrEsu/5vS6GxD5nSSMbHNKOU7/znAGH3v5HGjqX32CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=Yy6U6sxl; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=Yy6U6sxl; arc=fail smtp.client-ip=52.101.186.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="Yy6U6sxl";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="Yy6U6sxl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czUmkQAuAS5ayDhXmTo8hw3wttdRrCsP48a+QhB30c/TVgIfhewzbfi/Vf7Q9VioBe7zGLccuDoeSssqQbEZDRerwrJKGgGXtPOW4jziqqabOfjCCIq4kAT/UvDPh3SVp5OXwExnrUPu4PhjnF1EJw2yYZj7F+4FA2zXe05ML6LIm0m56cF68CbWgsXttTDmfUKsbFmqv2U/OGnJoKvWpzSj+DkPsoi61WmBAAQChNQ1mUYS0GXhXqlAJ44ZhP0GRJypbnatXtiVbBv4fba8+xw5M8fJn3g6bUrRGab/1tix0ttberS82WMk7XcJQJnw0vfQmPkhDsCQXcdMTXuMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09MwIxQ861ji4YgpW8aaN8puNIJnr1MlY3b0Bnd1Rkc=;
 b=T65vv1qOs1DiUzRpBrc5JhcvO0LdQ/bWQqn56vgj1UZlbTQ+zGMQAUiwsmR6mP5BQTDjq79s+yyJ5KWOXhGQeXOpmwu3DKco/Q/3sO98wEzYisCTUsHuRpub4vxlU0kBDmIi3YrHFOGx+A1HcNxc4iZQnTyk6B6LlCtVgVRqmzOpJNICkALG0dLC999vtxjpzf3YAPHZjeT84NC4HQn9B0ioDwVnsv6pjkFG5kU4U01bVDTto9nLigkQElpygeHD8cjbGmVxpEw7rWL6xsQcsM+gEIAweoXEYNMzBTUbDCQGD35g7AmuveutQHS7Wfalbv/0ETTXWVUxVSNE6HTarg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09MwIxQ861ji4YgpW8aaN8puNIJnr1MlY3b0Bnd1Rkc=;
 b=Yy6U6sxlQ6rhXm95t9JPfFhzfROFyYdreBpwf5cLQHLWPkPzgSvpPnn1O8pCLUSO5MrGaobbP8/zXYLKQgEbVbR0/D8mIbEYSwe6+jraV1Sf0TK4vYuRvuv/j6UCta51Z2YIdbwKcPvL49u5Iw45VQeROMJubez3GtA+3P4weps=
Received: from AM0PR02CA0131.eurprd02.prod.outlook.com (2603:10a6:20b:28c::28)
 by GV1PPFA93B279DC.CHEP278.PROD.OUTLOOK.COM (2603:10a6:718::224) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:41:58 +0000
Received: from AM1PEPF000C1ADA.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c:cafe::82) by AM0PR02CA0131.outlook.office365.com
 (2603:10a6:20b:28c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.208.138.155)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 AM1PEPF000C1ADA.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Sun, 20 Sep 2026 18:41:58 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=Yy6U6sxl
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011025.outbound.protection.outlook.com [40.93.85.25])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id 1D3147ECAD;
	Sun, 20 Sep 2026 20:41:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09MwIxQ861ji4YgpW8aaN8puNIJnr1MlY3b0Bnd1Rkc=;
 b=Yy6U6sxlQ6rhXm95t9JPfFhzfROFyYdreBpwf5cLQHLWPkPzgSvpPnn1O8pCLUSO5MrGaobbP8/zXYLKQgEbVbR0/D8mIbEYSwe6+jraV1Sf0TK4vYuRvuv/j6UCta51Z2YIdbwKcPvL49u5Iw45VQeROMJubez3GtA+3P4weps=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by GV0P278MB1174.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:41:56 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0428.015; Sun, 20 Sep 2026
 18:41:55 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@linaro.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v7 2/3] firmware: qcom: scm: Allow QSEECOM on the Samsung Galaxy Book4 Edge
Date: Sun, 20 Sep 2026 20:41:03 +0200
Message-ID: <20260920184148.31541-3-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920184148.31541-1-mstoretv@cern.ch>
References: <20260920184148.31541-1-mstoretv@cern.ch>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|GV0P278MB1174:EE_|AM1PEPF000C1ADA:EE_|GV1PPFA93B279DC:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5d5205-7b24-4192-133f-08df1746da54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|786006|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 0UZRbW6+iuQyRAbaQVjcPvNxvyqU02kpwo3k3yWcYQpin+X/6bJGQUBPcUlhbPGe40vc4WVzCsPsr6H/9t/e7D93rH1R141xeIh9MQeMUmDJT/PjNwjwqk86n8hk3PVo1ZW0YQqZjfcpETNhb/eELW2ZKmkP7YMExYkVEibNv+9rOopwsFgtD8wijOKWfyqN5QPCv6Jet4KKG/wMfpWrUpRAT+Vvf3yUESHii0LAlC6DbFmCrlD6b9ZTPHTWMz4KGe7Kzhgswv/Yr+1ulxqN1SbeOJ2tTVruVVO2tu17p4O8M37AwkQy6WqG/W0l3CWagsWgin/xftIVE9StTB9hQb3da8bVUgIUhrfBUqFESR6lsRRtjYMpi9798ZhG/gA5KufZr0qLLcG/RrE6ZCSqsPbjrvgf5cjCN/2xAutusQ2y2MQLpdUg2UPn02STFrhAb7h7YgMV3TYle+KaVNznlfsyIc1p/c1cFfpkYokruFSG+JoE1Bz5uPRcbna4L7Lecy3W4xOt6HeSQyyLAwjUXoLofeX8QfkcLUcM7WnleFvwGzEfjkOtVJd9rXZlDrP6fDRV7HJUxl7W1azdCo58pr3xQdWqQqvAsdg68J1n/pRsWcKEdOEiK6ZThgbWgTw/lOQqS4f7dmhbk7ka+abghQZp1NNdIjI6rfrbolPn8t0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(786006)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 DNJoOAFFeOeWn8nN236s9Wce9Ohv3am+afwtdZn0e9XdmLfM+hZ87KouHS8/rCxWNC8FQCbKnK+5gfTGKc5oEh1xvVJZ/Rv2zuInHyqkVaEFraS4eVEcTIEBVHzCQ1xNvJtGlNGK2Sn41v0iEciOI5wIaPEmvOHfXZcxYEs49THm5OvVpGGU1j/T4TIUk9gYmDaizqWUZ2+DXYS20OsRN/QpGcVkPUwsgzzFaeiSBnvAXNA2FPkPZKReJiCWXZRGLIGivcW6uiiBLc/QUbGFR0PQe8p79qms293AoOr/RLX53pg20z2kJqhkEym2QMGU7Ct7Y+nPXfi3N0yITBnXEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1174
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b39bdbb2-d86c-40ef-a4a5-08df1746d886
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|30052699003|19092799006|35042699022|786006|23010399003|14060799003|36860700016|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uKuco8MIzwTNVr0GGTVtR/utuPOQGJzYg5sl/lzIggXb/esdfxZAMDlkIugrPaS5P5iPDiePD+qLRrAu6tw++Qvbyzb80ii7T++IANVR+ehBJcrCrugvwIyetn+2baVGjxT7kaMkWWztUUjNOmMMeS9x79RrX92DX2eyOt7M4YUgpbQ+5sdkjCko2Nogbg2dKLWbSnWlp5a0qnN0h+kzHjWvM0sycEnGWrX0hSUcZQx146+k3FPFa0AROwcxnj8om8eLpoOeOjEeEL0a5SU/EyQLN2wRObsschTo63ltjp4oHQkoYeJoX1Tt3kojWLKlHHE6dUAuKqZnt4g+tx5/JINFLvJEbt1PsYrKGVk/HwiETuzwGfirPrYwJIJFFVGAL7xJKdF4ORi7lPNRmEBV39MkZZFaNYR0173EQkM2KbGbRGYLHH7m4yJ0msMIBGB3hlS/wyKFTW5fFrRrjmq1Cdy0nfTM/tHsGZeAqLmFnyHa3Yxs/Ag+R1pxJH7exSBqKRyLoWhXHV73eFBjMSNxo598KWxxem0n7wMH1r0UkF4kLIno4SgHORvYv24lDyDfiDsxrhGFjIN8zA+zFSfBMmedLSOfiFAmdYsYYdisNW8D7a69sGib2C5jNZNDLVpLUEbFvfqwrWr9Q0o+qfdJHH1sBaZ4i3d/meN/1GDzXO7M83QHhbzqw5hU4zRLVSTbMsw8Yif2ATI0NXku4iyzJg==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(30052699003)(19092799006)(35042699022)(786006)(23010399003)(14060799003)(36860700016)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	isJzcaJIHOQbsGx+aRcNii1e+s69lWoFDW59d21N+aFPX/WwgRM3SEKvmgfrI5h2VuQ/v40FKNTMDrr0NaSdea8C0S/rbJVt8xMNTe18bjun+LbM56bpTYK0nti77OePcRODaXxUji0Mb1BAfLNSN4SHwpyTu1SQeCrB3CepAmmrbOo9aifWvgU0Ko8QazU1NwIwSBiBRIGQc8v7jeAUh0wUlfbx54mbSfkO4UNauAyLpdAOGs3gNMYb4nsKLszZdhMTqzAR3perJePHXikncBApfa27UXX5jVoZZwRxCDWuIb9NecgIHoEbYzCaaVWgBxxG+Dm071Rc4hzHDU+fKhJ1wnYr3CUgTspJ2z8rTZzCklD8/w0s+kWUfgnXkFbip9nmHlIOOfObPnZTlflqgJ35Z4/1EaNREnaDIJRNz2jsmlpFKp5lpjR34chkz2rJ
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:41:58.7119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5d5205-7b24-4192-133f-08df1746da54
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PPFA93B279DC

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

