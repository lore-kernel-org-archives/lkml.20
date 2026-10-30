Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356468;
	b=yMNpHx9eRv4bsirsNxSv5wabXQryAkaxHT3MKWmsdZj73IH22UscTBOoNcPekQ15wmMe
	 t5ZHp7pozK5CwzwdC4TMa9GaOtCd0uOnGBjcn9jmWDM0EKoJ7z9foqLZqplydfTDsg5e0
	 GcmicPpeGBZz88YvqSbGyUHW1lDM9SsiI7uu7JN2UL3HUuwbzaDR0gvnJozVNMFMa9YKc
	 oX/LVinqVKFcqMFpqUajagpCzrrynbkoA9Ybncu3ppxQNnjsqaY4LZhziIaupHygsGiQh
	 wbE0vT+qBPrvicI6P7BvS5w7E3Pv86QAfFIZE32rhPMNapir+OtzSTAcbMJ+lkD4EYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356468;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=ICgWWywauF7jNA7531RZHSOsVExrer8px1HakVu8gTM=;
	b=ggdKYptLHvYEdYv2tCKZQhMrYRe3M3ToktzxaAc12RQ9Haqd2TugUz8uuhM+jlD4N9Ls
	 R27pBmY5ig3EvkWeB0fi0+Uh0ilLdtaybdqJKShvtcSEWwCpDfQSyTQLzcaSN31dAYnDA
	 jlX5B3VMSY+zjvyeaxxFJhnc0iLpYH6KEHTUDp/bBht2MLY5rxbZn8h69zxDy4DMgMYH7
	 /dzfaZ93TEOg88uTsI4XvL8oYYf6pcsX+07S4Eb4pM0/LHEmd7pQiCU5dO7qfUwjlBQ7M
	 +KmnS5VzEGJeaIkGQUB4IVAz7cEfP+TaeRqQsNA/DTHMk74Esq4+ybvP3yjze5ZfUeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b="ld+fc1/U";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.104
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021104.outbound.protection.outlook.com [40.107.51.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC47660A2623;
	Fri, 30 Oct 2026 10:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC47660A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=ld+fc1/U
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYvdSEEX36xVTlciGKrWxFhpkW3jFOQHhPmtmkvqhRECLtEqDxv+B5sUrxYupChs5hdch7L6p8dgg34WlfkiHNDsNe3LXfxYNuI15oll2+PEU4lNWHuUSI7O74KpYMV4Mxkv96rrcx4OekcT269ifjO2rkv3I0XtgpjpSQftuBP7om+QHLiAjCIztEJiIIhO5fzoUpUuZAiBrnFLi0rNbV4e8+dZr8Nv+5yN0JoN1WlefTvf/ogOWnJSOe8eVPDlc/q2WSGvThoKP8paTBH24mJUk9IcYgK5vL5/oZXQ59oYON57V8IUeC3ZSrO7wEtcgK0bqGMwbe23Y21EbsMSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICgWWywauF7jNA7531RZHSOsVExrer8px1HakVu8gTM=;
 b=JjHy0M0rs5wkxyrLjzGbAee88LdcWh6MU/8J8FFynTf0hvEWZ5b4Zg+FBw2vT0n7cHEOPz/a+0gdoV95KE6P5UpcO2JD9gWVR5jbDsNvsZt6326NupALkuC2QC6oTlV1XDWPLlq6MizdN6SA22gNGOliOINkS3UZ2d6Q9YcxmG2A8CheNo1qpjsQNiW/8WstKpti6YL8hBkaRk9AqC3WCoqH490dk9o/wwstIKDVVDuEBIA2bw6bYQz/T8XHQp22YO3MNXxqerPdy6MoMTgFgzTIMlHIOpU4Oz43mS5auFYpF7wD1wZ0V1qUezRJ6ruLQUtBeGGhhfBUc+mNA8VmTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICgWWywauF7jNA7531RZHSOsVExrer8px1HakVu8gTM=;
 b=ld+fc1/U74vfvuVUTBQ6IWA+jHhjPM3zgnkbAV5sa7t495NX3iQ1D8k4EcBdag0UCSR28OQrtTlgAHr/Fqj43jzJrqJZXZJ4zHOiNwGbNuxLWlyqF6f9vDkFQ5PrSjmckyq7EtCKXOvRR3ucTQSAVHlMd/2geNp0bPT1f3fe3vca0HF4soXYOFZufwsO1k1lZk6mO9jCZz4tEwHkG2Jtf0GJh2O6cLewYthcuESLJtiZt3pjSl/8fziAKMi/NJ6CMuoeUqcgRaqqbn1RSahWGhcHNzR7PRlwLcsp2ogLHNg29VJlXSp98hho3d2eix4gjYGaq44hXRCgEsQIVuQ1KQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4299.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:24 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:23 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/15] media: i2c: os05b10: split common and mode-specific init registers
Date: Fri, 30 Oct 2026 16:03:38 +0530
Message-Id: <20261030103348.1222201-7-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
References: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::32) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNXP287MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fa3acd-ac01-49a6-e953-08df36715d5f
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|3023799007|6133799003|10067099003|18002099003|22082099003|38350700014|56012099006|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 F6VhKyw7+8RxBlKyKArcBmK6QH+7Zw+UkjUCurulkkJaf9UvsDmg+hiW12t9U3GwKc04TU2CLpN99sGUH6irG199k5hwEWlDFg6AwdxfEan/Mnr8tF7tmGqNfUnj2Zz8OB8XphPFmLnyz0Vc+Yhk1I/V1fEX7qOOALSsz8IK3X3yrEVWAzmJd7EuC9JXGiLLUX2YiYiVaAUGwOtmPysr74WADY2H8U2JXMKlN2jb4IYVk0Sogf1R5/WCB/ULmAtbylRBBm203L0fYIWrP9whi7hOd2xNYtnUy02GJpG3jTiHXuV12gpAsyp68B799mYP2QACR0YloIapJvN1++q+7H68V1nlTtkO2tTFvxLi3tye0qUQLGkp4BUfsQE2JWzabg1F4aw70UJj9MUyUyK3z5E7PuB4+bVUjJFnD3uc5CzMnLbHgWB2PUP4HsNIO0PTsiOaHfrqkxZZN6YqWnDcnuHhWPGzHOs7CO4RaOELIsH7sNhz9CG361Hhi81o82RrZyCMq+SjKVj53DSPHtCdnHfE/iSgP/ZfQMCUcKEhqN34XJYhOMZoBkOBE9EdtELeiVvQkczGlXwT5aG9ijh3MjLHopCdNgNpSqSHbcgtU4Gin1SMBq8ibIICZjniyrkcRPVIv9ae3c6jhTSVbOZB3Y0FG+nwnfgVirWjdD6UcGth3VC4GF7bp6CuzNB2eSUVGVXBbLIU4trkBk+tEHe/SJG/UHLa72Rcgyf6BPzlWto=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?llOoZ6m3berwcVXMnEHTUTY1l/Dc5PjWLcIJMagedwXqLp6mc8+JqZ+rOH6L?=
 =?us-ascii?Q?VpLYpXq1ZjHBGhEAN54pfkq2vVD/kUlqnmD0jZVOct/yHuUggyMiiCfW5oHA?=
 =?us-ascii?Q?ItZ1EGwtfX0Yc5xf7K1zZp6ROc8R2FdUAXaXEyTxUFku6rdikBlFSYbV/T7g?=
 =?us-ascii?Q?GYZexjeNlGySWwTAQPKnrBnOtOySuVwxrQfuazEbcQbrYoTKcojLrBW0ZwBg?=
 =?us-ascii?Q?NdgOxQ6gr4xXm0/lPLLTTgqFSFssX7Br14063btPHSKqQlmATPral7tR1J2r?=
 =?us-ascii?Q?gaIdl3LD9jBZFFDfdJNBt8habo7AnuoEfKHxi8F4tJRagaqg82FpB3fzq7dI?=
 =?us-ascii?Q?owq1esVOHVGKe7Ue7SCN3UEyKnomSC2jqUehzhLmv2wXPMIsCdKvlCJYuhaO?=
 =?us-ascii?Q?iVvxh6nnFtB/JDpota9h4rnHhT6+5r0ehePun+XKKCTR8l/3RMUb1iBy7gSh?=
 =?us-ascii?Q?wi4pJuNT+58TbBPkpOoT72Ib/wucQ7GA5E0c8RtrZko39m8mY6IaqyKuaQAD?=
 =?us-ascii?Q?zn+eLlrhC/Z4yuXTRYGmXseAPDAWlwnSj7ean9iMjB8u+fjkBe5MTPYVL5Oh?=
 =?us-ascii?Q?nZ0lKb1yrCsxLULPK1C4VQGbFlgG0jlxC0Ansy6kqQMyoQhlWoTHWSNrBSgj?=
 =?us-ascii?Q?9Wmln+VMZyupgIAxZWjeOcqOkmwUIZeLg7Ew4lc/pY0hbOCTbwSyFUA69aTO?=
 =?us-ascii?Q?cxW9998ZFc8I9EqEHn5i2VqllWKMUNDqyTxROzmnNfcqZIVXWhFfwdBKZS2q?=
 =?us-ascii?Q?aXR3olom+yjfSJ2xbTdcAZz5Hgw+ceKSEYz/ClbV0bE8TmWtolAIrCVS5yRg?=
 =?us-ascii?Q?E2FYlvhuihunDuvu7TK0hhi3pKtsiWsPtktAYLAgIu0VXfOf/VPqJnCsDK1u?=
 =?us-ascii?Q?wIDhF/vU9z6PaPmvrxXGqoZFbsOIf0pgET90Qv6ScayBGd9lX94fX8SmxGcB?=
 =?us-ascii?Q?A5j2rLPHUctREI++YO2P7GDTRUDg8Q5tRVSEUoByF/xbHddEa6fpbGBTvOV+?=
 =?us-ascii?Q?fsryPUYtyvDi6Xxs2qOLqZaNvOd4zjAYIxh2nMBLgmkxoLSdnS7c0tCbZtzD?=
 =?us-ascii?Q?1z6GtgfrpR67PS4lqvjUDe9zfygfwVUx2ECcm2cfePee1YaHYzkWDjgy3pOi?=
 =?us-ascii?Q?0D3mff+bz3o2Gl0hhuVocpVICarTQY+B40zNPvC5VuFDh3y47+AWv03x3hvw?=
 =?us-ascii?Q?wkh0hChmWC9DSrNOmtaOZGhYoSjaXOIW9c+/J01WkWhhCqdaNi7n0jiRg14P?=
 =?us-ascii?Q?kk78yj0GpEoDIf97+21OSmbDbLjrHXYbXpUTgPTW78q+gDbgGAoUcLP5l1Z1?=
 =?us-ascii?Q?MpUfXDQ1Qb/FRKr5wIZTwDL2VPWd4cCK1GkAJaBsalEe/jBdojLZ6d9cKajT?=
 =?us-ascii?Q?1Q/zZfM641WJk3ucF5te7i5S3uTvu1vBKiTs/T5H2+Ng2mX87QlFzxIg9uHa?=
 =?us-ascii?Q?08gLTXffvx1e420WVstbqLLlo4JZ2qeWXDmDnFZc51OGvaECpsVXFB6/EdNi?=
 =?us-ascii?Q?3+wfaymdFR4dFfW94IsWRtcuHwBicBdU5neKbk+OqzGlgmA+DXuJD0GYCMsk?=
 =?us-ascii?Q?nOf2dsXHytNSI1I63XRrq4EVIFkzJbz3BHYuCjm8jA388gCkxs9qTNRww7bX?=
 =?us-ascii?Q?Re4frtQXb4M3RPOH5Fvsb5dsK9yZXNDG1SatMY++Bcx92ONz1xnWPvlzjTzd?=
 =?us-ascii?Q?tvUZ+o/7a3rKxs8IzrhFn8UylfzsI/vmldy1uWUueGZbO2kv0VT/Oc8H8Uoz?=
 =?us-ascii?Q?rTcK9tFZJEX1dbsGk6aif4JQC2nd/jo=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fa3acd-ac01-49a6-e953-08df36715d5f
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:23.6645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6brZdfXON60jE79PFgmcF5+BbU0CL7PjvpwMC+RVwqIKqByp7dputwVqTpXIDBLaIyBTc6kdvKqE6fJVXzZkQ/Gspgnk8hhQgni4TLhJhPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4299

Separate common initialization registers from mode-specific settings.
Move resolution-dependent registers into a per-mode register list and
program them during stream enable.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 96 ++++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 3f478bad1fbc..46d514d2a479 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -138,16 +138,13 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
-	{ CCI_REG8(0x3610), 0x87 },
 	{ CCI_REG8(0x3611), 0x24 },
 	{ CCI_REG8(0x3614), 0x4c },
-	{ CCI_REG8(0x3620), 0x0c },
 	{ CCI_REG8(0x3632), 0x80 },
 	{ CCI_REG8(0x3633), 0x00 },
 	{ CCI_REG8(0x3636), 0xcc },
 	{ CCI_REG8(0x3637), 0x27 },
 	{ CCI_REG8(0x3660), 0x00 },
-	{ CCI_REG8(0x3662), 0x10 },
 	{ CCI_REG8(0x3665), 0x00 },
 	{ CCI_REG8(0x3666), 0x00 },
 	{ CCI_REG8(0x366a), 0x14 },
@@ -231,7 +228,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3714), 0x24 },
 	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
@@ -240,7 +236,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3730), 0xe1 },
 	{ CCI_REG8(0x3735), 0x80 },
 	{ CCI_REG8(0x3739), 0x10 },
-	{ CCI_REG8(0x373f), 0xb0 },
 	{ CCI_REG8(0x3740), 0x28 },
 	{ CCI_REG8(0x3741), 0x21 },
 	{ CCI_REG8(0x3742), 0x21 },
@@ -286,8 +281,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
 	{ CCI_REG8(0x37bb), 0x02 },
-	{ CCI_REG8(0x37bf), 0x05 },
-	{ CCI_REG8(0x37c2), 0x04 },
 	{ CCI_REG8(0x37c4), 0x11 },
 	{ CCI_REG8(0x37c5), 0x80 },
 	{ CCI_REG8(0x37c6), 0x14 },
@@ -296,7 +289,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37cd), 0x17 },
 	{ CCI_REG8(0x37ce), 0x01 },
 	{ CCI_REG8(0x37d8), 0x02 },
-	{ CCI_REG8(0x37d9), 0x08 },
 	{ CCI_REG8(0x37dc), 0x01 },
 	{ CCI_REG8(0x37e0), 0x0c },
 	{ CCI_REG8(0x37e1), 0x20 },
@@ -309,25 +301,10 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ OS05B10_REG_X_ADDR_START, 0x0130 },
-	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
-	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
-	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
-	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
-	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
-	{ OS05B10_REG_HTS, 0x06d0 },
-	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
-	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
-	{ OS05B10_REG_X_INC_ODD, 0x01 },
-	{ OS05B10_REG_X_INC_EVEN, 0x01 },
-	{ OS05B10_REG_Y_INC_ODD, 0x01 },
-	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ OS05B10_REG_FORMAT1, 0x88 },
-	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
@@ -337,7 +314,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3829), 0x03 },
 	{ CCI_REG8(0x382a), 0x00 },
 	{ CCI_REG8(0x382b), 0x00 },
-	{ CCI_REG8(0x3832), 0x08 },
 	{ CCI_REG8(0x3838), 0x00 },
 	{ CCI_REG8(0x3839), 0x00 },
 	{ CCI_REG8(0x383a), 0x00 },
@@ -358,26 +334,19 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x38a7), 0x04 },
 	{ CCI_REG8(0x38b8), 0x02 },
 	{ CCI_REG8(0x3c80), 0x3e },
-	{ CCI_REG8(0x3c86), 0x01 },
 	{ CCI_REG8(0x3c87), 0x02 },
 	{ CCI_REG8(0x389c), 0x00 },
 	{ CCI_REG8(0x3ca2), 0x0c },
 	{ CCI_REG8(0x3d85), 0x1b },
-	{ CCI_REG8(0x3d8c), 0x01 },
 	{ CCI_REG8(0x3d8d), 0xe2 },
 	{ CCI_REG8(0x3f00), 0xcb },
-	{ CCI_REG8(0x3f03), 0x08 },
 	{ CCI_REG8(0x3f9e), 0x07 },
 	{ CCI_REG8(0x3f9f), 0x04 },
 	{ CCI_REG8(0x4000), 0xf3 },
 	{ CCI_REG8(0x4002), 0x00 },
 	{ CCI_REG8(0x4003), 0x40 },
-	{ CCI_REG8(0x4008), 0x02 },
-	{ CCI_REG8(0x4009), 0x0d },
-	{ CCI_REG8(0x400a), 0x01 },
 	{ CCI_REG8(0x400b), 0x00 },
 	{ CCI_REG8(0x4040), 0x00 },
-	{ CCI_REG8(0x4041), 0x07 },
 	{ CCI_REG8(0x4090), 0x14 },
 	{ CCI_REG8(0x40b0), 0x01 },
 	{ CCI_REG8(0x40b1), 0x01 },
@@ -397,7 +366,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x4305), 0x83 },
 	{ CCI_REG8(0x4306), 0x21 },
 	{ CCI_REG8(0x430d), 0x00 },
-	{ CCI_REG8(0x4505), 0xc4 },
 	{ CCI_REG8(0x4506), 0x00 },
 	{ CCI_REG8(0x4507), 0x60 },
 	{ CCI_REG8(0x4803), 0x00 },
@@ -409,7 +377,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x481f), 0x30 },
 	{ CCI_REG8(0x4825), 0x34 },
 	{ CCI_REG8(0x4829), 0x64 },
-	{ CCI_REG8(0x4837), 0x12 },
 	{ CCI_REG8(0x484b), 0x07 },
 	{ CCI_REG8(0x4883), 0x36 },
 	{ CCI_REG8(0x4885), 0x03 },
@@ -442,6 +409,42 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3222), 0x03 },
 };
 
+static const struct cci_reg_sequence mode_2592_1944_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0130 },
+	{ OS05B10_REG_Y_ADDR_START,	0x0000 },
+	{ OS05B10_REG_X_ADDR_END,	0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END,	0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0798 },
+	{ OS05B10_REG_HTS,		0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0008 },
+	{ OS05B10_REG_X_INC_ODD,	0x01 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x01 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x88 },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3c86), 0x01 },
+	{ CCI_REG8(0x3d8c), 0x01 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x01 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x12 },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -464,6 +467,11 @@ struct os05b10 {
 	u32 data_lanes;
 };
 
+struct os05b10_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
 struct os05b10_mode {
 	u32 width;
 	u32 height;
@@ -471,6 +479,7 @@ struct os05b10_mode {
 	u32 hts;
 	u32 exp;
 	u8 bpp;
+	struct os05b10_reg_list reg_list;
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -481,6 +490,10 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 		.hts = 1744,
 		.exp = 1944,
 		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+			.regs = mode_2592_1944_regs,
+		},
 	},
 };
 
@@ -652,8 +665,16 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 				  u32 pad, u64 streams_mask)
 {
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_reg_list *reg_list;
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode;
 	int ret;
 
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes_10bit,
+				      ARRAY_SIZE(supported_modes_10bit), width,
+				      height, fmt->width, fmt->height);
+
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
 		return ret;
@@ -666,6 +687,15 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	/* Write sensor mode registers */
+	reg_list = &mode->reg_list;
+	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "fail to write initial registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Apply customized user controls */
 	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
 	if (ret)
-- 
2.34.1

