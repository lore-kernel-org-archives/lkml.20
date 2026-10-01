Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A9E4D09FF;
	Thu,  1 Oct 2026 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894204; cv=fail; b=iaWKJYWMvKE9/6hyj0AVeVAMbnYtyaCSsg40ohGsDwX/jYhIDABDFKATsSNYV/HFE+odT8Fc4fOzumuvvx6hNlvA+UYgIXjW3tiai/lSBITiB7baF2+4mT3K51dmcPpfnJd7ehuYKQbgn99cON6+sGmpNRdvh1MzZsF0pxADSr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894204; c=relaxed/simple;
	bh=e6J4hw6nPDlVssp5ytcGqLi6coLFw4fx/0rsIm5ir7g=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=E2R4MdBzYEXpQQyIwxTbHXihflLjQs15Y4+xPaW2EucHl13AiUiuRlY+bGYU1lntt5B9f1e1s/59qtF7CNNpgVBSDYD4mmMvQblgKnPqx1n0couOzDojPJWbyADKhefGYknP5SmG9FsU1+rSs0O8UC4VOL4hWPVW9UTj+2tN7no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=g/LOmCt6; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="g/LOmCt6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHK9aeENr7E1D1TkvnW8TUlFAhs60pouXO9z6GAbFIbWdUdgTHPCxiAzsGve9iC77587JpUAJaD2aMDanc9Wm81sAczoz8w4xD6JzXl6v6HTij9hx8sHcJhRnyVkcGEnMUJqC7wbYU66IoOMCR9s+EWSWdbTdRXG4gkfzCTUMiNTKOR5F8cn+k2OJfDAtngB5HPKnBd6m9mu3hXmNKYAXHdXk+JHZZRGT+Ou4wFJZ6fyBZFsrOZkPIXn+XWzL4r5WgoXAbs7BeKqaa17WmpBuNxaZBO5/QqR0CLKc/5Kms3ckqmhsI1VRdLU5CnD+JMFgyR8tmdRl9uyd6hZwKBFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7x+yI0/InNXnnUIl1bH72b5o3+xY1wPIQCl2lMVFca4=;
 b=dmGgMlAbLTQXAWEuFIDQVslN+28lZywtSanvZPTbBFcc0sDHk8Ut+j6uPMQuCy/w9ZxMtZ78/nuMiCbN/8wols0p4cupPo4L5FdAhv8GEHVOY0Ppb22Dpd21f1pHlkrV8mcDZYKwhnyCJIHeLuJ5DtFluMFW991D1o8wvf7WCx5whBnuYMcZTDDaIGmDpg6CBgl8H+Fs36/dy+QbEJxmQboWwUJEhSDA69TZ1bVJ3LFGkGq+GWI0ld5XotfViExdHLslNQauKh7ivVw7z1HsyFXSa/Y59vKCs6X7EHq95oJGHQzGT3V3ySa1r6MyqRezlSBOYGG6qHRArIoe3HTI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x+yI0/InNXnnUIl1bH72b5o3+xY1wPIQCl2lMVFca4=;
 b=g/LOmCt6SNzb78OK3mEysCubKhIRY8hw43C3rJKRsfzr1JKqAw140MKOh+Ue6J4Q1ANJJrrBC+5k7UpJwicRpx2XaoohiMi/GW8oKuOnDSpBpOVrHGE4OInbz8C6EvfWWu3ODkEnBCDVlXVSOae4i8lSDNlqn0CKY9cRfp0cs9E=
Received: from DUZPR01CA0322.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::20) by AM9PR02MB7329.eurprd02.prod.outlook.com
 (2603:10a6:20b:3e5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 22:36:39 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::7c) by DUZPR01CA0322.outlook.office365.com
 (2603:10a6:10:4ba::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:39 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:34 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 07/38] arm: dts: qcom: apq8026: Add space between OR-operator
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <4f490edf747de9157a86eb3b3db634e2b6f6cc39.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:34 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AM9PR02MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: f1fb9709-beaa-4dbd-74e0-08df200c7569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|30052699003|376014|36860700016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r4pJsX9M0baFNbm7krQ+Yp+qm+q6/BDP6atEdmFv/Xsfc32GDBD4kqWsKFSkGuQkPIgiu1V5XEHpO7kqXeGudT7WSGNhtSDDjSDtiQWUBnrMgSsZs9M44+wl2c9DyIIHucgh8Dekq1ZlsPIG/CIk6xq2vHhP7Listsu1HbdNLtsiNMD+mKj9sNwMmMDbOBZIBmSpWLw+PBoB/psV7+c7SWTX+UAtBcjLnfNCVdyfdaFGMeZHUb2RKrSc2YCXCaGEXMs/a6ccROypgzMM1U4cbU+bVMgVhHbGcnzRDY94eEQ/8BRBfmuXMEJ0VYYlqFCzE9+KndsAmac0NchXs4XEBp0h6g3Oq2oxtGAaJeen1qWHSHZ5n7lLK5f2Mto5+bH6ctEfCcrVE3sMLSqzizQ0eWqwpwpmgV/FgcTw4vY/2Cb8JjYfv+8TCEz/Jb+GuhhgUwkU42mrdhwCfBeF4iL406L1Mf1Ue1GPGrqXDYpWv/sVOmOnyinwXV4su7w+ixl/BjcV0eBzj/ez7GuiTNgnEoEozk5S1x947Zpk8cbTuDKy3VOCMTfsFnlbbskEf/gVcK3qVfVfKFWJ/WoJSgsTOOHuUWk0vrfRG2hvvZZQrMAQ85ltJXLkMrD/2hdBa7X1JsLHErMqirXHJXG6eeMS6OHbwBzonoEV+E2+cLR2Ft17HjAmCE5AGW+5tEiQMIWysPoLhEYph6wAjyHa4bFNtQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(30052699003)(376014)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NEC8GU/gYh+ZeUTP/C6ROXL4bo2hVVEGoGFXpSZwImmRf5RAWtWNC/OjRRw1maptPUGOV6Tgv1gp8ZqREKn85zXN8PvNOMFJMdPfhQJ/U+GEsZh4L0AbYiUDRsfeGIK9fE3Yf8SH3QLrH4s2znwrjNemqkq9/KmeQhasqw5+AKW4JPGZaKhMN7L6O/Fq+Cyx2aSJujxojnHl/jBjdtE96S2d5I/hN04cEjhkUlD1qHJE/O5pK7l64kQTbwRdZxZsPYYPUvMxV5v8xzU4aMwK3+qG3gsclfU1jHTe8TG4z2W3QITVQmYJI5dyTq8Z+8rVZJFEkn8IPD5iblQrvWdW/2fbTSlEXs+dHZ78x+x5pl+/8Xkk2JuJi21abLMkz9HAAwJRJ6jIhDmZPMUaZKzqjGEFhKu3GyUt4AsI15XluToNjgg1dCirSQKPBRPgSDNA
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:39.0968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fb9709-beaa-4dbd-74e0-08df200c7569
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7329

There should be a space between binary operators. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
index a8543ca7b5569..da0b5969c8320 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
@@ -86,8 +86,8 @@ key-volume-up {
 
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

