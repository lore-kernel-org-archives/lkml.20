Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4B382368;
	Sun, 13 Sep 2026 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295117; cv=fail; b=K/hsKLJWN9Qn87QXN25xvSFFMsyRQSgWe9Ia7sOmn53NszCMnmd2HIR6Gnz1EaPjjvt0lfJ6wtofz7pjSBTLR82c4FT9JCVL856n0bYVKLMLj2sFB43IwleRRIW3BFmvbI2gz6tlsGjHR77cs21lT3Rwq5n1Q2GjSYRGZ7/ZtqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295117; c=relaxed/simple;
	bh=lXHWHFr19d+qfZrVGvU8Yq8FztUUe6IVLD2ddBzjgp0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QTYFynFNVomgyfEZ4I1vLgO9JaWZBLcnI0dH3sFmH0FMyIOnyBQHFKn6TXP6EtnLpc2fH1NQXjxNVo7DrgJDVK+J9o59a+RFZ1h3OzM5QJpUCyDmnL/F3IryyowoZ7B0KKted0kDU9ZdUBUtBJUTP4ml9AlJUQxSo3t+npCMyv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WUndibVf; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WUndibVf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8z66XLiqWIv0sS6zK2oCfB1bLrZcUA/OSqr5kS/xX6J0KXUtvJuCwomxf6X4f4PyU6cl525TuTy13uYhWtz9bEj8CxmjdtDOZGV0Lq4DozF5aZIj8Yrs1IfjG2N/7ePsxbDXG09PJW6LEEmgBoBPzGy97ZQ8RVHbyJ2I/UoqLGlMPJRDRKzOi1mv1WaUShKCYyhhhym86z+losnSCKA3In8WjTlcCRyemADePOUoSe5qWRjDllyTxJThbwLCFvOA3vhGVsrTyLbKYREFzLLU3t/UCsdzj6acNIJ8e94sThJS2Mq41PlVa8HRn52JvMoqW/dfe7K1Ht1dP8FiM761g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSyGxMCfMFqYMhS8Sx+8xzgx6AmwX+a1J5W1Ka0Ydo4=;
 b=jIFRqurEjH6chEZAaSjxjY6tGknhjNHSMOighPe+cLmpOkNjSpZfS6YsymNXlrlwYd8JGBPJGuzTix1p6A5G0SPFEC1b0YvUgMU0wTGU1uLZ7psLwpmcfX/TZcRUGMb1FpQ8/Tpp7sAq3Z8zFtJVIsNo1KdntxUraIR0ZaFnvBCquc9IfN8Kcdzf6nBbPBzS5kaw07ZEOdoWwHcU0L5ZzHDv7FPzqVx+tfR9wTnXWPihGwv2Ipn4w9nBLJVscfxGDyGISpn7ItrZuhbg/5LY6R9skwKad6BH6aam3IZI2K2mA8Zb6HYqi2sJr0raI51g2a8dL0hoKBUNKyO4X7A0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSyGxMCfMFqYMhS8Sx+8xzgx6AmwX+a1J5W1Ka0Ydo4=;
 b=WUndibVfYmOME+y8pXIAaBktPDwbUPZIwU3cBLioP/Xr8yQyqpLKVkieD2+0xwNOZ7N4O1upFfp3qaaUcp4cth2vYG/wLhRmzOFCEG6wUyZiqmolpKp5C69/uDb6hmxEX7NReNpLTLwSq64hasQ3oVsTJfcfAsY9ugTwNDSTRKG6VX38MH9YKIq3wZKj9JdbqvPPiI2+F9Pvgr83obg1efd30aMCtEbnCzyjWyZW5CBlCnp0+OyI2kdu1oxuNbriV5DnKv9YMCu0PJclKYFst4Kfz9srVUEopmlnHA5YsdRTs+97xDk75CpaYbyn54xMrZpwn5jPy3p741jiswszeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB7006.eurprd04.prod.outlook.com
 (2603:10a6:803:137::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:25:10 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:25:10 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ASoC: generic: Free jack GPIOs on card remove
Date: Sun, 13 Sep 2026 19:24:58 +0900
Message-ID: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0207.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::13) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c8a118-43fc-41dd-2382-08df11814a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	fMkfUkEPLs668B8kLBoXjQb8d+4BrnP/2f/bmdMq2WhQK7hkXh0niB3l7YfHyL3qfxRLZrnunMgj1GHDdpAShWoxLqdCcScB3/2xbz8DCUxr+8TMRCiPr7WVIzMVL+SmZszZUT7jIq6WbWLZbvqwCJ7zoJg9UaWuVnyCq9/2fFTNTfUfCL+b0tos87NYOTb6N0E5QbQ8qvVXMDNyNmx5eQWUiYgNDQmrPCmJ+oe+7k/N1pECEuHpiR/lD8LYU4O1aeTlRqWWQyJ8lp5RSdC20yu+bgVjJtWYLSA0HtDMwvvCIvpDfdz2KLfF3umwBUpudwdXCCaRQrryehGXEmXqkt1tH2py939KaxZwhuJ6nI99FeS32hJfdpgq2fX2NBJsjtlwbfqlsFMKHoM4yeWF9tL7YNaKOX4DStah3YAwF9yaMU3aGB0czdPYCnYY/M91G5yLlH0tQxx+sl8sSsw8vG7JNzLhUNCFCrDOlaysMAiZDq9Eqv+WPlKzskccsVJdH9+yj0VOTuqCcu+ukY+6vWXbl0m9uMvlR7vBKicaOOqX4ae8gDlamaHjGu8t/EIMWwAT0+9S8SxChRY7ERcuG3R0tsAWpzlDjArO0AoNtuPS4jhTHR0nlJNuLzHKVuuFkNWnq0oLx/8tmVEkZpqgdyfwCadO1ChHZDsKlCaabW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LsZ+IMEpgb5iRPu+zcoSIR4hLIiDVse2GnspoLgV2RpomVPbNXtgD7dpedLY?=
 =?us-ascii?Q?LHYlWlZW9mPDenTTi7BvjvDXCSUoZCM6Yd1hDjkDDuMZjCU0ga8hodzGd2pp?=
 =?us-ascii?Q?GNLqCMU3ShezedKizZAH1SW/Y+2zoTRVSmmJ0IMDx037ebRGZrUVEt6qfXs1?=
 =?us-ascii?Q?3DCXGTz/6zFAEBALcnzCmT7juYL7a4yPo1k+PGZgCqBYsuXj0gA3Ym/evQ1d?=
 =?us-ascii?Q?J4Rg0toKCqRQe8nT/u0eYkeX9defB5uo5dvcIg8ejKGGp4y1KD7Zg+hVf7mg?=
 =?us-ascii?Q?uggdwnZ/2wwNDptuzkDrRVRLyF9a5KNXPw+jTtFh76BZ0AkVomzsSV2hsV0k?=
 =?us-ascii?Q?ppKA6LARvbyaSaCrBuIaPKyExYqJRp0eklhBONZsI0X2HAxs9xQNI2j5XnoL?=
 =?us-ascii?Q?rxmSzzAvNOSvMYGtZ8aGF+V/sN0Phk3HW7xzU75hH1MgHPToXBiR1FZcakWj?=
 =?us-ascii?Q?b0/Jw9ToC2kM70dr/Igyo5SnYZIHhRsKRHUwZHOq3QrijyUg0rl8ZDyZ6T+t?=
 =?us-ascii?Q?6LRCGL+xxz2Mcy4aLbphURFC9/sd6u/h8YkS8AmAntQr0+dJwfiWGBZ3nMqL?=
 =?us-ascii?Q?1J/eV0h7K9NM25FRs1gmAJD3bvz6Zi3KpjA+dSUIvAH1AKS0+6eum7hB6t82?=
 =?us-ascii?Q?COcH/SjbUcssKpwXBQ5/QZ6uTJqaDNIhVMr8hhBFfiGF+mpHKiNR7KKlMIov?=
 =?us-ascii?Q?t1NONEC+5l0PfkrT/SZ+o/O2WtRx9+o8HlVAQ8xbReqL1XbHon6zQ98Wk7qa?=
 =?us-ascii?Q?3iD/ATF+X6TaFEpUpK/P8A6vCDBs2QOi8ZUwb3pTDyhV65RTQNaAcBnOBN+V?=
 =?us-ascii?Q?rdhavBjNOhmJGB6C4mrTRSGyib+HT5mrjiKmSpN17Lf3PgmEJYgRrcrgHvWq?=
 =?us-ascii?Q?0n/F4mbI6dYQTKTupMgHo7A/v1CrRWmchvKx6NPar9RoTAh4DpGxy31I9BFk?=
 =?us-ascii?Q?hIJhM83r/G9GPLpkY5dUV+qP7g7W3sOYSz3ZARC88oPDzhcrTJYC6S+XQ89L?=
 =?us-ascii?Q?WeRCFI4GF6MItj1xIWN/bX5IMLFM25xEBNXnRO7I4NbtArwb7KPyQ4G49mbf?=
 =?us-ascii?Q?oCPXq5d8DxEySZSbVUxpdECr3qnyZr3XXbw9tkNRdHzdQUSYFMh1bHkx5+UQ?=
 =?us-ascii?Q?CHzoSg6plbOe2ljyIm/PesAM5t0H50C2B/wJUfQczJh2nuPdAgzs4bgEcNy+?=
 =?us-ascii?Q?YRgnaqO9AiQvfiq842icYEnIoEjl13f5+a3nLYkJo5dE/pjGUds+EHkLveUr?=
 =?us-ascii?Q?OVzrSA2Ja7TmSfrRJ6uUyHWTbtGYRfhTF4p43D+U7QxljAHZRG1rbylWAGNU?=
 =?us-ascii?Q?hw8b97w3H5ZRFJjOe6RNEKddWPOMDeTn/ORJ/XFQQeKwyQxmMrWu0eKdVE8+?=
 =?us-ascii?Q?K0KhLuya940ZKcWtG5RBbpONKTSpi28i2ztQIlx0YLBGvJEPoqx/7vcInlSq?=
 =?us-ascii?Q?h0FieY7T4+55AsPMbmem9RgNVBxPY8gbGyt1HsGFPZ1DraWNNm2j8Yd+f5Gz?=
 =?us-ascii?Q?rCANHVho1KrDLMtFseGLnUWJMH0ROfoKO2Y1sX4oAsmJKz5WzEG7eS0HfIsm?=
 =?us-ascii?Q?sN9Jmy39+MMFZ3v+fkziXSK22nTn0F/pYX/1rBuPQ/jG1dNAE4LdSx0mQDsR?=
 =?us-ascii?Q?EVvNhnRbIeyY/5u/mX9Ss6KXRKcmNNd/gIpfy3FLLAiAhDSXgdeZXWeoGsxD?=
 =?us-ascii?Q?V2tNiOil2+JFKy0HMmaIkjsQ3aocDAcuruefXCbT5aO/uik0SR16qpgViV12?=
 =?us-ascii?Q?jW+B/VWC0JOqJnFZTWGVg6OGEHA8Wa/+hwcntSm3UZs6sx12pRl8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c8a118-43fc-41dd-2382-08df11814a34
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:25:10.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtZUaNc2FF9z98bjwbmmWfSU4PClVAU0VJBhJMHZNxvwKVxtukMYT4BAIlxOdme6gGzwKbj0A+kPugxHUolz0xmrnTz0aNWxQ3x+FogxF2jcYVxi+G3SbLJSkSg6fC4w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006

From: Chancel Liu <chancel.liu@nxp.com>

simple_util_init_jack() acquires a jack detection GPIO with
gpiod_get_optional() and passes it to snd_soc_jack_add_gpios(), which
also installs an IRQ handler, a PM notifier, a delayed work and a sysfs
export for it. None of simple-card, audio-graph-card or
audio-graph-card2 implements a card->remove() callback, so none of this
is ever released.

That goes unnoticed while the card is only torn down together with its
platform device, because the devres cleanup registered by
snd_soc_jack_add_gpios() is tied to that platform device. It becomes a
problem once the card alone is unregistered and registered again while
the platform device stays bound - for instance when a codec component is
unbound and bound again. card->probe() then runs a second time and
gpiod_get_optional() fails with -EBUSY, because the descriptor is still
held by the previous bind. The card is not registered again and audio
stays broken until the platform device itself is unbound.

Patch 1 adds the simple_util_remove_jack() helper, patches 2-4 wire it
up in the three generic card drivers.

Verified with audio-graph-card2 and a wm8962 codec using hp-det-gpios.
Before the series, the first

  echo 3-001a > /sys/bus/i2c/drivers/wm8962/unbind
  echo 3-001a > /sys/bus/i2c/drivers/wm8962/bind

leaves the GPIO line and IRQ claimed while the card is gone, and the
re-bind fails with

  ASoC error (-16): at graph_util_card_probe()
  ASoC error (-16): at snd_soc_card_probe() on wm8962-audio

after which the sound card never comes back. With the series applied,
both codec unbind/bind and platform unbind/bind cycles release the GPIO
and IRQ on unbind and fully restore the card.

Chancel Liu (4):
  ASoC: simple-card-utils: Add simple_util_remove_jack()
  ASoC: simple-card: Free jack GPIOs on card remove
  ASoC: audio-graph-card: Free jack GPIOs on card remove
  ASoC: audio-graph-card2: Free jack GPIOs on card remove

 include/sound/simple_card_utils.h     |  2 ++
 sound/soc/generic/audio-graph-card.c  |  1 +
 sound/soc/generic/audio-graph-card2.c |  1 +
 sound/soc/generic/simple-card-utils.c | 21 +++++++++++++++++++++
 sound/soc/generic/simple-card.c       | 11 +++++++++++
 5 files changed, 36 insertions(+)

--
2.50.1

