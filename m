Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022139.outbound.protection.outlook.com [52.101.66.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E823C3F7B;
	Thu, 10 Sep 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030339; cv=fail; b=sCuCuJ9B0XaxeVz6WjQitqg29YmG3BbGHyJO+EG5qt9DOQ4T3OBLTLCTHVqYilyLQipU1z6UByeXl52o4dLuOesdvtpKs9TnCQ0yDCoknfRJ6DSHmEBIDwFhbcd4remePXF1uwQ/nUhmmUtngFkdflS9z47EAB+Ns64t99YGxLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030339; c=relaxed/simple;
	bh=2ltV87mj7KUx4NQCyE1rZsczq1Y29c6bS1dibsZ+2zI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cjmrVYP6iiLhU5HRgXp6Tqh8GK+Soek9vTTxXzhfHX8mZgkJ1AaXd/XaHQstiiefX/7OUqPaeJNf1Hg+/0PRUcUkmVyQw1/YPmdRNhPRCKajkjEPZElsBdUkdcmGmFTYD6oPn3C48dOfKNFcSGQ5+M6MH2BfG0nA9BHkKHrOhkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=h3+CCh1X; arc=fail smtp.client-ip=52.101.66.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="h3+CCh1X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idSn0wdDwRoEeMX2dhUXEWqfDfiowtEpeqK8BqUiCaOZeOxCf2fZIXXneezFM7K7GDxr2qv6fgPO1o7Z/jkyZSTE6KFgCT5VBANAniG+sPb0xposSu96WZK25/Pxrrs6eI4EgBOYC9ZgNiSzUiqhhL9MqB9JU7PB2B2Wu14hxsdZDli2tFqjIjqUPX1yAtNkr6NFEf60sh2t4KzjzItL4eiyv5DuvskGhABVrT6vvqm/HJBL1r/KWJL9qkRORmmeFcpWd4rY7tS1u7pNKCf2UjcWJ/7bY42FlsJDENnLyhOnIOmn3a8TDAVA3Wj5PDT7QOMxFRVGZ2HrUXKPktP/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9coajlkKeTm4GZcJTkCr5pjdXHj/B3A6xovlzQoJWE4=;
 b=LXRFb+aKFhhQF6lm8Gt/4abJVPEMpNdfZCTpCNqtePky6w/WWZT+jCfmh80gcKH6TVJifI/4LiKVAc2WX0fF5ZQnqIm86PciVbivlUWh5wmoeGak77HK/qhTR4vIqQem50Op8iJFwfZOTM4JLqD30dbQ18dpw8IpcNt1Lkbix2VgpdWvUX3ba1PTRoGyJIS+oDImRPJinqC81gaa8chORWpw4cnJj/u31ZP0onfcbWd01yo1D+cmuxfAqQJgCrAop2NApgszRx5dCKC2kUuRPEImYjlsmuV7FCbZv5gR/wV+Hrv0txNKc71aU2/aSlQ6Qa1rEAJZMzPgLTc6AuWC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9coajlkKeTm4GZcJTkCr5pjdXHj/B3A6xovlzQoJWE4=;
 b=h3+CCh1Xs8velDb5RE1oug4VwBZ2LbC1uFlsWv80puUWO4TsKjCq2Sc2+H8AeFvYaC/TDIIMJLXYbh6LiL4GmRIN9/A5z37mdKe7IYQyG5VtDm2Q/VaiY0ta8C2HMKrI98LqRZ6rXleop7xueM78JpXGU/+MOC1pRVA2tZuMpF5crsOl+TN4R26UUseRSrnS0bqKacnOQJe3dBD7OKqFyMu34z/X5Cx6DRFB9/TycOqgyW0P6+Wd/l2AcSoMRdf8EWNoFf5v09/KqGsXhrRnLC4EWDBgTdLcXK1IoLEdMtyD1EjmArBwkLE4Ph/upKLX5oMDNeICZx1nMKqtCRGzXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by GVXPR06MB8873.eurprd06.prod.outlook.com (2603:10a6:150:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 08:51:55 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:51:55 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Thu, 10 Sep 2026 08:51:41 +0000
Subject: [PATCH 1/2] regulator: dt-bindings: Add MPS MPQ4210
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-mpq4210-regulator-v1-1-d37e208dfc8d@vaisala.com>
References: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
In-Reply-To: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789030314; l=4191;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=2ltV87mj7KUx4NQCyE1rZsczq1Y29c6bS1dibsZ+2zI=;
 b=3Oshh4yWgGMki0sxI/3nck7QHwwtbw8I/dOh1Y7IFjvuBD6UUmJv25t7h69zxEbvtQUJlQpCd
 82vzue/JWgiCT4LaUE7YSBC0VT8W64P1gSMu0+3iVVcmQnRKPsL8wIN
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: BE1P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::17) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|GVXPR06MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: 03306456-cd02-4899-2dd3-08df0f18c40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RkcYyPuPDnL6igqSzBN+8SNXgUhSSeMfmegJK5xXPnj8nqTqj6DtEIZyZlI0qbu9JVNA3m4+tjBo4KEmQPFAetGRTlOwHBrwlzPbmzzY8m42QpweXngra+ueT8JNNwhcPz0RRNngMJceJPe4rD0iaJmqLo+ci7uJ+xVnyJHdVMq/kiuwVXzBl9oUgBhUFDnUg4XQshQxq/r5ieKPIIYfR512ks200sZ8nr84eJN3lyL0ePy5qhbO8JfzSGrn5kZyOxBCAL7AEsy6wNfqcBxoF++vkc6/ObXxyZDIs7Dznje3lC2NYhuuHwtjszUMIl7aUZ1T57jsyXi/2M0q45xfoJ2L47fqlwI+LRyAXccalunwGu2Fa0C7bxTfzQT7TUJZiMWtl7HP218Mjru4cpNJ9wg4doGDLNYNh91Dk84oHMl3+3h9yzcQx9L3hUhHgSfuH0ZgsvCME5N1o+KLR7xyW6ZKXgWfBJiGH5+Osh6/1grgO1E8L9ZQunpamCsZehFGFMurVL8lErTqDnccYyK4S5Ix/CUE6OEu+9shh5kOXpbwLhV8WrhJH4fwud1WbDcd7/uwuaoxYw9ClsS/4OA/8tkimns3lL9rwbRhvEF/nAksTysiwX5m34s8vEHwkZxYlS8auq3hyGulIIAgRmbLrp4gWGd5kh9vI8lQsBbYi2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHpoU2xXekZTTmNkYmk5VUVqYllhR08zR3VrRFVJZlVQQ3JpWmc2Q2Z0Z0tO?=
 =?utf-8?B?c1lPMGlIb09ZYkJ2dDJKT2tyZDBjMlg5ZEdGRk1LNzRWZDhQbk9VNFI3K0J6?=
 =?utf-8?B?ZUNrQkdBTEcrMzVHT3BWN1NGTGN4NVlSbWVDMnRLeUNvdjJMNlpXalhmYWdo?=
 =?utf-8?B?c0J6d0tSN20rTXIvOGNOYkx3a0xPVmpJZC9oZmx5NGMzTHVMK3dmM3dPWjV0?=
 =?utf-8?B?Mm5mRG1rZjJQYnBuNU5xMk9TY25CZE1DYWZCK0V1bUZ6VUpLQmpWZEVJRXJ0?=
 =?utf-8?B?bEFYTXZ4SENQcENpZ2hSVENUVW5yMGpKUk9vNGsyb0pLQTc0UlV0dmhiblNK?=
 =?utf-8?B?TEUyR0dNUnp2OGpXaHg5dVlhT0ZpSkZpcklmWERtc1VrVkRUakJoM0dJdG5C?=
 =?utf-8?B?emxJRk43UFhnaU5pZ0pwazlDWnVRMUpjSXBvbGdTRW94ODQ5MFd0NVhLaTNY?=
 =?utf-8?B?OXpFK0l2bHg0UWNyb2pZQTNOSkN5dWJSc1dKbWozUVdCUExCSkJqemVhNlJs?=
 =?utf-8?B?cFpqSXBCbmpDM1k0UWZEQ0xhdVFYZElKbmpPempJRGJEaURIdnZUN3E0Z0d0?=
 =?utf-8?B?OHk0RGlJa3VjV1lDVTRhTWVnUXFwWWVHME1YY2VicDBBc0k3bnBhbnVxQXpo?=
 =?utf-8?B?dGRVM21CcnVDc1EvUGNKN1dLMGRvVE5EanpQU3ZyNm5wWHZKVUYvd1hQNTU0?=
 =?utf-8?B?cDgrWDFRYjNFUUhpSEE1bnB5MkMrbkRORTBvK0toUzZCR20xNlR0RjlqSzlj?=
 =?utf-8?B?N1RIYVJMVXAwT2VkV1FnUS9WZVVUWjIzOW80TkRvNk1FNUhOTmNOVzVtUkFi?=
 =?utf-8?B?TEYrMXhGNnBQNmR3d2xmYXVMWjZ6S1diemo5dElVTTBNNitBSkxZaW1EL0p1?=
 =?utf-8?B?WHBPYXpScGpkOWNHbWtJaFMvWXVKUWNqcWVWRW04QnlXZjVZbzM5b21PVFR2?=
 =?utf-8?B?WWhremd6QmpaMFRDSjJQQWhTTFI1ZXJLc1pkRkd3T1JLOUpJVVhRWkhETTE5?=
 =?utf-8?B?cTZrcGFkQVdRbnU4MnpPSnB6UWU4QmlrM0plbkU0U2tEaEhnczdOY3dTTEZO?=
 =?utf-8?B?clpsZzRiNElMbzZjeHZwdFlMbjJWNlZ1UmE3SHpDU2VlT2tIQnRQMkdwMFdG?=
 =?utf-8?B?ek1uVlRuTkdka3pkVjl6OTRoYzNLSnYwWlRrRExlRmp2TlR6ZXhZVUozczNp?=
 =?utf-8?B?TXU3TEp4LzhYV2tiQmVTN04vMmErRHNBckF0dkluYWNoODdieFlRUWFBbEhH?=
 =?utf-8?B?ejZ1MEl4NTJYcjFZaGcyNWZBYTk5bEYzTWR2WjVYU2xZaFgyMXp5VXd1SjFQ?=
 =?utf-8?B?Q2h5TmhZQy9kNjJ1djQvVlN0bVpydVJ3M3R5eVl0SkJnZ096RXU0dk11citV?=
 =?utf-8?B?dVNWNE5LTW9SQU9NUDZMUnlGenBEN1pURTNvS04zSlBpSmFRcTJIbktWRFgv?=
 =?utf-8?B?K3ZHUXNaM05zZm16YjNaU2VZejlQUjROV1dEM2JuUXFHS1UySlU4aER6bTJI?=
 =?utf-8?B?RWxESktiSDY0ZXc3WnRVL2s0eUtvU2RGN25HQm5VbVZyU1Nra1NOWGNCajZ4?=
 =?utf-8?B?Smd1WVcySHVHQWpMZDQzazFRY09hWWRETkdNQ0grcjhXQVRBMGpZWGFob3JJ?=
 =?utf-8?B?QTVJN2FGTTViSGRBZDVKWThZS1hqTGpTNmFSY3FTci93ZVNzOFdrTC9jWWpC?=
 =?utf-8?B?KzZxTDJLMVBvanNaS0JybWJEV2JaVks4Vnd5UUljanhCUlUvNDdlTkZObTRQ?=
 =?utf-8?B?aXoxclRvekUweEFzWW8xSW9zTE9SRnRUaGUyZndPM0JpeWd2bVl0SXA0ZWJp?=
 =?utf-8?B?aXlFYXFudy8vakFIQlJuM0dsMXFQU1hrSHhyd296ZUU4cmVUYzF0b2REQVB3?=
 =?utf-8?B?b25ZWXJTWXFZZjA4Z2NkaWZaZDcwUkw2VlR6T2xkR09nVWdHYTdJN0cxeUNU?=
 =?utf-8?B?ajBQRi9DdzY1bGJJNGZ4anp0MS9obk1uREt6d0RZRS9qS1gxOTlSY0toSGRT?=
 =?utf-8?B?cldnV0pTNFY0Tko3RFVvYjlPbjV0SlNoOGtmeXJvV3NMejB0ckFDeFlTYkJC?=
 =?utf-8?B?ZUY1Y01BRzNtNmhFQk1kTittL3ZKQzhFK3lTTys5TGlBUlZNOUZLWDBGMXNK?=
 =?utf-8?B?Rng1R3dIalN5WDlBVUxzb1h4aVI4TzZWUzdDajQ3MHU4T2c1bUVXWnh6bHho?=
 =?utf-8?B?NGx5SmlJc1gyd3dSUHpYaTc0T1dJMXM5bEVqR0FYQjhYMHZyWk1DUVMrY2hQ?=
 =?utf-8?B?YWhBNTZMekZUNG5oUDh5WUtuekVsWmdjVTBYa2trZXZBdDJMaHNHT0xZSGsr?=
 =?utf-8?B?QnNnRlVhSkNWSHlBKzk1NG9WcHNpb1dlMkgrVXVqY2w1eWlTUFVJdG52SC9P?=
 =?utf-8?Q?0rC1iTMM/imYxxSU=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03306456-cd02-4899-2dd3-08df0f18c40d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:51:55.3521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Pt7VbOiKfA6ODHAt6MXjuj1wRKlg2jG+UngF1CPMNcjGLj34e6yCfSUa4+9G3CpH6huAlZ+VXttyewApepxoOHC5G+pq3NvOx77B2gmC8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8873

The MPQ4210 is a 40V synchronous four-switch buck-boost controller with
an I2C interface. Its output voltage is programmed through an 11-bit
feedback reference DAC covering 0 to 2.047V in 1mV steps, and is then
scaled by an external feedback resistor divider, so the divider ratio
has to be described in the device tree for the driver to translate
reference voltages into output voltages.

The divider is given in ohms rather than the kilo ohms used by
mps,mp886x.yaml because the bottom resistor is not necessarily a whole
number of kilo ohms.

The same divider scales the reference ramp rate, so unlike the other
bindings that scale by a feedback divider there is no portable value a
board can copy into regulator-ramp-delay. Describe how the selectable
rates are derived from the four reference slew rates, and show the
calculation in the example.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
 .../devicetree/bindings/regulator/mps,mpq4210.yaml | 69 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e9e7a87e7533d0948927a459e9af711d1e07e572
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mps,mpq4210.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power Systems MPQ4210 buck-boost regulator
+
+maintainers:
+  - Tapio Reijonen <tapio.reijonen@vaisala.com>
+
+description:
+  The MPQ4210 is a synchronous four-switch buck-boost controller with an I2C
+  interface. The output voltage is programmed through an 11-bit feedback
+  reference DAC and scaled by an external feedback resistor divider.
+
+  The controller ramps the feedback reference at 38, 50, 75 or 150 mV/ms.
+  The divider scales the ramp rate along with the voltage, so the output
+  ramp rates that regulator-ramp-delay can select are those values
+  multiplied by (R1 + R2) / R2.
+
+allOf:
+  - $ref: regulator.yaml#
+
+properties:
+  compatible:
+    const: mps,mpq4210
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to the EN pin. If absent, EN is assumed to
+      be permanently asserted.
+    maxItems: 1
+
+  mps,fb-voltage-divider:
+    description: An array of two integers containing the resistor values R1
+      and R2 of the output feedback voltage divider in ohms.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - mps,fb-voltage-divider
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@64 {
+            compatible = "mps,mpq4210";
+            reg = <0x64>;
+            regulator-name = "vout";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <20000000>;
+            enable-gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+            /* R1 = 82 kOhm, R2 = 9.1 kOhm */
+            mps,fb-voltage-divider = <82000 9100>;
+            /* 50 mV/ms reference ramp x (82000 + 9100) / 9100 */
+            regulator-ramp-delay = <500>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9dfb48e900df71a86d4686d3ec2c..eb552bff791bed27b86d5e2a398d0d96253efc6f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18372,6 +18372,11 @@ F:	scripts/module*
 F:	tools/testing/selftests/kmod/
 F:	tools/testing/selftests/module/
 
+MONOLITHIC POWER SYSTEM MPQ4210 REGULATOR DRIVER
+M:	Tapio Reijonen <tapio.reijonen@vaisala.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
+
 MONOLITHIC POWER SYSTEM PMIC DRIVER
 M:	Saravanan Sekar <sravanhome@gmail.com>
 S:	Maintained

-- 
2.47.3

