Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021082.outbound.protection.outlook.com [40.107.130.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC15425892;
	Fri,  4 Sep 2026 06:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502684; cv=fail; b=C5fSiFC046tSnZxaZokFwMVkFUwVxkOTkoXirSXiBagRwcGEBeBIJSknB3Gf1Tn9mu+JseLO+BiWxfoFE5nBy1PCNcKvrYdYn9iAntQ/QZxdtVXFmXyCk90TY1r5/+uYTs53Mtik/8Vz+eOEbOU/4/lmtQWLAmxCI/b3kvL+lbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502684; c=relaxed/simple;
	bh=80JtJW8xTHaLDQ5QvucXt2XalGNOGtTjQT1zfWKlWnM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NkHOdXn0cR//PxYmyk5JKtiETU66cdHJUYYZarkgPdGdwTIb2smqZ73llwSYSVSr5ynEUr8SjJSzZggHFQTfuNdZ5kD2Ubf7aMftL629AXUkr8xAGXs/fBnXJHxo3PafkfVoPO2hkvmHK0Co3JX9nUnMRvcZo3/xx4G/ZD1iWZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=XfHvme++; arc=fail smtp.client-ip=40.107.130.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="XfHvme++"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FH9v+Io7rZsyeZ5chC0gBueiSkxMoWJwxzc9xDHCiZziD3/KPSoZBYwXam/ZwMrKPik4ptAtS29Oej71vF3vw+PMQqcUySel1lMbxUuBPCsSMZDK6ougJLhH2kih9VfJKXGvfuj5davG+jdAacLB+0v+bpJpEZrhtEswVzrYEDdb9NrfmMmkxvynd1U7ZHF9zOfSCARU+5YtEmgTeOq/Srtp5kND3ASkGxB0XOeMesL2052M0pOVxdLCwHu9LE7uXQpNGSMPD3PBkIFm+h5TO8C9IZT3Zj2+F6Kg/r+3x12VytiWMNqEZv0IPVdbEWBOD9g3lh98lHiT5Ymdyino0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dg1r/eqW1yNi8/LfFC1s8WoFZcgBhUKmYPHcDcDzqg=;
 b=SqfXGaWxJTRYAQu0W3eBfRm0Zaf1xk435E/wJQRBNp9cNzUtMvuJXmflAM2X+CouKVnKf6h00tkXPEYBNiyxUhyddGE9mACJzZPF0AtYwHDwjIYduwTNtG9VTvk4GaWZMcFo9wt62ItI68MlD3GIY3vaz2vslbACp7+oONHJSKzNrGYdaq1ZzMB08sLvSSAzmJFto8KEF5MjjRTNNkF8ubtWjN7FlRnIry2TuZAs1b/zMpxSEnZCBUz31EgYDoi4GUIEQrx7LLXrmC9vDspMja/AcNeHxWIP8SJeZiw7gwJ4HNGDKWYZIq0WvVgXCYN3Q4LhMxKsINAH8ZF0UC0FIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dg1r/eqW1yNi8/LfFC1s8WoFZcgBhUKmYPHcDcDzqg=;
 b=XfHvme++U0ekEca70bqnPLKL0wEuAx/GD0tQVcqR6jo4dg9RqLBDNBW70ui1Bo7LIgMfWThnpmGqyI0pRuJtc05LX58CCt2SmQl3kBvLjZp5zzbZE/P8HmtqCFOkuecu96xvLyG/pv9stOgGgwn/4ioyJYXtPoX48JuFd81+mUdacMVOh2alDkY3K5/t2o/fsvgo2la+ssNifIL6pxAea8EY3weRc5l1hr8NbQDP0m1u+/quIsAcuPmQvUQ0jFBtGwg9BrFRKAgVeV0A6rI9ei+jvSW3MwCw/0fC6d8BdIai9TdWr67ZO0nbbDMoZtvqFFSt0JKUH6zFUSLUlyQ+mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by GV4PR06MB10345.eurprd06.prod.outlook.com (2603:10a6:150:2df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:17:48 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:17:48 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Fri, 04 Sep 2026 06:17:37 +0000
Subject: [PATCH v3 2/2] mux: gpio: Add optional enable gpio
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-add-external-mux-enable-gpio-v3-2-1b868e669e43@vaisala.com>
References: <20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com>
In-Reply-To: <20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com>
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788502664; l=4168;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=80JtJW8xTHaLDQ5QvucXt2XalGNOGtTjQT1zfWKlWnM=;
 b=QjX/Yp5D7ar/C7HBBfiR6rHuUPdDjGfxfslxMjEVaiHa8sX2nMZ7E4XFYvzJCZgiSjqZxroAH
 K+R2e7ooZhJDqBQvLENTfZmiY05+Vo088vYKbEpCEGw5F1S0Gvjz3te
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
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|GV4PR06MB10345:EE_
X-MS-Office365-Filtering-Correlation-Id: 692a4290-9a08-4d23-6229-08df0a4c3e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|38350700014|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	UrdgYqfPWvfJvFRZLPqaD/YMuH7cW6Xa4FaP8X7tZEBLNL3yNuuTlQdQlej9uSQBRvH900UZ/bHrikLZm/YzcwonUK63CM84u1/63BIsbwmRW+bkPC/W9WaQHz/+nTEy/5nfN07Q4scWx7PBIoW0yYdANS69apGY8rybEcY8ExEPxdV1RhERv54n3/pvPaG02Nx3Ij0yD6JlM+OZdy7Gle9DaYyjdUN5bQPQXiacHzIMzRbgmcr7ML9290Ha4OAfTo5+5yqXYN5YHAZHBD8C2VQKNkFCOtnYfwlYp48cDrDhhm4zrThFADqR0wlyxn8DnVoS9+RN+7y2HnQrC1Ta4OQ4W6lBKp17ZSiUOS/BgzG8WWAHdiaU7TeS81gc7aOpS48QB3m+wiMjKkGHdPYCcfgUiqxX2hRBSr+Ntwd17hUcby+Epio9WsZnEYfuwVKjOy2ROPhIn0+B4uuIm/t1gnLhkkPNmUb4oL3XoARDwWXxWjmWkmG5cbTZoBe1s08Z/MFn8I/XzzMIm4RogsJRIEw1Os+jYUEC+Q8w5lxYUi8VYBebDVSdewTTPg5wWJVChh3UWnB7jtPvU49O8EFP5pUT8Ez9pwrlbXFplgSTJ3GoOl2BrX5TmEqLUcvgVgO3i25r1ohfqlkxzOI2R9GKB8uXCp3J0nckOPeK/QE9orEfasFZ6pqTwdwl4jgpJV+lRhxfbHtbLG43ghPxZo6beu2tQUjn4nDRB4t6QXfLldo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(38350700014)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzBXT3RwMDdIUVl6dGtVQXBZWlFGb0VEZU5oanM3aENOZGhUVlQrdGx3Z1BS?=
 =?utf-8?B?MmNiUWZqamRhSk1uclVvTjd4M2U3WHg3em90djVLc1dFaFNxcUNZbWU0NWxZ?=
 =?utf-8?B?THF4SE83eUtNeVhtQUhCSnQySmpmbXhnV0t1aFRjcVViSHFGWTBaeHZvd2JY?=
 =?utf-8?B?ZVRjU1JzZlpuL0pTZ1E0dE1WZnVIeVBoNm1LOGQwMVNrRFhCMXE4UVdHRVJV?=
 =?utf-8?B?VitLRElRemQ3WkdkMUg4VVpBdEswZ1NvSnZvRlZBOCtGQ3FNVFlsTmpRekc2?=
 =?utf-8?B?RXpmN3E0cVFIN3dlTkt0b3d5S2NkWHFJMzRnU2g3MXFHQUxDYktQZHV2d0hG?=
 =?utf-8?B?YmZ6akZnTDRpak4zY3FrQTVzYWkvd0taNTJQNytZc0pEUlozTjl5dzNrREw3?=
 =?utf-8?B?ODlHMkNvbTMwZEpmeTArdUpKb3UyUUlXa2E1VDZpZU5lQ0g4UXhKU1RaQ0ZE?=
 =?utf-8?B?cGw3S09GalpVOWpCandyTmRpd0pBQm1USU1MNTN2K0sxWDREbzYzUzhlYytO?=
 =?utf-8?B?NlZ0VUJ2UXlaNXRtKzBoaEgxQmpLWE40bmxXZkdaN0M4SU5qK29OemVrdzgz?=
 =?utf-8?B?QWE4QkdiODJIV3R2RjVPeW1qM2hoTFFBN01OTUhjZEtVREV5cEhGNXdnTnI0?=
 =?utf-8?B?RDBCU3MvazdWOGY5OWovWlVYTTdnQVV5U3RUOTFhcTJybTFGeitkZnVZaVpa?=
 =?utf-8?B?M1pmRUlMKy8ybi9hK0cwTHBRdEE1TzllVGd0WnVUcVd4emg5MEhFY3cxYnA4?=
 =?utf-8?B?Q2t4a2kyb08zblVrdUZYQ04zOElUMWVGWHBZcmxBT3hZMnlVTnRKdjV2Sm9p?=
 =?utf-8?B?aEJDM3pEWFJ5Qm1XRGdjd0xPQUtCTmpVMlVVWG1JaVpxMFRkdFE0Uk5YWWdQ?=
 =?utf-8?B?eFpQUHRWRTZTVUpRRlkzTUZzQnlaWFlxMFNBd2hSa0VzeVZPanlyclJIbGta?=
 =?utf-8?B?UGQydHNGTjR6REtxMzAyU0hKUUpuVkNFYStldC9Tcm1sUlZ5RHhMU04xbmgw?=
 =?utf-8?B?MUszTTRUdzh6ZS82V21wQ085Nk9tYmxjcG11V2NYVTFNWGtwVjJlYWcvdzZm?=
 =?utf-8?B?ZXRPVmtOVDBtbnFFU0hNcUlsTGsyVmJ5M2NzWnc1RXJmcFdVcWQxREFuaGtq?=
 =?utf-8?B?MVZjZEhzWG5GMDhaYjlSZnVZY0V2WWx5ZTRZMU1wdmlLSnJlK3dwUVp4YlNQ?=
 =?utf-8?B?UlVCdy9DV0ZiemgyT3dERjhBbTJtWHU1U1R2RnBsQitIVThVWVg0eXQ1TTh0?=
 =?utf-8?B?V3ZsR2ozVmtmQnFENXllb0UxRmdkZ2Q3TjIwdTRiYURJVTl5RDY4VmxiWk9G?=
 =?utf-8?B?QzQyN0dnOHM1K2RiT2VTcXE3TGdPdER6TkdVVVZVNWkzell4YzZiUkVCdkZh?=
 =?utf-8?B?OHBtekpQY2diMnExcGVHUUNleVNlSUR3TGY5ajlpcmZqUUJzSCtubUw1dk5j?=
 =?utf-8?B?L2RFRzYzTDNURmVpNlF0RVpFa0taaFpDbG44UXFLNlhtZml0eVFmaXNMcXB6?=
 =?utf-8?B?amtiVlZ4RTRpS3IzelJRWGNUVTg0elZhNFAzYW9OV1B3Q1R1c0lyOHB4M0dZ?=
 =?utf-8?B?L3JyNHEzc3RXVkVVMXZNTTlIQ2tnOE9YZGpGRFl5OS9MY21mbE9KdGNRNk51?=
 =?utf-8?B?NURmbzNoZGc2blNHSzVhK0U1QVQ0Q2hDOGdkUXhRemd2MkpxRnYrV3V6YWlx?=
 =?utf-8?B?RWVCVGFPVWhlRndFYVBkbkI4TUFUMGJ0YTJienZSUE43ZGRGME5zVjhRM1Ew?=
 =?utf-8?B?dWZNaDZoQ253TnZNRFBFRjNYR1J6aTI0NlJqMXZhRmZaaENkNXZJYU9MMmxt?=
 =?utf-8?B?M3ozNTZQSWN2WVVTQkM0OVIwMkJ5cnJxb0E5OExJamhtN3p6UFZ1M1ZUMEZF?=
 =?utf-8?B?NEFWQ3FwbUFyYTVsU2JqZiszNzlaNFJXQzRaQ0IyeVgzMmtsdUR3YXVkcWtK?=
 =?utf-8?B?WDU1T2Q5UHNGSUFiOHl4cVU4MEQ0dDhRVUN5cldtTzA4MUtLRFpXZTVxRElE?=
 =?utf-8?B?NGVsSUd6aEdHVFpBNkZMQ1k0RWVjNnFKNjNCR29DMjFiUG1KdW8zSDVkV29z?=
 =?utf-8?B?QzU1VmZRZGQrOGNueGtSOW5XMzZxZzJWeGV6UU0wZXk5R25PSkFydXFveDFk?=
 =?utf-8?B?c0tHcXExcHBzcWJZZk52VkV2MFFyamNvcGc2Q2Foa1ZzT0RSVTdRcElGbzJj?=
 =?utf-8?B?N2JGWmtMSHdTR081WGt1c0g0U2hLeXVqbUprSmh6NW9PeVFYMnN1VlhLbkNT?=
 =?utf-8?B?dkJ2azBzU1NNNWd3YVA2aHU4OW9QZEg1OEJ1M2xVN1E2bno5cDVnN1pad0tp?=
 =?utf-8?B?RWhjMDJrUFdkS1JPaUJaSVRTdEllSUZZaE14bHI4UEpNU1FJUEtudUJlQ3F3?=
 =?utf-8?Q?6wKRDBf1GyIs1Mxs=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692a4290-9a08-4d23-6229-08df0a4c3e16
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:17:48.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbUJnReWLmo/3Ok13ae3tusEbAcLXm0VH+WoXGZhPHZPTk+2smkfbTfHCNdiQWC6Yb60SPAGbunLLMzWCF75BQU8jOXePs/llQ21ZqjEs1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB10345

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

