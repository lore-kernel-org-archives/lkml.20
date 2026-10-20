Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792465232;
	b=LT96a4WSaZDvZF69iGePI9NXw1wY5LT2HDgqJhOVamAvuD4cP6zgAHxXJiVD/ngPk72h
	 SNRf1N9gVhwvK+0LuiMs4qucQpiRM/0ONZbvYmY3O2669T32eaGvk2aWGRWyBU0TYOsZH
	 aTJx3WahKmPfYSLzzCNEvym9feLhTmZtOZg8KtuCwonmu/ZS9IYub8aolqXYb3NCv/wnP
	 s57aukXOT5Y30L7kNgBNUAgI5SOpcjg614lrE8A/9bxjeDmtpDJcUOsYat73QQcLZIf++
	 zqg/MfiHUk2/rkDR0foZUT6K8DxNFNuF+1qa8tOhWU7mGkmnPfG5zB36YjaYLXXGOhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465232;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=vXf2PRBtCffARJRCksY/U1VwasnAViJ7bZBXAb3Ni48=;
	b=19YCQyN6iljoOEye5lJBSLEjVujaulozCfeu5Cls6RXH01OVd4EaC2XOPY2AJeZ2TD7Y
	 z+BLqO9nIqxE9FCKNDsrACtU5rrhmztT1IS8FxsCG+RUiAIrBNYvtotMCsOinDoVdwzpq
	 uFR2Iexm/52VZkav4DR0263T5I7hmahhn/r1zLBYRabfl0NS/ayq/DGwqzecqyD3uO38y
	 b1FJmcorkCMOpVmRirAOIi6LCkwWYwVYvhHPAG1xiHIsiIv9MHc51LdBtXRRnupfxb7FD
	 eNFRrDi9TePuB54uLf2kXJdYh7V6+oSUVBvgQJvsDtZmwqubzQAaTluEC9dQeIBAvtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wO92w6n9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.65
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F2606A31A;
	Tue, 20 Oct 2026 03:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wO92w6n9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaOQpP62P0KA/tgA0MkcpiM6YLcMTbxo/fdyzVh8ZVAVaPrmVZNmuhkVjyPaxSWeC6j/K954wmkB/Kstu7bmc+liEJd6NKZPGTmiAw37YeBtXfBpkv/DpzuCjgXIWs7PcPnoEmetxXSIDSwt1KSPRHkgb1qmo2tZ7byu5i4XG6npweces4cFA9o5CMYzt1X+sZELYb+vXHJnJIX4mlA+KsTyNYXzI+9oLG4flm6ei+Zf5/XON+f6lQgtniPpLc/Nz5YvUzLEMJWeTMG2A5AmgnVPwPHka69XvXS54H0swKXdf+Q1WN8wXqnuiFEZBiwiWEegWRh/S/oxNmWsrH2tpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXf2PRBtCffARJRCksY/U1VwasnAViJ7bZBXAb3Ni48=;
 b=H4hwyOaPY83gEt6ylPz5HzAOU+toocvMUjaZknCDq9PdwfIVPZHKI4aXoDBq+cBS6tUy7XBgpdS+1weySA622XvLCtef1pJnXGMG7xhoLYYD/7B6GsO1fdbV8YMDdUT9dF6XMqY5dqcoMVLSANjw+meQN4CVFQuBeGlQV6NI7zIWXcBPl654dUESJJ0jqeJ1r/2FAMTgp0OHTHnX6+JYukuMvOC5ja+ln5q8adp4rVh0j2QwKWso/unxA7ZNsmVU6sN4y95CJHyAXxUlfPW+C0/Fl9qXwwCwMSlKoYAWDqt1QPLEY1LALjXYjS8mUA+L6JB6AlH+wKWNfYx3iW63zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXf2PRBtCffARJRCksY/U1VwasnAViJ7bZBXAb3Ni48=;
 b=wO92w6n9BVm2V+i1pVwyYWws6WLPOLEo2KvgjUkRpI7nj/SFnJeKgGFhmMzYGpeRHPAzPYxfSvu6YrvzopwPPy0nXypAPkiX1op+5dSOWbYuNX9MxOXX2rztHO7N3VZa1mLbizKRgx92M4spWjOsFpmGuRP6SfDcKCu7jiVrc3XhETc0lGXEK7DFPIYW38N27hiNm7TQewgDhFEWbyH2SB6vYu3EOl89S7doAnMX3W4aaZmrJCrikAfIm9HhQljmigZk/a9ERmxLQ8tq5Juc/xXGzKhkOrGeV60oFnf11d4MmLmOtjbPYWhsrM6BJHn70Vqur5rAypRPTJYAfWpj+g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AM0PR04MB164874.eurprd04.prod.outlook.com (2603:10a6:20b:807::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 03:00:28 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 03:00:28 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 20 Oct 2026 11:04:57 +0800
Subject: [PATCH] media: synopsys: dw-mipi-csi2rx: Fix DPHY testclr reset
 sequence
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-dw-csi2rx-v1-1-c58a2e5cd43d@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIAFja1moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMD3ZRy3eTiTKOiCl0zIyNTM0vzNBPTpCQloPqCotS0zAqwWdGxtbU
 AeuzowlsAAAA=
To: Michael Riesch <michael.riesch@collabora.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792465507; l=2164;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=nsDSCw79V47dREBnaEHxEbVb4bN6njIp1F2cAEj2W4w=;
 b=XlwO6xCsHo0Ts06fboyElq+ZETEjyL7JDkNF9u4Qsg+88G1VbSAxh9U2o0qZnQVT5pVGao0qN
 uYVRuIxbv6RC5c5k12eDexLbX1a4W+WbaVzRCk601svLlLWO5OJ8Jcm
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
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
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AM0PR04MB164874:EE_
X-MS-Office365-Filtering-Correlation-Id: eb93cbfa-5866-4bca-98da-08df2e564b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	thvenrdJYgtavdeTH0VH91oI5ep9kabkygLWZpr5XVj6YL+SIR59ptwypVucrEn8fc6RhluruZOlua5WyLx8jSOEjXQoyK5AT4TyO5rZbvJ2e3jT5aszNBwwWZXarKMQAK/wDpQU6eoV27RtCfcERFxSQISPee1gKdeN8+HNuQTNERFMK9ECIgiX7iQ7hp7Oj4y1VuT6uoJtrpMtCSgBGXZPjXobzrSc47kKdfmDmIsR3VcZ98qYsdA1ggfs7qZrnNf0RUskCE5Sah7dWKbxXFvC4vCOMC2CqYpVobHp2lhQzn2MFUt9bqlXZhbP6fuW0+TUY37zmSrNT3jVZOxU3QazNOW9yInDAVH8PwXG3uectq5EcoFQZfXWciq/vmgOYlEMsAQV44h2m+g7Q5ic0pFb/6CypyV6PfkXcbBbzuvB2Le6h5VO2lXP1LVS0ImaUZ38VKyLToX8zw/3Rm6gr9FYhxQBXUpqXBdy9kbY6ii/8e3PD5m3ngsAxLm5FcL11SbsYtRDu5OSvFvWKEqzjff1HNbnHG2D4u1hfyiQmPUUuCvJWYYmBdT1zvEygz4HEV+yxIISF3ftHo8MUnxXBi67CLL6AJoLHrKbwoq7udCZY9A7RbdP57CdUpGHV4PpHRn9mO6QoJgbrt0wTMhX+L2aksQw7ly/hnbnQnTkUu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2pxcTFBSEd2QlNUeGtUNFNSYzFZNVArVDluSWVveVk2NDh1UXplMWZ5a2hO?=
 =?utf-8?B?VmlMUU1veEN1eW5wNG5FOHhpc05aSU5MSWU5RGhnSkp5RTR5WldTWmpwdUM0?=
 =?utf-8?B?bVZPRkQ1YXdBOUhyZTdhOElhS3dBSTNucmN3bGhjUHhUcktMdngzd3ovQjNL?=
 =?utf-8?B?V1RBZzcwNUNNZllCbkV3SENlRWhvbDY0SEIzZnorbVNRYitCVWduTmJSOEp4?=
 =?utf-8?B?UVd5L1RvMVRjYlVFeVRGQzZVNkx1WkxlajdFdVBJYXRoUDhIczVmMFpqaERJ?=
 =?utf-8?B?RzhtUHdzQU9xOE5zdCsxSHQvL1N6MnZVT3AxU0NVOHR5RlJoeGZ1OHl0aWpi?=
 =?utf-8?B?NFFXSE1VWm01TkJ6NHlsTThtYnlGSE1EanR6VTk0eWN6dGZvOFlKNmh1cUZM?=
 =?utf-8?B?dVBpNmgva2RhNWNramNzNUxzZC9vNUs2MWtBUlRnSkpxK1VvYkh4cGtJNStu?=
 =?utf-8?B?TytpSTZuTVI3a0tmcGlvM1BTMFdnaGQ0b0NOdzMyV0NMYlh2KzNheXJuWkNi?=
 =?utf-8?B?WXJmeU1zM3Z2SlUzQ0dMLzJ6NWVsTUNkb3hlcGluS2VrQXJzNmlEVy83VFk3?=
 =?utf-8?B?bzhOQWpGMjhSaWpEM3pYSzAyZExzcmJ6WnZLMGpZclloSkpYSWJ6UGdiRXY3?=
 =?utf-8?B?L3ZCeXlLNSsvSFNpSmdTNWRPWDQzejFFWTh2SVRpd3lmWWtNWGIrd0p2b2Iz?=
 =?utf-8?B?MXF1ZXlFT0hac3UwY2pxdnJDTHFXMDhKWXFPRCt1WmNnMWYxai9wb1E5S0FI?=
 =?utf-8?B?ZzFJREVpUW5WeUVMbHA4K0ZXUmo5djJRbEttdTlEbkg1ckVSRlp0RG1Lbkw2?=
 =?utf-8?B?Q0twYkU5TDBOZit4Z3pWVjVLbGNxNEl3VUdlSHlVd3UrMXhGR1VQWllLZHpn?=
 =?utf-8?B?NnBQMUN2bmFQQ2FvaHZIUk5WTVpEOUFXQjFTcnRxdkwvVzZNM2hFZUFWc1NV?=
 =?utf-8?B?V29hT3NCWGZ4TUN4d1ZRdGtncFh5OHRMSG9hakE5RFVvWDM3bE1ibWdXbjBS?=
 =?utf-8?B?Q05BSmJRYm5SSmtUZW9LcHZQUGo3VHJ6TnlSbXJxMm93R1A4TDlITTJhYXBv?=
 =?utf-8?B?NWRLNTlRK291ZDExdXZvYmxMZFhibzc4L1czSytMSnhzcHlFaDNnS1hkNDkz?=
 =?utf-8?B?c1VwUmV2UVhsdmhWb2FlWnZyckptV2lRdUZ0Rk1YSmZVbzdhWVdzOWprWU5U?=
 =?utf-8?B?cVVPU1FOdjhJOTBlOU9QcHcreHlhcmhZRFNPY0RaNVlqYkpxb2ttbFZDb2RN?=
 =?utf-8?B?RmJFREFSTHhYcFpFdXZBeEc1OHM1b0VvekJMNHJOUUdKTHAzNERIWWwzd2t0?=
 =?utf-8?B?azJKOW1tdzMvTTRUS3RvdVJPNE95TEg5T0RGZnBSV2IvajdYTm81ZGhKdGhu?=
 =?utf-8?B?a2pyQTZOdVVaa1hVUWxUcjNNNDc1UXFRMHRoWndMVUEzWEpOL0Y1MWJtSmdo?=
 =?utf-8?B?UnJrTE9hbzJzK1E4UGpoK01ZSStJelorRm16MDZjKy9IZitEQ01BeWFsVmZL?=
 =?utf-8?B?RDQyVHlMYVppek8yeUR5MmpQbHJsSkF6Y1dQS3QyYUhVZjVlV0FkYWZ1elhM?=
 =?utf-8?B?dGZaWjRzM3E0bGdaQlovOW96dHRueGN2S3JlYVZqcmJNd0lwcWIzcTFVaHM5?=
 =?utf-8?B?MU5vVHpSSnNxbmNBeGZ1THdOOEswZ2NjQTc2aXp5ZVdkbExwODcrMXh6WEIw?=
 =?utf-8?B?T0lFUGhMYWkxNTc1L2swSVd0RlB3OVQxTE5weXNERVhnMTV0Y2JSMHFsZUpl?=
 =?utf-8?B?VnR1NWRjRzVwQ1ZMRURIVmF3SVdhYkZRZ1AzTC9GbnVIckNya3NpTDdIeGRM?=
 =?utf-8?B?Y09GTEVnOWp6ZGlteHZaUWZvR21NSDN3Tzc5TzMwYXhGcTEzaE4xd0hjOWwy?=
 =?utf-8?B?MkluclF4Slp2Rnl3UEtJUFNXZklKeGw3WTllVVhBV0pINXVMbGRiN1BZTEND?=
 =?utf-8?B?UEtjMVlhSlhDNkhxUXBjS0pGNzlwdjk0bTB0ZUl2WEpDOHM1N3dCaXdhM1pD?=
 =?utf-8?B?bkM1MGlWeFBzUGhCcnRCdmkxTjh5bVNMelZDOVpsenVubFMxZVlhdkRkdmVE?=
 =?utf-8?B?UndtUTBFVGNMMVFlOW5NOEZyNmsvTGtiRmljenZqZVltYWpodDFRUGhxd2JU?=
 =?utf-8?B?aDYxc0dCdVhzT3pmVnZNZDhzWktNaXlIdUhkaFJGY3ozVTAzOTRQanZTbGRm?=
 =?utf-8?B?emxZbGZsQitBVEw2cHpsTUlaZzJuT1FxakdkcVI1OC9OU2Ixa2xNUGk2RWJW?=
 =?utf-8?B?OUE0S1lzTWkwZmluRmV6Sm5LU3RVVHBrMTEzWlJmRFAzekJMaUtidmw4b2NB?=
 =?utf-8?B?WlRhbndpSlViTEl5V3h2a3pObXdOUzIvSzdxMjFzV0FEa2tUYzE4UGtoSHdK?=
 =?utf-8?Q?NQc0nfeuxFWY2Xm48xJ4tVaje1hK+w5eejZos?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb93cbfa-5866-4bca-98da-08df2e564b98
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 03:00:28.1346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpsWYM0b3f5dqDrDN6Q9wxk93NJvcBpKfhNSSnUpHEiHc6YfwFBTRBzjKOPj0EjyI3MtxMLOpMaLoKbACAGmo66Cyxy0NRtDd+VWWPcsrTXggjtPSOQy8cxDl4SaGtt5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB164874

The Synopsys DPHY datasheet recommends applying a testclr pulse at
first power-up to reset the PHY configuration to its default values
before any test control register is programmed.

The existing code deasserts testclr first and then asserts it, which
is the reverse of the sequence recommended by the DPHY documentation.

Generate the required TESTCLR pulse by asserting TESTCLR, waiting
for the required pulse width, and then deasserting it.

Fixes: ec40b431f0ab ("media: synopsys: csi2rx: add i.MX93 support")
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index b7247d597c9c..b9f7ba25bd3b 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -830,18 +830,23 @@ static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
 {
 	u32 val;
 
-	/* Release Synopsys DPHY test codes from reset */
+	/* Put PHY in shutdown mode for configuration */
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0);
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0);
 
+	/*
+	 * Apply testclr pulse to load analog programmability defaults
+	 * and release the test interface for configuration.
+	 */
 	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
-	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
+	val |= DPHY_TEST_CTRL0_TEST_CLR;
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
 
-	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
 	/* Wait for at least 15ns */
 	ndelay(15);
-	val |= DPHY_TEST_CTRL0_TEST_CLR;
+
+	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
+	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
 }
 

---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261020-dw-csi2rx-6225697f45bb

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

