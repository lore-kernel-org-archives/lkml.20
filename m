Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356458;
	b=GvPGcoNd5rqsp7ME5L11PoO8LF/KhE44hw8G5QdzqXT+kObsYcM6CHVneWoEFWIPBkJb
	 1FJFJ+f7CXXSMtTKqIjTGkx+QYQTvB4Fd03zjHOXtnM/aCyvLpY14snWg02vuAEd4NU+D
	 jGMavlOtm5xB1lVe32x1z3EwSjEOuWXEDp50C8sVGTCoiRpsMGopW40qA72A1YzL7/CMe
	 LYp2pRXylU4FW8E7WOb1UZOAQnXpPV2PIsIsPlt3D7Ew+MdsSV+Dq0rvWHBj+SFp/UtEQ
	 GBzr1pDAxan34WhD+S3ycfbWcnQ8Ph3ictvBppohYk/CPj5f6MFLDCc+gyWaPXg+0aA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356458;
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
	bh=y2/kzQrNyTwTgyUCqUSmim9urUqccLyozgMUuH+Qgfc=;
	b=MlUatPONFUudcMvaaILxuvQ+A8YI9Kz6A0ctLoXBW/HK19DKUqMr0tYkQ3L/7yXKfCCX
	 35H2iDSo93HtetdlMh13VS5twfOppWO07QS8bUeBNMbKN+eMvGqXMJAQbwUMtDxGrVTIH
	 pUVvG+4vD6/DpSKTfxNEloWMw2nL969EWRmLHJZrje0cfLM6HiKKokjdHEHBuyQ6Ssyj+
	 4cZo9i9dxowYGUwutWhOo+9+ywa2bDTTMr2qENZ0CXlEXtlvilBbhFdm+INCUdB/9/fY0
	 cnCs/frCyJRvMKkD2MBK9H1fbzfTcQ4LLwUNGUyDki+Pip2sZcNEbYxlztHhvU+MQuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=CVxp6pDh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.92
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021092.outbound.protection.outlook.com [40.107.51.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053BC606A31E;
	Fri, 30 Oct 2026 10:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 053BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=CVxp6pDh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdSVk+OZ5DYtAhzmRWqOTgAMFuLmjrdXPiC83x+PvgejgpN58YGVVi9hYNUHq5VsF1MgA7kZAJCnze6HDltZpIhESq5R4gN1hZEbOt5RNbnkTODyzpUUbyuLPo4GebBrImeEaTMPc/K8ap7Ry5UqOWuQBwy3GsNaHsDspIGIV/ttI7cpfKwO0UrC1Wbb62z1eQ8ZzYqszopSCw2LoXFMZRqzE63EfCawPTZ28DIh/3wBnZDoByYWjfxgS/fp+0pMUD1m1WvmetcWcZOHs3wPbjlOzJVmM2MA83xAjbHFzVQ9RiJda8L7gEo0Hdt+vPUxZh87GvCOpLPQzgLaG+Np9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2/kzQrNyTwTgyUCqUSmim9urUqccLyozgMUuH+Qgfc=;
 b=vowBSsWRuLa2ZaKftX7odkO/7CFIChhIN/g6om1Bok1gUWVwb7Dk18GPnPxdxQKmMSuzAEOsURctVHMMkJkpPOm+ny+s//SiaNByo/xgTLGIwM3qi/aLgg69IzavRV4USTq/sA/zsR3Q/ZSeVFwuk3SOPP1ztgiWFAkMX4vN9fEqprkQ7LVNhIsvdj39nHPTXYMYzu36zgKv6dgNX8fAeU52G5evvg9wUbWXYt9KI+/B1b6WD9rJ4icXhRKddscT6R1jW/8xdChj09Ajjrhr/WkdzPn6RTWWr/LiWo/0JDDtYW+ABuSGACCcTq6JnXjq88YLu376SQFTfN0Hy0El2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2/kzQrNyTwTgyUCqUSmim9urUqccLyozgMUuH+Qgfc=;
 b=CVxp6pDh+KbhIy70Rsd3jctask7vwbbiVRhniKGBRzW6YdJKOkOLBv8SRx6KC/y8HVSaRdpYMZW5nur0iigvAvqEMjnINfhglbSKYVFQByWIR+McREs9B5sTvrOko7aKMYza5ZAv2Lnd+LzhoQeUU8l8Nh4Ue+u6zVpEBwlCJh8Swjx4RhIuSWPQRILo+NIVaTDLVzediHnHesxs8DJx9jqmh4R1ZBzNws1wAnTepjkA2VVAP+mlKVa2OI8lSC2073VGU9GqLoymQaaEA1b3YHSuhdUk5HnQI4iLMtyQbp1U8qdBLZfB6ybfmlK4deJhJQjVlRHplbCW6VL7r9i7HA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4299.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:15 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:15 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/15] media: i2c: os05b10: Rename vmax variable in VBLANK control
Date: Fri, 30 Oct 2026 16:03:34 +0530
Message-Id: <20261030103348.1222201-3-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: f7ba6d9a-99ed-4952-87dd-08df3671587a
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|10067099003|18002099003|22082099003|38350700014|56012099006|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 qrcTzTe9AE+qIR4UL/justvzIBKE8RZlIHsMOGYeR3lZGeqqEttWLFE6ASLSbwJx32tXe2uDp1UNokT+ZUF7dWS3vLh6xPVKfXje+SuB0Hx0tBWrd90dw9fuKsBwRCJMib+JEdaI3S7EyyXQt/OvLjHF0BZaJ1yPWwJO6kTHtPw3RI17PtaLGjbSKQh2X80qOq9JT27FYhD4HBGkLvdao2+k29Fx2F9MKm8z92fQ/9ObzTeu2wHmjLl8eZvoYiZ4h9DPgYWMylkUTgnyc/EUlmLl0xkcjmWgmeJYXtDNxSbOC78JxS1qdo2q13Gb+F3bcRSyXLlX62zzsQ3GqBmrdoKIFHxB+WiTrGLz9Vus58Cd3mj0VZuPp7A3Xsfd/lhGF1XAOwCcxTva0zcDFxI6Z/oSs4+Vn0mDo+/JTQmxhroQ7O3iPdnInHqsil+JUonpgkkWmyyBjzVTBq/2z7FKioMJ329Lm/qUHmmgT/l9UMNuTIrWjuFELsmat+MA9cNE1AGysBqBVDIOUdyLKNEV57sA8MvI2DybuB+lypUbFxSXM9r77T4FOjD/EjbvtVt7umITK1eoM4osbR+ylssOAwzDcgdcXU05Yyu92SBz0CwUo7EwnmRmo+RyM3uN3rYE9ELXDbnK+b0FbXZzo4GZU25QV5EeRuD6MG+3JUk4LHluFaVow4qEb1rtgjBYCnJ51WgPuAozFgat29UdlEAb52Wko5Shjd6aul9Ge8q7+JE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Yv+PmYcuST0Eq7QMVpBBiL5T0CP4jNfIQk03ZbEMmd2U63y0ZJTGXS0cQiim?=
 =?us-ascii?Q?udo66U/PkBpmZZtCImGH4CGoyemPqbwGgltFy7ltY08qf8RMljuUJk75ZDdA?=
 =?us-ascii?Q?7ll9ZxlAjxLwjGeqC88ypLKBTxBbqZFQZh4/ekfARZ5CpKedYTHlGMsrNNXH?=
 =?us-ascii?Q?zAMXhUuYgp9adUNUQbAyRZnhCQTrvLL6UITm61G0IrIH2h12zlAigdMJml6y?=
 =?us-ascii?Q?BJK2wl6s0bSV8JU6xTUdan3pagt00UMqnXC5vQr9ZKWQRNxI8RQ2jdAwGG1V?=
 =?us-ascii?Q?Z0P3Em0r3r2rjujb+lanFn9wI01zJFKplY6D1nvjjsO1g4IGiRwROA0bvpqh?=
 =?us-ascii?Q?eoMy03eFUBEftCgRLOr01yMpkkwlwZNbkCluauYW+1VXCUYWVK2Y2yocQGfy?=
 =?us-ascii?Q?zc4xiVIuut//QjxhFWy2nVAyeLc4dqbPAkz1FlJPZgYHXRwsZz+9o9TQKpC7?=
 =?us-ascii?Q?qSOEiLAzpOaPzKSJYE9xG/1mEvjd1bBqRehNY5tv1N8vQVkXgA68pU8tiimU?=
 =?us-ascii?Q?d3YJGHy/V1617JRvO9FANh1+KCdlRgH6X4QCsozhv4G4PD3W/6K0OtHuhIVu?=
 =?us-ascii?Q?HcxLsQ7jhIC+O2+GDgr4nD/zf6o5O2udtmjTm+WXzBphMtfQ6fjnB3bg/7CY?=
 =?us-ascii?Q?0S+KDvePYFtzVbxk2HdkG3aizI5cj3CHJOWyqvutCpKiMKrk+BkcNOZfyScY?=
 =?us-ascii?Q?g2hmYd/ZoTCne9OZnnfLAqKWE5P6VkGhNZaSYjjfekZjAAn3BQ7OPeWxlnqQ?=
 =?us-ascii?Q?+S1RyiQIRcfKapLNX8hdbb6+4hHDC9RXg/dB8cl1itFea/TrL7E5f/udncWM?=
 =?us-ascii?Q?zSEdb/+S/+LBeg3Na8IQb1PsqULfex1X/9NakkJJ2DdLGLbpXOXx3oG3xnmL?=
 =?us-ascii?Q?k/PpitHU1mZob+vlj2pnb0rI+yEjE030FQ+k6GtuwVHXth9Nxr5T8g9F/+jq?=
 =?us-ascii?Q?u7Gh703a5ihiVB88PcshPovaGpSIOEUT6NqE67gWCsuUp/e+9iuV1GgrQLYd?=
 =?us-ascii?Q?cqbqZnKvbhNkH5PgThvLgwews8eTyv0CP2MdclxNwNfwi1YQBOBGxn4ZKXi1?=
 =?us-ascii?Q?I9RDw00te3C+SQ85JftuvI6zv8Yi9mYHI5C9WBJ4/kCcNftyT3WzbY9ARq2z?=
 =?us-ascii?Q?b9qxFL1i0WWNT+Jayb0+vIoDDiuXZ1baWAIvT4/ZX5IDdrr1R1EW4ldLGeRq?=
 =?us-ascii?Q?d63WjKAtdWUU3v7Z4ob2RAf5DpHX9zOh5sEph5mkVV21u9VYMv+XsAYI+yqd?=
 =?us-ascii?Q?rwP+IOq+/hWk4BcUwq6uAwgD2YhXWZP5//UNk2lMc7lWbVawngCt5DpC8lYQ?=
 =?us-ascii?Q?RzyJ5TachevKhrSP20ai7nQymO+jYNLW6VRhNjW4DyH2oK7B/XDI+pKhyLVT?=
 =?us-ascii?Q?cDuxOytr1MdK32A5Z5PJzOuhzFET8bcuQaHCQgPJqoHVgGgH12rVGJYfIYf1?=
 =?us-ascii?Q?RlJdWd80UV+3Cp/hGlvryAaxODTF1YJAehhzgJA76RVhEIOOsXV2DowUlBA0?=
 =?us-ascii?Q?oxWGr1VazdhdoKfFyji7CBf5bInCJGfMU++AarsTKH+lVxKjd9kjQDc/rlmV?=
 =?us-ascii?Q?ZQXTLLFsxqCCwguq1HaCss4a5XVB1Jo9/B2CPglxlDNGHLGwbMDwotmyl1aO?=
 =?us-ascii?Q?z27qeN0AMzfqH31kMltJ98SCL70Gf+2KgDIpT+T2dVz7phiRakRwb+RqMix5?=
 =?us-ascii?Q?lfkdwdZWy38LeSLLC5hLsYSmP44dflOy4hOOIcASSAEAh1Gr/KxHODvP7iNq?=
 =?us-ascii?Q?z9BJkW+L/M/irVMXp9oHzajIwUWi91Y=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ba6d9a-99ed-4952-87dd-08df3671587a
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:15.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lgUI7hlD0sq+iHlhdl+eXpF838k9MV1hSIoKDg2Iz6Qgw+sDjtfP2wyIAEXSupEBLMAr/4hOMc6tLz27VzmlpXbHjN88/N4rdo5OWi8wXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4299

The VBLANK control programs the sensor VTS register. Rename the local
variable from vmax to vts to match the register meaning and improve
readability.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index d5f573b1614a..46246d297a44 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -477,7 +477,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 						     struct os05b10, handler);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
-	int vmax, ret;
+	int vts, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
@@ -499,8 +499,8 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		vmax = fmt->height + ctrl->val;
-		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
+		vts = fmt->height + ctrl->val;
+		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vts, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
-- 
2.34.1

