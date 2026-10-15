Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021139.outbound.protection.outlook.com [40.107.42.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB71407CF1;
	Thu, 15 Oct 2026 06:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044264; cv=fail; b=rIcv59M1uXcHxu6GzsplftTPbqYAxShk9iinhy24iuro70HhTd1JsY6oWJ26jrCkVvi/AZ7rlhIgsanlxa4eb8aqlfV6vnKTRr2uaohVuMrxRifxZk2UUYQbb3bgqBwhMeVxKbv1qZINxwCnmh3H5oJPqwtAJYG5lgGJ5dDbZPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044264; c=relaxed/simple;
	bh=a+8zCCfSLrlB+AiDYdToQJSqm1C5NGdTAV9V9jm6eIE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WVgq1i30s1KuelpGl++otyYwhfe7N2kKGxRYA7qVXdYG4VwrAeIFtAlSRRcW279Q2Jz3VaRrdCCTV2nXZIcMuGpKa2/X5sh5dRrKjihdwA3kk3YDm6LLtPVVcrWAp0/kF55WLXKGN8sMtS11YUn1eadyjMwF3yI3qfIzbnsEkr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com; spf=pass smtp.mailfrom=irondevice.com; arc=fail smtp.client-ip=40.107.42.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeQJexZZdA2A4VcsOUUqmzaWam12ppR50GPvkmRuimRGUKIVawTfkrlfQKIRXxEXmoyr0m0RW8SDUzJ1PnOCQDtr3W9us99xUQzkh4Uu3YaW0ptdIuZDX1xVfT4kVLAn+x8kCDndNJ+gLmzRqJNP7XJZeKHjCFbpmantiw60rkfx1tYruo41cjI+7bfIifHuyuLTo7NxZOiH1kIUwRicBsgePCmb0H7da+aHRxxJ1D+/5GiNm+rniqAMBzwlXAMM8D79uy3DpM4SyoMzudB/EWHQ/Mm0QoOgwh2ezaGAQ2jL+7f+VLPUtVr4rQoW6gUE+xMrmfbmEcP+HFCWguG8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4OC5sh1s4zRdlbjl2V4VPiy6DVKK9ZINu/GsYvA1Go=;
 b=Ycgc9jxItVUFm7PFwGL6VoQyGz+dLp2l9ef2a1PyBuQZWAGpd+psG5D9gPYf/cOjnu0gL37ebx7uHiOs3/5ccHSL34Y7SOJBzKupHrtM9GR9SIfoE7exG1Pb1nGtW9Eez0y2nuc7E41hj86Y8+6t05hO6RYvdj0CLKEdNjgK5NQ6rlXN0L8Xn+0ivJNNJRQspiAZD6NSZS5a/Lp3zYa9xtOU8hMAohRwJaqng7C0iUJb8ecQSeKVo2eAVtqdvhaj7cGyRca3e4+O1L4UvIr16T9CiHziaacEdpzsJTrt5LH/KsGKwRgHs+EAO9qvKQwXAXESd6MaCMvuqHw99pG4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from PU4P216MB2349.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12e::12)
 by SE5P216MB3199.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 06:04:16 +0000
Received: from PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 ([fe80::544f:7b73:fe81:9c85]) by PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 ([fe80::544f:7b73:fe81:9c85%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 06:04:16 +0000
From: Hyunuk Son <hyunuk.son@irondevice.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kiseok.jo@irondevice.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunuk Son <hyunuk.son@irondevice.com>
Subject: [PATCH 0/2] ASoC: Add driver for Iron Device MA5311
Date: Thu, 15 Oct 2026 15:04:05 +0900
Message-ID: <20261015060408.128711-1-hyunuk.son@irondevice.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0136.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::15) To PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:12e::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB2349:EE_|SE5P216MB3199:EE_
X-MS-Office365-Filtering-Correlation-Id: 348ab1db-0ffb-4a10-65e6-08df2a8224ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|23010399003|6133799003|18002099003|10067099003|38350700014|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ou1Mwx93N7DJLpcA6Qz/cx0OKIyXO+OSGyeBag3RE3ZT1xMBXofsYxZu+voBL6uBDLYk6GHkmZ0SvFsKG5kd8NhHOBgu5s2hrsRpXp31OWTl4Qm2EZIlMhUbY65ua35kVCEB69d4ua89zBXP6n9IJLuJoFPzkF3TkiZQaXKi/QF1VuebtX4zlTg6OU6XdtuwWtzt0eqsa4ZpIJjh6xWXIqBH5L6M0WRcF3OYeQyGeclxfXAKh5iZfSEopA2D/KAdDK/aEzTcDfEcmiaZApwpmaHHiR5OUItDiRC5TeMyXf1NXGcNUbpot+yn5WULaQ8cgSRdOIWvCG1m4U/yifPgrNyddUAzcONFgq1dsQX9uLFhkGFdikaLa4Quek+CG6nPA7dcvqQ/rGnpzRMD466c6uwIfu/kf0X10IySgapelEZpsKbhNcXVQZoxkDkrnLoNTfohrxZFHl7qOiCCdu7yS9TWX8V0+3Yy+oIR1SAZjrTB0Ff4+kMGKGU9qjxheg3Xcay4i2Zm2bdx7xFoKEo+8f9iSLw1DohGHkS7cVS2o6fQTWAv1eIXEaYHnUDwIewGQSFCF84FDkWBFcY2HfqbUgg5U38QqEBHSBt7dNysT1XHh0trUZjN2lfezSgFTz1EAJG5MqWxMtl9/V4GJt+fOqJ+wBchlgiWyttrmJlVl+WI4+9RcQUWffb86cvPov8m3EX02sLJUe6tI4eCEMDg7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB2349.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(38350700014)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TTdQb7nMmWB6qETgW9q49BxQwL8Cl7NAehLHkdXvmkLHCCXZy7jU9+sz7FvY?=
 =?us-ascii?Q?ln8uTAFHxRrVoF7El4So/KO//25r1H7byZPd058AOMlYmBsKI6Bm5tDfuy4U?=
 =?us-ascii?Q?h/w08XXwVBeH8XOhs1u5p9oJdvgq0AJQuMU2DMQno9odI3kaBPnYjzVuv88K?=
 =?us-ascii?Q?sQimDEhQVnEx1777y0gyw9Sy83GNxwk8V/dLYsVYO7GLCqdTBf19NAuCxJXK?=
 =?us-ascii?Q?jL6iTaeZkKvZNZFncVOHyyXiI0Do3C+OZNM4hpKdpBV4Ti4Q7Fh+aZr9sDpy?=
 =?us-ascii?Q?eOl1kdAHnpY/l58+/YLUoe/aKZ6Q+C6McwCb0NmhP+JQPDK5e/ETU36bXtsn?=
 =?us-ascii?Q?bL4ewVAioDFxnTJd5CC0wEyEdELo7GPcBzKHDR1eQ1OmZS8SRSPq6VU8dcFC?=
 =?us-ascii?Q?+X0DoPnC0xVkISlJLGmAAikUe+HQ4YQPkeO2hIykIk+mOTWGgist75e0xfXq?=
 =?us-ascii?Q?YGkPv1Fcz0SBvDxADusfXP4Ia9e2MEgTviOGMjoUjSaDla5sPHV+qqj3Aiiu?=
 =?us-ascii?Q?mIbl9hF1PxuNUf2sPjd+fAHeA9/WMC9Oe/5iV7YfXaHCuwcNelLkFazIZi5y?=
 =?us-ascii?Q?SSgzHMOqJArLHSAyJMFF2HDzd+MEo/5Sd5a++2ScaWFCrjSMXNCJO8fv6Kh9?=
 =?us-ascii?Q?NP4xfMBDKUOckcQtGam5KV/V2mYa6PpGE8SJj0zyx4yCgdlRmzKNJHB6F3zD?=
 =?us-ascii?Q?glMmAAEybOCnUjIwHA4SOwWeYDB9nIxK2HVU+qCvW6u+XJVQENct/ewJKflu?=
 =?us-ascii?Q?28uGXI+QteQz7mTsnq6mfSnjdxDoUDTDAnoEYRKXWypqs0s6AMOhdDdbDshM?=
 =?us-ascii?Q?eb7Zw79dyJHlpiLkzEwd+Y9/bo+dmkLyzsD8kEkxmC7a47dyX6NTTwLGeQFf?=
 =?us-ascii?Q?wu9/qN2nC8f6G2KlHcZ9OlskIyXfggG+hyoRHw5Y4Ge1lLdJCKCol8WdM5Mp?=
 =?us-ascii?Q?3IySW7XUtCB6wEtZ48qa+z2YVyjC5Ot63npKk/XBOQpMWPnvLUglD1a76P4J?=
 =?us-ascii?Q?e1uCKtW5lfBlc0FaTgfgKI5RgEW1yiOpb2TH/SmGM5doRgof2RLoRtxXaWQO?=
 =?us-ascii?Q?ZsWMrpAZSCQmFnqpCZMMiAEV7Nw+gtHyEuwLLBkiv54OqCMZ+t1AfbM2YeCd?=
 =?us-ascii?Q?3QJHHhGKbA3uS+ooljZDrFR+qv0HJgBmmzd5K1tEeFPR7sR6s9ND3UE1Qxv6?=
 =?us-ascii?Q?hkvPbzSP1jSNtXDnZsAQiGsfT1NQGtbaYD/YVddlFsITsJAOMqudNs+HlwLZ?=
 =?us-ascii?Q?SMF3fvowetKz0TOwBWsav4UWTrb3WV89v2vEs4YrkNBCTByVe9L4uowoiuMK?=
 =?us-ascii?Q?7S6XAHJaocO5DWO1bv4N2NIPwb8LFShnbfKAsFqTLzsyM+xWNq2VI/qjsOUg?=
 =?us-ascii?Q?4croxMeAakCex1qQNHZCawjlWpcdDdacihqGPaAeTGK+o7uq6byqtlg5yBYX?=
 =?us-ascii?Q?M/4epFY2R20cckIC9qzxvVnBN0tBvj5mpaX6a1bZ6809ddY+CuxdMoRBc4Tr?=
 =?us-ascii?Q?GLd9iVPETRsDvaXCOK3Lfr+w85XkpdFyvq2KGIP0Z/MOmLsKbjKHJabTVsms?=
 =?us-ascii?Q?Q5Z5h8ZBPLZjbzISS8iROibZZn37oAohOs0girWx2YmrFSWzcpeqLR+c9W9P?=
 =?us-ascii?Q?bcgU3Wspy+BS3prOWshC40BHTw6sgw0pEXwLw1zpYK95wQVE+VdeLPPFCCRK?=
 =?us-ascii?Q?ejMd8LowOqn0ZySYMXLeqMtE7awaktdoTnD0nVk9gJHs45w+zj62oCIcI48A?=
 =?us-ascii?Q?bXKBFK9h+boR6RrzrQdnmgkT4xKITc4=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348ab1db-0ffb-4a10-65e6-08df2a8224ab
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 06:04:16.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2rfqeZxgQwcPXocspQ+q9gxQx5Ba3lJb1cWyHcy9CiApqu5gDiG885IebrPPg0gQUr0hBmWUnRIjec7kSIBFFfQ1Q3BiHSDOVhBW9cCN6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3199

This patch series adds support for the Iron Device MA5311
audio codec to the Linux ALSA SoC framework.

The MA5311 provides audio playback and capture functionality
through I2S and TDM interfaces.

The codec driver implements ALSA mixer controls for audio
configuration and uses regmap for register access.

The driver has been tested on an NVIDIA Jetson Orin Nano
platform using a 48 kHz sample rate, S32_LE format,
and 8-channel TDM playback and capture mode.

Hyunuk Son (2):
  ASoC: dt-bindings: Add Iron Device MA5311
  ASoC: codecs: Add driver for Iron Device MA5311

 .../bindings/sound/irondevice,ma5311.yaml     |   69 +
 MAINTAINERS                                   |    2 +
 sound/soc/codecs/Kconfig                      |    9 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/ma5311.c                     | 2189 +++++++++++++++++
 sound/soc/codecs/ma5311.h                     |  520 ++++
 6 files changed, 2791 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
 create mode 100644 sound/soc/codecs/ma5311.c
 create mode 100644 sound/soc/codecs/ma5311.h

-- 
2.43.0

