Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013005.outbound.protection.outlook.com [52.101.72.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E38C40A928
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680123; cv=fail; b=KLNugzSBpcI053wdKPHN7e7+iKigyLM+bLOfav0XitjMVWmM5vr/cLzhZgMQsBf4hS4Nb2Lq2Rx17rEQ6KfjBRvqsel2Jrp/pWQw61SRLaiZhIn7sDkAd//W04OHjgW99QDJOOOW5u5tHqMq4iRuPJJyKaAaHo5soDisXaCpe98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680123; c=relaxed/simple;
	bh=nmQkysu9Lfcmtq2ceVFKxPvgdBt1IE1VIlxQgHZbiII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AXSYeBc4IcUpz1bIl3RkhRiVwbEstEQzbFcas90BZdaXxWXCDGOlAlpZusyXqx+27WCDTIL3qLwKp7QPCledclkzo9Ajj0e8mhvB69IKZOKdMOGsXVJCiDj5Z34UD9Y2HzlwcbkxzgDoEK7R0/1WbLNbvkdazV9KDsFkq5p1V60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HXmclE76; arc=fail smtp.client-ip=52.101.72.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HXmclE76"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCcP7dEHiMGL2JG/roC4SPgQOkNIRTMF5CPb7+MMnnMZP1nlrPfabGufdBwPKHZD8SgEvmAG+nHg2VQ+10dvNWst5rVI5QlbTHPMMTHeSRfnn9J7QGSOX06DS8tvRTGU/oF7Z+GUY8zvB1Bl2uzSTNdDUm/VHBwCzA+JHQst9aAvVTNSzyXmBrFnh8T+g7YLu33IjqMi4FcZdgCF5IFUyfAeAeHmKjuQ1EfWFx97MNCWsfo7awWwp97zWqAERqefY8X9SS/nK2TX7qEDwR5noStbi6p/kaUxOO7d5IBNZgrVMue7VbAF5pHnUSKAwTwfzUXJvWohiVmV7XoJzx20pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNomWR9IHrq+xnsHCLQfms6XqFrbiuVIWkS9ZEzvhs0=;
 b=fJo7RUKfFKq6N6PjbL/9pVcWMGEs14FyHNJkBkxF+hlJWMubVj1l96z1KvH1qAjfYDv+z5Cnbf76ligO0HU5WmEAgq3lkyhWOlhEcRrsDV1fTmv7SG5z7h1MhMJg+x7JZlbgRdNBXC/pxryBhCZ0lrC3RaOsf1AYI2Qeh+ZnWq5Msf0dIM9CShWFBSTNjyW5YHf6faO8zI2mlBAaDjNJoyeONtOW19o+QTQLeT00LzT/aZBGTQrXHfpUcoCBPukPNMF6a+YWzux94Pn6PpTc8edvEgKkgl4qBKJyQetVJigQExxDwBDWXnOBoWx7YxVCpw6GzcGrHkTObCMD/9Ib6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNomWR9IHrq+xnsHCLQfms6XqFrbiuVIWkS9ZEzvhs0=;
 b=HXmclE76YPB9+GnAQngQYQtVGcnkJqvaJLYwQmRbPcRLjM9RvluitATU8la+RCcI/sAKDz13WPidlwL7T7RuB14QbO6+oitkCz9yV1xgVltNDwk2ZtifYfrZ9lVFN16noVF+J9XZAm4wM7auJfgX+pmI/iwOflthtZab++qLhV+7rIEMBOR7M9QYBjzWq7rFo7x0o1+5nc8ImCEZHS/TMLDKf9TnQM624kmw2iEdO4DpNx7QHUFmP6KH5GzXFds+MUdUpL6gS2bF8MUH4EimfaMLpJP2mSmtnjTk8ocTVD61AsKsrm3IOPHgt9sl4J6F8/4VrjCUUtV1sbxc1IrZyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7927.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 21:21:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 21:21:58 +0000
Date: Thu, 17 Sep 2026 17:21:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 02/17] i3c: mipi-i3c-hci: Bounce short reads
 irrespective of the IOMMU
Message-ID: <aqxZ79iQ61cszDtH@lizhi-Precision-Tower-5810>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
 <20260917191356.133242-3-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917191356.133242-3-adrian.hunter@intel.com>
X-ClientProxiedBy: PH1PEPF000132EA.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2e) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 838388a4-b10c-4800-19eb-08df1501b502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Uq3bsVOnnUThXR4w4fXXg5c256VNfKqv9oUvmh/glXvwlHp7dTYAPw1QbCzeKYqnrVugZ/Z3bYUsX1YicCIWR1RM+oUKSbWt9E+D3EnyIXO8WH6gSRarZCm1jk7DZRskNbQRRojbs2tXTq5PPnfTnIwd3PK4s+IFBZnmL+eXFKtS/pdpOxVF1L7GFAiqiKl5jpFjK05mTahtUAZQPRxUU8uGPUz3UNNAWW1cshd/rzyGrTQsCYWaRhALEA+4dmFcdV7KZklrbX4boDF7rdbQDLSC6yyEvkmJPXHoREr9MgrjpW0q0hhPO3k8WWTcr2xH4plF/9jJeTt+JNL8LGxn3xuqqoWWl0UdSnBcnpxYqza9OAHpDH+0f+hHkmi88RIix9cZmYWLYzukOawsTBQMdeA5QOBuk7VTFl9Y2Fobl9zPYr8EMnNrqFXn93gdm69BB0rq9J7jOxDmdao7yJ+n1/jAagWqLWbEqjQwUqT8skHS/yIuPVWgk+s/54OFtFLEsbqzbjoyGrhGRex4ZyQFXLJEWgu8fHhs4GG8cBlAN9mLvAJlEDKySNJS3DUrxqkaPwY6fW+74ybP9DLPDhWTEjCEmBFoXUZtzMpbvEGK+7Wh5EOl0v6eRo6y58FB6OToX150yEu7o2n91sLgFQ4BWpbxkowfav6vD3O3N7bO30o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nwlIUUwYisHNMmLXd75lXmjGvlBuQOm9fqcaU7KJcVJLVqrXVTFCiNHqAXRb?=
 =?us-ascii?Q?PNfvotv52HOvljclJW7AZMBRAiYyNOzlswXAg1uiQwe1pFO+TlYPSlcCW5H/?=
 =?us-ascii?Q?mmS7HL0bWxmWE8PZ5j2tQfGNTDF51wYgM6I/LMbQal8Q3DZX1FEDyjtIrywP?=
 =?us-ascii?Q?QJ9hudCgbCdKEL0ScFBJ4lYJttvkdyz0W5nRO9GJs412INmqw2Fli7WVTYWP?=
 =?us-ascii?Q?zCeumelb7hHHv3nm85MvAdmtrV//3iR2c0sI4ntrTq5ab7YWUOyQT7id2GZZ?=
 =?us-ascii?Q?0vznN/EzDMlXQLWtl+//CMhyw5uKm8c5tc7K3/3snHiFqKl78wcKwGWQQvBF?=
 =?us-ascii?Q?4L+OYJUoLsncGVaodC3cbkPsqWgMHFVa9kTmvGnRrrvGD/Tq8Bc53ZHT92+e?=
 =?us-ascii?Q?DXOKHaeSCbm77s3Bcs8ydtzY2dpwQjv6KFOalse02BWI1x/hx8s3MqW67xLK?=
 =?us-ascii?Q?SFqQRx+NjwsiewM0gHxYsmtRgYn2RMKDcqSx7IEELC2WqZQ8V3+y0yc6Wgxr?=
 =?us-ascii?Q?kN9CsybTCS403DhJUh59zJzKfzDhl+qhxpBUaUWoVWbxLAj5mVjynzYkpvfv?=
 =?us-ascii?Q?XEeF9w/BaxkhRWYsMD8EGIKBsEKH9o0QkTZoR8JXZ+IZTyVm8SB7pACtV4tm?=
 =?us-ascii?Q?mpmFmUht8v49B4oTTtMq4RviVwFKUKW+hsRQS4z2EvNXZMonPXAN/bDp2Lcv?=
 =?us-ascii?Q?jk1BjOchQnlVBBKSMuWJeB8Ag1qI2Lf/tCudaALuRi8vwyh4l7Hc4lKEK28a?=
 =?us-ascii?Q?5Sji/MfM9vVvF/9lL6ahUwHDwIRGnOsxIzdVyj2cP9fghZwmgstg9PZgHMzj?=
 =?us-ascii?Q?v/4mZ1kJ5uRRGS4JJRdbEVKvfir0QZVYv42FsuuenAqPszT9tZnBMez/YxgU?=
 =?us-ascii?Q?N5IWzfH5/4ILKqOje3RsnuDk5HY0MXsM1OVHPviEs3+6UKRkjPJpfwDcZBiU?=
 =?us-ascii?Q?aNaFCgi2OU8dmCt4qYtwHEnrokvhtQ1QuCi+w3aKEa99rfB+F6+GKZA3xARm?=
 =?us-ascii?Q?K9LULRIHIBR8NrYexFXeYeow4urItGoEtOH26vp7Zc9XIBUuiCWgTYdGpDPh?=
 =?us-ascii?Q?cwTdEIwkvAWDcmDuehDOXGtvd0/nP7fH5kX2/01FmkPh2WgBIqKkD4pSKKCI?=
 =?us-ascii?Q?gpEV3hDL4ShtgVTGC9hUbcKDq0fQPfkkVjeDH4LyvtFHsdcIJzx76Vx96Fqb?=
 =?us-ascii?Q?Ix4LyhrPCGOuMGXywF1Gbxp3Ou0dVQ4DgKalWnm7p2c/bPwh7nMN8+1TOfmy?=
 =?us-ascii?Q?iY4zsyklNQJ0Uxz3akK9lFlIUIbRFi2NZRNR1QCKgrVSr5bGo0QeOLfUsbLw?=
 =?us-ascii?Q?M5tyw0BudxYkc1Lr9PPnmbiyYBuErp1s3JCkgYUeQ79UuIkPguCkciDLNEvd?=
 =?us-ascii?Q?IP4X5fNOrh5DtHXYrSlTDqvhiV9hu43ll9/7IUySkElui2vkBG8pZ4A7ip5b?=
 =?us-ascii?Q?VNCEraD1mLhaL92G+38WN3tIRFUQiXq3ACJkmsPmAEihb+NlPKWqHIH+LLoH?=
 =?us-ascii?Q?DGMruMhi23Hse88yzR8mOt5laGZN6C0DVd5rp7y/1aM40fUuiRwmPYByOTk1?=
 =?us-ascii?Q?oijeangSkvOP0PXTTmEv/58J3ZkddfCGpF+iwMC7Utqjkt+aDw43o1W+isGC?=
 =?us-ascii?Q?8nB6c29P0AXX+pn39NktpE9lnS2LqZcpUp73qWOu06XfhaI/nMM7eQmR3fgL?=
 =?us-ascii?Q?BwWvG1JPUzsfaS/Viwbe2S4YL5YCsVEsKDgQ4BQcyJUGgcdidAfy+jmA17YP?=
 =?us-ascii?Q?JXZx07+UWmjoHwlqfanRbBYyswOmqljmz4uoBAHVy5TGOoerfYHf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838388a4-b10c-4800-19eb-08df1501b502
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:21:58.8002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNRFWoHf9yGFX48RjMOWDc2lvEsgFKUPTHk++aF78JCW/mtxmfBrCS6HUaaNVJBAMz6hrYxVF4PYrqFNqyxxrninG8sMqoDyAi4P6qRu6uaR6gL7ROCNfzho8zzw+mre
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7927

On Thu, Sep 17, 2026 at 10:13:41PM +0300, Adrian Hunter wrote:
> The controller writes whole DWORDs, so a read whose length is not a
> multiple of 4 overwrites up to 3 bytes past the end of the destination
> buffer. That is a property of the controller, not of the IOMMU, but the
> bounce buffer that works around it was used only when the device was
> IOMMU mapped. Everywhere else the buffer is left unprotected.
>
> Drop the device_iommu_mapped() condition.
>
> The overrun is easily seen with CONFIG_SLUB_DEBUG=y and kernel command
> line options intel_iommu=off slub_debug=FZPU, which reports it as a
> kmalloc redzone overwrite, like:
>
>   [kmalloc Redzone overwritten] 0xffff8a354561570e-0xffff8a354561570f @offset=1806. First byte 0x15 instead of 0xcc
>   =============================================================================
>   BUG kmalloc-8 (Not tainted): Object corrupt
>   Allocated in i3c_master_retrieve_dev_info+0xc1/0x760 age=40 cpu=6 pid=1
>   ...
>   Freed in i3c_master_enec_disec_locked+0xeb/0x140 age=40 cpu=6 pid=1
>   ...
>   WARNING: mm/slub.c:1233 at object_err+0x1c1/0x1cf, CPU#6: swapper/0/1
>   ...
>
> Fixes: 9e23897bca62 ("i3c: mipi-i3c-hci: Use physical device pointer with DMA API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Added the slub_debug report to the commit message.
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 7c2b20474130..5b195978f376 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -428,7 +428,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>  static struct i3c_dma *hci_dma_map_xfer(struct device *dev, struct hci_xfer *xfer)
>  {
>  	enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> -	bool need_bounce = device_iommu_mapped(dev) && xfer->rnw && (xfer->data_len & 3);
> +	bool need_bounce = xfer->rnw && (xfer->data_len & 3);
>
>  	return i3c_master_dma_map_single(dev, xfer->data, xfer->data_len, need_bounce, dir);
>  }
> --
> 2.53.0
>
