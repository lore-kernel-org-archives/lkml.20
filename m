Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013080.outbound.protection.outlook.com [52.103.43.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62019471259;
	Mon,  7 Sep 2026 16:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797006; cv=fail; b=oDMXstnTcsE0XrZmEUOsbtNn1yD3t2+CtAG+rxfgqUKL36h88xFXKwH1T4LCMheBQyOeTR45y+ymxm/E5dyE3Xpd4+VrQtUNa5P6mDpAK89iTV7Sry/wL8c3jivCGrL/z/80TASS/eXGAQJIszlHVR77j5eFtxlAEC3kBm1Y09A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797006; c=relaxed/simple;
	bh=beeZkLJZw/CxucsS90FDoZhR57j/3nogZWkX3QpTezY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L7Qq+bEhgCXTY6g8Aw+XunbMRKf0Rl5DH1iws7ieGBhOkjnDfLUb/E7mw6pYNxrYYmwbdLDMWHbmR8TGRYwDS0X2uhvQaN8/BFfTY3PzIO2AY7aT9tDlCCi2fao/jCwCwJMRH03YtqQYTfZR6vcEWX2etLwRA6wZ/WWjwJAJAoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=kR6S2aYW; arc=fail smtp.client-ip=52.103.43.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="kR6S2aYW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVIjYa+83PNYtGMco/NcKjKYEwrZyjBH1mtBJEsy+DAbFG5v0ZQq7YikBI6BfltSswnDWf+BQZ+L9gc/UaItIGPwWIKJM8CswYkAtQgKsi8J25+UCbGeyrhn+WxzmkVDpKtqpjwmY7hHxs2uJ8litQvV0WPmd0e2IGD0hdQbbaxLJrl6TtkIcRPLE7W8eHzO2akl5M8FakgYsbQYDdpdo0DLlfbeELhfVIN4e0WrpaGfnO1R6VxUofqDDJPM3+HIOpu44aIF358wxfi0NdQ0esPF/O006hZVZrduamq4aI6gC3tdUzkgKQpYk2XqTB9jLayCPgJnZV8R7byJZ1v+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6kU+behcf2JhXFnb7MttdG0dnQY9czam3qqNvfqaIQ=;
 b=YstPmBPfhJKhJIcvnPoMx1LPv/KYe/KZGFYQEwqlb0oWC0IhY8E2HVo/y6raWLUtm4Vb0mO0sHHd+wf8K+brJPb1Fg0XIWn+zGQat6g4rO3z2wQSY84PZqaKZqMTuaYRs2CdZ42JtGEybCoQzSFdVdXzCX8gal6JGzD/0hK43iuHYoFRsD0MugRnRUICpzaQ4t0janAODQoc3yfMvjWaO2v3Gz5kzPlpKn2eooosuAtHAFBb5pwUt7QgcIBAMUrnqjCbFQbRla3E2vHkqoyqD0vuYYN12HaC0rhqA+/0cn+0Mm/8nrz5YbmKEVdIP/igRCTYCxDZ5TI0W8qMvVJDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6kU+behcf2JhXFnb7MttdG0dnQY9czam3qqNvfqaIQ=;
 b=kR6S2aYWuaDnNpjp60Eytdb7xJPdEHeFEJxmSRg9vFQ28JRIPwd9OU+3X6B1MXF8svlmC7G+kty0ri5jGrwbl4+ZKm7yDcsWFkRoFgjHhZBSOdCx/r16zR1tIED7eo4ekbtxY0Dl7fD31HgA21/3y54DBRFDGsZD0wKq2panQz8D7N2E3bFwRk39pB5U8TTlnwJ1uNwYnKLZt23CM7ddCbwpa/7qhGi9fBQuLRvzhM3YmdFwpY7qdsjAFngElVnn97zgRc7tv1D6hSqG7C0HzrHwVO42EuQp7G4vHWZIRb79ZfuEtdxgxOO8m+0oEZzO5aXXuLZVXf1zToyMkkfSnQ==
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8) by OSNPR01MB7343.apcprd01.prod.exchangelabs.com
 (2603:1096:604:31e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 16:03:20 +0000
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83]) by PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 16:03:20 +0000
From: Shujath Mohd <shujath@outlook.in>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Shujath Mohd <shujath@outlook.in>
Subject: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: Add battery properties
Date: Mon,  7 Sep 2026 21:33:08 +0530
Message-ID:
 <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::9) To PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8)
X-Microsoft-Original-Message-ID: <20260907160308.514613-1-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5141:EE_|OSNPR01MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: adf67507-e739-4db4-6454-08df0cf98939
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|10092599007|19110799012|15080799012|23021999003|24021099003|51005399006|5062599005|25010399006|5072599009|40105399003|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DzRQn+JNwOeHBbCHur0XhrBQN5jDFWuC3N3SdAoJrka706k4Puc3svkcQy8d?=
 =?us-ascii?Q?IruHsQ89iz2htlikgFmSF/bpJjpj/3i0QmMxUnqk4LHrl9XisuMzsbpybOtL?=
 =?us-ascii?Q?H5ieEOm1DFeWYIzSxPQPMslb/ciAKZeXyaDUvyxUKlfjub4M3udCXzzAFX+V?=
 =?us-ascii?Q?tG9+EoppKPuTsebUdmemgDPppqfdS6blkQ6ApbgW9I0e+1b670XN34BJikzV?=
 =?us-ascii?Q?jZ4KO/QMXWBWd9Ve+sMeZwP8aFfzAQTmn8bgGV177g17GwMSywkD+t4tNWi+?=
 =?us-ascii?Q?xK1n8JVKCK/rqkWC6zc6wRnETzVVBudTxcveWddNa8n5FYjPkjeHxq3EK6Bp?=
 =?us-ascii?Q?FCAts4EnOOOECYIboQP5EFpjI7jRWIUEBXC8Dh3PrE3KN2gEkXS05M2P1IGc?=
 =?us-ascii?Q?pDKxm8oDSl9aPiSK2AOv2g5BU/xpjLt9slNCU1/IDH5xKiNd/kIYUz+ysYVO?=
 =?us-ascii?Q?4VBhRSWwW5teZ5oHFVbjxCChgKRyTdRjIBAGIuI0bFPGIqwEhxQTUwGckmgm?=
 =?us-ascii?Q?hZ/05MWqpODCGOcd0aR4uc6ae0GCrE1YjQc4uSV44k+WWrzvkGyeIeM42x5l?=
 =?us-ascii?Q?LDHSYC+DjqRtno1vNdC5gzC7BSl5ctcYvCFUEysqcp0xRd5jx0HmI9/z+OY7?=
 =?us-ascii?Q?wHIzH+CF7DA0tQQzelCpLHjcDUsX9ziKKJ1ZIuM/DdsN4wCyEeqdJH05zQiR?=
 =?us-ascii?Q?5ON/8+7m8p+ZynCl+m9nuQ00wzCpG/vJSST66q7i277g2aWpcSk4BzDAXwW3?=
 =?us-ascii?Q?wp02YiD/kj4Ej1dUK3E6nXguZdiy21oeROpSpMAWtFXLCZ5V7it1Ff8U9R+n?=
 =?us-ascii?Q?X4jb1OSLQXWYUP/yyWqiqzMf38ekewVJ983JmzcPrsjkV4M7EOAJQ3nfjKaL?=
 =?us-ascii?Q?gHIfaTJuvnBuseAEJkkAO+lOmvKx3n8DjIVThmYtNsA+mFKZqiqFteOA7xk+?=
 =?us-ascii?Q?K2ztF3uuDmYKt2RaVLYlifJlG/yi0gxBTdPj+SK1O30MeSYOkbwMUCKrKBKt?=
 =?us-ascii?Q?AOqHq6IrQrYo8IngBQpHnm4hJA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jvApb5tHM76ukJS/agsdBvn15Q8+QEYgasNXMe69fCZa7NIYOuiOPG96OYHC?=
 =?us-ascii?Q?CM4uOCYB+LjTIX/goiBgAwP0EDuMsLPz5WOpfDdwoYZD1WE2SKjj3INN1dyO?=
 =?us-ascii?Q?gjYBxMtWNsZJIqHDc03qSjPGAXLHUtqCqeTbe0Hbq0XghM2BKaHZkJjxtU/f?=
 =?us-ascii?Q?Tg8UktoOlHJhYPJadNh9pK72qlAkTXST0LTrKwufrh/LkpC9geewGuBDGVIL?=
 =?us-ascii?Q?cKz5CtKDx38y2B/v9akhq3ZUOHfNd7lP8CvQGyXn05a8T8+EEVd+b3ecHGj4?=
 =?us-ascii?Q?rBrbqjNXXMW8MOy007Sqn4DE8n+s9ovFvAG6SAe31a2Bq7g9dQQpSqABf0l1?=
 =?us-ascii?Q?aL1JbPn6g2Dt2efYWU1rN1KYUsDSswRW+BxMmRimPV1y3GJQbLX6xr7VdzqY?=
 =?us-ascii?Q?zEpKvLr1GiAQDhFU7h7ydD4SG5pIYi5ogovw8HfCBzGt3USh7G+1gJn74bW3?=
 =?us-ascii?Q?bwFOgqVSdwxZyTtyq9wA0Kkf+Lq0IXAo2gEVCTv+UkLFxchztfD4Q5yXzDYl?=
 =?us-ascii?Q?zs9AZieRvwNkNwcsetbvPNXBKOput03PFuGBKOAKk26fC5aUBAfdn5aOUo73?=
 =?us-ascii?Q?/3kcQ675pTwsR6aX+IXljjizEIVgfexHGneyRoa1qLBAFEQSzSPqTZepLgrT?=
 =?us-ascii?Q?kWnZcZHw/pTqmxJ7vtIZapRZM4w6D1V3vrHlxiD71zysSeBT/KDcMfTAcNYL?=
 =?us-ascii?Q?sb9eH3IpeBWYjQner2M+T675C/+AwULolndQ/WViRQfZbjUEx2Y0eN+qcgH0?=
 =?us-ascii?Q?Gabfo6xcqe0DMc65bGzxE02gMfI+Maq4rZpFn5wognEHVn5FJHkynb/DNk8k?=
 =?us-ascii?Q?BXNz1eTP4LTPVS7gQZhuVAq14DdAhhCG/1NHvje25tNFJAhTc2Xyanln+bT0?=
 =?us-ascii?Q?4l3Kb9FR5VydTVnfFlibXArTtRjyUfaLvQS/nHKJ+a2Mv/YX1kM5n2JDkfz8?=
 =?us-ascii?Q?2UprUUmiES6bfScQPnM0lQfGB7DBHe77i5pG59A/AZi86g8P8sTrrNIBPYnt?=
 =?us-ascii?Q?wUsteBie9dsy0DYvQNFUmdL2zyVo3MLWkpUXj8OWNqoQnfTxGZlmKJ9vK43u?=
 =?us-ascii?Q?MvLnDGYWG7dIANLMZ+JorLooS58/EnhJjUE5cTp7a6TSqcig56FXaVEh/H6E?=
 =?us-ascii?Q?ougx2V1cZfZKpzth9EVI2n0akq8NCxT5VV6/UiigyG3Z0rLBeheKv0kfd7eK?=
 =?us-ascii?Q?U03LpR1xPjdx5i1KWcV0wIZaMAe/a+tmHW9psO5RnGI6aPxy7TFCK1vTTx6u?=
 =?us-ascii?Q?7CO/AbLgevebdTITcPfOsmLHzkHCnPZ5/2399PudMBGCydDOr4fE+7CKci4l?=
 =?us-ascii?Q?bhZierxjPhuFV4q8tqBjVQqaAHVuVwxrEy0TxTDSi2jm5i2php9E4SEl01t4?=
 =?us-ascii?Q?JLBz0Gm6ar28G23dqEisEjqcvuAA?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: adf67507-e739-4db4-6454-08df0cf98939
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5141.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 16:03:20.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR01MB7343

Add simple-battery nodes describing the design capacity and voltage
limits of the Xperia TAMA batteries.

The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
battery voltage and 4.245 V as the fully charged voltage.

Signed-off-by: Shujath Mohd <shujath@outlook.in>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts | 7 +++++++
 .../boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts     | 7 +++++++
 .../arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
index 6e65909ab582..16e676ac9630 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
@@ -10,6 +10,13 @@
 / {
 	model = "Sony Xperia XZ2";
 	compatible = "sony,akari-row", "qcom,sdm845";
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <3180000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4245000>;
+	};
 };
 
 &panel {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
index 82e59e453354..3bf9db963299 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
@@ -26,6 +26,13 @@ ts_vddio_supply: ts-vddio-regulator {
 		enable-active-high;
 		regulator-boot-on;
 	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <3330000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4245000>;
+	};
 };
 
 &ibb {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
index dc15ab1a2716..013987184b39 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
@@ -10,6 +10,13 @@
 / {
 	model = "Sony Xperia XZ2 Compact";
 	compatible = "sony,apollo-row", "qcom,sdm845";
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <2870000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4245000>;
+	};
 };
 
 &panel {
-- 
2.55.0

