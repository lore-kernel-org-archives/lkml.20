Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356457;
	b=sRdDPz45xB93gu250m2P2fQ61Ukc1L7/EkMOqsHu9Y+e0jeWYtCL64GnxmjmiMic1xwC
	 ZpQNhhhLSeKO/tYWsv9x8LozGJpBItQbgRD/N+zy7LP6xhi92DqUMdLjM0ALGF37tqk51
	 rYoKmS2faLC+wN3g0u0/LLrdkir7p/qRt1A0uYSHvxbq+Gl92qXyXCRUgFfAcEpk8qPGc
	 QoGmNmPnDVHovqJYZSi23q0f/yOxWPw8XpiAX/q/c2fC2DLRX8IvukgISn+qeLifdKL1e
	 Spy0PFPNfM/CgXX6YhdlEqlvErTQmwq9hlrFw0t9z1tbiIt8YcozbXpEotHopy0/x1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356457;
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
	bh=D6FvhZ5+At1ZrRQr11bWTfcW5PI/WkQqodL9x0y200M=;
	b=HwYS7hhGXh5zg+QHNPrei4F61rz2X4GBNKqA3YfS9K+68e7/XJ8oM81hcVWjztqqHjuu
	 +j4S9IlOyrkHOHw37bRuFzR3BBvjpsqrjLouWlJEx2nA330tgFj7PGDHCQjcOAl+Hll8G
	 B4OItnzYZsbFONViedTD1R90XnFPwI5jx37z7BcAlX+ORfW/tScAWTWiR0BzspRjlfkp8
	 KA6hiHIHE4h6lkiKVGCNoU8FFTBqsmnjblEf4dqF5o66SrwjzJRk1JkuwnVvJceRVDpBT
	 b7zypgEiKSjQF2GNCThx6Aau1iahYS2oaqZWZDxYoITtU8gFbacDQpre82+MV6IWdCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=GebrxzNk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.92
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021092.outbound.protection.outlook.com [40.107.51.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ADD606A31A;
	Fri, 30 Oct 2026 10:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11ADD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=GebrxzNk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKkW2E3QzfqJzbWj+QalBQnIGwQ7q045UAAm9KmLi7ySS+Fd0ovmDQkw+69o1qtM66dIBH102GXDgQE3NIgpN1t9l6+p+T2TIPv1xu+5kpetP6dt0qdIb3X0XBAQX9CKl7Yaal0G7Bk/6Uh++bPWFPCokB8HF2ft7GdSbTYXuyZd82tZDmFpIeBoEsIm9aeIT4LIfdoUHpY07uEy4YV7s1+l4c9oXtm7WdRnegHr1Y/DE256bfbPSLqhI2+8wdHXgIE7UwiVUT3HoSjo5f1446KvHx4iWKqCGM0+JJWoTS9F3rPWIcO+DdtbpTRDdFiv2zE16fcDYBni1AmmTGK7gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6FvhZ5+At1ZrRQr11bWTfcW5PI/WkQqodL9x0y200M=;
 b=DIOujgnFypEPiJU22MpMHlHKbwL4+ZHr2LpPBkomz4lWYRWasxC/eG3rdD/97e7wsFhhrW3c7q8++HnZRyWtx6Jx9+LT0ZUMhWRiB78QUy3wOvCEwbd/c3bjKwcE53SWPVmUMaUhgXS7AY9147XR5/H5LO9DjAC+EtqO03bzOWE4F3rnvb1DrhWMRygwtjeiwFE/YtEAjtdIZuUYd3psglL9dPrpEf1CN2s5ExfF+VQWELTMN3344QqW1yWZPA5ktiWTr5AM34wN5S7+9ZOzgoWkYOXs6YcdTbkBrM91Q9BrMFeJtyKehPhzTqaz7keY290woRMCV8kiAlHHH9SZ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6FvhZ5+At1ZrRQr11bWTfcW5PI/WkQqodL9x0y200M=;
 b=GebrxzNksybzcZcYiJDdZrd1ZkOdYE6KUf0IT41L+3gGZo28QzB85xN/zqjJduUrsG++HyMaYpRUGaC89RzXT+Au4wSO+sbTeOjU+jwDno4fr55v6X59U16nGN7AhoIgVGix1cUm8WsNaXaot9QTri+5j0ZLPyk/cE77kaY61nN/02Zv0Qkv4lgmKzfx6MHfq6+fuWfZm/Ky2cN6GFd0Cq4iKUPOaL2kiP+F4IxyPW9ujnfgYgEClHIl5DoDs24xhx/dUQz1nSxpXClqofHtrFaY3E2gjZPTz/GFBs5izKTBmQxLBsop/2IGArKUcXyzmXDSMfolFa65dYe+3qd4sA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4299.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:13 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:13 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/15] media: i2c: os05b10: drop unused group-hold programming
Date: Fri, 30 Oct 2026 16:03:33 +0530
Message-Id: <20261030103348.1222201-2-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 6c62391e-8850-4f8c-4044-08df36715712
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|10067099003|18002099003|22082099003|38350700014|56012099006|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 ogGo1muGt8PexUXw68wTGK71t8UVgvnmSphzleb/1cO0dPxZqVLtc2BLnrVg9oB0+0qnjMkyOZ+FSzMxOz/KAFqCM2rNeisFm4ai33FdA6Xz1dCuXz9PZZcSviik+aXiuts4eBkNA8DXHazJc/V9s/rqtZVmiPCiIIN2gLmIwdfCGoX4lFNk9zaHSFaG6qbooDhOoCT9bETDtb+gvri/65vyuk5uak7IBL9G6tYhCuIvho5KTSRgtWvRVF1idReA7zmoe/bCHOUKmcwMOT+DkE71QMP9Thq2IwRKHPvEim6Z9e+sWb9Xsq0G49V5KpP6TaGsgVFVWRnxwdd/fayKbeLillBzpL/KPBSZkabRP/pgougQ3p1TnhlTqsyji6XO4x4jllPCr9DjIjBYva9zwmgqL1HTXUpwBy/OfzxCsJzJixp2AMHJAtDWUymNszJ3ln/NCQBKfqYPDm7ng2oLbWFZUilmlCRuD+UCT+tNRDD/h6RfSmG1VD8rqTNkCUwRuV8mK8OOgUUOVf/13urMzklx1qPXrmnqWOy7W+z4aGPMppPvMtLqpzArdmNtqmmwAGLDwSAyCx6uhMrh+ukr12y5nKI5iRW5Dl6eb+GcNUY5xFQ2sSE5X2qRU0toBJyg/1EVtX+NyGjRiq66xxHe/vzWH7WBtnnSNfsMuZ9JyLrnUPfbx+yEnGiZxUu9xJ5NdZVI1kXg3INvBSX7yEt0idxPucljzYulDEpCvq/yAgQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rqvgjNG/Defr4rEg3AqTTYqQ8Uq5MoS1rgmCeuM4rnKPK8PcNQLqUwGjdJqD?=
 =?us-ascii?Q?JhSCNB4EuqCOfZt8RNOPxzInUYPjs+LjKUhUDCSD9yPaEKn2sDICJkW6zWe/?=
 =?us-ascii?Q?gpw7BsjPRh+i6Yj/UDvyPukbMKdV+cEMvkXDXQth5OwzT82oCegXlYxQNLGF?=
 =?us-ascii?Q?SVmepB8ZVrM/46xc92FS5eEk9zrm4hoxdn1RGaJVKOCMBG4WAHb4DCoQgC5B?=
 =?us-ascii?Q?CHHUF2g6pwjEj/nt+3otYSaJaZeGczge45qY6BOc38uKoVwdjyapiLr1VfyP?=
 =?us-ascii?Q?1RH1Fb5skMozGmmyBz1JGAxL//iMYGzdxpnAfWhNlaiU20ys1hMSj+t0bv1Z?=
 =?us-ascii?Q?xeEz1CwjeCq7KZRi8Km/PF2Bu/lmeNOk6+A8/w0ivpXS3p+JYcLZ1sXGAnK2?=
 =?us-ascii?Q?MUr3Oe+r6zfFspD/UNoxSNW4pUXalsCQ/qifC5HkRGn/cpDrf/iVwovvZtdS?=
 =?us-ascii?Q?iaXicUOmW4cpmmDwtS6uxjnkzf3aa5U/Zow9XTMDLihHkyaUy15xlABvbWZf?=
 =?us-ascii?Q?msT9XXBxp7mAzwRNQwMCYB7aXTNNGL4WARIbXqXnXDaXm7XAp7erkOWqsepg?=
 =?us-ascii?Q?pmkc/Q9+FQPjLygv6mEqc3hvxLQwD9cN3M7xBOWzbtTwr9fSgNEumDzFIiWI?=
 =?us-ascii?Q?F/uSKA76/nzHqsqfYuTdfxgyJG2LDq1S/baVl3c6Kw4aZDxGUK5cgBtOk5VW?=
 =?us-ascii?Q?+ELeOsmIJA5/JL7FwyRjZECeCaeS1exQjStq7hz5ckGBkzGAvLrdc9CNsNEB?=
 =?us-ascii?Q?sKoKF0XVToLbumzK1t++H2oAuPdWPcslzn8hhRIqr1u+9v62Kdikin9bQu/4?=
 =?us-ascii?Q?yN81gg3Lv0tw1wuwq099jEEggzZV1ATMeG5w3nK9ccDcxl0qKX1i3FG924Zh?=
 =?us-ascii?Q?4WThOcIXdRhj24JK3oPYBSBciSgCJvCooIVNim36rMGq6hR1vX1H4jafhf9L?=
 =?us-ascii?Q?YlVMUSBH2Ysp+1SuMOfbtTrdJjT2HzGogb8U/qAkHA/UVNHv38jYwC4/Kjdr?=
 =?us-ascii?Q?YHH+UM5N1a8dTXsp99t2vhDawwd4qFSixlka4BgMhe/nGSfQyGmsdCPzUCpx?=
 =?us-ascii?Q?CBCtH7HNPksZdWzPAq5W0HweDZQGQmbZzg56QvQcGGCT0z2D7JQP0FENX4Pc?=
 =?us-ascii?Q?cFYS/we0exl3Eq++s8eHyz2LWrDu7nHg6F7j220o2Gizz4lkZr+vLG9iZgAP?=
 =?us-ascii?Q?tJ3bAt1uvu3Fitoq4bNmaE0qyUu8bE+N9i6oxwxDuMZwqhlodvi0s6t59QtB?=
 =?us-ascii?Q?bk4oWbPDXVFpUhULKH9k3VHvwRF7SvJBKj4GOv3DOFYp+0jlpvIbNklu2suc?=
 =?us-ascii?Q?uDJNPYh4u+o5ckRGR9EIGfar7wzvO4VanVM/2mQyhL4/e+ZoCWQCQ6KHwyoH?=
 =?us-ascii?Q?bIzYZ/UCqoEnrAMONCzlcqeBRBbIV0kU/6S7jBBWRAaRI6Sd34FOq9mPIG58?=
 =?us-ascii?Q?SPYsWvnPrbmIJKYgUh1w8QMMPm0vA9UG9gIXwBRwNi8Kd8QBgNijyhAcHo63?=
 =?us-ascii?Q?58Pi/hold+XdnY/kcvNaE3PeCZOqHO9C3hvn6XfPr6zCDu2FGAjueJeDt4aT?=
 =?us-ascii?Q?4DKpCMTvflWqZyUYLlE8iaxiQWLZRVdM9/uMVSV1HC50bF42H8b+w4OXBWlT?=
 =?us-ascii?Q?dAK/wvkFqmhNmhFO6s/W/+S8QCY+5MnaA7K1+D3mmGjLDgElbf2avp6mrgqT?=
 =?us-ascii?Q?OUd8o6CaP8nK0+vZW0bBTVWTamy2yJxuKem10ITi0D2ZRzrr3+fN3ygY4wif?=
 =?us-ascii?Q?WF4XEPpz5hmvk7fv/ZoiQvmrCvIDo0M=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c62391e-8850-4f8c-4044-08df36715712
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:13.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROf833TQhkqKd4Vs2vxGv//xawYj3N9sEU8kwK9xrVDYeomcCt5Sb5MOmFvIFL7Yx4r/Pq4Qhbigu7v2xoyojf8i1Nguhl8wOQfBJZ4As+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4299

Register table included group-hold (0x3208) sequences for
groups 6/7/8/9 that only stage alternative tuning values in SRAM but are
never launched by the driver. Remove these group-hold blocks.

Also remove a duplicate register entry for 0x37bf.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/os05b10.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index a46cfa513e98..d5f573b1614a 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -250,7 +250,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ab), 0x0e },
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
-	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37bb), 0x02 },
 	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37c2), 0x04 },
@@ -415,42 +414,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5820), 0x00 },
 	{ CCI_REG8(0x5821), 0x00 },
 	{ CCI_REG8(0x3222), 0x03 },
-	{ CCI_REG8(0x3208), 0x06 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x01 },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x1c },
-	{ CCI_REG8(0x3610), 0x37 },
-	{ CCI_REG8(0x3208), 0x16 },
-	{ CCI_REG8(0x3208), 0x07 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x17 },
-	{ CCI_REG8(0x3208), 0x08 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x18 },
-	{ CCI_REG8(0x3208), 0x09 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x28 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x63 },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x19 },
 };
 
 struct os05b10 {
-- 
2.34.1

