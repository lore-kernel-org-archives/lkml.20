Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022139.outbound.protection.outlook.com [52.101.66.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AFA3CDBA4;
	Thu, 10 Sep 2026 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030346; cv=fail; b=E4IWaonm6YfaIh6pzzIpaVZEDUggCqxBWgI19KRm+WllmR/fIO+hFv6Quc3G4nTAtRhm7ZB/8YpBwfXzPKeqo7UuBZWp1DvOOuUuKDUBgz/NNbgGU8MhunLP46vuGy+eDkBhX37+lfzFgHLO3THcXzxU8G2TSBxUMoTV9UJrSJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030346; c=relaxed/simple;
	bh=2Drz4Q38XqDkPt/qJItK68gNfD52xwQsHoAN05KgqAI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UJN74Mk/NIqR1Rjj5AWYGD/mEKWVLv66dBQ18Rg5ScpgEXAxS7B8/Yt/a9ZqvWeRtUPKtlNVNgPKtojSYfm7aWqVtOMIPv41gNtGmi3sAxWdiFDE5ZFr1oK2v1lt9wHd/Nyx5lx3rze+1EgLYgqNOJr7ygspOWeE9koDfVuPr8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=CcNK/mrj; arc=fail smtp.client-ip=52.101.66.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="CcNK/mrj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7RwXoB11y+VqSCMRPXtaVEHAtJxxLa1Co7UGJFHJlLOZxVcvuoeO73m3SYnF+5salCNO3phO6fYq08eG3A+zkK3+jASS1XGq9weJTR6/yTELW9Es5iyToBxVbkEj67CqSCXLTlg6cAFXUqJck9CS1o7bVIQECoRHMnCAaXsSC8M/LgiwQfkedhHp0v37VIYmPBuR8G3WdE90xahD1DI26wNccLX7yQ3XWJfRY6a7jGoC3ajUI6CeESbkCCSmZ19eZWVKL79ue1YYp9AuPkaigtS+OMmhjCVjPtAPZmWsMPZg0tnxatu+dbaAN07UGfcmVPmW7VCBzVsyy/hSrBPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok2c/abxz+6IWgDp8RbH9m9DfEfhB2BRQ/cbk5wcdxQ=;
 b=yNLfJfTHoSq40bwPRhDiw2zza2jb1GlwIki2DPAdxAjy0s2BCUpvo58guOdYqxGbJSX8rc/CsU3b/CizaiCmvTyGnhLT7wVChG4qQIyMXeomL67l9mSWsY4u7qmL2ahJMth+uyKYedB0r+XXjE1FaI7zc9mt3t3Mm8bZv4nCvD5M+TTUQxNeQp+hZSmSlibdAqm1CGOpsaBfpa/X2q43mwLOxVseA0KYbO8wrXP5+CiJ0s4vhireTRvmwmhD8qMOKlvpcXAMUZPX1dN63QerOCIB1fpo2dQzZ2R4/lgcK/Q5PzHeP8JEasEfG2hY7TXXUrm4UlWRFykwCF3mWayleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ok2c/abxz+6IWgDp8RbH9m9DfEfhB2BRQ/cbk5wcdxQ=;
 b=CcNK/mrjy9UTn2du8wQqoxd8DY1SvEU2xDvMDsOKLn3THZXXjsGtwGIXPxi9RVzV+b9ZC8o2HM6YK5k17JRHMfNhUkBIYYLbrtgDEVhC/BBp5KP6oxxUHhDjYe/6XFgDD2c3hKmLWcNp9ZHKg1+ZZxQp+FaxpYxc6+e0uVethV83xGli3cmKWJMpWYHFmcxWvD7CImA6J5ursAV7Vne9Y6IOv3bOgQBfeCsIFBDYCn2WPXV4HM2MnFggg8q1QHC0K6ObS+Irz2XnLcF54zTXNr2j92KwLdtzK2rt7u6BpkofxCI1SY5psY81JfmvLYqqu0zgIvH0lArHYbN1ICxk1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by GVXPR06MB8873.eurprd06.prod.outlook.com (2603:10a6:150:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 08:51:56 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:51:56 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Thu, 10 Sep 2026 08:51:42 +0000
Subject: [PATCH 2/2] regulator: Add MPS MPQ4210 buck-boost regulator driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-mpq4210-regulator-v1-2-d37e208dfc8d@vaisala.com>
References: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
In-Reply-To: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789030314; l=11335;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=2Drz4Q38XqDkPt/qJItK68gNfD52xwQsHoAN05KgqAI=;
 b=5adUlva3x81fbnr5ISGrBrkzYEWOLjnd/dW1lCxOudkSSpe2OIWZrRIaNBvLDb7OwK8wxll+h
 zHkNg3ozZCICCgcL1l9l7V3nHlbUYln+L/Km3I7LrLEQC8HHSoRGVcw
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
X-MS-Office365-Filtering-Correlation-Id: c193764c-28d8-4d1c-277b-08df0f18c478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GAaiIOoAiEPWZU+l8RuXEnI1XZ9OHAQ5xeBpNq2uMjjvyXiiZTGwxp6jHUt4naBe+g7v0iwEkYHb4o8mcIatYFjycL7COCnI8p8NsGsut803kjKsRbZas+fzhkynFwGCpvfQRg6lc4trNu5wHiTlUAMh1/WnalcKnr7MncjE2RAbx+5a0uHb2P7Zr8XqXFyGtXBKr3szsfitopY54eY0TQ7icsBgssH8it+Bejwy0ny13b9gXdVa4LDBsIw+5V55pvgBq7drHrifcISjursQWMQDx9pdvNUmamGRxB637HkYkyRlkUC+Yovjb3JLPqkxgULTkZQE2dMpd9u/VjohbCtBkEcy1e0HIXn78dk9RKfWyeONSqzRk+D51kL1UWk+5HVSekgmoU7iHl1gcqCDtISyePVAcuF6Z8mNS39s8vcdeLwlc9w5LIuOCvy4IQ4l8gS5XQdu9fpdZ8MhAr9N6PwSJ4Q/FKvweespRNB+B8OKpmy6QsNVqmVTmYqqFeRIVAUnGJHybePKiJO4ch84DYp8JlUA0byGRmwiaSHEpHcGx6xZ8SIW4RHh4kj3SdJTKYGGGpALYjkBlgcKab9Zyet3GlZ74C0MmLKU7CIC6NwpLCpdZP+JqduQIbgG96iIL+Nq4VIg3MA/igPdU9BOoTIM8EaopMqBRFNzuOPgCgDWb0kA2cBDpqvsgGfqxbFUJfiRLsAn+f6sD3Xs7NgavbOFZIZv3E2bQ01+auXrBm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlVMb0xnZktBQVR3M25XaHE5bnEvTmF0K2N6SVhRL1RFaEpMSTlGbzdLUmJS?=
 =?utf-8?B?MDFDRnIwNnYxN1piT0dweVlNUXc3dnEyWUFTNUsxM3dnUUkvb2NtZGtpNVlF?=
 =?utf-8?B?YktHTTRIK2c3YUJWN0Z4aFArY0MzcTQvZDZqY3dqMzV2ekw3ODlFeUgvTzZ5?=
 =?utf-8?B?R1l0WUQyUTI4T2MzY0t4d0xKRCtxRUxEbC9yZFlNaHU2ZXFETDZXV3pRdGVr?=
 =?utf-8?B?emJtUXEva3FnVCtJYkxxQ2xPM3I0TWtBa3lWK1FucCtvY0pxd2RHenpOTVNz?=
 =?utf-8?B?REQvT2RzdkZRMU1kTEsyaUtKdEtUdWN2S1NjdzgwVGY5OW1uU1hMdUtPTjkr?=
 =?utf-8?B?aTVvL3ZRNlJNVUh6aGQzeUs0T3VwRWJISWtGZ21ZR0FkbnpRL1R2bjU0U3kz?=
 =?utf-8?B?NmZHL040RkhzV0g5MnFFOTNXQVhjRDZsckx0M1Z0L2Z5Qmk4bjhTVmdLUXdu?=
 =?utf-8?B?TnljTTdkT2JTbk1xZG80aGZ4YkxLQ2c3SGpzdjhVWlVUOHVnZ0Y2R1g4OGZu?=
 =?utf-8?B?dERWb1ZjTDRrOStheXJ3VHNSamFabGVReHVFTWRpQ0xRalhOZkhPUkIxcUFF?=
 =?utf-8?B?aG9hbU1iOFRGUXU1ZzRaWUVBZmEwTGRCK00zc2xyT1hidldUMXY4VTBKZlBH?=
 =?utf-8?B?NmJyL3hQK1hnRGZYQk9iMUZ6TERXV0V5RUhkZGc4RlJBbmowNy9WTGJhMHRE?=
 =?utf-8?B?YWYzZFNQbXg0Wm96Z1NIbTdLaUF3MXowWFNNRjkvVUdzQS9CcWdHc3JwSWt0?=
 =?utf-8?B?OURLa0dBK2p2WnF3a3pVcmZMZlo5UEdHQU1NSDZrUDBCbGM2MWpjMjFwSEk4?=
 =?utf-8?B?dzd6aGVyY0FEUFFPbWNzb2xnUkltM2VSbHprTWNBTHJUNGhtTkJhdTlzRXdT?=
 =?utf-8?B?eGJtMTFpblBSWVdPRXo5Vi9zQUdwdFdkWTBKcy9ESTBZOEYwWDdiQTVoMERK?=
 =?utf-8?B?Ukp2RStRcHN4WVVoZ1B1UUZzUnkvQzNKRlZsN1hGUk91K2JEYVJiRnB3ZC8z?=
 =?utf-8?B?Szl6RzlvWC9TWVBoUG14NGtkbkhwRThEelBOL0RKOFkwS1BBVUZuTUVrTjdm?=
 =?utf-8?B?QjM0WTA0SkRtdGlVTDdJaDFmWmM0ZFg2ZlFlb2RrVklwSTRpdUlreitac2xC?=
 =?utf-8?B?OXpZVUdaOU1XcTkrK2V1TTYyQktRVnMvbEI5Y0M0c0ZqUkhtQTVZbVFOYW5W?=
 =?utf-8?B?NG9EM1F2eUJacGtxTVc1SmJOSWJlc1ZKb3Npa003TDVWVjV4S0Z0d0dtbGdl?=
 =?utf-8?B?Q0dkMGkxTEFTaEc4WjFnSzZ5WjBlNXZJUUV6OXpxLzV3NHBPMnRXYmlmaCtK?=
 =?utf-8?B?eEhzSXpNVUNDc0l3VlJ6QU9aTHhZam5zYlU2NzNSRlByRmxlWHBnRjJHbEJr?=
 =?utf-8?B?Z1JUZ3BEaC9VbGJYdGV2RG8rUE1KL1JMOFpWeHI3Wk9IWmd0TUJ0NFZ5YkxH?=
 =?utf-8?B?YzMzU1R6aUVVMERQL2hJTEt1Z0thd2VQR05UV2M3MzJKZzc4cU5pSFZQRkVG?=
 =?utf-8?B?OEh2K0NweTVhSlduSTh2Qm1ZM3BJeXNhUDdnM3RweGlwdDFUUnJQR0Z1c24x?=
 =?utf-8?B?NWlsQzRsSkQzUUJuU0NsUjd0dXRPZDVycGlVNEFwSjB6alFQVG1xL2ZTbnN5?=
 =?utf-8?B?QXFydGtGbkZzVWtIY29lUVBuaTdaUzRzSjVzZ0JFcEZ0MVhKbkZLNUdZeWdl?=
 =?utf-8?B?b08xSlBNWEtyVk1IT3A2R1oxL3haSG04SklPdEo5ZCtKYjYvRzB0em9pdVFI?=
 =?utf-8?B?eC8yQ0tmSkVIREJ1NTBzWjVxRmE2RTZUUTMxMmFmVUsrR0V3SHVhL1N0Nkh6?=
 =?utf-8?B?SFJLV2wyV1IrRkxNQWF4VTlPU0xlN1FqK1BOTWhjMS9aS2xaMG5raVFQSDN4?=
 =?utf-8?B?aEpMaGJXZ2s1d2dZMXhwd3FPMDcyeVBSZ2pwMGtXcndjcktodS8vVWttRjdt?=
 =?utf-8?B?ekozSHovNzFWaGV4T1NxeTZCZHppbngwcTUrR3pVUzRQSDJGeDVXZ2h4WXRR?=
 =?utf-8?B?U0VyWlhZZDRBMnVQbFl1ZWR1VllnM2pQbFlXT1NvaFNrUHc4Ym12ZXZjdEFI?=
 =?utf-8?B?TGFOUlFJWEZwUkRjVFNDMUU4QjZqQWRUdE84RnRmYkNuUTZrQUh1Um9WUHFJ?=
 =?utf-8?B?b3JPU3RxTFc4N1FNdGdUOTZiOTFaKzN1cEY3OWxNVFVjUnNNckJ0SUU3eWw4?=
 =?utf-8?B?VHpNaldJTFhPUThQMjNRVnB0WFBjSUl0TldkcTRGVDc1Tk5KY2F1Y2NVNTlK?=
 =?utf-8?B?by96OW9pS1NjKzYzNGRTMTN1aFZtSHBNeFNwRXlzNXMwa2s2bVdPZDBnL0dp?=
 =?utf-8?B?cktzWHVtbStjTlF3TWkrbnZmU0ZiNWVBNzduMWtlNEhhUnNtTTRBbFRLbTY1?=
 =?utf-8?Q?IV1Lb0UdYFdlUIkM=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c193764c-28d8-4d1c-277b-08df0f18c478
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:51:56.0610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hn5fKviUuPlmp58vJNtynqqg6xYAzw6g1T4siCGXCodT9Hsd2/s4Dixe8EzeS2iOxcUFHQAktg0WHMvEgWrjQ/hpCZ/NYwiPG/yaF4G2SKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8873

The MPQ4210 is a 40V synchronous four-switch buck-boost controller with
an I2C interface. Add a driver exposing voltage control and enable
control through the regulator interface.

The output voltage is programmed by an 11-bit feedback reference DAC with
a 1mV step, split across REF_LSB[2:0] and REF_MSB[7:0], and is then
scaled by the external feedback divider described in the device tree.
Only 0.3V to 2.047V of that range is specified, so linear_min_sel holds
the driver to it and the lower selectors are not offered. Scaled by the
divider, that floor is not zero: 4.2V on a board with a gain of 14, and
the core narrows regulator-min-microvolt to it.

The same divider ratio applies to the slew rate, so the four reference
slew rates that the Control 1 SR field selects are scaled into a
per-device ramp_delay_table and the field is exposed through
regulator_set_ramp_delay_regmap(). ramp_delay is initialised from the
rate SR is currently programmed for, so the core waits in proportion to
the size of each change; a board that sets regulator-ramp-delay
reprograms SR and the core uses that value instead.

Enabling follows the start-up sequence in the datasheet: commit the
reference with the GO bit, wait 200ms, then set ENPWR. Control 1 bit 2 is
documented as reserved but has to be set before the controller starts up,
so probe sets it. The controller does not respond on the bus while EN is
deasserted, so the enable GPIO is claimed before the first register
access.

Link: https://www.monolithicpower.com/en/mpq4210.html
Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
 MAINTAINERS                 |   1 +
 drivers/regulator/Kconfig   |  11 ++
 drivers/regulator/Makefile  |   1 +
 drivers/regulator/mpq4210.c | 243 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 256 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb552bff791bed27b86d5e2a398d0d96253efc6f..78d28c103eb14d90e2566a00a089e66e34d0839b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18376,6 +18376,7 @@ MONOLITHIC POWER SYSTEM MPQ4210 REGULATOR DRIVER
 M:	Tapio Reijonen <tapio.reijonen@vaisala.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
+F:	drivers/regulator/mpq4210.c
 
 MONOLITHIC POWER SYSTEM PMIC DRIVER
 M:	Saravanan Sekar <sravanhome@gmail.com>
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 89789ac7a786c8c4c4a750cdcaa27a205762ac18..df7742533f22cacd4b012259f6e10d1e663c87c4 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -870,6 +870,17 @@ config REGULATOR_MP886X
 	help
 	  This driver supports the MP8869 voltage regulator.
 
+config REGULATOR_MPQ4210
+	tristate "MPS MPQ4210 regulator driver"
+	depends on I2C && OF
+	select REGMAP_I2C
+	help
+	  This driver supports the MPQ4210 synchronous buck-boost controller.
+	  It supports get/set voltage, enable/disable and ramp rate selection
+	  through the regulator interface.
+	  Say M here if you want to include support for the regulator as a
+	  module. The module will be named "mpq4210".
+
 config REGULATOR_MPQ7920
 	tristate "Monolithic MPQ7920 PMIC"
 	depends on I2C && OF
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8df834de6f7775574e4bbd1d4dd8f6ef..af69a0ee877d8afaf80b3b4c293661b5900ac78a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -104,6 +104,7 @@ obj-$(CONFIG_REGULATOR_MCP16502) += mcp16502.o
 obj-$(CONFIG_REGULATOR_MP5416) += mp5416.o
 obj-$(CONFIG_REGULATOR_MP8859) += mp8859.o
 obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
+obj-$(CONFIG_REGULATOR_MPQ4210) += mpq4210.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
diff --git a/drivers/regulator/mpq4210.c b/drivers/regulator/mpq4210.c
new file mode 100644
index 0000000000000000000000000000000000000000..227136d8225805a759d2d6545637858ea7122b89
--- /dev/null
+++ b/drivers/regulator/mpq4210.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Monolithic Power Systems MPQ4210 buck-boost regulator
+ *
+ * Copyright (c) 2026 Vaisala Oyj
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+#define MPQ4210_REF_LSB			0x00
+#define MPQ4210_REF_LSB_MASK		GENMASK(2, 0)
+#define MPQ4210_REF_LSB_BITS		3
+#define MPQ4210_REF_MSB			0x01
+#define MPQ4210_CONTROL1		0x02
+#define MPQ4210_CONTROL1_SR		GENMASK(7, 6)
+#define MPQ4210_CONTROL1_RESERVED	BIT(2)
+#define MPQ4210_CONTROL1_GO		BIT(1)
+#define MPQ4210_CONTROL1_ENPWR		BIT(0)
+#define MPQ4210_INT_MASK		0x06
+
+/*
+ * The feedback reference is an 11 bit value with a 1mV step. The datasheet
+ * specifies no reference below 0.3V, so those selectors are not offered.
+ */
+#define MPQ4210_REF_MIN			0x12c
+#define MPQ4210_REF_MAX			0x7ff
+#define MPQ4210_REF_STEP_UV		1000
+
+#define MPQ4210_ENPWR_DELAY_MS		200
+
+/* Feedback reference slew rate per MPQ4210_CONTROL1_SR value, in uV/us. */
+static const unsigned int mpq4210_ref_slew_rate[] = { 38, 50, 75, 150 };
+
+static const struct regmap_config mpq4210_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MPQ4210_INT_MASK,
+};
+
+/* Scale a feedback reference value by the output voltage divider ratio. */
+static unsigned int mpq4210_scale(unsigned int val, u32 r1, u32 r2)
+{
+	u64 tmp = (u64)val * (r1 + r2);
+
+	do_div(tmp, r2);
+
+	return tmp;
+}
+
+static int mpq4210_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
+{
+	int ret;
+
+	ret = regmap_write(rdev->regmap, MPQ4210_REF_LSB,
+			   sel & MPQ4210_REF_LSB_MASK);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(rdev->regmap, MPQ4210_REF_MSB,
+			   sel >> MPQ4210_REF_LSB_BITS);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(rdev->regmap, MPQ4210_CONTROL1,
+			       MPQ4210_CONTROL1_GO);
+}
+
+static int mpq4210_get_voltage_sel(struct regulator_dev *rdev)
+{
+	unsigned int lsb, msb;
+	int ret;
+
+	ret = regmap_read(rdev->regmap, MPQ4210_REF_MSB, &msb);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(rdev->regmap, MPQ4210_REF_LSB, &lsb);
+	if (ret)
+		return ret;
+
+	return (msb << MPQ4210_REF_LSB_BITS) | (lsb & MPQ4210_REF_LSB_MASK);
+}
+
+static int mpq4210_enable(struct regulator_dev *rdev)
+{
+	int ret;
+
+	ret = regmap_set_bits(rdev->regmap, MPQ4210_CONTROL1,
+			      MPQ4210_CONTROL1_GO);
+	if (ret)
+		return ret;
+
+	/* The reference has to settle before power switching may start. */
+	msleep(MPQ4210_ENPWR_DELAY_MS);
+
+	return regmap_set_bits(rdev->regmap, MPQ4210_CONTROL1,
+			       MPQ4210_CONTROL1_ENPWR);
+}
+
+static const struct regulator_ops mpq4210_regulator_ops = {
+	.set_voltage_sel = mpq4210_set_voltage_sel,
+	.get_voltage_sel = mpq4210_get_voltage_sel,
+	.list_voltage = regulator_list_voltage_linear,
+	.set_ramp_delay = regulator_set_ramp_delay_regmap,
+	.enable = mpq4210_enable,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const struct regulator_desc mpq4210_regulator = {
+	.name = "mpq4210",
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.ops = &mpq4210_regulator_ops,
+	.n_voltages = MPQ4210_REF_MAX + 1,
+	.linear_min_sel = MPQ4210_REF_MIN,
+	.enable_reg = MPQ4210_CONTROL1,
+	.enable_mask = MPQ4210_CONTROL1_ENPWR,
+	.ramp_reg = MPQ4210_CONTROL1,
+	.ramp_mask = MPQ4210_CONTROL1_SR,
+	.n_ramp_values = ARRAY_SIZE(mpq4210_ref_slew_rate),
+};
+
+static int mpq4210_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct regulator_config config = { };
+	struct regulator_desc *desc;
+	struct regulator_dev *rdev;
+	struct gpio_desc *enable;
+	struct regmap *regmap;
+	unsigned int *slew;
+	unsigned int i, val;
+	u32 r[2];
+	int ret;
+
+	ret = of_property_read_u32_array(dev->of_node, "mps,fb-voltage-divider",
+					 r, ARRAY_SIZE(r));
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read mps,fb-voltage-divider\n");
+
+	if (!r[1])
+		return dev_err_probe(dev, -EINVAL,
+				     "feedback divider R2 must not be zero\n");
+
+	/* The controller does not answer on the bus while EN is deasserted. */
+	enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(enable))
+		return dev_err_probe(dev, PTR_ERR(enable),
+				     "failed to get enable GPIO\n");
+
+	regmap = devm_regmap_init_i2c(client, &mpq4210_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to init regmap\n");
+
+	desc = devm_kmemdup(dev, &mpq4210_regulator, sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	desc->min_uV = mpq4210_scale(MPQ4210_REF_MIN * MPQ4210_REF_STEP_UV,
+				     r[0], r[1]);
+	desc->uV_step = mpq4210_scale(MPQ4210_REF_STEP_UV, r[0], r[1]);
+
+	slew = devm_kcalloc(dev, ARRAY_SIZE(mpq4210_ref_slew_rate),
+			    sizeof(*slew), GFP_KERNEL);
+	if (!slew)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(mpq4210_ref_slew_rate); i++)
+		slew[i] = mpq4210_scale(mpq4210_ref_slew_rate[i], r[0], r[1]);
+
+	desc->ramp_delay_table = slew;
+
+	ret = regmap_read(regmap, MPQ4210_CONTROL1, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read control 1\n");
+
+	/* The core overrides this if the board sets regulator-ramp-delay. */
+	desc->ramp_delay = slew[FIELD_GET(MPQ4210_CONTROL1_SR, val)];
+
+	/*
+	 * Documented as reserved, but the datasheet requires it to be set
+	 * before the controller starts up.
+	 */
+	ret = regmap_set_bits(regmap, MPQ4210_CONTROL1,
+			      MPQ4210_CONTROL1_RESERVED);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to write control 1\n");
+
+	config.dev = dev;
+	config.regmap = regmap;
+	config.of_node = dev->of_node;
+	config.init_data = of_get_regulator_init_data(dev, dev->of_node, desc);
+	if (!config.init_data)
+		return -ENOMEM;
+
+	rdev = devm_regulator_register(dev, desc, &config);
+	if (IS_ERR(rdev))
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				     "failed to register regulator\n");
+
+	return 0;
+}
+
+static const struct of_device_id mpq4210_of_match[] = {
+	{ .compatible = "mps,mpq4210" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mpq4210_of_match);
+
+static const struct i2c_device_id mpq4210_i2c_id[] = {
+	{ .name = "mpq4210" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mpq4210_i2c_id);
+
+static struct i2c_driver mpq4210_regulator_driver = {
+	.driver = {
+		.name = "mpq4210",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = mpq4210_of_match,
+	},
+	.probe = mpq4210_i2c_probe,
+	.id_table = mpq4210_i2c_id,
+};
+
+module_i2c_driver(mpq4210_regulator_driver);
+
+MODULE_DESCRIPTION("Monolithic Power Systems MPQ4210 voltage regulator driver");
+MODULE_AUTHOR("Tapio Reijonen <tapio.reijonen@vaisala.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

