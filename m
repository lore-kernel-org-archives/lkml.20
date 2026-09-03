Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB171283FDC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405281; cv=fail; b=HDJVmukOijfO6N6UMmvBZ5r2D0MVP7B3toHPzXoX5qFItkdxKKga6ugQWBkswU8gXxPJ/H3VdNkRQvEyHG9Mx0eekisnEF5sdXrZravh9yDYgNykJllg1S3oxS1iiooUrQP2xRgkQDRoiE/69ejdH0RAPBp5rkIlh32oTDKjbqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405281; c=relaxed/simple;
	bh=jkFc86hrqGmIAOqhEt+xuPnkPwwaQNIUXZ1BOcdTIZQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dHZzZaMR389B/nVTTS49keg+mthB2nD8Wd5vpWJHfYcEOtOB+1Ew8p/clG6uj0I5r44tCs6nXOfcJC9KWZ8W+uDymS1v5qO7GPBTmaNvFkf8KnUuh7jhOIIsvB8E7J33HdSzum+8cKRsw9+Va4wzdn+hj4s8jPfnjTB24CSPjo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=bkGgYgW+; arc=fail smtp.client-ip=40.93.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="bkGgYgW+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJd1yirJcrOSbk49rz+a/LtNvl/3Gm8W2SOSMOGHfP7oKPJAYg05lgsY+YhWy1O+MlPQSsf5qJrtKYHiCAmJqYwatcMw8kmg3kgsNXZmt42zOPlcAxMB2iFd59ys1WmwuT2UmsjlhvTWZ4NitIfRTuXCRg0hP/Zw7VNAuqKGhd09W8FKcEVd7s31mA3UBtov13R5T2vLU6vPcSDHCVZE70zEEPNa9zM4LMiNqwbKEDgowN/HcCc/WByzf6OGd+N7quUm2/DQr6ueRu5aTgoF2PrqIL9/wMSX43Corpip++UAeg0bGKyjxKdGmGdgnNVIszLcO3KHiIF0YVUaAAXp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0soo2mo+jNS2DhEAmoDOWm5x6R+TiO4o6vqYE4P0gs=;
 b=kgl9foTnZC5YMRmXSk0Hsy3aKOCGHH/1k31lEjByadLZplxpuGvwbuUQsneyn7AvlSlEQzyz6zqPS+9eHxVr+yjS1KPrSmqg/cLVKoTrXnB7oCc855RLYDp81KcjcPg2FOtzSlevye961POtw6VQrTuwPcsFPb0FRj1BzhFNor2xbZ0PjSUsOaBXWvOCyV6SK6DHy8Sc8C5/8aPnoOYC7LBpkDsMOcXbmOnsnI7OOFHdHjjfdOhv01vu5uNAo1maNK37vUBzJDSm2PcHhgn4leQCgEklO9F89sR2/uCDytUzJyMNLI3TLG2CaMY7AZe+P1zOBlJQ76bfbmZybMcTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0soo2mo+jNS2DhEAmoDOWm5x6R+TiO4o6vqYE4P0gs=;
 b=bkGgYgW+d/T8+GaWTdBOB2rVx2IK2bJiDw3cNSYm6z5Gm5xof5sZ250rj52nMptcoqkQH1+fsl9ezfJwAeQG348AahXzWBcqsBrC+M/k2L+F+dwuu9U5VUXkJaNQtO3M/jlq1kMX50TQszzePIUSy/JDiBwYe6WpoC2WvMYDwsb/9C5td4963YDI2+muuLaxERg51qCrpircMnAWrdVc81GfCv+6dketoHfDSFp/paGLuWyzBNQjd7P616eTih5aLx4Epi+I058EH0JXPWHd6m5dCzKvGqRMDpAMSAQeHOAEqdepTOg3ni24arAfXmSO771Bt5INIqGv2neJIshqsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7502.namprd03.prod.outlook.com (2603:10b6:408:19c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 03:14:35 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:14:35 +0000
From: tze.yee.ng@altera.com
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mtd: spi-nor: Fix unbind deadlock and use-after-free
Date: Thu,  3 Sep 2026 11:14:27 +0800
Message-ID: <cover.1788404586.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f3f4f00-f289-410b-aa79-08df09697ad2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|18002099003|55112099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	V0BHZzLBMEMejdBMszj2jErF9peL1F+gJkjAHV1+AjosxIFXkV7RH8kkkjvwUHo818m1W0PtZouqkEm7ZlTT7SrYYudmURELpvl3HbTn3R0FyqAVePi9AtekWKrizHJikIAJjwryNTfXzINIEZ9crzvKfacRfTZLF16pFFb9jnvcqRT13UHju8kdoYm2Tt+m6K33J49HvmdW3cUdEmr//cW2v9dibklTlPwaAObgRRkLEka8LWN0QwlUXEHj+LZj4jcaXNrjP3aNfxckg1OTdh3X5RPGhHaD7+N6vymPQIUsQ9/8EoQpM7gSKDLOctz1f+ZGuXk3xaw2fcef8XP6MYEwEzU4+t3pNEjBlTl4WfW8eoyyEm9+mY1AGnjfsXU/urBEa7fv/1ejdbh31xeFidt/YZelL1CIhuWyhBjFIAh18MeP+VexLKEE9npalOVl/RM86sud8Kgox/kSfrWnWYC8zQJKLcmwWzyGnNGf7SmEr+hHapw15yv0jxj3v3i05Cuk42g1eOlgkn7z+RCnxdwTd5EppSGL59vG4gKpGp3KIV+6NeY2Rv4c78QEFHJqFP8P86Eoo79TQbln1NynLk05x6Ea0MrNV7JlrtCMO8E6WLZJD1Y8+hpetIud2caI2GCn9621pylftCAWCpLXQcGudwO/yj22YrQshhSlTWM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(18002099003)(55112099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LClY7GpcOWYFntxlt7tmKkJeH2sMhu9h2cR3DQuUae45YmaP50f6iLctMZV8?=
 =?us-ascii?Q?ghLBV7Uqg7BWfULe6Pc9+GVvYM6Uf7OCkYpI1RNooxtDcj4/XUVjxraST+oi?=
 =?us-ascii?Q?rNDIGUhbvGAsNj+nWD2m3FfGqTp7oTXvhbBJSRjaX+sm3SzuAPbvAATsqWov?=
 =?us-ascii?Q?G03BvdXxYfTwYumWHEjo4Ti/Uj2U3H3ULyVi9fMGCX0LIY76bI/OFl+0UkNP?=
 =?us-ascii?Q?3WFRWjdYrN2q6enihbI/o5EfpO72DcnjusMK7qirg6S1mhNpcCSfLKdWGmVy?=
 =?us-ascii?Q?G+Fo7rBQ9K1ZiwTPZ0Od1q4i9gwmryPT6qdk5tpeXFI5wc/lKJAtg4/XZ1Qw?=
 =?us-ascii?Q?EfQ9Lx9LDqr2RB+nITOi3jOnPPhriu2u5pj644vKcFcKTe3INuMShAl5qkzq?=
 =?us-ascii?Q?cwbeKRt0Lz0Izb1MLmDV28puDbC512HLgd7QwAFS4qxvdpcSh8Tru2Wimz0g?=
 =?us-ascii?Q?nDVnF6rbCB58qEvh1DYOokqWeWqK11fbUS1zNCngG30Qt/ZHazRbd2QyRnBB?=
 =?us-ascii?Q?Bmnx8/I+dtpqkcpgYfS3b5Ee5rVhv9bvzDeF2LSUmqJ1KrHcLygKTNY7ey27?=
 =?us-ascii?Q?dSl0ZRUtzlezkMfG3poYOKv/SxpjqmhwO4vJi67VVzAJt4MjQ7oBKp/D1gSZ?=
 =?us-ascii?Q?OL0DxKMB35aGWriPqIZwCRReTJ8cap0zLzA0u1riorhbX1n+fkRHvFiX+kRx?=
 =?us-ascii?Q?3uqUEg83gQjIISTygO+IDXKz9scwKabDP3gscn4usqI3GlsiO/ghp2bDypLH?=
 =?us-ascii?Q?6gFNLaiQ1tgMDtIPVCVZCBTSQFV1q8mkcBuJQgznaLwAgEUNarfvZZ7cTxWH?=
 =?us-ascii?Q?KgJE2mf/6+57z4adiFHzOgBXj0fmaIQKWsWa6ofk9F1nCTN/lkvZJMMzMGlM?=
 =?us-ascii?Q?ZF7VgUJtIwIug+l57KJV1RSFKDQt4gOOBNq7DfjFaugAJnN3wPdVGqJYS53y?=
 =?us-ascii?Q?+Y2qqfpTF8dEDy/tcNAFDi4DuJ0VQsdeXa1QekNjHX+HnixPIW9Ox0FbHY8w?=
 =?us-ascii?Q?G7b5FrsebzJQF/Aii5XihYmHg9uHbXO7DbmDezgOKwqkOQrjKA9pHj2b+rAP?=
 =?us-ascii?Q?P+3IOEmL8Yr/7SKKng5hG6sHEvgj6iQOVwseM2FrDjDFe9HbOxy7qxTjkpvV?=
 =?us-ascii?Q?B6VnNgeUmcku5Eplb9rhrpIp21hRZhQm5BMGFjBVunTbrhcd427uccPdt29W?=
 =?us-ascii?Q?5iL2f0uC6uYI4RTl/cA3HS0LKhmLGamKQIOqYhvrgOkoIO3D8uGpt+PI0n+U?=
 =?us-ascii?Q?+yXL1f8qWh09ivXruUrCWAiScE8ZEFelAada/OUPncy7qx2Jolp4TgbQ0AOx?=
 =?us-ascii?Q?z1UhQt7NqrSno/0peZHQ3BCTzrrAOpXFIN1K0rH3VqXuPruEvSBtsRssYDnu?=
 =?us-ascii?Q?SJTyGL1W8h9FqxSdXJhXLUMaPOQwx+icPbcSuiTFEZH7R7GSozjg1obJ3FpX?=
 =?us-ascii?Q?Vwnsd4mUry1WMW00Li0QmnCe8Q18ShPee35lbmd1Y5Mq+43OFyplUEJ3tuyi?=
 =?us-ascii?Q?pIdPfJEli1P9grF1eZWhCb7ffbd7HfDjN5mj9QoY7+0Yrd8BPXJbfS7pwwnm?=
 =?us-ascii?Q?v4whLbO675+i+ZPST8fH0UM34eKmVfCsMlAgfZFDtbO4zJVzZnb3FemkdCNB?=
 =?us-ascii?Q?2zkt209w8bi7L7TnCGRbqAoz30tGsoFcpeQFBUkbC8GabFrDuEFo0qyQbqHd?=
 =?us-ascii?Q?r4asKd/OP6O4eh9DGktXw6eOWiIlTHlMMxxdK0VF3bVdw6m4tXSIT+Zf2S7h?=
 =?us-ascii?Q?T+uBn42qWQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3f4f00-f289-410b-aa79-08df09697ad2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:14:35.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0lI/NFxSs/izmiKc1pf4IGo0RM/V4wL9jZ5SoE8y0yGwntr56cBm9HDFyiNUpAue/NwE0meL5OvbyDSQexCDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7502

From: Tze Yee Ng <tze.yee.ng@altera.com>

Two fixes in the spi-nor core around locking and driver unbind:

Patch 1 fixes a self-deadlock in spi_nor_rww_start_exclusive(), which
took nor->lock while its end helper re-acquired it via guard(mutex).

Patch 2 fixes a use-after-free where a sysfs unbind frees the
devm-allocated spi_nor while /dev/mtdX is still open. Give it a kref
lifetime on the spi-mem probe path and fail operations with -ENODEV
after unbind. Legacy controllers are unchanged.

Tze Yee Ng (2):
  mtd: spi-nor: Fix deadlock in spi_nor_rww_start_exclusive()
  mtd: spi-nor: core: Fix use-after-free of spi_nor on unbind with open
    handles

 drivers/mtd/spi-nor/core.c  | 113 ++++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h |  17 ++++++
 2 files changed, 119 insertions(+), 11 deletions(-)

-- 
2.43.7

