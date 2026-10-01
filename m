Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371863C9898;
	Thu,  1 Oct 2026 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894217; cv=fail; b=on5RaGOhGtqy+CzEVluQk4+3a6m2/43aNyh4jE819hmm7BeAb9saRBjfFToe7sRH2s/WeLBLZzYwzTNR0HdlyLzep0iuJuHll8QypAc+g7ntMsR8jwj+0LciWaX/ls+tI30nHlSaSgRq5RduI7k4kezhRNFxNtyTCCvh0yOVtZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894217; c=relaxed/simple;
	bh=YmMZaCckLXtqwJjePpPhkICtgP3OpxsoJ2u+uNDD8JA=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=C6ezT3C9CkSHzLyOGIBScbDyI9UMAAb3pdtXJqyezItHkr4yqQtE+bMBU3wBzG1K0YSNeZWcgz8TbR4WJU1ClXPawR/IQcP1n9lWql0E7OdlpAnZtoNjrf0lz+q25nX6mkc2ZHuubF0zmeFarwl4oNfjiQ7a8jlb0ymFEhHxWbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=PHErDVWB; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="PHErDVWB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhV+AN616+P/JoNR39FWNmwwDFs1iBEYJ9sdtJtJUPGZWN2Ur1Zy9q9tEFx4FwmeX8WEbInkenITBzrV5zzqcaTR8YAr8KsfCij+Z41HgZzW1lc9yeU6HOTa/ij7XsbJESvC2AAZMLAropyABkvvzjqAPbxAwcVYr2TXKGDQ/RX9VkdDWnA5cz5G+pwPHoQ0W72cla85MDBdx97Nny5RPPffhAPXxRFrGk0PK0aIEfIeA5t9lO5b8Ae9OksWNldtiipdnO+pYAsVaF4srTjQdf3hILrQmDpTJiYwk1rEm5N3m2DFxfeSCNEf1L94UQKQa+lWqN9leHujyrUEE+St0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1UJziy5XbgavqH4WYw83jedAMtmClem5ePzZ2VnqOs=;
 b=o2znqbXg/mqjYm+a2SdVnVmh5gqe/II+yhNDxjkTA9Ex2g2WWTHRhFLhbdQwjFloCSDmgZFZNmRpxRRRZP74sZtTLROVyhrw0IJbfG15VDbXgge+vThq5+qhXxoedYcnynSx0phWf1FoBoqKfXIaO/FRtD5hkXJPXpnVRaRdbFlEbWR4Vuzrg7xScnuLxBo6APQc1pLDgm0uJne+HXc0wavvt0+2PoBw/SC7HQ2qHTch/e3+aqmYEWeSO8UxS3XwRKnQ+VZQIcC5wU6nw/cwyPaDNs69cLWVsaAJCZpNjpGV7eiNLGg6cl3z1ajuTaWuhpqP+Y9Y6L7c5QIeZshong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1UJziy5XbgavqH4WYw83jedAMtmClem5ePzZ2VnqOs=;
 b=PHErDVWBNDvi2Rbxhp7zeXWS8GAp8gyXaZrbcnhMMWmV602nRFYSkaPREjvTvPwwH69Ajd0RpqmVGxXs0KjpAl7RGrhA3ynahIlHMSE7/1Rc6D/JMT/LcL7SDOfekrh4+s4Ou54qYcABEjyOkXo7mk4eUXLw/0eAmsrQ1YLVkhc=
Received: from DU2PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:10:234::6)
 by DU4PR02MB11309.eurprd02.prod.outlook.com (2603:10a6:10:5d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:48 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::30) by DU2PR04CA0031.outlook.office365.com
 (2603:10a6:10:234::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 22:36:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:48 +0000
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
Subject: [PATCH 16/38] arm: dts: qcom: ipq4018: Indent closing brace properly
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <0436be338751fbbf30d8d6baee9b0eb8ad8d9938.1790892852.git.waqar.hameed@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|DU4PR02MB11309:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a12e981-9701-45ec-57f7-08df200c7b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	EYW7l6q/9EvLrJjnz0N1Mc0MWLOoZ1ISiRaqhG101zpu7rldsxtu8I6NAPgpyXxVcO26wNnjlinnY/rpQ7C2noGE1fcSL0uHwRibqYkdvbUpLlWl2v7SlTrTQ7Yuflq5EqStcCxljSsHeD0xZN47jYWDWurx7pvKsxksr+qnBdLGgNkOQrsA7cYeG7a7GYwmndnuUJvt7DdhXtldNAG06UT20q3sDTMosZONGsLCYgN5yb8z2lWDX8c85FwM4ZsaMC7y+QVpdlDyZtqmWylZeqtfQgxH5+6HAQ4pOwDrVWpCEerGolx0JJn58jupe06mRqEFWzBXj3eqZp5C7YgxS+fnbOqarkYvAjF3uzIAwbOOgW/LsInypZncV81szQw6qU4C5Ryi+0ALIPlQ3dEH9y7OSS8cQxu/13rNnCNG8QkGLzpKR03vR0XgPSxKWYvTFEe5WTXWCo83sA/qVUtA+kFWyFMaVajNH3H3mOJhnoCDKwcsuRIKGfk4CScy6/FIAdtwh1RRCXImKaonM/Q7LATCQRH2RNjbKbuyL60p0nijUOiZWT3e18HLdZeyeNOAGgBOTKnnqHXtDXRB2BmlSVCAqmw0Bk76kaJqCmENpH5OTawcOKz0sU8aE2YhMIvEJL6jizR2DOeBax6CximsEMzRaFZnjJ54LCQXow5LUY3jAWwCrJOG6V0Zx44I8NDYHonhXGZxF7Nw6GRFZqjE+Q==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sAYFVnLf7sXuGMrGHqWGrh0f5gjMvUgQq8APEPQkVrpn7pshjRNFUCg9aXghXSiQjAuDha8LNOdUsNvXTfFQpxSMo/14UKX6Z9Kyc0CY3uj+qU+YWwnshKjuqVIXK5wW+osuXmLBOpkzfLtWvJ2XHtjpz3q5bFd1Wu8ZRvvteih+a8slo4ukCaRStsCuKjC2rm5Z/4mIxxSvSjvesllyJ4RyBXcMhg/6lL/HqOejnkW1dtA/hVdj00/LEDYedXRz791LhO1XQIMWtKmVebualImZsQFqasQutF4UXN6VTUrRTFWAbxpTLmSB/LcVUYspkG2DwI85ussqgn/y1/YBeQceSTycgXtQnP0CpZuXHE1tM8/A8qwnpCvsW7bzXeA9GrN6fIB0KmxDuD5mRycWC8mzw4dBP9rSVmjUT2wvSAK9gbSAjQwW7DeZeP8KS1gB
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:48.6153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a12e981-9701-45ec-57f7-08df200c7b16
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11309

Closing brace of a node definition should be indented like subnode
name/reference. Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
index be76bc39ac277..d78623fd6acf3 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
@@ -260,8 +260,7 @@ &usb3_hs_phy {
 
 &usb3 {
 	status = "okay";
-
-	};
+};
 
 &usb3_dwc {
 	phys = <&usb3_hs_phy>;
-- 
2.43.0

