Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA347A0B0;
	Sat, 12 Sep 2026 11:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212928; cv=fail; b=EaGntyh4Np/XtTbskT9AyGnbSBaJIpLPavgiAzmGCN1nXmoegEi5YGzf5UpSJUc4TTkjRHgIU8iRVjAXLfNVFBjAkLaqtfpZsPEDiqg+YyKD9VYfaNrTdW0u8kZiU7TwbvIA/bMXUUotsRVvDB6aMD8qw4UD2UIgP5wH7peWIHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212928; c=relaxed/simple;
	bh=luBpkiF6jrbfu2H/RAjLjQQu8stbN8WYKR7uzSzrF2Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i3MTM50xEgjNTQ25FtR/Z+kb66m5+22iAIfb6ta/3hQpcV93hAuRkad/2KpgmPsQNA0++UOdF6er3HWCK+2p/Aj5LLJysHWzNlWfLQ5quLwg/jZoXKRIvL0UU8igu7+Cplcx9Rs0p69YpTINcgrbSORO1bX7bBXvKb/z/Sca1lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J8l8IZqH; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J8l8IZqH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApqPoDit2D4E027x1wkbbuH2hnh5eAjlTvaMSxqZWFFajo0GVwkPlrdGMK8EAUSPKwZeLYt0mRxTGqBO6JfWNtyOnndxN7yhniEncH68r92N8BXLl/uWcNk4j+7njQPBmwMkAB+ZO0U9ZNOtSh0Y0UTLtmko7QiJajHqg8wLnl+qO3XtzpdfpCYPiW4ZsYJfyywmXH4LZe1QlTS5sc2azlJSULBytRLiRPqQGu/qcOAfbXBkEb/AeZkRzRYrMNLTiTCbEZV+cw0aF8LFZkufqNPevHEeFg00/PN7kUuCMBEIPHPhqiRSIBtdO8Ll9Cz5lgeto4mU+N0EOjjm71jJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=g5fFxbR9m1OPb8w5/AKTwPSNpB5h6xvhDtvekd5gidnT3G1nNKBi79FL+0QaDkxytbobIiU4Z7RHJRZoX0e2C+PuJQarQS3wXQYiCy8I6d97jZP4qDXA1z8w+EsGRtRDDGnL3VnnkguQzkQscRP73goQ9tpDxtAMvyR1c+Av/eDN5qGInEku7/9qlihV6+6KhRPsdc3LYt3J1ixSJNJuRShLO7FYNH6BzzcMDywsjuQfTIEivOD64ha3GcjGL54u1zdeigh6alwLD7+uvMlUVkC5tH4kihW9lGOfGl5H7uE1A5xrEvP+Q4DzQ2lwUPbtC8ScCi9V6cPtxgxaJJsISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=J8l8IZqHMWaFKKRpTeG1ELCSee6moOkYLrbOxKofqsJM6sr7ctHqN3snPrFvvJk5q3UfDmuPj5lVIKC+X6D2ERscNXIfCDBalm78E+Frh31JT0dXtGwEshA1cFHqKmfV0EPhPYDwVXXC8TCf/30vdNhFE8+F7wQLt4oprMu+3RslzsNH01EJf837wwjYTUlVEmDFEYfSFennYriUS9vQUiqbpBkhgCT1Ni33ZF8OnlM58/DHggcUScjlfwkrHPRU1Mwugr05i/LvmJlRiJkkZDOowfMe5DlgVbH+5N3pPs8319d49jz4wndiWnzi9Xy/njen7hhTFZyUA8E65CBhVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by ZR6PR04MB466071.eurprd04.prod.outlook.com (2603:10a6:910:dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 11:34:59 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 11:34:59 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 12 Sep 2026 22:33:40 +0530
Subject: [PATCH v50 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-imx-se-if-v50-6-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
In-Reply-To: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789232651; l=1533;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=QsUadQeiO4ZJutxpy979OhbHSldPNXSAnx420m3jX1Q=;
 b=dKYLrPaf93luo64dhVHxtZlwrHIJw4Z/7ZR1M+WQQGptdGOFAQPwxLQy1V1tsqcFt7zCz/5L+
 VRAvgcWmItEAXkoX0YMYk5YzBoJ06PQ3nfl/+JmPfQerOP6QIANi8M6
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0247.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|ZR6PR04MB466071:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b50e4f-471e-4df1-f8e8-08df10c1e064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|11063799006|56012099006|3023799007|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	p5rCBHHWcIvoo/NG0pNFQG+XYFGZ0YOysLU+NtKgr6I5/4dyc8+pnAzL2CDR7FlbPJJGF/RzFZybRjUDpfXyW6GWxJzudybWCnKQog+4zfPiM4xnMm+PzUrXvayKop8DVnIAOiO2eiD14Rkc/JPsG5lGxaiuymDJ1jP4fmdiSh+iVl4TobzmbiAmO1rJT+AtCow7zMTk/idn/a0GYa0GGj2Lf6MudmXYzbHZ/0xK0c1PwLr/Sx3MSyYMlVVGx/2sZ44tRRbTR+xz1pCjghfIPNChrSCQe/wvh4IHsmV+C9uFKLfF+Xh4Xo/EHlZ3345lw4ukp1I3ypqN4tYijOGg2bWlFEYRicjvnQLvV2UNJwEZMVLp3OkPNdJn2TANTVmYAwOU1t5dQ10T79WGhqqjzYDemqbp1997yhgRYFJ2yoeS9mEs8uvTWng3qbKMQfGvbJYTjpWT4ki/NsupSa/rMoyIlLFOvmSFmTRoX8HIEq0zMT3ShnqeqIzimd9tF3nT2YzwiFk8oDsr3p7XYdwn7WALA23P02rxjlzEIGY/JA2jPxySf4NDR2pX9VvmI+/FV5kgWB0D6KDcNfg+U/RlHSDb6TXspGSvZH5m8qfwMdbSwPVl3BrXuTX0IddzSOL9updFRmkxUtQhRIjeddPILgJQgwXhwi8x4K4opj1fzSi0E6Y+YYSl36jENMZPSX1+6eFnVvSXfJFYKe+bZDTbXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(11063799006)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGtXb2Vvbm9Ha2JoeSs0Y2tOVHBkYnFMMEZJbjlLN1Y2S3VPZDJnUUNKQzc3?=
 =?utf-8?B?RStQcTU3VWkzVnFxNitoVHFQdGlMWmE0RWlNS2pOQ1V1T2hBczQ1ckpSR1N4?=
 =?utf-8?B?a0hockh6NFQ0eHhEMUZ4S2YwQ3NYSlhkMDJNT0wyeTVVYlQyZmZRZ1d3cWtX?=
 =?utf-8?B?UjZZQ2hyRXI4L2RvenEzTkEzRGkxSVdmcDQvT291K3VFdlVKcGowcmpobGZF?=
 =?utf-8?B?a2ROM210d3Q2SVQ1Y2dGaitPU0RGekdJOFJMaEJsYTd5dnpza3Fpbm9MNDU1?=
 =?utf-8?B?R3VVamxsdkIzUVpNK3N0bEs1dUpFbGJsdXdVOER4bVRjbktraGhiY09rNHZa?=
 =?utf-8?B?OVV5WktnaUZHdFM3ejloQUg4U2VuWFh0ODhvOTh6emRSdGVrakZKQ01FakdW?=
 =?utf-8?B?Qml6VlBlMVJCQjJQSW5lZWJYbjBMVEJGVWU0RTZjNDJPSEljTEorV0Z0cHpC?=
 =?utf-8?B?VFBGQ2Q2c0xzV29BY3dPZXUvelZaY1Y4NjloZ1ZHVUZLcnBCWVljam9CdFlU?=
 =?utf-8?B?R3BIbDF6b1djWDlucmtWOEtPTHRqeHBqbG8zU3dXeDRjMERpbjh3U0FrQ25Z?=
 =?utf-8?B?ZGJqcEZqdlBVb2MxaXhabjdVbWpiT3ZwNVBjejFwMlByZmhiOEwvaDhDek15?=
 =?utf-8?B?TTNQSUZsclJ0VE4xcU01cDdIZU5nMkxHUTZ6b3hKb0poZ1dsZzBDK0R4YjRj?=
 =?utf-8?B?WkFmN2Erd1JhK05hbnRzZDhTbmZYdTR1Y2JuMVlKVXIxQUdESnZDVWsvWUN3?=
 =?utf-8?B?bVk1MTh0TUExY1o2RGhVSytzWTlNQ3VmYjNnQUFtdERnaGtsZXJjYWUxVURl?=
 =?utf-8?B?NzZtZ1dBVDArUG43VFE1U0R0elA2YjdLY2NVbWhSNlhHU25kVE11dlcxTmM2?=
 =?utf-8?B?RjZMRDdNRGdocnFnV29EQ2J6UHkzbHZnWjNPcHlMbGlVSnpCb280b2pvdVVZ?=
 =?utf-8?B?RCtNWWNzaHM4Rzk5aWYyQk9QZlRCcWhWSzR0ZEVOMFdOcWFoMjdVRnEzWEZu?=
 =?utf-8?B?a3pJU0hvMmx6YjlsaGkyM2FvaXk1TDAwdFk3VytTdGxlWHdDUnVMRTI2bzFO?=
 =?utf-8?B?RkQyTDY5TytMVFVnbE9Na1UxQnl2bno2VGI2TUF6YWNrOE53bWowWFBpc0Fo?=
 =?utf-8?B?WjlvRlN3aVoxSHd5OU1IZGcvV0FBMUI5dkptOWl6eEY1aVdYS0hibUZSZlpQ?=
 =?utf-8?B?RXpiY29jNXFXd2ZieGs2RlcvSGFhdkRqWVFjend4U3FVd2djT3hZK0s4RkFx?=
 =?utf-8?B?emxlOUkrcktrRVNqMW5TTFJQL1hpQkUwa1AvRFNwdWt2bTdxTDgyNVlOS3A4?=
 =?utf-8?B?eUdWc0o2S2NucEtzc0NlZ3BwV3NvYnduS00zTXFNOWNKSmpVdERyRnRGdlN1?=
 =?utf-8?B?VzNHNWdKdWh5ckMwWTBqK1NLK1lBVFR5by9vTmg0aHR2RDlleGdyaWxNck1r?=
 =?utf-8?B?WmQxMGFuOWk2eVByakRvYTdqY2ZNYXFUVlFjY1JzVXgxcVNyWERyS1hJc3Nh?=
 =?utf-8?B?R2ltOFZla29iM0xkZHgyemc0OHQ2ZkI4cFAwb1p3QWNKUllSTUI2Q1pNZFhY?=
 =?utf-8?B?dG83akJhTGx5cG4weFc4VDB5d3p5TzMvRk05UDVpWWVzazBPVmJqdU9RL1pL?=
 =?utf-8?B?YnZEWXRjemczdFBNYi9ZRDYyUzRkejlWbk41bXlMWFFxWTVHU3hPYm51WDRV?=
 =?utf-8?B?eVFIeVM3eTRiWS8zenI4U0VkeXNINWV5SjVocEpHcHhYR2gwWVlxOGI3ZEdB?=
 =?utf-8?B?RXIzN3BlbFc3eDVIT0hSZmpEeFU1SFdaTlc4SEl6TjkzcFRmaXFDcDN6TTJH?=
 =?utf-8?B?YzhOM2VkUnR2bkhiVGFoZUtqNlBSc08zRHlzVmF2SzFDNGYwWnNBc3lGcTVr?=
 =?utf-8?B?MGUxaTlySFMwRy91QWxSY2pTQ0JJVUNEcCtlOEF6VkhJOG9HSGk0TDNRamw5?=
 =?utf-8?B?UUZMNjNxbkJZM0UxNVRZQS9OWWs3MFRMQlpKLzQxbE9nOUlsQVQxWlVndDIy?=
 =?utf-8?B?RWxUcEZYbVU4ZjJMT0YzT2V4MUFUMTNwaHpFYjJDeklKS3ovTVR4RjQzaEgy?=
 =?utf-8?B?VXNPUE1GWGgzTGlRYkk0Z0JXS2ZzajI2R3ZyclZKM1JYNkR2aEZ6UUpLeHF4?=
 =?utf-8?B?REVPOERqb01CbWplN2xTMlUvZ3NZNFVnZjVUTFVhZTNFanh2QzU0T3d6MmRW?=
 =?utf-8?B?Q21iZHY0SVcyK3dENXBTOFZaSHN1cEpVdjdUSld3SVd4VjVINnBKUkhOWDQv?=
 =?utf-8?B?Vk9OWm9aVjBzUEgxSUdRTmJ4Vk12U0M1NHk4SkNOOU9iRC8wVHAxckczNkZw?=
 =?utf-8?B?dWJyaTRnQkNIMTJWeEIxTCtWVVlwWldaaEdzWmJqUHFOTUhnS24yemtJRVpB?=
 =?utf-8?Q?7fJs4ga9eUTiuU+MfL6zRN7pWGMGDW8LdK1J+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b50e4f-471e-4df1-f8e8-08df10c1e064
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 11:34:59.0137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EA/OgKOBeSV9gfPIRIKNFbY2z1OKXQbLvwN5fmX2+G4x8xyk85wmQlV3k+mcr7nDijj4e6MxI5l9CuWVgFPG412g3J6sPARwZc8SM+o8hG0JCT0MTAha/KDSZ097P/LW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB466071

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..ac8293f81c6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@22010000 {
+	sram0: sram@22010000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x22010000 0x0 0x10000>;
 
@@ -186,6 +186,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

