Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC24AA578;
	Thu,  1 Oct 2026 22:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894216; cv=fail; b=CbcfOo/5mdGdmrvmUUm6wSBe9B1sZWtVSQ+WYRmaZPzmQoU21M2/eV5vf4orR+x1kXa/gErsVGcAoX5J8sMOiDBPmlwWKOkXXF9Ui/NitB+WDmjkgsRlQEusN3ID8TIZhL4RxMWiiXLNLNcfMynm3PaI+f9fIZ6xxp6P0U4ZopE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894216; c=relaxed/simple;
	bh=SN/7ESXbvPnqGMsGGLsd0th23dQ4UZelfN2H5t+LnU4=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=cv9xqThEP4Q99qBYDeb3NC+toLVBTnc3lrffTx/d+n8F+qQxB5b8QM/gRKx1xqYAA4doozKvUFCBt9IIX1zyZCDzi8KEp0TheGaVUSxkawtP58oh0XV2HMumbzIvczd/DBgdsGMELWdazo+vSZFQnqEY9xdAtap+uFxTb3enDSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=JoyBHBuo; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="JoyBHBuo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRVSoTzqAiNfO4BZO7C5GReLlNkSEnyhSRWfEBvG9maSOk4dHNeQ++87UUlvqE42WAGd8geZA1CaqE3LQiq/cDJYAKlBeVkvHpj8++S+AQDAOOjzkMu5MfjwafVKDeLrCCfR52b8ZHvaCrIOXHcyC/+5onIGmptMa58N3rvfZQ34deeD2bsVxt9r4CD5LMa+SkBzTL8HqqPFcVrv0lBUInyBTXg6gkxOleZA/xU/O/0u4BXdqTPPORpkA15wtvrrKp8n3B6LjDivYRjxN+3/E76kWAyzaOAtuo9mZcCwStsgJFKsCM7HSotGO7gV0+xCG1t9U1vZk53mHzO22ZuESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k98dZp7DN537cV1E1vGkeSfUkNCBYaq6x6C/1QPaqIc=;
 b=V5iBbkNAGX9WgMPuC5RJw9ik7+jOHtONccBClYldvNeEdhvnj6b3efux7Y5g/esrSPLtkdZXEsfib9zG0fRXvID2/i4QtdhxdOSUubl1Uq7RqqE3uRlcyZ4FuJ9/fbn4zhL2xF3Bl2QXE0VjBGTl/3gMaWLvf2+zsb+qaUTgPqifVFZLY3smzVYJ1uRWoLBp0ekD5No6IVpuBiufGBPUK9UR0XVd1cjEcpj/Ry5LEaTYlkKAbXCBzGYhqeiTfNkMKZ68f5L97D+/Px4SP6524uH4vjMUMG2woNlx4MmoJ5Xar2M0NcQsUSPWjrtkYR3DdqVfLmaKRm81o11O88FWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k98dZp7DN537cV1E1vGkeSfUkNCBYaq6x6C/1QPaqIc=;
 b=JoyBHBuo2Me7p5r6Ynxcbq6GZFCFwgr7M+NdNneaHALSgPkv6os+Uxa39EmPG1Kw0qA/kCwYrDRS1pI2+2ByQc/SW1HqKGxe71iqX0iaEGKJhYMUPGK0JJo/v6VGgjqz0BR6ILg7w3PCLvduhQqpXxI2dsBEyRAEEn3UZugTWdQ=
Received: from DUZPR01CA0314.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::21) by GVUPR02MB11854.eurprd02.prod.outlook.com
 (2603:10a6:150:363::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:40 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::7b) by DUZPR01CA0314.outlook.office365.com
 (2603:10a6:10:4ba::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:40 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:35 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 09/38] arm: dts: qcom: apq8060: Align multiple property data
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <ef0bce23540c24088526af1d686287d74e14b67c.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|GVUPR02MB11854:EE_
X-MS-Office365-Filtering-Correlation-Id: 2151ce32-43bd-4cd5-e00b-08df200c7645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Qt2bWNqCojWAteGiNs7cFqKs4XXlv/OhCPNkLKN8nRaQUe0dcd071X7ikjd/rL5B7H7XBXaeLepamHOJur6BUOmVMC2HocuXazgflFUIU6DCZv3h4IPckNUNJYUyf29coAwek6nqzXkv4kSwathiT+N8tm9TotEhEzCfPA2wetXqLz6MTtGzpauiXfVu0LorT21BepMeMIeXzQon7y3OL1T6aDSPrTA6BGYLGv28PzbYb7nY4HOEDnLv4wxy/ZQpKqCVWnz8cFkcc5UUqSBe2qP+UMueG+TfQ9Kuh+VkIUcqT9OY2JXdqDX0apzQRUqYepYkV1Kkt9+k5gnvgUy6aLs7muOnNWUCWbSGlQvYZl2nMPKIcp04FYv5AEHPos4AuLzwN+TsBoEyzph/Z5sXamFPGs90iLbN4ORT30aszgZfA9k946Y3G4fcCiIkclPeqVC1vjzoeEgiVjbOq2N/Y4xN/nGZV4knYoSkU7vnCrL9EEyB2caim/ziKwWCUj26vkD7wYaXDUeadBY40C48f+A8LKQScTpz5Q1J5HI56Uz/nLQN2cqoDGvlo0odFq7pBHkWe7pl3MNOevftS80+rEl6/y6HkeYdpfk38k014mi4ujrXKU6kNcYgHC1Bb+jArt5XjRyZUOSA+/gAwqN/NDq+6o4pyDVjv6MJ6PvPjWf6teEYK/zK6g/dKBk8H7No2KQPGnLqIbPKTsRY+KXdEw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n/zNtKbyGE+zKqXnNo9HU9F2u236r2Tnr8txdvUoyXtBJbV8WaFyozGgU82/F/tpMig2FMsQ2Ynn287NDtdk258JFnS2utc4hNxMDVGJI1wnHFGSnteCYyOUBk3dEQ5epTXruiTtp6ghFKlVfxWYMFVCS/8WjHMqMrApTVi1ay0gVTVKCzfvuYYvyrJFOmgLRe87R4cQO3C7M5tqqNW44o8/X2qMu64td8Ta241kF4IZRwojnzsHf4/GcD1gcdxb5xHRVR6qS5kEpx2//PmLdig/VZS/PhCWHgIVaOrCcjAHIQyM4zLDXLtDdPu1n88SHRSN52DjJ6ohb1YxD7pgYZI+Avnpnt3ZRObFSdbHUOCzJmzx8ru1Sp0TqNmzMU5ZdoT35pHr5LXgD3ovgVfoXyZhscv3Nvh02fXiRB6qis+/WnWTvfgpN9/kKtWMWUOa
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:40.5398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2151ce32-43bd-4cd5-e00b-08df200c7645
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR02MB11854

Multiple property data on a newline should be aligned with the first
one. Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index fa2b372e51bf3..4dc63032cccb6 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -99,7 +99,7 @@ ethernet@2,0 {
 		 * for network wakeup, connected to the TLMM.
 		 */
 		interrupts-extended = <&pm8058_gpio 7 IRQ_TYPE_EDGE_FALLING>,
-				    <&tlmm 29 IRQ_TYPE_EDGE_RISING>;
+				      <&tlmm 29 IRQ_TYPE_EDGE_RISING>;
 		reset-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
 		vdd33a-supply = <&dragon_veth>;
 		vddvario-supply = <&dragon_vario>;
@@ -861,7 +861,7 @@ cmd-pins {
 		data-pins {
 			/* SDC1 D0 to D7 */
 			pins = "gpio159", "gpio160", "gpio161", "gpio162",
-			     "gpio163", "gpio164", "gpio165", "gpio166";
+			       "gpio163", "gpio164", "gpio165", "gpio166";
 			function = "sdc1";
 			drive-strength = <10>;
 			bias-pull-up;
-- 
2.43.0

