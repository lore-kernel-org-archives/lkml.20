Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB43783C4;
	Wed,  9 Sep 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975616; cv=fail; b=KONBhbRUhBBhM+UZgslZ0Z66iWiRaYKPPQBwX+usPYghDqQoDXgY25rREcdAhGeBshgbCVRJOaZvpMObgOGrfGXCTq0whZpM3p4FljPhlSMb663HFApH3Lr0qjGmeu+nBeIBwc2P4x6FgDV5oAzpfpIebv0O8OnQruA3DX573Ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975616; c=relaxed/simple;
	bh=qk400RhvB4XPHx+ekdmtG6l6wcolCA+xZ3/o+aeXfAM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hmsMnNSAwlTa992t9bsBEcDg0hgmx1tr48O3aRxyySaeh1/y8zNhmfmet+XBPLPYf1cASa26J6SOElavcLYzLZ49TkXQi1Olseb+jKnQnUvwIolzI5+i5Q1TE5n8t2IOPPkxzHb/x0lecKW6VTHj1I6Y99q7QdePjzeU3Zy1A4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kt+m1A6L; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SGmcV48B; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kt+m1A6L";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SGmcV48B"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689HA9QY3151672;
	Wed, 9 Sep 2026 12:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=X4TPPcVgzMd9qoch03LNbJbhsqxgNPB3XDrZASvAV
	/c=; b=kt+m1A6Lg0Dm3dFcIdbfVXMf5+0PlvFTsL/dQBNxlKX5jFWNEVPCQBwdE
	m2eL4eVM85gsrS1lsTgwWxIbC2k0t+PAvLVbE8Y/CNJPXcv7wFukEvccXeg1H00K
	bp+tq1sFu9CD7idmaiVk0xP/skTDl5Hg0UFZ8/PibRkgoKAZOMusl+70VetaekuB
	7BRmifP6SP+xBeryMBiCGZUcQi+fGN/jrjcOHhQPee6vYMiYV9PALtTuQV/V+7y7
	Kj+LyHUuvJAnQ6hPakZN9YHrto3uOB5AV/L/rCUmftYiZrCi3m3McDFfoIIlqqAt
	CH4yvy9K+g5WrKGFAYOoOJmt/51lg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gk4a6u2x2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 12:39:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAU/1+7ujPD5pxysIGd7jD44T3zQS9yweWUUemu3kkTX9n+D16nyySUoQGnFAiItP8WWfs1pb4bTRkOzdKN7h1I/g/8s5AFdy2vVE3lArnSkJv2E0DhbhL0YaWkDoyHFW6EPdo/94KJBC7thi7FXEWdax5hvd+kB5QnYB5ODPgq2Wh1BnIxCQzQg189BMPvlxpdCLKNjK2Bko+emzNK7Rrw9xkYIeVfKJ7LPs+BLcd3MfDCtn9fEtSVTgSJ+n4O2/BdtH5pB9tf4j+etG7+snPQNC8CaHlnVTL2quNjCHK7QRbMyZRJ6kP97RQNQv8NvHiXcS64rX3QAuZ3NRMRxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4TPPcVgzMd9qoch03LNbJbhsqxgNPB3XDrZASvAV/c=;
 b=gq//QzU1OGVERGm2LkVCtqkSl6SrK2bxwrRtJxok+AwwFuzxfzuLr5gT4vTjz57aFhYtR6BTk70wYo1wVEZPlE6Cn3jSEhqbSFfGFFFw0AkZxrrkR0O4Bnh8TY9Jx/1J/ktxBHaXIqnTuqraRLTfbHDG2cQuQXG03ljnq6MYtiRUjDbLyPtXtgz78EqL/tdRfR54BCEbhMeCkr9FSaPK1z058ynJgHl1lmFbPG/lTe01mN6pOgYR5mgqgsh7IM0MayALtLGt3HpFmwIkzWDVyhFsPcVyomGDEpWmluBpV5J6KrabTdjLamPjC5GZ7n3QEZCgALXBoozpgNVaCxto2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4TPPcVgzMd9qoch03LNbJbhsqxgNPB3XDrZASvAV/c=;
 b=SGmcV48BIvK3nAxsUWVlUdJySeJw4V5Fgkzb/0v78i/XV7FL3EKiLYr6sY7Ta7s1WgIV/3JIn27P6u/lmoZC08xircMZ+0OfHnFclAGMZSr7br0t6fQn+MFFw7s352rIkFIUYVLrZa5wxpTcs+SGUzvxzl4hlpqzkeT88Rhooa4=
Received: from CY8PR10CA0019.namprd10.prod.outlook.com (2603:10b6:930:4f::15)
 by SJ0PR10MB6352.namprd10.prod.outlook.com (2603:10b6:a03:47a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 17:39:29 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:4f:cafe::18) by CY8PR10CA0019.outlook.office365.com
 (2603:10b6:930:4f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 17:39:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 17:39:28 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 12:38:33 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 12:38:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 12:38:33 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689HcXU2736131;
	Wed, 9 Sep 2026 12:38:33 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/1] arm64: dts: ti: k3-am654-base-board: Add power-off delay for proper MMC power cycle
Date: Wed, 9 Sep 2026 12:38:33 -0500
Message-ID: <20260909173833.764103-2-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909173833.764103-1-jm@ti.com>
References: <20260909173833.764103-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SJ0PR10MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 3344d18f-e3e1-4e1d-1ff9-08df0e994c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5b+vZUHSG2ry3m9eWAm5lnC0ktr/N7rJVH1UPDSOdgCBx/MxPPg53KJ10/UGiXumpj8V1j76kCRf3Mv1KhNGloOjp8NmfAcKZ5x+xClu2Nk6xCU2Z1wkKeW2h5iTyHb2WWhsIy1DWhyf//4vlQGQ36xBz+9BgbqyaHV25oUbgL0hl/rJk3mkE92rVJ9yrhCfCRgIZFFsE5Nh9G7kZ/SdLGgfpv3kAOORtwnqRh46vt1YCutFhsWwFxNzJ1v4q+lFtwCq3aicNJyx5I49lrEA4JbkFf6Wo5a5EDaK/YFiHARThMFcEGo6XH48T/Wj2AUUNur+Xp2GQBMnIdHI6tfCIVGXLGI2yHcovc1Gj+s6V75OZxbDB23nRTWbqs7od6fZwz3VmXs6kc7PJlN9jkxAmTq6lwDWRu1xtY7VFnp003aMyr3T/8U9oeNasDlHYhnF33lmwGvlejcWT8d8whcI8t3nx0fLkAzOdzkVcKxN1aer2WSB/XO988XHt4HmInXrz+U9hMjCowQbMkDtC08AGVY8QwQwoMGMh8o1PUmXvLb9KP5eE6WkpQRB/m4IctO54cPpsg2gNJ6Y+Ew2tfzavVcL2856AXgSsJtVNQHqw3k3IOQTpJqQsYSmCikSNSl9mbrjCirTh1IIXYTBl5V/nqIIfcee+s4Um3rdGwop9uEyPEeILY4DEqar2O+hxD2LR1AepdW4r3jkxGzNdH9z5A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	glICVaPtzehhSptC5uDotNtFHUUl8pjjmFTr065/d+nEsM1PSocS7iocAY5xIOLFQh3AY5CZd5USzezNhQND7Mp72Yt7PFRgcK8h2CUubCYFCKORVAppErPYqeATN3zJhBZFWtsKEa8SS5zPqtX+y6Z/I2ZnUFmzDzMSMWl1pL+wcfZcLtSfkIRVP7JwMBl9DlXFpIMlZmGFftwq87R8eCr0Th8DtPd6Uoj53SajAUUSexGr/+VgYRFaozdeyUZN5TOyMOoBxx4UFOj3F8JfYRkkQfjNvYwD6Q2bqTxCVilPHqBIqXtMIRe5DxXhM15ds4vW2sx26qleum+3xlknQtNqPIGZekdJGtmeajtL56KX5nX0C/CNAOOpdTrZnP1El21XpHRAVilP92lCeqxmXRjxwfw1iLAZZM7xpun7liP8fLL94x7Cm4zC1jNc9zRT
X-Exchange-RoutingPolicyChecked:
	AYM0zQ9Kbz5s1UyG08S96nNvV9GM+U/+Ownl7gsL/O4zRmplehDhsoM9YVA7d5TP1OjaFSO9dMIqxayxj8JHqa6Y9ZNYD4/8dv4/pSp5GWjCtzvvR8o098WbqW8GihaafnIVDt4URxa6m2YppfSdCAAqjRKBSISLcIfAQqopQXdfeMPooEtHe0nqBGHPgOoyfJTc2quVuO9ijfdVDq0LhHmfSpriiB9F2tXzL6e1+FJFzGgRP94CREmObaBDtqYQI+Snyj4DsfVWKjspkoi++A9Z+jQRa1vCyBKejZOI9LaLkgUGraMr1GHCNtkHkY+BZgaimSGw7H/58GZcH1MmWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 17:39:28.3759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3344d18f-e3e1-4e1d-1ff9-08df0e994c68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6352
X-Authority-Analysis: v=2.4 cv=cb3iaHDM c=1 sm=1 tr=0 ts=6aa199d7 cx=c_pps
 a=zBqzCUVTuw7ADAyXD+R5NQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=rpeuaAr3cxLXzURqdgsA:9
X-Proofpoint-ORIG-GUID: DMOaJhwf-YpZqzw0GzL_yoBcAYh6NPJu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5NiBTYWx0ZWRfXz7cel6BJIC3b
 sXuUT6tPKfdrS/XvoRNoE4WA2tsenpThQ99QGxSlbnFg9N/Fjo9yVgkDcGpfSqO5fEfrvn22/Zr
 lC2D2UzzPAnM/MN/RqsDuBS6osaQk7E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5NiBTYWx0ZWRfX+F3BJfwb66z+
 Z0MRAbgXXEPcE692bUTTzzX/P9qkI9qcn0d4kkC+OISBlYApeYI8ZvQNI/tLEbdrR9qiwI19uNM
 zMdcvL9PQVScK8lUA4zFsJr733AEFvxkC5QCp24M4H7QjOHFSqbF3RoztvZFFvrJxMX/7Hbk+qo
 FbtB3jVqqO165XAqX4Ru6IzeXNl3YSZU3DF1dhncW2ids96/rNlNtqCXsHLtU29+nnGd+u/U8jQ
 pnZgVvNIndHAmNin+Kr3OEHISlHnWTcQbgg1/qhcUw6EMQpef3xtHLYuSdkAwNuO/FfjidCm//f
 XEP5EfF0ge8XkSJ81umZ3NgPMcrhbpgyjkaegfH8BdS55HPNmQnsaJT5Lrv+0SSN9KpPvpYhZDp
 rnMiKr4gKz9LkG6NiUwdCqrKFPDdxsiByXdI6jKNsuuHhfQcgs0T29aGS/rUSCQQvjy0k81lWnN
 N0zD/PEs4DdaZqqVZaw==
X-Proofpoint-GUID: DMOaJhwf-YpZqzw0GzL_yoBcAYh6NPJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090196

The AM65x EVM MMC1 VDD rail discharges slowly through RC circuit.
SD spec (section 6.4.1.3) requires VDD < 0.5V for minimum 1ms during
power cycle. Measured discharge time on this board is ~632.97ms to
reach < 0.5V threshold.

During boot, MMC power cycles between boot stages. Without power off
delay, VDD doesn't fully discharge. Card retains 1.8V signaling state
from previous boot stages. When MMC driver later initializes, card no
longer asserts S18A in ACMD41 response (already switched to 1.8V). Host
misinterprets card state and forces 1.8V anyway, falling into a bad
state and causes MMC init failure with "unable to select a mode"
signature.

Add power-off-delay-us = 650000 (650ms) to ensure proper VDD discharge
during power cycles, allowing card to fully reset state between boot
stages.

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v1:
- Fixup commit header and description
---
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index ca1300e130936..edcf039ccfbd0 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -460,6 +460,7 @@ &sdhci0 {
 &sdhci1 {
 	status = "okay";
 	vmmc-supply = <&vdd_mmc1_sd>;
+	power-off-delay-us = <650000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc1_pins_default>;
 	ti,driver-strength-ohm = <50>;
-- 
2.34.1

