Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B814237E5DF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492861; cv=fail; b=jo6vgjVfsaXgHBVYLrYdSvmJw89sA1MFV+2cs6V4C8K7fOQcOSeKdj1tyijGT6sEMZoZCUyaThrBWgObgi9QN5t3XwQGS4FdklTV0GH9YrUTpS9zId6UTcIjioSXTy/tyTos0OJVpElnG1gGj87rj7IN01XteO0tM07yTgUJy24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492861; c=relaxed/simple;
	bh=C9O75+sZezdtwdO+3+5sXacg5ci2Pj0d/zy8yMxWfVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gWqH/VqDOz7V/C+Qe0FjNB2sOBTSTTKqcyKpIueqOG4RsqSROWf1MZO52aWNAehlHPwZjahY/7qtrrhqJHF2QyPCBUMXCAOmpu/ONla6moqkyxQ7XBPyXkOknoYZRJ7KClimgSXn2dhDfI4Y6Pbn2EAP8zTNpv6+2jfLE7I5aT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rb8Nk94S; arc=fail smtp.client-ip=40.107.130.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rb8Nk94S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pi0EsFZ5+0PzH/6XXXO0wZnYjodV3SyBEzU+FqN5mckCgz6AyRRQ5vPniNVBkrRUlwwRiT11Dq6gd7xUwZ2W4L/gh743HsVFkMh3MDpOA7YMxKUerxempwfixkGzlN5v2PWGaIQl9FXLU+v672juYIslz7ZQYhRoW9D1f9V72uVkqRSKenuDPGSEh8j7ZoIqmvpdwcYyXfyxBxry9FIsO0+/eSKhA3hbVBfou2oYQ/J5qsvTpUFMsMwmFrya17PihJ5a5W5uJOkvPf74la05GLXYL3ONbcY897wM6nKZKV5vcQkTmYQsIZj0Fd5407cFEjXYYsAs2RqGwlNAlcg4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSQLG2toZTSfwogD48+vCSGEpFVS9c8Ms8PWwKva+8M=;
 b=qHC4BjbhB6lxCSDU6Romm9pj4E4NOefm9Ydf6gelsJq7rCHxJWtuRhPVJN1sWgpwY0N7RBH0SG93JXIeJ6Mc64Uu0Mn5XBqKtDaGqeCSAkL7P/dj5ck7/YuZ5Z9HVv+yl6SePvnFTggMT04VAV/OlVyiuIcGdvFVZR+vFc4UJa69IKDRKFBFrBVb7gbnC9QCOrKWvnlbHwwUyNsiZvP53ttnvqi8MwuKuCVmCtG8VyJZ739L3rHf8WjsktmHXwWPJHmqSix/N7uDgt7YSr3X915bBQSUDZ95sS1qO/KnXznfoFtrgiwrXBWBXXUhw+LovdcLD6a73oqTJzgBYJSc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSQLG2toZTSfwogD48+vCSGEpFVS9c8Ms8PWwKva+8M=;
 b=Rb8Nk94STXO2vqV5Zm4XFUbs2vVfPXFb/Q5qNn6T5IjwPVeEI7v7cNjTWQqYkhQQtwOLB6y7G6/DlaGZAMioXphQvWsPR6wRQSO/Y9XI/fpL+Cd3Q8uvJArn41UycjOuQwgjMJHfyj6QtlZ3cKFL9n2rYs5GjVolqakAP7+KITudabxJoQcyd2jfiDFucAPCtbXHPqKu6ngOlpneYqGwZfLSFX8kh2c32NOA7j+G5qJzsaDALa+nImoCj4XQc6/WL+d2j+U2KG4P8qJlSO2Z2FIxLYYsSgZIUq8tt98rw5x01+RSB4yQbgURfFGj1X34HIgFvZgZ0NwxWXvNAFr1Lg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 20:54:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:54:16 +0000
Date: Thu, 8 Oct 2026 15:54:10 -0500
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
Subject: Re: [PATCH v6 6/9] irqchip/imx-irqsteer: Let devres own the clock
Message-ID: <asgC8uq6Lo7LsDET@SMW015318>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-7-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008090231.796511-7-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: VIVP296CA0023.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1c0c26-7604-4894-aa69-08df257e50b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|4143699003|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nQwWzCtw73VaGCup/WZ5KA/6nsiLNqhwRoijK+I/OB8QicC2N6I75B9ZuDFAbohlgvCG4kAtarCvuCJbubuMm5nW8hYRiSs+XnfiEQcxXgEQrDcexWKRmisDyeBLJQxUSEVqGn5DXS/QknVOMtCaM6oJIcWHQfuOXgeR8ceQGBoWkLbz76nv99CCchbFIUG+gUhb08oIZXYgitTPVZBctot8Flte8x7wycjsZ3sSUuDXoCWncWeux2zzgxyQAWXVAGB9vExnPO/s9bxPPwy94Z7blS5YFkod1D+XhgRudprDNcqQ9VMafve7p2ADuMu9+4VVUH8aziWl90TFiQ7U9unBmiKO01zaVdB0Wuc+0jJ8VcegabAEU3CjXoSFHHG4sxbuitzi6CIUy7XPtwspBjoD/CPJO0bwMR7OE8kcdy0Uy84lP/8xZzbvJyS7Edq12l99nV4wQjnlEJK0gE6PgMdqdsqnLi2ifXqD94/5NPNAZ7UMmm+OcEuZAG2wHLbuHrWyQoG0i8G5H3U0N4rsIAih8PDsRFmfZNrH2kGBMDM4Dv/HjcgUpbTFtlIgeqnxgd80wGPh7V8nVtgZRCMh8sfXyWT9+o8ERbfk9I8Xa23qv9JByPQoNCBhukFIkcido0OQJpe2YNJneSXZwxfnDlV860NL6FxS3zK/Ytf9k4k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(4143699003)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IGoPiHsax2pPlqon2mvZcKriEt2Zastjk04afuwPOv27uzgbuWqBMAqDeiNX?=
 =?us-ascii?Q?RvLzG1K89cXmsCMmmbi8E40dx282Qz7qpviJq8fHvSAVdobgKeLMmCuvZRj8?=
 =?us-ascii?Q?tgyTJV3BcKE4ZJU9a8xRXSPb2AKfohJm6b3UyVyyhirvYL5ZaBffzWUh2WHj?=
 =?us-ascii?Q?3+vAxAbnuG3v5XqDHqAd5wrvzjf/k5U3EFl1GWDpXBBy9+KY3CwZryzR+mWY?=
 =?us-ascii?Q?T0kZ8QZn67sQb2zxVCYdLlULLSzVTRncQychXXXFcI9Am42D2kisTuAYEozW?=
 =?us-ascii?Q?FNrBieuxXH9utRqXOMeTVlBbrNmyekBCPFtGnp6rnbQYKXDbvEtwuTTctbEZ?=
 =?us-ascii?Q?ydWZddfc5o4y/tf74U74so+t51LRfIe9U5WUHFIieIo11Ch90z5DXboKFFRz?=
 =?us-ascii?Q?O2nO+CLbOEze/VCWz0zipRtw5ZD4Yt+Aub+elhYPugHsjGiVE+wNdx4GcPNf?=
 =?us-ascii?Q?552b3W/HwN3JaQpeOK5V9mTDJ7JLEyCT2eU6O32HyVMm3U9UgJnEVhPm311C?=
 =?us-ascii?Q?4LhfBSbq1lOO6dyqqkIpccDYX41RLRjVO5485aqJV8XYx4RErOGhtWMHJOwO?=
 =?us-ascii?Q?iflrsMMSDp4b6UlEDxunvhXQGyK2ndB9f1KYweihUPaeoLq3XYr7xsfW6p9o?=
 =?us-ascii?Q?+6YAY2VCHtgY4b7EZrErmN8u/e9jz//VYl8XUu9YREzU5zvfeLzb4qrdvw3i?=
 =?us-ascii?Q?il1O6Kh2smd/5Mi5MgkMmsItW+QnMGq9mOTP9UXqHdxA9BAo3o+Z7izN23oV?=
 =?us-ascii?Q?7d+hrblzIlTSVH1vvlTKKfbmJU3urscx6bleI4KOjDkIpzX54k6ufc9Uu3sF?=
 =?us-ascii?Q?wBUMYQF7a6zDBoOn83iBHTyTw4XasH40+CbJHbXeDS4t4w7LM1jVNIreE2Yu?=
 =?us-ascii?Q?q0ed8Kx73gkTAFPReNdeTpOfmBAlyzqvhxzNBnlGxPej4uozU9SEBy41pcWy?=
 =?us-ascii?Q?uLtVAan1ZRZ6zQ8+ZlTnMIySmmzOkkJqKPDHQj/Gpy/15ArE97JemXC3cAe9?=
 =?us-ascii?Q?YmzuyBbbxREbBEtbVfgdar2CKIrGh5YmjJBCmXEY6jLKnky6rWzNZ5CfurMC?=
 =?us-ascii?Q?dDUSidshwVRw3ajRJLlbC4jbjNZb7NLx1SgU+NEykQf6x9+qOv+vJXlf43q1?=
 =?us-ascii?Q?rYr78/SDuvDqcDI+FoIGdvwofE+Fndj3JpqBuMA+GRoRSMMvheaHp8F8wx5w?=
 =?us-ascii?Q?UZvQYGsSBsISCAzFf3kTrBYeUBZpC+Zgx2nS9rKT6+GcJxfV3KAOK2pezydg?=
 =?us-ascii?Q?cUJFYQmnRfusnWqQxsuF/pXiNPObDJ2PE0vAswr/QX8YGmLTpN9FRd1d7CYi?=
 =?us-ascii?Q?LIQiUDX6HYL1uiGg6qJZLQvZ6QQXbytCa9YygIHmDXMliNvl52wMDtqpaI8g?=
 =?us-ascii?Q?5Q8f7bb/BJxnhadWq48vZmA7CkUneZl3rVSrgoubL+/oDRVBZ3mUzX8XOZ5h?=
 =?us-ascii?Q?dCPRomiCQJnPXGJ+LlG33bqxOfjScZpnIxpvh2N8dPEhyiNqrd5XLLlIgPSg?=
 =?us-ascii?Q?6OoYS+1nMwhDMg5Y8dyg2zCXviXiaLbFcdcx9Ke8ARtiU2NI2O4sd1BNQnma?=
 =?us-ascii?Q?ZIoQg6Cqh3KbI8vm3cZ0nrFtsN31BeOh/WkwwjEKVRCG8c9A3mecNjxPtIma?=
 =?us-ascii?Q?OLMebiWYRkrleMK4kknYt4m2pVfs250K5n1o9ecB3/J/wDRu3I8G2bex64xJ?=
 =?us-ascii?Q?76tYHlKUskABvf+dWmuhlgdFwNomFIYW3dxM8R0hB7nr90fzJFwo30MBCkJW?=
 =?us-ascii?Q?NJ6DdphCZo7mTdOzUSzYhoJ5DkB3+ehMRUF2LgQJ3wNnR2DjYSNt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1c0c26-7604-4894-aa69-08df257e50b0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:54:16.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOgA8/TZeexUoRU05+W6Et+luos3I3yGYIIgKYfwsL6isNaz0hILl3l814fx5Xf3dG0WKK9IiM1wGI4q+uz/E869y2nNrv+JaP34/15Xk77PYgqgduKHVLyFuw4cFsZ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10025

On Thu, Oct 08, 2026 at 06:02:28PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> Let the driver core own the clock lifetime so that the probe() error
> path and remove() do not have to hand-balance it:
>
>  - acquire the clock with devm_clk_get_enabled() instead of a bare
>    devm_clk_get() followed by a manual clk_prepare_enable(), so it is
>    prepared/enabled for the device lifetime and released on unbind;
>  - keep only clk_enable()/clk_disable() in the runtime PM callbacks,
>    since prepare/unprepare is now handled once by devres.
>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/irqchip/irq-imx-irqsteer.c | 37 +++++++++++++++---------------
>  1 file changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index fa233de9bc2b..15ee50f65d54 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -194,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  		return PTR_ERR(data->regs);
>  	}
>
> -	data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
> +	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
>  	if (IS_ERR(data->ipg_clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
>  				     "failed to get ipg clk\n");
> @@ -229,12 +229,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  			return -ENOMEM;
>  	}
>
> -	ret = clk_prepare_enable(data->ipg_clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
> -		return ret;
> -	}
> -
>  	/* steer all IRQs into configured channel */
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> @@ -249,14 +243,13 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>
>  	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
>  	if (ret)
> -		goto out;
> +		return ret;
>
>  	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
>  						&imx_irqsteer_domain_ops, data);
>  	if (!data->domain) {
>  		dev_err(&pdev->dev, "failed to create IRQ domain\n");
> -		ret = -ENOMEM;
> -		goto out;
> +		return -ENOMEM;
>  	}
>  	irq_domain_set_pm_device(data->domain, &pdev->dev);
>
> @@ -273,15 +266,23 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, data);
>
>  	return 0;
> -out:
> -	clk_disable_unprepare(data->ipg_clk);
> -	return ret;
>  }
>
>  static void imx_irqsteer_remove(struct platform_device *pdev)
>  {
>  	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
> -	int i;
> +	int i, ret;
> +
> +	/*
> +	 * The device may be runtime-suspended here, in which case the runtime
> +	 * suspend callback has already dropped the clock enable count. Resume
> +	 * it so the devres clk_disable_unprepare(), which runs after remove(),
> +	 * finds the clock enabled and stays balanced. On success drop the
> +	 * usage count again with pm_runtime_put_noidle(): it must not trigger a
> +	 * suspend (which would re-disable the clock) and must not leak to the
> +	 * next probe of this persistent device.
> +	 */
> +	ret = pm_runtime_resume_and_get(&pdev->dev);

I think need new API/method to handle this case, which is quite common.
Anyways, this method should work. let as it now.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  	for (i = 0; i < irqsteer_data->irq_count; i++) {
>  		if (!irqsteer_data->irq[i])
> @@ -294,8 +295,8 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>
>  	irq_domain_remove(irqsteer_data->domain);
>
> -	if (!pm_runtime_status_suspended(&pdev->dev))
> -		clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	if (ret >= 0)
> +		pm_runtime_put_noidle(&pdev->dev);
>  }
>
>  #ifdef CONFIG_PM
> @@ -325,7 +326,7 @@ static int imx_irqsteer_suspend(struct device *dev)
>  	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
>
>  	imx_irqsteer_save_regs(irqsteer_data);
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	clk_disable(irqsteer_data->ipg_clk);
>
>  	return 0;
>  }
> @@ -335,7 +336,7 @@ static int imx_irqsteer_resume(struct device *dev)
>  	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
>  	int ret;
>
> -	ret = clk_prepare_enable(irqsteer_data->ipg_clk);
> +	ret = clk_enable(irqsteer_data->ipg_clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable ipg clk: %d\n", ret);
>  		return ret;
> --
> 2.34.1
>
>
