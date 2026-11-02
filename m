Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793648830;
	b=PJp+si6hMsWt1prkVWq/nGJT8mO9v3gk0LIY/irW1kSrSs9CFc1+eh9TdbyS9yXETtwB
	 aS6c9/zkj+90aPCNjOFRCiqFrbP4mTD3jDvC1k9yOXyglxAJyFmxFZs0eX+a1sdEIPt8m
	 fVRY216T+GBaZWtK7a9PQHBL3lCQU4y8M1FnrxjAP20rlbxYKZSgwgHw/ud2rSa4yk0pK
	 5QJplxWtTSv35Jc3PzSh+w7VHRkMTQe7kL2gT1iCb4GHsKAavSVs8YBin+m3N1mLMkqzK
	 AnGpDJS9p4w5Wk9dqeAKVYMPAN14RcDI5uWMy0a8uTc3YotOBY+NWhSZupRG3szzkYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648830;
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
	bh=zwTC9RxlDNeO0xRlfBDbtCeAdEMjZXEc0VLk4YQjqsQ=;
	b=mQc5bAc0Eh0cxzo4APpBqQT8jMGmPqrls+KB9c2i/uKaoZA5hYGILyNQ3ecnCF8q18ho
	 assT73Ox0UuEep4aCyezwXKNCubAXWnbVXZscmemTS8kWGK6uf7kHfDyhRXurVKwtcKyv
	 Ib9vvIrS0b1pINLaEBZcaZUEGmfEQ0VUP3KAOyCMe6EjPSbZWSeuPGKWKz704BWFk6yFT
	 W9ez9BDRZ0AuQdPztNI9kpxkNpQEBRxM1NcyvfTDY0x/hqp06ZT60vsrDR9DQZqq4x/1l
	 ODVhM08mcnnlvmhFQcpgKMqP/JHTD4M0+cv7Y1koA8xayA3vrJljLIMYtPHacAvUayA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bnanBJu6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.20
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FDA606A32E;
	Mon,  2 Nov 2026 19:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FDA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bnanBJu6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vu5ZLtqZpOrD64g/17/ZRMpPHbavQ4MSS+kRQ2iLMYtO7WYRuUjojs1crePFPWjlMHwNLxr9Ufb3SHWxawSe73utbSt6MMIs0qK3Ey76/AAXKThl36hGzkNX3k6KblVNcwW5OkSc4A4sinv3p96NZtY18Z74ejz1sMl/KYQnpJPNyAYbAvG8NE09MJTxQDf+4sM1cXqxXNZaqyHUJCD20fp5KBo1Dy54DDQXkC9faqqpQ2C8h2phNmGbqGY8yOK10jfPw5+shQUdDOIrmkS23/F+LhrR+WljDEZk60WGtIym6X+UXTxnfXKffpjlEwa795GXNd0viVY1wW6jnnIX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwTC9RxlDNeO0xRlfBDbtCeAdEMjZXEc0VLk4YQjqsQ=;
 b=Hq3PndVgQgjiLpCiXLLSbSHBdLGx0hD5ccmEMMGLOvvTdBLKEZpnSrW4ahO6ajeZpohN60qOY0uEOGyJVMXdj0LvJFpYsmgxx0iePdUWqL8zIRwmYinpvJcYP8H9He26oKuoJLg7zWiS+vrknsOG0VffXwri5n9D/UhdfQnWpH9JOshGF9oYnzysGQ5Dxr3ziAmkrQW+gMiyACr/aabuQJOs88oh+NXgtuWra3LEBOJ5HNmKApmi+j2VzRafgNJG8ggCQDgff8kVh/Yta3F2nWLDqCfCtQLPrdt+UBKLEXoEfAlEppYKME+iOa+ATDrAwlxmdpAys6qAJZDcKaIVeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwTC9RxlDNeO0xRlfBDbtCeAdEMjZXEc0VLk4YQjqsQ=;
 b=bnanBJu6dRNzNHynMGc8LO0Iuwwf8FRxAVoeNjgmy+eTnoNQnvmrbTc9VzxhumTZLT4ukRC9h7nRDwhtMtFD6RI1JNndMgQcpkPS9FdWwBnIRuDXsjLXVzbIc43O4f68zUgnvabjIpKtXDo6B1j3yIokpiRtnkoOaKwYj3K3ZxXWWZYxP76LjGNpA2Y7Godzh/o8UkpLe/1iOmvTLEpMFhVWUgvV+dFjvJxiGioWytJ2Y2OmcoysRJ3abYbyDV+PXU9Ff/NTaHJnVJQJHJ9It6XLp6b1lT68VKkSq6N/4fzwjNJuRUOyBkPQ0diYnYPxvirucz1r9sdgz8HhCQJyLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9282.eurprd04.prod.outlook.com (2603:10a6:10:36e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 19:47:07 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 19:47:07 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH v2 1/3] media: omap3isp: hist: use dmaengine_submit() instead of ->tx_submit()
Date: Mon,  2 Nov 2026 14:46:48 -0500
Message-ID: <20261102194700.4076807-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7P220CA0073.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::7)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb575cd-3e4d-4294-933e-08df391a13dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T/xT1bq6oURi535NJDzQ5GXUCiotjKBiafh9rpbEUkJTbH1C31KJAevljGSwM4bxzyYYhQFx4DC4+9xqJco2y1PFGk4HzShMYiMd+o2tHXXfCIobvbD/osRpny9GSj84pyLy3bYj5JXpkIfKTms4Rjf/1QLdBj6hi0QQyVpqsIlwa8p0g7tz9doP0SuDNa+vh+o7jitN+xur7KJiJYHGY0fMJfRSpoocJrY8YBzckXeNBiHAcAZsjVHwjLZmmcO4hT/cHUECSdtVNs1yyYCvfcClMucrdONxFRWOMlZeDsZkAaoKLYqyLUIPqfFccFxwFIFeq95Z2bfyavULrh44tAwMgwe3HgXryoQirqj0KhiOhAsn3lIamuH6LCdmKuFKNp1bNNxaNY9Pt/pvQyu/LKJCtvrTx6q4fV4MZ1cudEE2vhlMRtTlD61TPnn+ehPLmy2h4/W0WQ/BJZJPpnlyHt3qPS0/aWHGj1WZp9Nf8fmMs2wYknpVS9QLtylXillCFWLYIKA7YcJqM2bWLcL3n/B90xhgB/yGueFWw21+X3Cvq+0XZXjywrLofFofXDbhuDQvFO9iuNoX39lLUdZLfkLJgtcI4leEJzSxe3ti5Kl0kRCiBLiQu1cm6O/AfqFQ1ukLu9wcba+vNELHdChfFFKv1UuabaJKdsvT0SG8IXI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kZM8l8P0Qu8yact9nNyaiKWliKvVONRmEZZkIGBjCQLW8Z8Lp467bEfFOji/?=
 =?us-ascii?Q?IC2rQbosvxdrBR6T3ACkgmUE9GdJzZW3Dn91CclYGVFKP0Nacn0LNAWwjMza?=
 =?us-ascii?Q?MqRv2+Wo033PU6CVSNaPydJtVXqwrsU6f8qfB2Jz8kMonbCWa6DhjjB0IZmw?=
 =?us-ascii?Q?r9KalLy+8CX249LxUR55UYNoC67m/Aohl7yuGRUNx4jXyU/6Q1xVNyUw9yX7?=
 =?us-ascii?Q?AnrchfsaC5XvRchVMM7H47VHaYyiZGHnRQqlHfQmubJULhUYKcHT/7FFq5gc?=
 =?us-ascii?Q?mwVe+bp08BVX/8odstQRCkpjbAmCOTXP3HRHE3mFtacnXj23CvBpFekhKRJq?=
 =?us-ascii?Q?tVRe77G2OZb+R07rBOawdtsuKyRpQVvYT6s+WXluyE2bHsl7bWqVV8aJ/U40?=
 =?us-ascii?Q?sr3SpggpzkOnyMQnVnUswQtkzS+coHON/5g66wPdI7e2jReXBsTsy7qJwp4j?=
 =?us-ascii?Q?asSFq6dK/vmuwA1aZhs6ab8NMr/ezLtbmsRl4Rbyn+g4X5RQI8smRzs0dPZj?=
 =?us-ascii?Q?J0bPbtTJhIxAwWS/EzSfMREcYFXfeMDWspUKHNufoMq15Pq+MTHsHOcyL14R?=
 =?us-ascii?Q?ndiEYfIjfU2xJ4evvtelLb/Z7WRHCLwEwKG5vn20udmuflSjGzryxQv8TJvB?=
 =?us-ascii?Q?zPnM0zeJKzu7FBd143JIp0pV3qsB4WnWKAaJcoqIQoJ42v+tOeLYtir6uJqI?=
 =?us-ascii?Q?hmfzj8woHsxrRXnUioL9b4/pq3WEiVvP77cAa0ERiFb3ESUR+Rdk8syxA0gZ?=
 =?us-ascii?Q?Ia7bFo+OOgAg5UV/8Mjm5KrLwem/F/hTnoUuG3sdcTnx6PnaqxbW0YLZ815t?=
 =?us-ascii?Q?P4zh50Tu4FbRzsDfgmyHiq8W8YOVNK79YhzSrCydxvjjhVgNlYZh0Nt88PC1?=
 =?us-ascii?Q?GM3O4clN8FXWRUXquQNsteTOL5ukRChQypDo+K6rTWGhXa13RfT3TwcWOtST?=
 =?us-ascii?Q?afMwICxCVat5/8sjge7XiEb+x2z/W+9keg3iJJoAiAj+GHNIGPwnwJ5R4s9D?=
 =?us-ascii?Q?DZTNaEjLr323rqbyiWBq6Mls4l4R3tHUaAmH02lgVIFImugPP7GH0VpJ5XvL?=
 =?us-ascii?Q?LiKPtcA6ba1NOhyyZ9sNtQpgUDrOwN361wiUoLN3acl1eZD4bGX9+CvsvS/M?=
 =?us-ascii?Q?kJSjlbSgAiu34uYznN34jVvz27zJk3x6UBFu+r5MYmYGa4zir7uP0sGD9bzo?=
 =?us-ascii?Q?NxjLn7dRWRj8I+WbQcv119YG9R7zKje1Q+ZL4FLvwWy5pVjs7Pq1Aq6VRWqy?=
 =?us-ascii?Q?X0uGQaDIrb1UmT+X5MosXemothFRxxc+L3WbNyvQOerMmvKwGu/sUG45Wc7Z?=
 =?us-ascii?Q?TlBb522hiKVmjuJgV5NMCDgIohZgoHDmmXoZPOWy2HzPSoD2NGGNWvh5I7L7?=
 =?us-ascii?Q?OIwZHhjDX/9BiamDEby/tzIZQmKr11v/a3X+CI+pR4uvqS/BqgQhyuf95POL?=
 =?us-ascii?Q?QjBdnyd8kzPTlCwqhucgoMeUt1Pt2d3Uz4l6ix25kbtBw5SJVx/5Hbgv+drh?=
 =?us-ascii?Q?XZJ8HWBJQb6fNvsoBA5buwFABPj7ehV+IKV5WivEI6D/nk7pNOzpq2DsyZe0?=
 =?us-ascii?Q?zBrAwzvlGPpyFkxtqTOQ5taeoGkO8u7aDzksoY66aHITI7hr6E2XlEtYR7Bv?=
 =?us-ascii?Q?WRsqUMQnpTxFPAgbZbpGPJsqKWC+MAQz3eoXIrSxhTj+LSa31vpELSn8kyg7?=
 =?us-ascii?Q?1+O4ccmK3pa3PNj88NPsMyAOhsGAhOvJK7dcBXvx/Os6UQf4k7+LvYKbEEo5?=
 =?us-ascii?Q?JWgLgpyQOgXEDwNO89g0jSKRoHSlyUnYIwFe7PMKaT/rCtAX3HQI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb575cd-3e4d-4294-933e-08df391a13dd
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 19:47:07.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKV/5C2BY8uxFjetCd95VJa4cmQWGDwgMnR4gaJH/WrunT9YqJzLGGpv1JKg+u3cNpvW5oTXL0a1L0bxhE2tIle2YpWosL2DgrLGw5QkgTmxjZD/nrq4M002ICPexjFY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9282

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_async_tx_descriptor->tx_submit() call with the
proper dmaengine_submit() API wrapper.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
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

