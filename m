Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594AD4DDB3B;
	Thu,  1 Oct 2026 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894222; cv=fail; b=gZqxd3B+GxdW437VvFah53ibXxccYkqChQsW4/gpbaB+5yUvKQQVxsXCHKT8xmDF2kbDYaSbWzvGFCNaZecDw7+jwFNquhediNfpl4ajCvlG9/mJAE1+eWXGVlpQcpPB53gR5RLeCGOky4aRET8lLlIExDIiHY7VYDbCVX6uNxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894222; c=relaxed/simple;
	bh=qBjfdI7UGyjZzmyWEV22Z9qJ1dmK2v9+Jc7otiOxP+M=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=AdSha6cCJh1xJpov44qOGCcVOvXsnzLBtCaY2ZhLQAY7cTdNvPvLLdmMFiQlHDzN+rY9bgiI1A5SDIUSbnXxYVghrsD70tbbqKteyNDSLEmWU1z0Uj0WPOmqw5w8lHDtCN7tx3yVMiA/BXwT0Ll6KxZMWbOxqY5AIyCpfcnVMJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=U7XJi+t/; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="U7XJi+t/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qs2kXtqK19oTjXP1u4886FQHRjax2K4CZWr11rxpO/oaW7KRlCd4m/HaE0YVr6RhPE1R1bLdrsRsWQP86bife4bEJqctoM3Ykvo/KHEi6/RoI5H4TpdhF+NC+jBPXuuQStBTsyLdhYkFZ3tEABEkUT9QU7ldyxknsCCp+qrFvZbHS9XG2dWMimEvHl3IsFggpldDhVLXoRQMr/IxSpR5WSdQBDnpD4B2Qe7aZTKUxM3YLeEFsxewAB/2Bnsu0MD0e2XDBpILCSYZpTNRNDgjvHDVADhaxuoCl8UCAqY4BthNPurgJvd3NBqGl0mqFypgWotKPeSF/RvbKUb1SQ8/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoIS3oYJEqQ2xg6MCN50xBB0bT1zjUnXuYLo4QSESwc=;
 b=It4KR+rU1JflkeTQrzPPEK41zHgO2od/H1dszPqwIU+tSgZ5FslN1xqNRa+KvTlVchnfzaGs4rSphIsvu1BkmWXGzUqMhreLo1mCXvDYapYJJ+ksBOZ7hlzYtEHDBPNXHlnl3M1AgPj1QxyOum/ffThiPWyz8gJyoxLKrSkuw2736ft/AMPwt8/3IM34K788Y//TyMScpWa0Fe0liC3ipv7g9fDPAM47HY7/XnCvBEqc8cbPAyY+jnoTrprxfOoinQ3tWgdcPmRulKk4Gc9OrBN3SLyP1PNlObG66N1OZqOrvVrJ2JlpJR34oAEsaGSIm2sdoyxvivkMjT1WmwBuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoIS3oYJEqQ2xg6MCN50xBB0bT1zjUnXuYLo4QSESwc=;
 b=U7XJi+t/MTdlF7QzD2kdxiKZnjQzI/4UeZX0UGUKsoTJ3OOM4sXKQG32KoQUXxBV/lPt6YWz8859dzBOm0f/pwaYorLfLPRDhI/RslLmvspQuiZT3yctLkQ1lduburYIV301d9c8xGOJNKa7b7FsP8hm1tn757VYqj5uaZj/HjY=
Received: from DU2PR04CA0041.eurprd04.prod.outlook.com (2603:10a6:10:234::16)
 by AS2PR02MB10037.eurprd02.prod.outlook.com (2603:10a6:20b:597::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:54 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::3a) by DU2PR04CA0041.outlook.office365.com
 (2603:10a6:10:234::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 22:36:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:54 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:44 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 24/38] arm: dts: qcom: msm8226: Add newline between subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <6ebfdff7e773e8084f156dcb34d4d5007cca72a5.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:44 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|AS2PR02MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: 8274f359-15a0-4a9f-8e00-08df200c7e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gYSfiK4xFtpguXyiPgmd9I9SmFHJcn2x8AXNFZFMoHDLzybJfimKoXa0dUW69FHDadPXtTaeE0wUHal7ZQSIAhaOYkxnRghAmW4KH/vLo6Uf5s1zSGbVZBbbl+z+MgzWK9u496abFS8Pya5nfFGIxEPXBaoG+EkuJi08PfZsAMQb47vOqRHUWb6YSNAh8NtnZnwiyls9XMwUEUhGGiBhy2JhYcP/gClZf1Z/pd2dV8ljotPvh9WtA2AlH5iyMlLoDXUpjfY4zrgpVjBMvXSm3FkbkW1HAg9XV3LI0pkoqmS4/DpXjHnNT/+pceIy5YPDGKCJ+VsdmICiB9AplTwLck4Ckl+erX7D5B8jKkFIjNxSMXc9Q1Tw/KsTAqzop7hRW1gFdAp/Dil6pTODzMfbgxJZ4lwtw/P+gXbEN7C07tbx4PqhqOVTZd94BdpxBVQo2eIIuB20W9iC+TMpFjtGrUkL7546h4SvffouKZDd02HR+0HkPVJEmzYv9Xnepv2GdPGdG+9UuVvh7L6vcG66IQPXHr1yLpViEeF9F0vtLEs+pX4aF+kOIYuVuYq5d/L7B8YcO0xUK0oW8+YtVRM47BiN/mRCvqwLLbBM2yKaEGEdERTJDMSV1oMuNLT3AgES+W0ldH1tTDorSuh8U4HBD4OK5H3YTpAouW4nEbDWHtwabZ0feoYnKC1CAjPjNaFx9lsr61VD2m5Y7b+T52c6zw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	guNEvCTNtUqaEkzz/iaBav2gnssbhWr1XQ+Nv6leFJUuNVqTL1hkTUC/1lutch1oUwU26i8fXdNQMS+RrycMgrfD8+6y3yIGbwjYamPNE1JEqAiAL+AmC0SQB5I8huTD/APcVzqHQUN2Zkumnv0xSjJ3b9n++L1Mh6ha1wV6a0jpALecP9dsKASbDEZqIlXByGjppMwcggRGbu1hpRi9vERUQkqA7tlzU6tBlRZ7QzPCK6B9ic2cuvRwV2r7fwTjpuz3cc08u03XLIa0fJ7CMTCmEdGgNOmCmiiRwosUhnhm6FBfW832bPnjSB92j01JaPJwWCAiWnHrqwVCJnqDYnWi/eYrU2ZqqZYKQY/aqZRWC5qHrDO8/P15OW5ev/wokAu5depwnJFZVaJCg4Hhw82nCRBC+7bKIHoKtCl60rgEssAfF7OWoMyEn3MfTNIe
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:54.2012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8274f359-15a0-4a9f-8e00-08df200c7e6a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10037

There should be a newline between subnodes. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index bcf14a3b13a1b..14605d7666e68 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -183,18 +183,23 @@ rpmpd_opp_table: opp-table {
 						rpmpd_opp_ret: opp1 {
 							opp-level = <1>;
 						};
+
 						rpmpd_opp_svs_krait: opp2 {
 							opp-level = <2>;
 						};
+
 						rpmpd_opp_svs_soc: opp3 {
 							opp-level = <3>;
 						};
+
 						rpmpd_opp_nom: opp4 {
 							opp-level = <4>;
 						};
+
 						rpmpd_opp_turbo: opp5 {
 							opp-level = <5>;
 						};
+
 						rpmpd_opp_super_turbo: opp6 {
 							opp-level = <6>;
 						};
-- 
2.43.0

