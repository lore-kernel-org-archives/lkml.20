Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792641248;
	b=m8ADjR3ixhc2AGbBNHdqrDnTzL1pSAEzJ5SeCE5SyH2xIcPBhvClK6cRvEd4pFRB13J8
	 4iV4K2g3n0KTIFJ+2A0t9ckXk5XXMBK6BjeTv1RTHDkAKp35QlhfB7Zt9xGxwtAkrwiS9
	 XToSiNnwtrvBurg9r9db95hwQzkm4/Pr1UqVm+bYP8pqYO6G5poieYjM9MEKyq7q5yhgn
	 20etXKs2oLoW4wSS/51CNvYbYM2BMeyDsllhWqt0e7X8Tasja9hCi8Hmop0FWnjalecIV
	 Ne1X/bYnQYqOvT+MxYNQ95sWAv07o6l/e9tmS+/sxza5aQhiiIQbi93mYAGhuqdWN4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
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
	bh=Rz2SzkyPGp6THBMNJCa/q1Y95HR0AS2QU6ooyAtJH80=;
	b=YlLsY2ic1yV/kF1n2d2XeKsMPd9R8I6m02lKUU4z7yGY7h0CDNB9b8Xwuu3OquPC/054
	 Pl9AZpf2GdHMSjnJrgX0PP9mWYvV//k1fDNXLWxMmq9TDGLw8KLZkL76Ea+FN5gmEspQS
	 n9dszIfIP4465IuBQpIEmLgxOM2TksSlgn2pTh7jtacL9tU8NgsLhNtya96bYj5LFkPSX
	 eX57pfep3FtbyBS0tpeJiYNKlfI3v7m2eS7/pDina+nzj03DsKDa13/fKR73rCZDgSbhA
	 As0gtUjdt4DxrAxQrYkDcnzikBaiR+S498D84kzoh/kKr6ceFXZ2X7QumxgSsP23Luw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=MFU3KPWd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.45
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012045.outbound.protection.outlook.com [52.101.53.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD267606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD267606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=MFU3KPWd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6LeglWmruMDV+KKREVF8rYsRQIRd51kxc6gCZ4gx6tt6H388BtqX6I+tYYj4KE6aHE8wS1S982kvFW/ZtrOY9413sAy8qwS9fBNbN+rOk1ZV1TPa4ZDJUn+ooqapoyYOJPtwKu6+192A4/L45RifzsdxCHNhX8BU9vvKAFSxs39rALs6yilA8ah73qFvMIT2OH9ruE9mDmeUKGsJ9c3pQnmrD4plGgvuazSpll7bdBEHCtYYppJDL8AlIYHDH9OHxm6Zjl9s8tRqRXgJ2et/oJdqOofTTVp8k4tWgqWKv0KpApkMp51rhyBuLt/ZcoRx39uMyvdNsWkd9gWOK+75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rz2SzkyPGp6THBMNJCa/q1Y95HR0AS2QU6ooyAtJH80=;
 b=Z7oF05Re/gzEhc9MRCxFG9CJNarFJXMv+kqgx28Owmz9D/ThXftx+hE+umJGaTnKPZ5UjtAngi3n7mE9OBVzY00qC5VfUQWXS1QgItVWqM3vKT4GgXCK9IxGGa73vCsMuoqrp3qo2WauSUafqsaa7XW3KAmqeHt5STqsExlmHdSUFGgAwIJLt1XZ841lVfxi13L8IP5rD4e0r/Vr7N0hP9+67mXm/rno7iubW75f8hfLt7RqeLUg54nYmG5OQlqZuiMxjoZsL0/adrwOPfqxVtyKgXxlDjVdu+0WS/vQeRHtVobOY+NU3+CF4ylM02gxeVvpnC1PYE+n/vX36SH6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rz2SzkyPGp6THBMNJCa/q1Y95HR0AS2QU6ooyAtJH80=;
 b=MFU3KPWdHvHx2xy8knhev5iaYxoPf+zPfLpajVqDCqWMQpvrja74kk922g/hJrF5H4K18gy7UDatngl2/KIzdrfvKyiHKIvlXngUOoQK49tZdono4cC8Sen/kUoStz6sdmhv1tYmvIdPgeCTwf6gbvrXn1E+mcrlxR0ezZS5SExozmXXxzgP1lgaP9GJn1f7Qi2D+GlB/TWFvG9qnwlgNb1dE++puq9PBX0HXpPUu7ofwSVDzNAPKHZ/0dGPSA+LYfTevmw0ANw3/AnLQgfJ1q/guDZRdLvzM2IQGT/XB/lRb7ssXCP0LVKTehdvr+38l5i2tsyHLOhvgMNuces8ng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by MW5PR03MB6930.namprd03.prod.outlook.com (2603:10b6:303:1cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 03:54:02 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 03:54:01 +0000
From: tze.yee.ng@altera.com
To: linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/2] mtd: core: drop the module reference after ->_put_device()
Date: Thu, 22 Oct 2026 11:53:51 +0800
Message-ID: <20261022035352.52129-2-tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261022035352.52129-1-tze.yee.ng@altera.com>
References: <20261022035352.52129-1-tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
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
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|MW5PR03MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: d1304f5d-562c-4b31-4ee2-08df2ff01b86
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261021123027099003|261009223027099003|56012099006|11063799006|18002099003|10067099003|22082099003|55112099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	ITdV22ZtJFHpXjyWVkZ8yEbhC+rOxAp66PXeRNdo34wrvnjcux+TLUhtoMX0owltH0r57vCCWlyDNhqJ/0QB0dK97VxPDfnEMBewRhXb+t9NPzDtl1Zdvemjy2crRSnEGvYwpF79UuCMMlS/O+uyA3cG/2hWCOoq0ejTFVew6gPhiubSZE25G+xnHKpUZCsc6Sa49GbFkydqKugdueUNs2Vh93xF2MuMFJRbZZvhz5xQ9Qv2yzO4mNgUr9WEvv/hhsearPXqz04kLyyU52Ya0aZ4sCZSQCiJpaiF/O0cd8OEOtN+PrepwPhtSiokCcYE1ahdDVk3El2zb0CMHtaIeMCSMfdDFbIMivK7XEGo19Q9I8vJplb6Ope57oE4sZvHxHfUS9vKx6NyP195Zt9yOVWuCiEsvgirlfSlCn23xL7KupO+3wgmneizvEh8SVzQp//kYvLcCRDtQpOeZzgH41MZ8TXrfi9g/NpP2M/Mn6NZZ2oDG3tWqmMKGQktr/VBjaiWHg3p0F4DJyLsrv5raPie9VJOtAKNth1r4v47zToRkoXTsSvsk4pCbM6PLGOyE1DCaJ4k9/WKBXAveKnshIDI3mk7jxbKlbeYa/HQKLb9tVDO4Li9XpWVzdL3xLiDBdlVRDXrC93M5lqsjiNqFK+T1NW/DWUL5G3uJuvys3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261021123027099003)(261009223027099003)(56012099006)(11063799006)(18002099003)(10067099003)(22082099003)(55112099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ru/c4xG1jtMLIXJ7vQFiZnB8IXWwmJocy+IIdk7ou93S5esW79myx/Nil/l4?=
 =?us-ascii?Q?m6oBkf6vIN36WUrMX7TyFWlYv2HDgks6nEeork2/MLDBs4LizJSDQpwmo6va?=
 =?us-ascii?Q?jKvM++BQmuCLsc4NxoSlOSolMIaGe2ff/HgVWVoDwtSpcogqZjZ8FD/M0JIV?=
 =?us-ascii?Q?JIzrKLl0sPAPnpRUTuBPMo64Mn0puxYKYGHH1UPcQdXoblIK0kloUy0Bv39U?=
 =?us-ascii?Q?lIFZqDKOdADo5cEPawW9Uwwt33JBkbODyJMf3dWB/YpnIRRJQ9RcQolDwHnO?=
 =?us-ascii?Q?NiIVHIliS64TuF0hKnHzYjd0Z/EjP98pav3jJlbRzlAohbCnHX14yN8HbTza?=
 =?us-ascii?Q?GZifa7pMa+5pDVbuJlrx7ZtB8Uvhmo+DXRQbhNlJIXgflDUeftOoVBQcLX6X?=
 =?us-ascii?Q?OU7ZCBwneJIiQXhnh36P1ZmGSylHnwgYAi0rtuXTp8ImPFix7zC7NGboTKvR?=
 =?us-ascii?Q?OIYKsR/ZGKjQxuwxL2lQNCnWudiYpq1qlZStKXGgfPCjQQokQmAZLM+Px7bQ?=
 =?us-ascii?Q?FB0hyVV4v+/8H4vF4tnlklWJQsrfSif8uS4yTIcBeTAxRZmzJ6kjEE/b5MQk?=
 =?us-ascii?Q?oUm4FKKoFtUOoFUiYpJRDg9gBhkil5NPouxYyJrZ4IHmzY02W/LRhS8dtbVr?=
 =?us-ascii?Q?KAkKmZgsvXyEmfaiXDA/C0rWmyQRTas8OfQurVc7AtoKiH4oh+3SfzOAKDpW?=
 =?us-ascii?Q?Dt6L/88qYhHzkcTm6B/aSEzQaKxtl3Nx130uKXbB7eAd1K4C/L2pRnqlzttq?=
 =?us-ascii?Q?RKhWMB8OcIbJ6z1eTYz5NuKdoQvHVoBW/FWOOSmi9e3xrUBTCpTPslzZE7Yq?=
 =?us-ascii?Q?+OXwzpNXoV96eJ+GdiA08rZ2lp58WG8XvuQxkKf9HyDYOxkCVZRaYitCFMFx?=
 =?us-ascii?Q?xdJvzjUf46uBIdCMz/OdEIrYG08XKAHr1eKxkLb3HA8weg4yY0SIxLssIm+7?=
 =?us-ascii?Q?Cr8j5RLjlJ4dzdczM2JEbJAipt7xWRLbu/SeoEJLAb1girtDhtc67S37ofYq?=
 =?us-ascii?Q?exCSIA/BbPMezk9Saj6qrP/PDcT18Exz3x+X0WKkBfJu5EScLXMXyp/C0OSJ?=
 =?us-ascii?Q?XtI69qhajU8q9wR5a8iP+iguptkefQaC2BGxTQ3YdT/SqTRQjh1l1ivK0oGQ?=
 =?us-ascii?Q?CSkBWXc8Hqyn7yizyo5NV3UJfkeeEsgJ6i0+uB9qNHEwJBdaOVzTX04D9kau?=
 =?us-ascii?Q?IuplRxSerWAWTUaglfbECELtzN3B8OKmr6EWD5/YyUgf8T9KbvvBnXsjKWzk?=
 =?us-ascii?Q?+rfNjnv2I0R6W0GAFmissO4DgqdbNoUYlytmmmKG9n64Xe8D7eXcV12WWyF6?=
 =?us-ascii?Q?f8VQeotFTQeK25mZP9xhmGy9n+nxp7ENy36+pjo1NAHV3VbZWtYqbH6Zx2UH?=
 =?us-ascii?Q?BbgKwwcmM9BLhG9GyBOydqADZG4w9VLVZv7jJGXj2a69iLaBuPASmsNUBgQ2?=
 =?us-ascii?Q?qpwLXUut1JXuzyEJT3eibAETEAqj9JGtgngAcoSZOMLWRKW+ztZa+X5q2PGT?=
 =?us-ascii?Q?3BTcKDYEnqGOek+LKMprR9rHYUCaKAKl7yWrNyj4LDruAKkPyWbSCqmEpmln?=
 =?us-ascii?Q?mNFsGe7M7s7InFIsjiiLcC/FdCLVB1Bbt7yl538JM40s15qZ+oICG+QyqWMX?=
 =?us-ascii?Q?l5PAB9eSV+uzowvVtD435MLPAPU7qBv8h30G9inrmlB3r5gMZ4+rIfivVXX6?=
 =?us-ascii?Q?GkVeZPxt7ArrzSFCLwJzx4SjgS6785ZPbRPtNPVXdpAgr2yRtaXGO8r6/jXu?=
 =?us-ascii?Q?Pyy1NRGw/g=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1304f5d-562c-4b31-4ee2-08df2ff01b86
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 03:54:01.2600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1d3ecjyApAvR4kZ9fjLli5AJBYfdEZAWoYpmMxeWgFpnUC68oqrTKkKTCh2xffjHLcrZis8F4kiipF7jckfKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6930

From: Tze Yee Ng <tze.yee.ng@altera.com>

__put_mtd_device() calls module_put() on the MTD owner and then calls
->_put_device(). If ->_put_device() frees the object that embeds the
mtd_info, it is still running code from the owner module after the
module reference is gone, so the module can be unloaded underneath it.

Call ->_put_device() first and module_put() last. ->_put_device() may
free master, so read master->owner beforehand.

The spi-nor fix that follows needs this: its ->_put_device() frees
struct spi_nor on the last put.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v3:
- Reduced to the module_put() reorder. The core _free/removed hooks from
  v2 are gone; spi-nor manages its own lifetime again (patch 2).
- __put_mtd_device() now reads master->owner first, calls ->_put_device()
  and drops the module reference last (v2 left master->owner and
  ->_put_device() reachable after the core could free master).

Changes in v2:
- New.
- Drop the spi-nor-local kref and nor->removed.
- Add mtd->_free and mtd->removed in the core so the backing
  object outlives unbind and later ops return -ENODEV.
---
 drivers/mtd/mtdcore.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..1cf402e07b13 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1435,6 +1435,8 @@ EXPORT_SYMBOL_GPL(put_mtd_device);
 void __put_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	/* master can be freed in _put_device */
+	struct module *owner = master->owner;
 
 	while (mtd) {
 		/* kref_put() can relese mtd, so keep a reference mtd->parent */
@@ -1448,11 +1450,12 @@ void __put_mtd_device(struct mtd_info *mtd)
 	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
 		kref_put(&master->refcnt, mtd_device_release);
 
-	module_put(master->owner);
-
-	/* must be the last as master can be freed in the _put_device */
+	/* must be the last use of master */
 	if (master->_put_device)
 		master->_put_device(master);
+
+	/* _put_device() runs code from @owner, so drop the module last */
+	module_put(owner);
 }
 EXPORT_SYMBOL_GPL(__put_mtd_device);
 
-- 
2.43.7

