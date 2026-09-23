Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4354D443311;
	Wed, 23 Sep 2026 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195060; cv=fail; b=DP2l0ZtgIewkSSLm33NAzPNg6yVc8IKsIaHL8aUqqHHXPUU3gUNgAgFbVXAsQgBJzbX8bJ7p6FruRtzqK4HxjadBZBZQ88p5eOaeeOraI4bFl+n8xpbZ+fV5Wso8Rr88dp0aKKUqGYH0OO2zOq/UKfOTh3+Ykh38wTisBwcV91o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195060; c=relaxed/simple;
	bh=MdWNGHuRZ+iustlVYbfwH+WpU9UMq+bLPKmmAhK8PsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hhjp0NvMh6do3sZVUM8IJEkAAKnHuAOG9OW4u2YtlUMlCpVbJv+nC0B3sYMpvBxA3TUgTjB4cgYSexDcbqZUo1t+bXKi9b3zCqVMg07BvmTxZ7BLt0VWRNOCYi/mlAQ6e8S+Gu6XKSZWqqUrkcTr83OmrxSqzg2BoGPZV9QqQlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UtZdzydB; arc=fail smtp.client-ip=52.101.84.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UtZdzydB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX4qSTRlO7itms1TlQMowGXdlQb78lY5bXzAS/Dt1btujLWfq0p0oZyRsAamAT3c2puxi5U+s1QbQqVRmaxThBe7fozkURFcgpcuRdK3GqK4mhS6TtZaQyrxEbC7ybu5aDG4s3sr54N8HDs0L1Ov1wBfCBWzyND0MM4bF5cFnNr0zlZXtOt6DrdYL59liqOw1kXu6mgRYXnez24HmyQkX65ZI3UvXCEDHXozFlSKVOmpP4TQyq3sOduth6StbasXedxJzxFaOFRb35V5ahJw9J61DkVkgOSnND5rgK2gKYWrwlp52s9xOf4QxyjbG//zvTflPgVDdgof0EMHZRr4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNaxxXXPvtOmT6KakgHQZNtB1e6SHnE/cUrCncXaa6s=;
 b=llchWVszFjQSJSCQJPKGxoPqNjJdHyiEXc6PJC2/4+FYq7aurPxGfGFbSxgZha6CONkn+eBeYwV8FmwcUcoQ4cxYcHJ2OB8p7MLlTnLTMldSIj1gjgVz3H9CeAW/Dy/nDqIqKhMTaokucVUm/mjAajTrl0wBtd2G7P4PLg6981ZRJfDbquXjll34dkOt+PShdL9nvjRwxGj0JFd/NovTtm5CeP5lYlWqHEnT6RnS8ycg0IfL9FkNg2tQAMuoUlC4ZA/wX+rcomoYeZuOIKB/J2VItOI/glT7wXDz5Vuuhjm/LyA/pmlC7hbNOrNyhOwSSHV4X3D4FRjXSUrwTcsOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNaxxXXPvtOmT6KakgHQZNtB1e6SHnE/cUrCncXaa6s=;
 b=UtZdzydBtvuEfYr7ypHf6e1gs73tRuRyovYNU/bGCAmp0sqs42QBuz3Zky+kBNLOzp64E1gE/f8jqioB9TY56dpybzKvnn1vZa2lwxc3/MRukia8CalVhvq6xKKtHIrXTQYDQEAk1u+1B9FVNUSFbup3UStkgPXoStPgrGJx2WI8lFlJnvauqtx77Thv3FdTGhzg9kAGRDtp8TiqE7VpUo/PR/Ga/3i+FHiopE6MOY9X8fB3/2T8M959HpBaJgkURLfFnYtwRTgErT4cVUHMv31NRpZ67gdGhyt3xRzUXIKR30NLF4Ycdvt4tiieMWMDENznEYv+ycG3/ZttTNJHkg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 20:24:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:24:10 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Joy Zou <joy.zou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: imx91/imx93: add rtc1 alias for external PCF2131 RTC
Date: Wed, 23 Sep 2026 16:24:02 -0400
Message-ID: <179019503861.3753202.5641676911933667829.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
References: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYZPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:930:a3::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: ae314c8c-934d-401f-5c54-08df19b0a035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|19092799006|366016|11063799006|56012099006|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b2AfH1o8fvyog1erqd2KwRQauvokQy2xL0/kqVNmgjm7FSwkKdIbPOuyAqlomWH/Go2MsIwysQ+Jyt5qPzm0DtC6GdODxEfTRvGSMZUDIq2VSnROZKYTOpPNIwaWyzf0oRzdpW6Xfv+vOc8RJtgqECu+0aKtZkf3ZBaFOC9V+N+N4UGHLSl1iZqdAjshwlRRRHS39d/G6AKt9xL7UD3aOeLUWmBOKD5JSOO8uIvqNcDxxVOweOYZ0RHhopTOoPrCr61IwI/2qLYpJjSKNqBPE1YDQeEkYhiyftvL3XYwp8k/KR+SRejrVAAKqar1IC3VJZzgbGVNEOdk59Yq4YL8BYkw5RZH0cHv8AoSGnqfFVFrTqSg6qhNvP8hZH0ASBRkdcFqpTOqMvk54ge8qV/hrBV1vSMeOEqewXdi7lXeck0gG1oNhjEiEiA6k6szDTCK8qkoN8TYXH9I8moizRxOZHdH7xpH3XR20RdRqjdvxKIXNs4CVXDK//f+P4dv3ZpJuqvG1f7w5YLmSSXGweYIGn0fYhDgtErGXmrOgjuXPcHX2i+6+zTs75JQvsRghkGOxuAGHAtzetZwd3hRLteDdSkQi44gGAxeBl1Xgm9SnBuCjlYfMl9kq5kAXg+uobzqHszVBuL1n/+SRyK1Md4Q0F9jTgi/VSdxIiLNOe+pr9IsZQZdX63YEHrI4CHJyxDwItvbIheONwZDWWbGAbxZsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(19092799006)(366016)(11063799006)(56012099006)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW5vbW1OdnJIelhDcTA5WldoQzYwaGF0SktnMXNEMzNKU2dVcEMwYkNEQzZN?=
 =?utf-8?B?U2RoL291RkNoRGF0ajVpbGkzK0ZaOHJGeGtrY09iaitTdEo0Y29WcUwrWVhp?=
 =?utf-8?B?YnEvTVUvZ0RwQmZPN0pKY3NjUDh1YzJrb092SmdMTWJzODF2bmcwS3RIYS9O?=
 =?utf-8?B?dVIzb0VUT3RNQWY0QVN6TmE0ZE10ZWpseTR2WXNpcldnTVpXTTdVZVBRakpS?=
 =?utf-8?B?VWxyZS9ScTdOOXRHZW1VUkN0bkF2ZFExcCtEbmVGSVAzbDVFNnZabTNhMWI4?=
 =?utf-8?B?MVQ3RU1VMllSRWZkbCtMQUlYd0w0R0J0dlpXVUlLR25zMVRLK2V3aVZpV2FC?=
 =?utf-8?B?dGFnVGpSbWE0S2pGckRUd05wVzdpTDFDaW9wWXdFYXJpMmtnWnhiVHhDb1NP?=
 =?utf-8?B?UE01OHd4bzYxWEE4RndNdnQ1ZGhkWXlhL3d1TWY4enJtTk1Cb2s4NVJPaDRC?=
 =?utf-8?B?N3BLVkF3ODZSdSsycXpOM0k5SVBLcCs5aTZSRzRUeG1wSEFVY29kUmg3M21x?=
 =?utf-8?B?allzTkhLTGE5cmhRNEFXandOZ2FLZ1pBTGgwRFJwdzc3TEEyMjdvdzBBanFo?=
 =?utf-8?B?MG1pWFEwdmdPbFhZZUtYeGJGZGpWbWZIbE1aOEUwVy9paEQvM3NVaWdCTTRG?=
 =?utf-8?B?dEtPeEZJWGhaTXdDZmRaTER1YlNHbWdCYlJFYzMzQjV6SXRaRFNzQ0JHWWU0?=
 =?utf-8?B?b2l2dWZiUzBUNnN0Y0FZUjVBZzZlWmVtWVhmaTk2RW90cEpSTjVQSlgzeGQ4?=
 =?utf-8?B?aU5mK09mM3hnU1l3UzhMUTdVOGw3d3pJVjhWdU53clNuUjJqZzZ5enEzSlov?=
 =?utf-8?B?VyszK0VuaW5oRlpsWEszcjl1VXhpb0IzQWFNaHBjSGJZVDBBYnduTEdMS2Rl?=
 =?utf-8?B?STRwR1VoK1BOaVRoakF2cTJPbWhYZnI5TmJZdC9lYjE2WmZMN1RhMXhNQ2VS?=
 =?utf-8?B?MjZXWkNOWXY1Zys1SXkvZHlvV3BBSCt3UUViM2UycGRaUUVhK3FMRkMyNU5Z?=
 =?utf-8?B?ZUdnWHRBUnhYa0VaRGdQZEZMMGh1MldjNmhlSFRlNkN4QXluUjNtcDBnRDJ5?=
 =?utf-8?B?S2FRb3BXemltRk1IZi9Zc1A0RVFNV2xHTjhURUxIWmtoMDVwZGtRSFFmNzBa?=
 =?utf-8?B?ZXlRUGtyUStTdHBuLzN5QXFuUU1YbnBLV0hzQjJKaXZoaDQ3dktWZ1JlcitD?=
 =?utf-8?B?bjNKYVhJUXcxTkxtRmg5MkJRZjNLSXcrTjF6OVkrZFBORlVGR3pwVkVhdFc1?=
 =?utf-8?B?allhc2tzVUg1dW4xcjFaSVZvOUJMRTRlUW11VHF5cXdxYStWdE9LT0RVU1ox?=
 =?utf-8?B?Z1Z2b2ZSZ3RWM1Nzd1l5c1M3cWRVR1hWQjBTenNiUW1lR211b1dodGM2SFJn?=
 =?utf-8?B?WDVLYVpMK2tINURDWThaWFJRY0hhWFFHcXh2dUZwTzk1OFRNMzc1YnFhSzRx?=
 =?utf-8?B?dU5LZ2EvN1JsVU5KcHh5cGNXN3B4ckVIZTZsU0RNNGVRUUk4aGNCQzdpc2xD?=
 =?utf-8?B?TnRaWkpkeDFPc2M0RnNyRWVaL2NtNnBrYWFjandRSFUveHF3ZittaXpRdi9G?=
 =?utf-8?B?bkpXZGxVVldLcmZxYmdSNUh1dEVMWlhVQVBTZlhTQkNmWHB5RWRJUE82aTk3?=
 =?utf-8?B?d01BbU16UVpCdjZEOTFuNXJyeVhWTkJvYlB6TlJGZmJzRXlIS0x3UGRJYXhY?=
 =?utf-8?B?Tzg0WGVUUkdhRTRub0g1YWtzT3VsMzhLMDJtVlFqWlBrYkM4cGd6ZmxqeTQr?=
 =?utf-8?B?aU5mVHJUL2tReWozRUZ0ZWhuRGg1NVhlcnZzL2VpK1BtN2ZBN0lKKzVFcjdQ?=
 =?utf-8?B?SzB4THpaL3dyUmpFU1ZUaE03TFZ3K1FpVVlnMFNwcmxNbitBUzB1QkNZcGFV?=
 =?utf-8?B?VXV2cVowTVZvaW83emxUZXVJd2VzVU42aTZvRERPYzZjbW1oQXZRalFickNu?=
 =?utf-8?B?azZGMjlOYk9JYVJVeXhudHdycDlmVko2bVhkYTh2c1Ftc2N6ZTVXU0haU1Zn?=
 =?utf-8?B?Y1lIZFFDT2IxZGROZzFIN2Z4dTBUR3c0Q29rV2hVeVNtNFBVYlRjMW1NQUMv?=
 =?utf-8?B?M0ZsbEpDTHNpdXgxb1RUYU9vNCtuUlIrY2NGSVhuWkc2RjFSUDg3b2NlSG1t?=
 =?utf-8?B?WjJwanZ4NTJzZkVUTEU3bkpBZ3RKSGdFK2g5N3lEQTJEbTF1a2IweDljaTZq?=
 =?utf-8?B?TEs4OEd1S3cwaW45bmlndHJJOEt4S3M2UlZuR1VtNDkwTEpiaHhYamlVdTAw?=
 =?utf-8?B?djBodHRpTk53ZDdPN1NaM1NTZlBXYlNpTVR4UlZEbktreDZHeWNkUGFOVlZO?=
 =?utf-8?B?WE5KSEpVenVwNHh4OS92SGNGcmNzWFBoL0krTmJEL2lETHlRcUE3R2Rxb0Uy?=
 =?utf-8?Q?Pwx5zMcUjlBwVpM8s+kEpoZ70OwgeBKmEmLbz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae314c8c-934d-401f-5c54-08df19b0a035
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:24:10.5998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2OYlycQ2NIfxB4i2LiFryMnfs8tFkWkxrXxkoo4NZFY+/MOoT/oncDI1lrzIeUmWdRCWt0ciL7XkPiyxpgL/T3omzqs/+Bp2Mpi6SKKu/oGni9EHCLTAXxjaCEHmc7q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9183

From: Frank Li <Frank.Li@nxp.com>


On Mon, 14 Sep 2026 11:21:06 +0800, Joy Zou wrote:
> Only rtc0 was aliased to the internal bbnsm_rtc, while the external
> PCF2131 RTC had no fixed index. When both RTC drivers are built as
> modules, the pcf2131 may probe first and take rtc0, pushing bbnsm_rtc
> to rtc1. Since suspend/resume wakeup relies on the internal bbnsm RTC
> being rtc0, this broke wakeup.
> 
> Add an rtc1 alias for the PCF2131 on the i.MX91 and i.MX93 EVK/QSB
> boards, so the external RTC keeps a fixed index while bbnsm_rtc always
> stays rtc0.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx91-evk/qsb: add rtc1 alias for external PCF2131 RTC
      commit: 92fd18d609ff13e27ab9d19c4764633acde593ec
[2/2] arm64: dts: imx93-evk/qsb: add rtc1 alias for external PCF2131 RTC
      commit: fa7d47a05b464c5ec3af39ebd06b8b73abaa42ff

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
