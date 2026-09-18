Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E291939CD14
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741177; cv=fail; b=aRjTAagYVIOMSAjqX/WgFiCoxqV0QPlrfhmTfdo6XfuoPgp6rXYyXdxQZ6y0L/yXn0z3BWi9jkjN/+juFZmzgjD4TxFcWfwyGlLY3tR9rxckYXaCwLpJQD49TNg6pA8bqjDFIIe4k2TCUR46mgKWRWMqgba7rXNLxFvmdhvFJVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741177; c=relaxed/simple;
	bh=ZwYiU6wEO72eQvglfObc6cAvR3MfnvDhPKjrqXrjR1s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y3FXzM2jPewTAo+XMZEf5v46AsBIPghkRG3NresiBVL8RrYg0Xiw3shm3RfQ5lVmxdN4VlxgYtjBWMAw0zG/Qrf+xZ1s0IsaPqflser5fTilsQJ0kvO8qHlgQmBbcZiZTaMCDPLcWP+CnLlWs32vo7bt7If+AO/sHEcc2X9CyT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IZ+jQ3j3; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IZ+jQ3j3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbJ0tw3gy6PPtyB8w1ImLyRfLeH/mjElTwxIFBOBzAuxGr7isojUuxxA2TNgLJONbD2LLh/805b2wfIuyiA/jH1QE6F7sZUPMfTOwVvbd+V4q6Gt837G8toi68XwUq2kqtQRI5upmugnHgWbEznXujMu33LcAlowrRTtdyHIZtQtVszgeW0o+HS56eAjrF5ynztm9dmN2C3Ak9ren/Hjd595T0nnvhkK6nO3FhVVz9AX8dwMgZCVO7NZ0/HKA2AQVJ67Pw4hemcgJVJp9X0EAO9362vEEbfD8V1iKK4dBfvwVzLHUcYroyDeKDJ2ZurBtnVe6MSq+GS/hE625uolHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRu9FZb3bNhSorjKpph8ZmBdEj2a2Yjqkb3kopQMufM=;
 b=rhauyTgCBgcO6X6+kJHt/nJo2q+HJaZ263OAD70NbCDxXPFwqH0CIC2T14+ssRw68///WFfhyy6KfVjapuvz/WlAFWCwjH7wk+VayoRm0HjRyfKfYiQb+Rhk8j0nt+rFCwO0f4E6GFTFV/8bcGSWa4ytFNTWQnN787X6dYeN9tKsS5womlfxtBEbPOADgXU6ANsXZnao85fyPw7DLZpyF+E4oS33rGwRdNLEsTVp+REOJpyfizMQdhso4NV/lhG/kr1x8VIRT3fWKny7INblywy7qP/ROn+t47YICDLEHt6JKkOGFVP7YrXDXOAKmh+4zho30cqKN7E8j1FETc5nNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRu9FZb3bNhSorjKpph8ZmBdEj2a2Yjqkb3kopQMufM=;
 b=IZ+jQ3j3cOvqH1MKJsVxitulkJv39Hp4uvQGl9nT0Gh7y31ZbKzWWYDuOyIMlAIHKAEZECti6wO+6dEmizsZSgfuwVhlg9E7oVD4hnAwHX0pazKlD6o/Z7YAK3pSq70djsjW50Fu9P2Sf5aRLOsfXwowgA+ppZSgDXVIMYhNGGEJbPqVpWu+Al2JBL1tM30v9iAQz8cvoOTbbPFwN1JcQT+C3bNStbvsakH41BhO3cybJ/8+XlBtoom33u9t76mn6GJ+kpWr1pG0YnBhWQ4U3uHSy74XFC14tYitqw8gD8Y5yuBDgwQrqJ3+ZTAxoNG+8S4juv1blcMZ6kFnLX4hlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by ZR6PR04MB296659.eurprd04.prod.outlook.com (2603:10a6:910:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:19:33 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:19:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Johan Hovold <johan@kernel.org>,
	Joe Simmons-Talbott <joest@redhat.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kees Cook <kees@kernel.org>,
	Ma Ke <make24@iscas.ac.cn>,
	Dan Carpenter <error27@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpib: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:16:29 +0800
Message-ID: <20260918141702.3022906-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|ZR6PR04MB296659:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a67681-d306-487c-28f9-08df158fdc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|19092799006|1800799024|56012099006|10067099003|11063799006|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	6ewbncsbNvcKb4aPIwGWRbFubkNedIeIaMjc4YW9IqgLeRYfE2VRdLwwwsG4igX2rIOreiUkr2NaLPglBebfhZb/wv0GXtcnHzDW6diEIzbUbKhK/Lse1UHaieW9iTuw9+7ipdXux/nWFj/mF+Br8uqRMkaEtvqprrhUfk+WsMMm2jQczwuAPhnXiqU2KNWvwvdrRJQcbGXxMSgeNpDJOOp25hMgbPOYWoKDzOTbRuJLH2XBQnXg3ccwfS0olUXBXZma2C2Wm5/8lez016zBL6EpUi5gU5+k4alUJX3sKVGC1LhAvz6992fTVqcjNPc9d64HG+AgTvnBJiMMCGnWrua50s3jO+pPg89G5BF7afavx4T/LqhO8/B6P9xQZUMvr+38WUpOT/qX4lWknXCjL0Z4uQ/8KuKjHTvTAGHkHDom8vLMud4U+g5/AoIv9XVEGqjPbdjN4X06AXoGLkYDxW1neKozBNWsDdrmCaiczahPHtgaoK+v+5/IPzh/mgOnFamAcUVNI8FqGsmowixici1E9mbCzGVrA3Q9XMGUZYPPRd32lR2sFY6A9tgzijSul/ZeGR7oIgLl+is2gX/rJaEI9IXInJi5+L7GDKE/A3pk5zSTCwCFlAb31rRSnnDvn/mtq4AjJx6MJ8CqAGatoQ5LmJUFhAimN9+m6ZepswILMDpCA2kkmsMMGSlEp9iNRneEGBQJ5DQKSGOyhnLrcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099006)(10067099003)(11063799006)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GTmHZcL7J4gh64GVET9qusI5BZbRFtyoBjW/GfRa9BcCesybGXwJ+pqb6CBj?=
 =?us-ascii?Q?kqpjE+E6xpz6U1fxfIF48AEAkWTIs6tmhMQO1cjcrV9FNFHIrauJzKhxmqTe?=
 =?us-ascii?Q?Bzk5yiJPnJAd8ULGymxeOuWfiZv0wZ9oVdfGmYZAhoUmMZgVqvPC1w/EivzL?=
 =?us-ascii?Q?Gyq0SY0RYNMKyHVsFKGqrJPWukOY2RnHhz9JzZvLBujoQ2o63tzo0h5aFm5r?=
 =?us-ascii?Q?qLJutrhCqJFYGDTFqTKwbpppvhL/FbhYZFoIMH3KTPA4ulaUkX9bS3B6KXdN?=
 =?us-ascii?Q?hXpOaHQr08B7GpbsduLGH5Ixd6i5AajeeQDkZsp5jwcUA+t+fOHFhBcC61oy?=
 =?us-ascii?Q?M3Zv88JZoSVwGVJL9h+kK5zP0mZwGZ7lYHlVgFf1pzaa9vx0VRSMtRpY0Rln?=
 =?us-ascii?Q?x4gXKPCwJbZ3fwh0ZA4+OyNODIX39FLtXP3y7YSBuDCQP+IVEwsB1ha51iPU?=
 =?us-ascii?Q?w9nQ2OhzcJmZ3I1SH82OP1360VVdjNQd3mPqhBGysPp4XlOq/0YcGTVdv489?=
 =?us-ascii?Q?6HVtmV5I8QZCMvBcq4wHos/KC+4DtRI70eaLQpvwK3/5tlNswMabDJs4lp/b?=
 =?us-ascii?Q?PHZL54oleLWIshDpNL65lNlykPPjRTOpic7fhXlNMyD5QiEoszRS3dqhITx2?=
 =?us-ascii?Q?05+0MU3sF46FKHPJPcI2mxN+xT0dOjI+XIZnw7aChPo/FqXFPcps2DRKfAto?=
 =?us-ascii?Q?Dce3FxWdnAVXqHL13vJeQYHt000AY9Nysv3spI1qw9jFAdTfxk//GJt5H5+A?=
 =?us-ascii?Q?TwCCcUI1kA6fTMpj9c4WdNC+OCTHLz1v8xE1M1QZIMCFNc5nDOPPgfc6nwtt?=
 =?us-ascii?Q?CmTlc4nMLBiZUens3Hvi98mTQlXamciJS2xfhTiQKWNsDRZQlFp9cy5mrytv?=
 =?us-ascii?Q?V84eaAilOBqGc1fX3z2Hr82EXLhulfd0oP2hWZgUIdIVTBEoNkFirZXCAbvc?=
 =?us-ascii?Q?610pJp3yi4Kq5xYjPoPuPZ5Isswq9Gr0D5Dpq1qGawjmhav90RsYiBXKd202?=
 =?us-ascii?Q?SUyfDWLnyuIFUWMahgs+65TD+RtdmJyuPpasU9/3LvPUq2BjjoYSj6KiHvrW?=
 =?us-ascii?Q?576irqppkwfVbLROhrmwZmJOXpFCxh29rq7UqNVDeuhdu6YHhXiN7D3X8Onn?=
 =?us-ascii?Q?/sZE7IQzt3EfAO5pCPRHIkDE+1QAvlz9ZA7PCVlrvhrwkWeoGW0E5Vc9cSMk?=
 =?us-ascii?Q?0JglM2e1E04Mb/seHGM1TFdFvCe8f9ra1J2GJhACWJrQlgH8OUhtMUHcRxzP?=
 =?us-ascii?Q?GTnHFmD6KOQUDMWrKyD2IDEX52c2Fo72ApCymrWsfs297g2s/qZbK9GKH71V?=
 =?us-ascii?Q?Q6aYbUPhXYxVOXGQKBVv1kMGzt1gU84vvXweLHr+p2INvYgJzaWi+vokSxxt?=
 =?us-ascii?Q?/ya1bWXzFLs7TseJ5N1CL5QXcfc06L1a6uu8n1GMCQX6hTysmaeq3TxK4s79?=
 =?us-ascii?Q?Rx0sa/dV/pR0nyvQ6CTh8du8hxvlYNzhirpbeONfvd5m7QyDFkcXxvTeMueO?=
 =?us-ascii?Q?F+4SwY3pxRGpyf62bRz4bBtfdVV1QAW8ri5aQQrjygjF9nyeCY+aD4qgDCBJ?=
 =?us-ascii?Q?RBLxKXH7rpyEqqEvLGbo8NoyAm+tmIIPEqgDoeJhRjB7w+lkpCns0C0DRvK9?=
 =?us-ascii?Q?bh9AmAEPoqJVQAwoPFD0+YCz8OeP3jqvEDRTWZYz4htVfcZsvNNzxqemPzZ3?=
 =?us-ascii?Q?P+a28d1M7a4scbutlBf8CLKYV6DCmAlg4ts+wmpKebrqCFFxknH2B014bZz5?=
 =?us-ascii?Q?J17kst//OhBHkhr2cf0ashqr68XO+qh6aM5CBlI9FT774lBs56Rj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a67681-d306-487c-28f9-08df158fdc21
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:19:32.9305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyJ4xUQd473tcD7kV9T9wD5Y1CidkR++ZULmV7Qs3IxVyxWLgoFKUcGmatljmqkDWJ55WLEJ3Nwqg4otHNBZqnpwcWStFFQBeRtSLpRIEjbVmbMgpEEw3e3TTE/dNHZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB296659

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit and their
non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
API.

Done with Coccinelle semantic patch and manual fixups.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpib/agilent_82357a/agilent_82357a.c | 35 ++++----------------
 drivers/gpib/eastwood/fluke_gpib.c           |  6 ++--
 drivers/gpib/fmh_gpib/fmh_gpib.c             | 30 ++++++-----------
 drivers/gpib/gpio/gpib_bitbang.c             | 24 ++++----------
 drivers/gpib/nec7210/nec7210.c               | 33 +++++-------------
 drivers/gpib/tms9914/tms9914.c               | 27 ++++-----------
 drivers/gpib/tnt4882/tnt4882_gpib.c          |  5 +--
 7 files changed, 42 insertions(+), 118 deletions(-)

diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.c b/drivers/gpib/agilent_82357a/agilent_82357a.c
index 2468a471d175..6346d98fcfb2 100644
--- a/drivers/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/gpib/agilent_82357a/agilent_82357a.c
@@ -865,10 +865,7 @@ static unsigned int agilent_82357a_update_status(struct gpib_board *board,
 		return -ENODEV;
 	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	board->status &= ~clear_mask;
-	if (a_priv->is_cic)
-		set_bit(CIC_NUM, &board->status);
-	else
-		clear_bit(CIC_NUM, &board->status);
+	assign_bit(CIC_NUM, &board->status, a_priv->is_cic);
 	address_status.address = ADSR;
 	retval = agilent_82357a_read_registers(a_priv, &address_status, 1, 0);
 	if (retval) {
@@ -877,29 +874,14 @@ static unsigned int agilent_82357a_update_status(struct gpib_board *board,
 		return board->status;
 	}
 	// check for remote/local
-	if (address_status.value & HR_REM)
-		set_bit(REM_NUM, &board->status);
-	else
-		clear_bit(REM_NUM, &board->status);
+	assign_bit(REM_NUM, &board->status, address_status.value & HR_REM);
 	// check for lockout
-	if (address_status.value & HR_LLO)
-		set_bit(LOK_NUM, &board->status);
-	else
-		clear_bit(LOK_NUM, &board->status);
+	assign_bit(LOK_NUM, &board->status, address_status.value & HR_LLO);
 	// check for ATN
-	if (address_status.value & HR_ATN)
-		set_bit(ATN_NUM, &board->status);
-	else
-		clear_bit(ATN_NUM, &board->status);
+	assign_bit(ATN_NUM, &board->status, address_status.value & HR_ATN);
 	// check for talker/listener addressed
-	if (address_status.value & HR_TA)
-		set_bit(TACS_NUM, &board->status);
-	else
-		clear_bit(TACS_NUM, &board->status);
-	if (address_status.value & HR_LA)
-		set_bit(LACS_NUM, &board->status);
-	else
-		clear_bit(LACS_NUM, &board->status);
+	assign_bit(TACS_NUM, &board->status, address_status.value & HR_TA);
+	assign_bit(LACS_NUM, &board->status, address_status.value & HR_LA);
 
 	bus_status.address = BSR;
 	retval = agilent_82357a_read_registers(a_priv, &bus_status, 1, 0);
@@ -908,10 +890,7 @@ static unsigned int agilent_82357a_update_status(struct gpib_board *board,
 			dev_err(&usb_dev->dev, "read_registers() returned error\n");
 		return board->status;
 	}
-	if (bus_status.value & BSR_SRQ_BIT)
-		set_bit(SRQI_NUM, &board->status);
-	else
-		clear_bit(SRQI_NUM, &board->status);
+	assign_bit(SRQI_NUM, &board->status, bus_status.value & BSR_SRQ_BIT);
 
 	return board->status;
 }
diff --git a/drivers/gpib/eastwood/fluke_gpib.c b/drivers/gpib/eastwood/fluke_gpib.c
index 1363f0a1f570..a868def73d5f 100644
--- a/drivers/gpib/eastwood/fluke_gpib.c
+++ b/drivers/gpib/eastwood/fluke_gpib.c
@@ -824,10 +824,8 @@ irqreturn_t fluke_gpib_internal_interrupt(struct gpib_board *board)
 		retval = IRQ_HANDLED;
 
 	if (read_byte(nec_priv, ADR0) & DATA_IN_STATUS)	{
-		if (test_bit(RFD_HOLDOFF_BN, &nec_priv->state))
-			set_bit(READ_READY_BN, &nec_priv->state);
-		else
-			clear_bit(READ_READY_BN, &nec_priv->state);
+		assign_bit(READ_READY_BN, &nec_priv->state,
+			   test_bit(RFD_HOLDOFF_BN, &nec_priv->state));
 	}
 
 	if (retval == IRQ_HANDLED)
diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
index 5e10e9353fed..640cfed84a40 100644
--- a/drivers/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
@@ -1165,25 +1165,17 @@ irqreturn_t fmh_gpib_internal_interrupt(struct gpib_board *board)
 
 	ext_status_1 = read_byte(nec_priv, EXT_STATUS_1_REG);
 
-	if (ext_status_1 & DATA_IN_STATUS_BIT)
-		set_bit(READ_READY_BN, &nec_priv->state);
-	else
-		clear_bit(READ_READY_BN, &nec_priv->state);
-
-	if (ext_status_1 & DATA_OUT_STATUS_BIT)
-		set_bit(WRITE_READY_BN, &nec_priv->state);
-	else
-		clear_bit(WRITE_READY_BN, &nec_priv->state);
-
-	if (ext_status_1 & COMMAND_OUT_STATUS_BIT)
-		set_bit(COMMAND_READY_BN, &nec_priv->state);
-	else
-		clear_bit(COMMAND_READY_BN, &nec_priv->state);
-
-	if (ext_status_1 & RFD_HOLDOFF_STATUS_BIT)
-		set_bit(RFD_HOLDOFF_BN, &nec_priv->state);
-	else
-		clear_bit(RFD_HOLDOFF_BN, &nec_priv->state);
+	assign_bit(READ_READY_BN, &nec_priv->state,
+		   ext_status_1 & DATA_IN_STATUS_BIT);
+
+	assign_bit(WRITE_READY_BN, &nec_priv->state,
+		   ext_status_1 & DATA_OUT_STATUS_BIT);
+
+	assign_bit(COMMAND_READY_BN, &nec_priv->state,
+		   ext_status_1 & COMMAND_OUT_STATUS_BIT);
+
+	assign_bit(RFD_HOLDOFF_BN, &nec_priv->state,
+		   ext_status_1 & RFD_HOLDOFF_STATUS_BIT);
 
 	if (ext_status_1 & END_STATUS_BIT) {
 		/*
diff --git a/drivers/gpib/gpio/gpib_bitbang.c b/drivers/gpib/gpio/gpib_bitbang.c
index 34d14b94a0b8..933bf8dd7207 100644
--- a/drivers/gpib/gpio/gpib_bitbang.c
+++ b/drivers/gpib/gpio/gpib_bitbang.c
@@ -949,25 +949,13 @@ static unsigned int bb_update_status(struct gpib_board *board, unsigned int clea
 
 	board->status &= ~clear_mask;
 
-	if (gpiod_get_value(SRQ))	       /* SRQ asserted low */
-		clear_bit(SRQI_NUM, &board->status);
-	else
-		set_bit(SRQI_NUM, &board->status);
-	if (gpiod_get_value(_ATN))			/* ATN asserted low */
-		clear_bit(ATN_NUM, &board->status);
-	else
-		set_bit(ATN_NUM, &board->status);
-	if (priv->talker_state == talker_active ||
-	    priv->talker_state == talker_addressed)
-		set_bit(TACS_NUM, &board->status);
-	else
-		clear_bit(TACS_NUM, &board->status);
+	assign_bit(SRQI_NUM, &board->status, !gpiod_get_value(SRQ));
+	assign_bit(ATN_NUM, &board->status, !gpiod_get_value(_ATN));
+	assign_bit(TACS_NUM, &board->status,
+		   priv->talker_state == talker_active || priv->talker_state == talker_addressed);
 
-	if (priv->listener_state == listener_active ||
-	    priv->listener_state == listener_addressed)
-		set_bit(LACS_NUM, &board->status);
-	else
-		clear_bit(LACS_NUM, &board->status);
+	assign_bit(LACS_NUM, &board->status,
+		   priv->listener_state == listener_active || priv->listener_state == listener_addressed);
 
 	dbg_printk(2, "0x%lx mask 0x%x\n", board->status, clear_mask);
 
diff --git a/drivers/gpib/nec7210/nec7210.c b/drivers/gpib/nec7210/nec7210.c
index f15d38dfa4cc..d9d99a2469a3 100644
--- a/drivers/gpib/nec7210/nec7210.c
+++ b/drivers/gpib/nec7210/nec7210.c
@@ -177,26 +177,15 @@ unsigned int nec7210_update_status_nolock(struct gpib_board *board, struct nec72
 		return 0;
 
 	address_status_bits = read_byte(priv, ADSR);
-	if (address_status_bits & HR_CIC)
-		set_bit(CIC_NUM, &board->status);
-	else
-		clear_bit(CIC_NUM, &board->status);
+	assign_bit(CIC_NUM, &board->status, address_status_bits & HR_CIC);
 	// check for talker/listener addressed
 	update_talker_state(priv, address_status_bits);
-	if (priv->talker_state == talker_active || priv->talker_state == talker_addressed)
-		set_bit(TACS_NUM, &board->status);
-	else
-		clear_bit(TACS_NUM, &board->status);
+	assign_bit(TACS_NUM, &board->status,
+		   priv->talker_state == talker_active || priv->talker_state == talker_addressed);
 	update_listener_state(priv, address_status_bits);
-	if (priv->listener_state == listener_active ||
-	    priv->listener_state == listener_addressed)
-		set_bit(LACS_NUM, &board->status);
-	else
-		clear_bit(LACS_NUM, &board->status);
-	if (address_status_bits & HR_NATN)
-		clear_bit(ATN_NUM, &board->status);
-	else
-		set_bit(ATN_NUM, &board->status);
+	assign_bit(LACS_NUM, &board->status,
+		   priv->listener_state == listener_active || priv->listener_state == listener_addressed);
+	assign_bit(ATN_NUM, &board->status, !(address_status_bits & HR_NATN));
 	spoll_status = nec7210_serial_poll_status(board, priv);
 	if (priv->srq_pending && (spoll_status & request_service_bit) == 0) {
 		priv->srq_pending = 0;
@@ -861,18 +850,12 @@ irqreturn_t nec7210_interrupt_have_status(struct gpib_board *board,
 
 	// change in lockout status
 	if (status2 & HR_LOKC) {
-		if (status2 & HR_LOK)
-			set_bit(LOK_NUM, &board->status);
-		else
-			clear_bit(LOK_NUM, &board->status);
+		assign_bit(LOK_NUM, &board->status, status2 & HR_LOK);
 	}
 
 	// change in remote status
 	if (status2 & HR_REMC) {
-		if (status2 & HR_REM)
-			set_bit(REM_NUM, &board->status);
-		else
-			clear_bit(REM_NUM, &board->status);
+		assign_bit(REM_NUM, &board->status, status2 & HR_REM);
 	}
 
 	// record reception of END
diff --git a/drivers/gpib/tms9914/tms9914.c b/drivers/gpib/tms9914/tms9914.c
index 1411297e6217..1e658e6f5e00 100644
--- a/drivers/gpib/tms9914/tms9914.c
+++ b/drivers/gpib/tms9914/tms9914.c
@@ -356,32 +356,19 @@ static unsigned int update_status_nolock(struct gpib_board *board, struct tms991
 	address_status = read_byte(priv, ADSR);
 
 	// check for remote/local
-	if (address_status & HR_REM)
-		set_bit(REM_NUM, &board->status);
-	else
-		clear_bit(REM_NUM, &board->status);
+	assign_bit(REM_NUM, &board->status, address_status & HR_REM);
 	// check for lockout
-	if (address_status & HR_LLO)
-		set_bit(LOK_NUM, &board->status);
-	else
-		clear_bit(LOK_NUM, &board->status);
+	assign_bit(LOK_NUM, &board->status, address_status & HR_LLO);
 	// check for ATN
-	if (address_status & HR_ATN)
-		set_bit(ATN_NUM, &board->status);
-	else
-		clear_bit(ATN_NUM, &board->status);
+	assign_bit(ATN_NUM, &board->status, address_status & HR_ATN);
 	// check for talker/listener addressed
 	update_talker_state(priv, address_status);
-	if (priv->talker_state == talker_active || priv->talker_state == talker_addressed)
-		set_bit(TACS_NUM, &board->status);
-	else
-		clear_bit(TACS_NUM, &board->status);
+	assign_bit(TACS_NUM, &board->status,
+		   priv->talker_state == talker_active || priv->talker_state == talker_addressed);
 
 	update_listener_state(priv, address_status);
-	if (priv->listener_state == listener_active || priv->listener_state == listener_addressed)
-		set_bit(LACS_NUM, &board->status);
-	else
-		clear_bit(LACS_NUM, &board->status);
+	assign_bit(LACS_NUM, &board->status,
+		   priv->listener_state == listener_active || priv->listener_state == listener_addressed);
 	// Check for SRQI - not reset elsewhere except in autospoll
 	if (board->status & SRQI) {
 		bsr_bits = read_byte(priv, BSR);
diff --git a/drivers/gpib/tnt4882/tnt4882_gpib.c b/drivers/gpib/tnt4882/tnt4882_gpib.c
index 3cd13f637ed4..f40a7977af1c 100644
--- a/drivers/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/gpib/tnt4882/tnt4882_gpib.c
@@ -701,10 +701,7 @@ static unsigned int tnt4882_update_status(struct gpib_board *board, unsigned int
 	nec7210_update_status_nolock(board, &priv->nec7210_priv);
 	/* set / clear SRQ state since it is not cleared by interrupt */
 	line_status = tnt_readb(priv, BSR);
-	if (line_status & BCSR_SRQ_BIT)
-		set_bit(SRQI_NUM, &board->status);
-	else
-		clear_bit(SRQI_NUM, &board->status);
+	assign_bit(SRQI_NUM, &board->status, line_status & BCSR_SRQ_BIT);
 	spin_unlock_irqrestore(&board->spinlock, flags);
 	return board->status;
 }
-- 
2.51.0

