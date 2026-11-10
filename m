Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276094;
	b=ikJBoEz0aKOJ5U5kSUq2/HzI/mNAQilYIP35Gy3boWRDyoW4el/svN/5s386BAAUxaFf
	 ZEK3Hj8voU9DB95jtop1ZbXKgcgI38cxHyOWfdQdUtY7Ura3Ns0mHFPV2vj9TORgIYbyd
	 tDnftJ4vBtTfSQRvUPkqObj7OXCxJL19A1BUB6ZgiKJJ0kY6UKc63P0lZMAOKk7FrWsDM
	 xDPprCzLd1IH2B4KUOYO63+POG5779QtB9EhU6UqWjAgpOGpd24jm6vy+sxrqVBqeiXt8
	 c3/yXCU7uczfS9yc55KZxy67z06v4mhRCXJJLlpAmU2AJ3cdlaOBXXpoI3PDDqA2tzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276094;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=URx6t+J2tDA2n1dVKXp/aYpnigozI9ng96OOPGOsLRc=;
	b=fgz0BFmt//LAP2oTOPhceImRbJPGC+SyVlgv2at7tAVBQmt2fNlrUbHt2+cGY4/GrZ9S
	 GM11mJVwwlL5f6W/sB2mZTCDJxWFFvImQsamE3xIv/GQJFkWzjRzAuXyu9SbsCsBhYsam
	 whkzc9TDj4jTKfMCxPfTbC468lvLasojiraGCYDk7clFsO7co17TF8y1lTqpVg9HyJA6u
	 3H7HaBHoAXPpaDONvL231Ezjdisd8o3xa/25TzsrWDYhZSLHcTzoGJLInCys2yzXvHS++
	 gHP6fIPW6RrnprD5hrGC+1LapQIEfxKJvyUH5+tyecVGs14TrRJ1E2yPw7bGvoh8y4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vivo.com;
	spf=pass smtp.mailfrom=vivo.com;
	dkim=pass header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=lY6Bgf4A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.22
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012022.outbound.protection.outlook.com [52.101.126.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BBB606A9E1;
	Tue, 10 Nov 2026 02:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BBB606A9E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=lY6Bgf4A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXVUm6wk5VnNNVIxoT1Zl0EuogKFVL4q7lNHuc+eyxO3Ov3XwIyNzi2LUdBURHEpJLS1Qoh87OuI/9k7UbYKpkHxGBi9VAo7ubkgp7NdeDdBwI9F/JXxU2PGILIpSWYbOgUzqwO/gWj9jW+ZWAI9XbAxyEwTlejnGD4DkLQcs8zcdwS1+GI9R2cO//6T9OmZczR6hOJl9IG0BudMYkUqChe6jZLRcVY3R3KNXCFSL0UejJ+S0kDhcT0lzXVYaexxn9BQVQklNuCoOV09wnGtBm7Mk6tKM4PkX/XaaZVhiSP+T9Noj/5wiGe52EqRFEtWdwoxTqrerYDHSao21QRunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URx6t+J2tDA2n1dVKXp/aYpnigozI9ng96OOPGOsLRc=;
 b=mGoy5vm05sjiEfbd3TcPFCcNZjm/uKGaEGR6kHNKcR2LRv3e8NT3aqbqSrkVY8XxY0v93xne7TJ3Jbdem0zeRRzOq6lholrJ+l2XGtUsf2JW1+N5lS6sORVYC1jWuvRV1xfpEJo9O31X3yteu+uiJQOwnr69G81QNofOC8G7GUj9tpJbJahlxiVNZOw8/ZTpmLWJUw5tj82uP6Kyl66mYDh4unovf+kOkTmmDQhcaT3HR1OwEKILHHP0dVyrJXj5YEiDYygwf++q/Rh2fGeJGCYdQbtAtilrhlkMuWEr1FQuPPJTQWwW6nBYi3i4vIFoLFkNDi6+xRddebcMNQu+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URx6t+J2tDA2n1dVKXp/aYpnigozI9ng96OOPGOsLRc=;
 b=lY6Bgf4AP6EB6ydXQoIHsmzGdUMYrJgJq4cmNCPoZE8FiDDoE+StBqbcUSHitm7DxEvr/Ag8ZHkziUluqAlWYiCGOK+qjviYLP2RantXuswVYyw9VrCf4zDdxvHKVIDNB3iBg2A+6F2nCvf4o/GUCNyHeiaKAeCi2fWgNN3NIL7qvwYqCdivWO8KBqQzOMynhi3zcFSdy1KWDX4Keyp8EfKiJWl5iMF42kermeyOyouXBIzWOZFSUsGjDQchVaLSJYutzZPVSa5dehb1YhLzPdjOMbrDa0VLGKhujZuuTFApd/OJZMK2wERfedcmOJxLEsy1aI6Bc/GJcZt2bm0HcA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SI2PR06MB108866.apcprd06.prod.outlook.com (2603:1096:4:18a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 02:01:30 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0615.004; Tue, 10 Nov 2026
 02:01:30 +0000
From: Lianqin Hu <hulianqin@vivo.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	hulianqin@vivo.com
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for RYDZ Technology Piva AC20
Date: Tue, 10 Nov 2026 10:00:58 +0800
Message-Id: <20261110020058.31037-1-hulianqin@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To TYUPR06MB6217.apcprd06.prod.outlook.com
 (2603:1096:400:358::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYUPR06MB6217:EE_|SI2PR06MB108866:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e515184-498a-4709-1e74-08df3ece8925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261026140227099003|261009223027099003|261026121527099003|261102123227099003|261028144727099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bYolcnvvhzs0pSrKhvO+AIAultceHuGZwIbvJPqjR8m21cziir55GWLSOKshzXrcgkrY1mgBYScpBv3d4bxAl/NnyA/QvaYyi9kT2QI+z9VOwVDApl7Iz9qbhmy4UEsryUeKugvKQwa7tRJiHRcU7yUDw1s/TgwkL6y9DYTDwUS8YZejSt+t/8ah34b97Zby2FHDls7xMEsyuy6YSQBGF57unpvSmXG4Z0IHBCcp+HBOZc4qCLC/f/26tRwCh2NSY4ShWsu3yq4omDAzjgAiS4Zagsh3vkywroLrbFWg+nU9GPtXn6uJIizLvqlTzIH0bx2lbGdjmtvsEmtojen9unCb2OdnLPwXrvBQDXPDV6u9mZ66HziSDLqOnuauz7EeKLK5AmR/HgUoXzGU2ugxDNUCL329bpYzU1/uduOyqTGGxvoyj3gmwicxk0UvUVoQcvom5HleDZjuHpcoeXiop1b7vMUbWq6JFB01qJpOZLLri2eaxyfJM3fuy9l3I5bZntIdLiARJI//zWDvdPxSuT0TCAXJBrqMtXVfigiljzU9BIxqmXxtUPe3EEOt0Cg7ph3COlhrru3zqGxYwP+zCMTtZgu8B4i4YNWPaLMmPQo2QBMGI34ooywBLI6D+lb35qatSAwlVgT1M4dsc1x1ERhHzfLZonyZ0C7FoH2qo2vEaorf4iylGo+RCT9PuyhIhUJGc7wXF6RCoyQ2Xszg9k1ag0hbFQuMAMYrJ5HaiI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026140227099003)(261009223027099003)(261026121527099003)(261102123227099003)(261028144727099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HSMhRQyQ1YQTW0a38dHRcrYjrV6FgfBCALYAYK74JSVo+7LBY2M5JBCcUwBm?=
 =?us-ascii?Q?iTYkA+M3OOmsks/1J25QzcCdsDlzJI/+0hW600wHeaUT3Ol8dpjiPvVXYmUf?=
 =?us-ascii?Q?RoG9l2notFS6O4AfGB8h4rKQ7YXoLiu795vWHFWtCsWSul/0th9r3beTHR+L?=
 =?us-ascii?Q?Gq12TBZ/LtEHinkFqn6W0ONUx+jq5lAjowyAR/k+YlIRqoJhKQMNdyWoPZ79?=
 =?us-ascii?Q?Y4qOougF9IS0EAXhb6VQwW+tjmvqFalfegR3cnLh7EbwWem1u0UBGNuBGTZ7?=
 =?us-ascii?Q?mnYv/ekUSs0fpYCkhAocQN9g/B1kA1dWM+tGsjgD25maMOoXFuqZcaZ6tFrx?=
 =?us-ascii?Q?C9luRIjWShGhxqn030Wany3LrpsqX5EXiQoEgGyzT0wM4mgGwDd7GHnOYDrn?=
 =?us-ascii?Q?/N8r2iauz4l/3kOlZcGb1cxibCYRNDm5A/nAZs9uA4WQ7tduRwuvgiTaeBwP?=
 =?us-ascii?Q?UxxYrW2DLU/D/pxAXw3exnZy3I+GXz16LkZLYmidkAObGjo3t8FMq3xml28S?=
 =?us-ascii?Q?NUydXzLrPxlBjKOU+yNrfRj7fFxHmxEqtWdsxPCK3l4ftlwPamlswYso/Z+F?=
 =?us-ascii?Q?XIHATD5eEQKPCa1rvdf+Hzpg4ezW8pWdEnUjdSkk9hvR/7447Yqnedu2hLQR?=
 =?us-ascii?Q?riF2U8GaQ+KzOXYJjjUHRviwvEv8GehSvA8vci9sMa8loE/yIciJ6A1fIxEp?=
 =?us-ascii?Q?v2POQHD4dlscXoFx1Hlo95UpAhxwIradREtL8yYArVchnd6Cu8CieTsESdlL?=
 =?us-ascii?Q?BsTZw9VY+Pychm/pxXNv21gMmbLhzzqoC7c8Ut2F+evGs2dd0AT5HBdyU6LY?=
 =?us-ascii?Q?DZDPj3HXKWpcLpOUfu9g+z0cqD/PV91HYBGD/WJ3Xe0HyVYMNwa5/CBbqhOg?=
 =?us-ascii?Q?I28arNSf1gijGX+DZB6Zp6ussi1nup16M7q+A0+ae1/Irc2n3D94n9dFhlHt?=
 =?us-ascii?Q?vClkZqWphP9Y6N26DE+U7d6QviET1XsSnYybrt697wopZVxkK38EBhKLwKCW?=
 =?us-ascii?Q?H8V5sRjs68hPdsOtlZ/OqBOyOsrY+mVmaNRqYPAgQ3S5SYsjGPJS3p1yOwn5?=
 =?us-ascii?Q?V1ZXnUQRQNNWpPH/4KqM3ARtWvHSH+pjbA+cqExbzXD8t9iP8qYQO/VSL4L8?=
 =?us-ascii?Q?ovB5lgvXyqqH6S4W99Xo9umNIzSVEq1oz2XLsLdVcPZDN+47y9AM4rxBrsgz?=
 =?us-ascii?Q?BWodyHbOHYEhgXvylke8n7aVpwDbZhUqPqExPTM0yTwIJcw1x3ZozFDzprBj?=
 =?us-ascii?Q?X8hQ20yWS4RTcGCyWdHCk3L5cLMenmmHwTKST2xwoz5RagFU83tdDIFJpbLl?=
 =?us-ascii?Q?4E+t6lGAXsyeJ4cZBtbnZScyNOlxxqQgtlSwnjFsAMR6OuyZNS8ViHu8H7l+?=
 =?us-ascii?Q?ifnJfZyBz363ocsooOaDfvf5IlTzYfBLfoBPVQOCCZtH1mewQpe0wYyZuK/z?=
 =?us-ascii?Q?z3RJ8u+hzNEZFxZP8t6tXnjZTfIyP1VyJGhodhcLBrF0JMy6k6TcDzqyVkMs?=
 =?us-ascii?Q?AILwHi0MsSD8UeHqGq0vFRJ/KovnkJKsRIJtGhqW2+j070L0njGURp5XhpR6?=
 =?us-ascii?Q?rSBuSNCS1CS+dd7yiQ3t8qYqMNhtWkNadFn+fbvKlMRdW+dRdjOXCYT5QWTa?=
 =?us-ascii?Q?fuvunzueMAoyzOWiwZkVokUfoXCge17Rt5BkYjakeoKjcJ54TF3v8llKqS4h?=
 =?us-ascii?Q?N/PNTBVM0r5F3FscHyaHaLg7GatG8vMZeCwzXodKvPsNfwWHezvCUbJvR6U3?=
 =?us-ascii?Q?NTQEkr/uHw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e515184-498a-4709-1e74-08df3ece8925
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 02:01:29.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0O/FgOXdlOsxV41xSsi2G3VW32YgLsG+3355tkXOHlhcB9aExfOGAhImUOpWaFruV0VjxuKFjwc/Rx1YDJgm6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB108866

Setting up the interface when suspended/resuming fails on this card.
Adding a reset and delay quirk will eliminate this problem.

usb 1-1.4.1: New USB device found, idVendor=0bda, idProduct=8808
usb 1-1.4.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1.4.1: Product: Piva AC20.
usb 1-1.4.1: Manufacturer: RYDZ Technology
usb 1-1.4.1: SerialNumber: 202511241125

Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 7c581e283903..744cb31c0b9f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2651,6 +2651,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x0bda, 0x498a, /* Realtek Semiconductor Corp. */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE | QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE),
+	DEVICE_FLG(0x0bda, 0x8808, /* RYDZ Technology Piva AC20 */
+		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x0c45, 0x6340, /* Sonix HD USB Camera */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x0c45, 0x636b, /* Microdia JP001 USB Camera */
-- 
2.39.0

