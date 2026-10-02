Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E849A3F0AB8;
	Fri,  2 Oct 2026 19:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969345; cv=fail; b=LhVXHR5ylmIQDhWFGAoh6Th/SWiXXsWKV65W9ecZhxifI3fiWAsOZ6jo0f9qS9lwktiuj8KYfAt4rhrFXDE/VvBzGVqlz+Q1vL30WnyD5nVEhKzX/veUTVr+9oVi3Euo2zYAefkJgw7Dh3eDdR4g6BDJPSkUx9J/TQeR4oJrHPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969345; c=relaxed/simple;
	bh=07Txt+2oBkV0TdJPFJBSn+TEldk9NvO94ZZsW7Qbu2I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FmBHEIwnitUe4DVK9oABTBeIDWg0r5rHhhkZMPyMRkzGruMjpBJ7aZDCw0hXhOY7KHIjFzA3vJONcv5iIA5BWUvR/7qUgM+MbrzzVg3Im6hkrNPIbwy6KovTj3pzWib3wSvnfCO/i1Vh/4Hd/Cc6LvZBQwi64ICz3uo7Ut2ws+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=knZsGqPa; arc=fail smtp.client-ip=40.107.162.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="knZsGqPa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/UTnjOgQl0HVP0JzShfdtkzNzezVNUnqd0mb6jPeApRlRd5S4BbETAg3ECkRNN/inJJwlwXJFpvnK/ZaBqmwD9gQZy0fM7KUoGgBUvEYpcHceCGzoj9yTIVj7Dts/CWUxEEhX5rF/XKJhVdTwYQBpsem98qGWMgVYg3BTDhcTNQ+NJWiT96CeDVwEwj0VSMDy5AhG/HUAc9yYfBXak3QfUIY3n17fQtYJeuTPv+1UJg9ug3oyFqI77PMaBGgZGVTnARHAZ7ZuEf7kmGu7h7rPWiNGydw0Nl61gmEOkVS9hGm2i/zAzrf5QiabEjvOb1eK882PvKNjXESHDunzr7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wub4uH3FnIVOEJKSBbAIcWMWakkHoBlwMGanKxRl2kM=;
 b=XMcECFOFEyreJx4be0q1aYTGrOwjSBTRJ93sj6r8THbKWRQ9gbHAWIDbTymLUCJkgBDC+0fPuXvxuLn299D4t0SuT9hRZ5YJUJvscsaa7fVaD2TrgNZFboo7TYR9FWzgG9EDzyIlHloRoJnCuvBSP7s+BR/c40UdD7ptJjsB3X5CeB+e7L8IpADqp+ME8GURUZjO1IhL+Bk8X3ch2uep4PCxNtvklu7ETePbTxYJgR9UL71t/UD66CLciwOmwnY/2ZG6u92VRccaXOQebqtqS6/2bDCXcxUIqDSXhmPr1++RZm+8T9nEW1CaJdB4Fe3kqfxW6N3E8YWZmgASyGuq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wub4uH3FnIVOEJKSBbAIcWMWakkHoBlwMGanKxRl2kM=;
 b=knZsGqPac8EpQm52l0s1flKa8h7gah7h/hyqRWM55QGInZfJI16jZcY7U/QE+n8hyIBswa2SUhgd00xe2jacQQXqE6AWg95Bcz2OdY4uaMgxlkSn0nJGykNfk/XAdHRe7097o4MDVHApBwua1hY4htTZuSpe7IU3FKV+JxrUrAiXfLRftPL+6qgNO9QhTw/MgC15ZRzpjI7B75Y5QlWB0JXCPxxl8KRUSTseJ7h+lP3+Urfnizh0FUXVEHM/+2lffinw8nTWDk+9E4NciIJsJ8QmGcKHeqnMtHgalrJHinb7hgcSCy3dlBh0Zm5MvJp6YUUUSt2YTV8UBzhH89AqYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB056237.eurprd04.prod.outlook.com (2603:10a6:290:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 19:28:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 19:28:56 +0000
From: Frank.Li@oss.nxp.com
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER),
	linux-kernel@vger.kernel.org (open list)
Cc: vkoul@kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] usb: musb: use dmaengine_submit() instead of ->tx_submit()
Date: Fri,  2 Oct 2026 15:28:49 -0400
Message-ID: <20261002192850.166127-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR18CA0008.namprd18.prod.outlook.com
 (2603:10b6:930:5::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB056237:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4ae3bb-6b34-4028-b577-08df20bb66aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|23010399003|366016|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	af24N65cYXTOuo4EVla6SBJmU6W/DpSssOUmRSmEX8IgK1VobLl+b9C29nLzuldpX5SdkUx4StLyWmmQmbn0Mjz0oERGKIaY+74hWH1Msyuha0OaIuNm3d2//p4OQnrTtfppu7NUVpHNpCtqkjvjIT3Lkn0Ca4PWwPiUfADnNS/ldqY/4inPDWVc30Os4sSRNNZWWoYBSNbZiGMmLxvsV9z8u0MToafKrZ6Ey0OSR5fV1HdbRFqlE4JI9zBgRQd51x96YGtTFpfvH6Il1bAFT5GZhmy/szY3eagw3rZNi2J3btxJ7Bf0sNGz+ngZZ+vhfSOBz5NjTS1YxRnT9+LIjc3ykva/yOBM1KXmPFmkTzhWuX7XeUQvw3U2a4S26VJ7LoOS1pOPTZw//sOQW5OeWuW9OlKjSzOVNXXbmzXZjTZCuQAvJ7Hog7swt8hLcqAtTH8vrGNuLzdn/it8xQQ3b7CtTSutZQqGvAvzZ6s9UQboczvQQir3RnCrBuH4JbUB0IIuiBECz2kFbev6CaGBPkPh1urj1sQAE6RnUcvDmXy7w8B3QyZtCOst6VrzKRtykr97xci5af37dsCIz7tfwCANjIuUlnE6rmU+4qDTa5t5Zjtntrs33ggxSgDGQkcDQzbW7LBRvJiLr3+a+jwbiM5+hFneNG3HWfVeNkdnDf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(23010399003)(366016)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kI2Q/H9Ngd+Ojv9teeB9Ws/E4xbjeuL0EJcLHppMVOt+2ogsTiBD+4CT03c9?=
 =?us-ascii?Q?F5l+dyjWGaOjwnVg6UU6OTGnl2RXLk7MHEWrDUGDXGY9eNOO7IpaHo2o3Lzk?=
 =?us-ascii?Q?S7EqAy5CCAAlC41sz/3G1nEdjC7CJsC7a6VjCna1yhKknqiDJNGx//peda9E?=
 =?us-ascii?Q?0TPx6yxxntPeyl3pKhMskMsb7917s97h8DuFyd6VonL2ppSzkMuJSDZIq7WE?=
 =?us-ascii?Q?6CDupk2HKmB6wS3QFGYOPdRgSRyN/kgzEeGxexko7CE9H8lrKhpv1AtY+Axh?=
 =?us-ascii?Q?ztlLqc+7lPDuYBbp6355L8s4D1u1e/B9JbnmG+lNtuAfJcJ9/TXJq47gqMAI?=
 =?us-ascii?Q?k3VuA6AGOw9oSDabb9LuXUyzARFV7BNCHkh48safIwYVDYPD4fPt6n6FdNQM?=
 =?us-ascii?Q?phcxmILRoRocy7Q+3rEvzJNuoloJOtUZyhVnqI10Q2IFS1lBF3GDogq6wQu5?=
 =?us-ascii?Q?6xWlcUOBZky2EJFXb4HGHrLUCd+a/B/b0wTOf/FMeFy+R0qZiLnaq5npgwzH?=
 =?us-ascii?Q?sozx1szokAqyl1pA/Aw+oeyYFl6TaExg9y4KvtSS4TMAQMqNTKSGZMfvCL+J?=
 =?us-ascii?Q?0kFEXMD9WhfQEInpxVYY4oMXE7joj8gel2s6YDjnx5gOHdzEdqs/e2nHuaT7?=
 =?us-ascii?Q?gLLfnEd284Tb//9wDheUCmZSH0Ux6t71HQqwbPACuw92yi5r0YVfUoUteQ70?=
 =?us-ascii?Q?kwe9IJ9K0/SQeAr7NxkJkLgsExhnAtQVcJUm5Xpg47UhHuXbZ05aepkATCxx?=
 =?us-ascii?Q?Plicp9Ir7xehwvbc5Y5CW14pIxHX1TgOh+4sLy+5izwV3xo0trIUNvuQs37x?=
 =?us-ascii?Q?7bAhEyz0HQXcgqZ3mg/LdMevZU7aiQ2efuUTdLLm5zaQAOSuzkAm0XXzGrRQ?=
 =?us-ascii?Q?0HyqH3IfS7aHb8ZGHXoFMhlNfGoKko7ZWH1Tso0QBWSrOxetymcjerXiHwl3?=
 =?us-ascii?Q?7m/srgOcaZw4bxf2Hwo+TCvQGmnMb0SoiVvOFlDmObKUzj5FADcvHyNDe0+Y?=
 =?us-ascii?Q?4zb8PxIIszwyE0syDaxO3jiVtF7TRM34aV+19Ej7xfBWFVR0sZHhXMHWuU/C?=
 =?us-ascii?Q?qtHTfHRKN4GJIS4fHWz/kunOHLJK2yz6CPBPno6PB/4sjaTGCxhw7M81WX4q?=
 =?us-ascii?Q?Jh9yawl1MwlgnmqIidVSTYQV53onQRJ32mu4fW52fAZpJLT3EOo9fB4/u02e?=
 =?us-ascii?Q?6YlnZFeLJW9g0Q2qQEQu6xe4MwcL/reUJqcNZSGR+vA6Kq3pqD1oqLcXsG3v?=
 =?us-ascii?Q?ldlFggVm4VvOXGbhq55AqOsR2/x77bk6K8pJKXWLwnwR6sYxxnKqall7QUhA?=
 =?us-ascii?Q?0qoRMLboI9C+/OHYOAd0dNSL7tCFGqbRWkaaBfnBwLcbwRY6QVosaFFtyQTV?=
 =?us-ascii?Q?wrUyW0XdvCxNsRdFMnfOiWIEpOuTTncvkjjAqqJVH2njvcKrflkDTi/4gfKn?=
 =?us-ascii?Q?WkUMnoeVolVTrNV/aY8LiLIxTAGaRDVZpRmXAEXFY3dWg0W7ZlxmFIycNINr?=
 =?us-ascii?Q?2yuM8k/JhJCITej48Ra4RufkQ2nz3F7oGzSQb8j7hgP2Bv8WOtUujA7Ja00F?=
 =?us-ascii?Q?Wul48WsXRD0KKF5wENPK16CXUlJn0IagbH2J3xC2C9RhYWnBLnZFqlczgqTv?=
 =?us-ascii?Q?wFMA6tc+QAev+p28Sr2rpbi7xcoHg3Gjn3Bkj9KJsxRG+VsOfp7azvQ0zECF?=
 =?us-ascii?Q?zzIJKwmFsCtQbKe2PJl8sVIVZhNgtB7VR942san6dfzorQ3gBJrTLKi0Gt82?=
 =?us-ascii?Q?7w91wqCvz1EwNT6yAmrCOQptO/oQdpS+9mSI86JDwIog2EbhHTN3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4ae3bb-6b34-4028-b577-08df20bb66aa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 19:28:56.4759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxfXAM9c64H2bkvIh45vwTwA2vokGdg6fz63BNcCDmK/o5WcdHNH+dl4pc7FjN4bZvnUQANtHDTR1lEB2w/CpQoGqulWs/06nJs/cC7DRytW6BIU++oI3GfHWG0FtYDW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB056237

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_async_tx_descriptor->tx_submit() calls with the
proper dmaengine_submit() API wrapper in musb_cppi41 and ux500_dma.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/usb/musb/musb_cppi41.c | 4 ++--
 drivers/usb/musb/ux500_dma.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/musb/musb_cppi41.c b/drivers/usb/musb/musb_cppi41.c
index 28e958fcc862c..37a009a4bd500 100644
--- a/drivers/usb/musb/musb_cppi41.c
+++ b/drivers/usb/musb/musb_cppi41.c
@@ -169,7 +169,7 @@ static void cppi41_trans_done(struct cppi41_dma_channel *cppi41_channel)
 
 		dma_desc->callback_result = cppi41_dma_callback;
 		dma_desc->callback_param = &cppi41_channel->channel;
-		cppi41_channel->cookie = dma_desc->tx_submit(dma_desc);
+		cppi41_channel->cookie = dmaengine_submit(dma_desc);
 		trace_musb_cppi41_cont(cppi41_channel);
 		dma_async_issue_pending(dc);
 
@@ -469,7 +469,7 @@ static bool cppi41_configure_channel(struct dma_channel *channel,
 
 	dma_desc->callback_result = cppi41_dma_callback;
 	dma_desc->callback_param = channel;
-	cppi41_channel->cookie = dma_desc->tx_submit(dma_desc);
+	cppi41_channel->cookie = dmaengine_submit(dma_desc);
 	cppi41_channel->channel.rx_packet_done = false;
 
 	trace_musb_cppi41_config(cppi41_channel);
diff --git a/drivers/usb/musb/ux500_dma.c b/drivers/usb/musb/ux500_dma.c
index bbb4978c0cd5f..7b62527ea3f74 100644
--- a/drivers/usb/musb/ux500_dma.c
+++ b/drivers/usb/musb/ux500_dma.c
@@ -118,7 +118,7 @@ static bool ux500_configure_channel(struct dma_channel *channel,
 
 	dma_desc->callback = ux500_dma_callback;
 	dma_desc->callback_param = channel;
-	ux500_channel->cookie = dma_desc->tx_submit(dma_desc);
+	ux500_channel->cookie = dmaengine_submit(dma_desc);
 
 	dma_async_issue_pending(dma_chan);
 
-- 
2.43.0

