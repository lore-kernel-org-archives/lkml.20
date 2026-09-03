Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1D2BEC3F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405283; cv=fail; b=RQam9cv1YhLQcW0jUCdseRsyXQXBMU+UyvYW2UvRu98uaiePllEy4AnE51fvXCwmLselqNP9dLfTsWaiUxlWQ0TdOP0eaCMmJyTwJw/2WC/JPoB7VzFUZQz2xep27Ju5ep27N+K1wVIiAG0ArF2jLQJufcWWwjtDnAzwYR4FtsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405283; c=relaxed/simple;
	bh=G0R/4yc/3OxFGqYcttWx2Ylk8vZG7dnFBwUlt51ScBs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IgteHyLqsrQFXFqxdlQqM3w3maaBVJTrRlvc6pYNR5Ji05tkaZI4T7yOCEgOsbV8GhdcyxE1S/uD3RRsn6f7JUe/TGGjYOwrsyFTSPFNrp1tEa48mkD8J8wzISv/EFXJITyl1+5b5cxCzxPPgVGxQwA/VjZjOAFCJtLSZQbXrs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=hMWj7zqk; arc=fail smtp.client-ip=40.93.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="hMWj7zqk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCzhe8R67wTFKp6Q3RRtJzungJxnsDNk4j4ulHl21EkJZ0kXD7WwIxLPRSKzR9IzzKk0SogxCTEQkvBe3puAi5fxnuxZf6Ac0Mg4aSxo0cLNpYxUGQB+SSYOfh58GBMdfFDvPJhdKNYFmZdwRAjieppQ/4zCuZwZ5HI2eFUK5GFcsp4YFqXtlxnuNKSc+aaaICxPHf8WQy8ZlYdHnOml8DB2vtcco9C314QVl5ptr3Po8G29+KUod+jXXfv+ykYVeNQMrvjhsgSsNfkv5nW3GyoB3czjbrf/XVOnSXhqhqwFp5l2XDxwFPqIRRK3/efsSWltsfisOnlwcsocxZWM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfUx3CQqSbQz+BR8yoM11FHZAACWDdzxG9fSJPbB7vI=;
 b=hObf3EyCio5CEBzPnn/whqSFnrmjPCHeDqBzMom+TkFyUpIg5xkgNQitqRPxTfxW4lcJPATNQvKJ5LrRjl2XC02CO+G1ueFwcNDoWv4e6ZaCpQ62ZU63n3w4SBrkAn25Uha1NKvqW0ngFn6+X2OcjQIYnlccEomB1jC0oh46GuEvmYeGXsVqmjuiIYrbN0uI+nzIYtQgMxCY42m2t9hiKKDcWh8Sz+EL+PRSLy0B6Hlq35doOw2qP8+3DJJc/nngerDgiYhigUoUbo9083yQ47PLmmBjqiW4iiXyMrFVto6I2nF+KZQr7V3316egE6jBOwvgFk4Q7BLT1qoMZn6XgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfUx3CQqSbQz+BR8yoM11FHZAACWDdzxG9fSJPbB7vI=;
 b=hMWj7zqkIPRDUyJdtg8j0HFvLhxIuaOBqKEb1tPfAWW8r1sVcKNTzJYC1rqMjqNmBxlRxtJhvNOkQ6W84f93fQ7QwCMg1tAgAkRHaf5k9AOjDF9X4jd81XzkAKz5rSQiUh8hSoP9bwWcwph74wB9Wjq26PjCBHe8PTR2opNfl1FGGNDW9dPb7Xpedr/LKcXvZ+xgdAmGWR1etY8RPbb8yzN49gtAe+C/SkJ7AualMNR2hEwWpcn7KMnYHZOy/Xsoi1BXvW/b88o9O8s/bL3cSvlEqJN/0h7nI6a1ATHjIGpFxu6hYgrlrL5j/d87tK1iRl1eP7bE3SVtHZrP/YiUug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7502.namprd03.prod.outlook.com (2603:10b6:408:19c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 03:14:37 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:14:37 +0000
From: tze.yee.ng@altera.com
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: spi-nor: Fix deadlock in spi_nor_rww_start_exclusive()
Date: Thu,  3 Sep 2026 11:14:28 +0800
Message-ID: <46e4e2e31f051f64c120307216ce2766c004d9af.1788404586.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1788404586.git.tze.yee.ng@altera.com>
References: <cover.1788404586.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: b68305cc-f3d4-45ca-fdda-08df09697c1e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|18002099003|22082099003|55112099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	tvTRRWzfLbCdEv74H3I+KccqP2viP6mTTyg6V5kVBpXjAxqYm8TAwJe4Wl0QBsnfNwxFS4uN5KG+Z0VKxo8pyPo5Y46jacIqTqLCILXno51tEq3JXfhSe5wpf7toCSJeZlTkmCeJk4RuOXrTeAM619uFWltm/EeI/Mzl8BYKx2wa7cF7XlNQfxZTYYMLLdMzQ+nfqE1mNs0Kn0bdfHXiVB4oEiELANEQAi/kl5D26qFpq3zvbvdXlUGfWg3GaMXPyGyLRi8+t6hNLWQ4gGdbWznBgyrtbx7eioPj2MyluEHuMZql4Jgpn3iL3zV6/Rzu3/5QT32O9WW1g4lSmDpuwRmnaNE3PyCAzkl251KP9dc5YYVtFGOgRF2H31MigSGs3PJ+IbzK+4ajXttll2fTduDwlsKmXpTWJ0sGX8tGcMyoPKP0XtS5Ky1CV2T41DutYQH5hH9Tj8OwSo/n7PM8Rj9Ch0C8y2lFlUUGrZFCWtDzf0HPgSAlmyunZpdl0MNBwSp8G2aoiEpgMhBzG/vdUtHHqwSgCfqqW4JBdwbytLWVEh4oYgdzohgAXRehflj8XOLdUIUzbqraapTh5nlouwAzgQPlZIDFnR17aKrUZHb0C6xnQqUQGWDS3zcHi+HSuHTNHkin08FABacC4heTymgzRTr6JaC0PRdH3A0oliw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(18002099003)(22082099003)(55112099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Irf+aTn6HTLT1HC/Vi2x9N/nxzGe2kj2tlCv/spEGlyWzqlLI5g+BXTl9C+?=
 =?us-ascii?Q?uoJfJuBLSedsrUSOID63sSqvTN1NLezp/6vQL8vYLkG4Slt88bYXOWdP0o+P?=
 =?us-ascii?Q?1Jm++PTn9/FrfiQY3+V2hzz2pMK+mBENAOztkENyGsY+kQQ8rwYGA3uacLM0?=
 =?us-ascii?Q?c/Mj4LW9MEn6isHyxNOzc8NV6i4BLURNAr4Fij3bcFiz2ZXEIMSc7RNcJ/4f?=
 =?us-ascii?Q?UyiabgfhRD6g/SKxHex36hILgsUCMeMhF95hPeXPVYbkL04VhVqLzQ9swLgd?=
 =?us-ascii?Q?nK4xV4o29Muy99gEiGf0G/niUK1+gPQs3l+9bz7Shn59VN/rDeaeaj0iWRdx?=
 =?us-ascii?Q?I4o110s5/zo6FUiCFjo8tcV6Tenlsjf2CShFvR0LxDm/x91KxGmb+IKjE0yj?=
 =?us-ascii?Q?GbKxu5W+s5/H68yAgR5KO44JZUKDahVwQqr5EsOdzh4ZIsmBd63aUtOr4+fY?=
 =?us-ascii?Q?HEApiYqLj3omaReOBdz6426C3AIn5WBD4lVTUgjpzuLvYME5j0aQplZhcylV?=
 =?us-ascii?Q?8Kzbvvip3ooFK7WRO+H6UDLJHpJQ/9+fErAqc319W+MVMvLSWoKL3hdEYBd8?=
 =?us-ascii?Q?+Es2sl5wKyjYGtMm5AqIDbpdFpWIvsQXxyFSL4qAGPFQ83WlAAZS+ElA/l8R?=
 =?us-ascii?Q?Q3YUtJbT1/+OOLqDPiMr3SPt+SJUi79UnCWSg8rz4JJjWYo5vGuzZO+39XsE?=
 =?us-ascii?Q?XZpubGInHnbK4cptvLGb5krsV0tuV/WdsOE3eGgykBwryrEEVhmOdVlAs2D2?=
 =?us-ascii?Q?+NDagaHzK178CvXEotopZ+uh6JhqJfplF/9mAYi1wAckjpB9UHe8AqC9c/N+?=
 =?us-ascii?Q?sC2sOl6w7l35enujtAKg7XGhOG+1WIrdyfJlrjwmoNipSfHOCG3hNAR5zMAn?=
 =?us-ascii?Q?lS5in6Ezs69zcIPoW8LjF6oFaJfGSnl9Ela0MbEAz6R1pZSN15kM7RXlFpa5?=
 =?us-ascii?Q?93Inrkn0VdR6NTTfOm1911gd0U+XHrnsZbYcQUxyj89jegtLNOUuAi+mBjzJ?=
 =?us-ascii?Q?lq651jjkbrkFB3fttU4Wg24kumQZtOrssLpDKY4xiphR/0L2ec24FT41tk4s?=
 =?us-ascii?Q?JAbgpDucdh2UsfRQQOIG5lrslvf5VvTh120rkKfbUv5v2ZYznSbZkWhE4vFZ?=
 =?us-ascii?Q?xP0pQ1I2RMCV5fU5pLCzbVe9j2aOiwrBInNrJa/Htv8q0VAdQ19E1F+XCRnv?=
 =?us-ascii?Q?5Q4d3336rDRex7xcAUgXndRrUpi3zeRYX39PBNv/UqLi2dCyjcoSYjYawEil?=
 =?us-ascii?Q?Xg2cZREzDpvzDKw2rSDRortp3GUkZuJMIKRkA5wF0I4hAC5/2lrv7Zwjo2Fe?=
 =?us-ascii?Q?gu1NW0C5zDebMO+Lgdid/0DUyOlfBsMkGERCuFkQaVdDn4q2X0KBmLPAE6Y5?=
 =?us-ascii?Q?dt6Z0hVekYa95E1p8QWx22ZCHIsH7x1Cr5wp7Zkd1QwAsje/IFj95vIqEFoQ?=
 =?us-ascii?Q?o8L5aBh1dtGTAuTX6kmqMrQF1TK4dTCPnXrOUBj3MzYGCbkSLipB50oktvoO?=
 =?us-ascii?Q?rYg+aNw5IzQH/vcRNGib/qCbk0DVxdTrLnpk8QW4q9NbwhRXQoenIVHG8shQ?=
 =?us-ascii?Q?T5HBYjPAbZ6sYo7MSmfzkp9Q+EGWYrGCj/jsixYwkehXFo96i8KBzzgi5mWa?=
 =?us-ascii?Q?CFoGP0aKZMO0CLmY+Y80iZ8ImvqZTGO6alldOqrzn6D4BDpQNnGG/+h1MQTl?=
 =?us-ascii?Q?93sgeIeODY+bSs9CZz2aXGgV+jJ7MrA6IIh/pRESs3Hy1Hm1nE4VWMd0oM1v?=
 =?us-ascii?Q?7W0Wo+Nv5A=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68305cc-f3d4-45ca-fdda-08df09697c1e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:14:37.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhWNaAfOtpHzg/YQR7PhZ+f+WDzNSzZwGOPdjeBCJoe51WyA3VTbSS4K9/WIr4FsZ8MCVl69iGYGDJIqMC/NBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7502

From: Tze Yee Ng <tze.yee.ng@altera.com>

spi_nor_rww_start_exclusive() takes nor->lock with a bare mutex_lock()
and returns with it held, while its counterpart
spi_nor_rww_end_exclusive() re-acquires nor->lock via guard(mutex). Any
exclusive operation on a read-while-write (SNOR_F_RWW) part thus
deadlocks against itself.

The exclusive section is serialized by the rww ongoing_io/rd/pe flags,
so take nor->lock with guard(mutex) like the sibling start helpers.

Fixes: 03e7bb864d9a9 ("mtd: spi-nor: use scope-based mutex cleanup helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..8bc117b46e02 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1310,7 +1310,7 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		return false;
-- 
2.43.7

