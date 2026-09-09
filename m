Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022080.outbound.protection.outlook.com [52.101.66.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAF64CA776;
	Wed,  9 Sep 2026 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948859; cv=fail; b=p1IF4TToHyp60vnIw6AkyDksQxYqPcMUNkTWSwm8GpRijTbWrKIeHvPkY34fh77L0P+Q56jZUoxFU/aidTi5wucGhqavZbgdtLsPogwCp1o8BgBlJ0l/ttkyfLFKCCKg4K7PQGC/MQJxgWzo8Yi1rnEMxAI4UvZ+HKMar3O/e2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948859; c=relaxed/simple;
	bh=80JtJW8xTHaLDQ5QvucXt2XalGNOGtTjQT1zfWKlWnM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Fr0UJ6IM9DAkLDIb7KHblYfgwn/BvMJs70kzE8netnJUyfIImGeVhwC8XlivrkMhTaZO+/Il3cq/OF/LuiqS1VDhsOGdfLQosK6KQJ1k80FfdocBaEPlzB0XC3zjkfzQb1QZt70iPFfN6OKQDUL+Kj7jLP11gfO2Zz3TNowlaaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=MmKpqCde; arc=fail smtp.client-ip=52.101.66.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="MmKpqCde"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvWsH1ERW4eiSBWLC4od61YJzLgcM/n5wuJ1G7dmVFrqYE2O55SBVTFGAXxIQz6g1jN/1ipWbK47Yyf/7CzQeNxyovDYYeCCoGkrpyyzcHVSiHxRsiiZr9xuEwlD4v786zjlAKR/fGa7QHNAwEIKkc2CC/r2zdf96wTl1C2cJoOjZAaEIihWFqNyoEAirqIPTv+YJPBin66f5hX57rDwyJBNqlONJpdsKxh9B0O1e3NBNxW/NsVd6DD8TJ+ipWWGubX2kIW/dj+TGHHfvQ11fkVDGftbnpmRyt8/JZZ5U2XnZRauKSLTI2nR1HaCzrem6W+rjn8QovfeDXjmn68ZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dg1r/eqW1yNi8/LfFC1s8WoFZcgBhUKmYPHcDcDzqg=;
 b=HQ0ujhc8XxDIaTA5MKYC6PIp2mcQ1zVkcTtkgKPmcm+F6qAVFNQ6OCq48b9vPRXflEq8WAP0VWMgmMJCdwJESTkNnw10acoUB8TJ9Jun9ySyv8m70JcEdiQpBEo4OfTbWLl1Iq/YUmq7mdrXWHUeq2SEKGhTkxRvsvex65vYGLdsAAYUejAjDbctBwFwdpcVTG+kc4/ddX/aRQ94+TaXKcE2c+GfWponcNFpWkEGFLBWSsAJ+WWsq1b35FkHepU74XjMA9Uwul1f5xoNWaTJEHAe1+IMO8GrdWJ1xsVmNF9Onu1NZrKLXP4litYqXdW6YtGSDotSuBTRtNfHhSsCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dg1r/eqW1yNi8/LfFC1s8WoFZcgBhUKmYPHcDcDzqg=;
 b=MmKpqCdeHYrWp3IWl4tt7henucMkphBwIc+B+wGQ9CodvKwBOXLH63WPyDkF/ybSu9yJeeXmUprbItEiwRbkqZzK9iE5+gbAspfp9VrVhewBKvx3qIdb/V5GC+AERU4Fe05o4zoBwtcU1VwRseZeLbqs8zPHbQb8OlWIwLbxUz/uHHLC4yqi+wc1m8VGD3HGrJF4Cc8cgaMe4aPdoNTYRodTr8cGWj9gOOtiXnnz4pYyKB1Rs3WzyURtLzp6c/F6b9vOERWpTlrI7CwgtmLaokqeIrUamUhU8IsaDIo2dbO80aedUp8bQMYCpMyPqAponGeoutzGK+JFpFcmNYv9IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by PA1PR06MB9209.eurprd06.prod.outlook.com (2603:10a6:102:465::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:13:47 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 10:13:47 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Wed, 09 Sep 2026 10:13:32 +0000
Subject: [PATCH v4 2/2] mux: gpio: Add optional enable gpio
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-add-external-mux-enable-gpio-v4-2-3b12a767bb94@vaisala.com>
References: <20260909-add-external-mux-enable-gpio-v4-0-3b12a767bb94@vaisala.com>
In-Reply-To: <20260909-add-external-mux-enable-gpio-v4-0-3b12a767bb94@vaisala.com>
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788948825; l=4168;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=80JtJW8xTHaLDQ5QvucXt2XalGNOGtTjQT1zfWKlWnM=;
 b=ZAo3/EP6xecP0vVlX3PB+fn+tXLnUTwnIKT6Ut78Sy+H2tEY0xKvS5MENRexecDjwJgT/AZHr
 05WHYvUyCHxAcC17EiWHwEn9beymZtosbGN9L7nlmCezb9SMei7Ys+e
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GVZP280CA0009.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::7) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|PA1PR06MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a48673-0fe4-48fd-6d7f-08df0e5b094d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	uKHEjU05oROJpUchgvalQFhtswWh7i2W78VW/wmzPQdSZWaeSlx76KOHlOPcipsxs1BWFvAZBSb/u5I3EEUMamPJHU043vsCFI27kFxKD+pVpRGMABAKF0CvFoLk4jF3ZzGkM5Rv3U1+t2GaH75OYsWvZihJf5u5CbTlemy3yiTjoZY8+8J8utn2hx5Zs2IpklkCuF+yjoxMmBEQxHCSuESfQjBqek6A2z8kLcEIKe1HItGXCKgXMsUEBBU6Yv8BqjSDxZSWBYLXUL10XBG4GSWqnLYbIwa/s5zd3HXj96ck7IsCpfrv1ljyd35oODOIYZ6srrak4pUC1U1+9CIvPENA3Lh6qmakbGRu+7f9NzpBkWKOHiE0GyjJEWEfYxMNvpBEbGoTHF0sYuTMAxKOUTEMdhks0/2MpuWUQNIfw+0dVcsoZbBdlG9TFGbbDXO7/EdL2Jwr0Gf+pqUYIuPsb8wPR/wUPMka3/rchOd8OuKG5oZ6LCpN3SvVnYXtMfAqRhYpbJ2CT9kbcrNk1Ulz5BvJNk3G9Xnc//AHs4/PVKOB3HF+Nko7+7HJnuCL6pdhp4pAxB17FRAHzhDisQ82S7aLVrTwWQR5NhGEToC0A9efiqJOl7upaIYNv4AJhg+V8McCGeecIxBa3j18vbEyJ2BD+5dqKkfBSr+zBwzlqnokFyjIMBzWAZ5PnExKdDkBbJ5UtYTPmOM0xuXmS+aKUzquhjifcQsNoZNzO1nA0yk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG15ZmJjVkNadXhPOUlDODM1a3pGc2pjblZzNlM5Z2MyQldnWVg1NjYxVkdq?=
 =?utf-8?B?cGEyQ0ltbXFPUk9ZZENWWXNyZVJFSC9oWjVqMWIyMkpHYzYzOXZqT3I3aGpy?=
 =?utf-8?B?aUpiQ2hDWGNFVi9JS3RuZVQzamtWQ2Q5cGVBQ3o0TUR0UytRd0xHVHBhRkdq?=
 =?utf-8?B?d0Z5c2VaTGlGQkUvMEMrWkRrcWdPVG9aQk10K2RMODJ2S3BJQ2FMcGUyRlRJ?=
 =?utf-8?B?ZnVsb282eUJ4c05WaGM5cUt4bXpnY05Qam5CZ2NudXVHbTVMckhMY3BWZXhv?=
 =?utf-8?B?ZkJKN3FreWM2NUpPSWc4Z0x2bkd0SU4yeHhnVWMvMUZGNmU1NnJjNWZqTWFw?=
 =?utf-8?B?bGgwL3U3Z2UzMnVvN1pYdFNwNXM5emcvZVJvS3ZDdzNxWkxqL081N09JRDRH?=
 =?utf-8?B?dDQ4bFdmTXYzYXAxbXZKYXNUSE1uOFNRUy8rUVltQnpQR240UGtGOUUvdmtt?=
 =?utf-8?B?SFYybExTbnVybFpudWVQTFpidW9KcExHaWlsTUlZcjkrRmZsMkZpN1Vsb1Jj?=
 =?utf-8?B?eklhalFoRU9yU2xBRDFRRTNYQ2FwUjYwMXBtZWFHOGR2SkNqZ2FrMVJSc2lN?=
 =?utf-8?B?bjFxekcrNTQvSGRZanVkTmNtbGRoNE9FNVZiZEFmMUtuTXlCR1hHT2UxNklQ?=
 =?utf-8?B?bkVaRzl1K0xZMG5IdVpsOTZlMjB5RnlWQWt4aDlKVjVZWXhRR1V5V2lEMWI2?=
 =?utf-8?B?aElFZ285cmpqdnNVQVRNa1lDRmtDVmxKSDM0ajdRNG15MnRFUkxQMG5XZ29T?=
 =?utf-8?B?UDM5ZGc3ZVhQeUF4S0YxTjFDSzJjYkZicVJQTlhuWkFIZTlKNzdKeFh4Z3lT?=
 =?utf-8?B?SEtmU2RUUkc5Q29NUSt0WWltcXpRK1hVeUJQTTVhTGp4ZEwrSkhpd1FTYkZt?=
 =?utf-8?B?aWdsWFV2cXlCN01tUkw0SFNzWlBJNjhSRzNHTEtRUzFIWGFydGJEZk03eFBw?=
 =?utf-8?B?ekwyVm50N0FkMjdpRzhZTjBQQVJEWEVybVI5cWlWbWZDS2FkQ2IxMG5udytn?=
 =?utf-8?B?SVJvLzh0eVF2OExra0FkZHFjQ1h4d2VPazRjTGNOWWY3MnpNdWw1ZTBLWUdt?=
 =?utf-8?B?L01TdUlXZDVnWHR2WjlBK3FBNlNDMEpxalgyWUVscHJMUnJRM0x5cDBnVHZ2?=
 =?utf-8?B?OTVMZkZldnJrOHB4R1Fndm5hWktCenNEVjNkMG93NHVCcUZqTG93UGkxMWdD?=
 =?utf-8?B?ekovVkQ2blRwdlc0SVB4VXJNbDZjQ1BJUDgwTmtScGR3ZmZQemVVT0dDd2tj?=
 =?utf-8?B?aXhVWEJ4WWlHY2VQNG5tWW42bmx2Wmo5dkNjWVZucG5VMmYxVmgrV3J1TElV?=
 =?utf-8?B?TWh3L0Vvc0poaWdZYVQ3SjV0bzhkYUhnak9zSVhWSjQ1aE5MWkdwV1BiNWpw?=
 =?utf-8?B?ZFVmYTBzd1hVLzJVN3ZKOSt5RHBUYmUzaWY0S3lvZ085NDltb2dlckZlZFpJ?=
 =?utf-8?B?Q0VXUjlSN3liY2J3blRodW15eU0xbmtIeXI4ellhNWpPYzdLWUp3LzFoNGto?=
 =?utf-8?B?OFk4NHcxcmMrYVp0ZmMvQ0IrRkpWbTdKeXg0V2orRU9YcTJjZUljcXFONnNU?=
 =?utf-8?B?c25ta3FTWGRSNHpGcHJTb3lPSk1WaEpmdXlNckc2cnp0UlJlN2xzZy9pSXVl?=
 =?utf-8?B?NHNyenRJOHE4WTdXT3lRUmdLS0w5Z1NJUTdndko4bDhQb3lpVWp0ZEtzdTJW?=
 =?utf-8?B?MU9NR3ZwbkNUYU4wSWUzeSswRWtnK3BBZDZweFNTSzNwT0xiR0c3YklJMW9W?=
 =?utf-8?B?NElkblRxUHEzMWxKRk03OVl1dXhqQi9ibW1vZmp0S1NjVytkdWwxT0pKVVJy?=
 =?utf-8?B?YmNrV3pMYnU0TmhSQkg4ZHVFNC9CcVlkNDRjZFFCb2o3VWRvSFlHKys1U2Zz?=
 =?utf-8?B?QWtzVHBSMllnak44dTBMc2JZM3NIVUwxa1B2eTFBNXlhWGJtbUVhbDZ2Tkd0?=
 =?utf-8?B?RitUQXVxaHhjcnFsTDdtK0NtSG93VmZ5M0E3bkhISEhoZUh2ZExlb2ZWYTlo?=
 =?utf-8?B?MHQ1dXl4WHJZMjBESHFJb0VhcExlOUQ4NFNYNENySmRnTHRaNkNIeFpVOUtR?=
 =?utf-8?B?S3hIbStEMjRqL1ZZYXNNMXo4aEY0YXRWT3lCeGhMTFM2OTIzbDFaTGN0eUFT?=
 =?utf-8?B?bU5EUVBYUUN3YzJuTmt6QzNuVmVmR3dpTGl5OFlvUlBRb3hUQytNZHlxR0U5?=
 =?utf-8?B?TTlKL1Azc2hBcW4xa05BWTNGSzNWaERTSUIwcmFUQ1JrS00wcVh5NHlRbHVK?=
 =?utf-8?B?QW5hQ0U2ODFmMTdHNDlSdVVzeno2bnlKTEZnNEwvcXF5VVRtUGRSZmVJUjZy?=
 =?utf-8?B?RmNwc25wOU1FRU1HQnZwaDRiczNmOVRjQVlreUJaS2ZSY1FZditFb25yaDRF?=
 =?utf-8?Q?2e1SH3RQYZ4wdt0o=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a48673-0fe4-48fd-6d7f-08df0e5b094d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:13:47.1653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlrnZUOyVE8leqID9kNEf7TdXQgYlfM0BIkEknnIzBjBM0RpjrfMk2e11EMaklqhy/CqZOl5W+f4GJH7sS+cj0DxX02lHEseSyMXOgBXjkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9209

Some analog multiplexers have an enable input that disconnects all
channels when deasserted, independent of the address inputs; on a
74HC4051 it is the E input. Add it as an optional gpio.

The mux gpios are not guaranteed to be updated atomically.
gpiod_multi_set_value_cansleep() groups them per gpio controller, and
only controllers implementing set_multiple() can possibly update theirs
in a single write, so a mux with its address inputs spread over two
controllers passes through the intermediate addresses on every change.
Deassert the enable gpio for the duration of the update and assert it
once the address is settled.

The enable gpio is also what makes an idle state of MUX_IDLE_DISCONNECT
possible, which the mux core applies when the chip is registered and after
every deselect: it leaves the enable gpio deasserted and the address
inputs alone. Refuse that idle state without an enable gpio, because the
address inputs cannot disconnect anything on their own and mux_gpio_set()
would instead drive them to the bit pattern of MUX_IDLE_DISCONNECT.

Return the status of the gpio writes instead of zero. For a gpio on an
i2c expander the write can fail, and mux_control_set() only invalidates
the cached state when set() reports an error, so a failure reported as
success would leave the mux on the previous channel with later selects
of the same state skipping the write entirely.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
 drivers/mux/gpio.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index f9c7863e51b82fb76ed03cf17308fae74716cf6d..2fd8c83dc22e10ceeb0b402f1a2fada9a3032319 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -18,6 +18,7 @@
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
+	struct gpio_desc *enable;
 };
 
 static int mux_gpio_set(struct mux_control *mux, int state)
@@ -25,12 +26,26 @@ static int mux_gpio_set(struct mux_control *mux, int state)
 	struct mux_gpio *mux_gpio = mux_chip_priv(mux->chip);
 	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
 	u32 value = state;
+	int ret;
+
+	/*
+	 * The gpios might not be updated atomically, disable the mux
+	 * meanwhile.
+	 */
+	ret = gpiod_set_value_cansleep(mux_gpio->enable, 0);
+	if (ret)
+		return ret;
+
+	if (state == MUX_IDLE_DISCONNECT)
+		return 0;
 
 	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
 
-	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
+	ret = gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
+	if (ret)
+		return ret;
 
-	return 0;
+	return gpiod_set_value_cansleep(mux_gpio->enable, 1);
 }
 
 static const struct mux_control_ops mux_gpio_ops = {
@@ -70,16 +85,28 @@ static int mux_gpio_probe(struct platform_device *pdev)
 	WARN_ON(pins != mux_gpio->gpios->ndescs);
 	mux_chip->mux->states = BIT(pins);
 
+	mux_gpio->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(mux_gpio->enable))
+		return dev_err_probe(dev, PTR_ERR(mux_gpio->enable),
+				     "failed to get optional enable gpio\n");
+
 	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
-	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
-		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
-			dev_err(dev, "invalid idle-state %u\n", idle_state);
-			return -EINVAL;
-		}
+	if (ret < 0)
+		idle_state = mux_chip->mux->idle_state;
 
-		mux_chip->mux->idle_state = idle_state;
+	if (idle_state == MUX_IDLE_DISCONNECT && !mux_gpio->enable) {
+		dev_err(dev, "idle-state disconnect requires enable-gpios\n");
+		return -EINVAL;
 	}
 
+	if (idle_state != MUX_IDLE_AS_IS && idle_state != MUX_IDLE_DISCONNECT &&
+	    (idle_state < 0 || idle_state >= mux_chip->mux->states)) {
+		dev_err(dev, "invalid idle-state %d\n", idle_state);
+		return -EINVAL;
+	}
+
+	mux_chip->mux->idle_state = idle_state;
+
 	ret = devm_regulator_get_enable_optional(dev, "mux");
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(dev, ret, "failed to get/enable mux supply\n");

-- 
2.47.3

