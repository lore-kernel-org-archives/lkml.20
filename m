Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023076.outbound.protection.outlook.com [52.101.127.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81FD13B293;
	Sat, 17 Oct 2026 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209659; cv=fail; b=n/M+Q/GoyauEnN1Fwrb+IQoUIf7yz5ZtcJnoU9qmZF3eICPJmUh6OeXJ77+qBYMf5bqkXC/pGy2MFdDm4wSQdCZQpc4HgPmAB7g6+3xJH9QgeWzcfC/FiHSnfp6/2ZakhnAHwv3eFlTVxQNEMD0vaqJXk+X3Q7WwjSevPnNX3hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209659; c=relaxed/simple;
	bh=eewtY3e7fNKuL7c/ss9C0rkFb5NEsGOcrxOBnabWCm0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kl17PHYXFS+xXXPrbKFn++iEYXYI1kfZYpHbo2bVygj2klMV8ogGjloUw5sYEHAUqra/GlwzbB4QE0/NTNVwJuoAHsjvK+0q2qj7YZIJidXKoxBqTClM06d5y0VgZHJ1NwkY1HLXfFLJN9CyFWJGA2WyLazZ6RNOP+xU/s0UO5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com; spf=pass smtp.mailfrom=khadas.com; arc=fail smtp.client-ip=52.101.127.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khadas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdUy+4VedDoy/+MTreHWTGKs7Fru5sbMnRrzb8nOzShsum8cR3N/0v5SRUaiSnKW9n287y1maw8x0+JJG1o4HDgtvY982IkPL1adogzyyN+sa4AOGpC0wWWBOWtXyDci61faYUWgq6vBdMouOJq/XMrEtEFzPwKebcOR4Ddurdia2wxrDIXsuWKGpb67ZV7SpCI5Z+iEh/7ME6qSbCjdt6GR1l/wJtEJXKurVk1cATzB2W1mH4iK5fo0T9Vfry01xhwiOZlRNP+tv/jEwOfQfbczu165w1906OkTeKI2se7x7A6YlWAiF9yq2PDmXpw2A0F2VW6XDrlnicXaUjOVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgF/46vpSV2Q2+Gd47OgVknr2zG1d6cGLyD2Crahfzs=;
 b=CnrXD/ahUn1IINhEY6E26A9cLfyoSlKptzv7U1l61uNxhcjPSlehbKaUqeGlgFenNAVZcC6vCo9Km6O//5dwDVx+52NEKIQksPnLP5k/7CjuDPveW8P2h3/EpopGZ/fwTo21Alrh2Dwf7NLyIp6df2/USKcP9r3yf8AayqQHnDHXmRtSvZrMIzNBzAY1CyI2jpJIGg1+BghV9wSmWzXHVsiNpiSdB18g+SLCwVXFj5WlHWY9vJ7suUV2CIjarEtsIAP1Ccn0GiKKaPPxQDKRErMOjWgug1S38pDzAgujoNSrLxm+vWYiG0qb1+XJseawTVC8HfzVnDRlJg4HmuaPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from KUXPR03MB10477.apcprd03.prod.outlook.com (2603:1096:d10:6e::13)
 by TY1PPFAEA8AB8B7.apcprd03.prod.outlook.com (2603:1096:408::a66) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Sat, 17 Oct
 2026 04:00:53 +0000
Received: from KUXPR03MB10477.apcprd03.prod.outlook.com
 ([fe80::889e:504a:790b:aa74]) by KUXPR03MB10477.apcprd03.prod.outlook.com
 ([fe80::889e:504a:790b:aa74%3]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 04:00:52 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	christianshewitt@gmail.com,
	xianwei.zhao@amlogic.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xieqinick@gmail.com
Subject: [PATCH 0/2] Add initial support for Khadas VIM 5
Date: Sat, 17 Oct 2026 12:00:36 +0800
Message-Id: <20261017040038.3702428-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To KUXPR03MB10477.apcprd03.prod.outlook.com
 (2603:1096:d10:6e::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR03MB10477:EE_|TY1PPFAEA8AB8B7:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd87716-6333-48af-df04-08df2c033cba
X-LD-Processed: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|7416014|23010399003|38350700014|56012099006|261009223027099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
 s6UHYH/iwtk+xHJckXq9WxFgi4QIbY+fuTsZuAN4HB+qw/Mf3KtaBGk0Z8dNpPUvLD1duTuWJvFRt1axvGQpwF3k8rFifG8cT5uX6oW4QOtEGhCziY9azovXz5ScDpe9ohKCW7XlHYMQeYMh0Kithq8ZqoviAyHG9RS900hFS81sU4ifCZtDpitQXjLgImsTG5a/3e03j1Plsd/2QswDM7J5iBfeSKGsaDLFCj6uFFiK1bc+5J72Rzm+A1Rr/6RKVjYuXZjZI0Q0JydZ1Uli4vP5tHhZuA7T2qx+WsFR4ZlTGjMe21McGr/Yq2LV5Fa2COu+bukNyWn3PqRZE/wXRcm/ldtmCvSinpSmD5XDQFduk1isQBRyyNpdn3Hr71BVDvcHn32UbbN2nIHKA8qpVXQCbh+KK45GaQ/SMne+YM2cF1lFfknaikvJcgen3rWngfqSF4guRRSk921fSvfJcPL5TL3hQqbsReNMLWTJF0c08kVz/j2wS05B+ulu0PZjWNfHym+SbkF2hjyci2sppSJbKrf1LjzxNpyNpFUrZmTSf3jR8lTcyvoYgS5nT2lHANWeCcyOejIDuSkpfLKLIBzionNmkSAW1NuJiRRsH/yWOmp7Vb5Jy2B0wGOyegonO1G7RWJmtyvGHAFZvsbQzUvCFVAGwUu/Mtnqi+EhJZa3bfKXxk18AOeOLu4kNoAyopqeOwMzBwo0XaM0PSt+PZ8rewy1+3Yqgi+qws1AHM8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR03MB10477.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7416014)(23010399003)(38350700014)(56012099006)(261009223027099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?MMOZuCNc2UZinGM6T34iy61daCikEME2aKOvhZ4rtwYMLbIw3qYBxd3dF8aW?=
 =?us-ascii?Q?b/TkrGklfWXmYD7SM7tX2YW5pSywPV6R2j6ZvxIf0j2QWRAlHXXckYIumCS7?=
 =?us-ascii?Q?lI+9EOGEcBslFmmY5/6q6QeuAXPCFm4GQonQcwVh58C9Au0RB9IAO4yiwdSL?=
 =?us-ascii?Q?sE4OM0GNetWD0plsNE09PhXNTAjzrGfb7Hvl/DGe7kjklzHwdW+qvG4YeeVc?=
 =?us-ascii?Q?GORKcu3qogWSD85eLPhU8tfEx4tI4wBw0mPelNJEuvPcDQiz9TH8ShQ/WXn0?=
 =?us-ascii?Q?DJrnpOseSvesJjtXiZjd2P7dtRYtOr+5z+B26bEvtrBUYD03ZsLpsboq5XxS?=
 =?us-ascii?Q?/mDXgGn7r1mmo4FqllBDG4EPJq1h3dO3d0+H3APIMrbtOOiH4rg4lPeOCvuz?=
 =?us-ascii?Q?Nh2bQhofyCUfEVvPfuLa2WfSn36Y2cCs7MdORiPvObNu20x0lylDXyQ2COC6?=
 =?us-ascii?Q?kdLdqzcQnwrmGYWDV+ZsS8m1lCsOPvDwmM/HugiE12MyIB6nmEk8ke2zDSKe?=
 =?us-ascii?Q?Kp01tE7QX3+SXZ72kOwTtl/r/gfthUDInHoMy+pAMQOYa+mNSKqKBjBKQyE+?=
 =?us-ascii?Q?gSRwjtSxjSaFCWHeKOi3BkA894fOEo8lTX6CI2YKe+kHxTLBs6Hc70r7yZIL?=
 =?us-ascii?Q?WHJhLm4IkDPfS0hv5ZNNtzugFKZbovoEAGT5wwvyVJRAZlrE0KboniZSWgCU?=
 =?us-ascii?Q?U+ag/fseLjpV1ip2lCo0Y6ZaOt/63mvG1BYWbUPITeMDNBInQTPZF1d/y6nq?=
 =?us-ascii?Q?HpLYQmNaChdwRDKWtVgDOvpFvK6NcqwPypk4VJjwrL/rOz3qPmK3leJJUAX4?=
 =?us-ascii?Q?RxngWVXArWe9PNVczwW58HxuAEBnXMKpltRKgTRlBC6WMODIW2KZ7imBNztq?=
 =?us-ascii?Q?wrC/PIbu4VrrrkhEr9jSO07dB6EjsYoUs0IyD7ysuk6lN2tK6Taao1pZWUzn?=
 =?us-ascii?Q?SnbmsCQTshz01UvH0jfF+uc3w5is8bw4Shi2c29BwHz0rZt82iEbsAaQ1bCM?=
 =?us-ascii?Q?XS6iL0D5E2xy6TRcst3PdDfP6Yn8w8yaDmq1tRiC9TX9F5Fq/MXKevUFmb2N?=
 =?us-ascii?Q?rNkFjL9iv4E7l1tLjsJ0C5pLz4hl56RZBzAsqgUnGuMLWZG20IYozhx5JScL?=
 =?us-ascii?Q?iPQdropQ/r+c+qKRCMR+eurvtGkIuBBKj31WFPjoBJwkEfk+OBOLY+NGraAr?=
 =?us-ascii?Q?Qvc9zwEW9EIQfZfCc4Pl7qeLbPfAoyhIfZMGHDrVrNDMC/MQ2D1Bydug8GOH?=
 =?us-ascii?Q?AcjZsNkQKMsPUPWV8+BwKEz1YOHkqkJ1V+PUWCdfq9a137s/OrXpbMXNMAbh?=
 =?us-ascii?Q?vkuBW9OrY0pYqoVZokLMOrqnV7qGCO2OZKKnl3duvU+7sErYwV4DzMHK8GSz?=
 =?us-ascii?Q?3JAMahhaUG5jkaeODPn4RL69I2Wzs6wx+DMAiDm/Ghd562cVo9Kub488Xm11?=
 =?us-ascii?Q?tZa+zFn7ycKr/MV5QSIJSZnZwxMgsTBSSFDNFEsT/1jvBwrt1uaNVIbD1vmn?=
 =?us-ascii?Q?1COgV0gkNVBs3YY5aRk9h1S3QmitBx07vpQAgJg4wvZbvjgEMRilAYWj+qkl?=
 =?us-ascii?Q?vKjmmBEPBIAhD9TiXjeVj6dW0uMC1QpmRg2VTMJ9Jf/XPFz0WrxcoXEBHshY?=
 =?us-ascii?Q?vkqAvMq7SN7WBaGbChxCPRJo4DtFBBR7T+Z0CDtAk+IooJbUNeChVZfYxsEi?=
 =?us-ascii?Q?jCFD0mu3sK4tExMk9O77+S7cUlppSL9WmiHFMWmAWkw+7uFU?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd87716-6333-48af-df04-08df2c033cba
X-MS-Exchange-CrossTenant-AuthSource: KUXPR03MB10477.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 04:00:52.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSs0BrrFzTd9D3hor9qwfxt/8zT9ghJ1HvVqSPUrShl4i3ORbqlrMmhEKsbt65sH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFAEA8AB8B7

This series adds initial support for the Khadas VIM 5, a board based
on the Amlogic A311Y3 SoC.

The first patch documents the board compatible. The second adds the
board device tree with UART B enabled, an 8 GiB memory description,
and the ARM Trusted Firmware reserved memory region.

The board has been boot-tested up to initramfs using the serial
console.


Nick Xie (2):
  dt-bindings: arm: amlogic: Add Khadas VIM 5
  arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add initial device tree

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../amlogic-a9-a311y3-khadas-vim-5.dts        | 42 +++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.34.1

