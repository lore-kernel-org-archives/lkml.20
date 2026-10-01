Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB24BE44B;
	Thu,  1 Oct 2026 22:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894219; cv=fail; b=IhC+/k2UZONVrqozj7onPk7GjFfqXBw15voZ1rFv2DSOeVm0kwoEfmL5UCqHy2u9J2nYSkZXfQ+jBQIpI5a+LcaXfohJNMVe0qYQ0MJ9112/7FpPvPJi5DHMGg+1OTpRTpUJA+sK8zeEyq1LOp7ScHSHv1+ULCW+hDsF+WRCSN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894219; c=relaxed/simple;
	bh=XcgC61oFLFwYlOIV/ANyRNaeuqSvn7WMmycEWGeOVY8=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=jFyTVeCgQB/dz+jvAFtF3k/nB7k7CKtjcmLvgiK9w5irDpTlxCv4RJpHc9F9/Xg/LANmP+zvHseF7Appsvs7Pkwf+vQOM1UPWuHgD/hcPxgyT+sO4nLTANGmkPzK8EptC47NfQUp9Ln6FHXYr+FKq/ygo2cUngzYGz/pkTo4L4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=MU0CEKuw; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="MU0CEKuw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhoDnxaBKA3d2CZik8ENjjLk8ZEcvcjycHPmNSyaNUWdi29B9ZmC2Mm8BaqlPt6m/s+d56kkJthcOjwcAYKxY5PWmOptQibndX5BctJ9edJlfxk/DmG3m22KOa+RJVEDSgxTwTh1ludwVi+Rg1psBDFsugV8f4UanNSoChJQiUJrjmSf87bGYwKCKRyxThyNl7qrRODa0ePC6DRMAh6jYSrVR87uqRrlNqgj+08/hT1/pOU9aV6EZqKMD0E41NC5INJCaFZ+LA9sQRifqZ62hDNzIdH0df2gGeONRCf8KZPvWLWwtEkE0i++bAtEcYDNG5fgF6MHDJhI0ADqZ3aZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhTzUPieEwcbnqCj3no+sQwx0xmqlKogQ85TBl+doYE=;
 b=uD0CnQDMZ5Atr9sGsljgodEV/AmLGaloFB1EuPCPftGUvM89j9vEJ/UehdB1LyfilgZqE1fnqjK5WBu7NstP+enzhq/NjmY2uDV52bLQQKn2fwlHQCbWPqI+TPeGOr3evM0JoOs5GA8LenByCOkrxno4m2zk2J3guS4qT6gC712qc6rLXkyWUp3aNb+wwJiRr5Fla0Qs2LDdsFCoaio4sqO3cL9Tw1ft4OI1E2v8OsA6BPOe9XDj5UtJg5TtYBtmHLjKBJsnH0YvTuaUt5nx2W+Avbr9oQKQKSI53/oTpQIk4Mg+OhY30fkgwdrhDQKytCdwG7zVqDlLBlyaPUIthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhTzUPieEwcbnqCj3no+sQwx0xmqlKogQ85TBl+doYE=;
 b=MU0CEKuwKpXJHiRqJkBYOzbIGmIikOYJ4661R8/Hui+/psKdO0atrxDZBsDVTD/Kh/W0nNIcM311jrhQ6sih+OnEMYT/G6mYJ4H8jWtW0dxxYH/gfIPuA/72kfx0TqdUM1FRgcVMV8jAor4ZvAyJvdo7B3Cb1AQe/L9NlE26M5w=
Received: from DU2PR04CA0279.eurprd04.prod.outlook.com (2603:10a6:10:28c::14)
 by DU4PR02MB11333.eurprd02.prod.outlook.com (2603:10a6:10:5cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:49 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::68) by DU2PR04CA0279.outlook.office365.com
 (2603:10a6:10:28c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 22:36:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:47 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:39 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 15/38] arm: dts: qcom: apq8064: Remove tab after property name
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <458647932763c7a063ae86c88e0ec9b0c09216bd.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:39 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|DU4PR02MB11333:EE_
X-MS-Office365-Filtering-Correlation-Id: 79709d9c-cc9b-41c8-4f09-08df200c7ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	onjG/oI8J8g1OlbPVER1IqO3P9lbSit9qkzLcbLLLQl59vmph9gZ0GcowUCaNZYfs0RIuN9grCLYfVT1mMSspM8LV47scMPt2PTVc0ACpl+ei+aTewzd73LZBMVTR/lyy4bkW5B+ujutCRBOSNsC3n83vvpa8KDO+FlOGGZ5rqlC2z2Zxi6NWAwoU0RRuaXQuC7SdVOac9Y5tdrVnr32SNgqvjQMfmZe26F8QBqgMGHloXI4ePV9VK7qol8dQnj8qQMb51s0jHrsBB1StL3Jw29UvODeihcGbW+c5pUyxPOCcZpd1KREbqlC4GUSPI4dsJ93+q2l5tGu543qcPXN/io6wCIUd3Sq6SCa/LFHbuqhasokRKrOOtdOgrXUEJKuRxH+XLWYZcGWm6RznvHeDRCs2VBo4DKOMvAILaRrAKwHpaZ6eK6KfsBSB0hS8+9S/wW4w9dR1Vr9H+WxZVyb7WLtbibH0l+BZWghevCagLQRgKYgKrnL9l0peiu7Py6FUv0X8JYoYnTJIi3UlwfORq8LifM+ZK2c8+4MnHpn+HWgPmhJ5ZhaMPE1xKDFOdBPgdWiFnRlzecUm+SIiKFqN1komtciEjW7+lSc7Cv+e99mESb77DhETkWnWJHwx2FdxoC4YZEZ3VBbmuz3AKSGUOA6JE26wNAVtSo35QXVNapuqJl95ip4rs2cMUSFdSFGWW0hPPs/5pOw72nUkS4ELQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MKAp4A4bE9jqMpqthO3sk5TxmxPYSLarT6uvPD2QZ1RRZnMxXRin7flUk4XB7ZFMINsQ4n8mvgNrVian8NN02C2LZFHW/ZB5evwl9bVmJNBrEiw7bDWAShWQfrPq3aFd/S+fmdShGEkO0BnF+TduSMItFCA45E5RUH6f6shevl1oF4ZZpykQ1jXiNmwyfdYohniqmYWRLSCZhLzFcmznzXc8W2BoImKAKFiZdh8xEkkTP+go7dF85J5/LJzwMB2rDiR8cFJES9E72dwGp1UZyVDqHGO1zRLVhIUui/H9iMbfO0Y3+2gijD5gltrqCyYd/bV+otpHqDc0o1T/C9OFxN2z8qfqiuTCqljx3p4tx/hK5G/cqlzZM+RsDPy2qYUg17EiJLSJHWcZVJCjh6sYbpWjI/1LnfKHBn718ebDtsDvLXDu7+QWJQ6J4ZFqMPOC
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:47.9882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79709d9c-cc9b-41c8-4f09-08df200c7ab6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11333

These shouldn't have these to be consistent with rest of the style.
Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 565f98c00b3fb..3c7585ee00a7d 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -916,8 +916,8 @@ sata_phy0: phy@1b400000 {
 
 		sata0: sata@29000000 {
 			compatible = "qcom,apq8064-ahci", "generic-ahci";
-			status	 = "disabled";
-			reg	 = <0x29000000 0x180>;
+			status = "disabled";
+			reg = <0x29000000 0x180>;
 			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc SFAB_SATA_S_H_CLK>,
-- 
2.43.0

