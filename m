Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020119.outbound.protection.outlook.com [52.101.69.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFCE310779;
	Mon, 31 Aug 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172132; cv=fail; b=sN+HKccRv+yHCBGNdBFDM2/FEpyiGDOEmrOsGClgLglVKwPrdxgfNvPZq3nIYXf9laa8M/qaa6NHibXABk9ZOp1qgSSKVRd0uhmNz3JWs5oaCU4sILWiWsthaD35323A3aXsL0BFPcTi0gEMEi4VkCvDATuN1LSZzD8bKxndDrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172132; c=relaxed/simple;
	bh=2mJudS94ibJFFLOU5Tuv6pkjfMqa31UNatNdtkbU+R8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VEA8IBV7e8LeMk+nV3SYeUs1MN5cTnVp4teqTNxw4Yntx2WGbq+etVF+wQ8JpQg8D7kkxtgDEpjBzKWv871Rq/LhkFk1UHOCGGS/ToTWYJPKWz7u1GKPlD1R1oxzn4uv/kKgnOOUGDmtLliqyWJiv8e3WZWDylUQFsbdtHVUyq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=k4SjDp8F; arc=fail smtp.client-ip=52.101.69.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="k4SjDp8F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1nRb68CG1wrbpZO5xfQpbEWdcz02dzNrYKF8QLauFeXiN6AoMcIpcmR5R9wTZpL271GIOCcrNh8yUO3gTaFwPgM31xCGzrCm/BiVy0SGmCeD2rej8H6xrhCBAncT7C3z/aM5YH0rewunPOSY5pp3eTkA60AUrM54N86WiCoD0SMEG1BCvlpcHVo2666P9fAlctMWxWplarxsFL7riYhnM7uWXmBtZbx7GnioV/rSeSxLDddM34fCZ8xYdjyErGyXaPSiGwFzxNtEmfVq35kr4qZx1Ckxwqj3/5SJVCSJ0NVhFaoTwfeBtJ/ZEtCivTmW8pbTSidHly7i90wmNX44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qLSfygVLSfdsdHi0iPB6cGcxzi9EKcp1ekzBkx8sgM=;
 b=M0rAyOYaQawnJL+Zm/FEzQm75PxGoxYG7i5/EBuWopnpFw2OQmUTLQVPH8ULmtynyqFZBRM46hG0wiAW5x7ImZ5ALudZzxiPkBiomOdYd2YEO7yVTYpW551T+Rkb1F2V4OmNtf55FMMEtOAjF/tEphAl7HxLeiYNxJUg2n77OTGk1UxAVoa1rTqugOY7kA0/W6eeJEbYGG3ZU9DJT+GhxjGagGRSqzRDYFtiGlJhBMQebN50lDdAu+zJzeeUoM3OPqVCRvjzCq+b6V3w9LxhntoU1J4SFDXcIarMJcinlPJdRSo3JJH+23u8LQvN3TtZBjC6GUETAI5D0XyqRZ88nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qLSfygVLSfdsdHi0iPB6cGcxzi9EKcp1ekzBkx8sgM=;
 b=k4SjDp8FrDB3A/jzcL290PzEN13gftK2+8jzcRMHCxHsh92+4YwvaBOo9dtdFKBkVnjl8VHvkf6tOFteYPuATF+v5+QxbP1Vvhj8+4o7+rRbReZA64mf6UCasLH1uSi2T748GMYVdAMvOVbPx71f5nsqKqZPdf8sZeTCSi5ea7vY53Y0mL/9xCIESGFs/aWzq6HqZVG0YNv0s8JnFTzpwMp6Sn9Q2fcqqKZpckxxWgHWUQcV/Yvy2La7XIoTWBzyUHeoYTneQvEZaSXORSOReOmlQXdbChCoqP+Pz36LjImDSFP4/V9F+eYMZ+7D0hFjhw4EgyoljXDJLSvWQh3YtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by PAXPR06MB7950.eurprd06.prod.outlook.com (2603:10a6:102:1a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 10:28:33 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 10:28:33 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Mon, 31 Aug 2026 10:28:25 +0000
Subject: [PATCH v2 2/2] mux: gpio: Add optional enable gpio
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-add-external-mux-enable-gpio-v2-2-f6027a4afe61@vaisala.com>
References: <20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com>
In-Reply-To: <20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com>
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788172111; l=3479;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=2mJudS94ibJFFLOU5Tuv6pkjfMqa31UNatNdtkbU+R8=;
 b=GFKSmUHTX/7ItPpzTctnsQ4khKklaR3+IqnyZvgeNgVVgOInGTU02BzQGcYmUrAERAIYQ+doQ
 rumxrJvq5DDB+qL7DIowi76cxEKLvKXfcgR2JGmlKSi8qLSJfQ/RuzE
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GVZP280CA0090.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::12) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|PAXPR06MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fedb419-7978-4e0b-f657-08df074a9bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|56012099006|10067099003|11063799006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	SKjYh6Hf5BaaNEtFSIwkHatJ0UQYm3OBj/eq643Yn0usjPM00VJqJkGe93KxsxVNySk7fC02abBr9xUgDkPg/u+fACC3uP5l+7okxZ1SW2EHAwGEouHSYdpntzvuiqOEM+X59LM8zM/e5i2KRffX1eQwUGP2N4C1P/CNcTW4kqnwv8memCjKmcyqs5rGGMRSenvgj4yG5H7hnqC2VgnhQNbpWLc2KH9doMz9YoF0LtjL/EZjAOGuHn9L9tZ0b30q5Cf0wIRC90QPUoPVkkfxkooWzGpkNjJIjtRDYyZXPGFXp1xCFdMzkqL/ybzPIE4D0e85C36fh9kZf+9wGKuT8MZ+35pIdnCL5QpMsBH0u6e0XBzNJD8fP7ebzNgdUJmgrJhxr0KnDaOqv+hm0QR1KQQJllQIFQnp+tXZHh7y1XeM5oYmx8TFRe5MDtOeCMjp8hzRy4B0k4Ehx10eiihTU41m3WXR0zGc4g/IAd4d/9IqDpYNHG2Y0fh+xG/c/rwsrLHxiqg4OzkF6/mN66Oce0UaReSqfVUs2SV1m4JVXyv5igbGSd2QIGskZ69ycGciQp+2IBxywhEWRhVLI2bwSHsz7JKDfOJevuAntjmM/e2QHogT5kModWvEMfPiKgEGX9Am7OF63+i15AU7sWMPnrv4CPDtn6UQsMyiPwO+MmW9SfS85T+pZwNXv1jstnBJXgx5NZNVn6HTlRismGY9ecfLKEXZmCysKSK6l3Zf7P0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmZwallCM2lwM2I5UVAvbVZKZ25NVm9Hb1FYL0lIUzZjb2RsOUVjbGJJYXA0?=
 =?utf-8?B?ZXd5Uk9IVlR6dk1hdWZXVCtjMFpiWXhuM2ZVUnc3aXBoTDdnN28veEJKNG10?=
 =?utf-8?B?ZXd2WWFyU09yVGhvalQ2a2lHMXljQXFyYXV5SHBRc3cwREtuNG9DVktVVzdI?=
 =?utf-8?B?MjI5TGE3UkpkQjl3Z253bW5QZWtwR0ZkN0JFbk11SnBkanp2MVFPUWs1V3hj?=
 =?utf-8?B?NUJIRVY5QWxjU3g1Z1VCWWZYY0pUc21ScU94cmRtVHp2SEJuMzJIWm9CWFps?=
 =?utf-8?B?eFJUNnVGclozL2IvNHBuUGhzWTFla0tHZ2RsQnIrRnMwbUF5UFBQYTVJdytp?=
 =?utf-8?B?Vk1uODJ3a1BzZ0VNT0hNMUlQTkhlZ0VzUkRrSEJ0Rml0cnV3SFowdVJjWUFO?=
 =?utf-8?B?dUZDRjFpS1lFSmpiNE1jN0E1ZTVxL1dTM3BqU3VVSVIzSVY2andCK1BFenFZ?=
 =?utf-8?B?Tng5d2o0ZUVvNEh6bklWWW9Cb0x4UGpxSDRGN2ZUZk9paVJZallBN0Q0RGdw?=
 =?utf-8?B?M013M3NrQm9PcC9PM09xTkxBbUJoa1FBemZxd1FYUUg2TnNES3ZGZTFUQUFp?=
 =?utf-8?B?L3A5bTZ2anhZcUdJTHpLYkdmOXJyZkM2Wk16SUdid0o2bnlmemU4ME1Xa0dn?=
 =?utf-8?B?eFpURjJyRmNVd1NDSXpFeTZaQXVFZWg3R0pCaGI1NE5hQy9pN2VEWG81dmdV?=
 =?utf-8?B?MzZ4MDNOZlhNUFAyaW5OOWVJcjNQM3BiSVoxOUxFUmtGRmJIZHdKNi9pZVd2?=
 =?utf-8?B?Zmxxb1p1TkVUSE5ZRTJQNzJHTHZRNzlnY203bXQ1SmFFby84VFM0S0VSRzFV?=
 =?utf-8?B?SHl5ckVZNExUaGl3NDdUc2RvMG80MSsvLzVTVjhlZzZRbWNRYkZTOWVTL2k2?=
 =?utf-8?B?cmN1YzBtUmphUlowR3AyQW81alk3QzY3RXNHcitVUkFtMjhWemwvODNEdEFa?=
 =?utf-8?B?THdMUEZndDFVM3pXSzR0cklKUXlGd09BTzJxUno5aFhzbkhpalRSMXZhVVdo?=
 =?utf-8?B?TlJ2Y1E5em5VTHNFZEo4ei9aUldRUEowTzM0aC9qTXE2Rkh6dTZZQmtyRjVl?=
 =?utf-8?B?WEJoTnRhaE5XK0d0U3lzcXFRN0tVZmgxK040WXNOdkJ0d09HaFJCRUQybEMw?=
 =?utf-8?B?cnJOTWhVYlFKcU14NW9FWldyb0xkNVRKdlFCbnVyQzVRQVJjRXBaQzhET2ky?=
 =?utf-8?B?Y2NiYlhQK0l0VExucmtTRld2QThUclZNUzFKT0t3UDV1ZFZtRDhvRzIrL3Zu?=
 =?utf-8?B?TENjd1BjYlY4VW40SGJLTVdEUWl5V3c4N0JDZ0k5djhCV0Z6d0NjQjZZVy9P?=
 =?utf-8?B?Qmgydkt0UFZXWS9ZTXRxeUNiOXRmLy9EYTExVXJQajFRR010U1RQVjRsd3ZG?=
 =?utf-8?B?NlpUUXJ5dzJDRDZGeW5rUUEwL1NCN05MekdROXFDS0lqdndROGlONlJ4VlRw?=
 =?utf-8?B?NjFHd3o3SGhXMkJnYXpFSC93dVovTHdEY1ZaVkRhU28rOFBhZldUWVU5c3lq?=
 =?utf-8?B?QmM3NXVzeW5KQ3VyanhLeFZXZlQyLzg5ejhtRjRVMThNbnd2aExJQUdxT1VO?=
 =?utf-8?B?ZEVtUmNpdzZwdTNTWE1rWFJ2eEk5N0x4Z0FXSU1YMWd0WE0rZHlxTDZBNms3?=
 =?utf-8?B?c3V5MDZLN1VQWXhzV3VMY3NiYjIweE54ZXZJVFp3eWJZTXplMGNJTERGaUVz?=
 =?utf-8?B?alhjTlVjSFl4M1hHQk04SEFEaUxzOFN0a3FPdmtVMzJrUkYxelV4eTFmWncw?=
 =?utf-8?B?eDN6UWxyM0VqN0VId2R5Z3JIUkpXaEx5dHhtRE43K2hWMnFXbVRPdWs1NHVq?=
 =?utf-8?B?dzZrZGQvSUc3SktYMVlWYjJ1MnA3Vzdpdi9KdkdpVHp4Nlk2QytkTUl2OFNP?=
 =?utf-8?B?bC9QMjRpSEZLNnczYkY5MXdublpZMlJQa21OU25tb2dkdSt5MitwLy85SGdX?=
 =?utf-8?B?V0RycWZIMnQxOVA5N1VaMDFDaG90OEJoejlwZFBwbEYrOGpGeTVHeHAvbDN3?=
 =?utf-8?B?cjdEcDdZNktIQ29rNnVBMjhmMy8rWERIOTRBd1VweFpOQy9WekFEaHIvWktw?=
 =?utf-8?B?bHlnZFJLNk1NSGNrUXc3NWFMWDBBbHlkYzZRTU9vdFpwOXJKWGtwajdoR05R?=
 =?utf-8?B?N3VSbk1ucnBhS3MyOGU4Ri8wbXFnN0NEM2h1cmJnUFZORHhoK0l1cm5hcEJN?=
 =?utf-8?B?Z2xPOUs5TGNmcEh4blZxUU8zdGFoemtubkRIUGhCaXdva0lXY2hjOG9IcGNs?=
 =?utf-8?B?dzlmYzg2TitTMXNEaFZKbWRWSTJ0aFBTTXN3VWRWRFJJMHdBWno1OTRncnhX?=
 =?utf-8?B?a0V3aU9wL1czY3ZBS0hEazNuVFJKTHQ5WWZDZzV6Tm9aUDBiNHgyb0JCV2o3?=
 =?utf-8?Q?zGoAp3fBOvqBp+2Y=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fedb419-7978-4e0b-f657-08df074a9bc7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 10:28:33.3149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SlMPjt5+AWI0BHDpG0lHlfOCpYT2dX3suyXVKUAPFZQz9vBWguJN41o0yiRLrI//gSQCsQZeeekMsfpb0qt/bHfQmph8BajU6ZuAIXm8Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7950

Analog multiplexers have an enable input that disconnects all channels
when deasserted, independent of the address inputs; on a 74HC4051 it is
the E input. Add it as an optional gpio.

The mux gpios are not updated atomically. gpiod_multi_set_value_cansleep()
groups them per gpio controller, and only controllers implementing
set_multiple() update theirs in a single write, so a mux with its address
inputs spread over two controllers passes through the intermediate
addresses on every change. Deassert the enable gpio for the duration of
the update and assert it once the address is settled.

The enable gpio is also what makes an idle state of MUX_IDLE_DISCONNECT
possible, which the mux core applies when the chip is registered and after
every deselect: it leaves the enable gpio deasserted and the address
inputs alone. Refuse that idle state without an enable gpio, because the
address inputs cannot disconnect anything on their own and mux_gpio_set()
would instead drive them to the bit pattern of MUX_IDLE_DISCONNECT.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
 drivers/mux/gpio.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index f9c7863e51b82fb76ed03cf17308fae74716cf6d..df5d24214bd5fa8c3c1d733b25d32ca88c06c8c0 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -18,6 +18,7 @@
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
+	struct gpio_desc *enable_gpio;
 };
 
 static int mux_gpio_set(struct mux_control *mux, int state)
@@ -26,10 +27,18 @@ static int mux_gpio_set(struct mux_control *mux, int state)
 	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
 	u32 value = state;
 
+	/* The gpios are not updated atomically, disable the mux meanwhile. */
+	gpiod_set_value_cansleep(mux_gpio->enable_gpio, 0);
+
+	if (state == MUX_IDLE_DISCONNECT)
+		return 0;
+
 	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
 
 	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
 
+	gpiod_set_value_cansleep(mux_gpio->enable_gpio, 1);
+
 	return 0;
 }
 
@@ -70,14 +79,27 @@ static int mux_gpio_probe(struct platform_device *pdev)
 	WARN_ON(pins != mux_gpio->gpios->ndescs);
 	mux_chip->mux->states = BIT(pins);
 
+	mux_gpio->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(mux_gpio->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(mux_gpio->enable_gpio),
+				     "failed to get optional enable gpio\n");
+
 	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
-	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
-		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
-			dev_err(dev, "invalid idle-state %u\n", idle_state);
-			return -EINVAL;
+	if (ret >= 0) {
+		if (idle_state == MUX_IDLE_DISCONNECT) {
+			if (!mux_gpio->enable_gpio)
+				return dev_err_probe(dev, -EINVAL,
+						     "idle-state disconnect requires enable-gpios\n");
+
+			mux_chip->mux->idle_state = MUX_IDLE_DISCONNECT;
+		} else if (idle_state != MUX_IDLE_AS_IS) {
+			if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid idle-state %d\n",
+						     idle_state);
+			}
+			mux_chip->mux->idle_state = idle_state;
 		}
-
-		mux_chip->mux->idle_state = idle_state;
 	}
 
 	ret = devm_regulator_get_enable_optional(dev, "mux");

-- 
2.47.3

