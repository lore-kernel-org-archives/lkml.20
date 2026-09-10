Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012062.outbound.protection.outlook.com [52.103.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F00039CCFD;
	Thu, 10 Sep 2026 04:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015030; cv=fail; b=WaiIFxTG6jyi76itg/YeFNRSM6GtupZoEz7GZGB/hVBs3Y4vhNh5XIVYZ4HzfL81wlbB8m8NAjtjVHBofXFJcngBIayYqegInvJHO24SEAlxyOQRP4+c9eMtsHPKYHZ3HyEsiZM+qJCSQHfKEwRy0OnA1PfUP7hQKG/0bXcNNnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015030; c=relaxed/simple;
	bh=C+x7q5XNYmlOMG1emDx0nc0E+0SV7iDt3vZkG22NYhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cjdgFThyz6sp8Umke+UfIABHJsiiSmBP/mnTZ2XB9vMNAqokHfVgEGEOzOswbGOqmgW3MTnxaXs7rIwTssTNEjFSpb/+aQnVz1sX8kdqHxeo3CRx7zPTUSWnnpNMUsGFo3b04pd3NpW2KqsF0jphb0KDIOvIlApznLDNp9lGsLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=sifhoKhH; arc=fail smtp.client-ip=52.103.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="sifhoKhH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/kJMNAWn4sSA5y+GNGrGp2vLbHA3lAg4V2jBHu6/jl3Lp02+Us4on2YfruPqtbkoFqrhu4xC4J82xpO/xmtodHWke3vkFiH/nEsUoBtktTUAogZWeGBxhLMLa8OFilfXYhcx7Hc0t/904mbsNV13oUxk1DZe5jTZkpLUfKi3qbDwEEAISDB2mSlokJybmOaEYLcVrhKWIXREwnGNL6McAGnDJLtXMqra2bi/7TdXNckULx+dNJPa6oz2sYJBV2wTldJaj23nJ8ZBEAYPw3VJ9EegNB9i5CtBpm21EnQqHcd+h62UW36dLkg5CdW7cfWNtZDqptM0GFGOueikBKvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzdTwSfFf4H+wlT1KaHz8Gf+O1PZTSlolEb/cX15l18=;
 b=lCbOoqI5Z6+pQmj3zexUOd9idoblm7xf0mobrYqaJeH4XUXeVIEffXDIjePbIl7UEn9SX8iWey4sf8+m7QgcjP0v1AmQAVsUjPrT4pFsi06344cwFwJQnKacb5FrxTqdO79l9Nv3hkvtuUHm6auTbijjC+nyQJDyuz/2dvL7eXOWzmUGsSjx3VqYdUnUznKFfO5dE/9p/4kTgE02SwtLYOIFsT/9uSpD7uL1QxXFt1BrsHhP8QYnSd4cjwXzy4vgHnIJwgMJKCT/P4iqJWbVed6NliS63zaccn90teWiOo26cZSd6WcfgAos2Er1GTImo1ApQeD4/Ql6FhtAoZ366A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzdTwSfFf4H+wlT1KaHz8Gf+O1PZTSlolEb/cX15l18=;
 b=sifhoKhHn/FfRpLS/w5zdv9xBoo/r5LsFB3bgThz6BNREnDqEkdjo455otaadVo0d9HkYgrnQHM9mS0DXQkFIA4tz7qaeh45TlX/ZXSlEXX8U87qUJabu2vObpV0Z6My4SFFts59+7IobRldg7ekzFvTunt7nx+gUzB/0Qil0CUbY/JmD1EHHfhIMtgT1FmGZUyVoZ3y6KSri2h93zmnAvbR3sHb8ilBU2hh39et9cItT1fMJ2zIW3qd6LwsnbxzOmUrCdQwiksMAuASHi9Yq24sH0YZJ2HJcV3EZZwe2amFtX4+2XmgKs5mb1sWagXbZ8Ksfz8S4sQ6JQ/NG2yjcQ==
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8) by SEZPR01MB7608.apcprd01.prod.exchangelabs.com
 (2603:1096:101:2a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 04:36:59 +0000
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83]) by PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 04:36:59 +0000
From: Shujath Mohd <shujath@outlook.in>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shujath Mohd <shujath@outlook.in>
Subject: [PATCH v3] arm64: dts: qcom: sdm845-sony-tama: Add battery properties
Date: Thu, 10 Sep 2026 10:06:48 +0530
Message-ID:
 <PUZPR01MB51414E1C0843688784B069C4C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0364.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::14) To PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8)
X-Microsoft-Original-Message-ID: <20260910043648.17886-1-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5141:EE_|SEZPR01MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9001de-e0b7-43a0-1437-08df0ef526ca
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRXkWCT5qSsztaDdcUplpRLPv2AayQpQQk7SrPMGNaJBnbDU3KKuf5mY3GDzhgim4kQdL7unv5HJT/TXMrn8xP/dck/A0PSrQWqyeEDszMOJZucxiiZrmajvsTRXuDSUkizuJW9G4MUj+5wpOM04nogx4jl/Xw2IBECKCcNbIUgwiXxFqHr+tfTa+5vRe+teT+Yr4lEveqfWQ91U5GtOZ+vdHCSCuNCCZk/uxMukgx5nhfTFxhDqZaiyB/vENAcyXciG/AOnns3HcrHxlQXvUUqzZECegTUTK8XLcbZDUwHSGMobazFj+bfegVYPvPUpoRhwlXmktCoUtIwOOIIWCnIh6rIAkejTFNAqhMzT4y2DYP9IhJk9NLvlZV6edapQGj+D6uxS75ufzUTOpa79Vz8OydV8+DjOwBHtPrT2iKX+h1IK+Ml91lBpHrbdUO9e++mfOHm4/mMQg2j1b5ks60ObT4XWpgfdDE2ObDiyromOrMXk+kG7VqOKFekDPqAPDa6qlBFItJXA6n9iwDKseEb586A48704DNjgT2GAF67MWZ69qKUiusL2mjFNlIUSOmxewE2mriu1ckZ9een6qd9ZD8PeC0uCAqsUDb16xSSW04VjNCyCSpgaHd5bAFO1Pktv65foD3XuM4n690m8bS1C9bSrFV8JKjXAXaD3AZvz2vGKoU1NMxQUopbBqGxoYUFHwP+xjN8k+KNiFv0CumGigINaNYgEhwS2qRPDAIl3A=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|5072599009|23021999003|10092599007|8060799015|19110799012|15080799012|51005399006|24021099003|440099028|3412199025|26104999009|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LKR6mgz42/7Lcsj6d5FF1vhPvaziNnT3wetRGO/5WBr3iEg7/But9Wfiuz67?=
 =?us-ascii?Q?0vAIjSp98ET6Yh+LZTiMD3Gwn09ThZcbE8tB0bYz8ZaA0+gWIVC+pUnauhyO?=
 =?us-ascii?Q?AT470GbjuJGKQU91ax4EMfQnsdH30bCBk7Da3MbM7uSctyOBEgmOnl3UMD/a?=
 =?us-ascii?Q?a1q2ZQfD7ylcYOvQbdRo5t97OVfW0l3jGS1b7MC30X5sJjtDiOr0+PRASYBI?=
 =?us-ascii?Q?VCD+onJ8LbREuGCJ2fhfFkbEq/pqdo9h9ata6GAQZ3kBjqLrLw3pbDOel+Nq?=
 =?us-ascii?Q?0tYt1kjbXUoPJUIyYCG9rndqhSp3/JPSvhNzSIgcDaHE2EK5bRhWtI9hC7uu?=
 =?us-ascii?Q?oirrB94J/yQuWKak0h4/GUPEoUCyHg+uBEMIo6ttswJSkNLoKa9Q68Ea0uAc?=
 =?us-ascii?Q?TkXePPDY17p8+4e3RrA3czQXTAGYa3mWYKSLBmXyKHOrARmnRWSDNau1bJRc?=
 =?us-ascii?Q?/ZjkoqKefFINg9L/A2cNFMmhuNn6OhnNLrUJnYq2MwglG7mrU5hrBa4JT0G8?=
 =?us-ascii?Q?PXsWpuL7vBcIBR7Hj9L2c2yO82HVyXLapDcayKAQM+yQAapF1ttnH5MPQJtf?=
 =?us-ascii?Q?0TExUz3Jhr7dJ0axrX7tL1tbXrVdNWwXmUWC++TDEeakhvTcc+3TwDhvV9S9?=
 =?us-ascii?Q?vHc2ZPstlxx7mvH1aAVFKVXgbWMAJ3JZvxXBAQMDR+9UwSkLbW7M8yW3qajv?=
 =?us-ascii?Q?0SV6Yr9jpyQeSvzWGCuPfIMBTCzQgil447YcHjwoivj7D2NZSCuSxkoJJ32q?=
 =?us-ascii?Q?Bcjx+vweZryjO+s5o8Jee9M7fQEB7+GFEX78ZsHNvJS9Y+N6CcwAQzoxadFi?=
 =?us-ascii?Q?WIXK8Fibi3vLgOTHlS2PR+3fJdq8o7Xsh0n6RPQ3XuSIoH9wPhRNTmKAfhA4?=
 =?us-ascii?Q?VqFFHHQgRobBR1DznFc7EVGKujIdLLXmUTYj6lO3DyyB8S9lkP/UFk7+tAZ1?=
 =?us-ascii?Q?LQ1THeq2KuEI52NbgvuGsYBsIbjxlAMX5vx7UskNjev5ak1Tvgfg9REY0LwX?=
 =?us-ascii?Q?FjB4?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7teQIWRunzpMg8v/1mzlDwSZ6Ob3LeRnPuyifBQ04Ik1vNcyOl0deZQVgNWn?=
 =?us-ascii?Q?v4X8kl9lGalkQjPyUyms3gwZs3zhB6ATLvyzDwlRHV0tBPFbqmp30UCHsSIg?=
 =?us-ascii?Q?Qoa6tpkyZCM/Qf0P6uPdArRCXHAhkzf+z1/knceU77zYbywvG9ytssVtBzQD?=
 =?us-ascii?Q?8G7SNIQynNrbMyfXWLOadvPUuic3lBeaS9uNmFLhtTJCMaKoy43S1E99CgLq?=
 =?us-ascii?Q?qcvjNpQGDcMQ6HAIXwHnoTGhM8rD+5Kge3Zhxruoh2MwhVLkhuAC1gABPjpU?=
 =?us-ascii?Q?6mSK+dCVin7m4BOQ0V/1lQL0A1AGzlANmS6jkdKpPktNmoI0UPaJt62Z4SNT?=
 =?us-ascii?Q?6k8Vr5JWXKNLYJ8Jm7IqnWmawMqgT0kDRycljq6zZH0y3tgqTntpTwmmlBJy?=
 =?us-ascii?Q?4XLkAbvMUNc2aJHVzkFkOAr9PfkpPVvS8mWQh69P5lSCewbqfDmYrANMRuSV?=
 =?us-ascii?Q?Yk0cR4Zx/MFBOqvgaTTMr/2PYQePQRQspyl/0Q21d0XfOWCEMH188DyixVxr?=
 =?us-ascii?Q?HEpfdiU71fkmGjVjwjDuzScnLXtHHEhsbvX+N5sKi5TEqRmpHA6ZPeecw+8J?=
 =?us-ascii?Q?GLdixunvSNBm9i67Mrlrjj+VFcKp3YmVSM8IcKHwekp+dVlo4K3k9Am+4Bf9?=
 =?us-ascii?Q?Dl9A1YVxlAIxIqT+pn2y6N40WPSR9UtCksr5DZ2yRSb/727HRKZfGgrq2CTj?=
 =?us-ascii?Q?xfCRrw+tXgXI2p/BNODEAanak6LSmVTeu6JRyCdFTCHdgdq9kt5uv7wHK04P?=
 =?us-ascii?Q?ZkdoBPhGMtmAZiTPk679UOwiamnY9bPKrh5pJzGWb3AbS/+93fR21+MnSjA7?=
 =?us-ascii?Q?87BvIg4lL9hHIGWCBElba1J1KLZeCz7M3lRVjd+0mgV/0PU7SfXEeLqpIZo7?=
 =?us-ascii?Q?VyDU8xgeVYW3TSVVO2uFWkMVO/JarhZ3gcxcD+o4ExOKzxv6tOhyrtQeuHcC?=
 =?us-ascii?Q?Bh69LVCX7R3CSzvE9wYQmunN676sSW6tFMJKkgHOg1cTHMlr3tu50aaGjlGK?=
 =?us-ascii?Q?Q3QUxV3OiIGmT6dgwju23lHGkcsaiiCiNVYlN1+LDtydHX5FqyNBIId2cO97?=
 =?us-ascii?Q?TrdFqcAaFPFdHv6fetIRRF/rgASrXlA6j7sdkgjTN7/AuD02NgBq5g6jokET?=
 =?us-ascii?Q?7sAn+va65KxJ/rGXimyS/a73SuvodpXS8wJJ1svebbHh3LWcdAytFFEpfyAp?=
 =?us-ascii?Q?8P2GTil48jTPuicUx0Ad25gqDbA5MiCrbsNZhdmbENu6wvLYrjgQR6y1lUiY?=
 =?us-ascii?Q?Fhkt9q/onkg8y5UO7D6I42e4B50X1wEgFXKlPa8hed9R0KZ5Bb0gENpHDMNt?=
 =?us-ascii?Q?ORb/kQFKwoROhw4pWLqDhC2PpfX74sSjwbuiMvkMz5DxQnWnNza70vnTi/3L?=
 =?us-ascii?Q?jVGv7X2L8+sC2jW1z8oDaZEqAic0?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9001de-e0b7-43a0-1437-08df0ef526ca
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5141.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 04:36:59.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB7608

Add simple-battery nodes describing the design capacity and voltage
limits of the Xperia TAMA batteries.

Use the TMM fuel-gauge profile values from the downstream kernel
(`somc,initial-capacity-uah` and `qcom,max-voltage-uv` on the 4250 mV
bins). Akari also shipped a BYD cell (3056000 uAh); a single
simple-battery node cannot express both, so prefer TMM as on the other
TAMA devices.

Voltage limits match the fresh 4250 mV profiles: 3.4 V drained and
4.245 V fully charged. Aging bins raise max voltage / CC-CV up to
4.380 V / 4370 mV and are not modelled here.

Signed-off-by: Shujath Mohd <shujath@outlook.in>
---
Changes in v3:
- Document TMM vs BYD dual-supplier situation in Akari
- Set charge-full design from downstream TMM initial capacities (akari 3217000, apollo 2899000, akatsuki 3325000 uAh)
- Explain voltage limits vs aging/CC-CV bins

Changes in v2:
- Retitle subject to include "tama" (commit message only) 

 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts | 7 +++++++
 .../boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts     | 7 +++++++
 .../arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
index 6e65909ab582..c76708ad537b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
@@ -10,6 +10,13 @@
 / {
 	model = "Sony Xperia XZ2";
 	compatible = "sony,akari-row", "qcom,sdm845";
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <3217000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4245000>;
+	};
 };
 
 &panel {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
index 82e59e453354..87279392f7eb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
@@ -26,6 +26,13 @@ ts_vddio_supply: ts-vddio-regulator {
 		enable-active-high;
 		regulator-boot-on;
 	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <3325000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4245000>;
+	};
 };
 
 &ibb {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
index dc15ab1a2716..08c0837d7e5e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
@@ -10,6 +10,13 @@
 / {
 	model = "Sony Xperia XZ2 Compact";
 	compatible = "sony,apollo-row", "qcom,sdm845";
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <2899000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4245000>;
+	};
 };
 
 &panel {
-- 
2.55.0

