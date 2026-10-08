Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011046.outbound.protection.outlook.com [40.107.130.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6347372B5A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493277; cv=fail; b=eC2eQAviQplxQXdWgnGo3MiUP+LsxK45t9bhgcFpGMoh3Gb7injxilvqYPpziLj+ormKK6YBLjXtrbNzRWopC/sJ2bRg4JRFElnn2r+2VAQ4KJjEgV+YhIb+0PdWsLrByFBwKolV762ZxKmvMyKDz8uqURIzQ0Y5+qoDuY6x0pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493277; c=relaxed/simple;
	bh=ynH13i8mSk8dNQUrhvjekrwvOO5dcnYjN3NZaW8x9ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u65nDDg/FhlHMFt2xMGP20K4FHxfwu+rRPhV7SopRbhxo6TRHEC9yeGVxyxwH8QDFdXIEz0VzV1BhK+DeOLVBQK4TGqx3w07GknusxAYvrNskpoNuHszDRtQ1JBo5uHkdRI/bYQreN81eMU/uEfT+oJehTNL+PJ91l1jQE+k5Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k6I0xLiS; arc=fail smtp.client-ip=40.107.130.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k6I0xLiS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okX+fKw67P/crdtAhJnjxfI991IpZ8MSjcP3dra3zA0qTOdVtxVvs612CqEg0DLBjFSzh3NLqkmu6ONw6XxJpbCSHyoHGlw/YQXITdylw4ArlkLueWfv+gbKnp4+krRiTVXT0OVZKqK4Vy8qPnfaGqyskRktWgCFuy0RPrxnrWsBRBe4ewKlL+SZDgk7qw41CiAsJKEmDljw5cZU34l/cW8v1IYAnXXgXur6787XzBU7e6XZ+ooUwBP9rzMg9qmeNcZ5Bci06N7FxDEAP02rJizCkp9uICHXwnBntNfe4p8a++c4ftYgQ0a6HC3HTPjXL9qIzsnS3MkJFiEc6EzP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/JfaI5yVX7fEGnudnWaBS/Gu5RDDSQ5DA8UJMIAKls=;
 b=NvdetTU/4gH0A4qLquyLqQ99qbG+fx3gksTQ56ypVTXCDbrsc80Qse3IwCh9j5eX8RLcIPcqTKyVrS+pA02FemKoDkXf/1wyN51nSu4Od0AZod4xVIkP9cosTWr1NEQg2fBo+F2HIawReyaP9dnGlKWH/Vnu3xB+lMnbFEJvA3MykyMfU0guXBYsc1CuGen5UhmfTRBpP2wNxdbumzvF9F95J8NelWv3YtQ5bAOiCk3tMCoHSO5S27ji1k+tBuoXUW4wllp0CUADJap3ZFv1uJ83iS/gukUEgT1zP+oNCYn5UR97AZ1rgbTiFprNao0r7g+QAjNaWRQ89NzL0s0saQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/JfaI5yVX7fEGnudnWaBS/Gu5RDDSQ5DA8UJMIAKls=;
 b=k6I0xLiSaJnBBRJ1iAgDTkgUwcdD4+U8G8nEoSymoQ9li/7LI68C0+50faFaSOOHEgoE9aF6rFJlpZLmxlRD/0nn/ns0V8+rCJkVgfUVh9XcTAVwIUvYi1eeP/w+/aIEPzf2yEcMpzLOjZuCRPcNEw5gi6oUtskGqdw/5JZYp7i61yGBmlmY7p/g9wTj0tKzesaQCsL8Cq3a2eflRYKRdJp41qtVOF93FxPslEQOb5TOa8NxJZRc6Cn66oSeZF1hUhpsgZzMqXxIygQSrLSB+1IDFkSacq5SOfPufgA8t6HBkNpfQc3Zd8Ntwcun5KFJl02+g6AOhD0ZywRtw4Yu8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8273.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 21:01:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 21:01:11 +0000
Date: Thu, 8 Oct 2026 16:01:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 9/9] irqchip/imx-irqsteer: Use
 devm_irq_domain_create_linear()
Message-ID: <asgEkzuozDh77hq5@SMW015318>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-10-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008090231.796511-10-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: FR5P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: cb19c73b-e631-4e77-509f-08df257f481e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Lrg9pLeJ/WEz05AhpgJVp+/oDurk7szzxnc5of0aBnQw6TxfLjICVq/7Nnc2YJ3ORhmA1mj/yPXEoW2EMJ4hRgN03n4cqHDC47K45KaCx2dSswIH/+4UTwpcbkDcuGLSSrqwEHQPvYF7NOBXYVpZIQ3LDjMlPDSYpuTiixGQNB1GtD/iYARwxDzpxCgvA6W/H3dbIoVXB8nELICqd0xUCzaqUq7ZFVX7qxhn5LbvdTq+zlFMycC1JkDGvwaiUPKQCXw2+fI0YcaWdPIlnuhgU3Ut8ow+e+ALfKDYUgXDBUquTOXG7UdK8lbScRZEiXDOCu7NBvnXeCdf/IzsCI1d/yklRgJkWQXYXd8W4s2IZi0jeDOgz8tfLTWlkkoIN9cb/ed4OW0FtLvN6XgRiytM1GWqNYV7qFiQI9E9qWhMR9+/iiTxWlbvjFQ8PjYHJg1Dmd6EpYbvtecIPb5Z6Zv7/PwZ/kwZ/Ae6hscpAqATJZu0sMf7k+u/GnfCz1UWDUhvHs1ErICe6optQciDbKLETA+vKbAELRZ3YBod7zFBi7TYLTcsuJP6Ab1kfHWGAIztWlcqQu7YXGPqcqk8xT1EZLSSLwqb6Gex60wX20z+pVqK1UKSMutAqQZb9uoxnFBQ3KJ1OxKmjTFdZw03/cibHr3t7Kk1u3Q4vSMTg9AkSBc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Yjfdx/eXdW6l7B7WYcHCWQP93zsgJwTAKPqCRAJT3hVcd1j1bQUfAdhwOoB?=
 =?us-ascii?Q?+TzXlBkQsdx5tgvhiplhbtoPGdaXtSWKM+8ABQdZJKL+SJzCpktZW6t1TaNy?=
 =?us-ascii?Q?FQEYEj+p0ASsmqNhFJAFLcw63byEhQylkfdulSHfyFYztuD8v+x3br/jxP12?=
 =?us-ascii?Q?923W1KMABg7j8KmNTEY8YVkW7vt16WySF0aj3gEp/uT+Ica01BN9NDmioqqm?=
 =?us-ascii?Q?AcuH4EQora4LMR0LhXMWUv1HjQ0V1uwWBw3sPW4NSxxRySxzbCx32BY2+UZg?=
 =?us-ascii?Q?ibihCfs3O94S/J5tSc6STV+LOWjuEa87+l6RN9HBaBfUnPk+6GUEutz9LAR3?=
 =?us-ascii?Q?xaBFa+W3jzZr7EpZeYBBDojFntzEVQFfMCP03T6gkzYBNSu5uoCXXYLLrtfl?=
 =?us-ascii?Q?gYkGwhKUxsSbXTkIuqBGpy3BL9JAFdmZ5BF77hNdba2O7ihZwn9e3K9a6zKX?=
 =?us-ascii?Q?UgOdjhNld6R8rLhoulriHkXOqzT1wJ1J1Algc9lT9MMXgRjUblH2FzqJPIgZ?=
 =?us-ascii?Q?d0DgVq+XIm3ON7Na6S/yIVSmPztFKk5AHp64aihboAmD5cO1O3s94yEcDgfS?=
 =?us-ascii?Q?gaPugQpCyiYaHv5wcmodtXUx2ui6P5WXnUCSQHKlbZplvc+yIyqNxIdVO3+b?=
 =?us-ascii?Q?lEM+uhBNTwRyWWKpaED+CvRLIQRyyiacJtTpf4FB8cW9+UbRMv/7VjQ6Is+n?=
 =?us-ascii?Q?+GLL4+DZWb5zA+xeatzmSnt8DOEdzPLPyL+oQjJvgWvIOHkXg1wQxRwm7tag?=
 =?us-ascii?Q?rDWMU4gpFU5ZMDpKiNGptXEFglmvASnBwcaJK/xWKO2fhD75YQeyBGnFHmpI?=
 =?us-ascii?Q?CmwEvR8sOvLGoNvlAyQCKhQY8U9S3Jx4Mh67K3LufpYzP2PJonQtJg3OxGB2?=
 =?us-ascii?Q?qBtwyGGEJKSo32AIm36m/XgUnhxcS/csBdIw4XkvpOU6ZYms6SoiRF0T5kJ3?=
 =?us-ascii?Q?95bPdfO8SWldNc2ICgCowowJRU3tDd2PFKr8V83B7AuUkyl75bMYJ037epQ8?=
 =?us-ascii?Q?KHdnZiuLgtpqfPPfDAgb06Gc1GS2LDemGcjmhYAMZnhT1PeZuyI9ZlEi42EN?=
 =?us-ascii?Q?lb7IcWsgwOwha2A+UL8DuBnFK8ypQDJMavTDq6BcShDk0aBIVEBkwLLcNlld?=
 =?us-ascii?Q?laoQEAZT/KYoB69GhJ+7dltG60yOY8RwZnO1NODfKpmPbjQK5RRIvSs28Ng6?=
 =?us-ascii?Q?lbtqKN9jlwCBML21civ3853Af9V1q5O7wePeJqujIwpf5UG1u6roqGkjewI7?=
 =?us-ascii?Q?hjtsZwi289NTQAACjQt2Yuc18LtmLFr2RH+ovW6P4vQz4y8MX11ObpILbexR?=
 =?us-ascii?Q?lW3bAZ5Szh6uiHG0RtTtH1040usIOW7FGKOocpczqQ3GV/NcKP3CannSM6Pb?=
 =?us-ascii?Q?SOmynZjtcTTNLy09PeIfzilBiHql9xvSSxaIzW6mZp+sR4dJBMqHLRLnKfIG?=
 =?us-ascii?Q?o4UKJS9Ej1w4IzBiohXEAmaUxCasrCgjntdlwuuth9CBslvwdLlTHnKiPlQy?=
 =?us-ascii?Q?Q9mbRbOVyxvxAH+twoNptVj6KYgL0zhWhgAZekntUeNSq9mcycxMyWcj+lHu?=
 =?us-ascii?Q?Khfw/pDT8keMLse6LCk2WF3E6qbbyib428R24a8LQ4y0N/LSrCTszKbf4R+D?=
 =?us-ascii?Q?9gaQum9tKi1uD5gdpPO/rVlUPgFOCSTNf58w8K00/8DgJZuauUVE2kBLbFJW?=
 =?us-ascii?Q?AFp/J+d8CGIqXpNyAjEZcOmRRfoMwPxTFLKJJIpco4g5SapD9ZR0kRRhws6X?=
 =?us-ascii?Q?TtRkRWboP4l11xOajTLPWS8IJVavCASHo2IcVejceDyQPlfwxg0N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb19c73b-e631-4e77-509f-08df257f481e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 21:01:11.2468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9hMiFNxgc9E8bX4LRnjanBHChVIIRHA0iGwaSQwJTggN8Uii8K8abY56pfrTW6J76mR5OUVJ2teyEqRTlC9csHFLedRr07oTweWCyz1MzpeXt4icpiuY4+oexwngEOO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8273

On Thu, Oct 08, 2026 at 06:02:31PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> The driver open-codes an irq_domain_info and calls
> devm_irq_domain_instantiate() only to get a linear revmap domain tied to

Miss match actual code change.

Frank

> the device lifetime. Use the new devm_irq_domain_create_linear() helper
> instead. No functional change.
>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 85edd5e33ca9..f5601769d036 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -246,8 +246,9 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> -	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
> -						&imx_irqsteer_domain_ops, data);
> +	data->domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev),
> +						     data->reg_num * 32,
> +						     &imx_irqsteer_domain_ops, data);
>  	if (!data->domain) {
>  		dev_err(&pdev->dev, "failed to create IRQ domain\n");
>  		return -ENOMEM;
> @@ -294,8 +295,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>  		irq_dispose_mapping(irqsteer_data->irq[i]);
>  	}
>
> -	irq_domain_remove(irqsteer_data->domain);
> -
>  	if (ret >= 0)
>  		pm_runtime_put_noidle(&pdev->dev);
>  }
> --
> 2.34.1
>
>
