Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B04F3ED7;
	Thu,  1 Oct 2026 22:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894221; cv=fail; b=BkeHo3cOfzp67zKcO7JR3/mQY7MVDA8BH/iWdDWPGYCWpAfQeQkUeJgemCVabMG+KU6klkRfC1OmoRW0mmUKtcyqbjpAROgc4tLRU6M1FMuW+vGucmyTUicDN93pI/G+39X90P+GLkKCDgJayO3Mntqe/3sV6sBPDBZnqFj2NJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894221; c=relaxed/simple;
	bh=FESv4t0Dgb03QXYy+KMXmmWzwqodM7+s6YrK+Ohagto=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=BzWmq0qmP2kcPqmKkTdNuAKk1cJsydgVLbGz6p4JxjDwRQwxH42kECVAw94n18aBv3vzkh3JtqzDOrgcjG9mvfT7Ixp70QM/L3Q9ezHZceIx31wdzLmJ4ePqw3c37nV29yrN3qDOq5DGRsnhdJDFsKpA/AWaVY5sXM1NRIABtC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=koidrarI; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="koidrarI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJ2ClLKaZSAEZxXBwVE74myu2lN4vFRcEBtir/nqu32h0MkaMGDfHvI1Ap0HS2G+2NvfX7flRqP4Z12fQIsxmh9fTZ8GHlQ4g0zN+etf5wvfVXIwPk4GrfvbCvH2Ai/0oUj4lvklkeaLRT9rsAdVLI6F/91Woy38fiI3KUO8ifyjPYxHVN58ksSDZRQoxssbmlWplmxrerz+uRhXyIcBxCZbtTXtQO4qd285yvsVujJ+pgpL7dOCmFA1+9h+I4xetz5WkwZP4KFWKxxydGMlsXiOgLVTlGY3G2YTDAD7UUPire/ETf9HjylCyfrAOikz0l9c1OzlRpE0FyYIrOk5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7UBHOUDGv5W8bzzmetqeNdq8gqN+f+8BnhRjmFIvXo=;
 b=ooGLL1Ib+he/H7tTYlWOOEeu8XaVfjeB78dtHM2MUOcJGLWUqqm3jKSQkNdf4xio/xB3+6lIiudc1t3bwGtjyiQb3+0ta6Wxx/U+9kpwbLm29MH4upax28lwA4XQJMz7mHMZsVN/BtB7AInYDacSc9I0QgH+pHt6LIoFnAamJIoFG/qFPQuZp8BTmoiz/GIrBhXE1KEu+vuJicMwrKgnCbVnKywC3P9E9oTfSnEqUWx68dxWcf8iYubC/p94zGL188TucgKUNdPuUE5RhOddgM0Bne0hSgjRSh+8Mn2JBv5Shubf2g2k3jO00ELb+GPAVPe0X6Hihtv6oMTRMjuSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7UBHOUDGv5W8bzzmetqeNdq8gqN+f+8BnhRjmFIvXo=;
 b=koidrarIshQUvW7mwmNVGPwLO9C8sQ6U8yztTLjKpanXllKqm/x2c4Ax84njJ1bfp+R6e1eFji/EHvjGPulb5dDoAMgwKJ9PYNWf3bz7icbn8WlQ//8b/Uc+pLdC4+eP48X43sAOktI6/PGVY/dKJB0xO2WXdZb3nThGrxklamA=
Received: from DU2PR04CA0274.eurprd04.prod.outlook.com (2603:10a6:10:28c::9)
 by AS1PR02MB8161.eurprd02.prod.outlook.com (2603:10a6:20b:474::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 22:36:56 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::46) by DU2PR04CA0274.outlook.office365.com
 (2603:10a6:10:28c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 22:36:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:56 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:46 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 28/38] arm: dts: qcom: msm8660: Remove space inside array
 property
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <45014dc590b7a704673610a5059a0e6e572a27c8.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:46 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|AS1PR02MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6b0ee2-efa8-4d43-e785-08df200c7fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JkecY1H78OpawBaY+tjn7b20kQqdjqNjgWTz24UKvJp5oq0HYnmtzx4t99oXNApzEds5ykArUrvcBM0yXtbLAzrzf11CVFVZgwsuxB1bkofPacj70uoIDHaijUKSLH7AfHn2ozMh5WgKebB5zOhC2FMXshlgU4tDFVXdt1S/1Q9DMIeFQlIU2xK9zWPo1E52JY9480VTF8VprHx1glWCbSCY5imcRh9PwlQhoZzRLWJnyqoXFARzwoz1OkEOF80qnJevh1doYXTLvXEI2v0tFaojNmUvfDaEjzlXRQYkTIPkvnXWL+7Eh8FtXQ6lKnOiov67aVQOybH1EiaoRdOP/ETtFU7bZBw4q8rjZHpkBmDRv2lVlFlH+U84kJasa+2t2ggFquZ7iPKLu/5aSK/xfN1zoy1r37G0jc4agzVNluvmn0CJx+v/6qE/o/HFZlVtvQc4A7qyCtAuSxUXLQimxgjsW8CuWzV9pwjZCm4o9J9BEWU9FvS754Op6qD0WXwlF7Fc9V2wY7qxXIXphQNfz53LAGA+cs2YQ/Mu9woyYP8ow3KIyBABKju2b8SCAyWxM7k4g3PKtMmf8Lmm9qRxfA3lnwUDx2RLoS/r3spjBK/CwfdOhNf87uqKcOY5TqAAADxMJQwsjP1NPzYb04m+DAm8wWTmZ9C1lYH9xkWCKFf6MPmURS7o9rKvzYB9XOEMvabpqAxKaolKWptHLebMbw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wWsPPxaGqfx6QFAacPISdT6by/suFXAk6ZnAacemMLjfULqEdW3yXa50hMAQU3ZwDXB33FD8GoLWo7sZKG5AiuUfYhDSYGoVIDLp7zzkKL1Mb4cQ+FPEznz4bxqgjgZ4/EpPSa5GgAzKpSIYy+/jzfarOAMbrMs9qFJMSoa3nCqllCbtmcuBHOFUwSYlal/blnV7r4bemS1ll4PPxUaBydAeHtijaQWkkItJZFvTG4S3TlTx6lFeikfQfWxsGy+SThcAPRg6N7QRYjOxtv2rxi7G/p7GDudW6LS6RkS3nxmxaFdlzmsbanVLiKNKIDgxeREUMgvJfg0wQhWXw3P5AouwgwB1EJ52WRbQszxS2xqNgb3rMGTgGUxTmlUFI79iOIePH74SHwyhFw93Rthi+kGfaTR+8PyPM8uhz8rpvmN/eTepr5kFRIa3vBp+v3gF
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:56.2496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6b0ee2-efa8-4d43-e785-08df200c7fa2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB8161

There shouldn't be spaces at the beginning and end of an property array.
Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 7440ea621df59..5af3de24b21ef 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -83,8 +83,8 @@ intc: interrupt-controller@2080000 {
 			compatible = "qcom,msm-8660-qgic";
 			interrupt-controller;
 			#interrupt-cells = <3>;
-			reg = < 0x02080000 0x1000 >,
-			      < 0x02081000 0x1000 >;
+			reg = <0x02080000 0x1000>,
+			      <0x02081000 0x1000>;
 		};
 
 		timer@2000000 {
-- 
2.43.0

