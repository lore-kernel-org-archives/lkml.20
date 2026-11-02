Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793638102;
	b=IKbupSTZ8B00jC6bGj1j6I4cGhqAeCZfM9BRqFfbPKI7AvKQdjVHwgvC49ILuU8lNI3B
	 n6/Ae8Mhbt/CZoZIsyutUUBpHmR849jphFDhR019dbr1mXC3Y1jtHTMX0jZVlAc+9r3kQ
	 UBc4Q6JeIz65n9p/ALpIuIgcpIfZ7zf7GGns3/d8pQMHcHaBDwG0WbxGVevG/oM4jgNEf
	 aKDA3rbZfIpbyYrOIkTUuAKlaYWgm+Y2UBePBo0Sfm8cmz2/pz2R/NPpAi8u3zp9kSCjy
	 nhyjH0g1D6cklSzSZtSi9D57FZVHqPk6WWN33ZTPB17GJ+h2ch/mNDm0Pj4gUJEYGZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638102;
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
	bh=sFnNhnp0EKSmjBAvLqQgLXBC3/b34wFcVmAyhXEPLOM=;
	b=s12H9mA4+K71YN+uEF4tX+SsJR2vzXUEGPyG/Wt6wWb+7mQ/q2i1dOT++Bk5QWx/h76u
	 MDTHbzFMdetDXWkE77oJciWWZ254PvRkaWqWY2V7ZGXAXJQ7WFwb+0+Jq3bh0YbpJ5EfH
	 ml1FN7vWhUtJzL3sffqPmmCSeqNe82VHsgMzuiGgpfi0jV34cBPaRk4v3lqf/sJPaN9N/
	 uqkcVumwrrf3md3/M/R0Izsecl/rv+NeQE0E9dwcnTiDYpI+xhCreEoVGzB2LLsj/FIiY
	 Ryxs35AfvFcF+yu/Z65Ht3/+sMa42gLMFy2GDUDGImLSgDMrrRkfU9hYVJe8x7aEixg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EvUpSPXM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.66
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63892606B90D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63892606B90D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EvUpSPXM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7jMqJm25u4siAtHZYYdjgvDHYbLiI/MsrS1UrQCIPztXyPLqX+eoP3Zif/g3hcIvb4iF7MT4bFg/o9wNZMYuTIsPSY4IjS+KJrOicdWay6j6NbfOLVfqOfEwgi+xb11d7bR5+EXNvphcrt6Zd1IXpW44evyIIj9fZA4TX8Hucg1XdE2YXD/AhzPZve9cu3oBS32HWRO/v+45NWeOb2t/DIS4BVp72DCUvWWNVjuM4+lH4vDu+nrh9OfHOjs5P8LF7VYj3USFw3qv3vFU5nb6dpk0PWwsFBZp02hc42IzhRklcW7whCh0Da2UJLbBo9BvV38nuNDbNJK5NatUmQHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFnNhnp0EKSmjBAvLqQgLXBC3/b34wFcVmAyhXEPLOM=;
 b=DpTCfsRKZmtKtvFdroEM5vtjU3DS4jfcr0K/2BjYzViY3CxwO0nCR5eyWOQ7+pQKp17meIQD6G4FjmndiUTNDGo5oLhzWwN5y78LCkylxifhAQ8XziuN5GRC9pRaQZUACpofCpaIYdZ0H3Qzucj1LELEUIVC8ymIhdTb/uasoT0v2x7SU6khHTZSGoIHNTxl95RLwdv4wsHQOQTgTk3nbY4llhQ1Ce047/MDC4DZn8wF21/eDPOVjdsuc0ax//tj4RF3cY0Cp/qk62J5Y3IduOxofaPzmkU8MIIb7AQqv/Te/ldxXC8VPegkuPzm0aBOvU0JcjsMZr6HoTeDgGP0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFnNhnp0EKSmjBAvLqQgLXBC3/b34wFcVmAyhXEPLOM=;
 b=EvUpSPXMRMWWFdNswIu6g5h+qiQ+NOtj8hSqfVSbquPZzK5kUrZAPZr2lxGthZKUy9K0Z+aHJCDYAx7Ww9k3+3r3TzzkCFfeO7n97VzADPVcqXpTmm8wcRHNd7qPGLgxvX80WiC6OYU8A+TE8J0P6fsc2o17Rpg3OqfuRn/qso8QzmOgFhhvKlyTOTtDXHqKxZHgxi2qnIDIXtgm+txnUz3FDTj09a58NeLR+EVYNKVpykR4bq6b4ZCL9sb6y1jMNaEqdMlPgD43HfrhTvcoV0bFS5Nry2CvEfzz402W2VG/lTph7aX8iT+sjL+Q4ng2x8eFb3IwSWXjvf0UOUN9OQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 16:48:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 16:48:19 +0000
From: Frank.Li@oss.nxp.com
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] gpib: use dmaengine_desc_set_callback()
Date: Mon,  2 Nov 2026 11:48:06 -0500
Message-ID: <20261102164812.3837283-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:510:323::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c85f799-fa42-4d05-7dcf-08df39011986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|23010399003|1800799024|10067099003|261102123227099003|18002099003|921020|56012099006|11063799006|261021123027099003|261021121427099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	7S3CV2byRd2QQQ/GHEIb96mUYtWsaDDtebpJL/FZSUbU1pmhtwNBr+1KEt4DJsoKLsvpA+Cd/02dfsIqjZYxAyH9r0bwuXE0g3UYqym8If7KIAUY2t615xgfvumQhi3oycXrR3swPamPKZuvEWA9BB0kNpVjnfzEVZsWmUTOX32DANj26UrHdpMS6x8eZla7x5btGpYZnmbVrjKtcvpEXynhqojQuzKh8Fl7RNhIaYUkdLcHCVw4rn/ZQlFAu/mDUnmvgC13vfn0w6MeNSqAYwKtfs6w+9PXIR+tT69BlQ31qrOW3RdaG+n4VJH5UZvnbQheY6Gc1JfuvbCXsjUsDhBJ5UDwru+cvDQ7+luJYo6cTyK8QIt9cT57xzOjAaKfDjjn2IrgWekHuoz2hzHkiL4Lr/JNAOtbjXb+/1X+uzvF/KaJ/hR67ynD9eQ+54Q890kAFmCWbonsSuRLJp4g7QiAwtigNvIYhD1zpCMxM8AgHn/d+NFscVA9rKhM4Fdx8yFN+3w3RQawe3THk+Lb2Q00io8DUkshoSBiXDrLp6bvTIih+kEWM+u/ETIXFGUnV9glB24oszn3piQhMMS9rnVdRVGlq8wojfviFjHgBE59m2R89GSdWB0CGePetzDv+DBc9CQH8f7f4Du5SSyMXbHp8tyqcWaLX4INlYSPLBy1H6splNu6uLhJerhVRUiNj/l2YKiVtVhIH5XBTldEPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(23010399003)(1800799024)(10067099003)(261102123227099003)(18002099003)(921020)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vh3Qyy9vFkgVbBAo9tYxz2b0TP9OUEHMGlFluQ+a19DLVyO08qpZUHAqHgJK?=
 =?us-ascii?Q?4YDYIodtKkAmo7jSBlFsizgDUegy68pAXeUsb5uwltulZiOatkQ0G2z/nVYI?=
 =?us-ascii?Q?SkZfJbEa9MmmL7gs4lcYlnyLnmZQCBo84mPHhtZWGFF4yKxhRiZsnT/5Kjfz?=
 =?us-ascii?Q?xTPs1RWI8NOnz5jOKwkq95jpudCUr54imKh4t0c9RPPQS9t5PZCvp5DrktQr?=
 =?us-ascii?Q?1Ww1OGtwV06+a8S2LUf+HYPuimsinDBdmEAHXSaWhTGuan2X5KmtyTkO5tdl?=
 =?us-ascii?Q?QDPb/gauQq2HsGS6BwmiT1nmHh1Ayl9u2nc+x4LYCRvQ1QrhbnFWGi13AtVh?=
 =?us-ascii?Q?z3vJctr0TNW2X39+1laSI25eeSSSaJcvr4QIjsAzLBzH7oh0QTOIb832CRJT?=
 =?us-ascii?Q?42l61comPUw0KvfrFyJayW5pkxS2NYMYb04GDfHQ2MVDM36Re6TW1VuRAP6C?=
 =?us-ascii?Q?SYEIbVd9D3504V3SVwG3VF1/Di9kj28HPT9K11z3V/87+gJPFiXYvK8SPnuj?=
 =?us-ascii?Q?VjvchIhd0lZ40/CgTp3CqYURLdbN79cJAiRTxMEJYbQNCo7kZlYgAtHpK5ih?=
 =?us-ascii?Q?hptQlGF9lA+8rFP8ZlWR4s44ZDcw34aZqlqOB5fppSmk/4CHq/ipIKLFs4Ak?=
 =?us-ascii?Q?Vfc3RYS2mEHxpD0lGrtmrLQvYTFkvOh05Nj2xwl9r6cUaNhRrzP8aIMj1f0N?=
 =?us-ascii?Q?UUgZNHsGH0LHOjftymAQBetgclf/fCElLK9Tx5vhieWpkwMYVDBFKJF+knkD?=
 =?us-ascii?Q?2oDh5exEFlEeV3o8Uz9BS3swwAm54Yh4gEpkUqhm8Hx5sPYhxxOIQ2Ls/bq6?=
 =?us-ascii?Q?Nhqjxcpi9lfgh8XJs+oOK4HfkqjTDxpIN4hH8TUNDUEWBa07hmP/Zbb/kzZ2?=
 =?us-ascii?Q?SDm0h7jU2pYDO6GDeMmIGkDaTSxtGCrmxuBj5qzSwntbVz2HgTXL1tsQECbW?=
 =?us-ascii?Q?qgVXg2eJVMobM44Wi/kz7V25gEgv9JjeVMQhp8ETGc29r5Jr1FMEW4nLUJmz?=
 =?us-ascii?Q?JVzTJ4bvrGykKCHm6wlL1cjr7NHhU4g+dqSNvz0CZq2bixi4mfr6EVsjB6Jg?=
 =?us-ascii?Q?S7aWQJZvSM2pKvY1Y3lR6ZN9G4dN0IorNdQNVye6s/AZyNJVLRsl0ub8q3Jw?=
 =?us-ascii?Q?Q7wrFJVjIV+LOin8+wAMP1t4TKkHnzW4QpwSuQ0FY3h8Z86d3zqHzIBePjrJ?=
 =?us-ascii?Q?dEPbNg1Hs9rD4+dafVPa0MMqpI19cF2H+OGOFnQb6Z/y6CrTAdYR5CWtteVu?=
 =?us-ascii?Q?ZVNSZOs+P14+cnJvo8soDNylDfQQwtBb6s1xdECqxb7luhtEkFRx0jWguoBc?=
 =?us-ascii?Q?BxY9R55jfF/RHKL7M/n0LN3AWIEqCbFIYgDbtWK8tBP/3hdKVMjgWeZFY3P7?=
 =?us-ascii?Q?Qb8r98r5S0PRWzjDbPBmG07WHZBQzUQJVepUoa/8s/ntKAYdx/DRJEOxjqVm?=
 =?us-ascii?Q?l2s6ypfn8hDSxJLQzmBDhqaZUwqw9lBK1I9qzjBAOAUOJthTaLUUfGVgaUV7?=
 =?us-ascii?Q?D7qyqhUnt0uy3Q70ai8dXkZUbl0hVuNLTponhjHYv96h/xlx8eN2rzxvpZNK?=
 =?us-ascii?Q?Soc/vf0AHuVbBZlXfg+SmkBuN4/lbWdPkq9H0DUVLoqtV4GMJxDDwLqNVyQK?=
 =?us-ascii?Q?RgS6dqsmTMg195o24JPsZNAGImQ3NBhuRyMXrUTqq8431a1FZCGV+0OM5rKt?=
 =?us-ascii?Q?BWdjpJWmj2gmJF6PBqZGO/V48hO35O8dCpRilJq4u8IvT2HDip6j/zvfGQdZ?=
 =?us-ascii?Q?0ui0pCX8CpDrLw+EPOomSxTS5FhfFLU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c85f799-fa42-4d05-7dcf-08df39011986
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 16:48:19.6551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dc3nkbld+2o3suXciNUJ4ZA+clEYmbk6nFv+67sMoPbL71rUPjixjdjn1QMA6ktWVuDcE5/KblrQdRWRVcQdKfgekJZ2EcEnxkA9x6CbK2lOA+cpzX4NIESBtxJVVB1G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare make to struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/gpib/eastwood/fluke_gpib.c | 6 ++----
 drivers/gpib/fmh_gpib/fmh_gpib.c   | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpib/eastwood/fluke_gpib.c b/drivers/gpib/eastwood/fluke_gpib.c
index 1363f0a1f5701..021910bce621d 100644
--- a/drivers/gpib/eastwood/fluke_gpib.c
+++ b/drivers/gpib/eastwood/fluke_gpib.c
@@ -408,8 +408,7 @@ static int fluke_dma_write(struct gpib_board *board, u8 *buffer, size_t length,
 		retval = -ENOMEM;
 		goto cleanup;
 	}
-	tx_desc->callback = fluke_dma_callback;
-	tx_desc->callback_param = board;
+	dmaengine_desc_set_callback(tx_desc, fluke_dma_callback, NULL, board);
 
 	spin_lock_irqsave(&board->spinlock, flags);
 	nec7210_set_reg_bits(nec_priv, IMR1, HR_DOIE, 0);
@@ -588,8 +587,7 @@ static int fluke_dma_read(struct gpib_board *board, u8 *buffer,
 		dma_unmap_single(NULL, bus_address, length, DMA_FROM_DEVICE);
 		return -EIO;
 	}
-	tx_desc->callback = fluke_dma_callback;
-	tx_desc->callback_param = board;
+	dmaengine_desc_set_callback(tx_desc, fluke_dma_callback, NULL, board);
 
 	spin_lock_irqsave(&board->spinlock, flags);
 	// enable nec7210 dma
diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
index 4ab9b0a317fdb..de1a055cb6477 100644
--- a/drivers/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
@@ -428,8 +428,7 @@ static int fmh_gpib_dma_write(struct gpib_board *board, u8 *buffer, size_t lengt
 		retval = -ENOMEM;
 		goto cleanup;
 	}
-	tx_desc->callback = fmh_gpib_dma_callback;
-	tx_desc->callback_param = board;
+	dmaengine_desc_set_callback(tx_desc, fmh_gpib_dma_callback, NULL, board);
 
 	spin_lock_irqsave(&board->spinlock, flags);
 	fifos_write(e_priv, length & fifo_xfer_counter_mask, FIFO_XFER_COUNTER_REG);
@@ -745,8 +744,7 @@ static int fmh_gpib_dma_read(struct gpib_board *board, u8 *buffer,
 		dma_unmap_single(board->dev, bus_address, length, DMA_FROM_DEVICE);
 		return -EIO;
 	}
-	tx_desc->callback = fmh_gpib_dma_callback;
-	tx_desc->callback_param = board;
+	dmaengine_desc_set_callback(tx_desc, fmh_gpib_dma_callback, NULL, board);
 
 	spin_lock_irqsave(&board->spinlock, flags);
 	// enable nec7210 dma
-- 
2.43.0

