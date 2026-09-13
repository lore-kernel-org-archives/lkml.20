Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E2E356754;
	Sun, 13 Sep 2026 10:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294545; cv=fail; b=pIk8gcp6888DmvBxAXur0rkzj9tfYL8ogitRbRHY1vc7K9gb6pRgyowpM+UNgsRO9YF3oij50FrPuSHY+tqfgu2LAee7iecElDfgcaLhcsWtWvOAoPEQiKrMBRYpm6SKyV7kYVw86KUQA3T0Ex3vvu3n0gs4Mq5PL227D0KWjCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294545; c=relaxed/simple;
	bh=ffXIHdgVqhmpL+fXQTaDvv5PzHEGw7pQmduRUoEQEFs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZXD6zVuPcfBtoO/GxDzh+zciXoOpPr+eGGbSyxucPnzSFanD9ImJx+R1Da6AoFsipTXBdrvetdFsiQ9v/v5kB5XBO3wpgqrWFs/N/iUGkokaZzf22xE2x0p39SFg+qec7I5pbgOi9RLwU5Jliy86OfaVYNxRNAZOppEBGIgibxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pfs0VBLp; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pfs0VBLp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkNkMhGPsYb8En9HWJeaIuMK86XNCj8AIlHvsyz92jl3CbI0CyO19ZFoNlgICa+ZmX6XmrNYVQr8GG08A0ZgHYYdorGI0je5pi4/Vof6Rv1NhlTNOSr+u3ddWdrHSx6KK4RqEvEEJtDYrhLRKxs6sDb/TjhkV+hZqumpSYHPiz3bGaqpGtoG47RmBPO12h1m+2Sb4fPSOGjAaIXdv3VNx6BRzrrcWcFqkuc62OaT03aLXYQbdq+5ORWRSyTdcOL0aRrfVJ4OkvFdFozJdDpFjtrzYqt3M245SZd8URLxq5YO8DsvKnfSiUiZ4Gdj5GzR+l8GVYPbjkLCowS7AF1xxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=214g3Hrmx9dKXLQQtoBYU3KBWem1DzSKW44Gd5Utrtk=;
 b=WDe3NIduLNxSTHiwGMAEARImeNXM+ka19bcKHIxQZlscX/awMtlAlQcLeKynn+qAPx797Bv/IKkOiD4bo77uT26Wjb8ucUMnDkFVsYnGOYOkUTIpS+DLZd2F+cNWPmkTv1mbAxbGbOzr00gZcvWq7A5mp6NZUdtLQFFcT5UD8RIPTTX9LsGiMpfV3YPTXiN5Eidda1dQ4ksYtwLgSOTCx3Sh1aeahLZAk98BcQEJJR1ZaKWZcfg8H1voWOxVDKnw3VitgfeLSmiZWTpzUL8szSm6p5MKg1hveFLppGzxWe9DGFDCdvxJ7qAwN+nK/LkxQKkcY3pKT7hTH/fj7ks+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=214g3Hrmx9dKXLQQtoBYU3KBWem1DzSKW44Gd5Utrtk=;
 b=pfs0VBLpwF2dx71OD/nxYk+CzbL27jr0+e81x27QAXGJkoJfyMgnkjaD+v7UyXbL79Z2VojhxEtpIwiQ369dhRIUViXbv4Ac9kmbQWjkv6+DzXBAtGCq7mJoxeqbadbFkgy836J6UWCYN0N61pATpNLxKza6i7z6+z9GDj7RLt8OMXj4ID2TxVhEk2l914og8J3QEuB0CLKTta/7n1eh31VW1fw6+Sq3n88UqRpvZvUwDy3G+oZz7eR4a9JIwtPpvL56tcmQdvPlt033qp3kJiKIY81WeJXW1SeUFq+mzksD+R9b7xSQHepflv5lgwljUxNZgNUXp7Xp9Xy7/PqwOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:15:40 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:15:39 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] ASoC: codecs: Fix resource leaks on card re-bind
Date: Sun, 13 Sep 2026 19:15:25 +0900
Message-ID: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0028.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::16) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d26b23-abbe-4cbc-29ce-08df117ff5a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|6133799003|18002099003|921020|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FgKVlKDTSdw+P1WHYzooloNynF4q13AzWBCXmmQ7QEpX/cPO5KQ8vQ/+OudkJsERRB1S0RkmYntLKwUQqvVft1RH8ykRgP1SylAKse6+NrdWe3LNmOdG/3i021/yJhXPiqaDfebaGBNoUtJpLu8oyZcv2cYtJsLPd05056kSX+pvhOlhgsYJ8PIMXYPfVSGULwIkFvUQAHZS0mVRfFS/EZYdowssQdXbl3Gy+PuddpMKu1WBJiBok2XzNwsIAr3iKcXWL57xK0KVfoWTh19j1G5aSuEbM1UYC+pBk3aV0nWCLgPJ7LOgwfnBfMnCGBVTH9OC2eSJLDptu3XFaURVfyxQ3bTgncH1ZcUqls6xjCZNxhZeNZE9i7zcroiWjEG8JR0swLWidWK2gZShznIPZrwXJPDAlBUALxjsoftGONsTAMVT9w7NIgvJJYeHvZ/PjBWsxGb+yzGQ1BgBJ1F34amAOFzmfK+WXf/aOMbxHz0t2R7Mh7+PSyxtHlhly+jL26WjU1CO14hcMk+KEIVhv0EPVDdBr7Q5JftuSkUGc+WL1K2cACwSkm0rfW759ODkzru9ZnhNBGK6lqZHLyJaJhOjXZ0w/U+/bdvChU/jBLf7aY0aFEI3FIapMBko3ftFe3Tf/wJQTgsYCixUp5LHp+/PYzjjt3BTNUe5rnJ4hM/Mbrgx9kwEjxGVIBm1vJdNvI3++6vhncIvg1X99SoKUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(6133799003)(18002099003)(921020)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4k7qtqj7S5qjDkH5PXidceN8ShsRNdU2sWNniidV5IreV62qTPS5jj3erkpV?=
 =?us-ascii?Q?5fcMpFFLpcanIX/a66FXdt7MzYP2ZrriZvSrh+A8KpaLUdhp1ewtct3kjq1M?=
 =?us-ascii?Q?/ZQyVLMkGW2Q0DDuW0x3fbqYzW/EScU6QPA7Nk7f3O4VVZreZvN8gxxsNCC0?=
 =?us-ascii?Q?9Zw/HzmVqD/YkYI78Ayz7ggGX7QnolBCP4i1S9c031EEalQccxVzGKJjLq4D?=
 =?us-ascii?Q?6IEA0p1LGlGwokkCzMRAEK1yjO60RR1/v6WFlip2l1w2KbpZranjmA8AQW0F?=
 =?us-ascii?Q?Le4L0Ki11c2/oDYffHHRTZzIM2JQ/vtjRGBZHaXWS7aFAVGFEb+42CTxSBgU?=
 =?us-ascii?Q?99hqM1sRHSLFZPsQo25w0eOSSyVaRlH5spCJJlm9QnERjOjtq+ca1qwrAb2X?=
 =?us-ascii?Q?bEt/s7XIjDMBYWthjjc0lSxhtBJUwNZxyfbWQ16iC2zOej/x8RqsG6J5UVAu?=
 =?us-ascii?Q?hFgoMNOQ5ZZ6wPlofbOnA2+au26PR30A4MSO/uxaakFxmMfp4YGNPyyxtdot?=
 =?us-ascii?Q?nbJq8eY81Pni74V2LBxwvCsvh3xR0mut1QPa8QQAA9NcjuUiuM0vTlEKwAVM?=
 =?us-ascii?Q?Td+9tmNOtGITxIuhcBSTTQIgfIl8Hkp33aq4IwhWjYfRdNpYsX1uvlcJgYZe?=
 =?us-ascii?Q?3di88Y+D3/WNB/yQblRJZq4j5+LnkLkt1VTKj8fiz4xw9e7YsVmYJ5VFfa7Q?=
 =?us-ascii?Q?TRRlqehi24Gvo4pjBkM5q7cALRwD5bRN7clmh+dypX1IrZVCVWrF+NCv72sY?=
 =?us-ascii?Q?lxfKK+/KzKRb1k/1p4sKb+yVscYj0WlbThJdypqcbxRoZBRIjNs12sTZuirZ?=
 =?us-ascii?Q?ZV+BLFfmsFx566cBBUNVXI/NeRsL6NAlcV3ycCA2ZOo4dgWPbrdqTIozEw2w?=
 =?us-ascii?Q?mY87bJDDvHoCy1SvmOZ7KohMHfpui5n4ofL2XUmgr3wk4wG6vgNGBAQ2TzZi?=
 =?us-ascii?Q?xbwf2Chcaf6HY0NIESnYJ4wbH78DQ5eVBciLRLwhmA9y60EAP8vB1+9yrWU2?=
 =?us-ascii?Q?FL7jDKoOEOrvY8blP95U4yU2k2vvp3yAGCqAJ7L1czi1XJVdzjUvOh72zuy5?=
 =?us-ascii?Q?GoVJaWUDQAI85cyK6jXUOYayg8y2jDZXQ0vfzM+/2fgIAHTOli4wM2BchaPR?=
 =?us-ascii?Q?wB7ZGkskyBYIaWYfjfJY+5dlzGPQKsOXhkuWXF94l9hFYAzm/VcALMvc5P3X?=
 =?us-ascii?Q?Z9RXAO6byoQOQd5twwHBAqThozMjvd8owOI5GdJNXt1+3hUZswUWyhq1R/jq?=
 =?us-ascii?Q?tLp2bfvKmp3QwvdSG4APdF01kkMSGN7s3vlpNqR6Cn5zA6SqdDOrWDaxOpVn?=
 =?us-ascii?Q?YHzCdmsKl42Bqi9I+Yx2pm07FYRxd+JuCfgPTBzYW+2mSXLF2KFmdPZbtWhm?=
 =?us-ascii?Q?45aArKr7LYjN73p6R8em6YWcCkYtNpt83Quzrc4b1snnPMTejj1u+e7t8AVh?=
 =?us-ascii?Q?UhAnNYgmPEWBbutMd+Tz/ABdTqoGyZu+oH4sRpopUHp0zHRmKlJgA0vSi1Jn?=
 =?us-ascii?Q?806g2m8XsS9m74XDovnw2F4L+PsKR7cFfTyXi+IcNlVzhp2zYcUYxaXY+not?=
 =?us-ascii?Q?WJYGOi9V9eZev7Lsn28QkkDv+U+KCLNuNXoDroKdlsqgEAYI0CTm+4BJ/mHF?=
 =?us-ascii?Q?hnhpL2miE/FqlWG4uqy6bz5LorQRn/pBvrKaCNhcJ6i5C1XZV610tn38tNP3?=
 =?us-ascii?Q?X0GFS/ElW/SrDAWME5RVfoILzsy9gLcdYM2lVtlE3BLt0IrJ2m3aC2+A+tPe?=
 =?us-ascii?Q?olC4CZZYHR0EvDU2UhWr0gzgHTtcmXHb/dEl/v/Pq+bRY3+4jU/W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d26b23-abbe-4cbc-29ce-08df117ff5a5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:15:39.5879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dow9kbB4Fx0Oa/uEgb+S2MVGPOwS2JesRlyfMypG+h/FHG0zkfX1QaZh7S4bk/pLOTA0qqj6HzvazgCcJK+q8XRqcRtOK22DNmTYLBrHVVCgDUQQj83Nczw+IS+MuH/p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602

From: Chancel Liu <chancel.liu@nxp.com>

Several ASoC codec drivers set up per-device resources from their ASoC
component probe, but the associated cleanup is tied to the underlying bus
(I2C/SPI) device rather than being balanced per component probe. This is
fine for a plain probe/remove, but it breaks when the sound card is
unregistered and re-registered while the bus device stays bound (a card
re-bind): the component probe runs again while the previous bus-level
resources are still live.

Two kinds of resources are affected:

- Regulator disable notifiers (wm8962, wm8995, tlv320aic31xx,
  tlv320aic3x)
  The same notifier_block is re-registered on the
  still-registered regulator notifier chain, which triggers

    notifier callback ..._regulator_event_N already registered
    WARNING: ... at kernel/notifier.c:23 notifier_chain_register

  and corrupts the chain.

- Beep input devices (wm8962, cs42l52, cs42l56)
  A new input device is allocated and registered on every component
  probe while the free path only clears the pointer, leaking the
  previous input device and its sysfs/input node.

The two problems need opposite fixes: the notifiers are registered from
the component probe, so the registration is moved to the bus probe so it
runs once per bus bind; the beep device is freed from the component
remove path, so it is switched from devm_input_allocate_device() to
input_allocate_device() paired with an explicit
input_unregister_device() on that same free path.

Verified with wm8962. The remaining patches fix other codec drivers
following the same patterns.

Chancel Liu (6):
  ASoC: wm8962: Fix regulator notifier and beep leaks on card re-bind
  ASoC: wm8995: Register regulator notifiers from the bus probe
  ASoC: tlv320aic31xx: Register regulator notifier from the I2C probe
  ASoC: tlv320aic3x: Register regulator notifier from the bus probe
  ASoC: cs42l52: Fix beep input device leak on card re-bind
  ASoC: cs42l56: Fix beep input device leak on card re-bind

 sound/soc/codecs/cs42l52.c       |  9 ++++--
 sound/soc/codecs/cs42l56.c       |  9 ++++--
 sound/soc/codecs/tlv320aic31xx.c | 30 +++++++++---------
 sound/soc/codecs/tlv320aic3x.c   | 28 ++++++++---------
 sound/soc/codecs/wm8962.c        | 52 +++++++++++++++++---------------
 sound/soc/codecs/wm8995.c        | 41 ++++++++++++++++---------
 6 files changed, 96 insertions(+), 73 deletions(-)

--
2.50.1

