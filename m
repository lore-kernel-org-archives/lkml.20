Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720324;
	b=ViTd6qFXebBMXRuodvfwVzC5osbXo0C03mCJKRNA2wc87994Kzb1xhzMiMGP5ljTo/Ol
	 ztJvKwsYPhyrAgD+CCRRlQ1kh+vm5BODRltg+iY4s0g4xTW++H2uoFKvegvOC7Z75+g0X
	 mG6WQx5yN+c4UkxwfpTk4Lm8Zcn7WWsMIZOUXZtYx0P1pDYkDO9/5kcBfjkz1kCrCqGSF
	 dg8tzyD01aovtE0URojyJQuGY4sBiK+KUD4AUj0+lLRyxFlfsovxdEVWLwFo2JeF9CwcH
	 tgkZtIDkPRRo1P19SCPYYe1hlfMXvqXaSYszfThJgA/AdGPEBfkSzkXGAq1Y3BDOEKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720324;
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
	bh=67AnjI0FbYIenr3N4R2JFtylitU1GTsn7TbI7XgE8vA=;
	b=HQk9eudkDGCFSgO4UmBnLCsy0FYJ94I85lPP/1/EH4jokSvBAMO8ZbeYXpOKfXDKtylf
	 HYBn1x+ttM86sTCGz7/M+46VsfPmcbixjaMD3PdYBKyC4iQ/kV0hV09t0ZCNwmdL5l+GR
	 cJjowT4uysy7+z7opGDJ7KtH2pQ+aC2yS2Vkcxyfqr/X1kYV95pyNMFPiJK6/A3JCwBm5
	 LQgdXUK3cJJ81QFpqe3i9n6MPmMfpP6cKhZJ/P/H4MSccc/uPCqKQpveZlhxnh5sF3x98
	 Ma6Vn8HEt7XT843k56aZjb58LCM4L0UVdxpoQdIfmQHkM3qmUK+Q60FZaUHd1Qd4mlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kBejKpgk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.6
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5DB606A329;
	Tue,  3 Nov 2026 15:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5DB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kBejKpgk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfXDZ3elASAt9/KHghhtwyavNGvXamW1MahkzoB8M58WHof5dwfgBtref+2YfMa5znP6lbuM/zlGegrch19B7M8H3J3u7fzSEyatLzEqbjqxPRMXfWxVqaTwakL+i+SQg25CZv6Uah8cS9YF7X79J3jHWcFTMExcdOWVxqGv6P5xU7/ZbDldDCT5/N7Wz4LpLQ9IAmSRZUbAzqPZlMaNKu+yPyUtwQBOwm84uuR04ecxlJRdSnfdQE0pYcP5dH1sRUpbOex4m3jlNfTgor7HrN6Ld79sB6X5RqYKKu4D3wqDECmVeht02oTZANgvrOnfJ/1CD55tvNB3h7NfDsyFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67AnjI0FbYIenr3N4R2JFtylitU1GTsn7TbI7XgE8vA=;
 b=FLHGcZzIv4up3J3R2nzFZ6ppTqUVKM4dlFLOkSIy7rS9UwMcoMMuIJ6aoaVAOcbVRBW7YQO5t9FxCRdM60Z5BgVywB/cnaMezsXz9TGKVE5eTNm/zgxVOBBNK9ug3aZS1EHWI61PIaZss87MF5n/vZgsQ51aHPB2a7niV9Eg8iBu51MrnYSc+VwgG99YZsPAHnH1mfw5En6oaNPwGzuxEoQy5NvI6jrC5+ra5VnloUBLoF9chCrWclQv+XpnoiPatehOdFx0XgqHprRKxeAy+TR5X1MP27OkCyoA7oF3MeoSU0tUAwyOCzwMn62Dd4x/W4bUAxLyE85x3evCxIccSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67AnjI0FbYIenr3N4R2JFtylitU1GTsn7TbI7XgE8vA=;
 b=kBejKpgkeIBYKbZlOjD8fH4eywmmuFperveIEycaOa0JGtg1NiTpyrZ4JnmS+0xDI43rOvZ9RR5bHweitPjMDtLkjTG/VtzuAtQULPUxWIJCEQ0ZxA7wm85Dy0mzRzObnzGOVQDAGfUrAay50wBIiMTL0FSt9H9QoeElD2KjwbFE2T/DJma8jU1RI62nYUlDRJXR5MsQX88g735B9OJzbnKpSSCevHjvd2udoNGftN1myX8xmn5wA9nEUWpQxly+FjpcVq7Dhahnneu0Wr3i0eCaNplszJeugV7mXHfMuZzccHBpAK36bTpU1UjVSOjirtegYAaIFZrDV8XElz6jUg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6994.eurprd04.prod.outlook.com (2603:10a6:208:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:38:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:38:41 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 9/9] media: pxa_camera: use cookie returned by dmaengine_submit() for logging
Date: Tue,  3 Nov 2026 10:37:09 -0500
Message-ID: <20261103153721.1232488-9-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5613fc96-2424-476c-70b3-08df39c089c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|18002099003|22082099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261026140227099003|261028144727099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	GBs5X/UPKpIdzMLo/ep2ymzZPKKs9aLX4vopYXS6MiRHNP719390geUBOv5M3J8E1pBtvNaJbeTfwxp3cKazeBnSu4Os4DDIzsh6xb+ALihP+NK/sxPe5W5QjOCEldyth2Lpkr17HxAvW8MDEugOfQ/iTYcFrZswTJJ1p/KgPZJWGKjoHsDQh4ezXr/SRk2dkJ5eU81TDvPiqQaz3WCX4M1A7hmaxX+JfZFB3lpor+EKaW1E7kNVgBtqDEKPmH+KhbuI6L+D6bMKu00weNeLj8dHhan+xP9QIymXI93q8Qw0JzOrhzi8fb3G1Enw/5QU507N1cnOEaFWM+bFkPy21wDx9oX4VCDYIKlRXvHGiTAH2Azs/tO6QGmsjHXb/+JqiRrTUOTkDpRUCwmlyH5jkJbWnoxOE0nTBw4ITQF989fgx7VtbuQsHRC/AtA4YK3q66Nw4xuqhpordNEJQFTsnhulwQKINGnN0+pHPwPTueJd8pMvXXe5gX1TQL72AFCmxRIvz9mliKTkVZ2UGiREaO7Su6pFqnUacrLHpo0C7sNGcLLxpaTOrYR9PlRQhBwvTYhTn8/+4aQDUDWnpkdNCv8eGEHf3PEecLCCBT5ziTVqXThxuMX21w16POjDgPVW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261028144727099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yz+QzXifM5+zLau2Lqo9WjVXgFJV57Zk82lyAwf0cnO7MahApOBEg2NndMPz?=
 =?us-ascii?Q?/6DnEvdjj42Ek1xudSqgNSReSDWZJgJ/xDd6gDJrFV4+1sDhMDzEMhqJn78Z?=
 =?us-ascii?Q?slPzzOgEbYZTxqtXqgQiliN2vjLeCnXySE7iOiHKOM3Bv2JSmWOjZjmc4KQZ?=
 =?us-ascii?Q?jGwQ0lJ3+Mh6FeyfwmGTXtALrYfiUZVctFwl52y25w3qt1xNYTAqlrDw0eI8?=
 =?us-ascii?Q?akByqolDDCP0YW8F0/5A+1wt/Fl4e8VcP1Npk7x1Gduwx4w+uT2mnmDhl/Lo?=
 =?us-ascii?Q?ge6TkofgQwQf0EAfiRQUrFCFEq2CELYX93tr1QEpYpMp/NkmMO3XAipUHx7J?=
 =?us-ascii?Q?IUM7n6+OzsahUxcsM9+TCtjsZmXxt6kQtSO4quusKKvnyVmWU+5uejthpkU9?=
 =?us-ascii?Q?C4kSFu33hXBl5eol8oljeL9GAMl2UtQan4juiNlfGmeXjLWvJvutCodAf5VE?=
 =?us-ascii?Q?Shqrs2srE7UKyybgIeFZJ+lD+LITSfiSzgdfsWdWoHs/bBggfb4IBuyi7lX/?=
 =?us-ascii?Q?YD+JmGSFVkc2S/ygGI4QOt+7d60qQMB7WjK8qEYgVp/+ppZsPErhpEdVQeyu?=
 =?us-ascii?Q?Z5sLk/FPmr88EzsaVzfMabndTNkVWWPYilrqVY8l13OEJrPcm+Zw1FYYpNsC?=
 =?us-ascii?Q?54mZ9/SOOMb8D/PoVb8MFN8sy9y4KhX+6mrI91gN8XhPC/YOPvX31zuWyLvu?=
 =?us-ascii?Q?all2hr1jNIn0wM1XJosx6KmZ/Onl4QsHccAyioYE9C8aeQg+AeCpTJMwDuOC?=
 =?us-ascii?Q?uzQh7juhA73T9yKGzvIwJi5ejbTEALJr+ejkW0a4m5e6IFj0GnC33VGZuam9?=
 =?us-ascii?Q?Q9uMQCRnH2Zj2LDPzId3YNCvt+h79FIZ4fsegA2AgIF/NrRkoVATe5iH4ygn?=
 =?us-ascii?Q?DTkJdjh/+iWPrPhEiOgcra8MTjEnWwsyYjD9QugEmJ8njk4NZ9TgrrC+2g0v?=
 =?us-ascii?Q?GfobciD1OGMdM9m60kxU2Q/iQQpfBKh5vnY8R9JrqLp0Nkrnn2Jt3OhAtzRS?=
 =?us-ascii?Q?gX4Tb9MZd0YQcB0xoCpmXZifSvrw1gMnsGP/70uR3w1QQeZGM8Ru+Wk+7vCq?=
 =?us-ascii?Q?Z4ijgegIVycVQ2XgLzsSSEzQ1bXngkLHw95OEtbv0szH8LRgkHRoHHa7cVVG?=
 =?us-ascii?Q?joPADeEEZLX0IhQsinuSnDBus4UwB+xKrWFV5uBPRs78bIr88dQFCw2omWg6?=
 =?us-ascii?Q?nzxFKrrugntEi0J0J0si5ipuA9yqxgXvRdCdgvxVIOjyIW+qTX0E/znD6OVy?=
 =?us-ascii?Q?NyScZEYFsJJek8nlfFSZzUSWy73k+7ilXCkBX+4gDkUspO9WT8LuBvh2Wtc7?=
 =?us-ascii?Q?oaTWrc6fJVHTuV/IPwmXAZXyxYxFtik8/7UQiPCbGV/eZn8s8ygkthkj/fSD?=
 =?us-ascii?Q?OQ0Lm0VXJIWApvnISfFSHLtXogic7SdMCu8DEzVHIOnmfHu0rL05fNhgCihf?=
 =?us-ascii?Q?qQC18UWJI4IBeWcjb1V10eoxxWamO/f7nvIoon26KJw8jdRgRENIS1fDdC6K?=
 =?us-ascii?Q?iyEyLOytzkXPFUuy4PwWnfHU4WlYJlk/2sDvIxZCNvQMf45XyVMCzy2DltjA?=
 =?us-ascii?Q?1a+Mw0yh5DhvAV0IMNOP7gb3cvXiqub+JXS32BjIlqy85WU2VYeWioKX6KPy?=
 =?us-ascii?Q?QcqJM2wwJ9GUXdWhmC3n/T2mkfkjBXpFj1305VJp6XqEkq2ZE1GxYTxU67mH?=
 =?us-ascii?Q?7XvzDfHug6katxMKHy5fGl4Ov79ZpRoMloRsOes/OxHLLrgp00AMMJTrJE2s?=
 =?us-ascii?Q?1UjLK0uQOtiKkSYMNB9KAZ0VAcEY+ngGLshb5RmosLe6ywvarx+U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5613fc96-2424-476c-70b3-08df39c089c4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:38:41.8452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKk16qmeCIrjAGWcC4YkrQLzR+8W2u+We+ctToKLXxTurVCTzkLEoqHoaHpDpZQcmSbzFoihWC5ubo1BsibtyPGgroezAPuLGGxv/WF8nGkzy9AUVUJp/mH5MOCkzPR6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6994

From: Frank Li <Frank.Li@nxp.com>

The debug print in pxa_dma_add_tail_buf() was logging buf->descs[i]->cookie
instead of buf->cookie[i].

dmaengine_submit() returns the cookie and it is stored in buf->cookie[i],
so use that value in the dev_dbg() call to accurately reflect the submitted
cookie.

Prepare to make struct dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- none
v2: https://lore.kernel.org/imx/38f6a9abf37b06318bb6429ac04807941ca8d558.camel@collabora.com/
---
 drivers/media/platform/intel/pxa_camera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index c9d57e4245181..d41cca2b2d8c2 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -903,7 +903,7 @@ static void pxa_dma_add_tail_buf(struct pxa_camera_dev *pcdev,
 		buf->cookie[i] = dmaengine_submit(buf->descs[i]);
 		dev_dbg(pcdev_to_dev(pcdev),
 			"%s (channel=%d) : submit vb=%p cookie=%d\n",
-			__func__, i, buf, buf->descs[i]->cookie);
+			__func__, i, buf, buf->cookie[i]);
 	}
 }
 
-- 
2.43.0

