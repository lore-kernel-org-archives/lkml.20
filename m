Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792723944;
	b=gHynV4eFaVL+4t8vuIPpXWwttoC1dxYgGNzZsNRpX9jm9FajEjSH0QgUBWEnE8wyr/kP
	 d7kipC5a5QP1ADVVBbPxjyp2G/NX7ok/BQ5bloFP7Hdbxi0zzRW2xezAWE6B22RRC8T0L
	 TebgqihHaqlKwiAFeA3kJJjaS02RD8qUIyFrR38TH9gi+xM/Zr6bYvi74i+l8mh4c7Obw
	 R4tIRyXv48cp9aSzj8QIV9nC9dHSRNhfG5u38ahkvhgUdHM3MvqCyQNklOYUsZY2OgOWx
	 j+YyLV9XwNTNyeOFYrOkKb2vjzTOoG1IoC9Tx3n+IL+a42Qij02iVJPfnVfiTlszOHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723944;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tHc+EE36FJ5iqEjiM4rA3DTQU0sd4fpXUo2/jBJRNX4=;
	b=FloJ5gIVF0rerFaYGZ0SQ12XVLNWXZQ77Wbq/jvX8vzCAi6UfjyWKjE1ONijDzYKPqnR
	 l8tleBXe+6BYUe/8QmwllyTRnZWGRAXraO5pghY79rkWZqRv+f68GbEl7WKsi9Y/k70R1
	 2d0bDyNmw2jx1Y0yhzMjrrCyNeuh5m0FoyT9MItNifZoM1RMvcZ0YCHytBTIK8gNa6gIE
	 BhJkEGDBeEEZpGg9wnjcF/R99PTTuPtvWnurcpeXCF+CvKUTWbUT5avkjrJKThebWuTPS
	 W291OVvDI49fd8wfUJt5h9n1FJAnflL/Sw3Ruz2PZIvhicAt/lki7xjBK1MlSuFkLeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N0BMgWlC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.11
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE898606A319;
	Fri, 23 Oct 2026 02:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE898606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N0BMgWlC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lH74NwdbHnBB0ckyqku35G10w9nE6c38pKG4v6KbWGP9kB66Sa7GHTZdvjY5pG9gJ5EXYHPWeAnFy/L6Fo0xvUSlFNsHHgZMxHC1WU6bm/zdhpZdigaFjL+o/SJDA1eVevWm6orHBd7EOAE1NPtaDwWgltnMeXI7/c1TDVz/5i3sZ4KJKwoE9GK+VPWAFuWgewZ+yYj2zPUPXz9rk0uRTa7CJwit9pQSLvSgb5SFwPOl/jQkMZrp4xgf3Hd0Ec3dqSJ3yt76dGNJJWPeSciwoEJRrk/jJ06pYFQcIkvTobNhN9zOid+CXxtaq2nz9MDq9tFDWn7ah2Vv5TwXYZpbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHc+EE36FJ5iqEjiM4rA3DTQU0sd4fpXUo2/jBJRNX4=;
 b=N7ZW5ZZFKOWZ8oLqDiltVxbc/NtqaYkV3Fus+GUf2MbgFvggTvjqevdb/u/3kJVteHtXRYEitjnJwXcIa8LRv/pg2weSeXlo3Qyr+fxKBgBqUMXx5HV+hnC0X0DP9moxxNIXM8EBhaL9UZn+YeFUCa+xQhoDUkXntuIy8bUp50b5z5LZ8pIfKxVhUa2Lc2BmDNN+qAveZSeVcXIXJoFqQPRbQ4YvBlTCsiGJ23iCxAaw8dmRH1lA5w4jAzrnrrqyTrcRbE438VnvlhNHNCYeXS8DTaDE449Nqu7HKfgdLqWy4sv+w12tfB3B2vXBT4F6xT5ANWZPsXL+8s/Rg0VXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHc+EE36FJ5iqEjiM4rA3DTQU0sd4fpXUo2/jBJRNX4=;
 b=N0BMgWlC625o2fUeWJoWU30TwGo3dofhGdckbVCoxzSXP8aMf5p3Tu5/G/s4aDT9SP0mXmUxHd2GcSO+nmdU8XGz+sO6ijt7wmdagqb6SxhPZv7WbxD4tsCOyKH+ncjEGkcgkuKz2t3Dw0t7V0m314qqhNGIXRRIAy0De8qm8wq3dkvtDSLdwZBv2L+2xMxds8nmAKKl+bzhg6PzSJy/PVDDqiIYnCyuWBK1IUFVOgaWMcRFJsjZiqmO7t5Ou5jbR/0lLvNDwp060e3FfUWVcmxr+IVIv3NXMXuFGjjRG1qmqfXMlm5rqh2Ttq1VHNHb6NWerEmREmonlLiNLe9P/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MI9PR04MB185402.eurprd04.prod.outlook.com (2603:10a6:290:bc::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 02:52:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 02:52:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/2] arm64: dts: freescale: Re-enable A72 cluster on
 i.MX8QM boards
Date: Fri, 23 Oct 2026 10:56:58 +0800
Message-Id: <20261023-8qm-v2-0-a8812a888e3c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrM2moC/1WNQQ7CIBQFr9L8tRigVmpX3sN0UeBrMSlUqKSm4
 e5CXbmcZN68DQJ6gwG6agOP0QTjbAZ+qECNg30gMTozcMrPjHJO2tdEWtFoKk+yRqEhm7PHu1n
 3yq3/cXjLJ6qlTIsxmrA4/9lvIivefzEyQgkfmotQstYo9dWu81G5CfqU0hfhKYjIpgAAAA==
X-Change-ID: 20261022-8qm-875d0b4b3e7d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MI9PR04MB185402:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a18981b-ea87-44a8-d23b-08df30b0a857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|7416014|18002099003|261022105027099003|11063799006|261009223027099003|261021123027099003|10067099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hgyHJ50cg6X3kCFxGhJWrky1cvXd/udzXhCguUONRLOyuBsIlddWcTEw+ECzX5kXkw9tnlffDXuMn1hO6img4EY8DURzwr4BsYY1GO3vPVXwb8cQ1qe7PE6R0RWL4XR1y6to3WJntLYChle5fWcEFJswMWviqnJCMplcyq7qghGPocOb6Ozyx4J0ngAU2GsgEB8dEYyexH9m3u82PrOkuVzcqsUMbB3vH8S8wXCzLcNnn2wENHRsHKVSJ5kAGWeLyOiqrtdvHac0HRp8Yx4Uuu9YP3ayK+5mRwmN1KCS/ujbfQk9YJL99lg7DLdeYXHiIl5YoQvHYsSW2jksbYGobreaF5jRz//O4ogt80TKnfP9nq4aG7zKprtMoQLhSOgbyJUdkBVHrGB71HnFXORj5307Px4864Tzs/ysBjDtjCduI0+r6RRnetPxY0Sz0rTFLgjnaNguLB0Q70sMsZesEd3NJDgC8NvYEwIYRfnbH/ZCbd16RJB+iAu6JKaLvlI260b2aElPKpQY10t7Hr8YJDK33f700hcBEjCcdsYa6+ovK681D1AsjhcKjohgPtAs4Jy356AqHjV7w0ipNXPb7gbHh/YJ/4GnB0Bzzf/X/3b2OOku0y7YKMsZT95jZ1mn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(7416014)(18002099003)(261022105027099003)(11063799006)(261009223027099003)(261021123027099003)(10067099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3orZFpUWnhUV1dwK1RpVzBrRzVzSm9PbFlSaUl1akpwbGh6Sm14WWp3WVJV?=
 =?utf-8?B?bTJ4aU9SZFRmZlZxOHJpb1FkODZSWDl5VDE1dVZXTzBNMFFGdjAzQ2ROMnYy?=
 =?utf-8?B?QkNkUGhvUlhTREdnblFKanZOSXNBOEt3Vy9sL1NWYmRsNGpENHBlTGJSbVpl?=
 =?utf-8?B?blJqSzJ4K0NReXVWcnBHU0wxUTIvcUxZR1EwSUo2REI5ajVOcjlqcmNqTSsw?=
 =?utf-8?B?NCtad2JuNDFKQjdabDVGT3hXTWxQQmFnaGhRa05rR1dTOHRKQU1CcEhRN1pq?=
 =?utf-8?B?VVRnL01md3N4VDBmY2M4TUIvR3RtNENTSjZMYjRmNkJTb0hLOHFYbmRaQ3o5?=
 =?utf-8?B?eXF5M3VWWEhneEJNdkNZS0pmeUxrSEFNcG9wVEJvbjNYODJVeTFBNHpybUJQ?=
 =?utf-8?B?cXlXK2lxeTJtR0NRUk1lZi9OVkVlbERya1pFRytBVHZVbk1KUjRwcFhDZGc5?=
 =?utf-8?B?RlV4andhZ3V6MTJnSXpvdDJTeU4zU2pKdmhwNXd3OVhaeGQ5cFI5V0s3dUw4?=
 =?utf-8?B?RkFHMkwzc1JtRXBITldDNFFLTk9aRWhoYzErSHFzWmlrWmFLVGljVit4ck1M?=
 =?utf-8?B?YkhjMExmUlZIRWp0TU1RSm04cXg2bmY5WUxnRjVFRHFVcUl0ZWhkMmZ6V2NR?=
 =?utf-8?B?UWRnR3MwYWN1VXVEUFFUeUlNVlJRNmx0VElUOGVXQ0FXSS9hQk9VR0V5WUlU?=
 =?utf-8?B?UE9qZVdUOHVmK3BFMXNndng0b0N4SzRVU0V4VDFBRXB6SWdnWWhBUkpDREky?=
 =?utf-8?B?YlBLUXY2elRuSUI5TjZSdHUwK1hxbGRRWVZHNWZiVU8zZjdveFk2OHZNRk0y?=
 =?utf-8?B?cEg2WUx1QlF3QW1yOVQwU2o0MytucFJoRG1IQmlWMFZJUmVRbW82WUZIL2ND?=
 =?utf-8?B?VTNZY3NjWVkzdnVPbFRIUVNQRWZhUUdQMHc2V2JWN3ZlMjZRbFd0N0F0Z1dp?=
 =?utf-8?B?bjF3em80Vyt4RGVIQkhFYm95c01Ibnhta25FNkRUVVdFWGI0ZG1sdDBEUHR3?=
 =?utf-8?B?dDR1NVpOOXJVUEpydlI1cWdxSWlmQXhicGFoUGxRcTBQRWVvZEN4WHhCNWNZ?=
 =?utf-8?B?aThDT2hpWnNXb3lOMFVNbXdGNmFsVVQ2Vm1HS3B6d1BZbnV6Mk9aNmVkcVRw?=
 =?utf-8?B?QkpoU2E0VVVZUmF3c3V6aUk5MkJyUjNaVnJESEViVWtFSUNQazNUSURTYmpu?=
 =?utf-8?B?cGYxMUdubnZoZUp6aXBRY0NFQkNsV1ZnMFZaSkUrR0tKKzBHb2FjMkM1Si80?=
 =?utf-8?B?MVp2TnBMVzQyS2pEU3I3VkVDZXp3em12VmhDdHJaNFpqTExyV2VUVURvZ0th?=
 =?utf-8?B?VjB4akVRQWJEYU41TlZ4VEJERzBLOEV6LytUQlVhaHJScFZPQWdBM0FFV2dD?=
 =?utf-8?B?MnJHQkNvNlpCM200SkFQU2ZTdFQ2aEM3aVQ3Sm42a3N3TzE0dlZoMWMwaURh?=
 =?utf-8?B?NTFEcU9rd3BPb2JxMzhGcVNpWDZ6N00zb1JpVUpHNnpXVGk2SlJyL0s3VENu?=
 =?utf-8?B?dHV5Q1BIeGhRWDVqbVdaNE5OTUlpamdQREZyZ3RiSXFkcUtNT2hmR2Fsc24w?=
 =?utf-8?B?QnZLelpxU1ZRQ0hTN0p3Z1p6YUJlT0N6N0hlWk5ZaDNGeDZhR25ZWXhFUk5p?=
 =?utf-8?B?S0dkS0o4c1o4VGV5ZWhPTG9Dc0pWNEdueEJPU1pHcjQzcW45V2tLV2d1MUlX?=
 =?utf-8?B?L3FmU0JPM0xJaEdOK0RkU05rMGxHUzdrRTAydVdWcGo1a25NT2Nzd092Qng1?=
 =?utf-8?B?ejBQdTFLNHpLNjRoUGZjM0V4b2RldFIzNU9ENkFXTy9Mc0l4N0hYS1NDMFJW?=
 =?utf-8?B?RG5BRVozQkJsMC84USt5d2NHdC93a1F4cVdIN2M2eDY4ckYzN3MrU2JYbGsz?=
 =?utf-8?B?clBkZ3I5MlJMeVFxZkhDRDgyZThCOE5VMGtxZzIzK0ZuSXh2T2FDcnFhQ21S?=
 =?utf-8?B?em5ndGdieng3QnFRN1BYZU8xUlFDMXVmSW1XUGZ2b3JVMzF6d1JZRklkaHZZ?=
 =?utf-8?B?enkrZEZlajlXZ3VZSGxaRnova3ZCMlVWZUpSU3B3L3NZWTZnUHFaZG1FTGZl?=
 =?utf-8?B?YjFtRnBGSVJJajlncHBweGlqTVFxbGg4MCtzTkdvK1U1V3RzL1h6YUtURkxv?=
 =?utf-8?B?U2xsall0NFZyaGQyNlY0bVVUWE01bEdYWjB1Z2lCNTU5dFJkbCtiZjFodXpo?=
 =?utf-8?B?ekVRdkJDTDJHR2l6aFJWZlpWZ2xRR2VpZFNhZFkzaHFPaG5FWXpUelRXSysz?=
 =?utf-8?B?WTRoM3YwcnJRbzhYVnM5cTIrSWFRWHoraHNoNHFpNXJVazN1K3VlR2gxTStT?=
 =?utf-8?B?OEFjQ0FXNU5rMXBGS0kzd3pZWExHTkJPdk5vbEkyWmdrN084T2s5WmdpcWpk?=
 =?utf-8?Q?irir7bGn0VGkjEYFdW8xzrMaOpaf9ISrD2b95?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a18981b-ea87-44a8-d23b-08df30b0a857
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 02:52:21.0359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P32w7VACZ1DiEl7gWcbYmbsgEYhVbAqnqveqo4BlUlbJt00ZjzmUiT0kyNbhvsGNqkcqdvB3u7XR12HpgXuCWQT1K7FGXPvITMXomoiQrHRtvVwjMVCYeO7df6NwtQyh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB185402

The ERR050104 cache coherency workaround for the NXP i.MX8QuadMax and
i.MX8QuadPlus SoCs has been merged upstream as commit d44e08dab27d
("arm64: errata: Add NXP i.MX8QM/8QP workaround for A53 cache coherency
issue").

The workaround addresses a hardware defect where the upper address bits
of the ARADDR and ACADDR buses within the Cortex-A53 subsystem were
incorrectly connected, causing TLBI and IC maintenance operations
exchanged between the A53 and A72 clusters to be corrupted.

Before the software workaround was available, affected board DTS files
worked around this at the DT level by removing the Cortex-A72 CPU nodes
(cpu@100, cpu@101), the cpu-map topology, and associated cpu1-thermal
zones, effectively running the SoC as a single A53-only cluster.

With the kernel-side fix now in place, this series removes the DT-level
workarounds and restores full SMP support with both A53 and A72 clusters.
The PMIC thermal cooling-device maps are also updated to include A72_0
and A72_1 so both clusters participate in thermal management.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- patch 1: update PMIC thermal cooling-device map to include A72_0/A72_1
- patch 2: replace manual DT node deletion removal with a proper revert
  of commit 5d20f1ccb339 ("arm64: dts: imx8qm-tqma8qm-mba8x: Disable
  Cortex-A72 cluster"), which also restores the cpu1-thermal zone in
  imx8qm-tqma8qm-mba8x.dts as originally intended
- Link to v1: https://patch.msgid.link/20261022-8qm-v1-0-2a597cb3debd@nxp.com

---
Peng Fan (2):
      arm64: dts: imx8qm-mek: Re-enable A72 cluster after ERR050104 workaround
      Revert "arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster"

 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 14 ++------
 .../boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 39 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi  | 13 ++------
 3 files changed, 45 insertions(+), 21 deletions(-)
---
base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
change-id: 20261022-8qm-875d0b4b3e7d

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

