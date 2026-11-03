Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720253;
	b=HXIKYBO2pdTskxBUIoZ8tWgpth0dR0IbADfPVQ6+CICO+CQpIxZESWC8+aRyfis0J/xK
	 uxE2RI5xVMwRl2wQtpqxuqhBMZ9+9mqMnEyBOxqIIt3VUvt9ePxgkPGjttrdPjoWXGUTm
	 V96iLHOZrDCYuaYTblYFPtfPwaTlnnWa6OmEoChXZdAqmiuQsuS+LUPhea6Uc708U5kRI
	 XIFGac9L1QakEEtW8ANHdkEX5QE6+5HLJMKmW2YK/ik8y+GWK6rdVokEp42ggtZz8zKL6
	 vmtWnXy8kRqoWKD9V5Cyt8qwspVnE5lNLeG9pEJpjjTWVUQVjKK6/eOEN9DelGfHm7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720253;
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
	bh=HCxTQZ2g0EYmSOEYl7K/ZQX7MemRxPvIzjIT8f9BWPo=;
	b=0ieNovQbQrnr4JC4hqx5w/OrPB24iE4LM4maIe6ZupX7RKfZjPCOcCmlqTJHen/npUoz
	 qFBERWqLB2rwrkZH9I8kekn9YsJcNIzF8hGdjqqJRb1qMVAlQ3LgIfaAi/V/JY199O/iK
	 ChorhE7PRWuWK1egWcO5vmgDUkI0EFeoWHQpxPT46joGELEjZwWhrWd4bBmrh6Xcm5FE7
	 A6E6+jGPI1psvNsjJGwLC1JPZo+qePTEBExCUwA7DwFB+QTEgS9CwnUB2j0oz6exOnZ45
	 MZKMlcSiN3XtczHUZ25pGFFeMb4pckjNk1WysnyON7tIhvzOOPLkp3EnLJASdasx9Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jKfSMZDl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBBB606A326;
	Tue,  3 Nov 2026 15:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BBBB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jKfSMZDl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdsLItqNsDzZgIVWXL3TOF8WzX853ub+HChIDSeEViw/y7pMng/F4Z4BW4eDXU5E8c/ovMUz137ObCDjeaIsx0If6ofAxLBB7H45C9da0hUwx3FQo3mqdtLfnJOu1BLI+6pCpSW72x30Kbj1jj8l7gF2yNmUtiVTIZaCRicKvjV4sLPNKgGHzHxMLA0hJGzhf/P9Ga4WFLNtlT1PGKCMTRJxP9KaUbR2bXo8PLwumkFHfBrw8AG6KSupWTtXnI56zTcjtvo/hbhz02yLaQPecw69KSJotqV8O1JMKZlrt/lTL5QYPm+IZJ+7l7Zf8Wv3MvlNgXNzJajM5/ZAcr3SJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCxTQZ2g0EYmSOEYl7K/ZQX7MemRxPvIzjIT8f9BWPo=;
 b=YvAywAyRmnz9pGJIZd0OBba4ZHdBhtKVuIUTW3LbPfDywP+bzZ2V6R4qT8ogpIM9hkUsqWSInc5HimMEM3s8VyTU7G5xAAF74Ud9tph9GorkZbn/1mvLKwJo/cJ7tqXbZJ6HqC9HcaeVo2U3R0XOjp/cNLHdyMhVgD3cpbcAG9u7joTS1TzQ07usrigWPsOMEOcNGIAtnjmM4v5pTIDuqRhYqj3uW+sHeZ5xoq/Z3SE+jQA+nClXIw6jde41zcs8mYhe9k375GhUziGcfqQLI/pkFPn0bdCv8mWLhhWZVeImpxhngoOSOW+vXY6GqjC6AvPCMBVyjtZSeduBGcBJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCxTQZ2g0EYmSOEYl7K/ZQX7MemRxPvIzjIT8f9BWPo=;
 b=jKfSMZDltxYyZhYsUNB7i1xf0bfQ87xkijZcKbJkqjsjqUFo11ztHdEk80hnhzRWGft/OmgO1irFp7evJC/rPQ5Mu6PSFeDZqNU6lCj90/mfNjrP/19MG8MrtRAO3jxNOX8KGNr0L+5Y0Ejm752bPC061rVXrLvrU+W/PJeq4sFfSpxtICTuVLH7yT0FQGaPf4ZZI/kHWtWP5G2lDwOe+JKv2ixRkm/7Z1wt17RLhgRgp2/s4f78fnaW/9mXWnHG7aKp8zKqQeQ/CwThhAY6lx8Ja7ZdqqHXmpfiqUrtDlzAdWwUksVR9xU2KyMIl7AmfuKOIVSuEmKPRZAuLi7dVA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6994.eurprd04.prod.outlook.com (2603:10a6:208:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:37:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:37:28 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/9] media: omap3isp: hist: use dmaengine_submit() instead of ->tx_submit()
Date: Tue,  3 Nov 2026 10:37:01 -0500
Message-ID: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS1PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:8:452::8) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 75f04b52-0219-4163-7833-08df39c05e10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|18002099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261026140227099003|261028144727099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	vcZ4UYMJS2MGngBnp764UT8oIrzp4EzT3C2nI5MpkxymT5h4oKTRaotyw2fmTH+/4xVPao2YSrciwM4pmX00HD6tpgXnwA5Tr7FYmYvM8pMmoyLZ/jcyAKagHRU/qUvcQG5Qp3YbVFijH2k8wmn8lfPETNAhwkM0+STSWeyJX6A/mVr+WXIPedVQdTLrhoTmNUnhBdsLzIePwmTtV9z4ukH2v/u1anRS1W/54DQfi3/JDZunlWj04RtYqy9ZqvF1RSi4yfmSfcdXXS3NLx7u3qH0rw8LwvbmMBy7DqTKHmDJ92EdSY/LgZw2EcwYtDtlan5zShcYDCEdkufjyT2MPeDKGVcS+liK61de0TRhSMG3WUQmyTjM2+e3u8Uj2NXcEQnELdnjejBcBwnujsAhJOyW5N4xnUyeUPj/q/0fYsCsSTBXBwf60HDZsZLTTFP18rBJwD93REGOJ5paVrvLrlouR98fUUPDJ0B8KfpgAgENZDgiq/JdMYCYmu2geLxE0fmqoNXaaQrG0G1hF8FMiA4a9rCWoxTtKuEL2sh6VBmnJvffK+ec7ukfovMtVYWzLueSPhG6zbhWm0+HDQdTai9G7iQYuWyYg2tfzsZP54h8Q2CxSYu+y2292F52Qr8CsUQS/a/A54WJKe9J4m87S09o9C5/N4PXKgOSCUwBFJk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261028144727099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XUQ2ZN2ZTUGv3QNpXM0aTZpBLerVnYnMIAyf54up1L9L6SohyhRxWsBvF3VZ?=
 =?us-ascii?Q?UId1BAU4R+2PdZ7sdxCKLWX77gurau6gE1gu0prMjMAJWdSg8z8LAEKM6Bps?=
 =?us-ascii?Q?2awiQP/l1VD843SfGT92mfjT6J0uCRzuiTGm50GssawyjxC3idUGceWt/ICL?=
 =?us-ascii?Q?P14m9nPEaFANOvOLMkIhnBWR3GooBAHO0dynYSNuGDmfZaDBw0yb/72dmfU7?=
 =?us-ascii?Q?pjav+13Xk1J+dMSWkmyDKMZkk6tiRFWGZqrk52xmh6wo9++SmKFOKYQtTZRr?=
 =?us-ascii?Q?RFx7rPaoPoPW6djSzY7ugMQpfVOFJrG9ABxJwTxz7L0YCWMgmSQSelCobW32?=
 =?us-ascii?Q?LG9DdEbUNBueR3DVyFYX8st1aVksFCbkMxXeHeRt6u0lKbojLv1IDHrHU3tZ?=
 =?us-ascii?Q?ZTZyTJ/sDJPGM6lEu2NdUt0iCnKqhWuYnhey1xhICK3ZtqPyAat9WbY4Mo2X?=
 =?us-ascii?Q?VvgRMt/O3HJjAvXbWuGCHvwHSOBx7z86rSGsmiqBBNpgTr0ToFR3zvGwXd9X?=
 =?us-ascii?Q?AA16vTzBH5+yOSE5/1BHP+NLppNq1g4yIecO8CxNVne4AJXOSOXER4LzWEqs?=
 =?us-ascii?Q?M4tnwgUeUYiJlcMvjHLwUEh7US7ph6eSBmUyrGwHjmJT8i0/Pd3etITn8Ow8?=
 =?us-ascii?Q?91FaBekZ9bYzW3ui88LiTi87PIxmJ123b/YnPS5qaJAJ+r325GqDsvmsu5FS?=
 =?us-ascii?Q?wEyXQAhI5w7b/03Ut7BvT170KOVi8Rlesk5QX5C+Ta73X/t9gPvBE8JJN8jx?=
 =?us-ascii?Q?+MiJ8X+wvSWvAvSSlrl/VPCj7Vkqhgie8KHQN6rVphZiT+2pphYUaRleRBnP?=
 =?us-ascii?Q?9FTUc/eNMusF5RbZwglloK68w1A/OD21t9idKaWhsL3/g7/0/9mTs+eAYstq?=
 =?us-ascii?Q?nzNUSCdLpeH9gC5FDHwxbk340R0jlISeW49pcago9QI+kZTco9yHtRluEdgI?=
 =?us-ascii?Q?mjdwsL0wbowiHVeM7muVFvmdlllkxmw9qu+9zruCW+jVo55DmQu44HtU1Kte?=
 =?us-ascii?Q?aymJdt1/HbdM8MMpW/udBN8gwYD07033H4G4k1FaGzhvdMI9P5IbdUccfJK4?=
 =?us-ascii?Q?tuWhsG1MoYO0Wgp3eiH7WXtblKiDIbP5SYIkzkJeKWpx5xujiPuUlrjGQJBn?=
 =?us-ascii?Q?YZ1KH55JT/+XYsgzGgaSIZQvKEAsVMbBlHez7ADaih3+gvI6KZzbYrIq26Lm?=
 =?us-ascii?Q?W0RRaxDySdEoY358Iz8p3ZDVn4tPSFzhEFRDN161DVUOYTrcRkMGfSu7XxMh?=
 =?us-ascii?Q?9vW6iEM3bTlKiBP9GBpK4SIp13jDjnwRx+XOvPwheVaITUYh/zfd6ThYqxCb?=
 =?us-ascii?Q?Xbg7OSQLf57537RF//WvIN7cpeSYemRlzv1rE2o6HYw9tl2Qy+d17i055lFF?=
 =?us-ascii?Q?xK/Jz45CxPHKIYpmd1qJOpSvIQcDG/AjMgFsUpwB/X9jdvhXP62e8VbCG9a0?=
 =?us-ascii?Q?ZSv62vIlDSuaeJZpt5XgWA3utAquz/8C5NhPONr3ZSGpEFfjHjdxw+zxuAeP?=
 =?us-ascii?Q?I/7ALzj2QRSwKDUYP6bjPUEAlGvDhidEEpIXvunaZFuttq0cJYt0DDwgmwIx?=
 =?us-ascii?Q?TH8C7+5SyLqg/6oAFPzoxq4uQFkeM7NvzvaiWwv7ttsOxumrdeKUE4+NMDRT?=
 =?us-ascii?Q?Oe/wNZzfz5/Cn1wscSvArBsiKZLHrbAC75PgGvUDHCxs9rmfm9+LLa2GZq53?=
 =?us-ascii?Q?vJLzmrJSvMfhgjIQ3k8TmxV7Xwcf6Zv4XvE001Ed6mt/kWWvGQAAUjRSCXvC?=
 =?us-ascii?Q?DzBYrXOIS+qogaSVHQLzr440aqP+2Mb0XRFUyT0QbUNxYQxjxgW8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f04b52-0219-4163-7833-08df39c05e10
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:37:28.5173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIXqv2wkjC//sUR9lVYj9qJnVt+cJJHTT4r4X14iO9rMhCtWe05zNB/x3seo/BL5JMX9WlDbBLPdJv6SS91kHJfuLpUG2iQZKHJUHbK85QD3lKz0PlnqkQ/rSFVC1nOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6994

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_async_tx_descriptor->tx_submit() call with the
proper dmaengine_submit() API wrapper.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
-none
change in v2
- rebase to v7.4-rc1
- add more fix at following patches
---
 drivers/media/platform/ti/omap3isp/isphist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/isphist.c b/drivers/media/platform/ti/omap3isp/isphist.c
index fbfdcbfdb050a..dc02f240ee89a 100644
--- a/drivers/media/platform/ti/omap3isp/isphist.c
+++ b/drivers/media/platform/ti/omap3isp/isphist.c
@@ -211,7 +211,7 @@ static int hist_buf_dma(struct ispstat *hist)
 
 	tx->callback = hist_dma_cb;
 	tx->callback_param = hist;
-	cookie = tx->tx_submit(tx);
+	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
 		dev_dbg(hist->isp->dev, "hist: DMA submission failed\n");
 		goto error;
-- 
2.43.0

