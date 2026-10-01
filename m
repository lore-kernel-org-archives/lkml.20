Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011026.outbound.protection.outlook.com [40.107.130.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AE83C5DA1;
	Thu,  1 Oct 2026 22:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894220; cv=fail; b=Ht5qFrLRnYe2zRw3aa2gI4mk/gP3W0sTePuVm3pwyD/iNx945XHMrnmeJe9JoPSmk3PZ8S6otMS80bdpbFwq+TWD6y4h4HNH2nUnRVKm5mYE9Xermo6Ml201SpyFitU6yyPKmqm52Kj1Bgs61usJsoOJiKGOUrkDXiCu5boiDhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894220; c=relaxed/simple;
	bh=Muo5aaLTP7yPXHumjwt843V9CyIcn8QOaH7gwAl0fJg=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=oGmB4aiv85cWHYdGFVNZ4yVdQy7+Tu1xkQmZBXhrRaGIrIny42H0xBbvmQ09JSdxN5PFqBazlsdsCpf1PdKgH1+KoMHcdNS9i9ojkL/HLe8GW0mArELXaENoFWDLmQpLWGGUDwQcUAnPPn2uByui3U9ITTKMeUDgXEhGPxNEJiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=lnSyIqxy; arc=fail smtp.client-ip=40.107.130.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="lnSyIqxy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1Ll8ozh5W6LawIcWcSZoXi1UHUSli+F0Z7dO44jqw/amHAVkgNp/8DMpyf37To11hS2EcXR4umc/t8pVgsQw6dKZItP+DCTR6SotLuFAKdQ0aKYIGkV+iCF84qfMb2GdcWdd4VGXii+TFYupHQwTTkITdVf9fmG+KXuQsa9uxp/S4CQvAVSOVC87aC1GDlub/IfBCjjefq3MD6cv1p1jsZtU6wn3zM7cbTe9alrVqi27MZ9NT0IQx9Dh7595GU/oyEQWF/PKbOVf7UolEsCMDwqPXfIT49n/ya3OfAhQ+E2BPPUBQYo4q4lv+Ye80N9cGAB9WTMii1LdE1jBy9oDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GG0HNw/e08hK1nOq5uecdoTUQbv1xHumQVzTgziaAFM=;
 b=GmELkOro2Xgww48Zg7YAQOQ7zoqka/bwx+SXs+HWj2C9LQslJ2msDhpClQoF15kImEMkPb0RqMz5oAzSGpCusT7BTWD+nD9HJiawj3IVdlec0Yzcu/x94eCSIbirfHtYr1E+newQ6whz+f64qzgcg13lTq//QTvyhzxKw9JurjxcHmA3kD/OI2LjIuj3knIfkvSkpRoqhkj/6YTZLDTU/cmgv3LDsfdAwOkXpNtex5hgyGZQ7omGVjCH7//sJ2JM9OuRW/gBsYRZvurF6X2k4+rlX6JRKpsl/r/8Aho5UXrA/JYWIO53ZA093K7VQMG0KwBhS7jtHfDnr8/yX87iVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GG0HNw/e08hK1nOq5uecdoTUQbv1xHumQVzTgziaAFM=;
 b=lnSyIqxy+V3wT46JAf0d7Os6/K11tAxrpcfb+Nmanr6W2yR2VivnBQ+mUPAKGYxiMSEOSWgtmxRaAGneAOxrfhn8jUdnK1leIBLDtEcvIbFbu2ejgvy5qvIXwN3lcSeI6E5n4gnVJfSIPsFU9oOuhKzxJv3gs6+LBd6XSK24JtU=
Received: from DU2PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:10:234::6)
 by MRWPR02MB12136.eurprd02.prod.outlook.com (2603:10a6:501:85::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 22:36:49 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::aa) by DU2PR04CA0031.outlook.office365.com
 (2603:10a6:10:234::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 22:36:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:49 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:40 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 17/38] arm: dts: qcom: ipq4019: Add newline between subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <f7637ab5383b8bde1cde248a60d0e8bee01e05e2.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:40 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|MRWPR02MB12136:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ebbe883-707b-41d2-550c-08df200c7b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	/S4PbI2VbMTc1N8qyQplvinqm5M3bWM5BxhDEnQAKprtLFhB8rCi4ehAzTSge7tyhyJ9bHMrTzvSJg/0WiWwxsIHH870DTZwbSv1LKx8edleGIC/oL2jtgCF1KwF4Iy9+Il73vUbnHDFXUOGJ9HHqRnhb93YP5WtGldixfP6V4k0VrNYyAx7BMMar0NEmQuNKg5AFZgUFeki7ewQI7CSVmrZN0KvuYSI0FVzTNKPhgyGjP72E+zE68Qx5m4EVOX2NxPH2KIdYB70ECMb3SZaSrUHHnZ7K1d07hsKje3lKMtu4SJyZmfs51x9yhxpgVc7DQzCpxvbBNeSTbACbKqsCuLEIZyfNpDmDSyKF9axLGrsVdMvYVnasYjfYAcAO6r86U05DnXXBzGhuOOamtnC2O8mllvQQ+Q29E8R4Am6eUHCJr5AumDHYGlA8IqbxkGKjeIB792St4R0dsqVrkyd3NoKsLOGtJ+SOOWMTt8i+XDXEzyvMtSJtAH/+7t1m2D5JBGwr1wg9SDTjNZ7S6EjHo1NnB2VWaFnhhKR80SJDU4GOFhxgy4XfxXIV4LZek9rgmrZ4GKSkNmYtU4QUIHXWBoSaJOxIa2ogAJWBCeSTzvJJIWfJIBzGtB9PA/9NnoIC1jAhGy6L7MglvV49Gt05alSFlnsXMDyH+xk7/6E5rbPE74F5WsPw91eIID3yOqutkNnWXTNcs1UUET2t67A8w==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4OzzJgfM9yIIM1DtDhEIkGVL0aXuT251yIZqB+hDgE+zr02Fyq0KWVeWdmG0h3q86BTEbKG1WK1r9zF2IZ4McDHCqA+hPxJKYR/2GkMEuNcZogeJfG4KavwijVnv/20vV5PgS1OSJ2yKLW6YGMFX8Telq5HX5OPcgNYsJAHhcumrkbx1DuPZqVQHbaU00YzQLirQLo02GK0wCQp0TMFjPzJZ0Me/G4mFIorr7HF+cVoUHpc7YxCeXnJVmqpdHgQLqUqpZrm7YxhN/rpzaH5f8bqwGJ0x6rT4iLwMgFkgfEw7UY/ztL1aEkOLZta63spPmJtNUEY2z5cEwPNzvpzAfY7kSFfOtUVp/iP2H0eWy7ejRvr73aiPHCzap4T5NzzRtPnT1m4N6DKbDL/gMoa7aG+H6Maa5CQM22Wlhkakf9Nn5cnsrrSTqxtDVEaAt6IK
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:49.2255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebbe883-707b-41d2-550c-08df200c7b73
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR02MB12136

There should be a newline (and only one) between subnodes. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi   | 1 +
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi   | 1 +
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts | 1 +
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi             | 3 +++
 4 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi
index efbe89dd47937..a85c0aad7cf83 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi
@@ -47,6 +47,7 @@ spi0-pins {
 			drive-strength = <12>;
 			bias-disable;
 		};
+
 		spi0-cs-pins {
 			pins = "gpio54";
 			function = "gpio";
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
index 91e296d2ea827..e998cb72c98db 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
@@ -43,6 +43,7 @@ spi0-pins {
 					pins = "gpio13", "gpio14", "gpio15";
 					bias-disable;
 				};
+
 				spi0-cs-pins {
 					function = "gpio";
 					pins = "gpio12";
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts
index 41c5874f6f976..71c5ba00ff982 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts
@@ -32,6 +32,7 @@ spi0-pins {
 					pins = "gpio13", "gpio14", "gpio15";
 					bias-disable;
 				};
+
 				spio-cs-pins {
 					function = "gpio";
 					pins = "gpio12";
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 8eeaab1c0be11..6ff87808e2a0f 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -111,14 +111,17 @@ opp-48000000 {
 			opp-hz = /bits/ 64 <48000000>;
 			clock-latency-ns = <256000>;
 		};
+
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
 			clock-latency-ns = <256000>;
 		};
+
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
 			clock-latency-ns = <256000>;
 		};
+
 		opp-716000000 {
 			opp-hz = /bits/ 64 <716000000>;
 			clock-latency-ns = <256000>;
-- 
2.43.0

