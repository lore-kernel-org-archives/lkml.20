Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.159.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793721089;
	b=U+s3kk0namqTIUkRDeZRUKhh+7H67Y1kEv27gGD/4F63c2ZhEuXO/8etxcXQo0s9d9K3
	 2Hj4u6lS2ifH6MOR8f1cgT4burIlUkB+MAiqXey86qvLGEQcFMno6/QwWZ8EVWkZCJHMH
	 AZr8bf49NGQhNsu7sAyAucRpNIRhpNZSVTpOemgacb//8BEk/4Wx4+biCsSxnfpEPi7D0
	 At1+OuZEGUmykYaYdCHNAx4rbS/uLpYJ3pRwhVHL/LMXOiP32mKwnM6wi7Bv0lrwzka9w
	 ysb2ciZh34FInR2eSy4avEYDnqJXtBID7Hr+BXZCRmpfzZi3Ul3mgiHx1K7nOS+RvzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721089;
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
	bh=bT0vWlBzYyvjgkzDecNJSXm99tFnqBd4EIqtDjUFe00=;
	b=peBnDpuut7RQuLnCOfkUQkKedZ7ziyMYUNfF21w1JqKjO/dB7lA5wlmU84NNSpMl+G3y
	 E1cnPAPsoxwRhuBE+3/OU3BbRFrUJ/0FD29suf2mpMohEhBftKcF/vBkgVN+w+s9lt40P
	 gFP81EkUITQw+4z7J+V037YiPCjhYt2OvtTbCA2p0l9dcaPR79+CO0RxQ33exekkNkpAQ
	 Sm11yeuecsy+DZtNvVsghfWImCrWoCEXt7xHvmNFjRjPkR20Mz1LqrzYdEVW2s76WGE+0
	 BROBnWYcimK4EJhlv+i0XxynNuKd+lBVdT8ZT7H0Ra1Aif/jbReYyVr+SOaQ8QusvMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CO8RmOsc;
	arc=fail smtp.remote-ip=40.107.159.63
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB18606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB18606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CO8RmOsc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gahwc209U9DwjDX02jlw8c2e9FHLh8E7r8Z9e9VzO4muL3IlcCZY1UiQ6OtdOMd7GTQ2o7CB/GyJznTdVA79UrCXC7e81RTzT4fbnl+jkxf1KN/SAm7eiDxSoUrgiXZGbwdnoQRfoCC8eWd6zVNKk7AUwWzLkW5ar1pzb+9ffyx7OVf97LBwnRlHy8AdpBmQH9fr0ZTYr5Jm1AmeS0YZt9Ns+ediv0xxH0pEo4iZbDistCvcVM4dAZNhqlbDtwGiJlLJ5Zzk1/46ubLMkDkfef0DSv/J4i4unH9u9Ox6Qb3GLTXyiqUzZ3KbI7BvzVoYFC84ytvmKPOCpXQ4UzZbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT0vWlBzYyvjgkzDecNJSXm99tFnqBd4EIqtDjUFe00=;
 b=GnAR6l8tz/sZsMD3NGPkqvikKL5oEA6KSD4OERAu6E/jkGX5hYBxIaLC7mVBvUkRLElo4Jg9/bT+JWDnGdf2IeQxJoFP9lg4zucQdwgZKE/oZUTbPa6yQcfm5DLCY9DFJT71yY/fo3LW4mS+NdoSH2XqC/c9fSbdq3Be/c31EGc0qT4hQr7Tzhcud/E8Z7vKisE8TTz2II9VqmJXFrv9ydszrGuHRnCf0QM1CqAgfOtR0NdMduYq2j8vb4PrVU+MPHYsQUcMW5o73SGyGRtkmE8rvEbF3HiiUFIquLdzTu3DDrp0BIShG43n+untroIMaKiqBltAIQMRoU1duIiyjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT0vWlBzYyvjgkzDecNJSXm99tFnqBd4EIqtDjUFe00=;
 b=CO8RmOscDvQhQh6vPDsW3RuXCvriE/TmIW4M016Mx3hEaIiTXUNoqHkEYCIF4v7/Vlp3eIDyU+/E1d9qFBdy6Ds6hNDUYnmD8mX7yWK8GrZSzXWNoGZ5okfV3Ck1s4WyDUZvB6HdJYxbK9MSfhZji8DcPLh9jrft3NoAt9SUSw3vAsU3P1hOsgGyIOK16/R2228mhdKFwUKxC/BuwWerIbqpVKjE+OBXkBsg54M2RT9iq4gsqj/Ro/37E1313gvu9Q4pw1xCJYibtUQRGh21vxuAUEviJDuNDYRSJj0czJUZaHw2JO5WyucElbSd7gnh8jl4gFQZg3EDZAyJRagT/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7908.eurprd04.prod.outlook.com (2603:10a6:20b:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 15:51:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:51:24 +0000
From: Frank.Li@oss.nxp.com
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] mfd: stm32-timers: Use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 10:50:58 -0500
Message-ID: <20261103155059.1247139-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: effc3f31-6010-45c8-a270-08df39c2502b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|10067099003|18002099003|56012099006|11063799006|261022105027099003|261021123027099003|261026121527099003|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	9mP5CioJv4JvcEsUFukUPvc72wIWK53BesU+qPrUldZEv4l87wGklyd+7l3S+aBtEyZCRj/EN5Obr9O8LuHouGmn+m0OIkcVABWxhCxjYT4wTdsob8x7p8ZUXtYuf0rLg6t6QU+kQCb8/ag5t9shen4x5pToaQEqum2E0vjB6Nz7DgFbJL2JMh+JTriGhvn3TbpMbHjcglcbZoOeTTk9slt7p+/rQBn4wTeqW5eTSRzmGjtG/n5iYOq7iiDO2ro39gB67aNrmhJ/d4X20p1hqZBIChxhTN8bqP/99qLY2OODuynGO0Ev2/yrAXZUNMS4QutgKYc3qVNJvpWTZxWVM3PMkcXYcUI7MRuo2IN8uIwxYscz2QZ9ZwGdMEq5w5/HUVZfx7UZ8MvxUIqlG71pCuidGp1xl/x9rNz2NGzFZuSP6W1K2iOdbZdCdTxLcA8jfMQCDuZeC73lL8Gw+BwOZN8tlUYSxF4o7ty/GgaFyB/BOCp3BkngImKbNLwA5DMbffgfXG3dU3XYTpdkuQviFs+z1oswU30L6Sgta6faTkXSld2CBzH1LcePrpUcGPPvTFlNo+n+lGZMa0zjbocprUEKUrkV6Mdw1+JatprDbWrSqIOEfIARRe41TZVhM8pdQDKTdco8MJUMG/3qaZF+3JmyBrs7U+5zHFygGIuKBtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(10067099003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261026121527099003)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pN8UdCJitvnNBl6CvvofMEvaPCycmliFNa8PkQt5BQLOYzWOhZVHZDbHtc1G?=
 =?us-ascii?Q?zx/jkeSMbu7+XrUgjobm7f3lZfNq5WxJ8igJO8LKhppV9YpyqaRPJGryRxw5?=
 =?us-ascii?Q?CZoQPMNnxJRwCzrtC8YhA368zyah1MzFUa44SaaRiqx0d3sxrvqBDNXYn2A7?=
 =?us-ascii?Q?2wJi++utxAB3vWKwWE9pUuuSULiKstAySzDeX+1SY84jx/2mziTMQfmby8Hp?=
 =?us-ascii?Q?5inqBvGhtWS/gKdNlYsrk+p7ADH38vF/Hdx8RR5gXi+ZyOBlLRqH/y7C69Pg?=
 =?us-ascii?Q?wSyHNX9QcJ9NQCC2QzUdFbAztkuTbYNXXbWbQO8cqBIxa29ycdhtZpy7hcgQ?=
 =?us-ascii?Q?R87sNVydqb2ty2zMS9E/vO+jpDDyYj91/hA63XlE60nOOM86/FApw/Tvekpw?=
 =?us-ascii?Q?SkLNuw+JM7TqwDNr7mr4tt/w0v5tTScadATGpFeKXxONvW6ScJYYgWbD42N4?=
 =?us-ascii?Q?VYhp+AVZS0EW/EThPFzFhosbzYjZh89HC0fC84GZj4olfZBt3WWtos3PthOO?=
 =?us-ascii?Q?wTAWUy6kZ44TrIiV/hxMJlph5AFOb4UXWaCC7hKOWZADhy/HBdXZ01OqTcrh?=
 =?us-ascii?Q?XEPFCHmwmXADcKrKbtHSUAhF/pBhZLZ0+QkLnxJsBqAhz6GBM2V5YYV6RYjf?=
 =?us-ascii?Q?H3tJJDt3IHyhTonHPebv33Wf9h1CAkjzYrqsrR/EhB8piNrgu/4o44tKQet6?=
 =?us-ascii?Q?0ZHvctyZ18XYCbQlbLJIdpsdPRK4MjUiU+cZkKPYIewLQDYk92yWz3uFAP7t?=
 =?us-ascii?Q?xzGqMHY+pvj/DCpUxiYhf3iYIrf3iAnrvmN3BBgh+4wnvNBIkYsDoJFv8BlE?=
 =?us-ascii?Q?avT4+HE+elfw/NmKg4iIw61+MGyG+yNSvX/XKX4hD9LY+pvrEVu1KXxSmrsI?=
 =?us-ascii?Q?Iya7L+/7kTiQLIOwZkjMVvdeAINlF0tDYgsB9zitmmfl959JOOfoi1VbFDjp?=
 =?us-ascii?Q?UlkzwfnvJjfFCTRgHQMvzsTAqI+Stu1m9Nm1gkPSNYmtG+sZ9bpMfXrxBMRW?=
 =?us-ascii?Q?v4uu/lPbnI3fHUtI5pCO6V1ixxKUIDT55wR4D5EyG+QiGTLclhu21ZLsh6WF?=
 =?us-ascii?Q?zkbTJlWWSMFhUcyN+2Ggjwqvleyi7bMVjWGf6jOzheSC4+IyNHSpIkoF9IBD?=
 =?us-ascii?Q?Mv9cfXP0EuHiG6tm4h+ETRmtu5pcRJcwjmp3h/O16JoFNpblDb/NpEHRZrl6?=
 =?us-ascii?Q?4Y9ec1+YlxZxBwqbajiWrmEwXstPUY0wCee/KIDDnm4CgPRdVqB7b90ypOUO?=
 =?us-ascii?Q?2dF5ZhT8Z06lka9xBrqPoH12FlnwZDci+42J9ku7zP0jtOiLTP4MsF+X6+uh?=
 =?us-ascii?Q?4h/0uMLp1mOXzqOVFi8LFtVyAefSnf4/zTccFi7Rm2yungAWK8BvXPZ5Y7rG?=
 =?us-ascii?Q?etHVLwU5Xwf/qpYYLxY7jrZELyjrwEwGgupUXOK3RI5G6AJ3cF2KdKh62zah?=
 =?us-ascii?Q?vs66Y/nrmHcn1/g1/fBC4WU9qU/ip7QwNak6IvIlFamQS/H8oupNA/abTJPJ?=
 =?us-ascii?Q?EU8P+U6HYhUsZRR9WbiROo2ZHc7ODeEIcIg7m1ciLvmry+ycFPabtc7P4F15?=
 =?us-ascii?Q?1cVL1fSVUfHvLRwHYY+NDsuuxy+iJQdZuXeEI64+Q4m1s832vyVedQwvndfj?=
 =?us-ascii?Q?Wt9LgnSj3usMZkskGF9OI48r9DH+XauNHIFrK4NKCf89WbixTAp9PEdUt1p/?=
 =?us-ascii?Q?ObagXPBIo1spDqz0CDW+yhOxD2H8fJyRL3ANI9gyLboYP38uS8CCdxXZGOou?=
 =?us-ascii?Q?IEmzUcMzepyxNHK44OLxfm7sp+j0i9wNhOBzsWXIPyrhS1KLg6M9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effc3f31-6010-45c8-a270-08df39c2502b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:51:24.2064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yOyPatLz8rYrJjMLJ1P8YyXLUsjdpjLYCWE9b3APT3iYneHpiNHiqnYmpzYDpXovE0M4bRfVRtSLtssjCjFWDaRbmD378Vc1oTOkatfPOeeoXPmYAu+l4s0DPOCUkyP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7908

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with a call to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare make to struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- Capitalize description at subject
---
 drivers/mfd/stm32-timers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
index b3dbc02aaf798..4f344f2a5a26c 100644
--- a/drivers/mfd/stm32-timers.c
+++ b/drivers/mfd/stm32-timers.c
@@ -102,8 +102,7 @@ int stm32_timers_dma_burst_read(struct device *dev, u32 *buf,
 		goto unmap;
 	}
 
-	desc->callback = stm32_timers_dma_done;
-	desc->callback_param = dma;
+	dmaengine_desc_set_callback(desc, stm32_timers_dma_done, NULL, dma);
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
 	if (ret)
-- 
2.43.0

