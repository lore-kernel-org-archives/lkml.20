Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793377983;
	b=xXTgVgaA+odgkZKIFLO03FWEDasjdrdj89cXQdkUnOp4/yjQ1ll0sjOjUcxTZNV2Arkk
	 bP7dfHHqjEZWaZhTgiWi3nXjDYFAZfBu89GY9Bh8hzoa/rCEOQ7Yzm8tGgdTwnm97ghU3
	 O1rUc44ljw2vuK8y4NW0MKMgoyEcMMYi+daokWrYjsOW+VbgDBSZ9tmbPBDSpkY2gEIpJ
	 iz4NN8SloucKSFR/4Sdr1+3n38xa12/YC4GuRlCTDDLETVdqcjlltrc6ENpK0hYxwn6dB
	 aGRqFdPkkcoz06k7iVauEtuB668ahoM9npvnbna9NA3hn53EsWqqUTP/+jGPm0BS1cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377983;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=cLkinoIlKlhEqpyDX2njKtQeFviYPh8Y2Yu5EbViXg8=;
	b=tsb+2iW80E9SLqsp10sePoMB6zNmE9+Amgqn4DVWqFt4I4Tet34zNMZKNJraeDW1C2sG
	 psrG/UJ+PkjB3ZeX0bvkrkPJdWCIAjbHc4kb010iGvoNA7Xk3QDm3oWpVfNbvzgjbaRFE
	 o4WMO+y6UPzVrn1j4wpCrukR4UQILOpyB5DuXgtg6zhQZyFnkeYjYvNQlHvQPKcokr+Ca
	 /NKHo7N4fWmg33XsIEL3PSeXsieoEeXHbVqv5cndN7yTbqXWyt91mieVU3LDqEuXs6BD0
	 bnhvuAtbYNEPfQ85YM0mIKzeGbsWPoDOoysxk5bB4G1Q1d+VBREc//2LPVBmbjbqWzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HI0wYWX3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F98D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F98D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HI0wYWX3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvMGASt5N8h12yP86/NGmbt8I6zj/u6P6SzJnzvhkh3p2VqYlKJJuo++p6ipq6498JJTYW1h7ygtf/48MJZqsIO1OwqoYogd1mz5xPJ7R49ifi8JPReBJqno5DUU8dsj2x6vthoBPqZ0gxZkbiNUJ5iQmOekuTRWURpQzqdwAh0ham+ZNEzUodkUheCbq6y5047V6huRL/wRllwsIxutk3Wmwe3qKvM2Z7dgW/gsZOHy90JgcRHR6AYYwv8xbUZZXRZlzyui+kR6/Syg35CaHFH3CTzTdU5eo95483w69PSAqG5GkBCK1s2xMgTpMxFdC5Myz1y6t2U6Hc+tbHWRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLkinoIlKlhEqpyDX2njKtQeFviYPh8Y2Yu5EbViXg8=;
 b=udooaHDVjE9P++lEuoFaZ8HOaSxGfWgM413hLDnMiNC8m0mgYxikU3VZ6fouUZ4GyJyvL7HS4X339Yk0V4bQyZ22uTy49bIR7KGYhapq7bvBHptR45cbMxMWosVsDfVaHAsFOWNqSjf9DN+XBx/Dl/r739VhcF44e09ibk0jJC6jlGv+FN6/mMGAhPHoW0x9xQs9fSBlEbk93OXvSoYXTQm3inSmYdPaR8iRu4J+iXexgiAkoJO1HKj9XH6cV1sRoA0PlA8GqOjDD51srYBdXufhz8kswYab7Ez62fL5urWszMXGhWU9eqYRtOawQQJuC7nTxQo7yGAZanJIC9J1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLkinoIlKlhEqpyDX2njKtQeFviYPh8Y2Yu5EbViXg8=;
 b=HI0wYWX3I/DzMKl+Men1NV8Rz8oUKJ60V5Rt5gxWbo/yNAa0rAr/juoEqcSu579h7r7KBnj4iBuPb2oDLW0mCzPmH4OEzMo73OS2GVm6kxZxhsnV0eTa1p+gIRt6eb5fHCK4hT3sCwLjaoHMzSLoHhD93h568KQ0QA91EfaQQE/Xl80P0vMFsDgRgpuaU9691objHaWOXlCGVUn79LSeNelz5/t+QFmwA1PwS7VDWMBRfUaEN51XH6aFnP18Rf2FPaanaohufgkoGJokdBNWsLrh/sQRJkaDItfYO9siMN3dDHr+EtBAogpBXWtmC7aCjGwDBRvB66w5KcRyO5/5YQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by DBAPR04MB7302.eurprd04.prod.outlook.com
 (2603:10a6:10:1a5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 16:32:58 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 16:32:58 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: fsl-ldb: Remove panel naming and use scoped device_node cleanup
Date: Fri, 30 Oct 2026 16:32:52 +0000
Message-ID: <20261030163254.3175671-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0421.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::6) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|DBAPR04MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 38210957-7832-4df3-76f6-08df36a37516
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|1800799024|376014|18002099003|3023799007|921020|56012099006|11063799006|261026121527099003|10067099003|261021123027099003|261022075727099003|261021121427099003|261009221227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	90ryj71/biFP3LUNxqBZuLpDg6m6rFix50WVkBcc2x86zS3ZESLeSHF+GYEmI9nYkl7VS3xNHR+mbPWiE/eDkkBuxcGCvbRynN5g+KyZuwKu09OeVqKOX6o+BuLyfv7HZzMnNEXd4UgmZfpR4ExU3CBmwjAoP1USVxc6+9qwe4reCVdCdQWAKCdkIqZEPz2AeQscplugvv+31UlNSi8JQtPp3Ux/o5iRpRVnvyJZkZHt5zhxV8PlYfuYZGsU6RaAg4zwAcoa2nHUKyg+QlfsV3zMqMN3LlLjnNNNCOW5PzeCFLB4xUtdJovZJ0v0TyLACif7R3A0Yoz6HJHADrSi1pSzJZxs048jYh7TiB0NPWo2ponmXlwAtbCTz0U88uNPRq+zmT9ZVgaKuGHgG0wODn5UJo4St/rhM1NyzGe9rfrQaf1+TpbjjaDxSyVcXrdNeBSk+v2qom92v1v7Fec69hQxtKV5kyvR4/DZTV7Cfkb+CK4i41B3GvpbsWMCc8p71EJm+AAwQtRzILaasTmakh34W6WQaAhhNOu3+0SXbBjXxZf9ZoNTFSGV45lGdkmSun0b1V2OZOzmyzmwhmigwt2dMfVQnljoo/89v2mPFERaaNozpRAEE0O9tI41BcKBeuttOeB9Rnyv7Y5rxLvBeQB9P0IoYpBpMPR/yJvKYeGO9nOYI1LUAmdrI2faytBAqbjdGw6bd59MWIvmbjXNyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(1800799024)(376014)(18002099003)(3023799007)(921020)(56012099006)(11063799006)(261026121527099003)(10067099003)(261021123027099003)(261022075727099003)(261021121427099003)(261009221227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J3yG92vdC4xptKLqvqnbZZop4cQkt/r1xElzth/orf/pyXGmybyIaiyTUBGF?=
 =?us-ascii?Q?bm4iHQTLbx2SDSj0c1yhngFbPrsSo+jfINAFf8GFNWhc+c8rkURhNAXRH2VE?=
 =?us-ascii?Q?tTYGTw0TSQs0j57RX0ALZ2jkoEgfGA2iy01VGbkCjf3719musT8A+4owEn+L?=
 =?us-ascii?Q?DmEc088+SUKd3CqVDaoMvvkr5KdsTm0/JOazSC/YFXfSJyOIkcKi11kQrtXc?=
 =?us-ascii?Q?Hjh/ay1urRdT0VzBDmRnbnX3QVmLF7OwgKYdzLzluaToMoHjQhQ7VLv7HbaL?=
 =?us-ascii?Q?1FSyNagRf4sRFI7f8Zuz3mqwEaMu7wZz8cLjr9tA9CfyVKwT4Y3q8NPyUVAx?=
 =?us-ascii?Q?j++aLfaXVWhzTJBF6kVoRaqUiCMpSPCdt4157MAdUM0Od1xHQmN29W2Jph1+?=
 =?us-ascii?Q?pafHXsfcG6Kf7SAfOobYDX6InN3DuvKZecPgeHEGartBaHubAVulC4qY+fxf?=
 =?us-ascii?Q?VPdoUk3K/OwN+vNNzY25jkXGJvKtljPo4gG305W15W0+TjEHorVWyPp0taGy?=
 =?us-ascii?Q?e55eIZL28eWaz42PnQb2SQLLR1eDym2fAgSJonHdsgmejItb1RcuQPguJ6Oj?=
 =?us-ascii?Q?hF26g6ClY7thRwhh1+Xgv6PTcqiLtHRu/eexJ8H6I4Ebev4BwTVjJT0Jwx/N?=
 =?us-ascii?Q?aHefxiAlw45/CUktW8/b1gi4YQ8/Eyr+nl8TkoEed8NXzhK+/8YEJnvrejCe?=
 =?us-ascii?Q?dx5xJqimoA6h6yk/DX5jqIJ1zpLZe18iREbpCaOc6yEj2k2P0K6xpXbAoZBZ?=
 =?us-ascii?Q?0r3Jb1KxwDPOmVUFYZXSGC9me0mroejmToAsjYBfxtC639jDvhCL9ZJclJHM?=
 =?us-ascii?Q?sz+fZbUIegIn+eARVrRVYlrScF+ltkLLyPjyVmUp1LsVKnlvfXSzsomIQUH4?=
 =?us-ascii?Q?RBaNlsBZ9t80lr0Bsx7GqDgI4Qt+gbP3kS+aR0vsf2eAd7jqOpB8RVwDZDGJ?=
 =?us-ascii?Q?72Rip3dXtnLTlEPEMyo/A+ZSK0qDqp1XGTKr0Z49avRj7WgF4g5pNsYe5AWg?=
 =?us-ascii?Q?IneYSmMdVy1Q/E+xssG0y7S6jh8lEO4sWnfHFtSLlwu2wg8C9jGuaScIYSo6?=
 =?us-ascii?Q?HtFjrUI6ympSG6UG5I9Spr8Wjyz+Ct2Q8+gZYgmIVA8HbfhDZot3xoRnQn9f?=
 =?us-ascii?Q?gTzzQc+ZrKR9oMGY4TVruvAqJCZAyJxL1S0+ISpDQ+fWxuC4BGtXbVEDIsDb?=
 =?us-ascii?Q?vxpGB4N0HcGoYiFZt+YtvQuW7Cy4PfT5bKSdMmWJjyqQuX4XoBAEOy76u79L?=
 =?us-ascii?Q?H6NuIufflLiUugAWCA60xmaDmTl9JzDoKyeKinymudCJOcmr3+s7RT5nbhl4?=
 =?us-ascii?Q?/5JjVanF3DKlJ2ONY9aPx692V/mjfdvzxdMxg5TxMKS31QP1WK9dGdVWtiwE?=
 =?us-ascii?Q?8o/m8Trro3AsV9wnw2RniSiW6YSXvGgkOso6jgqxc2e4HDDey2DgxYiBaUy6?=
 =?us-ascii?Q?PDUxBRg4hSGZV9Omym0Jby2YBkSfxNr3vbfzkH2PMVLawBqD/EUkUJ00xgDr?=
 =?us-ascii?Q?EmUSL+BU0Lz0AfYVPdK/V5MEB6cUBcWiENhUSSrCuPkaQuH31fqu3cyBV1IU?=
 =?us-ascii?Q?Ak5agCTk79HCYid09gXYUlTfjpuhPTOqzkztCACh4iq61FHPlBoJJHeCMGNd?=
 =?us-ascii?Q?EWC8OI82HUSOmEXfK90UEbdGCQvMJuuPqONE4TYhn5TmOmGIcIbMKfQetZTR?=
 =?us-ascii?Q?kAyA6W6URRlbQeLXMwBWknvxznvYg0m5MmNpb2ynVacwD+aRO2veyEUCBceC?=
 =?us-ascii?Q?AcfUihOEVQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38210957-7832-4df3-76f6-08df36a37516
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 16:32:58.3611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWalxVeM1haaFCZG8q/iVCyD0dHLX1WHtLPJMRyYgYIVO51x3wDpqEx/bL3vQz4L0Zc8wXyE5l7QMMaU4TkpQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7302

The remote endpoint node is not necessarily a panel, so drop the "panel"
naming and refer to the next bridge instead. Update the error message
printed when no output port is connected.

While at it, convert the device_node handling in fsl_ldb_probe() to use
the __free(device_node) cleanup helper. Since remote1 and remote2 now
stay valid until the function returns, pass the selected one directly to
of_drm_find_and_get_bridge() and drop the extra panel_node reference.
Do the same for the dual-link port1/port2 lookups.

No functional change intended, other than the updated error message.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index e5eb4e6a24a4f..1077ef946430a 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -305,8 +305,6 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
-	struct device_node *remote1, *remote2;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -329,19 +327,16 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_ldb->regmap))
 		return PTR_ERR(fsl_ldb->regmap);
 
-	/* Locate the remote ports and the panel node */
-	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
-	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
+	/* Locate the remote ports */
+	struct device_node *remote1 __free(device_node) =
+				of_graph_get_remote_node(dev->of_node, 1, 0);
+	struct device_node *remote2 __free(device_node) =
+				of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
-	of_node_put(remote1);
-	of_node_put(remote2);
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
-		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
+		return dev_err_probe(dev, -ENXIO, "No next bridge node found\n");
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
@@ -350,19 +345,17 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (of_property_present(dev->of_node, "nxp,enable-termination-resistor"))
 		fsl_ldb->use_termination_resistor = true;
 
-	fsl_ldb->bridge.next_bridge = of_drm_find_and_get_bridge(panel_node);
-	of_node_put(panel_node);
+	fsl_ldb->bridge.next_bridge = of_drm_find_and_get_bridge(remote1 ?: remote2);
 	if (!fsl_ldb->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
-		struct device_node *port1, *port2;
+		struct device_node *port1 __free(device_node) =
+				of_graph_get_port_by_id(dev->of_node, 1);
+		struct device_node *port2 __free(device_node) =
+				of_graph_get_port_by_id(dev->of_node, 2);
 
-		port1 = of_graph_get_port_by_id(dev->of_node, 1);
-		port2 = of_graph_get_port_by_id(dev->of_node, 2);
 		dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
-		of_node_put(port1);
-		of_node_put(port2);
 
 		if (dual_link < 0)
 			return dev_err_probe(dev, dual_link,
-- 
2.53.0

