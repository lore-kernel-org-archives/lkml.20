Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013015.outbound.protection.outlook.com [52.101.83.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A044E06DC;
	Thu,  1 Oct 2026 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894221; cv=fail; b=urvNDVEHAU6hL98mopdocqH9VL/3539Tsl4c+CuuvICP+LaPXUfrB1n3rJHddfEYXXheABVR1hxxR8za+rpMhWQ27WzQivu0OruSlkE80IbgOa46BLDmb9JndVcVeW+2/35RUqPF9H3Rr7bm+nIXsqPdkz29Sw5SLQIoddNg8/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894221; c=relaxed/simple;
	bh=vSybQngEXtsy95OE6JWSHNIsvViiqyhwoZZrKIic0q8=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=N7dPKIyu+duKnVVfFzqEue/VIsO4Nn5Nws5c1pSnzFCJAizsIW5FYSi+hinixVRfGhRX4S1a8Fhe+N0MDwbVNxbiw7RSidwebN9X0hUQH+x5fl0NxuCpmck/1GKjeY/Aj0dqxdWOZ+ysb1eSqRsvG/rfJp3zCvQvCRfITe0Ya4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=FDyAvfrz; arc=fail smtp.client-ip=52.101.83.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="FDyAvfrz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j93tm8wS1ZYCLG0wv4rbArfmMNZpvWIWurOICD3SAQuYkQLXxHrcHsdQGW+R3bHDFJ4HiOt2tfYKmeDosPA6ykf/Q1jP4IrmyFzTxMt/jvx9NxS7b2JeIXuLBMIfU+clFzv3RnsxNBE9EJRvik46eqWPeUBbV3ATaTcyEhkhUh6s4/FZvPQ6bcVjwKLO8njD+cN/3lF/74kdl2o3pu6WV1gqh7Cc7AYaLfCkYUw+jOztbq5QyOU4C59M3x2LW9dgaDw2qmkH/W6TPZOmDbIutMjFiLXbtlZ5uDqKmvNRHjUWAARKbv4n0SbzjzRl/Ng1PZW/+msX5Hh2Un2ZOgunYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OALfcu4xXnpVIOGMjWzAcwbCmba/w9Ob0PnY/xjvyuM=;
 b=G0U81DLGhnaWskVojyuJ2/VJD7ZUx3c02QM7nl0hf0pha9mas/2Epzg5IWXXBvGDCy/aWX6fyYzx9QrfysiQS+PegUbcbUpg+akFAOVakmOO9lJEAwtTStdstNYppmLgjk1bUL5z9WFt3CsJwxK897JSXR1SmCnhuiPSa1XCway0IH8ZtodNana+bR7DCOMAcF9Ipl/pyUV/z6Jj00Yt7+jqi99yAvym+T2Vckva9oFbjYWFHGFlVY/zdj5EgHibqLOjTb/75vGqx2evJGQBlxYxGzNBaG87diHEhwouVWDLorz/ns8ctOWrmmdWs5FNSAzKPS8XrzPo3HHn/PA/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OALfcu4xXnpVIOGMjWzAcwbCmba/w9Ob0PnY/xjvyuM=;
 b=FDyAvfrzy/J6wM+icw0huc9lRzLpsFxMIjrd+nExgWA8Dn9cU77NsST2wFMtYTBdkiyx1jRmeAFvUyeILSrOjgDRrfbVdpKPaRoLhfuCzfb3YCqUO05NJ3wjKQxJvRh+5RjuCF7M0PLPre5iorrdsGkX2cqm6puAg0I9oAww4MU=
Received: from DU2PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:10:234::31)
 by MI9PR02MB532502.eurprd02.prod.outlook.com (2603:10a6:290:d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:52 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::20) by DU2PR04CA0056.outlook.office365.com
 (2603:10a6:10:234::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:52 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:42 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 20/38] arm: dts: qcom: ipq8064: Add newline between subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <2d1646878546c44fa184d7759ddd52b2f16b8b1b.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:42 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|MI9PR02MB532502:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec2b574-8e9a-4d84-e3a3-08df200c7d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	w3iG4WDGaX6JWEQxO63Bm5IDXy6dYSnJDtBXs9zo1bn5iqkk/AsrESmReeunzmZqKllQb95Bh/Lfnh8j/ednM0P2pF4IXP5mlnP34KHy+3baWEKy3OK1iK+P+pwcGbYDfi4z/nU7kq2ujgNmdMS0rUhF/3d/OQ278V1SkJd+08aVF9dewXO3OKXKKwzwCcTDUiyE3SPm2UHJe5Zb/4MKB2VIDNcqKT7vmonCc4l0yoTvFzktqs+m5hPEQUW4qgvlSucbqHr7oSBVR6qF9x7Y8FrGU0CojPIt6fTpjkxEaEEH5/6Iag8n8VDucbXB8/+yq7NNLCWMn2KkROeYEEmb4WbHMilCJJ8EkW7XmCTZiRnnIdkFs+DqG3b1RVn54jv71wvyFAnLUopXIS18dGcFCxvw+AI3bjLm35mkqavD0Uu7CU6Dx1QKcT932Wbj0q6FcR40eN/H9uNoe3AEygbG9bwNW6mx/mcaLLyYzYQxXxpTk4Vj0/1UblGS6n2N/jWrnm9oAjOAZ2RNnd6BNb1pgBfVrzqsZIyzFH3/kd4UkYn3VUftCJMfTzhEuP175/Z6fR91p+eKAKMybJn8uL1QtBfjAyWsCufo6WHv9Ix4PaUAViBDkZQb0I6EqAdQFutA5Up8xHaVl2cfnv5sXEq3gE1UihkMVx+UYgbTtm/8miXk08frcrHO6QT+/JKsV9XcMexVVcn55ieddoJuoVrjag==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	si2QGFwpdkmW9OhpX0prjWLSnuCVl1LGcy1fL57PZVqbmntB1po9Al4rVLGVLEV4osU9dsdE1lIBv61VDuNkWlzFF+ke9XEqYFWvey4ZBMwApwiWzewmXh3ocbdHouYyFsRsOPVJ0P2vPuVZ2rplKaMO9E7mYGd9wytCY6lO22Paa51oFgdlm+uMj2rim4oqLaTIEk5P7Cla38nQbmn3sJBKWKf2yjY8OJGq6b8UG7lt1R/sKmKhGCwQ9t6WnZyB+67istQFDx0r1iRdIOjZ+ag/a5SZxSdYACuiGh7k6Q5iOjqtSB6GT3pk8ENYCyfFHWrlsnpibcSi+XKZXH13+CGBGe3bJms7sEYdvsXaThPdvEs3zsGqRgQLXC1Bm86VXXjr9ApA626S8M3QLQ3pn+iA/MruT1Ycao9IrpyGx1Utk0sGPvxj96itURcTh9NY
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:52.0808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec2b574-8e9a-4d84-e3a3-08df200c7d26
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR02MB532502

There should be a newline between subnodes. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi | 1 +
 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0.dtsi | 1 +
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi      | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi
index 49de9752632f6..316dbe55bec8b 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi
@@ -26,6 +26,7 @@ button-1 {
 			linux,input-type = <1>;
 			debounce-interval = <60>;
 		};
+
 		button-2 {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0.dtsi
index 2f117d576daf3..deece92f610f3 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0.dtsi
@@ -32,6 +32,7 @@ &gsbi4 {
 	serial@16340000 {
 		status = "okay";
 	};
+
 	/*
 	 * The i2c device on gsbi4 should not be enabled.
 	 * On ipq806x designs gsbi4 i2c is meant for exclusive
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 1a278503d3401..2b3a3ec4e03d8 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -380,9 +380,11 @@ qfprom: efuse@700000 {
 			speedbin_efuse: speedbin@c0 {
 				reg = <0xc0 0x4>;
 			};
+
 			tsens_calib: calib@400 {
 				reg = <0x400 0xb>;
 			};
+
 			tsens_calib_backup: calib-backup@410 {
 				reg = <0x410 0xb>;
 			};
-- 
2.43.0

