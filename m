Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720300;
	b=XVo5clQzSwaQRFXVep+vmyxon3c72NeKW+ytRp22gnyfpv7v5rOUn9odryn8S3OcsYMK
	 iHSmzR1TFPojiLpFfxPQQgAGofNev0cKp643apYvsAOlsZ/n1+g5mJ7pCZkSBwOLw0Cod
	 BCoNpMYLdqL3UWMlb4o63l7Da5gjcuFciLzM26m1KbVRRUaGahzq3L2xYiSsx9uAtSZ3I
	 RxeKKpBazjwa0ShB25IM+21ksuw3/eHhW12DLUaz5Zcv5n2vF4jXiJWmegpDGMA68faHp
	 2O2g1IY7sld6KH1c/Jz1DFEiPsnq0Aoy89XPzG9nj8o+loVhF1O0TrxVEt4sqreb9iA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720300;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KdKteD+UjzM7HjSCccyw65m/PuPkGB4Pa6WBT8eb7X8=;
	b=ji3jaM/2ptXszm1UsdhdudWZ9uAbqA3/hW8BcOykHV/Vo1x7DBuRrOlvXjwHsmvhKHOr
	 EpHLLkdoWNK1RtmLJ+dFBlQdeTcUgxovuhKiY31IGSO5kG3aecoC2YxpAGm322wKIjtc8
	 HK0sk0fuJUsVU0aYQHGc/5pzUNxKGL00U2MY6kOCvh264nrAlbeAiI7kEJR6fb4vxqDCz
	 ThR7hj/Euw3rDA5/m3zF4vqtrmjsFhwVllfg8UcHU4OxM90KVl6ECcHL6972hXsGljBVK
	 /jpIp1pmmDF7tOejTQep4DNGcWvUYU8Cjln4X6xvIa5Yd+5hFRqsh2mM+jgY96zm8fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nHYxzKQb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.25
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013025.outbound.protection.outlook.com [52.101.72.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F7606A32C;
	Tue,  3 Nov 2026 15:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B34F7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nHYxzKQb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6c/vBAyW3/1gX+pebCuKX/Ve4nQDHnw5iOUPN2JVT1KBWKHoS9EemnTv+IIt6HkPJjUOw8lB078WiZtPzGjw5RqkaNRKf+df/YeYN0uxEUCO5NZdh0m/j9k0nf5UEW/thccSsI0tEulkwHHLzDBYrEJNk/CGoRXBUTH6ISJIK3YWsOxQbrXOXb5WCVYws+kTAnRlhLadj9/zKJHuNPq6zAQgV6fWiYWcK0ILLRaaVLnbaLo+E7cAuiR8otCfBMSDtwEbAMGvXVtYGWBvUHJb9WF9uL17egHC7C4Jvi/uM9vSX4OYNxJC8Fe0/Iawp8StI9QikCq7TXjigHxT4DAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdKteD+UjzM7HjSCccyw65m/PuPkGB4Pa6WBT8eb7X8=;
 b=We5k8VquFrK5oCrBDN/OA/vIAcB7lk9EwrQcE+tfANi5YpLVOqGPXUjhRzSDZ9ozLwzG4qWd5/NK57B3koLf3nt1NZ3HUL0WDwq9STurQKzImk1TfP0Nu4XQiGs/EvIncPTyPWlY7cJ19yDXCiZ1rMrMVYXDGKdL/9CCF+kGyCdH6PMKnkatnqhAXkmVr9A7uASO0RVNMl0qYyYK+r2PhhBYbKz40IrabLbHfkX+5dj/unBzq5rcA5np+pJMm9ikRCDZMtiL6enPjDGC8EYmY51Z6p1eYscs+H5sFvzUKep4KhG53PcZYw8bCw3UfaZeqnwQt4PFifRRNGgeVfLABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdKteD+UjzM7HjSCccyw65m/PuPkGB4Pa6WBT8eb7X8=;
 b=nHYxzKQbp/g0J+d88yCs7Rm6BzNpF8LdIr0OZpu6WCEEDKXX9y4WzW9tYx1PT4M/fJSQkePtKvhE8In9M7qfMJvvwgv/fM8mwERTREczQXt9xsOCOy4b2JT8/CHRIQBl7tu2cDX0X+ZuSVEdazAYKghTRQxP9jdC/zet1tfhOobfY4RETz/46sR7v9gQ80zpCRZpGDgs5cx6k1UrdeHQv8v8IFSt79EwDpwWYaXdjIhZ1Mndyi2Q+M+RtvRZ5fjFxXvaMNwZtzfDaPu/CwPZ6KozPdbEm7seHbYZ+WLZ9yANSigsTHjnDZfQCZ+es07VYpiSCGnyHerhnINn1mBVFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6994.eurprd04.prod.outlook.com (2603:10a6:208:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:38:16 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:38:15 +0000
From: Frank.Li@oss.nxp.com
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org (open list:MEDIA DRIVERS FOR RENESAS - DRIF),
	linux-renesas-soc@vger.kernel.org (open list:MEDIA DRIVERS FOR RENESAS - DRIF),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 5/9] media: renesas: rcar_drif: use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 10:37:05 -0500
Message-ID: <20261103153721.1232488-5-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4060ee-b87b-40bf-08e4-08df39c07a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|18002099003|22082099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261026140227099003|261028144727099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	KhSWFwqVZ+Krp43nIRYrxKxTaSe/dv7IQs5W1aJXGLYN6xWMJIqEd2wsD0BCbNwj88Gx8clamscUmNPBtEd8G6gEn3Y7BOsIGfw4gqaU4xKMjVsd/1E0OhtdamwjT/dUq01ndQQahofsCx88KrJTruFo5lESv+yh2qeyZBDBjrosQCcg4YDAxpDohKA+ZPtx2zE23FuxscsC86t/3lVCPkQ/gmA5qg59x4kTeKImBXTs+8O1KTlULQ7bvviaGMfeEl4NLDz3ZaO7xvjEaZs/+kz01xcAhT/9F3IR5JJPe0mt0HxiGlKJ9nCOWBWSPh1h/PjCPFjrXjQOTU3UtezJDJcLcPcgnDVOzOZgY2qmcPbY1mueFo43TIEr5De9Z2rK/n2Hw9jo6jNPAw7wQLi4yJ0+QEVHkMGleL33O/bkmn9FgWF4vv7n4G8s9tLX+tyNUz0a+en4JGUgVKqoB9AW+ukr0XDfEisZFwzENXqO+g4UpKLfGXDQoSEYnNq6LbdYWug4TU8iQiThrXAPw0ycOHm52J2YtTGrtJomU3B3rZiIJbGJxTgON7U/uNKfdpsLhcQ8tlJ43XrlpC87vcyPA7s68Wyla64+MIjkB2rEQ4TRNDp0kG5zWdm8SqERqZ1V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261028144727099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+FbKrmhyXtTpXwxPhOb/7j7rp1sAIeImXSma0GmRivY4qMXvTgjfd+4YXzHM?=
 =?us-ascii?Q?b9KxLeF7CcKaCuuDKOFc0qoZ1RQqpGxAbJJd+IuV1CJ3qiokQJNUSMzoLz0S?=
 =?us-ascii?Q?rUivBPEoJtoG/5jPk7QJluIezg66fEjtdid4jnXsCIlLVLbjmomLAq6FTA6A?=
 =?us-ascii?Q?RIbKcB3fjUnTWrWN/f2AlX/8nYzTWYeLtU4xz5N9rBgwbxIhmBWoj6rgU7pn?=
 =?us-ascii?Q?jpgtKzC9DqU69tRiDs/9zE/4/3T852P9YgWzJ0xRZljA3W/NmH2z14QN6Wog?=
 =?us-ascii?Q?Wbb6pwepVxv2OiJfcQCiNArpj+PQJL0HmuPavHTPHH1xXkXmn7LepDBHMz3h?=
 =?us-ascii?Q?e7dco72bhfVJH5Lzh6HfG4xl+55dMBBHV9qco2LB4+++xi1sXhgoiEtesFf8?=
 =?us-ascii?Q?NP5UHjGyoVTKzpTJiAo9Hx05ORa1P3PdhvyZSmCRBeH1CSbvCOY/Zea7ead/?=
 =?us-ascii?Q?eXUU8ehS2zQK9gqZdFYu97g1kbBAQq4id5szSkumxSUHFvqxJDFu8YZGJ6C3?=
 =?us-ascii?Q?CknB3GiId2+Y8dfXZTJ9BCsZK0dV/E3Y0PXTrjD1cNPBQY6W2QPUlSLE2X/k?=
 =?us-ascii?Q?VYRmmf2wzoCYGWU8taLmQN9B+0iSnPV/JwU9ylkHdHxuYffV2Kmijg07Zcx3?=
 =?us-ascii?Q?MR1SgbAst8YmkUJbBfxJ5/tY04bzGeqMVhAkXSti9fyIkHiC1DwEazTx0Yqg?=
 =?us-ascii?Q?dorB5NtMFlzZqvpGw+C3pWOecxhVdLEdKRsOTPF7wSlXN1BEYVFChDcaIrc7?=
 =?us-ascii?Q?G0ruyfcuOmT8UQP6IAThUdFCC6pibOA8pUgVxKFiqqnPiGApQTXqrrYl4S+J?=
 =?us-ascii?Q?VfNVybr1liQnJWaJ1iPGaUOi7kGTRmEH5axAcdsxN5xlFkvsY5ZXfzSoLCQg?=
 =?us-ascii?Q?CGF4GtDA0FUh648I4gxnBJc7OSuT0XhrRGgj8ep14FTv+bsTrtzyEmiNfcCN?=
 =?us-ascii?Q?Nm858Xe7nn5e0yIT4JE6f+q4EnTYXhl89bLA2Lnjv2qke6yhf3OgnW1jjld5?=
 =?us-ascii?Q?weoM5BwCTAW5UCHLELcRk5hrGaFOUby6BzKD0GVBmYMTIS2ex0z/sbImU9Q5?=
 =?us-ascii?Q?sqruMG6Oa9B0ALLUHes9Uk2JH54lkE4erCwaiEjeF3uegBGjuKH8kcmMDEuE?=
 =?us-ascii?Q?1s8823NW0cAgu0agO7tOF8twbDBSn3iBGsXQiKhu7nz1miaM0Pxm9ohf7v4M?=
 =?us-ascii?Q?e+XJ0UEip5JsUJvX4QyCKcEDbLpy+FnzlwIwy3+rKIq9n6hzWgp0G5G7UN55?=
 =?us-ascii?Q?JWUXdbBjM0kGwNsnMllFzl7+xPMWEiHjs0QgMQNefXQSOpxFjMlqstGBFGQO?=
 =?us-ascii?Q?qJxm8ttfy2hHav87Fw4U3plbpqvdqvV+ULwvYSthYJSLssw3CHk4thZ8RfoD?=
 =?us-ascii?Q?K4UL7VCj1S80kr6opLHr8hbR3IQaqckjbgAZsQSL5JJ6VUqdRcQg5QIa30Eo?=
 =?us-ascii?Q?gFm1nrcwt53iuFafvDE3epj5eCRFIZX5YamY7IhrhCEMVuOUPZJVJJ/mOM02?=
 =?us-ascii?Q?Gknnz6NcF94Vj/QoSjDoAq+uzrB90L5yHTQIOo/BpDGIw2AMzru5XY7D2Kss?=
 =?us-ascii?Q?JioUye89q6RMuTvyQfwX/CgO4A2DGWtAxJRztpc4eF9sUFA404a7J/COW8w4?=
 =?us-ascii?Q?FcC9GhY/c8AKwJPo//oXwP5fF8gkBdwXEN4KhgYwCBtwqz5lOj1yPlRAiIMK?=
 =?us-ascii?Q?ZiVKkFNGNKC8vDSQakNQk1+6CpHL6SzEI/+HwcOHAe7QjjOXFxQyXsS8I/Ql?=
 =?us-ascii?Q?BEAFCJfgSH/+GIVhpVggjq5pFZKeVo+6XCE6lbRGn6b6eQBs9SS6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4060ee-b87b-40bf-08e4-08df39c07a30
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:38:15.7028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aq39EIvzaMqUP7IazUXyf5dpKvUzt9Z5uujDwSd5Dj9N2gh3Ml15qVqOv2A3tw2botMnfjRZbhZnRmQ3JDL9NHew3Xx1OsybS+LC3BqwkGX9AyZEdIdckY5uXHBU3rhD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6994

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare to make struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
  split to simple patch
https://lore.kernel.org/imx/38f6a9abf37b06318bb6429ac04807941ca8d558.camel@collabora.com/
---
 drivers/media/platform/renesas/rcar_drif.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index bd67e8e16f537..1e8cf71b52cae 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -610,8 +610,7 @@ static int rcar_drif_qbuf(struct rcar_drif *ch)
 	}
 
 	/* Submit descriptor */
-	rxd->callback = rcar_drif_dma_complete;
-	rxd->callback_param = ch;
+	dmaengine_desc_set_callback(rxd, rcar_drif_dma_complete, NULL, ch);
 	cookie = dmaengine_submit(rxd);
 	if (dma_submit_error(cookie)) {
 		rdrif_err(sdr, "ch%u: dma submit failed\n", ch->num);
-- 
2.43.0

