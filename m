Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357406;
	b=m73hsVFHjhqJpiPtStFanZ+yNf+TwFvtUThK0UJ61OKXDu+3TsuGiGjtIxFBD6PeSSZ7
	 9ulmb9d035vV8Hwm1veIvJ5UWuy3e1Hg8HSezdg8pntDNq8OiGc6LbIFKnVQseVG+Kp6m
	 1uZl4XzpJrWuB7yQ0LLaRrstgNE6Nicwis3ftimipQh46O5TtLQYsK4d7/JIyQ7rmcRTV
	 r9icGJJ/jNkU71pk2wV6pjO0qTS4oRncAF1m4SbUipsDNLu8Ikh4jYnpQHSKOIa3gAoFd
	 jMPvrh3rKTOzL7RgE7C4DPTHjIaATaKeK82xP7wRY07Vy32qSLdw4z+JKtlAuE+LWvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357406;
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
	bh=Ga/Zyialti9aox2zAPa/aeFriibpG3peYzgxueSRp2I=;
	b=GZuyivJ4uyArBKlTjy0eCMSRUmSg4lXuHmgu9NHknnu8n1cemtLU5YXp8ZmQzC5IN32I
	 jAHcJ61Esk5bxeai5bUMqN0rDzkHoL8BcoEweMqxbMUd5jKQcVyXcFQlvirlObvTDNLF8
	 qseRsxgkOC2zizMNy/xTiRQjpbBnNJqp1/KVXlQGfzuJQiNkfYYMgpbcxBeuBXhizIW7j
	 NnYfInIaA+UmL7xOxbw/wlxhqMGKDPpTYG5xa6Z9BbHXQgTYy3q8jbSb0ZiPmuMIGxql3
	 wIefg5tt2iEAaqsLamflADNFZwPuOpn42ogEtqNvPI1gnZC3unrlj23+G6hZMljVEdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=YKQaqEHP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.114
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020114.outbound.protection.outlook.com [52.101.225.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5260A2637;
	Fri, 30 Oct 2026 10:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B5260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=YKQaqEHP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaka10hD11ctSYqG5VokRGongA7oo190WWjyV8n2/Dx6rcnEXTV0M5GFKhYuY+kUjM6WDliQvzxdi5QttT/bCZ4w1hWoeWdop6A1Pre1TA25fS45ehPSePCF1QWK2/Uaq48lH/KtinEuxI0i92fPSXh058bEZ//lk3Vp96ALu2yOPPoSd6L+3SmqV5FnX3saip/+GHXoYq7ZBxP2EcCpkJ1Wn4u1yb8QMV91HBibcL0m3ZBtSO2Pi7pwNIyqcSfvRWXfX2yAEXowQNvcCUZnMh1ZXaYCoWDzgVY/CUOYbooJMhhA69ghUyWPvz122RwPQhW8sx3UHTqnLv/MqOxkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ga/Zyialti9aox2zAPa/aeFriibpG3peYzgxueSRp2I=;
 b=JDJAZHEtgwZ6oFcB+9gky0tBaNCb9sFRuYFFOeIJRKctfAY1XP3JY2f96cb2ZTTV7F+SLroeitIzmUBcVC+4JRJ5hUn/ZbxLduODc8Iq1oYnnvaYaD271KHXS3b22fQoLVjaGS1VfXCFrNnuotKsQHQQ2qHp680oIpJQBIMrg/93uE/TgfXdOLmRN2hooVElRuzqIyHpZrh+TvYkHz1FbdAOk408kGSjDgaoIdQiYslxeW5rMsJBhUBkqYmiZHrYSGpy8z8vx9CbnAmwo8Pm8Y+YUQtiya7hF6b+G61XR7Xi/QcSMJC8ju0cw09s2T22jz3xfZfUxEVWS8l9AmhWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga/Zyialti9aox2zAPa/aeFriibpG3peYzgxueSRp2I=;
 b=YKQaqEHP8iDT3cQWkupxWsa3NHn2cRfkVzgln57i8WwAqtsf61sL/HYig3qyM/hKgl7Yr/9GJz0CjJtUfaokxOJefe1bROMdKi/uElEcvcsi5GkN5sTdiDDlRm2cCbxiLAxBoDLFr22SWkETYhQ4nTGZwtIaclshmZIkb6Rx+027bbn/IbiD+1hdZptagRFFzRw14EzbQFrSmk1/IQM9YpeWP1I+CorO5B6WzrVx083ay8fId6GXAgI1bhYjXEiRreJ3IJoJWxCZlwc4Y69+jNnDwDAD29xRbHePzXQnafTNKaLtsYO5mtl8h0yFPCb5fA2gZVGdD+RZxrCt1LxDhA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB1787.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::8)
 by MA0P287MB1769.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:50:01 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781]) by PN2P287MB1787.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:50:01 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/15] media: i2c: os05b10: add 12-bit RAW mode support
Date: Fri, 30 Oct 2026 16:18:00 +0530
Message-Id: <20261030104806.1223991-12-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN2P287MB1787:EE_|MA0P287MB1769:EE_
X-MS-Office365-Filtering-Correlation-Id: 8817449a-cefa-416a-7594-08df367367bb
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|261009223027099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261022115727099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 gb/Rxoy/aaLHJf77j8BNHlbl8VSHavAhQWIfw/Eqe9e5EvbNW7PDLmKmlmcAi7AhrAf74rrynInWTy9xTRmshMb6uWbFoacB/jlpn9t+3MoBquyZmOvgiZV8vIA5WWEojYS/+q4i0NlkimhHCYs1S2liBrkpSfcrbSlbXqBDtskrutfKTT185kn/+LnHWPJAslCBWA3yBYQOjY4Nm/LeF2afqNk5RKHB+AB73B4kmVfaoAxhN37vDQOSSkS1FjymUzKkQpVREq5+WgYFvSmMuMOh39/Lc1+Dgc2VE8YwBY2EckciIOqc5g3Ks38foItQI1fn8qbYAX3zR1FS9jiJekFohu0pz/58akgWDDR5mksehAzbsKQnoNhj4SlcVz9t9CxAkV9N7nDndVDpEZlrmm5B6xjXzh7dWRtZ/zmHPs1BuhVb0gUZytdCOikZ5KJXTl0r9uNpR82fxZ2FdYv01HBHpXr6I5pz5aUVywXEYfCtbJdVjqUxL90waBpmwlqL0hSEXNFGGaqwsVkEHrHBL/8PV2M7ENLhUFwLhydGNqqck4xOF3/NdN4GpaqEAnzsWKmT33IJK3pwxgYXUMSLSgRsIglWM/GlbJl7snXiNRHZoIjqWN60wZCW2qC3RClcNxKaC9kh2ETBWxPi2oRJzpmeVqC+rnt6pMTJkJYv2e1lPpULUZHy2PgCZ2cuNBp/MMJs+Q8jOwTyIJU+U5KEjdX0U5Tqi8lSZjdHyKjUEt4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB1787.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022115727099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Q2r1nkyFWaIezdTsDtPuuKjqGlFH/co0qx06iqyR/TtI4UfA7gIW4peNUM0/?=
 =?us-ascii?Q?UtJYndVK6qk+xgV53J+36hMbLX8ESv8M3hvcm2eXN0DMZcfO6TvfHXGImV0z?=
 =?us-ascii?Q?O1ljVFs6lADzFh5LioUOocwV4NvG/uqBMrnSX1ULaXZN2QW7AoRbs6I6pAsv?=
 =?us-ascii?Q?q5IGiPw/n8qS5Af/M+FQINZ7uV3L8n5RUpmvkvHFKbbgTzNjKS15cyzNpbjx?=
 =?us-ascii?Q?K6TdQLzMNLEBcIgeEEU3AhA2OzTxto2PZNBlvAa/ZPUscKinOe6/enTmSROC?=
 =?us-ascii?Q?0SExK24JhpPXCKSFBtZCzZdHfJzHtSbOHOY3+J7SlVW295SNRhAbQC6erYVk?=
 =?us-ascii?Q?ALO9+t5mkEPmeB6BmFVpJdr6LuT1FICDoFhA7NkDoTx0KYnyC7N/Zb+2f0Cm?=
 =?us-ascii?Q?oZrH+LvfBqBKFpSLBvyUAVwTGKnzX2cw4ebAbWfddJGucoV5rXJuzwgqZyZA?=
 =?us-ascii?Q?HB7hzkdwWYe5xKi5lSy4OpAfAtZXey6MJwcIHIGzl7UWSgJzm2WTV/PxxvyG?=
 =?us-ascii?Q?YdYdwuUmq8nWgCXl29a/vsDwVj4n+w9+diP093h1nk/bdZ3adEouMexuoHFq?=
 =?us-ascii?Q?AdNALp/KjUyDXgiALm8V6xVrR0TvncUUvvfwyMM0aVj+wEwe9czYla5zZ4bx?=
 =?us-ascii?Q?o7bGVtyZQBXnAgpvKFmRn/twID1wt2fon1F6xGFZbLAcCZUiKNeEHg42Q77T?=
 =?us-ascii?Q?V6kZf8ji5hN54vP40LViztjFO2tYV1eRgMe1C5Oa/tLaw81IUh2Jr+dxD6tm?=
 =?us-ascii?Q?7N1jbu8bYLocCKq5gvgVKvHmGzPvGZ8cUHwpl59/q3mZFpmf94JP6wLUJjSz?=
 =?us-ascii?Q?HPIuGh9M9u4/dAkMt7mLef9/8Gfup4QM65N4d0dK6Y/MZPYZUI87ZNxzjjFd?=
 =?us-ascii?Q?PMIT+QAYpG6YDcmLMhHjJBqBdi/wuBhhrFVLPfL/UtBFGWkuQ486hwmIaeTH?=
 =?us-ascii?Q?knVl3zxZiYTsUsNs40/n3mqSPBQAA52yFYIUrKtM2hNNA+/EcKBNT94hj4WR?=
 =?us-ascii?Q?vfymYHCQ/z/1XBylBwuZirlq1Ftc4EcAHlX5i1sJqvkJxmsKq6Gqc2uB1PN3?=
 =?us-ascii?Q?KCTCRpeD/bPVFJH9IG+YeYsfhiMoxm6Xc7EO1PEW0VuDtoXJQv6MOlyvEVbe?=
 =?us-ascii?Q?fVkxMR07hLqmRFCr3Q+0SYg5dtpiiCLsj7nhS8Wt/vDtP4qvBNit+NWDNOPX?=
 =?us-ascii?Q?WjwHUXzgVIUwg+dx1CXi6eSFNaf5JjnsRDvsLz7PgOhm8DsEJ0+TdEy5JYZI?=
 =?us-ascii?Q?LBpnjkbyXNzdiUwupYkmYY3ngVaN6iBBNkhbm84i6QQ69DHAGbm1fgVOaTQT?=
 =?us-ascii?Q?axLHiWxlKh2w0ReLqb10NzD50yezyg9cb0Gwx9ztu9a3T/aoxTpJz8JuQcS+?=
 =?us-ascii?Q?JwDYZKWWLVwFDR84+mUIIENm1h6BQ0cFa/xODE4BbUsk6+5sAFVlGI82zSp9?=
 =?us-ascii?Q?Mlc0mCF7+dMvlHMTItDBADZeBMsLLUziFenWIFY8mvx0MuV5dDjsSQFv84Bk?=
 =?us-ascii?Q?1j5UUClAfNv5aZFw/8wrnIkK6jLoFj6ZX3URUxA/V4WqsFLtRFuXk7Uk75XQ?=
 =?us-ascii?Q?58+0xl/WtX0kxLgL7lJV9ma1QxAK50uLlwsPJspWjwTos6TAL54mpurv9Suj?=
 =?us-ascii?Q?1NMNPrRzMi2VXmdmOTB417C61xEhXkHhyBgPNj566QJ4Y8TyM4dTgLeL0Fxb?=
 =?us-ascii?Q?PYCOjssegD6STenUaG6Ows2P6839WNUPwBQz7Ox59MJVzyCoTyWIf4YluOcA?=
 =?us-ascii?Q?mvjSktVBxPzvT5grn7dWt64TXIBfKPQ=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8817449a-cefa-416a-7594-08df367367bb
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:49:00.0310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WstSSe6kKoM8JPy2bNPmcurfhREMUF9Gv9wqrw2tYvMRW5XTuRXosPOP85Rd4an1CgLKegR/8aiJFYvFwUt1K35QuaWEK3NTx+8/s6bvAHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1769

Expose a 12-bit Bayer output option in the OS05B10 V4L2 sub-device driver.

Add a 12-bit mode table alongside the existing 10-bit mode, extend the
enumerated mbus codes to include RAW12, and select the correct mode table
based on the requested mbus format in enum_frame_size and stream enable.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 126 +++++++++++++++++++++++++++++++-----
 1 file changed, 110 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 48c905165954..ba6a22ced3db 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -142,7 +142,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ OS05B10_REG_MIPI_SC_CTRL_1, OS05B10_10BIT_MODE },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
@@ -494,6 +493,21 @@ struct os05b10_mode {
 	struct os05b10_reg_list reg_list;
 };
 
+static const struct os05b10_mode supported_modes_12bit[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+		.vts = 2007,
+		.hts = 1744,
+		.exp = 1900,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+			.regs = mode_2592_1944_regs,
+		},
+	},
+};
+
 static const struct os05b10_mode supported_modes_10bit[] = {
 	{
 		.width = 2592,
@@ -515,6 +529,7 @@ static const s64 link_frequencies[] = {
 
 static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
 };
 
 static const char * const os05b10_test_pattern_menu[] = {
@@ -546,14 +561,33 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
-static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+static u32 os05b10_get_format_code(struct os05b10 *os05b10, u32 code)
 {
-	static const u32 codes[2][2] = {
-		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
-		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	static const u32 codes[2][2][2] = {
+		{ /* 10 bpp */
+			{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10 },
+			{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10 },
+		},
+		{ /* 12 bpp */
+			{ MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12 },
+			{ MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12 },
+		},
 	};
+	unsigned int is_12bit;
+
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		is_12bit = 1;
+		break;
+	default:
+		is_12bit = 0;
+		break;
+	}
 
-	return codes[os05b10->vflip->val][os05b10->hflip->val];
+	return codes[is_12bit][os05b10->vflip->val][os05b10->hflip->val];
 }
 
 static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
@@ -565,6 +599,34 @@ static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
 			 os05b10_tp_val[pattern], NULL);
 }
 
+static int get_mode_table(struct os05b10 *os05b10, unsigned int code,
+			  const struct os05b10_mode **mode_list,
+			  unsigned int *num_modes)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		*mode_list = supported_modes_12bit;
+		*num_modes = ARRAY_SIZE(supported_modes_12bit);
+		return 0;
+
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		*mode_list = supported_modes_10bit;
+		*num_modes = ARRAY_SIZE(supported_modes_10bit);
+		return 0;
+
+	default:
+		dev_err(os05b10->dev,
+			"Unsupported media bus format: %#x\n", code);
+		return -EINVAL;
+	}
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -625,7 +687,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (ret)
 			break;
 
-		fmt->code = os05b10_get_format_code(os05b10);
+		fmt->code = os05b10_get_format_code(os05b10, fmt->code);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = os05b10_update_test_pattern(os05b10, ctrl->val);
@@ -649,7 +711,8 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_get_format_code(os05b10);
+	code->code = os05b10_get_format_code(os05b10,
+					     os05b10_mbus_codes[code->index]);
 
 	return 0;
 }
@@ -684,11 +747,20 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
-	const struct os05b10_mode *mode = &supported_modes_10bit[0];
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_mode *mode_list;
 	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
+	ret = get_mode_table(os05b10, fmt->format.code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->format.width, fmt->format.height);
+
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
 	fmt->format.field = V4L2_FIELD_NONE;
@@ -732,12 +804,21 @@ static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_mode *mode_list;
+	unsigned int num_modes;
+	int ret;
+
+	ret = get_mode_table(os05b10, fse->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	if (fse->index >= num_modes)
 		return -EINVAL;
 
-	fse->min_width = supported_modes_10bit[fse->index].width;
+	fse->min_width = mode_list[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes_10bit[fse->index].height;
+	fse->min_height = mode_list[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -750,13 +831,18 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	struct os05b10 *os05b10 = to_os05b10(sd);
 	const struct os05b10_reg_list *reg_list;
 	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode_list;
 	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
 	fmt = v4l2_subdev_state_get_format(state, 0);
-	mode = v4l2_find_nearest_size(supported_modes_10bit,
-				      ARRAY_SIZE(supported_modes_10bit), width,
-				      height, fmt->width, fmt->height);
+	ret = get_mode_table(os05b10, fmt->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
 
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
@@ -770,6 +856,14 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	ret = cci_write(os05b10->cci, OS05B10_REG_MIPI_SC_CTRL_1,
+			(mode->bpp == 12) ? OS05B10_12BIT_MODE :
+			OS05B10_10BIT_MODE, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to write pixel bit registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &mode->reg_list;
 	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
@@ -832,7 +926,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = os05b10_get_format_code(os05b10);
+	format->code = os05b10_get_format_code(os05b10, os05b10_mbus_codes[0]);
 
 	/* Update image pad formate */
 	format->width = mode->width;
-- 
2.34.1

