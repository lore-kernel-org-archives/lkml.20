Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F53A49C4D1;
	Tue,  1 Sep 2026 22:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301592; cv=fail; b=qwNNVlB043mg745KuCPGMtd4C6Vuk/0/WJcip1pkA8dENCdc4kYhTsJU2a7QQixI3PGkdcS2hfxDDbhVR1YEsjQlXP8PFpd4lxVfSeEbvb/yQ7n2SxfPmv/hpUFoLpZVm9xxVE566QJmA48Vvb/gt/AK2uiq2O+UkJgMfqUMemQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301592; c=relaxed/simple;
	bh=ItGCNOFsjncLmiJ4Mq8uGmMe3wXclNRVuLT3CBcjXvE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uIonL/z6NZ19xAlmmukusPr17Tu/ieZ6KPIPRdFbqDNXe81T6TfqectH8seA7BYw0K01Km9CT/h7chVddCYl8RlsKO8zukrTy/und2QDaiNkj5edQOoh7e1ZSYVWZJ1I24jmHlsuHNDgeu0NTzg697Pff7x8pn3IbeRBM/GLKPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PIGg2jVm; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PIGg2jVm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybV5cS5KhN9rtKpzLrYxVMXnlvjlWqrSH9coUQs04UHZ2huJzWzPbR07pIKpFodweJUeKAhntDsKpAMGl1B1jAPhjFQkdK9dhUhdsYjmOsEdfi50sVGwOkZFnkbjhVCFsWWpZi+ItLN28KAtohcIYJH1hQ2qc582wmTq1wqT/FJZubb028aDCHFj4borXH//mvNYs4asPfG7mqZqF4IHsQ2urt2Qsa8xwvKmQIjTF0kQ/XAczl8fud7qGXsP/NN70uFwQzICPki1TUEfBVc1UCYxzJS2Oalzk/mME9Qd7VjMLxn2kX897pENoeG2nwdi696HmUPi9i7JHMgNsrps+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/kjEHiHObnwO2b0vAkX+ito3RNxSqjfzuBHtb5b+Jg=;
 b=lUQGJCbHS7Eoy0mcuc8A1C+YfUGpJY42YPcHOCQ7aJgmTs2WtrEBm3xykDFEFYfYAQOrXtIAOMKwh1haLAbYZPCG2POAmzK4y2Dd4e0JlW6bNXTHg+qXrb5R2c9KuZuv/rAuiNgtgxNy97Ce8PIFclteI/uvdSupn9ePjDl+UmEqB4dAy+B5cJifWu0XX1bTXgjSTXIRuGtCOL1iB+/VCVCZUU1eq23YQiYS+tT8aBUk5MTGotFGUgdjvAkaS1Xcaml4519fGAqtOzW17mEIji5r56C2UVEgSg4rZ8No8lq+7CmqECNGts+6JJ41TR9Y0yo2AYg1tEiS6XBipC83fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/kjEHiHObnwO2b0vAkX+ito3RNxSqjfzuBHtb5b+Jg=;
 b=PIGg2jVmGhjR8kHS9fcfMbLOIf7ZcWlabKVV+4p5hCkaipZdWFah2q+P4UNdxBgRwwAHwKGBhr/UWP37pXnXUpHXYDdrQ8kX9cFW5jMoSlvB5mwPP9ZU9wUeq0EQftSDWc86opfK7dBpo6LUu6ah43b/xHj+LAhqInlOl1IkM5UcrHry0mt3AB1Fx+MaXJuzyZX8ofn7QNMxiN0k2mIOGy2ZIypMH0a6pCEVwv2NOKXHGWixs1QVYrjFJHZCtv5dfdmYz3LVgb5cTdZp4yyfk6YoP9mDWn+IwNuK+QVsl/Com6QoQvGxIZ2Vl+nRUJ70NGf18gtxWz9DhUFl2yKopg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB319484.eurprd04.prod.outlook.com (2603:10a6:190:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:26:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:26:23 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 01 Sep 2026 18:25:40 -0400
Subject: [PATCH 6/8] ARM: dts: imx6dl-b125v2: add touchscreen-size-x/y to
 exc80h60 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm_dts_clean1-v1-6-db741f37a1f4@nxp.com>
References: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
In-Reply-To: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788301547; l=1582;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=hed7tQZ9wE4EB9oG+ZahRPX9rCP32f7BEno+MzTPrU8=;
 b=SnksoFYlciLBvGI0JQ+P79ACG/MeZs9AWRR7zIf+2vDB/Ip2ix8Erv1b11XyyZldiaj6oITBd
 yRpDMg7e62yA04ZgoUtk6Dd9ciVgwyODRSI1rLxp6BRPgIqbquq6vLw
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB319484:EE_
X-MS-Office365-Filtering-Correlation-Id: a4769234-fa27-48ff-f556-08df08780da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	FzDmSx9lQzHiy3FmqovLbpxGxlq6lH6aWO+LnA5jEdwRUTudVaO2SVkGQIBVevGYRGHT/kE4m4h0YtsY1S2e5POHD5QsRaJ5dQ/btbzBLeSZVrntaasWuD08Kw1i9+6LR8lMcrj+7jNtEx8/cv1jFlIjcHcQwKHAT1Q23B/HTF/iViLXicUEuKr8d6TOcfyJVzNZkqmy8XGMZ6MkVarAzA8t+E+VLNMkPbN+8Q7HWV7erBQCKIsBOlJWngKIN4TkbJsEfeCi7f91R+v4Jm1ACAWDIGCYGeW/t0N8UpUlehGo23GWIDABVJDWmSLx/ddpDR2lDg0tNtAK+cibXreFw2UUTeSEk2LPU9weBz0XHwFqvGU78KmlTWIM2c0J/h93ut9sSNGNr95X2QtZWquBVeIkf+B+Utq/2rebJjDBZU6Cb1WtPSEzBSkUkBLe+zqNX8I/JObUowbma69F80F4QeNmze+HbA9zW77rU8/QtKpm6kWCWDNMf6ebZRJTVKIO4iRsn1ia5aWdZZOckSBCQQliStLZGJ4MDfOa1OJPorHDGQ1F2F/uVBEcEkZldHfTKo2ix2xT6eYn9GiX3DQht78E+mw7L3S7bbls5Tj20i4Vd3dcB/xLaF4scLQ0LMQCnFpeviTnoq3/NsV4TEtc7MzQ+AGxCqgeFjo5+f8wTSk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkxFK2VURk5sdkkyalhsdDlpOW9ZWno0UW5oUGVpVHlkNUpsRFJ0S1RwUXlB?=
 =?utf-8?B?MEx6Ti9iT0l3SWJxT3A5Qk43QTR5alNzYzRGRjJtVjUxY3B6SDZJcHJxV0dJ?=
 =?utf-8?B?dXZLTittU0xlWmJBZGRIcXgvaWE1dkttdFBUSzZBbG9ZT1FqaVpkcHUybU00?=
 =?utf-8?B?eGF4a3BnSDVzRFR0SExQRHJTYlptUTdnUlIzSThpU1F0UXZBTTErUFA1VGNJ?=
 =?utf-8?B?dFZvVDZJQVh3OW5ObnMyVGFMY05SWlVQbWZzTllCcHhWZXFlby9CN2dFOFhC?=
 =?utf-8?B?Mzc4Yjc3dG9oN2pjdjVnOFgzb0pqQllOUkFNTk9zZktrVVhvaFp4MWZCeXJI?=
 =?utf-8?B?dkg3eTZCMndNcFF2a3cxb3U0cFV5RWFkRzl0ZEVWREE4a0VkcmxuUktXMkhW?=
 =?utf-8?B?RERyOVl3eFgxbkRYa2pGYnVaU1NIODk4SWp4a0EvNXBjdXVzYmtjeWJuVHRN?=
 =?utf-8?B?VjRjM0gxeStIWWVkbnQwV3k4UzRxTHM3MUhZa01uQ0g1YjhSZ3p6dzY0RFV6?=
 =?utf-8?B?dFdyek82eWFQdERlelY5THNIcXhUdURuYUZzVjJhekhQbjRnU05UV05NaFhJ?=
 =?utf-8?B?MjFHVFpOVVM2cWZ3YWMvckJuYjUrbjVvdmFnTlpOT0ZhaDQvcGRVWGVBRlF2?=
 =?utf-8?B?QjRidCsraERVZEl4RTRqNnJNUERReGNZY3IvcTRzREJkVmtLcHRhdzZWNjhN?=
 =?utf-8?B?blhsSEFjSlRyTzFmT1M0TWkwMEJuQ0JnNnhXdm1NQUptYkJRREFMVUhRbTNm?=
 =?utf-8?B?OE9aUUNjL0MvQVhsbmc5RXh2ZTJ0c2U4TU04TXVIWTRSWFRnRVJaSmVxZnRw?=
 =?utf-8?B?ZkVHaXJOQkZTakxZeTNod05udnBYNmk2bzZzeXB3Y0FtZEsxYjBpbEhWMUN1?=
 =?utf-8?B?b3VwREEvbUFVNDE4VGxuYkplUkVSM05ZbmtVSk51VHhkYnFVMjBXTjJ2QXBI?=
 =?utf-8?B?Mm5tRzJ3SG5DYkI4VGJVWmRURVQ1Tk9kRUxqMG9kUXVPektsOHB5ZWM0YXkx?=
 =?utf-8?B?TnJNWnNaR3Ewajh3NlFEU1JBMUdKbGpldml1U1FSSjdhWFpQM1BVVG9VVmVG?=
 =?utf-8?B?TS8yN2M0aGEzZmNnb0wvMldWaUFHUDhubFlpMHNhVHdTZEQreGFaUnVNZ29Y?=
 =?utf-8?B?TFBxcmx3T1R3RE4wTndmZ0oxaUJwdWs0SW5HQkpNTnhWcC9vS3laNzhDSTky?=
 =?utf-8?B?eXhZdlpHZExBSHFrVWkxT0d2cUIyUmR4U0x6Rk5leWt5S2dsSWpDSll0RWl4?=
 =?utf-8?B?QkdneGdzQ2Y2RlZFMGFya0kxTDVFVjBPT3NUeFAvZE9uUzMvdXlaMzRhR0pJ?=
 =?utf-8?B?ODZITllXMWRra0oxY0NnWkp0eTNWUk9Gdmt2aXQ4b2R6M2RveU81YVU0bC85?=
 =?utf-8?B?ajBkMWJnNmNETGM5Qm1Cc2grTWFSVnVVb1ZhczBPdU10Wk9tWjcweDdHT2dV?=
 =?utf-8?B?amVpNUZ4YnhSRVFFRVUzUk1BM2ZBYzZMdWJzYWxlRlJ4amQ4Ni9OTTBQeDVS?=
 =?utf-8?B?NTRJd1N0dkQvNkhjVGRuaG9kVzhsVVZPV21VSzY5UEU0NUw1Y1ZKeWJ1dkNH?=
 =?utf-8?B?ajNGb3VxaVE5WThCamJwOXMzV0xTTHNyYThsTkJnYnFnbnVMamtqOUJjeVJF?=
 =?utf-8?B?bjhWb2ZITmwyQlNTdTNrM2RmL1BPZHlTWDRPWEk4UWhiMlRnRnBWbElHVDhi?=
 =?utf-8?B?UkVUT0NtM0VRNnd2TU1naURqZ1BNeXhFKzFqbGlLcnRERDlBT1lnS3JoV29H?=
 =?utf-8?B?dFdOYmNFb1hRczB5ckltcW1NSDJROXpzSWQ4WlM3SEJNRUhoTFFOYkt5a2NJ?=
 =?utf-8?B?dmdNNjhlUFMyd1ptWjhnODNWdzBPQ2M5R01vb3J5cnZWdHpvaHhKbUtiNENt?=
 =?utf-8?B?VHVWYk9JOE8rYUtRdVg3dkRUWkVTR1NaOVE3QnFtblRzalV0ZWdlWTlVY0dv?=
 =?utf-8?B?WW5sc2RSWC83MkppOEI2TDZ0M0xLdS8rSzBBY3FHZ1FCcGlnZmFqRFlvVVI3?=
 =?utf-8?B?YytycVhSSFoyOGNVM3dydXBpeTg4MllWZlFKYjlIcXpDajgyU21NMVp6QVUw?=
 =?utf-8?B?Sk5uS0orNUtWYTJpTU04am9yL2RVUDhEZzBzaXdHYVY3a0NaZ3psbnhYUStE?=
 =?utf-8?B?UjROenBBM0JiRnh0RkM2T1ZGeUgxeUI2RWlVVldKM29wN0l0RnRpSDcwb3hz?=
 =?utf-8?B?MkZ5dXpPQi9SdTJwTHJ2YTI2VzMydk5oQXJVN05KcTh5NHBsZlBDcmtwTmZ5?=
 =?utf-8?B?WGNmblhBVFJ6TzgwVTQvejQ4MWM1QkVSbW1vZnd6Tm1mTGdpak9wb3l2clJr?=
 =?utf-8?B?UHNEOGxVQmE4SnFtc1Qvb1diS04zdUtMRUFkdzJsZnNMUzRrc2xoQ3FSWndH?=
 =?utf-8?Q?ZwSWxxieLcKo9ee6Yx0G7c2Xy3dpt1WAV5fvw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4769234-fa27-48ff-f556-08df08780da4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:26:22.9467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxgMqgDSCE3YnN65sDNpsE8VDsuLWCXmU7dPSnLBBoREBGulW8T2OeYdQ5ajajJlH6O1MhKITqqWGJ1Ujn/DL1nB12XojQqArVmgV26OMdWS8XwYykkGiP3YLmS5WygC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB319484

From: Frank Li <Frank.Li@nxp.com>

The eeti,exc3000 binding requires touchscreen-size-x and
touchscreen-size-y properties. Add them for both the B125v2 and B125Pv2
boards, which use the AUO G121EAN01 panel at 1280x800 resolution.

Fix below check_dtbs warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dtb: touchscreen@2a (eeti,exc80h60): 'touchscreen-size-x' is a required property

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts
index 94625d5d5918e..c6ee5f9c8bf87 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts
@@ -26,5 +26,7 @@ touchscreen@2a {
 		interrupt-parent = <&gpio5>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&tca6424a 21 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts
index b3cfa8110ade4..bd4ef091e412b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts
@@ -26,5 +26,7 @@ touchscreen@2a {
 		interrupt-parent = <&gpio5>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&tca6424a 21 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
 	};
 };

-- 
2.43.0

