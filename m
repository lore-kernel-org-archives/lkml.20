Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013086.outbound.protection.outlook.com [52.103.43.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3F4F30CB;
	Mon,  7 Sep 2026 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796739; cv=fail; b=C0Vg57dNvCoa1HR1XyBAOZNpDufMYEOr7/TvU744zsYnxIp1qaHmwksDhqs8M+3CDAEx2NLOQ/qJ/X1cv4AQOkoqvEtj8BA7XmYPRDpYzJhMNPx8ir/xIeD56IMixSjl6Is6Hs79GdCcMS+EMd4n0Bzf3fmULx+mdvvN6vWktwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796739; c=relaxed/simple;
	bh=beeZkLJZw/CxucsS90FDoZhR57j/3nogZWkX3QpTezY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gJWUYgeurIRyu8bfHa9ZcjgzuNApn6MBhDAga9vjEkEXcIeXG28vkfzMCyXjpnyO+PD6nQEmZgqFwJiYjodOSxtD6JJN3hOlTmiMHRej/kljKQ1Kh0QV8h3MgNkSCDX+olNutyDEo7d7aWLGuumjwKrzcJmTJifh/E5+9IhOwU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=Qsr/NYkS; arc=fail smtp.client-ip=52.103.43.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="Qsr/NYkS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqmEjBiVTbPMGKBuryrpJ+lkV8CQvEj9EGLFFJ6ByYT4McsxQWyeD/xq+XEpymPZBJ68dVykiZ3NkWbuCe5g+jMOW5qA0/V7CTh0F5dsaXn6+xvI9yWJ6IgviC5ecAETC6GdWUuowmMfES+B1hEZS5DdUhuyI5DOgHKnutStY5AduNE83mHPGUMwjiZSEj5smEIIbVuecmdtMnxb+w6aQ2w8Z9Yq2ylBckBEhzgEZJmXW+tzeZr0VcjD4fFFMHocvTdwb8mDzY/sbyQARqcWlmUSVHBmU2yoQuxJyohSFgZ0CUi9pOeQCfKFq4sB9Mif2NpqbBL7OBZUQfiFSfxQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6kU+behcf2JhXFnb7MttdG0dnQY9czam3qqNvfqaIQ=;
 b=IC9VssXRk1a0aVUEN0G6PXSMkOLqLY6Ilr9qtLDwBvFFbWOIsVQzfuJghxzRhOjVfWj9GVstLPfCdjSvrxBEzlzhxmUD6ukYZPG2NLArqynGpfS/iBcxGbATg3uvZSGtHGSev98Kn0MLaF+H+tTvucvnAlCP3VbR3Gfgh6IBp7ax17Xge4343cqZbDqiAKcn+VmrxajZKfQhiADUxdpd4lRZNe1MjnTgKL+xWu5pGBjpiqmr0AcQGcESvChCyImQ4OsjwO50mC6O9HUQVOrLPEnXLbZYjwzqJgeaQAkX47G+TcIucU+LNiY2Ricq9hyx7l/26ObVIIjsySJRJTFEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6kU+behcf2JhXFnb7MttdG0dnQY9czam3qqNvfqaIQ=;
 b=Qsr/NYkSs0AuclWVYXmvhp4lo0seLhZGzoVZqb0+EqPzxIGE4tOGOyjyimMtCaIroiJJGhBalmyZ0Ukvi1Wx9AfkEKV+rE8Lq4GHsGSauL4VqhQeA7ZBc91g+g5yGoTKueX8+KAgDNxya9/EzHLnFPB1FPKCyuk9rucxkcsQUcql+Y72Li5ljqdthedfeL5IfwtKYfWDM13UGmvW+haIqKiN9GPjqteGgwvFNM1IH76krVIhfB2bj3ol3k+QiIMEU0bnGOmgbwI4R9/ihq/NMJ2neFRVHkwHYboyLylJ38etyjlgp4BIMHit7tKA+/tFp09C4XFsxaaLBMuqOQmPew==
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8) by TY1PPF5D35AEFB7.apcprd01.prod.exchangelabs.com
 (2603:1096:408::328) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 15:58:52 +0000
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83]) by PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 15:58:52 +0000
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
Subject: [PATCH] arm64: dts: qcom: sdm845-sony: Add battery properties
Date: Mon,  7 Sep 2026 21:28:35 +0530
Message-ID:
 <PUZPR01MB51411878AC2B70673F77ED38C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::6) To PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8)
X-Microsoft-Original-Message-ID: <20260907155835.513587-1-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5141:EE_|TY1PPF5D35AEFB7:EE_
X-MS-Office365-Filtering-Correlation-Id: 3238d460-a436-4f58-65bf-08df0cf8e966
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|24021099003|10092599007|51005399006|8060799015|15080799012|19110799012|5072599009|5062599005|25010399006|4140399003|40105399003|2607281247196008|440099028|26104999009|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jswuTvcGvVgwI6M9YFV6Guu5cak6b82Xi6DPEZGxc7hF09UMeBxjtY9dQQ04?=
 =?us-ascii?Q?JqlwlIU/sYs4SWaMIF3tcUMtqchDf/odz8f0CsZksWpJ1d1Wm1yj9oMnthnA?=
 =?us-ascii?Q?AwofHd6uIkxGAydZHzpRIpaV7AlyNJ/mrn1O4XH/iklTHUE9w5pjKzWk5Bg4?=
 =?us-ascii?Q?ZnS89SSMvMUV5iRGydsLyKuRLi3J2UJWrDo0s0sBh9Sbj2q6udUYVkgV3zoE?=
 =?us-ascii?Q?mTafS7TbSFDE1wUSS1mG0kDqQAZQi7PRQ/3OYP546sXuyti+otXbDjBmaZA7?=
 =?us-ascii?Q?j139dIf/RyJ/AzMxTcchZeKaZtea+BG18KNScQ1HrL/IJZBZe/LksOjIHaQk?=
 =?us-ascii?Q?qu6m4RMtsJ8QYZkzJ5VwJt4T2SXl9etIsSvRZLjfyfjc7GuzReX114tCI8KR?=
 =?us-ascii?Q?zrm9yKwphXNLeGjh9BWMNJFkhJq+KKZfDvdi2FZBJu3+JW+NgCqlaDvWQ1a8?=
 =?us-ascii?Q?6amZrbbwpm5VuGzTGw0z6TCxm/Wk3vyHI5OocW9Z54Wnll3xLUV5sFeAoH5d?=
 =?us-ascii?Q?HPCL1USY2UKl+fTlO5Cz54dexboxkeGMBnnVmZAgdnx7sLKwDx7x0Fs/e/kP?=
 =?us-ascii?Q?ppcR6Qa/YdcG7FHXFdyCoTI5tsKff1J/+jrVwkr0TYAM0gcRKI0iHoAsbv2O?=
 =?us-ascii?Q?xEintbMgV3XJXFHYPzvlQfW3JcFyhK9QWYyOtkT9yqfX95cxGhScoduQUbCb?=
 =?us-ascii?Q?+q/fhxbZAmxpB50ZN7ze1JrtOFefolzfdU+HHOBBHUx+d55xWLINusY/SWvs?=
 =?us-ascii?Q?ikbwNVcgmFDX8+D+ASwwnPrsImRj4ap2wLma5H3l5jdXztL0kNso4JJMQy4O?=
 =?us-ascii?Q?WrBHYpzjPySD5leWZuyFiYIkVfHpyKXe2ldcV+1rhc0hnVllQkZ+PUyrv+PR?=
 =?us-ascii?Q?98QipnureKxo6rg0NeC4yEy2PggAF5NZRPM9+vTn1Sa6fdEFUo8mL45DtqeE?=
 =?us-ascii?Q?EusfY99gXU4wMD98bp44SGobfwy22kMNAPg4nddgdZFIkvkBvQGIMekJMqm5?=
 =?us-ascii?Q?+tE3lqw557v0vQofS5OruB1M7A=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GHZKHk6s+1LLA/oelhp5NGVsHhW25zA283Dt1VyOXwCvcYvLoEQ+JEUVnRrW?=
 =?us-ascii?Q?sa12RDanqNSkCve2PyQmVD7VaN9oxvNQWJN51TDF58oGlzCBOtXlh21Tm7LZ?=
 =?us-ascii?Q?yqUlIRY7W8ZdkS8TPfdTyS0iJH1m7waoAt2KlYZa+ZOb+Yf5uyfaVRfLn+e1?=
 =?us-ascii?Q?i8tT1Hz2YoHneX5etu7FogDXbCqBaMcF+/g462d8+xprs0HCy8nyhgP4XwQQ?=
 =?us-ascii?Q?c37fzMvyNMUjaBNoNJynQRPJhdLRa0EJXXhkhcYeR201Glj7Ex8qwdn8P+4U?=
 =?us-ascii?Q?Ff3FtZ9WqtI0d8vjErdhlMmPyfCtfj9ICFIt/gpZ0NtP6JG1XIux17+6q9O4?=
 =?us-ascii?Q?ISNpzgAmA7S1etOXhUzOth0/BiEBOqwJuPkH+n4yFMNhJOULx0BJ0WR9e3j7?=
 =?us-ascii?Q?H9Btb8ccUkTn5NmtIBoM2xMjGYsuuiD+F9DmHnoL/8F/zIxfNZKf+xEfbHA5?=
 =?us-ascii?Q?LLrqAwbjn4a7DYbOWdJ3MPiG2dG1wyFrs1nV8G/BH6KjsxzYQxBP+tPXF9LZ?=
 =?us-ascii?Q?BV56UNp6/gP02djT5Yu8Mrw7xTMUAKjRoKPFNJmn/XYMAjTWXFrrWCHLwPQN?=
 =?us-ascii?Q?aqvMJ+sTkDqyxnG+YgXOKXKWg7Fr3DmOcyiRceGpSrLBaFZ8pVM+q2c4Hzh1?=
 =?us-ascii?Q?GyOoA0j4wCmW0MxUePLneNrhGBdzIEQD8Ju1X/p40P5jzNpCrsIuBJ2+Sxcu?=
 =?us-ascii?Q?hHNkgISd/py1s75zJlV+pqmwYNDVVP/l8C268fC3H46Jrfmrl0EU/uAog7RJ?=
 =?us-ascii?Q?JVnZLLKfXQ4alG91B2JD7HMGEHqwcEuVizxhz6qBn77+c110/WoUN7pl08Um?=
 =?us-ascii?Q?ZqNtR/xmobTWkiy17lI3hfgKXUpPLUjn5oUyP/WQxGSBDUrKfEd2QFgcmHxL?=
 =?us-ascii?Q?vu/As7f8wlAG3t0kqDlMguJsDj7CPpYNxhysvVdfMtKqZ7bRWVLQGMZYEoaC?=
 =?us-ascii?Q?VBxOWwW6tU50Ybd6wV972B7QshsE0EkY7u1yweNeMi+LI3q7iBfvxeAcelHD?=
 =?us-ascii?Q?TtsaG33tklxCWmd61+JD49iHpWTs+DveqAnhxTDG59BZYPX7rwapOoJQpz4Y?=
 =?us-ascii?Q?kWxMTSoRPThyOalSLufEpB2b0engejj0MKfO7USpW9N/p5IUdnH8y8kodWx0?=
 =?us-ascii?Q?Z4Q4mP7sHxhBdTDVajtOtWmx9MjU/Pe/lEQBFLJpivBEC1mA81x0rC0ykNdO?=
 =?us-ascii?Q?5UOY1EsqDJ/fDWNaHntmwm0lLwngKXG6c0vC4fXcv3U04zLqEOaJ1Hs0GDqB?=
 =?us-ascii?Q?+RtApffK7A4IGOcdJirB6yzL4x0V1aJmmx2ikTMv4g8iBqXwx12muxI4kt/U?=
 =?us-ascii?Q?usgLSH/ieQ5oRUn3u5aORMr1zN+a+HiYCEaW4pfuja+5Ay0vco8rLyX1MImJ?=
 =?us-ascii?Q?z4JTKqLUUzXjV1Mdy48vglBkeAUH?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3238d460-a436-4f58-65bf-08df0cf8e966
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5141.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 15:58:52.5156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF5D35AEFB7

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

