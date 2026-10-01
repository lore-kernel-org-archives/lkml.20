Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010018.outbound.protection.outlook.com [52.101.84.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0574490C12;
	Thu,  1 Oct 2026 22:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894201; cv=fail; b=l9QT6W1Q/GrC1KTW+MJaRwT9gAxb4+bEjzPET2U1KZT4ly2GbKD4qKhm/tMZ76b96M8syImJSKkUjnVUtaPW9OKDG3fqE47AWiCzY+1sO1qawFCe+D6GtJM8U0Fd+jUnJGZaPrcqGlqw1WOYOsX2410C2HGErPKtfSgBP8EOYa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894201; c=relaxed/simple;
	bh=qXFsnW85KDyTT253eSlyIAniiXymtDb9LnmxtIrao90=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=MTjvc+DAJIZDD6VqrB7fHn4fFs1YhKe5SLGfigZJmR8yF7xpMETfVrxM3gAHYtcfmfeniqJkmpM+tcHxUkG4FKB6Ui0e11MV9cOjU86/gCKS8ETlm1I6NIfU/JFuM9WmIv4CyGgEzj2R1+MR2k7+kRteqsRy2MHLFSAoKOBkw2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=fXXygwit; arc=fail smtp.client-ip=52.101.84.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="fXXygwit"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9Smn6VKS3dW3jDkMqZ2ZwTJgFxbDPKmAqnX2WyuO9Gm86TE9wgKifBw2cScALjwCF3u9idKBErvnG/F9Z0qm7k4LnwXMYXW0nc9m5yV7uegkVIQS2iiqpSmDdXouXCG8cIOZDRneKkRR3SWtDcjMESUkus5avFuD9/nexstfK42FkSTFYeexcfVJbFbaKZQRHRSR+/AQ2ZXLPWD48kT4RDAZWdmeR/hPs+3QLGAUoTKS9Euh1lb4+VmmgdCgEruKhuD/AaWy6Oy0dIwmkQeRhPe0YHXW6JIw0AoaPZtsOqdm/hnpQUJJ8igp/BGS6383QbTcsF3S2O1SWX2ryvfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFwWPk/GcJ0wvDB7L9Lqnyzu8Zr4E3+mk/0CdTNjBJs=;
 b=xKJeJqiY4FBZwNdPkGxyBRoq8IBVxWpbj2o7tXRz7N2KU3RHOPiWAB+0SSZnIieO56qkFnr2n/9Ul3aNtVfTWXIi8qmuiVi91zA3PMSnGKDoiVptLFuQstDfejXWlWbytUHhhERwQHbWw9WwL61eaO9xlngBJuB2YakbBSTL09fODc5xD1p1Mshg5GcXKughHD1KPXbXXOd+Lb6Vpi7GPxVm2rEwRkd4kpyoAr8P9vg68vteUvfwXggfdUUSB67cy0uCOunZLpMKs8/uEORS+9cppKeP396VcLVY0U8bixJz23KUimtj7KxOMX+Q8HsD/gGSDrosvbmv8SrK0ozO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFwWPk/GcJ0wvDB7L9Lqnyzu8Zr4E3+mk/0CdTNjBJs=;
 b=fXXygwitFIX6Q4qjt6w2yXlMTz8br+4HR4wKDAPLTyDMMWOlBLd4BxN4oUiq7pzToSfERH/xc8kKCACZ4Ve91gx0GiNweL9hMOrK2nZniHS0G0SDvmMPVyG+LXXq5hgSlQC3WbSkJ8ND2tSr9C7fjfeE6G/D4AeTVFPkuG107KE=
Received: from DUZPR01CA0309.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::9) by DU4PR02MB11051.eurprd02.prod.outlook.com
 (2603:10a6:10:589::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:36 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::89) by DUZPR01CA0309.outlook.office365.com
 (2603:10a6:10:4ba::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:36 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:33 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/38] arm: dts: qcom: pm8084: Remove superfluous empty line
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <5b04cfc8ded6fb16cf87ef9e339274763b0c8fe8.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:33 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DU4PR02MB11051:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d188984-f851-4329-3d57-08df200c73ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Mjq9gH44Zkm0qZkvAShL9MedjhXkvjfIOxrlcH7Ea9R9lz+BGKPXtVAnXVrulmD6dDXAhdsuL5G1M/xKmGd06kqdV42nRCSsfZEEZHNGsSDmo3P6r1nSeMMCgSUqIUZBay+8VjEpxlk5ZEVHvAYpaQxuUw72G9GIql8Oyrqr+gdCDbs0azpIjdsVo4E+Nl4v4jFMoqgoIfAzOEVlphLQ3SuBwt5goRYbCMpEaqCwGOw/fPVJt+pfgUbcPfYoitHHfzStoHjO0bQsrtJuiRRn3FxAHwTAgevnK5p4hLIpZn+UKW9S/KQil6BpsgBbANyxFQY0OYLQdmyAICZ8SlJf483/wvt2RoPYAA/5uohaMC5W7xZ74AZXkUR9e+j6g5M9GIjVSXzGHiCXcxMYJTpggpsielTUdhU1fCAtaWqxXdeyjYfU+wteC7n2MY/cfacJWAq/X57UbWs5xrtg5iqUkK3HU54fYkdBV2AsvhBd1M5875cf9+Ytdl1Y8p6mEjRl45+BTROJskpKND+IskoAflAQDriP1xPRDrYmdp+kyv41yXzzweLl8R9BOCFwtg5STXFM0bwYVMTcc/3gOU+IbnHcHNXBLuim6Jm3wGPvgIUlnSQtrShglSCdLnwVh12ZnppEtsqhBFPGbd/QyANoPTz2iLk0IenI+vQGRIFxyf6Mb8xcqPYmk6l09LjBpuepdpwiiNc7jBxevfyQwYnfiA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qXpcgkfLD6WCnpfqGLwIN4/9/dk2V31p0fZ7nY+mGgR2gmAS/sBLUIo4+UOfgrC4hTnViJh4b8I3qagRf0QObyGigwwP1KCwGIMvzRHoOCG0FoJeOeaSfVkR3AS2JWYqDWmDqmcpFdfbjvzRJQsm0u4WLePdmSiCoXxgj85o2j36KlUUZI9zH8/itS2UsiB8VzzFGBgypkf43xTXjrmBNF1qCV16S4sEebDWR+KjCMPwZeWxEZpPW4elMOzkfOkiWRQRjVGAd8CwgLXHKWNkbof4jLueTM69Oa/0PGhUVHw4EC4GCOi3aMHjkU6ICMYzCbFE77xMDZJa3Kj5Hlz0XK3XC6cPPSBJNxh3JlHDFWkIOq7eV8oyzdQv2d1VLYndynMCO7UuTrO9xubMRpVFqQCI9UVviHC2n1k2Ef/2w/JMtMEHtE2uNMW2wj0IPpOT
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:36.6173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d188984-f851-4329-3d57-08df200c73ef
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11051

There shouldn't be a newline at the start of node definition.
Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/pma8084.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/pma8084.dtsi b/arch/arm/boot/dts/qcom/pma8084.dtsi
index 309f5256754bb..f0a0bc65653fe 100644
--- a/arch/arm/boot/dts/qcom/pma8084.dtsi
+++ b/arch/arm/boot/dts/qcom/pma8084.dtsi
@@ -5,7 +5,6 @@
 #include <dt-bindings/spmi/spmi.h>
 
 &spmi_bus {
-
 	pma8084_0: pma8084@0 {
 		compatible = "qcom,pma8084", "qcom,spmi-pmic";
 		reg = <0x0 SPMI_USID>;
-- 
2.43.0

