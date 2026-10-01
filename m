Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D884FC8E0;
	Thu,  1 Oct 2026 22:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894224; cv=fail; b=eLqzjvZJRifJ4Oqzqy7KCCClvYxbVUf6RmURtJBJH6psLQ65OdHvYE8oCc1Y0VQv/JvZAyhfAhT2FJW/0yFTXDipTVajbTkElKs6aJvhzsSDuI6WAH4cMrlI5yGYuecK5nbfoeTLPM4kTEmXCIjpIJLACnBY5RyRySmCTgJCo2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894224; c=relaxed/simple;
	bh=y9MU1crBToWTfbF0Uu6L0kt66ILT/hgOX+TZjxViXGg=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=QpK/pWolBUa3jBCAGEptSXpx8cplxGB5ZxQ5nIozRkS4g0wC+te4oMIrEQzWdQUlDTqVmStVohhpcI2NyZ4FX2HA294/lrh/gkVRlyEjQNWwbu1q846hJGxrFxD4Wx8AWlTOFEZHnrmkRe2bVkngqa1uVu0v5g2Eh3BDrfyBaAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=F0jqloLK; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="F0jqloLK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDIIsOzgHUfxwVzw8h9XSHuSVLci83Wvdu0vvvhHxJstCRkXAMTVcgypPlLopJeoaP7H4RoLJ40vu6saGrc8ztmiLY8bJF1hk0YTJm6ZULfHZP5AVIS3FzTRNxLVeaFxHIZjDZjFpIoVFizOtyAT8XDe7m52HmmawFsJyhEkFgRFfIITP2hQ4162UzvFvBpYB9wPqIrbs4oU8XsW70P3sku7/Zo30YU6wpErLby3zb0kyKpr3Cghnj3OKI88wpm/tmSnAW7MGEVfn5GobAUcSXlaiH0PKw90RKByCNHeURe+hiQMFVCe8/40sGmGIXEwKMGI6bZRjwDSX3Y5vumu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v76qVzs44vOX3EscwtcnsC2mVv62zZQztvriSNKp7x8=;
 b=iLNadJWa3iHf9nAhhIn6eqX4Okx4ku2NLPdAgZoJt+81kf4mP44Xymh6ut1rdMIkGdL8CynOALOOkQx3KxvUM2ZOKTGnBqJj73W3YiTTjyU8MpdGKcw6AQtpV21gIZBz84lAOx9kDeIDtn+LR7TdXKpj4oIwLuSNFXyuMERAfP1ezJ5rT0g7fup/XAVLjhS2rT36EX/dvM1wC+0WPJFoKmTqwif2oFwaqW+45AYqoioYylVTuN0TlNTQttFU43XWEn5x7krcSDv5NzWfM2BDMO8dTaoFk+E+XscUg5RuvW4wG3K0Q+UACWAKLttzt6Le4bgVpHIFWBKrqq/jCKCQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v76qVzs44vOX3EscwtcnsC2mVv62zZQztvriSNKp7x8=;
 b=F0jqloLKw5GkvT9OAM0R/QtyAmz0e0fea4u7bXd9l62ie3G5XA1flx7h0B0Y6PqLMZUnFAT7s9JIgWTK7CF9vq8oP/rd6xC6U4Zs6TEQjzMcXSQ8CkhaG/WTmq+pkVHen0k68kGl/2jChQTa9lT+aIkIeCYlSgra/AZm9G0BakI=
Received: from DU2PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:10:234::11)
 by PR3PR02MB6203.eurprd02.prod.outlook.com (2603:10a6:102:60::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:54 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::88) by DU2PR04CA0036.outlook.office365.com
 (2603:10a6:10:234::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:53 +0000
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
Subject: [PATCH 23/38] arm: dts: qcom: msm8226: Add space between OR-operator
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <9be1ad0392168b91389ce8d6a896d8be6173aea0.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:43 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|PR3PR02MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e60aec1-e338-4429-ba82-08df200c7e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|30052699003|376014|1800799024|11063799006|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZEqyqPhvknhuDI8oZnTG4Zow5SemwQrwgoc8dkfJB12l3pZtXQn37exx7Q1CYYoRuHO2lXwvVWt/K1qdB94yfdDTJ+h0JnPVfgvNDBK9jIjlchacrs5Hj0e0phLsIf+tCIKvsz75QbCfUvhlkp5Gtcjz34ugeA+myN+sSJIpY20S/maW4VUSdL3+x4pZGTTZV+jOPN3ejhGUv3PBrnMzB2QaKi1wI21F31w/tZyDyi8PWy5ayT9M67Q+VttJvmZfkxizxquUAW9B/eGorOBSnKKIQ7GFyD+6QDiqfy7uVuaRgnLsX+/U9FoRqXbsWzvqrKYDWAzJ+JhcqB4J7dfzypYXBbzGVfH7D/EqpcRHABaRuPe1ehK8SxVn66piMKj09ocq8916YrUxdO0eZ9jpoXT+rcHVHCM7/zYJZildsg0+vvrprloaewEDxzb/E5genWoweCq4Ie+tDjPANKZVNpwdJ9alvKI7CP/W/IAH0WChIeY3rk7Pp2n5+PiBktQI+hINM3dbbxloToun5z0HLxYkBBnqOX3sh1zd1IdZ2hUwNHaacz2EumgFaIWtrtNHJBYTltAR6Alhe9dIRwiPgMi825OJK49FIxt4rn1i1bQnfJiZ7xLASMR7QcBGexRMQKhLu+UvMJrfGhDVEgrvcUDVhRKNq/WUKb0EFxe6I818pYJfASpJ6V+6ASUyT93JzSoyrxbXEzMje+gd3vNoSw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(30052699003)(376014)(1800799024)(11063799006)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y/i39ECJxE6x3gmlHxmBXX7BaeBQwfoR2MtB+w5dm9+O8C/4Opwmi+2C0I3ISwbheaVWb/V6U0AuDu3N2u5eTuBdF+519zgJ9wZhr5x3ebauKyfF5em1/0o34uv0DyP0RnL1/Mxm82vacpjGJ084AyEy07n1o4Dr82armvT0X1a9afXbKsS98ZQ8mW4CPHqFz5ACIlFtuHqK436rqOFZlPLzhl2Whi7pw1WenP5mQqeq6C1ZlcbJKsgntJB3BdzVOm8KtAQqanToRTmDuo1MmBuQFE8HnHiqef04TjtK/jstpFNtDA3OfBen2VXqNxemXqmqB/ewiRxhucPbxpthbuz2zQs6IVfn3jloufIRcEbAP0xd0CYs5U0wJzTHkAh/pZp5+QhLlyqYZW7VhmXrWuLCLVPtNB7EUfDoFPRFhkr5DpO9nrL82l7Zoo8ThUDY
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:53.8031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e60aec1-e338-4429-ba82-08df200c7e2d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6203

There should be a space between binary operators. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 .../boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
index f1544a7e8369c..fc4d7ad8d2ab5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
@@ -82,8 +82,8 @@ key-volume-up {
 
 	i2c-backlight {
 		compatible = "i2c-gpio";
-		sda-gpios = <&tlmm 20 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-		scl-gpios = <&tlmm 21 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 
 		pinctrl-0 = <&backlight_i2c_default_state>;
 		pinctrl-names = "default";
-- 
2.43.0

