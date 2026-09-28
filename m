Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021109.outbound.protection.outlook.com [40.107.51.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057A744AB98;
	Mon, 28 Sep 2026 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577839; cv=fail; b=aTYDrAMboU5bqJaWoJLnptmKaljqCvT233GGvwA85GtWljGTtnYR9Az2nb1wVOZ7517Cry+TUoeghboR4ysvM8sL67TNJB3OCMdAnqYBatB4qb8aSJn8XrQrQiOML996RIq8kd35PEwVvv/J+fa3Dsj20rF9HN/lknbGPIQVAYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577839; c=relaxed/simple;
	bh=juqC3qR6loZw1mKgW9LUrvHQUqI+c5iImlZovKhYqdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a3d6Bktcsa+mddJflFhAP/znwCS2x8cLo1ufrJQu87pgIsDxwkG/eZDtyS+XdQNj2bH7wP6L5c35yoH0Rcd2eB1O8HWr9lKvXnvwCE8F/0JG27sb/5czp0UUVFII3RX7jVxTSLTq6KsiI9OVxz9of8mGVpsZ40EvtRs4eg/RzYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl6OK2S6Y2BC9/vkPzW2j3XiT7DygZ/pAT5E6v+2ZDiQ1RIIgqL5+cRTeWEGGpQ5d5CKYFbi+F98TxK9kyz+0D0ywM0m1bEpIfYOmo6iron/BZr4hTVF3TBmd2aglzwmiweDDmbHtHnMKoMTmUa/tFAIqA5V1dNNkQAtgacE8YRTNuq1A37fmmc4HBwhDYyNYo8dUmuOobaZQzkS4Y5A+k7i/UWQLB+bvmMDLX4PdaXTTCBsiniu2ScA+SpOBpLl+Y6qyBS8lDbR61XtOnldq/MI+EEO3nWr4tf8t+CzXSm7yBjRsKXdQapISFApAhtzzixQlT+eLVGooOCbvFGX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dW3OKMWjEl8vJK7ZiJ+4xT9LyID1AzkDlQfo478lkww=;
 b=c0RY62uSGt6AMlt3an+344zDHTJdxD8PLREqYqrlyKABHHg+AoVmqvapLxXCtmIU6N5Wf5URXhCtIzMlIaeGYozN+AcwRj8Yg3OnsoLuJgjB39V8Zb/KmqoC25rEVsbuLeZyvLqHs89SUh/e+f8U+jEOUtz6ZcDoPW9Mueo928DX5InNUgipETkn9GIlIKxozLKNySN0+mH7RXzpWghDXnBu5a4LEcwnRdOlfi95V7LZrpFKz+CYp1lFl/ry70azBRf82FQupge9AclTyDjHmvc6b2xw5qZhrAr8uitFcvPFeTVqoA5LL4N2/nJF2710uieBOAhScoAzdyISggYbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN0P287MB0963.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 06:43:51 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 06:43:51 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v3 2/5] media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
Date: Mon, 28 Sep 2026 12:13:33 +0530
Message-ID: <20260928064336.272659-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928064336.272659-1-hitesh@ebytelogic.com>
References: <20260928064336.272659-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::19) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN0P287MB0963:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cc3ead-cffd-4836-91cf-08df1d2bdba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|52116014|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yAP8DFGyZqPjQ2hUhNVObljKdpz7piHapIjAXl/KkzC0EawwRJ0IaqkEre0J7TD1BoWCgr9+EdIFgrHu/g+V7zvTxV2DkXdHXVr2oM3LJljrbjJDMFpqHBbIq0BFbfzWukVAhkvGHg3bqwIx5TH3F/iUuM68/r1jyeSXJEhojK3Snnr1mXTyuIeLOhTSugGvvMg4Z2+gYiDua+JB8q/KQ8wIKZcjXHx4COWGq++dr6o5FiDxGjBcj2GDJ2GMYNpJ1gAnQHrIm46brlaJ7US4TOABgED8KyGYQj/hOa+6XT+XB4EjCG+4L97EoTIQKwXDax7hU3c/c8UGcpes7U9xM5F6kUUSYieZKZkceoIUJ2p+P06EabaZcSLjQYC2nTQU1egAsCXuBOh/ZWq7xT8lJva/kxDIUPVb4S50+bxMkbDHSwhC0ftfThaWluitfI82N42+/QDdb2dALIioc72mTa4uIHx/nrFhl9WM47CPpIRaB0ja4j2MV2BVy5BWEFkGm4hLvg5Z0Zbv26VngcpQ1/DOfD8hjV4IEYKInf3ZADmmbFci4WxsHUh3wE1xT2qUBxa48OzYV9m5xovFIGuUn/AMVKqzM144pJHqMVX+A+9ttcNTxB+lHmE1JeglSLgNCjVFu25zTKP1W1t8TiUlw+hh9tELq99seV8hL40jm/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(52116014)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XjKwar+XzH0X0/kOvu77F5riws29zSjnza5G4yAn0CofVueRwKw4gZlYwjvx?=
 =?us-ascii?Q?ABYESBZt9VUdiFEgJFHkQ68f+sGwkX4P5SNxEp/rOwrc32CRxWlzC2kI28Kf?=
 =?us-ascii?Q?T2akakarZwbo2B99RrERK14olgpr0vXLXjZl5ETHlxcDMD1XIjL/S0/WkOhB?=
 =?us-ascii?Q?4ozr3mKCfzOUiIXfLS25c8WlKbCoynsTurGVirfiqchVuOOnVCaHG2UlB200?=
 =?us-ascii?Q?TATsYwF8dH1M4jRrBxBL748hyaehb1+DC7f0O5KnBXFEi4F5dfKDpcs7AM06?=
 =?us-ascii?Q?C1LpoXfaDFTAH9JDuaEGxlFtjEpmb6CjWTIfTS3SCLIK1MFg14PU4QImFxFH?=
 =?us-ascii?Q?0fuk5+QtLmJESnClWBoOLA1o2T7UWny7njRIx6Ap7scLI+B/O7ZSV651oEaP?=
 =?us-ascii?Q?yRpUrtXvrk8Amr5C0eNpMRdsF8rC05HgVRqA+mpM29e4qCIVKFDpgxdpxIcB?=
 =?us-ascii?Q?cjilGHSKxCd7BALuyPQ6kNaB30CyvLSMmKViaCMs+gyDx5G1BnZ8L9Pdra+i?=
 =?us-ascii?Q?hSOMBFziTBb6wJwrlKJtSc9/9RRc9ETbeSF9DHCbj33yrmPC5BN3WXC0R32c?=
 =?us-ascii?Q?3Nh5Enb37jP61YD1iq05vwjNrryeTgXVR8UfpP5gvp4IaJsHi2PNjl2jPuT2?=
 =?us-ascii?Q?cBdHhysmzzwb3nH5eEDv9NyFrVQ/hd2yLDLEdOIC4Rz018PIYJ+6ON/wj7Ta?=
 =?us-ascii?Q?d0G62FoIZif9f7fqiHiPiPzuOLBYHuGAaOaDbx15Ic1u0dghf6D3R5lKkr6O?=
 =?us-ascii?Q?QREhjPQBoM84KBKlTFlnXi2PR0YPHUD/2c2qsJCoNaewhF9CH+IWaiE1/Dcb?=
 =?us-ascii?Q?/+W7DxubvfpAurQUe7uBebHpcJlEJ8jTx6QtzHGQQM8tDv/ktG5J/k9ylSa5?=
 =?us-ascii?Q?Rb/6GcgxMXD/K7XcsCNydFydyzezNwqjbEuEDCnte+BwP1SPUCj1Nsv9K9en?=
 =?us-ascii?Q?Jz4YZleXDSJ0+Oh0zALQp/msJlc8BwGnke0QDGeFbA9vu4576TUVY/Gh+rsD?=
 =?us-ascii?Q?kgj4A0R+Hut6BKlIzsGorY73coZ2SPL3ls2wtFPtQxcXKHF0GEKWy5NWPmfL?=
 =?us-ascii?Q?YtOGewAgKqu+MTm6kGkGDVJgi354BnJ7GgTKgp99I5FNSkoSes6DQZ1X6LA1?=
 =?us-ascii?Q?Lw0cmSwgFO4ErK9wfcV9Ve33344DiMwkZgeT5Aj9CpLSDZ2bCThCnZFMWR1e?=
 =?us-ascii?Q?bGD+SFMbD16IID0c2JVBwLqqwSJBpnykEKOGPuS0z+ujEXRugZuw3Qe36/D8?=
 =?us-ascii?Q?9Ywq5wcdqrjL2W+BIgX3etNhhFQyw68XzAC6iFU5T/9l2n3UUaa4WRL8p1mA?=
 =?us-ascii?Q?ZVpHcp05pkdObOKLDI+rCbTklJiWnqs8P8ZhGfUrsbnIi+MBXI2H7K07f91X?=
 =?us-ascii?Q?cbB106ogmY3qRPGuT01z3gbcobBDYkFx32Hk1a0jNzBwE6+cZ1jsLwlS62hO?=
 =?us-ascii?Q?4IfKaKFZfcz3+ArGZ+ZSubdWiKJHn/dHMxM55JmP8S7dXodBjm0fuMz52fXs?=
 =?us-ascii?Q?S00t3y6Q9rsWQV1G8T4nrKm+H6u9jhZgj9NMLGyFcoTo22FbHFWFnzyEnrhx?=
 =?us-ascii?Q?Ar1fzeZv8tJ2DJZxougIPT4qigxq5T5TcCW1FwxXWSq9//4aVdYeC1qE9A9P?=
 =?us-ascii?Q?RYTRr64My58AWmQlFfpmIZa3C8tFoQg3z36djEiS9Tb9Hr2n3F3PLbMXUfkt?=
 =?us-ascii?Q?+0vAj735sOAzdfjNvHGJ0bLMHb9NCpwcqcQWk74xRK9FuKc/YTMndSu5vHLN?=
 =?us-ascii?Q?/CmTjS6PioZHEufbf90UJherXBDcnrFyUfDlHAgSGsywZK0v1JUAta9skDf1?=
X-MS-Exchange-AntiSpam-MessageData-1: 9PaY8nJ8ysoIug==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cc3ead-cffd-4836-91cf-08df1d2bdba1
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 06:43:51.7271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWAI/cZB9JDmLXR3ABf35H7/IzodxzS7u+Vld+gwHHKe9SriTIPLEerXqPL3PRZQd4vnzGgOyxWgcAIuGEDkXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0963

On the gen2 VFE bus there is no crossbar between the RDI paths and
the bus write masters: RDI n is served by write master n. The common
vfe_get_output_v2() reflects this by mapping line->id to write master
line->id, and every gen2 VFE except 17x uses it.

The 17x code kept its own vfe_get_output(), which reserves whichever
write master is free first. That happens to be the right one as long
as a single line streams and it is RDI0. As soon as two lines of the
same VFE stream, for instance two virtual channels demultiplexed by
the CSID to RDI0 and RDI1, the second line to start is given the
write master of the other RDI. Both write masters are then programmed
with the buffer address and frame size of the wrong line. The frames
are truncated to the smaller of the two buffers and the SMMU faults
on the larger one.

Use vfe_get_output_v2() on 17x like the other gen2 VFEs and drop the
duplicate. This also removes an error path that released
output->wm_idx[0] before it had been assigned.

The gen1 VFEs are not affected: they have a bus crossbar and any write
master can serve any line, so vfe_reserve_wm() is correct there.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../media/platform/qcom/camss/camss-vfe-17x.c | 41 +------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index c011f64f63..62c2405359 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -382,45 +382,6 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-static int vfe_get_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
-	unsigned long flags;
-	int wm_idx;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	output = &line->output;
-	if (output->state > VFE_OUTPUT_RESERVED) {
-		dev_err(vfe->camss->dev, "Output is running\n");
-		goto error;
-	}
-
-	output->wm_num = 1;
-
-	wm_idx = vfe_reserve_wm(vfe, line->id);
-	if (wm_idx < 0) {
-		dev_err(vfe->camss->dev, "Can not reserve wm\n");
-		goto error_get_wm;
-	}
-	output->wm_idx[0] = wm_idx;
-
-	output->drop_update_idx = 0;
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-
-error_get_wm:
-	vfe_release_wm(vfe, output->wm_idx[0]);
-	output->state = VFE_OUTPUT_OFF;
-error:
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return -EINVAL;
-}
-
 /*
  * vfe_enable - Enable streaming on VFE line
  * @line: VFE line
@@ -441,7 +402,7 @@ static int vfe_enable(struct vfe_line *line)
 
 	mutex_unlock(&vfe->stream_lock);
 
-	ret = vfe_get_output(line);
+	ret = vfe_get_output_v2(line);
 	if (ret < 0)
 		goto error_get_output;
 
-- 
2.43.0

