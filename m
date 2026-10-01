Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013065.outbound.protection.outlook.com [52.101.83.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA7C4A0F13;
	Thu,  1 Oct 2026 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894217; cv=fail; b=Cu+XJCE235TphXSqsBOw4QG20TuRUWqXI7eW5xjpAjXsEjaDu8/3kGzKW1sFr+nWdOAGaSf7RoudijrXnH33acpRNjnRjiOcLEvwpAlPds5NoooD4xMvTxd2Wc3r0yst0dzlOIWHeixA5ytjxQ/Lz0bA8cVGIr8rhBd0RZHjRVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894217; c=relaxed/simple;
	bh=NR83Epvgwu0W8x4ByOc7FQ3AV6+R3YznGVwrMScE/GE=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=dvHAOM2Wa/DJqdYZitJf4O5wrnW6oisk2J+mBKeOGoVC1AXbl5BgSZO8D4u/+qlAtAQMo6z0qChmbsIFrea0Pc0tJBv10NqvddIf5Irj1C+e5vDkfyRK3wxqQMbzYv+Pn/nj75MF5ZSqDEBI1XcSwH2sa/2D2ooUJHzrtRTxu2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=GqFEcfip; arc=fail smtp.client-ip=52.101.83.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="GqFEcfip"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyI2aqfsTVTMfd1i0IRhW0EQglqOpEyOm/Ous09T+cNOUL2vpo2fZizS4GNElkoAFwxiGMIvbk0cFbxrbovO+VsLve2zShOAKs/ExljLFTo87lmDdeMgYvIX2pP9LS1dCo/jmtXEgo3X6cPDLBOOsLtNR9T7t/G0hCrenuzyzVrAyQf77aDyYo95iENNhFakgv+7uF7zuNCWwmkiWbUaj6VLVVnLYFrHZz0mz+/Mr3LTVwZekVKCOkV53YdyZ6wN6835O5bAWGq2KbKPFHrOkFZabhzIaPBMYF+fWAhYErUc+IN/9JIde4RGW7/Q8+Mnu3eXqTVtMqVlGZ17PphTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l13BoHq7AP2R3PkVdm8BXgW2qEnlzZvKhZPM6tuLT/M=;
 b=trOa5iCQkNbzf5DlZzKmT6ypdCG2moa8OY9XJJmXKWEay7CkGuNltsLWlQR8W1nPP1CRJQjnZMLhi7aE8ADhrOJOhHGvmOfBBEdnlOUDgoak/mftcH48q2CcJJjNe2ByUAIJ6jKze4DNjslKbLZNo8EZ+jWdgAUXvu+m1us3BryX1NAVONVQFaQwdHlggFaQ3GEtQUhQt7AMrbmL0jfM3S4gxKn1qu+Ri7ocDC2i+ucSk5HSxr6xx3So1WoySpoiXD3Wsa7Vwr6IBYiM3aduWIQ9T1kljIJF/gAlKqpg1P+hw8vQgoVvLuKcMj14XLbkzOy/9qzo+s4nwnUiQBAvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l13BoHq7AP2R3PkVdm8BXgW2qEnlzZvKhZPM6tuLT/M=;
 b=GqFEcfipZrHgMCrWHzAna13zrWZfaD3/ryHcJXaPmdkQ+AMEuFS0BwikNOzhHJKRIt0VzUnAX0+INC8HL4w9hfBUzoXLxu6HlZYEIenWpTMRSMtpWxOPHggmPh5gxc51ib5xk6Mk1hknfbkfdwnyoASBUGxcOiwhTnMyrQSU07Q=
Received: from DU2PR04CA0296.eurprd04.prod.outlook.com (2603:10a6:10:28c::31)
 by GV2PR02MB11875.eurprd02.prod.outlook.com (2603:10a6:150:351::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:45 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::2a) by DU2PR04CA0296.outlook.office365.com
 (2603:10a6:10:28c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 22:36:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:44 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:36 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 10/38] arm: dts: qcom: apq8060: Indent property data with tab
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <a647694d7a5f1e2f8d5c31d878e87a6d054d4aa5.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:36 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|GV2PR02MB11875:EE_
X-MS-Office365-Filtering-Correlation-Id: fccce0a3-a4b9-4571-d527-08df200c78c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/p/cQGoBCe/hQ5FAX8mDAQ2V0JlPx/NSCE5Ds+WhyCqWR+W/3haDt9aBJ0638ZTsvEp7ODCNoxLrX3L39NcMN2szm3CkgEW4l9Aieo0e0PkxijUknc8P5afzsUCD7FOvHTHCl7SsV7IOFNPFw//wsZVlG/Hc5kDrLAlv7ljRigBl2oNwnLLzwlmCGDW2E32DbqDl1PZCYc5S/blbIr3q9T8hp3WLULIY9lKqfm64i2kBzhP9GZhgy03UxLx+f2XHMF835Kpadjf98PNHXDlElOj+4oQi9uB/Foe8p//5XYiYDqWU7U5t47v/WTsimpu+OreL42W2xAFw/435oLhQt3ChjEJ5wIHKw35SY91xdJMixK3Tyq1EgG6k24mNlpydUVS1OKQjnZGGpD2i6bbo0wbm28D6XSKXo8cnswmJyM5RVFdWNHiBgLniM6wgOywPiAz8xgdC1yAmmeJejBsA9HKRM7OcNOdkX4ujKKwyJ9vDXh+x5QwUzVnWhlb1VzZKOZWftw0dw2hGVFNrDHO7y357BhqhUfNfmdNbVOSPBWxRKl7UTdJunftAT8L1c5fjrBXsNN1na+H3Bf7TGLU+XhgFI9WBu4idc2X74CMzZwDzEIQgglciGQzrQZEGSpUTvuLK1MD982mo49Gio6x31Rcj4kxhbw0CPbq/G4azzOM57VDS9VPYYPJVBoLaIADDwMJJVIxlgttsGNbeLeQqug==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PZTJstVa0COMfvFenxLfbgEYITHdKiXqJZfl0/CYWkvwWGCFzXMBYygpaquw/c1j1e5PK6ticwL2EsjsUMzeG8Q0XKRB/nW137MqEcnE+BPDr27Kb1DzUYX+k2UWDGLKYlOAjZsh2PifL7+xt71RlzTE0+EVYV1W8hF1ztJn4AOKbURa0zhwCyUwHsA4bEcB0XLuHWH917wONDYRWXDHHWxntUKhyAub8WKi5uNsGiQ+qkMJ9nvkuHdGk0Uu5kD8eNgSwAvwMOBBvTDTnBMHKNTm7/v67ZBdnrmvpZcbVHvs7IMB9VXXuwHMvIJu/nM9kaKVOMvfwCjY1Xl0dlhCUuN1uADRTc/KaGnQcLlvzrRUUVe++Umb3BP8RJ8WKPTzw6iZweV6aBB0SlAt5eBB3MaG5qiie2JO3RfzXi0nIeZRErVeRtWrODJujnInXzOx
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:44.7072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fccce0a3-a4b9-4571-d527-08df200c78c1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11875

Multiple property data on a newline should be indented with tabs.
Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 .../dts/qcom/qcom-apq8060-dragonboard.dts     | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 4dc63032cccb6..6ede4e5af4494 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -966,25 +966,25 @@ dragon_ebi2_pins: ebi2-state {
 		 */
 		mux0-pins {
 			pins =
-			    /* "gpio39", CS1A_N this is not good to mux */
-			    "gpio40", /* CS2A_N */
-			    "gpio134"; /* CS0_N testpoint TP29 */
+				/* "gpio39", CS1A_N this is not good to mux */
+				"gpio40", /* CS2A_N */
+				"gpio134"; /* CS0_N testpoint TP29 */
 			function = "ebi2cs";
 		};
 
 		mux1-pins {
 			pins =
-			    /* EBI2_ADDR_7 downto EBI2_ADDR_0 address bus */
-			    "gpio123", "gpio124", "gpio125", "gpio126",
-			    "gpio127", "gpio128", "gpio129", "gpio130",
-			    /* EBI2_DATA_15 downto EBI2_DATA_0 data bus */
-			    "gpio135", "gpio136", "gpio137", "gpio138",
-			    "gpio139", "gpio140", "gpio141", "gpio142",
-			    "gpio143", "gpio144", "gpio145", "gpio146",
-			    "gpio147", "gpio148", "gpio149", "gpio150",
-			    "gpio151", /* EBI2_OE_N */
-			    "gpio153", /* EBI2_ADV */
-			    "gpio157"; /* EBI2_WE_N */
+				/* EBI2_ADDR_7 downto EBI2_ADDR_0 address bus */
+				"gpio123", "gpio124", "gpio125", "gpio126",
+				"gpio127", "gpio128", "gpio129", "gpio130",
+				/* EBI2_DATA_15 downto EBI2_DATA_0 data bus */
+				"gpio135", "gpio136", "gpio137", "gpio138",
+				"gpio139", "gpio140", "gpio141", "gpio142",
+				"gpio143", "gpio144", "gpio145", "gpio146",
+				"gpio147", "gpio148", "gpio149", "gpio150",
+				"gpio151", /* EBI2_OE_N */
+				"gpio153", /* EBI2_ADV */
+				"gpio157"; /* EBI2_WE_N */
 			function = "ebi2";
 		};
 	};
-- 
2.43.0

