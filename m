Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825099;
	b=0xZMWgc21cnyKWcOjerznI9FCdI+jTkumKS1vlLfQifTqsIGkKQ3mXo+OVm8o0sizC9Z
	 bs4Ax+tW1cYX0cYyqzxd/gH0xMAyJkBtt0OtJT1mGAfIT1dhHZUJqNyfaU8D25s7tcRC5
	 lMLlhKkZoaCuoRLYjxRJLvHetBkw1uPLhqMLdDZ7yTg8IIrzXXKLOuPeUjGFkvymVYFHI
	 R5/I4xrAf1WDsDrtdCJXJp6V3oaZ1mgC4OOrjgydywCJxrzjsjq7ltYKuHM6NLkRVjWNZ
	 DdsaR5iMbdrLTUzYqr4eE9azYOCqO3MwI3K5ariU33qYC0J5eHi9ydOSICou1F4aHwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825099;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=37/Rm4GSJF9XWfFZZC8WZbIL9WzbvXGrg+89fMH3QqU=;
	b=qIr9wrMeI0W2AzKPbwrK7uQmG1x2Q2GRnlpbe12ehiyDxgOGKxYoSVk9PZ8nQeILpWf1
	 FRN7/gtocrUThEquG55MnXuXquDy+8+ml4n1+mP/826NAY8YP5y71XXVmwqXmYfCqvitO
	 i/1gA6kTtKKzPV/EdZmgaTtNQaolt/sSgFvjjUCkmLqtAxWI+tVEyozfgVQ2oB7Yzj7be
	 sob6FBFwYHaShMCsN5YxDiZhJHY5Z4NUhwnivLfGbci7PAiZp2KxmFAfkh3NE7hIWOllw
	 fQ9MiQQm392WZLtZJzU8trhDbJ1wjsy2CZFVab8mFwRfCH+h9FtPE4eWYFU7dVI2TTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=hfowidbV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.9
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86776606A88F;
	Mon, 16 Nov 2026 10:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86776606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=hfowidbV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xS9X3RwxBVTjrzLo4pV8SMn84L+SewgDToDSFoWSte4VT4oNfmkYfNsMsJWxtBlf/58nz8lRMDexhdq3NHQxlzax6Lma6w7qC71tngn5mw+KQ1YIsOScpdQciCjEYkL8flugLsUSb3tyHImBcdkXpDVm/MIaTxubIszCEIVSY7Fys0r0jwFzXUfR3dmxqMoQIa/D7dbhNOKLkCfrZhFvxNRNJJB21WhGOjDbF5Hm8T8JoRFudM1PkLqULahMsGmjcYNx8V7qK/qkwPABm2rW+XOy1wssYUpN2omMIw/1OewzQWyAZKjR9cjU+xDm+G43ppW7xe9oo7en1OMZNWdUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37/Rm4GSJF9XWfFZZC8WZbIL9WzbvXGrg+89fMH3QqU=;
 b=QoapXfuI5O4sHuEY6MrB/WE4pVMvqLUI17zmpsYhgiAzmuksIEzW9dCAZbdw0jFiAZPDrRbO8YaLL714Z2q/3N/qD2lHllzz+bK1gPs+o8KFxx8Z8Q4+g/ogtTPTWi1lG52eot5ltMo4/IZEBNkmjVgZkUdomVMCuUe5Yk01cGlYgq2lIVBLVCZqU6lyqFswoC8BSdgaHc2ShxduJSpiGqVfKhteAhI2QLy40gAqA0XHkZ7Wbiqzcj2rf3x6sfWh3S4XOYCPQ8zkXp87bY62SsVP2Yn76SOxqisiO30/TrNtdDXRaLz1cA4mq9zZaGnPWFjz4uR7uceN42EFCz2Jyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37/Rm4GSJF9XWfFZZC8WZbIL9WzbvXGrg+89fMH3QqU=;
 b=hfowidbV+JoGAawYWk/AbSgCUz7SG/WqQt5KaScWvHpxVGK5RhA95i6Ss5Oww4/EhXOygn62ydzyE+uww0jecNNA8TDSnnWq+XNFdppaUDwW+TS+HEiRng6NzmJB/YIowXPHBZx/oi8WYrUnmWM1FbDX+DmKlBNOJT2zO+WUhz98Os/CkrqHbGZ6k3OAnkJdn3v2DP7WpSB6BKKrr1JYXdzV3fTi+nBVynk7a/67HFFIAM6Zpkpdi1IYUqLRVAlLMdgUYRxDwUcUk63/piK1MwUvH+2v9u1glF+RDqxFTMeNivqpoZKHxUKE6wbTwG5VFUHl2MrU9/TWP+IDMWlaHw==
Received: from AS9PR06CA0589.eurprd06.prod.outlook.com (2603:10a6:20b:486::27)
 by AS8PR10MB6054.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:535::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 10:31:35 +0000
Received: from AM2PEPF00070CF8.eurprd02.prod.outlook.com
 (2603:10a6:20b:486:cafe::c) by AS9PR06CA0589.outlook.office365.com
 (2603:10a6:20b:486::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 10:31:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF00070CF8.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:31:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:32:18 +0100
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 11:31:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 16 Nov 2026 11:31:13 +0100
Subject: [PATCH 2/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp257f-ev1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-stm32mp-imx335-fix-v1-2-01f538260f00@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
In-Reply-To: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF8:EE_|AS8PR10MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef40ba9-9817-4e16-1a5f-08df43ccc997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261026140227099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v5izcGak1cCJB8EgXsK1midJWrHwDiHUy+QqtdKo+Pq3xQf/1ktYYY4NouABorWfOWYOpa7b671g0/8Ihz+0wIfe23zIw/EDnCgLFJyBiRqdawhZCke7lQ7+eKUDZVJb3OK9ZHfYI4q0oCgCVWG7+7S/xxhs+iKTTK5mC+JN+weaYJY8Wdry1ZBOio+AZwdKSeY7GyGL9bUHql2JdRajNkrC6fYrguQNPo+VmNfoUJTcjs3bd8TOHln5Ic9Y6qpXRLaITK9tD6pstKG9jEqeFNmT/5u6Npv13ACScf3trnDUpfRaQsB5l7OeHxLYKMTJEodUzCCwb/d02MMTpSTSMt2PfsunOffocnQQZimT6xrFBjyQkUFwV9i00Iey7wBlYKVDSdotfKB/p24rAPDPOWGQgRPuxkXykN9c8FBt4aQJnyeKRKXcvQy/oV2+RNGLpq6YoXQbEbomk2nqAFWa83WCYW3tEeWBqIVbjbX4J3aDyyg5U9DAHo4rp4tlfc7G9/gmFGxLgwCexzFxvNMh8DgULqKBnwgICjgCDBnAOu2LY1Ac5NgnHbN1xhfdD2i63hGNoVcbAo4kD1wG3sNVhNOoAtLdp26+cHv7EQJRRkMc750KWupUHcbdrf9BXilosf3yKyyh5LhJzdO1RVGuh7e6Luj54JJR3m394/c2kwrOgnAyu3WQDE6vNdwr8V5rfMiHchSLCb3fPPJ3oDnLGQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026140227099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6kuBugSdmhMCgeBFlLTnjTEZm9JJxt0fKhOqRYnk1JzzVHUSTZMpRMkB4Dx99xNY7lwWrKiBvWW0+poKXStYkFR1PfAsZez/5TmRDB/XtK1aErJoRyGl7w+xF2UoeZ1l9zdcsyvtNxsK6+skqbcm5YkWpDdUycqqKGFsHmjyIcZlmlNAtibgiFDXVcQ86yrv5sd1MIV1i3Wp5Gf99Q+y81M/gRiqeAjJxQVAzWRmRV34oXLVQpP/k3qGAnZEZ+3BeEoEI2WdSdSqlaakji/Y6l+Re35p75q8b23XPsgh4SG5tDSk7cRo1jNeFiOFlFOlZeyFlXVwCqYCLdA7EBSca1TTnfhcX2jOna8VciiF1uD87+xhq7FoAni6Vw5Cv7DbbEPMU6O+y7yXgB43sR/CkaLeYVwy6ZE/f+0vrBmXzLcIbn+K+Nx5MW+0r9Nw/b4+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:31:34.3543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef40ba9-9817-4e16-1a5f-08df43ccc997
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6054

The imx335 reset gpio is connected to the sensor reset via an RC hence
a delay is needed in order to take into account the time needed to
reach the level for which the sensor sees the correct level.
This prevent having imx335 power-on issues due to the fact that the
driver is trying to access to the sensor while the reset hasn't been
yet properly handled.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 782b4bb843ee..f40ae2293b3e 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -73,6 +73,13 @@ ddr_channel: sdram-channel-0 {
 		io-width = <32>;
 	};
 
+	imx335_reset_delay: imx335-reset-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&gpioi 7 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;
@@ -259,7 +266,7 @@ imx335: camera@1a {
 		avdd-supply = <&scmi_v3v3>;
 		ovdd-supply = <&scmi_v3v3>;
 		dvdd-supply = <&scmi_v3v3>;
-		reset-gpios = <&gpioi 7 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+		reset-gpios = <&imx335_reset_delay 0 1000 1000>;
 
 		port {
 			imx335_ep: endpoint {

-- 
2.34.1

