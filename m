Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793266217;
	b=I9aBFMBjbCPHjpoV8j0ty7ZVGOanFfcepaerZX6Hxd5ky7s0++lrQUCGg4Kd3mYnV3p0
	 DHYXT09ZNu6oA5eleUuT+E2hYiD5aTLx+6vo3zHH9501WQGJDsX5at2B+qSIIaw2P8K/T
	 uRBtFOZL/6YQ4VhBmb+sa/RkWURe1HVcTuTqkUQLuACZlF/ED5RxjSOyAFjZnNyldnmat
	 TfhAMSVwJCQjisUBtmPQWfNsECMtksejpSwROe59HynigIQ1ZTQIpF2S0dXFUKWIQWQXB
	 RJSwTIDieifP2TE7CK9egQG3SqXLBPwZwlOwRITgTpJmgOs4kQqpbwnTckB46QkrJ1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266217;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=oAvIMQ8H/D3oxxmnOvQd9GYwY3/xM503w36OU+LezXA=;
	b=QblKRA/qfeqFFx8E/SEyJLCIspHVaKqo6w+A89UUxCauQ0RbaqT+s9JxOvop+FoG6+Qj
	 qiyfeWLBwGWRvb6F+22CxC2AcBrp6QeHmVLkKWCPtl9HxID2betz2w3MUT7nLR5ecXMv1
	 YaBXFp08ObbTRfkySDJq6r4yZXL4jIPZ/z4gKiUCwKdmcK6EqI298/g5e9lujARtWkOs7
	 1MV68070pcaOhHrfl2j/Vsmbk0cLD/GDooBYchlV1dcn2PDaSYIRUlkRBXTgfPQPm0n0P
	 A54jMkViLptFywgMHz8eNdFDVZmy/SPsRZvMiANJq6Al2jRmRe4cxV+lPGGRy7JyaDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Z783y0Ur;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.65
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F2C606A31A;
	Thu, 29 Oct 2026 09:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Z783y0Ur
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQl3pX0/TbQN9Gs3sEtQjzZ0SWg4AuBkofSE2S4zG0LGlF9htQBuwqRJhSwm6WZdcYDrkXbPkPraIZCuRXNEH+EWJFV/h47L8dtQRXNneLBj9z/cpfMvjJuR5oesH6hazBfqmxG7E6iWsMEVIzAQpUC+G9foUJ31NRRDqwBTdO122bClhoQqvWNpqeDuZJN9qsAGltROgeIOprK69697z1ITeZ3ZLW0nKeXDj734xrbR30hpHhZUc85cincKb9zUm32Sw0qTYYDQbu4G3FNdBle9lVGDtaKvh2tP5EttHuN+YG0yOesp/WmAyaLg2X4PgRZQu0ipNJdRtrGaQsQQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAvIMQ8H/D3oxxmnOvQd9GYwY3/xM503w36OU+LezXA=;
 b=hdvtmzrO7NXBg3y081zJac9qjFUJk3XDHmEqGsrsA+mMi2El5yANCdxaZRgDrM5x+MKRDZ2WDGGCnyags366m/WTl0Pg26U5AW6oeF/KKwxRPmETP6AvSuiaPCDZec7DyEz72B283i82UGNte/yfEcJt62fzIvix6yLDMtk8d7DsjcsryMtEQ6Cx/kQT13Hsh2otatVTnIRl5YgYf2+KMtXEbOwPiEwJeT9THRIipUW2gst4TtEjPtNyjG5EPBVBQGKKFPSFSA2dI4shMwIuGj2Ll+79C2P9fpGtHzc3aTz2E8SuQKKGuZ0l0cR+/SRZ9BJD1xw18M+WKY0tQHqoig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAvIMQ8H/D3oxxmnOvQd9GYwY3/xM503w36OU+LezXA=;
 b=Z783y0UrnF2K0CI0ARbLfzWlZYunYsVVbIaru2Vehn8Ikef7WPhLeqhfE9x5cT0Fvv+Bpm89pgcJj3ulM4Vokq54VQi1lIta/S/fOigiI9HarPEL2OXzdyF/5M9khZyMsxLtGnNblFyuaaWCNaPgbm9I1QyxaXWVl05JhsXId9nH5opmQFraCfBlH9XV7UYFgVmcXb1UsCFGyLhq+1khel/bfFYMF+G8EMcMaCDVqmDRfbLPh3SXwsS85tMCo0HJljD8WXAIX6YBSplpft1KDp+isqN1Jk29DxfZs3dM5jNZhu4VOOGO/CzphRY6QfZjNGDujY/wtUd74hEY6O1y3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by GV4PR04MB11851.eurprd04.prod.outlook.com
 (2603:10a6:150:2d7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 09:30:12 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 09:30:11 +0000
Date: Thu, 29 Oct 2026 11:30:06 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 06/15] drm/imx: dc-crtc: Disable at boot
Message-ID: <auH8X0tITcU72fk5@vm>
References: <20261026-imx8-dc-prefetch-v7-0-a0b50cc4fc65@nxp.com>
 <20261026-imx8-dc-prefetch-v7-6-a0b50cc4fc65@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-imx8-dc-prefetch-v7-6-a0b50cc4fc65@nxp.com>
X-ClientProxiedBy: AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::11) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|GV4PR04MB11851:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a4d7ce-809e-45dd-4fe6-08df359f3ae6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|366016|376014|1800799024|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|10067099003|56012099006|261026140227099003|261028144727099003|18002099003|22082099003|261026121527099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TZllY0jy5kfBXDzE1ViebP+lCNS/IqiHsw2nHFmjvYGsVoqmFtxUbgE6ohBh0ztoGIFHcNKaiI1rKoyfvH2x6j+BtXcIdPXA+fopAA5rfXOxoFzbWmrbp/n5TpHVvzm8fDO2SyVyvh9vDu59eVIBPshywJlBNmm94DHk+oxX/H0zOoVZNWY4My9ytuvHeL9Pp+MhmWMYNeRNdiELfuBI6KpKYmr4D8ulYEVZ2UBOHMVAHoaQS/A9aebuBKuPJouRIb2JOA6Rn2yeHdUKD/Pxz7R/FchVpUjUBbSJqP+LZQzMdbXBH0ANo01NU532NuS+2XpkKe3oS2lXn+rivgzrHWYEikvMxH0qtCxG7ZH521igwWHvtKhSSsFql2+1TFeQobiOB2J0p36HCyn6v3PQGuAucbQPrQT8QfgmOrjmwlaQDAOgSfdxMXu7mf5m0TnGsxAmoz75bX2u4Q6HqpkEvab5oaU4FgGx9BN3WJwdstrowFFitlH70eVAlgJXeQQE8wU7bW2gQdyshbKTtrllrNsobfJruSWND7w6vBmCSDggeyvz6eZLHFNMIclWB3LNlUyVfs25mIWfJK17Z6whOdqdhymT1XTWIzmZaKJHYAvWJ7P6NUX9gX44CEwEpMf38ViTGDgB2elezNM++MTig0tXu8zF+M0kYDH5DOVACb8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(366016)(376014)(1800799024)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(261026121527099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?41FTJzW38LH8zqTaW2ydOVSGVhhvGzi6cOZkNtkfgDbNyOdr41Y3BOlYcVrf?=
 =?us-ascii?Q?brrMHWt8GKZtufsc//JgR/nkl7Oe7haaOvklIbOXeu+jqxn1gZjCw9ZsUZWZ?=
 =?us-ascii?Q?+jyhNmQG/Ga1ZHpVVgPcVGIFoB0nOvznzCls7U8PD1gKuKr3AT3x1wn3B1zX?=
 =?us-ascii?Q?UWcHAzhTbZdFvhyjluIa7AcmtPXlp8LkoaNCeEU7aRbhdxDRNOzDx+Eaa1PV?=
 =?us-ascii?Q?zn2E0XgI2FG+EqoA2Mi4cyPlqcb4z5mKV6xD928FdMn6ZCrUCUoYctTHEGtG?=
 =?us-ascii?Q?kRD8WbIn9kuQt2j8Yx6pHIrsIwiQdb0bulx95TQfMhv4+eH1iaCEYPMCKqWi?=
 =?us-ascii?Q?e93J1+k8TH7kVQq6OT120SBDS53I+a3nPieei1WwheI2HkrcdJPs1KlFFMyY?=
 =?us-ascii?Q?thtmqYaEbTnKTYa9vSdIJBFonMURbPwVfZ1TQyDt1iHheqUM7sHSxqvtkyaX?=
 =?us-ascii?Q?09F4vdT5Hj0lIAqlUFwCtynVfBK9K2GSw7U1NjwnlYyXIRcN/fBOhn5JmHpf?=
 =?us-ascii?Q?tpYbZas/gHw/ZGS0cV3RfD5wKrnHhILOrq9vYeHErZgptWZY98LalCrsLwS2?=
 =?us-ascii?Q?ZoVbIIcJInxhzCRb5ytGdx5XGkxj2Wb9HIsXKC+ml89vMfw7RrK4B05aQYxo?=
 =?us-ascii?Q?qifj47Fls6gUmFEUNFlGEIKm7XWrU0ajAGLRKoCF1LKAjbiQolevdweSzvvq?=
 =?us-ascii?Q?7gE2aEM63BJAGZfDlx2IoRShUGXL77BX59WTMScqNqTRkRXVA0V7wyF8WhkF?=
 =?us-ascii?Q?18+oV/6HRJix6+lhJQDobQ+/blrIVnPTW0eN+v5eDv1x0gjn79Lx9Ip5mfTF?=
 =?us-ascii?Q?13vfeS9qjp6ck79sa1VcMBNYc3B9kncf7yM5NKL1OfYoo0QD1qpJxZvl9mZE?=
 =?us-ascii?Q?GdVP/COvo7w+1gW2FFl2hWmQtV1jF406M7M6nkA+zqLLPI5dMqKYuZXC/Y/m?=
 =?us-ascii?Q?SBtIUJJ2PW+i8E4zTE6A2vHPp9zubEM3azhJiVqNUbUSgu63lJlU22dU2S9n?=
 =?us-ascii?Q?G2WDbd7O3+4xud7GXKyTQwx+vlFCWEFwh+HabEw3zi7unEzo1ddAgATfLsvC?=
 =?us-ascii?Q?AC67nWwjVQxJjoVh7xyH0GYRseoxvmXZHgCzokH5NdcvLA/wOY+Qz+pNi2U5?=
 =?us-ascii?Q?BVi5WuYaKJSM4WTuK9HjZ1ZQjWAs1SiyD2FsGvoiY2iypOEZAQt4MIrseSV6?=
 =?us-ascii?Q?kEwLyhCs+eBFETxH6oPYeWkpMnkgSsZ1x8un+s9QdP+EQuqVO8YZ66IxkXNr?=
 =?us-ascii?Q?aU31VmWxvgC7ziRHRUVOP5NEqAgUZO8wPvo1ddAKcEoqA4tHFy3L3v5jIoRX?=
 =?us-ascii?Q?5wbkSfTlkiqPz9pKTdcGlQYvi01ZcFRf38ySiTK5lyiMSaRv9/vdbks+Rz7V?=
 =?us-ascii?Q?Pu+PTrm5mhdwJkthzRcNDtuFJ2ffOPJ0zZ/8/SEgOBX8EQhVQvtNC6DvcJsA?=
 =?us-ascii?Q?e5m7XG+29mBQl3zLynnvPUruEa2mT5dzV6ckpsiw8HIIgm+zYDE8QFYiKMVg?=
 =?us-ascii?Q?g3lK98v6MQcfgIDwIzOsC69anXwvZ+BQm8ww7sd0NAATwhrla/XhfvvHZbJG?=
 =?us-ascii?Q?NhE7ZrIEyavMsAhANgkoNMiylIsd88fVfKUcHPJZyqXzVVav2i5eUUeGO+5Q?=
 =?us-ascii?Q?IUGi708rIyo7gDLJ7pH/Td4jwYJ2yfaFL4q+17C0ZLCCiX7fTtGnMXs3o1Nr?=
 =?us-ascii?Q?mb3Gh4Gemzm/tAcdJ12LC3wuegIRDiMlUBL0sozYGasbnh73ozwGXgUcmhjq?=
 =?us-ascii?Q?3ojP4Du/61Xa+yjiAj1JdjY2qRLZMxQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a4d7ce-809e-45dd-4fe6-08df359f3ae6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 09:30:11.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nF8NbcA72qg6gyBLPspmGhI5Kw8tDYzWJv6qP+0aOugr/Nv0IN9jGpC3D9ZYUkTReGwLI3ievdHc/11bRiHLHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11851

On Mon, Oct 26, 2026 at 06:05:11PM +0800, Liu Ying wrote:
> CRTC(s) could still be running after the DRM device is unplugged by
> calling drm_dev_unplug(), because the CRTC disablement logic is
> protected and bypassed by the drm_dev_enter()/drm_dev_exit() pair.
> Hence, Pixel Engine's AXI clock use count(managed by Pixel Engine
> driver's runtime PM) and pixel clock use count could be inbalanced
> after removing and re-installing the driver module.  To fix this,
> add a helper dc_crtc_disable_at_boot() and call it to properly
> disable all CRTCs before advertising DRM device to user-space by
> calling drm_dev_register().
> 
> Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> --
> v7:
> - Check CRTC status to ensure that clocks were enabled by a previous boot
>   before disabling them in dc_crtc_disable_at_boot().  (Sashiko AI bot)
> - Modify debug message in dc_crtc_disable_at_boot().
> 
> v6:
> - Rebase onto the latest drm-misc-next and resolve conflicts.
> 
> v3:
> - Collect Frank's R-b tag.
> ---
>  drivers/gpu/drm/imx/dc/dc-crtc.c | 67 ++++++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/imx/dc/dc-drv.c  |  5 +++
>  drivers/gpu/drm/imx/dc/dc-drv.h  |  3 ++
>  3 files changed, 65 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
> index 0d64186a9901..c7dbe5f500b4 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -227,6 +227,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_commit *state)
>  	struct drm_crtc_state *new_crtc_state =
>  				drm_atomic_get_new_crtc_state(state, crtc);
>  	struct drm_display_mode *adj = &new_crtc_state->adjusted_mode;
> +	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>  	enum dc_link_id cf_link;
>  	int idx, ret;
> @@ -287,29 +288,37 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_commit *state)
>  
>  	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
>  
> +	dc_drv_set_crtc_enable(dc_drm, drm_crtc_index(crtc));
> +
>  	drm_dev_exit(idx);
>  
>  out:
>  	dc_crtc_queue_state_event(new_crtc_state);
>  }
>  
> -static void
> -dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_commit *state)
> +static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
>  {
> -	struct drm_crtc_state *new_crtc_state =
> -				drm_atomic_get_new_crtc_state(state, crtc);
> -	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> -	int idx;
> -
> -	if (!drm_dev_enter(crtc->dev, &idx))
> -		goto out;
>  
>  	enable_irq(dc_crtc->irq_dec_seqcomplete);
>  	dc_fg_disable(dc_crtc->fg);
>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
>  	disable_irq(dc_crtc->irq_dec_seqcomplete);
> +}
>  
> +static void
> +dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_commit *state)
> +{
> +	struct drm_crtc_state *new_crtc_state =
> +				drm_atomic_get_new_crtc_state(state, crtc);
> +	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +	int idx;
> +
> +	if (!drm_dev_enter(crtc->dev, &idx))
> +		goto out;
> +
> +	__dc_crtc_disable_fg(crtc);
>  	dc_fg_disable_clock(dc_crtc->fg);
>  
>  	/* request pixel engine power-off as plane is off too */
> @@ -318,8 +327,9 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_commit *state)
>  	/* request display engine power-off when CRTC is disabled */
>  	pm_runtime_put(dc_crtc->de->dev);
>  
> -	drm_dev_exit(idx);
> +	dc_drv_set_crtc_disable(dc_drm, drm_crtc_index(crtc));
>  
> +	drm_dev_exit(idx);
>  out:
>  	drm_crtc_vblank_off(crtc);
>  
> @@ -331,6 +341,43 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_commit *state)
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
>  
> +void dc_crtc_disable_at_boot(struct drm_crtc *crtc)

Shouldn't this function return int in order to propagate a potential error to
dc_drm_bind()? For example, if pm_runtime_resume_and_get() fails, or frame
index isn't moving, wouldn't it be better for dc_drm_bind() to fail as well?

-- 
Thanks,
Laurentiu
