Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794001305;
	b=ecDHyspuGu+3Id9SBUOK6XopopN3kD1olUPPqLX0DrO+jpKqkGUlRUE9eqtNCrpkwMG4
	 YVzYbjkqak9BSTPfkKjY7DFlGtzSxVtI/hLVIu9jBPYfsFntyJpA3Vsh936BPFizCVTXx
	 MOqjANao1ZTLfsmqZraV+OUy+psvAAlPAd01PwuzcjGpCVHbkX2voQ2hzddYMuUKacOtu
	 mcxyXbSTstvLFVZk1//GpCSTfE4I/BrQwuJpT2hr/9KcklsoyDUiJa8peXwbzScUiIeVl
	 Sw1r39dS15v0JHEDljq8boXf5NcaCd4wL2wgHdFZh6yyhj9/cFT7Wi7SxF4MPFL2Z9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001305;
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
	bh=8N9lrQmdH9TJEi89yEj0VetBUOAEnwvVBAMls1vdLM8=;
	b=N3b7tOE+j0pBkX3bOzXTDxBIiQtbQiOdss2Qw+Ho0SVGv0qmKLbX4J81aege6FN8RE6A
	 vbMNxURKBigxf1FXTCU3e72lxISGaUjGrrhdqfut1AoapDeRf46Tl1xlcp7eA2woVGl9a
	 DutZUt3WDb/JfK8emffiBsLdiUyGXj6DA+EJ0h7rHdWiuBlK86uvLGojQ6daJA8Os+lrL
	 9pFi16FCsechMdZlGyWBVKb9wOLJaepbqZrs0h23a1mKxaN57arZOGpE4x4IsWcQCBA2C
	 LsoF484qEE7Cn+MF/uQkXBTXgyxIwNL+E6NujdEhMraMsEBV/an7V9jWk11GYGUfrpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Bn0Tc5yA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.22
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736B7606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Bn0Tc5yA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtpXAvduZ6BDfWkK+CRYH5LCCaMbzJsu4IOw0XELIzc32twDfVKbupCcvf3W7SW1TPVYLs+Uy/hPP0WKxjehOAgDfT0AW4vQ69eAgXAwtJvW4cMNuHIK/P/YKdq/6UqvI7db5a4llR7GBmSqLgV9Lp4K4l5Zz9dQopnXwOYAk9TXQgaS23Ok+sdN0Kpd1NeA/TwCNCRsAybGNcqX1XictNh++CmRLS0gJ2IebzGn9BNHVCejx4t3zTRQMpEWJiv2FM+OUlk/8NveYfG3Xp/Hze5czHrzX96e7M9XO0dKX97gz+fJsRs9LmzmS/mtkee3c3PJAoetVqvIYIEspqsU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8N9lrQmdH9TJEi89yEj0VetBUOAEnwvVBAMls1vdLM8=;
 b=og4hE9/ynXFmHmlfiBVjIdYDO8g1IrWUAwO0Oa1j0986tY422caS7zn+Rte2PEwp/fAO/zB2yKh66IXGSakHkOT5CDBeFzzscuEH8s00/oeQ2T7P50Ng5dMkh7kY+72w5R51DYwSBi4U2vw8EjB8KKximMWq5+vudp/GIOs72Kf0wMPzYPml2liblHNslPz1KIznEMumhUqEVQZZzmiJh+pcPGhL+3yiUlxq6+8ROoX6T8qA4rtspl/7F+7OwIpwlClLjvx0dUMfauOWhA6Jte5um3pm+YtVAVaJX4/DQLzqwH7qJdfFE15UTBsFbFewj4oCM+ZUj/GaznN3cPdc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N9lrQmdH9TJEi89yEj0VetBUOAEnwvVBAMls1vdLM8=;
 b=Bn0Tc5yAjH6/Hs6Vsga/MVv7aX8KtE5NG7E0tHjp79+JsJwuWsHaz+XpfRcqa40QGxxky8oj1lRXxx9K801vSd0n4dA9XnxABnj0Hx4l73UXecxQOmkW+E0h0AwjtyrJEgjyOp3MWt3eh/qkd/WpG521sYxSSa9fO0ITJKQ/2wH4jtAf1iqmIg5TYBvJoNESbnT1Xx8kxDHGlkBPiSKtsGvKAwbPMWCKXZdvMIgK1UMWMkJn3YQqQB4SPP2jsk7/U5A+GHWcQeCjFeSv/2o+uopL0mgXCO6HeMBvaSKDo9Jegh0NOQ2+zXvjfLFtI5tUnmcEfToS9y1AABsaYS3+Qg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 21:41:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 21:41:41 +0000
From: Frank.Li@oss.nxp.com
To: Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] rapidio/tsi721: move dma_device from rio_mport to tsi721_device
Date: Fri,  6 Nov 2026 16:41:21 -0500
Message-ID: <20261106214132.4172049-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS1P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::6)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cae035-09c9-4a52-5f8d-08df3c4ebe88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261009221227099003|261102123227099003|261028144727099003|261026140227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RVARVYZpYNicRpuBde3rTw4tUbvRgVnJpZ/oqvXQqgMUipnDN42dFpJR8RyYjHRVJc18IjYAy+VzVPrixlRvDkYerO8f6XLtszIT04x70IYAvQeoER+YYC7c63DPgHJGrxoHBrnVq8f6QgaJTgv+SNqfYvFgstGKzSDfNStDDUnSvsV0dWEuk2cBo2PU6jXi+MSC//6s/whrIVlyYi6iIWQH4NAVoGe0jHDPcCqjgbGV2IDkp+s8vGE5fhZixi7/qoYiwjihP1+ekn0KzFiqMnh162eACFLs810/Ey5Zq5NGXjO+L4ye1w7tOGdfYGdf2tSfgJB3ftdGKMpX3N1pvgv4Qm9+zyhQP6ucXQZBDRHQZdwaId/jn8su8AY3fReB6+DSLUctko1SxvJ1PFPWPFX5pOohjiPbvrp+0pNiOWDJNx3KbIdM3yo4p0KHVRxH6zZ7tUHB+WMOly53003X1SQHv8iDq6isnCHPLqDD2I0ntkdEir+Y5klHXwBAfaqyNoJDsIDUSfyJYAevJejvuBFbCCpL3u5b2ojcjnllKZvOQ2Aq5UVfyeoTfa2Uj4NDThgUlXyjCovEXtS8Z4UM+dGzFcPZKXa2KazrAfdoY7kSfaKjPyMs2gaCf1BnfYqVK/Xg1nBKwpuQ62i+GbyZMww090kQc5/sT8qlP6YE5xE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261009221227099003)(261102123227099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vetU5mDaAH5lWvuUvOZa9CoQjzdo3TmswB6+IMwktKLZyxWqjvdudVswm2g2?=
 =?us-ascii?Q?eXj1riK25U32o6Od5ZZ8POtjL5m0aDc7o5mXBfOFsUNBq7BVOpHfgu0XVuOo?=
 =?us-ascii?Q?MMby5a2e9g0Wkn5ym8QM5Oj7wE8fYKjmH+GAdizcQbr5hkGXoLmtNI6LWXsp?=
 =?us-ascii?Q?7jawPmafnXnvsa/ImZWbpo3fhpj/bCfOEUss3ar48YPGwz2+Ga0X94l8naP8?=
 =?us-ascii?Q?EzJJgI+Iph7Zf5PhnNGPLMucIH0U/9cf0gG8OuUwLWx/mzAkUTE3FjS0EF23?=
 =?us-ascii?Q?1xiOX8j3rkPPysYGI9E/faVjh1c5Vv/wAcYFnOoza6L/e/6LEWLvFFdi1tG1?=
 =?us-ascii?Q?UbS8jiMDXReiBQp7WQlLjOayyfIk9c61mRc6mcn+obeLdAtwcrDbtmsjWtYY?=
 =?us-ascii?Q?1lYC3pqKbUwsGIdVSdlWJSTyxBG38c5E8/zkPuoHq5octI5ScSow0B/aa/NZ?=
 =?us-ascii?Q?QERhxugqg86n9pbvytFUGoVIR/3q8/WYLwh5MOTdjdXwWCNf/qERN8jI9qDL?=
 =?us-ascii?Q?3AbIO6g3ZwJ6TEDEoiHUcOmj5sfweEHJW4usegH+cPtXPbn8TozqYlemLDN7?=
 =?us-ascii?Q?9SCNGQC001WI1wmzIwro55xpxw8zphlXR0aO8hQRi9pArSxiOpUUkBIo7b+8?=
 =?us-ascii?Q?falhC11kVYhKltpnJhi8hO5CHlhLIqRcs9j2yddZN90OGShkClnPPTS7ni9Z?=
 =?us-ascii?Q?aeL2vDnGnHhgNSEtGtFPcV1HJjAHoEjQIj89HoRGDkoG97ShUBUwvn7oMSNP?=
 =?us-ascii?Q?03bc/z83EP38m67U8LenzSw0RZCF1gY8Tt//kx92BwZSnI9deJioYXUir0T+?=
 =?us-ascii?Q?nJ20XJNag1IqBWXNEOfG7oEuq9NSJ0uQqF4ATpFMx4iS0q8fJr0QrlraPaqN?=
 =?us-ascii?Q?diIatBWK4bDtnhUhyWCybhQy9ss5yGO/+uuCx544mLFwoBFKuD+MOj588la8?=
 =?us-ascii?Q?UAx8rdwt7VdSqEzg/5w6R+VBtb2zAKeowdJT41D6CxMo3RE7y30yoOO280iq?=
 =?us-ascii?Q?Xv3QPfoAsTz5PhJEjplTcZeWrb2lXmQY2Sg4uT4RFdwYcIbXRLPX2LGCbVwZ?=
 =?us-ascii?Q?qTjDY7Er9WdGsIjRBvFfk7Luj2VxBNwyYnQEizcOpaacgP9jPYZ24XsDWJf/?=
 =?us-ascii?Q?PgUkVDJkmw7e+EpJq/eSsT7m7khS9XcxDSHqxkfZ7eWaXsLsR4ER4B76xOgb?=
 =?us-ascii?Q?4W3BvwttC+DYVP1PGVL+GWShZBiyrIWUhJpuYFxpRzvrAK5rBJg1zcXhi82k?=
 =?us-ascii?Q?6DZY6RLoEERnHcGXYS3vcDF1suMwH843bP77K6LO6HUEGOMZFYXHSbnlnXqi?=
 =?us-ascii?Q?mcvUZrRMZB+7FEG0ZxJ7arGFslsbITiEklaCXRjYd0tv0bZwT4tsDY61FkZc?=
 =?us-ascii?Q?Bq6WY8CO+KE0LoToZCcnlICz9ttREuUFPsF5mx1O+QTRz1g/4+dR3YwMpx08?=
 =?us-ascii?Q?zI/KNPD+EXuuJGUIk5swRlOBb/128MxdM6DblR1yONaEUtYa93/9WQ/WSgae?=
 =?us-ascii?Q?U6igK4OH0/RdR+IYO4NMW6UqA+JWbZTeNJAa4R9bGK3aR3+VUbcxHaxd/bKf?=
 =?us-ascii?Q?M6iqOCKL3shBPF7wEfvoCVNUK1UEY/sresHMRSE2jLeOanAGHZST6xg+eNZx?=
 =?us-ascii?Q?FJrY8bd2NiFhVNUJNp7eEKzF13DNyaN0f242tjHehSvus2mzgqPtCWks2cAF?=
 =?us-ascii?Q?o9Ff6LhfZKiIvK6YKsM6pLbj4KhuxyrrtEGK3MxkSUpNQZ0U6riCcRA1WVgm?=
 =?us-ascii?Q?RQCtYahXtuEmQn2xMV5ZZnxm7hnvcG0hfUpGj+14tvzbBQ5otGkL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cae035-09c9-4a52-5f8d-08df3c4ebe88
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 21:41:41.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8UhkWMoTO1m30iqemJD8wpIlDqtpyzDo5gT1naFT1ItMGmyyElv0DbrG8rTtf740/mkHD2/bP9+nh5kK9UjQiDMpbciwhg2oVVTKMNunFafY2SqWS4A33FrsCraAfb0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7586

From: Frank Li <Frank.Li@nxp.com>

The embedded struct dma_device in struct rio_mport is only used by the
tsi721 driver. Move it into struct tsi721_device where it belongs, and
replace it with a pointer in struct rio_mport so that the generic RapidIO
code (rio_chan_filter) can still compare channel ownership without a
driver-specific container_of.

Prepare move struct dma_device to private.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
build test only
combine with other on going reviewed rio patches. drivers/rapidio can
build with allyesconfig after move struct dma_device to
drivers/dmaengine.h
---
 drivers/rapidio/devices/tsi721.h     |  1 +
 drivers/rapidio/devices/tsi721_dma.c | 44 ++++++++++++++--------------
 drivers/rapidio/rio.c                |  2 +-
 include/linux/rio.h                  |  8 ++---
 4 files changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/rapidio/devices/tsi721.h b/drivers/rapidio/devices/tsi721.h
index 4f996ce627254..2df3955581af3 100644
--- a/drivers/rapidio/devices/tsi721.h
+++ b/drivers/rapidio/devices/tsi721.h
@@ -886,6 +886,7 @@ struct tsi721_device {
 	u32		pw_discard_count;
 
 	/* BDMA Engine */
+	struct dma_device	dma;
 	struct tsi721_bdma_maint mdma; /* Maintenance rd/wr request channel */
 
 #ifdef CONFIG_RAPIDIO_DMA_ENGINE
diff --git a/drivers/rapidio/devices/tsi721_dma.c b/drivers/rapidio/devices/tsi721_dma.c
index 52749f1d2a11a..09faaf2f334cc 100644
--- a/drivers/rapidio/devices/tsi721_dma.c
+++ b/drivers/rapidio/devices/tsi721_dma.c
@@ -51,7 +51,7 @@ static inline struct tsi721_bdma_chan *to_tsi721_chan(struct dma_chan *chan)
 
 static inline struct tsi721_device *to_tsi721(struct dma_device *ddev)
 {
-	return container_of(ddev, struct rio_mport, dma)->priv;
+	return container_of(ddev, struct tsi721_device, dma);
 }
 
 static inline
@@ -437,7 +437,7 @@ static int tsi721_submit_sg(struct tsi721_tx_desc *desc)
 	rio_addr = desc->rio_addr;
 	next_addr = -1;
 	bcount = 0;
-	sys_size = dma_to_mport(dchan->device)->sys_size;
+	sys_size = to_tsi721(dchan->device)->mport.sys_size;
 
 	rd_idx = ioread32(bdma_chan->regs + TSI721_DMAC_DRDCNT);
 	rd_idx %= (bdma_chan->bd_num + 1);
@@ -965,9 +965,7 @@ int tsi721_register_dma(struct tsi721_device *priv)
 	int i;
 	int nr_channels = 0;
 	int err;
-	struct rio_mport *mport = &priv->mport;
-
-	INIT_LIST_HEAD(&mport->dma.channels);
+	INIT_LIST_HEAD(&priv->dma.channels);
 
 	for (i = 0; i < TSI721_DMA_MAXCH; i++) {
 		struct tsi721_bdma_chan *bdma_chan = &priv->bdma[i];
@@ -977,7 +975,7 @@ int tsi721_register_dma(struct tsi721_device *priv)
 
 		bdma_chan->regs = priv->regs + TSI721_DMAC_BASE(i);
 
-		bdma_chan->dchan.device = &mport->dma;
+		bdma_chan->dchan.device = &priv->dma;
 		bdma_chan->dchan.cookie = 1;
 		bdma_chan->dchan.chan_id = i;
 		bdma_chan->id = i;
@@ -992,40 +990,42 @@ int tsi721_register_dma(struct tsi721_device *priv)
 		tasklet_init(&bdma_chan->tasklet, tsi721_dma_tasklet,
 			     (unsigned long)bdma_chan);
 		list_add_tail(&bdma_chan->dchan.device_node,
-			      &mport->dma.channels);
+			      &priv->dma.channels);
 		nr_channels++;
 	}
 
-	mport->dma.chancnt = nr_channels;
-	dma_cap_zero(mport->dma.cap_mask);
-	dma_cap_set(DMA_PRIVATE, mport->dma.cap_mask);
-	dma_cap_set(DMA_SLAVE, mport->dma.cap_mask);
+	priv->dma.chancnt = nr_channels;
+	dma_cap_zero(priv->dma.cap_mask);
+	dma_cap_set(DMA_PRIVATE, priv->dma.cap_mask);
+	dma_cap_set(DMA_SLAVE, priv->dma.cap_mask);
 
-	mport->dma.dev = &priv->pdev->dev;
-	mport->dma.device_alloc_chan_resources = tsi721_alloc_chan_resources;
-	mport->dma.device_free_chan_resources = tsi721_free_chan_resources;
-	mport->dma.device_tx_status = tsi721_tx_status;
-	mport->dma.device_issue_pending = tsi721_issue_pending;
-	mport->dma.device_prep_slave_sg = tsi721_prep_rio_sg;
-	mport->dma.device_terminate_all = tsi721_terminate_all;
+	priv->dma.dev = &priv->pdev->dev;
+	priv->dma.device_alloc_chan_resources = tsi721_alloc_chan_resources;
+	priv->dma.device_free_chan_resources = tsi721_free_chan_resources;
+	priv->dma.device_tx_status = tsi721_tx_status;
+	priv->dma.device_issue_pending = tsi721_issue_pending;
+	priv->dma.device_prep_slave_sg = tsi721_prep_rio_sg;
+	priv->dma.device_terminate_all = tsi721_terminate_all;
 
-	err = dma_async_device_register(&mport->dma);
+	err = dma_async_device_register(&priv->dma);
 	if (err)
 		tsi_err(&priv->pdev->dev, "Failed to register DMA device");
+	else
+		priv->mport.dma = &priv->dma;
 
 	return err;
 }
 
 void tsi721_unregister_dma(struct tsi721_device *priv)
 {
-	struct rio_mport *mport = &priv->mport;
 	struct dma_chan *chan, *_c;
 	struct tsi721_bdma_chan *bdma_chan;
 
 	tsi721_dma_stop_all(priv);
-	dma_async_device_unregister(&mport->dma);
+	priv->mport.dma = NULL;
+	dma_async_device_unregister(&priv->dma);
 
-	list_for_each_entry_safe(chan, _c, &mport->dma.channels,
+	list_for_each_entry_safe(chan, _c, &priv->dma.channels,
 					device_node) {
 		bdma_chan = to_tsi721_chan(chan);
 		if (bdma_chan->active) {
diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 3ac83721c0e94..d2dbc9d94cc51 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -1754,7 +1754,7 @@ static bool rio_chan_filter(struct dma_chan *chan, void *arg)
 	struct rio_mport *mport = arg;
 
 	/* Check that DMA device belongs to the right MPORT */
-	return mport == container_of(chan->device, struct rio_mport, dma);
+	return mport->dma == chan->device;
 }
 
 /**
diff --git a/include/linux/rio.h b/include/linux/rio.h
index f42379775ce8f..98ded5db5a2a1 100644
--- a/include/linux/rio.h
+++ b/include/linux/rio.h
@@ -257,7 +257,7 @@ struct rio_dbell {
  * @name: Port name string
  * @dev: device structure associated with an mport
  * @priv: Master port private data
- * @dma: DMA device associated with mport
+ * @dma: DMA device pointer associated with mport
  * @nscan: RapidIO network enumeration/discovery operations
  * @state: mport device state
  * @pwe_refcnt: port-write enable ref counter to track enable/disable requests
@@ -288,7 +288,7 @@ struct rio_mport {
 	struct device dev;
 	void *priv;		/* Master port private data */
 #ifdef CONFIG_RAPIDIO_DMA_ENGINE
-	struct dma_device	dma;
+	struct dma_device *dma;		/* associated DMA device, if any */
 #endif
 	struct rio_scan *nscan;
 	atomic_t state;
@@ -513,10 +513,6 @@ struct rio_dma_data {
 	enum rio_write_type wr_type; /* preferred RIO write operation type */
 };
 
-static inline struct rio_mport *dma_to_mport(struct dma_device *ddev)
-{
-	return container_of(ddev, struct rio_mport, dma);
-}
 #endif /* CONFIG_RAPIDIO_DMA_ENGINE */
 
 /**
-- 
2.43.0

