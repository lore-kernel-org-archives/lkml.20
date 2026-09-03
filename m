Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385741A55F;
	Thu,  3 Sep 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431293; cv=fail; b=rzXPRuK/z2/0njLD5DDJS+Mmejf04ERniPZRP61Yf6mtPiCGAG8GtBVsTx7hiitSFqtG3qP62k8D5Rr/EMMNzIBuALoex1I6lg/+qmFEBAM7F2SobXYrph4uvszB6VbFAvS4CFZuNtrTxH0MelCVL2TqnQOFkz6OlwV3x5ph2lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431293; c=relaxed/simple;
	bh=uDWHa2PFXSDn1Ha/84MCkpbJoMFsZQTgYimUIY8VY8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ckvlWJAFLaU2cXBi1F2w2OxdCc84HWrUut8BpGWfNBQa6zeYw7IKBfiKi5Vv0llxtMnVk0Y9Mg89UyMmjazH1Fb/jM121Dl7cYi0DIdAliJR/u7S748MPEjLvICKLCtiCzXV/LzYGgKI45JL/G/GW3JAZYq795lZE1yG+2Ln4bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mvuQuBPL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=C4PhFZfS; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mvuQuBPL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="C4PhFZfS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6833p7PA2771765;
	Thu, 3 Sep 2026 05:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=AAWbUJxGg+iH/BIE
	IU9vzyaJNinLGTr/toJ2Lz/TJU0=; b=mvuQuBPLcUCGZtlyItfTJ2DpwNwvLZEh
	7ADY4Do/oM6nXfk5xo4+PMdC0KnxWnRcGLYPqX4T6s24cixJCJY0GummycNId4/x
	xq3Hz1fquc8FiDdgxqA+uN1KKXsXZ7NkwICLnHMXtSxsY07ogBEW9v9SJOhrJ9NZ
	LVIrHaREZnBxSCtfT7OxdGg2ej3hWW555eohUSk0m1RCWYZCsrX7AAzleq6FZPqy
	aPwh0UbD3E2KzfHLGRtKE3CC/M0SGzGkhCu4/oVJrUL1lm4kkMq2XAh1smwnmX2P
	ewcG3yC9xnx/16RpsEv8pUJjTbi0snMBmamvRXrTAwu88b2+xGI5vw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021096.outbound.protection.outlook.com [40.107.208.96])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gduntkj1n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 05:27:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4gdF+2YOKOWPGOTVRhAs6SshB22BmV39U/VHeLbfvHYuq0Qnp8v2jzgwZX8t8fc9NmLtj3sOgBdhpfvx50iOeQAqNnLMq8HLLrgsyjjepXB+h/UhP9d4DF8aAIno9HoKDRLlHLMIFvqrr4QBxnhgK8clFHeLGl4DdMaWozRQ3PTpdtfb0V0t2fH0nsgYO0U/g8h1LsRWfoqVI+TMv/uyMayDFcqrYEfdjE56biy0p46VXnVNR8+njffbqwwydxF5YHBeJ8QtP6638xvHxfJC5WJCsEwlVFYNltVpZ+qwkNbcL+WcHdwHOBstu+z559ElkIBK3EqTCD2Jf5SGl9kgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAWbUJxGg+iH/BIEIU9vzyaJNinLGTr/toJ2Lz/TJU0=;
 b=oSYpm/L4VhjGoRQutAMgbadVXs2vrw5AX8eyuqI1E6lVyY3cNhZsPNSB4db+mADG3OWhZ3tiWwEgFHkS/UeiJdiCarX6u8KF9jqcXj8R4qS35opPlBl5arth/Lb9ApURGtzcNonoTTsbrmzXojIro/mncQtJfIIc7iAJSHsVWXKIWvxc7MN7h3wiJCNCH57J2pNAjGaG678Oshte8PUo+YJoT1g2XPmShBg28R294vedK9TkkekNppiB0O5CLl8rxyG4q1D00ymmriQOuWJwQQrc+C3IEH0rZiW4+NwG7hc9n1NQdIVQ+tvR7WD9VTw2yezHMCoS02KL9YojUbLP9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAWbUJxGg+iH/BIEIU9vzyaJNinLGTr/toJ2Lz/TJU0=;
 b=C4PhFZfSWNeS+8y2iBs+4weUnTQcjL54Fli7TPBvKnKK+9GZzQCSZa/AlfTkcT5inw4NRFMtWZALXbSfaz3+uryFjWiQglFP5vF3WmOk9gsMDvOtxjgRuMAZzgstXz7RokAn9xWXVCuqkO4dmLncRqxIzPeMjxLnGkvrGjO8vy0=
Received: from BN0PR04CA0056.namprd04.prod.outlook.com (2603:10b6:408:e8::31)
 by SA1PR19MB6622.namprd19.prod.outlook.com (2603:10b6:806:255::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 3 Sep
 2026 10:27:49 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:e8:cafe::10) by BN0PR04CA0056.outlook.office365.com
 (2603:10b6:408:e8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 10:27:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 10:27:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A9C63406543;
	Thu,  3 Sep 2026 10:27:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9C037820247;
	Thu,  3 Sep 2026 10:27:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Pro 9
Date: Thu,  3 Sep 2026 11:27:43 +0100
Message-ID: <20260903102743.3782541-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|SA1PR19MB6622:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 449068af-5d5d-42f4-192c-08df09a5ffe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|34020700016|61400799027|10067099003|11063799006|56012099006|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dtkFSF+xkLbls/EnIhEuWMtRt+UGp/68OtQkDKZ/MZrp1NSB5DFDs6jWuLPbZ1HWtqf3RxnxXIuUUvab4riEQzgHGOQJU7JqyrsDlTRIwpCtWElwMAFgJTw+3Wnol4FoguHy7Orp4pTZMPoSZawPoackpbB0dc5RjaR11NoybviXSpGTzjl4kAn0zX3kcohNxba42S0/EjGpOfj0QuXSkWCoRo5kHVZwklo+PRbB3P+rgG+mmQSv/PCd2ETjfEFIkJAhgQiIryA+isgj4sMAKxB1RG0wn8lahQPqKgT07w3BoJMkZBNYTeQd2nP+T4ae3fkJZOCLXL0LCO6TLuXc/CU4NPwjuaztqEfUDFhKIbsVvJJ05a5lwRzICHFXyEixPR34tp3TdwgCIwIeJKKEc0fC3WhpxUqCbP0VcJN10Hi2rYYlpHc/gPzMFm75/8ubCWqK8aJ55gA+RfJfjutbOCZGAEvy2dvBrIlN2GhKmJSs6a5LGTYA0S4TZcOSriS/9yxoaYnGPny/cROSfIA5ctZBEIZ/fYudjgVmHkoecaLEL2cHH/m3CBhnKSnw+Uf1IBxhrQz358LO7mNdcQm3yu8U399W5S1MPdhk539aLEirIzL87oKJT+Te5sb04swOmAaSMOyR9AEpoEcfv5EipxCDRcfl26RdHcFPky70tCn5ROpuLNTix926QQ0q4bwiaJgqnyzM4FaJl2hj++O8Mg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(34020700016)(61400799027)(10067099003)(11063799006)(56012099006)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z9zRTgYTuXB+TqFuqI8UUjJ456NXy2h9i18TbvuMNx9m0oh9iFm6K39DH/W2wa9aYeT7s7Pt6G1uMmL6yST/AfM9AJLHZN9U3SHZkKpeffl7rgDQoqzohh7/Agc9plUiB5fsvK5+heRS6UQDN1p0fUIIYEbJlA5ctAqkpXVcgtfTWJCf2Wc3kGEzMUgu4DkSzooxYfbcm12Sm3BByrsDis/H71NMdbv048adkPFpmHJm7GpLy7lQkAcqcjKA6Q6JtaZgSxNNXJGxKtzY4KXut3zlYbIyiWrqzQQi5sbYwFx80cNb7RJkUgo2kIiul5iudTbx4fDe/bQ3LjQcBSS+ZXkmgBgxMwCl8qaeEriql7DQPVInKV0RES65KkGb8Xl1foLx6de+PuKATo/03QxHMAa9/EYDPiw0/7yNLG0q6ZgPDQfEi4v60PWy64eDUmVG
X-Exchange-RoutingPolicyChecked:
	dPktbPd7DyqwOUUrxPZGQd1drjnQTU7lU1Jsfw751AE1cb0pOAv1FPTYXlJgsUdNBgFMH/H/mGMlgSAJuuEjfVwGkvC1JrfIvLONlN6x9/tPl9x67pDiuq+FN3jS9nvZL/DvwMzoOy5JSEvQtCRI+ZrQCiCfwA43XWtF/Pyf+KMt0X9eNAZh73hutOQY7OWf/yf1lcywXrC/9aQyQZsDHQuiwWktQoQMD9gxUabNQ3krSvA4YTQOCDxiGVOcF7FLESUtyoeQsGs9aUMPSivtqt6FHFq3VApwlEkdWZbp7uMEcNL55vQyOiQXvp6mpRCTNYxew2Ybb0V4+wvuUug3eA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:27:47.5478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 449068af-5d5d-42f4-192c-08df09a5ffe9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6622
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MCBTYWx0ZWRfX+cKIaEPIpJdb
 unUD9x4kaTwRXMcHav+ajpLtYnISLKF8jz88euN+tZc9tIWctN9tGNzM+Zlw14IQ4tCunZmCb8z
 s17P+Bol6IgfA7ObxTNn5ab0WhDc6wOMgYnJc56SoKl40F0uYh2R/DOMbiU/73EXjUV57owZG8R
 B/r9g5wdaJNhdd1YnlRzvIbvtcd9IgsQWMLRNXaSSTdo+KzFKgSi2Y2e32CQihvR3tiik4nlQUm
 VkLs3Ffx4MhgJEu1D4eHbiXnVgv1QqLc2oydDM0r3FH+WqlrT6aWwRwYvyxGxW9M90nsIt/UV1V
 4SwPiWVmbKKgFKggON43K3i0EcdQFFxcJKl2WytD+Ul1BXw4KAJm3ymxkB+2F6ul0zNAllVrJXG
 oisPu4PVKjIcPhTKZoFqB0lncbd9XSSLrc/JnAgqmr1z1kWsi5qR55hhZ94MT2k0RA73xgUjOTg
 1LrWPpkOtf0iZLN9MDQ==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a994ba9 cx=c_pps
 a=TfrkMYnKeonxmUhmTT/BLQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=-SvNglDlwXPw_4R48REA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MCBTYWx0ZWRfXzOuadVVDFGoY
 eYhyt+/KQuNNnADJMrN8Tai/PEI21YRsPpQj2wS9EgfkSzjSd0hH6vYmR2PAvUcpQJQFpOwoJb9
 F5N0orG38Zhk9as1DQ1zyvezko5y4eY=
X-Proofpoint-ORIG-GUID: syLUBtVQF5Q-wJ0HIa6WQk4ejAkCVdAG
X-Proofpoint-GUID: syLUBtVQF5Q-wJ0HIa6WQk4ejAkCVdAG
X-Proofpoint-Spam-Reason: safe

The Lenovo Pro 9 also has a Realtek device in the ACPI that
doesn't exist in the physical hardware. This confuses the machine
driver into attempting to create DAI links for the device. Add a
quirk to remove this device.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index e49325331b3df..72e59b50b6853 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -235,6 +235,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)ghost_realtek,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83U9"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
 	{}
 };
 
-- 
2.47.3

