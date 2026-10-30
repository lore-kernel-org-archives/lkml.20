Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357401;
	b=qP64IITxrn7jaa5UsIYJhYqdE0Yp3Uh4wIyN7CHuGR3oFdlzP9VPvDrp8PjvhS3LCKVP
	 CXKn1XAItflRYlSbOOqKOcrwBRUyoU++jAmSfH30RSDJxIS8fC6aGGYrRf6AFo5+/qJxk
	 06KIHAi40EE2lpl/KQNOgJColP93ktVYwd3CgjT/jxa4mXOkiF/57ZLUOLLxbIb+ly6TJ
	 /84rffmu75tKklaNofTKIE9RxjcVYIymrDmzumWMvfrfGvFGexebGjqvO2LoCP0Doz8RN
	 NQTtoal23UQOGV8WYeS01Eu57sIEvK4bS31cf1jet7GjonLjBBhChPFRdm03dlwg8aA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357401;
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
	bh=K1XKIDmrHIkX5ULlUlVJ8YITkOcV6cbBGqapkpjQo4I=;
	b=N4Koj+gPYgaogCUY/Q+2cCctqXEF6lOKZujsQHS/1NlBKR/kIRqYyRI/NdQHEAernmSW
	 PI85Xr6Lr9V95qyibRvT9BKOMSth/6oOjmiKbleaOjxS6rHzEdo56lC947yCFW4ehxmY8
	 xQkQJPfH9crj6AEakE0GN3apFJXNc/0cAXHdJIkCG7nL256GoXLABG9vIUG4J9FOKKSBq
	 1/RBKfrdCKOrSGP61yTcSG5gQj55PTjFi1ooWLodjyGHkf5PVMKP4UfOkUyYCm4K120ES
	 wBFL99DzUt82qP/xGqdfdOc/fw504bW/jI7Vokc7KYD06tvoFC/S+SUomEOBWSHE/BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=chwUjiXE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.103
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021103.outbound.protection.outlook.com [40.107.57.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A28060A2608;
	Fri, 30 Oct 2026 10:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A28060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=chwUjiXE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWkGmlxWkAZWJtPRg5+gQEpW/pe1NUJv5iKJo91k5Z74ZOn/fgdcB/TJY6hzub5EkBHx907fh9UbMUSy8ee23okr2SjG6tEAPM0MyS3LdpZI+yzqyVxJkzTbif8qLFKkm4EVb110/SiKkCn2B5J6gbpPBZexBFZ58aupxDHGjCvOwH9fo2NHTH7GXt3HXor4RzAt/lGhl59LB0LW6zIwa+xC4oEl1zA2Fs/Eyf0y+cbFH7KMaHGBHY96mV8Pw2rV9soCU53JeJNJTb9mZoJL/4fT0HTkz+YXQXo6xSkioutJlY3iXj6D2nwdnJEKddCmiBEqdvwPIP4kO0fj1wkuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1XKIDmrHIkX5ULlUlVJ8YITkOcV6cbBGqapkpjQo4I=;
 b=d6FPDLOyqEtXErR/BPZzsqC5G2mzLsdod7oL/k25ozoAebOWhK5j6sfNSzJIX4yxpGGe/o3nEoOMY/M2dghS12k5AfK4FKUU3ulzRg7EYU/s2oaBeToF74v4hZpSrRe++7AOQdf8icGS6RRcaxzLVg19EWXFwtqCPRJfXxmbdkH6QIUPV0jTmmdcZfHi5wCVLMvLMFS/MrmGw6Ct+zHOndoG1xjF4RmFfb4DsjUqMAR9IvZ745wSgIamLmTsK8Psltu72F0skXX1cfalkM+7LlAYuM0cjgELwJ32AIwo9HqPDuysgSEAqL9nZpQEDBkpQWifR9q1I4c9RiNCufBOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1XKIDmrHIkX5ULlUlVJ8YITkOcV6cbBGqapkpjQo4I=;
 b=chwUjiXEDS1XBKAYxPiJpEOi3P7IP/A09qT2z4JNmzr9nJO9YR1DlkQ0INfPx2oJH7/HRiXrrB+Ya5RKrfQlxXEmoFBtw3+ObbG/izaSclTLyAbqfbE+vrBlDb38jg0mgoxmZGgVhwtTXzUs78JT9qU68NLeUtMqtE7brNTCdOU9SZm4HXEyVijgsAa5+AePBsb6qaWxiW+QZkU01t7VL10fsX6TzsmztN2g5Y7VyTYfgBIN63h8AaZLXBtmckbNs0es5P7TAqFWzvXqjXooiNJTGYtITKvD2WeSfX1Hgv1IG1RwhFqL+d5QKzBzOZQ0yo7tTRR7XDajQPTzEJbEsw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB1787.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::8)
 by PN2P287MB0975.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:136::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:49:57 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781]) by PN2P287MB1787.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:49:57 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/15] media: i2c: os05b10: Add H/V flip support
Date: Fri, 30 Oct 2026 16:17:58 +0530
Message-Id: <20261030104806.1223991-10-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
References: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::11) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: PN2P287MB1787:EE_|PN2P287MB0975:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa960d8-f113-4625-e1eb-08df3673656e
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|10067099003|18002099003|22082099003|38350700014|56012099006|261026140227099003|261022115727099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info:
 c07HBDZ0yvlf/cisf9gYK98khriNY5bhr9GW5rCdW/JOBfpA3oIhZEuwwBSJltHk/JX/+hWqp6EfzavpPFkjUWcWDjqw3XtmkFXYEa9+z+tlz+12tbNVqellismNfM6SMeKF9uX56DEm8FVXLBG5iPn3/2DvDeIkv7+HTABFauMgYtZIWvmF+n9SU4vVKRvOzjEyx8o8ZKA7VG2XQf6bHGZYDEOo1qUyO4ffCzpyDJR2/aPy4v9C6QxTyicwk9urELj9ylcRYrTvHjfq2ypUgFnf7G0MpaLUDWC/IPTUyvF2RUIE8skw3E6qVG8xgZpaIWiyeJJx/7HAu/mzNN736F4LEoFJx2CGI8OpTtgGuxf7x5QN6GaONzZqtu97Hj31p/O6zxF0pRUykDxzDjQ9sCV5eV9/gsXVJwd27EOwgtRtuPQQXmQCHTLDL/ZMAf+YEri6MsCnfwHACijefv3q2Gz1iKyBOoMXg5V2dBjr9zJYcAmkmBYmNHXvC7L4Dtn/KHwb80xMbTzZsCAZ57i02bU20OCOUDLmZynDtnjBkN8AK5QC4vP3TOa8si0hi/jJQUKyPOJV7JQFlRE1vBCMlBeFbzkOU+iLqAdKVuYcnQ90UfvcBtaPl7hM8ju0loXgylS1x6b9lwCwBm//OpTZPRE907khIjAnS/bBKLCGUhQ3aNi/yq3Pd/qmNbhMs81htJCHvreXrE4osh/EFf6m5xi8/RjlnorZV7i5VRabYbY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB1787.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026140227099003)(261022115727099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003)(261009221227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?j6gauE4NbX2+N3+maOmcnNf/d2C96JpFtq2fLN+/kOuqnE90FZTflhYhqcDa?=
 =?us-ascii?Q?4eSjmHaSY+D+dozDGGRUXqFUV7z3G+bQMR7kX87PgDohWcQ6kVMZYQlFlZjf?=
 =?us-ascii?Q?iQfyiQa2E24IJaHj1/eE7RBvf0hlydg23Wi+08kDbVLJ3Pmh0UDaVUe74la6?=
 =?us-ascii?Q?hwb7EqpAJoasIIEBkBPk//iqa8C4FkUXTqWDas9rf7jMu7fyhHqE6KCCb9gW?=
 =?us-ascii?Q?mZzrA8M0wJs2IaUlIW9CGnOA+GvM5Vr98VsWBrZP/kOtqQ7jxeQiZFTKw9YO?=
 =?us-ascii?Q?CUnSnpgbNRVWWgjjcxSdbEi10insc9qvTwqRehmX4EnSKF1mF3dd0usz3QNH?=
 =?us-ascii?Q?YqLuP8t7tcgvYMm5zYp1jLgrBMrwEjVJInjjur1tCNiXk2IpJwTGnJ9gZt5c?=
 =?us-ascii?Q?V5aMyxZD6KSOv4MEWZZ6t3cxN2oTugap6cl7Avgw7FhZCQGNY8RwU/qPzwjn?=
 =?us-ascii?Q?eS8ltKim4gusMyo9up+dBciUDmugOOejvFnleaT6JTpTX3vmrBEXtKXUBy+u?=
 =?us-ascii?Q?omfQ5fIN5R2Wdmu75dGybSprsDgqMpJurExu063tyVksixH/TcxHifR6mlSL?=
 =?us-ascii?Q?UVcK86b71evWm9lc3DkRLHZ4qG77UBFzYLCBmNbfGRd2j92CMJDPPqCu6E+3?=
 =?us-ascii?Q?CkCQuYibhbJEBzOqeMt9uz6Rfs/Yz35RV7YiiYy1EnMxvueoSlL5VQ9XN+eF?=
 =?us-ascii?Q?dfI71WAwQwDpGjjUD48Jb8gbV+wVlWV3R0X9aqlcUJFd7WK8bPJDf5hCVkWq?=
 =?us-ascii?Q?yC0twRybtEmfJzuuhB3rtS0FQSwIX3fEGf+9ZfrzKQSTXqQ1mEM/nes8VsjJ?=
 =?us-ascii?Q?crz7UegEsIPn7PEZIHPPl2LK2Jnxdg8OZtvuPQsxxNEYjdNiUCvVe8KTivJW?=
 =?us-ascii?Q?g3LS3+cFDxxSvQgRJtpTfsU0udKeJxcU3XlgkgMfdUNinvMVP+9mWUARytTU?=
 =?us-ascii?Q?j8tjBXOFMLPYux6XfmoAaGxkCDzFJCy409nvz7imZJi2YbT/7SLeJNo6jJAn?=
 =?us-ascii?Q?BAksyC8LVr+ZI9JhIC/ehoSRfJtVaYUnE36clZlv5AAcxofzQfTHnXFvbMyI?=
 =?us-ascii?Q?op+kVaN/QLq44AJ6B+CbPfmoZrJ18ESvOVJPpY+8TfngR/xBB3//QMf369hR?=
 =?us-ascii?Q?7tKOa7il+D9N9jxdQVQ/zAs9mO0zQ1jD6tDmXzU6ba8jYs8veFUK3Z83b1vb?=
 =?us-ascii?Q?xXwuSReZaggoX2es0OYo7FxM+69IjBiVtM8Dz2p+4PcpFKVWxD/ZvLoIsVDU?=
 =?us-ascii?Q?BFujR3KEaFjjQjhxsA1MlEAx971DhARH4w8hgF2RNqRxmrX548uvPOHgPZiP?=
 =?us-ascii?Q?4P3Ik6EZEGYf0mJcN78edWzjSsNSfxQWACHnaX2lK78QWd3I0WTojAEfWoPC?=
 =?us-ascii?Q?+DE2NRC768ZU5K2ZB4hKDCrOhI6vBdJ0/FukZevvHdyxTq4j0wcTQMcY6/oJ?=
 =?us-ascii?Q?HhKgiiMJLUGj6XLp5bli+ncf2GamKZU78FjzKKIev2PY9uSt2Odjb9RQ2zJN?=
 =?us-ascii?Q?x5ahk0hFayS/PYzMuMMOEV2jUziBafab3as6z7PEr/3X+M1NaDY6ACj0mi8j?=
 =?us-ascii?Q?XnF+GpAe198KvAsRpXAbwVWSRAI5nktI9sYph9RUpcyubXNb5O7InvhQk7ZG?=
 =?us-ascii?Q?Udvyahv5RR4crRCWT/dbMDDkXV5Ry1Rn2B2lCBCPde7YxShcoNZOpUdvLdM5?=
 =?us-ascii?Q?915/j44wX/AofVXRLKxbp8SRau+Enr4XmbSYkVINqrDKSwjuYC4zw6FrWYBp?=
 =?us-ascii?Q?AFoUYea68QO3EWO+kzyV3YZutGOeRYU=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa960d8-f113-4625-e1eb-08df3673656e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:56.1610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qiCGsRa8CZHvLggIJikyVp74BSCrdtDf8FlmqBrVKTttywEquno+hLPym5N63+R8MlkBaiecIQS4dP0+LbBvEY/80xnWgtjFS/g1Z8cVXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0975

Add HFLIP and VFLIP controls, lock them while streaming, and update
the reported Bayer format based on the flip state.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 59 ++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 14046f1c9324..4b87ef60a2a7 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -92,6 +92,10 @@
 #define OS05B10_MIRROR			BIT(3)
 #define OS05B10_FLIP			GENMASK(5, 4)
 
+#define OS05B10_REG_ANALOG_FLIP	CCI_REG8(0x3716)
+#define OS05B10_FLIP_ENABLE		0x04
+#define OS05B10_FLIP_DISABLE		0x24
+
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
@@ -227,7 +231,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
 	{ CCI_REG8(0x3725), 0xb2 },
@@ -459,6 +462,8 @@ struct os05b10 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
 
 	u32 link_freq_index;
 	u32 data_lanes;
@@ -507,6 +512,16 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
+static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+{
+	static const u32 codes[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
+		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	};
+
+	return codes[os05b10->vflip->val][os05b10->hflip->val];
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -550,6 +565,25 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		ret = 0;
+		cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
+				OS05B10_MIRROR | OS05B10_FLIP,
+				(!os05b10->hflip->val ?
+				 OS05B10_MIRROR : 0) |
+				(os05b10->vflip->val ?
+				 OS05B10_FLIP : 0), &ret);
+
+		cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
+			 (os05b10->vflip->val == 1) ?
+			 OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
+			 &ret);
+		if (ret)
+			break;
+
+		fmt->code = os05b10_get_format_code(os05b10);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -564,10 +598,12 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_mbus_codes[code->index];
+	code->code = os05b10_get_format_code(os05b10);
 
 	return 0;
 }
@@ -708,6 +744,9 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_rpm_put;
 
+	__v4l2_ctrl_grab(os05b10->vflip, true);
+	__v4l2_ctrl_grab(os05b10->hflip, true);
+
 	return 0;
 
 err_rpm_put:
@@ -728,6 +767,9 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(os05b10->dev, "failed to set stream off\n");
 
+	__v4l2_ctrl_grab(os05b10->vflip, false);
+	__v4l2_ctrl_grab(os05b10->hflip, false);
+
 	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return 0;
@@ -736,6 +778,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 static int os05b10_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct os05b10_mode *mode;
 
@@ -743,7 +786,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	format->code = os05b10_get_format_code(os05b10);
 
 	/* Update image pad formate */
 	format->width = mode->width;
@@ -929,7 +972,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	        return ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -967,6 +1010,12 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	                  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
 	                  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
 
+	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
 					      &props);
 	if (ret) {
@@ -976,6 +1025,8 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	os05b10->sd.ctrl_handler = ctrl_hdlr;
 
-- 
2.34.1

