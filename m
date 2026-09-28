Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EFB499F39;
	Mon, 28 Sep 2026 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590976; cv=fail; b=SmxGe+5+LckVJ5IgKfIhuecJCl6r3yTu5MDVCMizYZTmxDyrkIPkJnCGGuZxprEC3gbIXYlV3a9099RdKnoecOyrnVQ/sdcDbkNFXwc9GF2hakHztEAzuBGCgLyCORM8TvOIp+nHIYMx7jwD2o+GTHeYTrO6PBrJ09jYIrYa2Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590976; c=relaxed/simple;
	bh=2KctDc49mXKtBEqd/BBQKnVHojHmg3qYD4aJ4wEoYJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e9Q9t6VbrIWH7tLzeUiMRKkgueTud0xqPesf+PeGK3h14a5LnRMF5xwKWuVFYjJ++hVw79OT6ow+nKXp15ylH2vpEdMYnIutaH7F8RKLr0HMOw+oV7IGzSRW54VfEYNQzM1LuFmioViRN5AfcxzLy4eLoIILziDLEMDEvWOUnv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUV8fBtNaI4pGs3qd8wgSndtisVmBn4Q/lB0TP9rQwYsds0farESRbcx6f6daCgc6Khlbhm7UqUkOglslVlk41NnHv9YSsPfg6X7eOcxT6fXLddYbt0sSX7FrlYQoMb+oi/gIfV+K+s1JW9Rrp9kSI21qu8jmd95jOeWcenD2JuOYmMSqmFCBKtWezK/2b1hqej8WnfuU0j6kxeEmW6frOWXwA//+aTk/UEVv2GX+k0Wnhg29rfy2/HiHkiCQHBoEr2Q9O6EbKrDsuH/+Q4bvXL8tQ/yANGRezvieHiATXocfOVpCQO013mr9iE3ZnZV+oZ0cgZLyhUF+EZozP5bgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlBh+twuvcdUiku/RsbgQ4rRcIAMHjPFzdOvIWv0nCk=;
 b=OEb37/TgLsvTT9h6vZrdYcMRVals0Jf42N0cdR98dtfeXhsGlQu7qgv3iKnoYb5fAxZ/HbywCOowU/LJwvf4TiWo67n3NSZM2BZNumVhgNmOfbLWK97ZPAA6gZccxQ3LF/eGP6PQJGn8BSD41m/WP/ap9QPqKiRTz9VUUh0CCHTUyWP6IpTNwVsbq8TSkALsiE6YeAez8sd1hS+7axkwdrTPUSMVh/fcD/PBvjsEw8IwHyFb66KE8nVyRNAo7B2NCUlsf3BR6JzV36NCj79nLdV4TrOlO3lcOZ981AFIq47DOkNBvQA1ksED3YRfm4FeeR4b/YeO3mXPZFJRuobymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB6171.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 10:22:51 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:22:51 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v4 1/5] media: qcom: camss: vfe-17x: Fix write master buffer done being dropped
Date: Mon, 28 Sep 2026 15:52:33 +0530
Message-ID: <20260928102237.533341-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928102237.533341-1-hitesh@ebytelogic.com>
References: <20260928102237.533341-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0060.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::6) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: eab22666-762d-4fc5-9314-08df1d4a733e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|10070799003|23010399003|1800799024|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/uCqMRDdseG0cpxFjBuNWal4Dz74piINHjo7Oc7bic0krCANQ3YlSRK5zI8R6kWVmHf/+kVoCokzW9XVv2SEsoRb/rLFMfw5AIEn+m4t918X+zZ+7dE7zc4EUaf/WF0kryd6MdXTpZBk/nx1beH5sYk9CIUAispMaFXO4yn/61r8US16bgtl54x8GnyjTxh6PW6Wm+eWfF+U0zE4Zp4bGbNR4ZzIAjzN5PSqFH1cbnctAXUAueYgVzSIv8tFFJzn37gpZXF5greFLqakv3FdYwXz2v8kTebBSBgmwh6x1lzN8An1bgL+GKovt1DDBWiw1i+q7syRHnJSvBeZ4TSD4eBmxMeGF/ckCp56dXI8zleQ5wTGVt1BIrmr4iAOtCsK1mmMejV+pP98I1SHwBH4quaPv0kb5NJBtz7CmGSfbKJ6GTTTPo0ZYa2V+/WeXFU6myk0u9t1+eh/Pa0Dd0iBkjg+XUkSIa7K1xpV2clBu2Tw/b1jPX6mlneHAuAhSFrk8tsSbyrUX89mUhDBy6cpUNS5LkcPVyUpLCqN9hmK9TLU0k6UzEKwbaSWx0oQYtGbEgFDbv3JNX9amdhzvKFSw2ojrEK1RegSYKFrzRqtej01L3Nci1iOTwuvijH51RCbTw8dzbqjQwuxjVWw5vE2Kbgx0v5gKtHWFEGSu3Rd3pE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(10070799003)(23010399003)(1800799024)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QpFY+kzHlftaePj0oFsOeQbrGWkHFMKPU3AVDbv/bjYOcUaLoDb10gK6vi8R?=
 =?us-ascii?Q?mqsvo7EjqDCTFKpY7pwma8fawr2fL8J3cRaNK3gLNy64+SNuAUNQJCt1ekTW?=
 =?us-ascii?Q?66aWlWvkIVr4sQxmJAz/Ok/ShcJMoGkbAkVzArr8q9LMRQGcBocoTBjhH8Po?=
 =?us-ascii?Q?Eb4SIq2RcQb2TMwUOEsZ2uh7D80yUbteRedYkbZ1o6BlTINlgMc+X32WTWra?=
 =?us-ascii?Q?EQLAiVygZiMGTV3/peHntWrij09exokh8ecGRDW0aKAb5V8fXz2DFtRSctOa?=
 =?us-ascii?Q?8bYm75PwLNhlwwjBzV1PaVcdK+yWG1JiRdipVLb4u1BQ1D8dDu0GEae5vTnR?=
 =?us-ascii?Q?DJ9z7dbfM2BiFy1t6PDM1nteaKlyVTfMaI3IQY84YjkTsZZ/5P5hoibDsV8Y?=
 =?us-ascii?Q?NfBW8XYcBk2OgmtcDnYu4ay+kRrtfSzUAuvY2t25tAcKyf++sJvPHQvdwCVO?=
 =?us-ascii?Q?igIAXmyspDlvF0GXVkNT9oufqkXzTz2crw9DPWFGm65Ty89Zy4MZl8kt0J9c?=
 =?us-ascii?Q?xLd7PZMSJpToZCMK/HLacVOay7rWzI48Ukbi/1A2FztfshqUQihbADdGSOwB?=
 =?us-ascii?Q?jzjuExXSfMU0ellZDpUXSn0XR++tm8dN90dqqMnKuzeci6/TIwRccK117GpS?=
 =?us-ascii?Q?s8SRvPycofFEhrt51ndX5wNU011zHpU+XWaO3l517bJnAunY3XlH6JxoKCtP?=
 =?us-ascii?Q?P8gytGJxNh1RNlf85qA5ISHGzotyiDk9kHnTkzARwTz3PI51mKJBzUEx/eS+?=
 =?us-ascii?Q?C2Jh87fSirzkiOb48z0mrOb1j5OYiA6PcYTzDbtU6ZuBrSnsZ6T5V0s0dMOQ?=
 =?us-ascii?Q?5Ov9vkUCggOy7U2gTFytDNJmlTfroDIytOeH5CHWgcc+K0xQWaf5cjmenJpy?=
 =?us-ascii?Q?K8XiIhxRIIDvCL47nzO3J/9wqLRKuxZaBu9OU1zzF9Wy/u0rbMCUJYjmmHMP?=
 =?us-ascii?Q?XQ6C0ThAdHn2zUFwqiV1tkD9PqajYYKUgJbWv/oPOuK5Yw1zZZuLFQbIIS7I?=
 =?us-ascii?Q?GAVl26tFP/XfuJyLrjx1OTpxBv/zi8HprJueorEjes2FEjuTjBlWnE3lbYEg?=
 =?us-ascii?Q?bgtHbcKk8RclEVEtogXXwkjxNUnlhRWeI//jqg51WOuWps2JNqyHrXUXzK5V?=
 =?us-ascii?Q?//wNlwM5O+ycOX1YoLYIvJCKcFOXOB9+3cm+mKn0KFdDjqbSovb3U5Kcfa/6?=
 =?us-ascii?Q?OrC3m8LKqHq7YTgh9Z1MVrDb4OmaqcH7JWlncUZQaKzjqMDNIUyWfg37dSJb?=
 =?us-ascii?Q?Zm2X4krUU+wsC0TJJPRppoJU8/0KYozcyEKmUc2vsXjupq4m5oJQm5wn8nIj?=
 =?us-ascii?Q?E9Ldyv9zMMFbZRsvfdtU1ihAXTs+m0qAQhjXd72hUKqEqUDBYYS8frFUDEa3?=
 =?us-ascii?Q?BSIeX/YUWizHMkBWsb9DT5KMV6XZscuto3rOnTxeVJkw4HNlNo4MQc/vCPSt?=
 =?us-ascii?Q?EDH/+Vgw6456nBLQCnABHCwWwiqIk38+yXdUS7Fr8QXjGBtWxtiT2xIC5HLW?=
 =?us-ascii?Q?u7QhOqrzqR38p4KAsZ5z2UQxWaS0ncRlJhWoe9k7xeNiWFdnuiLLW2dBZmT8?=
 =?us-ascii?Q?3Z5u1QgZ+5eSYZnH4u4Hb6HouMn7Nzzpm8YW17dWl9fmcODcfgCp/c929kiY?=
 =?us-ascii?Q?Udo4sfWEkx2nDRD/x/iehJhWdTU2ThdlENX5krZMgHzUDEJfCgTwEP9UzIFS?=
 =?us-ascii?Q?Nvntj4xN4wyfXJneE9Z0j5VzTUOPDx+KquSXcT9MN3fCEbyzGgYcMx3YdHyI?=
 =?us-ascii?Q?2C44VrAQM9i2c6iXSG9ULWYCaF1ZmTlvWcfVR6aKP3raAL73aUsd6obmRtkF?=
X-MS-Exchange-AntiSpam-MessageData-1: eOPVK49P1PstAQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab22666-762d-4fc5-9314-08df1d4a733e
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:22:51.0189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIeQ1m7p5omksG07Qs4H+sB6ID3DRhHcA1yIRL67/y2Dzdv1tBnyA6RetSq0I3042ivNv0N9nc87PqSxzoTzAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB6171

The VFE 17x interrupt handler reads and clears the bus status
registers on every interrupt, but only acts on the per write master
BUF_DONE bits when bit 9 of IRQ_STATUS_0 is set as well. Bit 9 is the
ping-pong flag of image master 1. It has nothing to do with the other
write masters, and it is not guaranteed to be set in the same
interrupt in which a write master reports a completed buffer.

The bus status is read-to-clear. When a buffer done arrives while bit
9 is not set, the handler clears the status and never calls
wm_done() for it. The buffer stays queued in the driver and the video
node never receives that frame.

With one RDI streaming this is rare. With two RDIs streaming on the
same VFE, for instance two virtual channels demultiplexed by the CSID,
the interrupt rate doubles and one of the two lines loses buffer done
events continuously.

Act on the bus status alone, as the other gen2 VFE handlers do.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index e5ee7e717b..c011f64f63 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -364,9 +364,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 			vfe->isr_ops.comp_done(vfe, i);
 
 	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
-		if (status0 & BIT(9))
-			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
-				vfe->isr_ops.wm_done(vfe, wm);
+		if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
+			vfe->isr_ops.wm_done(vfe, wm);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

