Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592653;
	b=AmsE44r5VrIogz/JQdSfyYWkgL8PG1jhjq5R2cguowPqgCdOTKnoYbLWkFNEpswoM2F0
	 WSuAxIg1CkGryI3ee1OgLMsWQZ3Y4TQKt9D1OwKDVOe3ONYGQ0hTO0PesFhWPmvDTN9sx
	 YPhtjB9yHiPDX1l6entMKtd6P4R6fXBOBwIRqlEf0JwPMq1fexPxGw+224ukn/eCr+vHh
	 1JrVOEXOsZpR4KJEtG+vrc0n/9RDhEx1Ja3M9ynWBFI6KJg1FPqo2/SLaSBhSzm1KsxmZ
	 WEOvn7rAX8mAD+RHIz/R9Zv1vkkcps0yFfH6PqSbJAwm9SYa8vCUeox5KVav+dAMYcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592653;
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
	bh=eJy0EWpVqjv+pSpUB8NBQJznN02AjD1aWgjRUsz5z5k=;
	b=XySyph5d7E/mOppGrp3W8CUsB3oTaJUpeZBmexWOIm+pM0JHQhy8cmoC1CyXUx5HttCD
	 VVkjM8hvmAwjqIWemDqE9aWdeBp03MKsgyZY08M8P5TLRbbl3vysj6EcqlxlDfyRQsICk
	 MgXXKwAQfIyTsvbZnsORqFFPdiQYkx2Z36bIEoDjy9iRzudECyKtWihjOTR0Rbqffr1+W
	 o9pzKQk4LJEGUvyBDhbjXCqmUyXM9hXca6SkqDYZuXs/yF6eBmhFPYeqia4zIEzuP3YEZ
	 +w3jhI/wivu7x+KZi5yQknLv12comYtAoDvqRwKUGLa/N0vWl22GINCnCWBAx1aU0zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=J7e8jf1+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9168606ED8D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9168606ED8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=J7e8jf1+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q42knSWluJ/XXntsm3TShVlnxDS/MM4I0mMjBkpjoDnqcGKKihBTDxfIPLVObtvEzPavCuoZB4NqFwdh5s7vAhPVtBTwfcuO4s1VNcqMKyvWWMqGXNpPX4y7e1Rg8naoqfAqLmwD7wvjBbwugtmPxGJtmJ4smcTCoVBTi7HLQRC2IvRg2BZue2mv6TL/8SUEifTQR7in7p5iPy/7Xy3IUhL5BHxLA2qHSjY77frHIJUQKnP999BCzxyiizb6CkdVJiHNChBHxy633Ye+7YIfbNoqXq/kYNMV6KCVNZ1bnk52/Zsf662MylJqwbvtPmWO+MC7O4KMGDpQtgOPzGddCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJy0EWpVqjv+pSpUB8NBQJznN02AjD1aWgjRUsz5z5k=;
 b=x2VXiTkhH7K4KWWXHNDGbE2RujFzJ/u7ngo6BRUSsoRFMI7d6m34SPuBT3SIKt8qmKoEQhcOqRPuMY4Xbp8qG5MhfXvCQJfyNAlXrQc3vd4vMdpNBEj05FsT6pVvcctzN6IWl+9sv/iC9qjXOlhKqqebBalVtrtdhm2cmO3pruLPFtmYX6GNMMBZAPslYqTv3vO2OVyHK3CQbAHDMzVhnk8NKEC8+wY3Dem8d3AuVSBim8XdUEMo9kUEfve9Mymq8LuuFQEeK77mCYx7p3kLmBALEHxhEvP04BDcO0tl7iFURwfmiySJdMvzSaKyF6FHyiw+l5dkOSdGve24cgTd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJy0EWpVqjv+pSpUB8NBQJznN02AjD1aWgjRUsz5z5k=;
 b=J7e8jf1+JOq9yyoC2vMnfDOqMxVpy2zVX+uqExOz0AvhEKrW1uh+WrA6hEVJgnv8t83jHEd2YqgipM93WYBurR1oTjI1h/GFVh28ddJUdrCID55VqlRpDT9Hbg0JSNTZiCXWY5MM1FBj9eiV4wb1+TcdL7eIleEmZc09c/OCbTdaafionnNrVMGO/2St6QPtUkuzem7yaWRxFOu3HcHwaxFY/HtLeIHJtMT7qm0pjE859klcibEMSGM3GudTKvK2zIW8EMgEl5i4IVtpe4axw/KhomZpgkRrs0k+vyhMMeW1shz6woQaeDGKtbzbYIPMfzNO/wN1p51LRORO6XEvDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10380.eurprd04.prod.outlook.com (2603:10a6:150:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 17:57:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 17:57:28 +0000
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
	vkoul@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] mfd: stm32-timers: Use dmaengine_desc_set_callback()
Date: Fri, 13 Nov 2026 12:57:12 -0500
Message-ID: <20261113175712.4189110-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR06CA0097.namprd06.prod.outlook.com
 (2603:10b6:5:336::30) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10380:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d6f32f4-e2e6-4a5e-a443-08df41af94dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|19092799006|261026140227099003|11063799006|261026121527099003|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|56012099006|261028144727099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CIUxtNktzloydYV31ffNMxIZDHwhWYVeIjzeLYptsMoq2nHWhso0po7nH/Ag95aTmWsJjZbvf1Yia/Ed+bW+Q6oxwEvR139rPFA1OoolZwE3P0n/vNzCNJMIOOxTgoPJJtoBOyaCJugvDWmk9X8TRjuFaSzpF1aOpEko3A+65+YlRc6c5W8LDIdPSeJr7WR39tWhu+O470XK031bOHwGct5PutqxyMtDfy5psdZUxMdxpVK2BCBzr9+7/bBpEEbzQZ9cn5UAd2fvKxRh+TVk+pEe8LmWyh/Qtr7RgGHQRRjyqx+FgsXC11GgFMKeH2dFY2AdHtoXq4grUu6AWYeuHbaWFJlorqkfnfBTcnjiLWr/gDDhi9RWfsVSCGCx23gX5TjBL5UibSUFPHkbEJvtHBtJiMqWC8csEY++eEQnL2CqXeMJip/Xmc3j1hLV+A2p0IsdTRj86GXDrmuDtGuexs90FT9MUlGmfPY4aSEJATXXF7rEJny3RBmV11e466dxeyCkNlvNsVnf9pTguJLYB8ET/RkDO2urkj5wHrq0MUqt4bsroV8Dsa0rlibB1rMj6D/IVB7XXFbJ1v96EY3JzMNhfqV9Hz8d0GfaL5BMIVUgAQrnTypEvktf6Cbv8FNaYkQiJmDa5PEpX68e52zAgXv2f0IICBnGQsWBzQWuJJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(19092799006)(261026140227099003)(11063799006)(261026121527099003)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(56012099006)(261028144727099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E+trdFstcX1W0a5qavnaBAkoS+hqOToFGklLCOfzdHMY2u1f6mR8tDtpI//I?=
 =?us-ascii?Q?GtB3CSXepDQRXzmXwVh0n0z1/sPj6qFV9i51jbgl1csAiK5evQywy6PyPP+i?=
 =?us-ascii?Q?bt36f17Qf+E9GoVNsIKzewq4GlK6Wvu0P+fzi3SoAC7ODw1tqmLYvvSbaM3g?=
 =?us-ascii?Q?YCDlgnfKxBnfNLLVHFp4/saehvauS6Mey2xBllMettfmxjgQSrS9zplzbITC?=
 =?us-ascii?Q?qT4AAGFzLeRdRyS2lxuoiEDPI9+BRLJgVk2dyE+7ll+HMpdk/IbTIawVAATr?=
 =?us-ascii?Q?up17ZT+GGvVZIG7PMzetrflBn4XyncwlM4ZFhsf44bA1aYdrUF+MdAVyxg+0?=
 =?us-ascii?Q?6XIUOMHWh8D75NPVyU8zj6irgYqXSTk1c+lju6JFVBNl0sZB7qJIdUrCDn1H?=
 =?us-ascii?Q?cAqYbeQERk9I603UFMx9KZAZOfn7sR2Oh321trV1vgqTBzDXOboYNRurne0q?=
 =?us-ascii?Q?p//dQOeerA2VdRgPkN05yIJqlDsh5JQDChnIP++8o5LJRrAQMlsQhhPPGFKf?=
 =?us-ascii?Q?A0B8JqfZ7VylcebBmdqqAW8bsZnxZGLg5phu5XcmpGtD2IPpEBzb5Bcgrl3L?=
 =?us-ascii?Q?ffBdihWAkLWz9EIiqmi2o9vbHSb8oJ0A0EmpFBoESZAOvNNBIHyhGmjJ2VPc?=
 =?us-ascii?Q?Likex6uBr5OYzgTJPp5FjllvUCabjU4FO2RlL0e8TtwtisioMWhEWe/mWOqn?=
 =?us-ascii?Q?/P4+5/E/czSNo6yfor9f6c5/Q4O4aDs4bjOGRltQqZOevIaT5FpfveNUMfpf?=
 =?us-ascii?Q?tpB2OUSW13QX89zBi0CKVWcQePCgDXpHIo+Ol3EGOZ1YueDuPQn/Z8fPDdo0?=
 =?us-ascii?Q?Qd7ZKBEbcCAHVosD6HLiDLj2t+Vm8DaokSg5iQEx7xebPojQGYZbrYBC9Uzz?=
 =?us-ascii?Q?o66iH5IQUNVoyILNCwUzJfBbYHjykuB/nfWl8BreuXrwfW3gxDcfJltUbZZS?=
 =?us-ascii?Q?A0RA6vwYaYQI1tT+fs1dktTj74XVUYJPRfJcRvEymVtup85K6nw9PIs4OxWs?=
 =?us-ascii?Q?jvtYISk1IkfC1zbM4TI77XNn2fiHIlyvzX/ovpC0Do23F60VDko61k2+KafJ?=
 =?us-ascii?Q?xnUw+mlGrFU/YZcR+vZ2U/dS1XaC1Ru9AmjlVoJdn8Pgzbcd0Jh/phIQFK0d?=
 =?us-ascii?Q?cXxhKcfZAo+Yikz/XbKtkjU9Tufl9bkhwaLRkbm+ZPrX+xPMASHv4gziqhZU?=
 =?us-ascii?Q?aCSgJ4IvQyH6IJlhSfTzQjWx27FNnQ2oqQNGRhSLcmrlQuOMZ+PDgJopwQy3?=
 =?us-ascii?Q?q+a36Ir3bE1bkmIhI1BW8eY/hBQ60uwTSS2unRZRFZz8f9t8zkomMComxdUJ?=
 =?us-ascii?Q?mU4tc21nD9KTddM4Wru7whXpe0/RQhnAmwXVwdiHLGcUQFevpNpSrtSXJu+f?=
 =?us-ascii?Q?5b43JoG9iOO+p5ZFnCXIT98+TW+EsgP6RzMPYHLikPRx6DzVu9ovBQBQqAMQ?=
 =?us-ascii?Q?Xa1x6gcVJkKcJwOAKSMG1lGQixx4y/fgnkajRigWJSOzzkAplm8SG4GU2NYE?=
 =?us-ascii?Q?R1XFX0kx446PB6vNf79HMsD8v+RcH5lB5x7PiNO+8IiEkMrTQ+M730jGl87u?=
 =?us-ascii?Q?/Bzu3HIlhpDaLPUQtLYVZecX13Qhb1simm2Ua+vfgkA1tgIAXNwE8R5X0oWC?=
 =?us-ascii?Q?8DPb+nGBsl6N3JvzwbTNwbF/sazFTvFfmFYp4v5W4TjBViL8I0NpgPRr1NKV?=
 =?us-ascii?Q?rvEfjSbdn5pAdk+/x9HapZRC1PNx5EcZKjHbU07ZE1vFrs0DqTrSq9/fhGsM?=
 =?us-ascii?Q?fjHKugSlC4OCgubsMqCPprVXVN19uijn9AHWBUM6/PJgsVcPcZwV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6f32f4-e2e6-4a5e-a443-08df41af94dd
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 17:57:28.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rywukVdATWWesGYQSpPw2qQCTJjUjh80boEUKxc6lYmJAPZ4Rz1cu9YaT8d+yon7cJkgfNxEJeNgSSTHTk2iOq8denHBUFadKkr9jR3bO0vqXyxSeOe3QKBfFFuHcOrk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10380

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
index 15e8a62c28819..d23ad342ecb13 100644
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

