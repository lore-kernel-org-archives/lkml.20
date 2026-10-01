Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF0C4DEC2B;
	Thu,  1 Oct 2026 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894275; cv=fail; b=asXCRWBTyhoa3ZxakH6f7BQf9ymG/blJEsyIpkfKnAKKkYI0UFHwgoVNsQv92ouzyx9EYBPj3IoIqUTm492lM2eQ0uks/7Gqqgoh004aPVdPBTo0St1IShQcy8cae+NatjVzM1AysCdK0jCnoBYtSf6NUhmWTEnaah9yNj3CKSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894275; c=relaxed/simple;
	bh=hbgfDRWyhW0+sjqNWVTWpbihZpLWQ9iThCByI2PGzSs=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=YT9NE16mC9IdPThrWiiaN+xowbPYpt4RiJ2LnhYqIJuEUk0ZGUI01dHGKL9AoiGe8JcA6YaVEBi7N1zbH6RuKejcciLzHizshAEWMdPst7Fj2261OqT1CvaNPRy/8Arq/FTJUEbePePPRoNJ/qyXwLDHWle1DBQpEf/hDj9JKXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=F1LBK29N; arc=fail smtp.client-ip=52.101.65.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="F1LBK29N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6n7jR5Xj1VNwBKoMTpVz7F2CaXiboQ0NGxYz3OCayz5nuhqDrFCUBE20GJaWbyTl73B/rbq6wC22Ns6VbUEQPUqsQLXbDQUZ80AGhvKhPkrPPR/CcMCabw12ye0JP53HFixRGD803BuImw9rqeblFmk2raYKyvgw+sI4KTTmv/pZEamGfQCHcq7zRnq+p8zEQ0RsbG9D1vIBFvHtdQzUzu9M5Ml1aWA0P+3R0OWdPldEUrkFxm/1/cRHDKDcrR7XNWLwvrrgwY9IYcmIJbs5OIcwnsdSI0wvI6wMvN1Z2zp1NVX8irDiuNsEa+D6k8mQlwyzfVrFOMm5kgemTN+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyQCCDx6+mn+JFTzlkDlWXSehLSy6kUVrF+i347J434=;
 b=qT5nQkLfjNb3AVO10Yf9IVGfqO8h8+brZxw2tg0t+0RbrdENR3LYctuS51xTKkUwNans2VutPQhFBhcswn4+dilJXWZ5zzIJek0QnfOYdrj2LzXYNHdF3vjtV7YlxG8r0xWhgyeIbahJ7pQzCku2gPS84Udc7j/j7JFMrDE1OcEEAwuiLDYRpB9KwubqXT8/hOe3kaFZOIMXwuW0ZnojYwtRJ2XOvEu6vvcweu6QbkfS3NLnpI6Tqd6Brdm8CuTrtq+BXkbpNBFFshI8tNrevWoTfRAkhCgElPF2kD96OBAoF70pCNST0gRjWM+mnt+RRBZMcOo9erQ2QX9eJQhJNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyQCCDx6+mn+JFTzlkDlWXSehLSy6kUVrF+i347J434=;
 b=F1LBK29Nlu3eudsjlsym6jak4dVTp133hNdx+UNkRsh5d1qx8GNajRQFOaqOGK3R5na3JUPKDKZrtgBxt+dGV09Dg/E0yoQTzxaevcnDIf5MX1tcX6ziijKvH/n7dKyPbkfCYcCV3ZhXIv1ovV5qA+N3FdyGCFbyyHwPdhdtuPY=
Received: from DUZPR01CA0315.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::6) by PR3PR02MB6025.eurprd02.prod.outlook.com
 (2603:10a6:102:67::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:37:47 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::13) by DUZPR01CA0315.outlook.office365.com
 (2603:10a6:10:4ba::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:37:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:37:47 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:52 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 37/38] arm: dts: qcom: sdx65: Remove empty line at end of node
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <fde68bee2c3f884d149682161173287ff4cd7d8d.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:51 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|PR3PR02MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c30f0c-9a15-4e78-0010-08df200c9e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	bKvIts8eLTg0jdCnbePpxcrqr2cmGGPSCiRAPYDrJJeBM7bDJ/8uvyH74EHGFGfEoQUGs4kjsp0eu+864oS4eRxNdIH9vb1S695DKFYCJNrA2dEgM6umn9JF2LdjIRTUHgytXyx8mwra5Qvue4hMxjSd1ncQHK4hTJ0dxESwrl6KN4S8DZGIF/krfsRb9H4ej9NZi5hQ4R/XTvCtZk8ITr7FdKgzFilTSE7FM59p1uRWI+P2FtJExBvtJ3QBw3GoyU82VOB+w3DXnwIg+Bt2toHUsjoqwc7qCtzbA0HIRskgLNqyUUKVRQahLhoXTKwZMO+nIQ9czj/kFKH392rZN8byIc3ekhy5AI4lOmhl0BqXp0YdiOxXfPNuo5qYqyZuq9ze9kN8sB7NXfY2zf0+sGA2/bndf0MF517SVme8bOfI0i93U6EJmJ/qGzebr1Y3A3g6V8OS7IjebGbI/z3sTptKR62gyDJXTr829XoMcywwxYc5x8X3vBV7DH8uaRaTdqIJXI/FJIL5X/WATbYRasAKY75gBinpxhxaWaQ69x6hgTCLa42FYtQuw42FNgrCbKEh56hZO/humN6rahMEqT6B50YuwLpqyyKTuDqY5FddVnJoEhm0CuANN1+2ERWebAMUmPdJr5ohW7PWzzw21h/lNrF/xo+qr+vIG0+CnN/ncgf+lN9DJEpJaEj0N3I8Q/MtRrKGfKesZSaNqXi4UQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3XCf+OkFwwX4I1OXLQfRSPE5peLR8L78QZWi0ofMB5wy4usULiKz0JzS1/vJW1Xi2CKjUibI/LoGkLUhV+1JK4zbTQ3ChWqzwKpQLXOnI4Xm2HCaMYAy6n2xi9XZiAai+zhxsdKGHkcAhqO3tbIA2K1SbkzO5epW33jRzYWxNc1E9XIsHEBK+4zBEQql2+vXAdUTRk2XDAGvttJ4iH2Ja9FBPJwCangto98HO/1TZgGdORy/26GcJUdVB9wtTuLgDz7tDo3ydykAqQlrfMDbXLghQKe5Gbx2Sd3djY335G1U9PI9PXcSAUZmeN/6yBiTVXBha1CqcH85VHE9xsnORM0+OkW1iHVhM6LOGPJnzcZm3Ctoo/xRp63VoVrcNmtktAsa3DAT1sYf8d8he6Ee+yWDSkn6rLldxNgjXX9z8uubNmzSrHXKIvozpvTcP5lu
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:37:47.6424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c30f0c-9a15-4e78-0010-08df200c9e45
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6025

There shouldn't be an empty line at end of node definition. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index c8e312dcd26b0..c1c5b574424dd 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -261,7 +261,6 @@ usb_qmpphy: phy@ff6000 {
 				      "phy_phy";
 
 			status = "disabled";
-
 		};
 
 		system_noc: interconnect@1620000 {
@@ -807,7 +806,6 @@ rpmhpd_opp_turbo_l1: opp10 {
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
 			};
-
 		};
 	};
 
-- 
2.43.0

