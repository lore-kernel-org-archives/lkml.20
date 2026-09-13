Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B5D9463;
	Sun, 13 Sep 2026 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789299635; cv=fail; b=mLGOnnDOCvyk+gy2EdQXiLHTrU9IRBzPv82ZfsyGOKuRr6b1JRl9nFXUI73CPUAPlHq8M1esHtC19dQOwwJGhfcFbjBAlA8mgRe1XyplJB+0gdjbSUmwVj8qaGsZ5jq0Blv1LI+kfma5mDKaSqBtV2LMEuwL6c9o9rEAxJAS/sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789299635; c=relaxed/simple;
	bh=H/O5XZiM5NdXPrDe0YuRRpD4j7O6lTDh2dmdzSto/pM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=SBV3Bp9ohodlZoM/+qVT9dYSOQGf1yHSSOfh+DA0TozdtxrED6W0bJ42Ay+yO2gGjJn/JdXbgy19c+1HqXDy9GkRaQ1hVMxCcsahCfO3ef5Bx5DebUR92yRLXNE1WLesLyYYXpyTIOAgo1e3MDzb39iD5xz+jQ0UE7nGnI6foqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=PAzwJj79; arc=fail smtp.client-ip=40.107.130.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="PAzwJj79"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wm0UAoGuSTMVAqhYS0P5Qrfm+lwzk4F27NvDi0p6ePhzVVJht976OcaBhk1Cr3gIXeA/jDuUW09qkBv25iuRx9JvYlDMzIBGIVS07AoU3aaU1IteVhkeLAE5obBsWdMXE4LeDvF8h6lqk1mD5dDOXwUgUV1bkFSkfmRvdoBL/XgHxkku5/AQYvIyLwBH7qgrKhnUby21jFdOvx0C83alZPulAOYE3r3H4n5HV4Rshkl8e8/Ku5zzE+FrTT5KRKasncUtstULQzYXRQMX83FlM5HYh2vIwfFjhY3cQdwmvzioFbJjppEfd8Q4VuQQ65Ciw+ci+xmQCmvJIqnguAtnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDvByJWx7UMu6NcAKmle/BqDNkyu6OYU1XWt6z7vBAI=;
 b=FLMPirB+kGz8LFFOKdslYVtc59ih0ZG3nO875S+HZmXL0iXPH2wfX0pTNnnMJr8uJMDHNrsBjs11Lq1iMgBw6BKVxciCny59Mx29JNDKCMzw77mrI6jFYAcwej49RwsoDYz2TqGNXHpwryiqN0rWx++SVQWJnwuSreLQREMFvfW1YPgs6TxAPAVXbx1rAnviDmcqtRXD55LHYT/aZyobBh+/osSNQ2liYyoXkryH0exiNvcXb7FQFJynhet1PYeeYuzq0oNjRAwaVFGOzx5/jZ5ufUwQseW0Pi17+YCTLFCkzWZ5E81lFPZh2A5QXH59vGJJWVxdsuRLlqgaC4K5kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDvByJWx7UMu6NcAKmle/BqDNkyu6OYU1XWt6z7vBAI=;
 b=PAzwJj794svWph7IzOFTyRTrrt6f0JRldau7F90+/xab8Mxd3zo9h0WdY3DLwNlZlnjYcjLaIMKeANqB2TQdLwQd2Hx4FhC7fg5CCnuRFGU5j9aDry/mQ+Ekno9zjZVrIiLlfTimoRPyDwW930ZEDA6bJybo2Bk2rwxCnLKaVH47uoasCJ1buuYlEID3G5ffuaDO0B6Srk6B3yRo3xbeOMU3Kz72vtfNdIe3VxL8JoP6PlQ4Lo6aPZPNfBt1wwaJggUpUqq0UCg0ikaAz/4Di7JHstC7YkA9dTMpVYdUBo+2nW3NgrXB9Cqny5Hna+8ESqXJt+Agb7Y5HCkgvO3GmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by DB9PR06MB8957.eurprd06.prod.outlook.com (2603:10a6:10:4c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 11:40:24 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 11:40:24 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: [PATCH 0/3] regulator: mpq4210: Address the post-merge review
 comments
Date: Sun, 13 Sep 2026 11:40:15 +0000
Message-Id: <20260913-mpq4210-ohms-fixup-v1-0-dcff627001ff@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+LpmoC/x2MSQqAMAwAvyI5G0hrXb8iHsRGzUGtLYpQ/LvF4
 zDMRAjshQN0WQTPtwQ59gQqz2Bax31hFJsYNOmKWlXg5k6jFeGxbgFneS6HjTUT1WVtR0OQQuc
 5iX/aD+/7AblvOH1kAAAA
X-Change-ID: 20260913-mpq4210-ohms-fixup-8d4c0757da40
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789299624; l=2021;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=H/O5XZiM5NdXPrDe0YuRRpD4j7O6lTDh2dmdzSto/pM=;
 b=MZtFgK86fEvX1ejFKaKWaG4B9p078S/gpYYHMbqFohmi5LkIngg+uncwE+AnTvwUrF7u4dDav
 kfVx+vkeVF3DhaplrY/eYW0djPhR0uNdOm3tsbknkF/PFzaSdEWdDWl
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV3PEPF0001DC2D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::10b) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|DB9PR06MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 125307d7-f809-4398-01c6-08df118bccf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|52116014|10067099003|18002099003|56012099006|5023799004|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	dxr4AWR7HLvZvn6IPSZVbhC0SwruHRtgREoVoPUgAJY0OZUgajMYGWDC1k54MdbKvVrUZ5v9pUQEquJtE7VHyXSLg+9FH4oYfp/9EvSDllUZjy8i6aabRF6OpoO9LpWdqsVgHQK1N0oVN5EpUrMhg3Pg2GPeVIXLiVBMGHmB6SI1EwEl+NpegcUypWoYrarHUOVkQtb8JwtleXtiEhzbvxl/ENOV1CZqcFa0nDVXMydXOI+R+wAXEaENkQKl+lTzn+q1dJJhMsFOr69LX2qk9wndpVJ7XqKFlD2osTXivJxwSG+CveVWoRje8U5jkdXvmeT9y+J2T4RqYlpQ3j8UDGT66juairV8HzZ2o4bx8NhB8Xvsh9qzfZCKRsOdhby/8gN/C1WPNqtXfcpxk5VqObRCWjCQr3adP6eiELgHc4I8jqOv5bWoluTRDWWOQX+PZWLdt9f+0Su6VPfN97oSI8d4HTIUYCde0QB5215oyNQG1QAEAYmoYuo472K131/OdgbXIiVfqxsvYCbRrZDMTFN6wsc2dLJHEVTjg845zDT/xeAZBiP9sb2gQWQxf9AYG5+v1hy1oJpMfxKbaGbONw8HUfeiskTv4kI/+YXyYKYVNQH86QPQ33wCq99FdoWcCd6x9H3nb8pGPxs8ablJDaXuU1E3yWnvDCKVtcUIYJQfuD5c994U3J4NRhuThCGQTgA5G1M3R2b3Yu0+QLYoNQzifAp/YEQodyaMkiqCqss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(52116014)(10067099003)(18002099003)(56012099006)(5023799004)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmE2VlBBT0JzbFl0QXVMVUtJV2tvVTJyNjJQSTRRR3NIR0RlbGlxUFdBejA2?=
 =?utf-8?B?bzM0SlFVQi9wY2ZsbyttZmhwUEpFV2ttK0ZWZmZCT0RnSDMrWU1XdkFaNkVD?=
 =?utf-8?B?WVg5Ukt3NDVNa2dVYlQ4UC9ZY0JQb0NEWTA0c2NkZlpwdmp4M0l6anUzOUds?=
 =?utf-8?B?MUpMbjZISUFod2lSRkFWNDBFUzNHMVRMSldra04vK0hqcitaYkdHWlA1dkhu?=
 =?utf-8?B?NFZtN0oxS3FKelFlcVk1Z25aa0gxekx4YkZHWWsvRHp4S1pvV0pQN0k0eWZZ?=
 =?utf-8?B?WHNpOTgvZW1QOXhpZE9NRE1Ua0t6OGtyK2I0ZEhUY1o5dHZVek8zKzRXeTRl?=
 =?utf-8?B?ajh2OXpoanVYTUN0cXhqWGZTYkhVaXRvOVhxTGVvMXd4ZFpuSlRFRkFoZ25s?=
 =?utf-8?B?dWREQWRCS3FZMnFFelRGUy9hcnZtQWZPNlFKWVlMMG45eDk2aDQrek5GSVRO?=
 =?utf-8?B?a1hXbmxNaWZzaVdHY2tST1Fpank5QTdUZys1MER3WkxFN1ZsS0pRdTkyTjFr?=
 =?utf-8?B?cWFKeGdxeUJsVTdTZk0rSzl4emk5RHFOWEx4SzRUWldQdTYyVHF0RzdTV0NF?=
 =?utf-8?B?cmhraXZabzQwNVAvd3FuWlU4ZFRQOXI3cG1FdzBGOEVQNURLeXpYcUd4ejF3?=
 =?utf-8?B?amo4cng3Ymp0eXlGajBMNXcrZnVqZ010UDI3Qi9rRVFaS3hnOFB0Q1JsRWZW?=
 =?utf-8?B?MVZSRWZkWFczL3loYUlRSlg4K2lKSHd4T2tpVytBZmx5cys1NmZSZW1LYWxq?=
 =?utf-8?B?V0VHQTRxSFFPeFZiMUEwZHJ4dGpsaHE1SkpxNlpqRnVWbVA3S0hqblV5Q2Zp?=
 =?utf-8?B?bGZtSHRvQ3ZDY2F1TFBHZm5IR1AvQ0JoVWFTVEZscGk2bStvakl5ZmlIWlVy?=
 =?utf-8?B?QUVHS3JZaTFBRnZvRDN1UVRPaHJOVks5Qno5OTQwQzZETnMyZUhFOTdrK3lP?=
 =?utf-8?B?cjA4bVk0VTZwUE9Pa204eGR6T3lZQnlLWEJRWVhDaXEvVm9NSzNUUE8vTW0y?=
 =?utf-8?B?eS9ubkEzanJDQWxHMEZkUkl6dWVBWmdWbkMzTXZLcmVtVVJGbDBXQlI2UFcz?=
 =?utf-8?B?S2Y3RmhEY0V6TnE1OTkyMVpkU1hvd1NzanA2QlAyeGRDaHhiYjFYb2ZYUkZ5?=
 =?utf-8?B?TTUzTHlHSXpiS2FrUDJ5L0M1ZktzbUE2a2dRc0VydUtMZ05Gc1NNSUsyNmo3?=
 =?utf-8?B?Z056R1dualV6bGhaaWNDUFdiaTdzV0VUbjZ5b2JkMDBNRzVZU0lYOUVXdk1q?=
 =?utf-8?B?cnp3TE1ETEhQNWF6SVkvSU9iblpDNU1Ha0NEZDljKzkvckVmRHU3b29VMkU0?=
 =?utf-8?B?VExtcnZsQ1ZYa216K05rQ0pLQnZQQUl2U3ZCbDdxd3BqcWwyVURYWVZQSXFQ?=
 =?utf-8?B?blpxZkQyWXdldXhvUTlUVGRqRjFFeFMxUVJBcjNMNUxNdDZra21oaTZWZU8r?=
 =?utf-8?B?UlM0bVpzL3grazdRcVorcTZxM0FLNU1pck9RYXF6ZTNMTnZ5UWVoSVlMR1N6?=
 =?utf-8?B?b28rc2xXUmxkSzV1bndTMU5LTThMZXdIN2tsbUZ3ZGpYMW12aG5JZjFoZDZw?=
 =?utf-8?B?WXZqUm1mYkQ4OXVUS1FBbDJndmIva0FMTjZmbjM5YTZFb1dXcmMyM0dZYkhx?=
 =?utf-8?B?alVYTzMxVitjaHpONEpoN0RFUnVWbjlPZXNZbnhrdmF5cmVwRmc3Z255cTNM?=
 =?utf-8?B?cTBHZHU2VVM5bERXUjVIdXNDWmVSd0RPeDFQcEd4QU43cXJtTzVDdDhWSk5S?=
 =?utf-8?B?TjZJU1h1YTFmSENacDFuUFljOXp5TnVYT1Q3RGJGSVRETjJXM3lPSWI0ZytD?=
 =?utf-8?B?MU00ZFR0Z0Vuclo1cmd3QnpFV0ZLSDNSZXR5Q1BRcTArZXQzNlN0ZVRadTJ2?=
 =?utf-8?B?M1BnN3ZKakhXOTJ1bTZDRlJMOWxqZ0dTQmxOd2dHampJVEp4dERURmJvL3pU?=
 =?utf-8?B?NTFFeUZrRXNlVFp6akp4clp6TG44dlphUFprRE1TbFhjSkx5Z2IrWllZV0dJ?=
 =?utf-8?B?SVQydHNWUlhVTVdjNy92Z2svSzBrL2VwTUJmaVZ4WWJGZWlEVWZ4clhaYSto?=
 =?utf-8?B?cGhXcXFEZCtLMzBoV3A4b21BY3B3R1dsaW43Y2NWdEFaZVh2NXhzaXFLZFJY?=
 =?utf-8?B?NlA0U1MzcTdNb0Q5WFJRWkQ0aVJ2cjhXK2E2Y1A1RkhMZmZITG1nZ0NycTR2?=
 =?utf-8?B?N3hoeER1VE9BRkc1WmdLaFdwbjFBc3NtQzUrQU5tbFNFWmlCZVgwdkNNb1N1?=
 =?utf-8?B?VnYvSGpBa3p6SnVqcVQvdUlZc2hDcC85clFSc1hWYmx5NFFIWS9PMGVQMUlC?=
 =?utf-8?B?Tm4xbGljaHFGSWF0YTRyWVpCbmdQWUExeHFTU2xQak5NN3doaTdpZlZFVFJk?=
 =?utf-8?Q?3C36hIxGQrcgoHvE=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125307d7-f809-4398-01c6-08df118bccf0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 11:40:24.7244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rlmodk3lPFrWsVKnmSLbVflBwte1VPxc7dRUOvl8lgNOCu/8xDmdZ97mme3/6882fvDz3TF8KEH+ZhUIfKEGAWfTE8Os3na+rHDE5ie9RrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8957

The MPQ4210 series was applied to for-7.4 as e3c05a881fc9 and 61879d561e91,
and two review comments arrived afterwards. Both are addressed here as
incremental patches against current for-7.4.

Patches 1 and 2 rename mps,fb-voltage-divider to mps,fb-voltage-divider-ohms,
as Krzysztof asked. The split across the binding and the driver leaves one
commit where the two disagree, so they are meant to be applied together. The
suffix is worth more here than the convention alone: mps,mp886x.yaml already
describes a property of the same name whose values are kilo ohms rather than
ohms, so two bindings from the same vendor spelled the resistances
identically while meaning different units. Nothing in tree uses the old name
and it has not appeared in a release, so no fallback is kept.

Patch 3 drops the <linux/mod_devicetable.h> include, as Uwe asked.

Tested on an i.MX6SX board whose MPQ4210 sits behind a gpio i2c mux, with the
device tree updated to the new property name. The regulator registers and the
divider is parsed correctly: the board sets regulator-ramp-delay above every
supported rate, and the core reports "Can't set ramp-delay 3000, setting 2101",
where 2101 uV/us is the fastest reference rate scaled by this board's divider.
That value can only be reached by reading both resistors from the renamed
property.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
Tapio Reijonen (3):
      regulator: dt-bindings: mps,mpq4210: Use the -ohms unit suffix
      regulator: mpq4210: Use the -ohms feedback divider property
      regulator: mpq4210: Drop the mod_devicetable.h include

 Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml | 9 ++++-----
 drivers/regulator/mpq4210.c                                  | 6 +++---
 2 files changed, 7 insertions(+), 8 deletions(-)
---
base-commit: a655daad54efa1e3959cd642706eb81c9ebafc66
change-id: 20260913-mpq4210-ohms-fixup-8d4c0757da40

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>

