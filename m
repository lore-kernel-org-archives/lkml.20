Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475266;
	b=QIxt3FncdmNsDZoWurXGCV5qxMIfD2ZYm+0TPwcvjKhiEvpchmSXB8Z7fV9hnG1rzXWx
	 qEhNPzzkZNg5qiLjqUWCztZqO8dnPLBupGdpFkbYob2yJyDZlY6x55kl0m8O8OQSg2q3r
	 TLdehqzPJlWSG/YtrVViVH3+WOs6NFskEK+14gcwVlno2+6aqxACeY+t1WlWrCkhmoEw0
	 ZuOOjqkGIT4yCUxgRC7ioo79SXBTkiuEd/K+G8hWzkeRsBMaUMbQZB10eDP6URCQzoJqK
	 q4TqIAnU+Lks4BRhjfesnnEokbXrOwMrVG/JqTSiiAS1aU9tAKO9ecYd7N7AE+84saw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475266;
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
	bh=OsutwWL1UF80eFNTfZL73f8TlBQrVtWIE78ihDn2oVY=;
	b=nbxhz8Tu+RKQFEHV9QRdT4ABmbTtxNQS5jRkbnUpduRLXLCNWiHmgw/MTSSVUe2F/kd8
	 xQCbz741MDo03IWWALO7GecV/s90vEnDtGA97oQUhd+OCk5ZOBZ4Lrb0FYtl6SOvq/bLi
	 7BcWim+pZToxyYrlEwyXV+oK3/TKHyAyuA7VqiDteNqWpFl2BnB4VMoAudmL+ucfSZ2jV
	 0XSkx3bfx1mfIhupBwWV+wtxGohRZankAmH0/qa8qlL52Lyp48a+tYdr0ip2bwMYUg6+I
	 VXMrvQnO3Kd4ttcbBWJSZypWCcWJAEi3rlymenPvLN3LmL5u3ADTOV6YNO5ZxJ9GY0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=v2NK2X78;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.37
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350B4606A31C;
	Thu, 12 Nov 2026 09:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=v2NK2X78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESz/J09v64ghQY1amj86C22Fy+l/jTJzycxMGfqrv7eLnBZIDew1OUbvxCdePEbo81EjinqV0dfNbIshlJIPGLvReqh5Ff/U+Tubw+J8bRyCewGShQfp1pLt8PrWpSWWZxuG8jhaWkUcOeUEUqiFBwDH1sTvWUBtH881XJJQlHO8kZ2c1/VALp43lVjlS9J6OjXRj3yD1gFzXcxIrKQ3XC43VdgUboCt60oCBWMo6tJKd5JAUFXM6WNtCIlbBxEok2tZCID27ck4MXS1/BAamCazWlb+wKhl1TxJ+ltfWlkTLQ9ZsZ2XOibhySZaefMF1EGrAt1aKOtc66oey/yO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsutwWL1UF80eFNTfZL73f8TlBQrVtWIE78ihDn2oVY=;
 b=zXArrntOxCx/UXzhpXoJDK7UruJ2sjS4ZBrZSS9JcCXbOoxoxSwfa/uA7+mp+GYDWCTwdNLHkwpXHm1IqWhDx0Q7NnUrBGSdccgPmlS0bOL9be7h6Z6rRwweBGnE+O/ppuvAoAwNgQsq8mdHmwKkOTuYt3bt0P89xzsde1n769LMC/EqdlopShQaQPTkdHnDIZ9FF+c1VOhLLQNfSnmpJYZs6nGS+d6u2wxaCYEOSgI/LztEiH9g4FT/qL1BIsICo4svRmEVGQgOTAHYOj1UYiHPY8MmYGdmHq9IBj33YZGHsjzWvB+kpLWnLKG7cKqtiPLUYBuYxfp/C2FouLRctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsutwWL1UF80eFNTfZL73f8TlBQrVtWIE78ihDn2oVY=;
 b=v2NK2X78xU6nKmJ+xwSyknffYTiJO5lsZBRnh3gsxy07uOpP6Y02JARDfW57tQjHK9luIMOIZdbFDwR/BdELG7Fr/qDyiviZ/qjVWCM63PokZART+6HqZ1W4F41UKJf8VtuOUHQqae3OwkEsGj3tB8BS1bpe4CAm/E/HEcsRm/C06LjqmWbuRVNpVYcGysMdoJ+x07BL0v4y2DxRAogVLeD1vpzqQacERVjbScDXiNk2X2xoV8kz9Te4KidYDHjWqvSHgwmUHComQVCbBZpLoDJ4E1Wx7C+8roA6y9UefotRip9GkqHkqgsGdnTCkfg41P8Q7k9CojO6358rHWbqUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by AMBPR04MB945578.eurprd04.prod.outlook.com (2603:10a6:20b:7b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 09:21:02 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%4]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 09:21:02 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: alexander.shishkin@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com,
	imx@lists.linux.dev
Subject: [PATCH] usb: chipidea: stop asynchronous work before destroying roles
Date: Thu, 12 Nov 2026 17:25:56 +0800
Message-Id: <20261112092556.2747348-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
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
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|AMBPR04MB945578:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e66fbd0-4589-466a-d7d7-08df409e4541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|23010399003|366016|10067099003|5023799004|11063799006|56012099006|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102130727099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	YkrbIFmJKfwY8Umaup7s+IWo4BfQ2f4fujvNGUTzttyQeB8XVi6nUK/DSDgNPQJxQc1hj9YO0PI0FCQfx7dsKJU2v9JB9pOwULgnFxb4mn3en+gsYjwSEUM5BCHlNrmpKPVuhyOE+cKvndPplHGRxeDY8AqV8j45hjPqHCUudMD1Zm6f8Ss40G+UrjR1D63UBeJQhAT4reb3l+C3H5mzhZrPTOVQcgWiVWmC0G5kHr7gqyZYHP+/JqDs+x3yYN9txFfIF1ekwOSaKGYSPRCd2P5poxEWgA8GQdCI602cKoRT0FtaEjy0KUVGUXCeMuWFI3gqeOCVhnXweHAMcPB1grG3G9SbIAUm7Y+S3EcjKSWV0TLf5ICy1ybFMIHBPq4ahbYYOs+ziwB5OZmEAZdR4vlK8X+8OW5QY6n+5iSywjeHuFZ6/aYMfVLiiCTWuSwKjvYcUTa1SxOj15nJL9fxNtJwnoa1JbDPyDF+mJ3TQxCBt8hBG2TzJ7hXGr+sxX1nhWRfAAodBkSCMbnUxAJPRIySBkKLpulJMpGlMrjq+L/X9f+9W5eHOfnVOrbuyRWNghz5Jaf8fYsEAiHQrgBI0gku6dDyx/XOQHWflpFKXTVX/5zTp12EjB+eQVYAwMNAlrjf3DglwrBNSjW3dlVTXTJwn+hYV3S1HjRI9N+WZj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102130727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/K5Mw6i/oUB1LuyrTTdwL8Xf8tGEtKvNkYcrG/zpk2dGyUwihHmBkr0WvMz3?=
 =?us-ascii?Q?+74vBn3OFdbETrX9yHQfuUb3ZfLXQqvu2Shi2/u+G/JbazjVZ2uPOvvAn/LC?=
 =?us-ascii?Q?r5OHMC6LyW75qbNbmMmiuywI2ktFUVYabLBbizM7SzZICG3SHgVkz0+R4gXx?=
 =?us-ascii?Q?rIa+QhAKb7SOVyu3K3WrMOCk8nw3nwOC6l09GEdyivt4f19zmqH8pn8b88iv?=
 =?us-ascii?Q?+HmYwiGBdByvwm3x60jYn2ohiMhUVAihtWG0HiK7A5DGBA1f1AUIKPLiqkGG?=
 =?us-ascii?Q?CwroYNH3Xjel+wti7pWBvnb5tUBf/IFy4UPKqfXtnewPrZCaVD8A7xr10iHZ?=
 =?us-ascii?Q?mSmditAridcZs48R/qTnbyDAiTcb+Q4h40JMWO/xz5TZXa3uOxMMEvQ3+gtX?=
 =?us-ascii?Q?pve7WId/Mgl73YkXoNg6YsFezRt6MbY6QM9+9vHxwEFEbkA4XuTi0cT6jcS0?=
 =?us-ascii?Q?njgsf+KL07v1/9OcdvCwZvfCywjggYfWXh66RaChmnjV/QEMLAtPH/ZZVMR7?=
 =?us-ascii?Q?H+2ddFwREKOo0inZ7dLTLbQQOmNyFpB1pgkEf9AupjLU8mfI/CS9E5lpmEcu?=
 =?us-ascii?Q?o9B+H7gP7F/t63G5Twaj6Vlcmv3B80iIA+3jwZvCSQzESri2G9hU62Yc0j/B?=
 =?us-ascii?Q?ETfLyFDC9pONmjADpgBaBqjZwSFRhL3FZwaap2WXa+EsJaWkZVrJ22L5lVpM?=
 =?us-ascii?Q?88MQj9e9BT3j6D6tbOmn12E+TsxRDc1Rrk6WDx3p0VJFUr/9AByee63rEz9u?=
 =?us-ascii?Q?AjgrIsL0Q9SNOhlVKsU8syhRstmMmNOVnK0oi72o1kIVb99H3P9ZO7HIxuPe?=
 =?us-ascii?Q?4Vj7kglfyNj3P8Hmlbc/LGmNFiBaiLWnsuZHChgzI8CxRHjDvkHDfbGpU1oa?=
 =?us-ascii?Q?UiMErd9Y5GavKid+Tq9OUL3DIC5T41DAcWkGH2kGs/u4HJ/pliaHGcGjk5nE?=
 =?us-ascii?Q?Gd20imYVg55Mi53Hc/nLJteJpVluohr43YYfPK4/woQuH00x10GKo/HIURLN?=
 =?us-ascii?Q?AW1Sx1g/aNSIXw98bpVlWxgRbxI802CEPNI/P9OL3ORPPZjP2VpP0JGQBLZN?=
 =?us-ascii?Q?YsEoTcHEdN2tcSSLqOX8b4PqIY3RUljOdEPdDg+f02tHH2P3JHZeUVt7tR3E?=
 =?us-ascii?Q?Wx05BsjwBiQgUOl6kT0tJqG1wOQaSaUrXWSzryiUTbHCJEWEAwK/HXmILwiX?=
 =?us-ascii?Q?tpaPfIiNgLbruGziPYMgRb0Pjm787uyD/a4IVSNHuqLnpHbTQf0756fxv5Ua?=
 =?us-ascii?Q?jlfVHDkkTeiUBlsbbdQo5YysAld4HhYLSfuQHWyk/lRbZ7Iv1BqDj9MVUa6n?=
 =?us-ascii?Q?9BDraMF5DGllqQNyS07Hd7LnD67exnyqAvtJO8tq2DneH8VTCVlDOv/nRCOQ?=
 =?us-ascii?Q?6mMrKfEbkGfZwolIKAaWA4Q2det8xPSWH/QQKeFypyvV2PPRvwbOItOmk08e?=
 =?us-ascii?Q?HIgDmERFpfNxV2hZaX7qWd7xsuPqWx4ZM1WgQVY0inDwKwnySZJL1fK0LxuQ?=
 =?us-ascii?Q?6fYeEJuSNg3FvZxYVWQkdRsaL9fy7QDFN4+tJMxGNHk0kOf6oJPZSL38WfYE?=
 =?us-ascii?Q?iQAK9fbc40fXfpSNiyvw6PNtXO5Ww+2s1sgZZjcXcDzdYGV7ArC4AZkoK0PS?=
 =?us-ascii?Q?dBkRPo71kwW/nlMmqXWrKb0oWri4V/5vO4qUn3QXV7fIlR2POmpXQGIMlTVN?=
 =?us-ascii?Q?a9I23da8KvsCQVPoOu/oihQ3V9QKEJb8F4RMWoG3pZfRejBT3Cq70dNuln5I?=
 =?us-ascii?Q?YWEcMvHgoLFAq9nAk9DhwQzAVo3RpKjkXKrIdkM310i8w5gtV5vt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e66fbd0-4589-466a-d7d7-08df409e4541
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:21:02.5169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6YLoarSf3Rf2s788hnAThNRPV2c2I80bSRxI+vZJ9ehF/Yslinj0C5p6dn4LbaqpE5Z24WyED3F+1qj6o0Xz1Fv7/WhJGpIdPD4CUY4BU9bpzB43USym7eeXyS9r8l7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB945578

From: Xu Yang <xu.yang_2@nxp.com>

Role teardown currently removes the gadget and host roles while OTG
interrupts, FSM processing and work items may still be active. Such
asynchronous processing can queue or execute role-switch operations
against partially destroyed roles. In particular, a gadget instance
may remain registered after the controller has been removed.

Disable power_lost_work before starting role teardown. During OTG
destruction, disable the IRQ and ci->work, clear canceled ID and
B-session-valid events, and remove the OTG FSM before destroying the
workqueue.

Finally, destroy the gadget and host roles only after the OTG machinery
has been stopped. This establishes a teardown order in which event
sources are quiesced before their target resources are released.

Fixes: cbec6bd55a45 ("usb: chipidea: move otg related things to otg file")
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c |  5 +++--
 drivers/usb/chipidea/otg.c  | 17 +++++++++++++----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 3461dd763a6e..eb7b9c0746d8 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -942,10 +942,11 @@ EXPORT_SYMBOL_GPL(ci_hdrc_query_available_role);
 
 static inline void ci_role_destroy(struct ci_hdrc *ci)
 {
-	ci_hdrc_gadget_destroy(ci);
-	ci_hdrc_host_destroy(ci);
+	disable_work_sync(&ci->power_lost_work);
 	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
 		ci_hdrc_otg_destroy(ci);
+	ci_hdrc_gadget_destroy(ci);
+	ci_hdrc_host_destroy(ci);
 }
 
 static void ci_get_otg_capable(struct ci_hdrc *ci)
diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index 89a6a37815f0..8ac8969a45f0 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -272,12 +272,21 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci)
  */
 void ci_hdrc_otg_destroy(struct ci_hdrc *ci)
 {
-	if (ci->wq)
-		destroy_workqueue(ci->wq);
+	disable_irq(ci->irq);
+	if (disable_work_sync(&ci->work)) {
+		ci->id_event = false;
+		ci->b_sess_valid_event = false;
+		/* Balance disable_irq_nosync() performed in ci_otg_queue_work() */
+		enable_irq(ci->irq);
+	}
+
+	if (ci_otg_is_fsm_mode(ci))
+		ci_hdrc_otg_fsm_remove(ci);
 
 	/* Disable all OTG irq and clear status */
 	hw_write_otgsc(ci, OTGSC_INT_EN_BITS | OTGSC_INT_STATUS_BITS,
 						OTGSC_INT_STATUS_BITS);
-	if (ci_otg_is_fsm_mode(ci))
-		ci_hdrc_otg_fsm_remove(ci);
+	if (ci->wq)
+		destroy_workqueue(ci->wq);
+	enable_irq(ci->irq);
 }
-- 
2.34.1

