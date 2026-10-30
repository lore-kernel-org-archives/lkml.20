Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.142
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357411;
	b=BFlAcN+JD49/ZBpnw97hIBILehmwxEH9kjI4gMRU9MmlAGXnC3AHwSRd/Kr505WT+AW+
	 YwWYMUmk+/p+0Lt+rf+x2xY1JoFTpJC/YCED6vNhT6aplnX17s3+ArjixzTp96B56mBB6
	 if0RdYfOgohQhSO8AC0rwz8XHNlINb82UBZlwWnL/3etvKZonuGCmJKdiqNA+pz9/qzM0
	 /WKfkWkt5QXWvbM/sjc1tS+OSHDMnxudg3pn1zyhHcdzxI76MpdL7eCgWTtQ+lMe2Mq8Y
	 sIjWqW+vAPEtS5BCq8ZzYEnFz4zb4EwWfYs2kHXlMSOh0CzAhj5lVDCsQcTDPbxLTPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357411;
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
	bh=49KRd8UxR1pQMrPCAVOAW1/OVAyicUCL3MeSGgaWqWw=;
	b=Sjyp8UVHYPe7LPZM36/moMAwUmLSLhWl+vW9/5nZVjq/3AZu8pg62feIDPx658lsZozh
	 jKt41ygOFrOT/ef6ZAoJbE4ILYMJPll+OQwXT/OV3gQa3XiCb2lfoZgMhVfrEXxh7/BW/
	 OYkX3H9bRlnThzMtn3Rx2sueg3xFxRld1xaSCpBkseUoGHax6q6Of8t3OIAF6hW9Htu2r
	 HfMmS7NPOVFM1TilAJFPZXQo70pdJ13sKdGpcTEkT7XcGBPQ19irRO8/7zT54Bh3Tzhpa
	 D5cmv+hi+v6szPN0IcpWa5rtxJe45kRAXzrwcWn0r+FRbVUr2oiWm2YURihpvi+I5MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=HqL4DLSk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.142
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020142.outbound.protection.outlook.com [52.101.225.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA960A5BC8;
	Fri, 30 Oct 2026 10:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEBA960A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=HqL4DLSk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpPTJHspXUnjxbOEnear29e36TBe86nwA/P+NrQG/xIQzS/qRlElJjnpaUeeqKeggJ0Qv8ZCAPAxjpZm9QVkPuzH18nPrzA+dDcyXBKVUF49LJX1e3Z4T38MSGFVGV2aEa2IgYyyo0WdQvBiBOnDKR13D+sRtDirEwroQuG7k2N2rGhNxfn2e20gRUB4QzmevudAmfJnxqoQQrPIcipRfhLIloKxfN/ODWDyLzBd+wB/3V8CiYQ0oDqVsEpvZ2f/iDA7H8gn034Y3mKvc9bqRVzU5Ff4WpuG7CDw3g04H+UvnmsnZvk4x5jTsAszZwAT3zcL4nmsT6YiIKq4nZvXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49KRd8UxR1pQMrPCAVOAW1/OVAyicUCL3MeSGgaWqWw=;
 b=gs+O5dphuKs2aSrZtSHtNz1c3BiPo1IVq2k0bO3ZFfrX7uYkVzI6OUWQrX7vNeixHC6B43X+8P8APqrZt03ePUj7COq6CuqH8l7KP7C0EE4Y9PYJpKymN42oHQFhsQUqO2zmpaMx1Y07VdMiOm1C1IMyBQ20/LGJjBiMR8QHjOfIrTR2W52P6YOmssMzHR3rOQQf8t1thv3Kja7iIeH9BnLJmk4huzA51c8yvKj3J2kqHX65d0/R5T/vj6VFehvLWDVdBQUoBss9HNI75Ze5CJrVccP+lHjRFBXJwnTJBf8pillc8gBZJfxwzDIxAS1iDai3m5Q+akzGDxXjPm3VCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49KRd8UxR1pQMrPCAVOAW1/OVAyicUCL3MeSGgaWqWw=;
 b=HqL4DLSk5IwXaAvZ3R/wq/o1FndY162EAHxIjBsQAZ9jMpOM1lxFS6XveKAc3PQsjEhvfmQjvpcZ1BAZIld7mkzTYZ9QimgFHSJzW8fnsL4yjmLa0rd1L6PpLtmE9bn7lduolwSRStjqdezcy6sdTEAReSAhLLPz6LPb6s9y5quzhpdntq/qRnhdFYkp7oJxBDi3SwVV4CY8Keg0GElHrL+P7kU/DdRTcaR39FAoPeiMFMTqomP5ODmTqRclxldfrQlodXxp0R8mKL/qwhGtbP8aaC7bL0RWV/Q2fLji98jtwenAYde2YZLUmc4vp0grTqHbgE0hhLI/Tma86t9Pdw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB1787.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::8)
 by PN2P287MB0975.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:136::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:50:08 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781]) by PN2P287MB1787.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:50:08 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/15] media: i2c: os05b10: fix horizontal blanking calculation
Date: Fri, 30 Oct 2026 16:18:04 +0530
Message-Id: <20261030104806.1223991-16-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 5decbb4d-23ee-410a-d943-08df36736c70
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|3023799007|6133799003|10067099003|18002099003|22082099003|38350700014|56012099006|261026121527099003|261026140227099003|261022115727099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 hVYTP50CKytYyl4sGGxABHbwD2Gs0VKiPaj+Y9djracXqrj5KTxrpUV6C00g8Rcfm6UUlOJ9WwWN+EnHZBo5QskjJSHAIUUGBni9tgG5KTLDUUFzZzkNUDV15o9zGdZ0DvsKPxO9ZcQ4ouG5vY64Mxhj6xjzDTmbrMKbqhMGQ8jj8CDo24CGb8k6kkDaF2tibQyBZI6XoGkfpdafga3V0Pyz28GwM2bWToGOJvLxeDFtkXd43tf8AoxL2DKVX0csMDonPqkIJbILQAWcxeUiQW1Ao4aCVe/yLMY9gJ4j/l/u38p/O0GmA3CKEEUkegnWCH/ASXnB4wgnoG7JPRW7kdoQb0LTAYofU4o4fs0jQDdyfwdEtM3z28VpruIjGlMgbRjMmhRjAIMpMH/hir85t4M0eWMn515bOXwsBwtEh8zIP9XjBvK4yR2Ne7VQLOGsqbYg597cOSY9iJsrJNq/79fLu0eJ0YxzePpVyFSYF7FA1ew+HO0iOXuF84AILW/uzFzWICKIaKdbwrk7crq90qAUCbNJgm3I+N80omxv0xjTKAluvV5hslI0zQOL5zqP8HAj4dk4i0W5DQETRN+Ch6RDIrAHn/JYDrOcu9hVc1b+MhyJMC4cNmfyottQI6kKsPJe1OdU79q913kTyts2+F8akWdgKvL5PUBctPsj/JSxHOi/NCoVki6zb6E9gSx+51j005A8AAsr+AjT3ysQrJjomkdcioslEjZYcefB3+M=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB1787.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026121527099003)(261026140227099003)(261022115727099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?O9Y8J0IejKFVvDnMGbhDCEhkAI+2HgIs6KXv4GeQ0UMLSmYkTgywlfPl90u+?=
 =?us-ascii?Q?2wRTFwT9HBfZD6MiYrx+broDlQsLJ4BvbIIXBGCL815Pl46PLEVT2aMmLGk1?=
 =?us-ascii?Q?Ycy/BlCpoWE9ayZEKS+qfMxAYHwbjoGACmaRpDqLcg3dg3x2brM5lLkwCILb?=
 =?us-ascii?Q?1U0/CTHbC1kxf6XXqAoYL5ovjv4j6PgPkhn/g3t3f22JY1trCY9FFm6DW1bi?=
 =?us-ascii?Q?1X+CUwiHo023FO5BEnxvZV73eaTYy2SHhuklOQ1v/WkccLDgHnj+KnwCPcU8?=
 =?us-ascii?Q?3j4JUAjHDHkehrCo3n5mLKWUZPCbaR73pe2Ulu4r5ljOqSoVent3u0MENjvn?=
 =?us-ascii?Q?MbljRR+NdBVWVIbh9yyfVJYolEJtK+0jMFfrjRUhmtA9TUUsD0mKx+1Y4OC7?=
 =?us-ascii?Q?JxvSZ1t1xvwk0S8bHsvbw+QRJXypH4QQstSq141MXRPWTuKML9oAjdmXGuPg?=
 =?us-ascii?Q?4QrcMNZW+cZWqIBKQdBuOHasjM3jrJdKyN/NOr9OmAuGKT6ni07ntS3/MTIS?=
 =?us-ascii?Q?RJp/nJ5HdsX9E06K7Gx7+zbliobL2gGR46G+K+BYZx25as/MHZfuQQbEq7mF?=
 =?us-ascii?Q?scyHXEjqFWkbcsZKRpBOdQqaWN50vYB/y7duCqE2STcH0Sp5PF/qpo4c6wGT?=
 =?us-ascii?Q?7ZpViouFRYbjywZhTa/4pcWkoY5OAKd3g25bfXBSxZgMqGQZNprOA7i7VM7c?=
 =?us-ascii?Q?kWo0hP9GPvQlN3xyWAsqrdv2UnUe915fOY4bH7al/oLCWE3DU2+s1qmetRZK?=
 =?us-ascii?Q?8Tvk2ARimxSqz6pLT1HJQq9RpqYq3+wvcmIHSbmENuY22CMize/uhJB0ueXY?=
 =?us-ascii?Q?9j8DxrHWXqsNErHR4rt3taPlD470vl1f1VGJHzl30EXAPOS+oLkYZnAhWHvv?=
 =?us-ascii?Q?LM4ZBanubH5YSPu0J5fXm61o+q3+P/DL6iZ5ZXy/K3pIsaiQxJRVdCw1e96u?=
 =?us-ascii?Q?KWemJsTWYfRztjfFgOKI9iFhcKiN0ZEPCulPAJY3ePNAwDmIcoTeFmIWFcDF?=
 =?us-ascii?Q?a+y/s9PnWlw60ihNdsI/gPjUcWwCllHbUD5S/H2AHEPMmuyA6Pvp29B+XjBO?=
 =?us-ascii?Q?CJdkF8ZzCKWJlanTZ1KThUhuM7GgAA0NzC4vgao4MIOU5CRJy4Z7z8Trq7Ek?=
 =?us-ascii?Q?65JWGHFWxYUozVTuc1hic3rLUw2DGMwcJFHljsT5XAVEhwgUJu65/ROYablZ?=
 =?us-ascii?Q?fQEbGr67/wuLoCl6dpwai7xXSwKoqltXqDwnMuHOaMF37+d6CT4lnfuueXFt?=
 =?us-ascii?Q?PwQXxzVeGI4BRnBWjVjhbVi++OaFloeY1mTvfKHVbg9PGi4DhEn9oHnGXdaq?=
 =?us-ascii?Q?A/bVtGtJHkOqlJNpgRskXYRSbs9lQY3jqBEfBT924aiY4GW2fTqHy42mMpWE?=
 =?us-ascii?Q?so+sGN/XjJY/KEvS/991IgTR9gccidQyJTj85epBHNR3opOjdbMaI843E2C7?=
 =?us-ascii?Q?WpPEKjsXqFdgBagjMRm9V5lV4toV8dH3GAKTVj9Gj6LaYJnGtcQqx2E3pg/b?=
 =?us-ascii?Q?FqPdN3bQXSMiPovy9Jr/c+3Xml6vf+MCWTxI0Cyr9vCXrPt2tdkV58auBoYv?=
 =?us-ascii?Q?DcCMnoVjwTgG4TeVG0RxDQ5YqqL1iW3eFu5ILEugJjtCTeIDwO6cl4C/wyeS?=
 =?us-ascii?Q?PumBMji5TXcAk8FOgHa6Ey182LlINekK2cojE1SeelR8jfki3xBjL53qPdJ0?=
 =?us-ascii?Q?2bUNOj0pex5cudQMcZoKbnLJs8d5dsxreVDSkSV8mYKvCCRZLDmyST1sppPf?=
 =?us-ascii?Q?obNFXDswb2hl/6nCDyQYDsGujTfcC+4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5decbb4d-23ee-410a-d943-08df36736c70
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:49:07.9620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyGX5sn4Qe1x4X9z3px0/XT84AZLSNjC44aXU3ArAfThkB/E0hJXSqCh7GnWsy19mOHNCbtN7rTuvhtsNWeNenB6OYCL0XB1fnUR5jP6Kwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0975

The HTS register is not counted in output pixels, so "hts - width" is
meaningless: for every mode hts < width (e.g. 1744 vs 2592 for
2592x1944) and the u32 subtraction wraps. v4l2-compliance flags the
resulting HBLANK range:

    fail: v4l2-test-controls.cpp(413): returned control value out of range

The timing generator counts lines in internal clock cycles that cover
several pixels. At 30 fps in the 2592x1944 mode (HTS 1744, VTS 2006) the
line timing is

    HTS * VTS * fps = 1744 * 2006 * 30.01 ~= 105 MHz

which is half of the 210 MHz system clock. Use 4 pixels per cycle, which
gives an internal pixel rate of 105 MHz * 4 = 420 MPix/s.

Compute HBLANK as HTS * 4 - width, with a step of 4 pixels, and report
the fixed 420 MPix/s as PIXEL_RATE so that
fps = PIXEL_RATE / ((width + HBLANK) * (height + VBLANK)) holds. This
rate does not depend on the bit depth or the number of MIPI lanes, so
stop deriving it from the link frequency.

Fixes: 3aa9296a23ec4 ("media: i2c: add os05b10 image sensor driver")
Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 9284b21a92c7..4e87a9bd0f4d 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -113,6 +113,15 @@
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 #define OS05B10_LINK_FREQ_750MHZ	(750 * HZ_PER_MHZ)
 
+/*
+ * HTS is not counted in output pixels: the timing generator runs at half of
+ * the 210 MHz system clock and handles 4 pixels per cycle, giving an
+ * internal pixel rate of 105 MHz * 4 = 420 MPix/s. This is independent of
+ * the bit depth and of the number of MIPI lanes.
+ */
+#define OS05B10_PIXEL_RATE		(420 * HZ_PER_MHZ)
+#define OS05B10_PIX_PER_CLK		4
+
 static const struct v4l2_rect os05b10_native_area = {
 	.top = 0,
 	.left = 0,
@@ -872,9 +881,9 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 	u32 hblank, vblank, vblank_max, max_exp;
 	int ret;
 
-	hblank = mode->hts - mode->width;
-	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1,
-				       hblank);
+	hblank = mode->hts * OS05B10_PIX_PER_CLK - mode->width;
+	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank,
+				       OS05B10_PIX_PER_CLK, hblank);
 	if (ret)
 		return ret;
 
@@ -1260,23 +1269,10 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	return ret;
 }
 
-static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
-			      const struct os05b10_mode *mode)
-{
-	u64 link_freq = os05b10->link_frequencies[os05b10->link_freq_index];
-	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
-
-	dev_dbg(os05b10->dev,
-		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
-		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
-
-	return pixel_rate;
-}
-
 static int os05b10_init_controls(struct os05b10 *os05b10)
 {
 	const struct os05b10_mode *mode = &supported_modes_10bit[0];
-	u64 hblank_def, vblank_def, exp_max, pixel_rate;
+	u64 hblank_def, vblank_def, exp_max;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	struct v4l2_ctrl *link_freq;
@@ -1289,9 +1285,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	ctrl_hdlr = &os05b10->handler;
 	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
-	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
+			  OS05B10_PIXEL_RATE, OS05B10_PIXEL_RATE, 1,
+			  OS05B10_PIXEL_RATE);
 
 	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_LINK_FREQ,
@@ -1299,10 +1295,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 					   os05b10->link_freq_index,
 					   os05b10->link_frequencies);
 
-	hblank_def = mode->hts - mode->width;
+	hblank_def = mode->hts * OS05B10_PIX_PER_CLK - mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					    hblank_def, hblank_def,
-					    1, hblank_def);
+					    OS05B10_PIX_PER_CLK, hblank_def);
 
 	vblank_def = mode->vts - mode->height;
 	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
-- 
2.34.1

