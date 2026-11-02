Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793641626;
	b=xdutvgRzngtTACCCXHn+RLdd/ZtqmmXKeJM4d0CDFjpU0ajjUyoxdZZT6YQKdg1I0cN6
	 /Z50QsES9pxpYL1kkCWzZU6NB4zoFSxfK8PyyVz9qYKDTAfWqzN7AN2wPO65oF7PUPZ25
	 +BKL5uTr5iFa6ZiitaHJd1I/ouTTJNiOvZ5iu0rdUy5IgPO6OmlDb9dOBguOe99/g79AN
	 jyy8G/RBFLlzZJhEqvqeVWEfGez4InWQLbEtItWIlCZMis0xvj88PiiKxWHissffUWlbd
	 wMWSLP+9SYGomIcXy6yyoMHV6GTeLfT2Yy1rOcL8Z5gvl9cgY8snjjW+tHbhUoKJ6Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641626;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
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
	bh=s2tcK0Cc3ep5KvjWN5BJvi0CbZ+xHrd6b+RZvnPa0Q0=;
	b=OEikMEB3NjPau6sAnnu0sAoCVMXEz2aGKRm/vPFCn/lko2n2ghBfo70YMXFqF9dU5jWS
	 YINIP9O5ajvnlCBBODH6t92S8WjQlkm6tb9J/xrONd5SVhUcIpm2xvRf3eMsD5AyUcnDw
	 lsfa1bXOYAxfZ8oSVHE+WQ8HGy3GQgY3V8FjArxrNv5mnd1yT7J7gAH0ejFGW9fNKczj3
	 TbM3BaYRPqqlXPThxobwrtUZlQtN6XUhv6HQAW8o+Lb/wE3tTC9R5hsbcpljdUOMoKx8L
	 QdUHhx5vx8so59b3Z4HC/8iOOxcpezc2tAGPg2ZKtuEY7Z+put7GRcUI8wVAAuSYlCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rEw+WBij;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.9
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013009.outbound.protection.outlook.com [40.107.162.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E219606A5A5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E219606A5A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rEw+WBij
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/4cBFQP48YL3pHQ2TL0EUFikoZC8xw41zOnyTzfxZzFThxlYxQMmhyuFfMPAwExoF1HXbzzfUQVu0lEijsBemK3dkNEhrPinLrnmO0m1kmJrd45d/Q/9M3rGGwaAkmKM/MZyoqKtwR3D8i+C81YSPPVLKLyBWsFxCGeTK5E53lO1RQ0pUkRIMDYxVW+C1ehdH+PofmfJxLujNYEJjFlycg+UCI9eB3u79tb7jbZm0OY+l5GHcN3/jgcL8hmh8zsqAvDhcWh6XfdJB0C0/jIWEvCfEhSZxEg2Ac3VI7xz04CUj1MdsnUYla7vIPHEB08Mk6m+BjR7u+lYwvHOoNYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2tcK0Cc3ep5KvjWN5BJvi0CbZ+xHrd6b+RZvnPa0Q0=;
 b=CUfhzbMBlGgdmKyn2GAQipYewcnf753UbNxIRAqeTIZcelNpznPfk1rt/tKECbasKspq9viovXbwtgfYpPLkpVCXs6IEtTUq/Qbf+AhISSZoXA4n9Stjhf60+FXPYxuuSg8dadqMFIWBO7HlqTNto+fnhisUUZgHr5sW05ufLugx9eV65dEkzzE5yaOMAxNSnvljkNne0wDMCdifqXyoXrtR5CcQhGkULzIEXZuxlpoRViS0hlJKO6KzT2ekMNKmoOW22D1ur8Yu6bwji/RwGJXjv9Xd+9q2vYRdYFSoDS5HC3Hn0E4yjAIhBAeN17EA8nr15UpoLT1UeJwXC/Rclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2tcK0Cc3ep5KvjWN5BJvi0CbZ+xHrd6b+RZvnPa0Q0=;
 b=rEw+WBijspKNHEEt1qYezHpsv3Zjtil0oZLtPNpoEbnv7LiNle5/EVUZUBa9fIdAFgF/9YqoiJrh7Nmojdir91tlQOLFANrkcqrK1Pio7k2y8NJsvaq0Yh1N0TAZYQ2UyS6aBjCtzHvmzC5H7de95ZfNctJSzSfkDWyTqDXEWopPMB+aNuo32P74nZCmAqVCImR2bCquVHlCMZXQ78NwEPPI33RhA7XpCD3egf63yV7Y8fYGrylZ3PWSV0A+Ukyek8ydpgfV4WnvhHFPJOFC0SWyyfnV2kyGnbWOUmEg6gL/WQJZCvZZwt2yXkYSfLYA7QTon8uizO88v6HeCbDYFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB7495.eurprd04.prod.outlook.com (2603:10a6:20b:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 17:47:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 17:47:02 +0000
From: Frank.Li@oss.nxp.com
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] mfd: stm32-timers: use dmaengine_desc_set_callback()
Date: Mon,  2 Nov 2026 12:46:56 -0500
Message-ID: <20261102174656.3939832-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS1P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:451::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e212bcc-3543-4505-1a90-08df39094d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|56012099006|261021123027099003|261021121427099003|11063799006|261009223027099003|261026121527099003|10067099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WJcjniOzVGW+nsD54xwbhLeNidLO9GnbdEWCFwU4Csz/pY6OBmsKzwHTJMM/CLPAA3KSLO3nMm+3JekmRiITGTxJv6HOtO5wEs8H80JY+sar4tqZfpxJz+qOFc23SEBGMNw1AZribtHhHkccx4MumRCC/2UcXeFgiIcZtL7QJxqmJieIZ7UU7hLLTJpNA1ECuwdkGNqZ/NAPW/Us0COUEQs0lAhW04vVDyLzNcRkD7dA1Ww/ue/GcdEhUp3iD5ND4sMHsZIgRsrGOLTfx3yo719vugz+clNOL2i8zaZqA95pS/N39/9qaZxpxOxPmR/8WD0y5kk25/AmvOQ3LEBN95SKghqof5EoGKIcbAhK/jxVGfrR0pOo5J7p1HaS2w46UfwDGp0YtWsnQb1plN92EcOa09G5wR45IvNXLrkjoJ7ZljuBFvn+gF4UpmRvDYktQ8WC+gSZyHKxCklhBedxSQG/it3qtlEpaq9b/MV6/IrtI7B6RQmq/eM9FbDUDFiPd2KhT0yaMS843Au27MnURujAfz4U5s9xJxqZHaYu1nCEyKEwjkRoiI6m4IKpUcm8EhXXsZpzQj5G2rcWiEfnkgbkTHJVhYVL5q7FiuQQa0I6r8X6R1pR5fnia3qAchsXICCtPSJQSwNkD4nSbNXn2jd0fP07/iey/QJ5fm0uU90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(56012099006)(261021123027099003)(261021121427099003)(11063799006)(261009223027099003)(261026121527099003)(10067099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4gJilw0yzH30crnd5gwyyxfZdxzAfTxxyyhdzUZDPs4onh7ZAeH3VQvUjLHg?=
 =?us-ascii?Q?BByoRvhstLRFRpmq0id5Vfq7yuh1pr2swAvHxkomuE9Y24APdO4dF58XvF/u?=
 =?us-ascii?Q?bRfbmwrkb7EQpFKIzoemQ2qVEoIwe5CLAkykmsnzvvx2GPh8ggs8UNACfpl9?=
 =?us-ascii?Q?9bI5c/KjNwPmRPZ9Ilb518GQkUnJpjzA/DXmlOBolc/UMMfHIhkWodyBfi1k?=
 =?us-ascii?Q?Au6Qk1UgzqoR5hcpYNHsRZQagGjQNbE6aMjYKrftVcOnGuwMW0NTzHTTNsqQ?=
 =?us-ascii?Q?nWIfRo8mqbdnhtEYfjoM7KKIcyRTlk5Y9RHrnVujAXTMzroknwGGu7M64XrF?=
 =?us-ascii?Q?GpXdumiYZ0fZC4vz0PUxVhiXbEt4ydt1ejvw3jQnpbpb3vEex89DGvDtIHAb?=
 =?us-ascii?Q?toxJxAZdwKn73gXNrhdy3MVXiyuUyH+hnJtnk1Ws+Miya3iY/UFKxPn4QXIW?=
 =?us-ascii?Q?8zBe0gAwOp9VhfFqX4Lg9jiCjrMyluegnYKM+5wlXN9RKIxAVlhWc7dkWUEt?=
 =?us-ascii?Q?DYuT0xo2oFMlVP9lkUMI+wHUgRQDH3eeIXqzRDhp9ktGyIjqhLB2wkaR8P/J?=
 =?us-ascii?Q?OONkR02MOIwxzS9XYVYkEfwFz4uiQIR7NKSkEeBzBebxgRBdUQ/RQ0eqUDEK?=
 =?us-ascii?Q?BArz/9/rzFLxsiwaz2n7GdTEcX7R8nQm32Pxot5WZOBxYVBz5Trjv5042Xf0?=
 =?us-ascii?Q?3FAplaLl77b1ZVe1Ga5s88JegAmm//csC+QhX3qJjC0pvlPCd+JvMb4GeGtI?=
 =?us-ascii?Q?WnIF3XFrr/eD+y2PEvy672BHDn2LaJOoeHvhX2yZI7s6PhzNXY7HdmSX3jjp?=
 =?us-ascii?Q?qnujosbJyY0PD6nrVjPfvYiIskmbgefjCZEqvOHiyRMWSzR/+N0rPnRzc+n0?=
 =?us-ascii?Q?5LYu4Nx3q26+LCb2N0KG0EfggEXNOGOqMX7JGIkoYf27PpWCtYOIfg9fV8Ij?=
 =?us-ascii?Q?AMuD6NzwAk2FYVslEJq3X+zjkt0X1B0EDAOKk/F05p9mkxWlb9VOvqIXkLKN?=
 =?us-ascii?Q?jNscuvzlYQtY7nkoZND71WtolwhVVCplXnD2zO+6pZFMMhUahlAEK86+GSxI?=
 =?us-ascii?Q?X2xmWQPDkoiXmMdF/jWMFZiuX7kpsmIBttF2Mp+/4l3CshdcCzwbyU9wRpPh?=
 =?us-ascii?Q?LT/9UyRC4YePIGLyIEUDPGsOh/eW9FgVionHsCx8Qhk1iJP5RxJeioKI4n57?=
 =?us-ascii?Q?TyUdt1a/kuueOdmUpaF193qBkTiVgc6eLxdzogZA6HVHwHjO7C1oMMDQBmpv?=
 =?us-ascii?Q?HeSiKgOn+4zHqIo9l/vXWbp6Qn2nUZwxlezO7MABGbK0q9JuX2fe1rlVWLUx?=
 =?us-ascii?Q?qCD/TzMtfyWgi8wscOf0A7btc04fNCPbTw3gqyQ9bQglVgQBbgYdbeMAJDai?=
 =?us-ascii?Q?Fv28Q5QwqyvKle+JjQVmKZJQrz0x3cZ2CurJrz3TE1L27PaJfE3ebYxJy07J?=
 =?us-ascii?Q?DXRNcsgsd19EHSFT92nYXb57EDhNHbhlFWAfbDPFHk4TRZToYs/wGByzuyrW?=
 =?us-ascii?Q?u7YOWvxjZwSlbKqVM3mUPQUZXNFVLWKPvqFu/M8fmjTWx5zLnEgErp06PfaE?=
 =?us-ascii?Q?pvOu0mkz28VrAhS514SFr4QxGj0pJxoKyO04PWWaObWklaLsvgzqMP51jmzs?=
 =?us-ascii?Q?gRQcDDYBQH9O4vwNqwGIoYW0eNXCuuuxlyGXSbRIymYVJPwaKP/LY0Aee4+s?=
 =?us-ascii?Q?Fj8aznV+uZPzw6kJ4IDI387mAhEheFL2DGej9DgzcTV+Xc0ZWFrKiiEY4Xm4?=
 =?us-ascii?Q?q6UthysGDg4m/YDpmWVboFH09Os8+JrCQHas7gkW8CBTwK9JLC+R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e212bcc-3543-4505-1a90-08df39094d55
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:47:02.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X60JWWW9q4Q7W828jHXC96qpsR+pcv/HDOpe697xpFcY1nK+CTI+wsiavCmKF8a7wSkmMKrLq9mohUDeqPNsBD/ElCSTWbM97FCsG5LZDC88SDtOGtFgHxkMovO7HG8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7495

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with a call to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare make to struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/mfd/stm32-timers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
index b3dbc02aaf798..4f344f2a5a26c 100644
--- a/drivers/mfd/stm32-timers.c
+++ b/drivers/mfd/stm32-timers.c
@@ -102,8 +102,7 @@ int stm32_timers_dma_burst_read(struct device *dev, u32 *buf,
 		goto unmap;
 	}
 
-	desc->callback = stm32_timers_dma_done;
-	desc->callback_param = dma;
+	dmaengine_desc_set_callback(desc, stm32_timers_dma_done, NULL, dma);
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
 	if (ret)
-- 
2.43.0

