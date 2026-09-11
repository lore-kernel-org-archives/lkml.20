Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524C41DE0B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155167; cv=fail; b=Gs6VBgZdpjJVqBSb0GiYjlYiAZ7QQCsGu04h3ZwPbWZDKVjGU19cPWH6g3yFizGrFJR03Jtv7QOv7vZyWgcSVfEFeC8ERQzbj0tOmrkqjj5jzGaTf+x32E/6TwMIX79Mm21Ox1BNJNk5+D4NWTHVxMJsqApzlCQchV5Wj3SwJQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155167; c=relaxed/simple;
	bh=XSC8qI/aQcQZqvKEIujoucQg8EH3p0WnylCQ5/R1dcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LHWDzfmuNt8fJS/aLERiJ2G2KiuUXAeIxxzNVNJtCo4nK/kpqpHcZ0Q9a41CnWXN51/3sRRHd6MDzQvDep7KiVwcCe1kSlDwkM6gUXA+JLxZly9cH8bmZaNpYQADECjLp0g4+JYj0WxIZyM/+nLLYiDkRlFECfwMy6GrtMq2+JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Lt5UJstC reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Lt5UJstC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNZdmW8rNAh+aLmkYpA7/bRB3Oc62OeqP1sd0S92uJNqrzvZmGwR7gdiNT5Qhp0LmUenGw5+d56uGi2tRbzzlYRMKBSzL+1Usdh4LEtLb0bkJOCggaZdf8rK5TCUU7/nEq63nS4wPSknDcQU8WS83LCAWMIhvdqkxF2sph2breZQh4N0mDsNxseaGS6Hnde6836e42ESvwh2PvCqMEaWmM300jtMWlBZwUkZfbxNDug72WT5ri+n4/V7KwQHYkMgvAQS+SFSF65S5EtzZGVvtkJLs1asKZzxeDFuohC4rhA+125vkMTnAKJdg3hIJ299DAER16un/iKTGGQTPv3J6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPPduQCKR51rlxY+zK1BI96fFFSBAm339SI518w9idY=;
 b=ZmQ1JgzBs69ycCvJpgX8+TyfqEY8BNiJpW92KkY8wM27GLcHV3Uc9r2+emTAEldp+Itsc4zV/W5EupvEP2ZFRfp0P/tmK679JRGevIEkB4Cjcrzts0hmlgCqb3E2hmH7Ge6vfA77VrdoYW9rDW8y1fEklzbGMViZuydKbYJwsJd6jvJIAGQoSc9rO1H0i30DNh7n13n4bN2jSaX0jry3o6fu42TaKZuuzIlTp5bEEggPIiPx4j2A8foI6ZTKpFlpxWVE4b5bW75+hHOvkMmqDaBZZLpU1yeQlr004PJoGxCb+EqZeYAMmovzYutFnz8wCkcral56NRmTWPq+kmM5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPPduQCKR51rlxY+zK1BI96fFFSBAm339SI518w9idY=;
 b=Lt5UJstCqTgHIVq4KUsHmreO6k8++3BP6iblmMj6cyq/uHAWKIQ7O85AFpW6mFkIPUkDOOn4sZg3kJEZ5zF5aK2junj7oAw2XHtUoAkT1IWlpXg6Wpr5YCK5H2tFDnOIinGwOZCSggCnLRswBY9JzW/50IWIKP6afK0xEXKsQg5G3iHoit6yvvVdnRshG9ZfPOX39lO/fSokLfEFdViJO1NRoHGcfoHNgYOtCsGdn5oE9g97M0pUQVGhXbf99ThGUY+8uUa0cAQfoW92WyKYAjRe2lcD/jKnn7n1gQ8EDGlOkfU+3ewZtfAFoP+acW/sV9YYl4VQ310vWReuhOfjHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 19:32:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 19:32:35 +0000
Date: Fri, 11 Sep 2026 15:32:28 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Radu Rendec <radu@rendec.net>
Cc: Fabio Estevam <festevam@gmail.com>, tglx@kernel.org, Frank.Li@nxp.com,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v3 1/2] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_enable()
Message-ID: <aqRXTITjN3rgjsBk@lizhi-Precision-Tower-5810>
References: <20260805192743.244441-1-festevam@gmail.com>
 <f5e720e174fb74615f5c3c0702e63f6b8aa3ec87.camel@rendec.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5e720e174fb74615f5c3c0702e63f6b8aa3ec87.camel@rendec.net>
X-ClientProxiedBy: PH1PEPF00013301.namprd07.prod.outlook.com
 (2603:10b6:518:1::f) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3b0b37-e173-4116-9aec-08df103b6eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|18002099003|6133799003|10067099003|4143699003|11063799006|56012099006|5023799004|22082099003;
X-Microsoft-Antispam-Message-Info:
	pa3gIuwg6exQk8GHy77IaunQijqaKWZs9/MWPwyhuyYr7Hb7nlEWeJw8RsrBk4eFSnTW8/feJJ6t/ccFt1M9rcQZaVlUvLL+b+xV8yKUqvj+EEGbNvXxG5kGgk4oF5Psxr2FsNnCfmZmh5Bw3K6YekCst+/x/aWDy7ZcnUzBEgRb0h6dQDlQv+IOeZFam31F1xMqDCl9poO5IXB+MgDC8qxTzD/Vlea0gqb84wA/DVjz3m2NFQyosMtlq942po53R2NZAjviJx6B1VpAfyW+UTMExDnIL24YnwjJeeXs1VGaKklefmi6blvltnpkyr4E2GITNCxNM45s/z7VxyFcVjhipBEIGotfNc0G13kB1rvXq968ojUMqdCdKLj4GTscN2D74Msc+//Ih9E+1+GPF1dy0q9PKXFu+jk79zA+TlwJidR3dTAZ/g90ARax7PELWeu9mgZVYONXYrFw0oj/3e/09Bl6eeqtSM1JzNSjd5KcmDfT0vWZmtvzQooGYKRl2PVb3MJSmavCmVt3EOA0aNBnyoHu0VxWcJSKNxPJjGn/4LCDR60oz0yBUxDYxzZUK7MH7ITYInowEKVbBD1VZ13/5A0yezjQT2VwMP+BDKs5wzUJRg3oyqlGJTPJJm7R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(18002099003)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(5023799004)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?MNR56l3gZM6RhC4fbEIvsWgANS48kPGXkKucKTOboBHHo8yDHt74pPnHaj?=
 =?iso-8859-1?Q?4dw7v8u7BSg17k2sRQFtbewgTkfdzdFKyNgToeK0srFRdlp1wZ0gc/Fw4u?=
 =?iso-8859-1?Q?RWYB1COU2PsLkqTT+1afMMA9vzuoIYvHRU6KB3nKuvrdDu2pyKRcokphHg?=
 =?iso-8859-1?Q?pMa0JUrGtAoRV1LFzRklzTflN+zCxh4tYowZRLUUP9E5VLN6ByoS7CkrpX?=
 =?iso-8859-1?Q?R5iyviQgcG1dH9Qxvt6i6/OUsqY9Cm+KJjbLcROvimj2/EBV06to8KgvhV?=
 =?iso-8859-1?Q?QzGiyB2gOmwp/e5hc6KhzPqiOB9NyuGTpknzLPBFs8dE66p2xvad1atwtt?=
 =?iso-8859-1?Q?XkS/26I3qBlMZsVw97fTQp3u5WKcOO0DbBYYTutuiqPHA+ZNeEShmIqCP6?=
 =?iso-8859-1?Q?ES5UkA3sM5F0xCjdv7TvK7Zs8GSgPXIwwAcUQ6HMzORfRdMBvbm1bJSiK6?=
 =?iso-8859-1?Q?sJhiQG1G81+S2AnQrAVUTNUkOvIfnROKKUtnS6fTZjnP3jMXV4zndP8j9d?=
 =?iso-8859-1?Q?Fte/hf/sVhMg6kL2KI1yOgmKTKFHLdIDiTrqQvMFx92l7z3I17UIuM1Opq?=
 =?iso-8859-1?Q?FwcGnRpN29p30nlC0PXcicVWMob9yVInVQonh6C/CB3TEgyAkCxZzUQ5VV?=
 =?iso-8859-1?Q?OuwNKVdMrm5xEpqSR9ptYjHfY5L4Fyl5gP5PIB5qNq+inTzkb5FVsnh3Oo?=
 =?iso-8859-1?Q?VaYSa+cNW36JPPDHloWlEpk6cjyIBjFgAtVzJFNtj+uXxJqwBe9fWnWyTd?=
 =?iso-8859-1?Q?Sq2G9LhmH5Rc5QNidnE9f6JvVtUzEahKtFbuWnoLFgKGa3yxq/HZ1HnOV3?=
 =?iso-8859-1?Q?X+k1uEMhF47txUxj8DttcYxQk1TISBetTWVLEs1eTEYxv6gZ7mwjcUGDLe?=
 =?iso-8859-1?Q?Tj17SWFxMHhlv/7osMd9PZtnsyULWIpErMzccq+VnJq0zHZnOyQjZfRero?=
 =?iso-8859-1?Q?naj4XRddG7e5X6vfjsorJAM1IycKOieUqWlbCj9DEwZleZYxHXAbv4UQ1I?=
 =?iso-8859-1?Q?azO+FxZJnHITFIi8DNr7vb8Br3D8ah8yMP50iqcQwtPWtnzYb+C2n8Zt47?=
 =?iso-8859-1?Q?rhAAOD9Sc4yNiWVbZ+dSxWXyH+xyOrMVRA3AEBfTP7rLOHv3ZifNeWQuQ3?=
 =?iso-8859-1?Q?ThdXRUkjiFHiGUdgxiuP9ePdECW7GSwo13STiqQmOVENCcHhrXazA9KDM2?=
 =?iso-8859-1?Q?JIjjjuZGc3mHHw8aMqd2rdI1Dhmaqc9fg/lvBE6IqgPixk74IuJw8KGW+u?=
 =?iso-8859-1?Q?rmnrWZiwDpvtaQXT6+vv4mztA1ND7+dwwC0JOqWWwDMrO75qeLT74XUZ1w?=
 =?iso-8859-1?Q?w5OdJT2Q26sCPUm5/vmhUMV1gAGYtQaSSqUkklltTs22eI79BgabriecCn?=
 =?iso-8859-1?Q?lUP22Irz5xfR/XdN+oTb6uvtCCGU4LRZ0HhcKeLrmVA70Vp+Qk1XuZc18M?=
 =?iso-8859-1?Q?cRk8D8ZtW1hlZqboCwTCWziv3HfDUazq1lI/0KO8S4JJntBQmcCLqwht7f?=
 =?iso-8859-1?Q?lcBOXgTiMqFTdHFQUccLnTGR271BWSpyYySOpZYSb3Wed5CWMhWG+zJx3a?=
 =?iso-8859-1?Q?Q56rPuf+odb1IZZmd8gZryiKEuoQCY1h9saEYgEwWoFFSjliPNRCqUQnGa?=
 =?iso-8859-1?Q?MIMIfFOeNcrHCG+Z5/AH0x0QFgu/dqRzrcfszG3qrEDWdNtcy0l67ksBO7?=
 =?iso-8859-1?Q?SiJ3dklt1Fdlpc79j9iavd8vzHe1WJnjYwuN/B9pOrNTaVio6vs1xowHGa?=
 =?iso-8859-1?Q?lwDdgmCuIxchWWgU3VwP1A4uNgUP8CnX/lju9HJjvr+Mwk72E/GD5MCu8r?=
 =?iso-8859-1?Q?yNEb4bjO7zmIrdvn+s12LgOnbBXd0jBJE5Ul0KcdUGK3lDRTeIV0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3b0b37-e173-4116-9aec-08df103b6eb6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:32:35.8201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fz4qA/NIiFiq613x+YzHx2J/xH3pt9Yz4UwaQq41iB5U7t1EKfblySLWidc7v6dEvXo5/cni37HdfbTVIbZ0cBnO3HH825Ik1D8XAWAxOvCZ6otazgeeme8R2NHNUGcm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8642

On Thu, Aug 06, 2026 at 05:28:59PM -0400, Radu Rendec wrote:
> On Wed, 2026-08-05 at 16:27 -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@nabladev.com>
> >
> > imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove() does
> > not disable it. Consequently, runtime PM remains enabled after unbinding
> > the device, and rebinding it triggers:
> >
> > Unbalanced pm_runtime_enable!
> >
> > Use devm_pm_runtime_enable() to automatically disable runtime PM when
> > the device is removed. Set up runtime PM before creating the IRQ domain
> > and registering chained handlers so that a failure cannot leave either
> > resource pointing at freed driver data.
> >
> > Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> > Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> > ---
> > Changes since v1:
> > - Move devm_pm_runtime_enable() prior to irq_domain_create_linear(). (Frank)
> >
> >  drivers/irqchip/irq-imx-irqsteer.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> > index 87b07f517be3..653e25115083 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -236,6 +236,11 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> >  	if (irqsteer_has_chanctrl(data->devtype_data))
> >  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> >  
> > +	pm_runtime_set_active(&pdev->dev);
> > +	ret = devm_pm_runtime_enable(&pdev->dev);
> > +	if (ret)
> > +		goto out;
> > +
> >  	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
> >  						&imx_irqsteer_domain_ops, data);
> >  	if (!data->domain) {
> > @@ -262,9 +267,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, data);
> >  
> > -	pm_runtime_set_active(&pdev->dev);
> > -	pm_runtime_enable(&pdev->dev);
> > -
> >  	return 0;
> >  out:
> >  	clk_disable_unprepare(data->ipg_clk);
>
> I still believe there is something off with the way pm_runtime is
> handled, and that the double clock disable is possible.
>
> Since (like I said) I have very limited understanding of the runtime_pm
> framework, I decided to make a little experiment.
>
> With the dummy module below, I see this:
> [  548.253591] pm_dummy pm_dummy: pm_dummy_probe() executed
> [  548.254209] pm_dummy pm_dummy: clock enabled; refcount: 1
> [  548.255028] pm_dummy pm_dummy: pm_dummy_runtime_suspend() triggered

https://elixir.bootlin.com/linux/v7.2.2/source/drivers/base/dd.c#L827

after probe, pm_request_idle(dev), which trigger pm_dummy_runtime_suspend()

> [  548.255845] pm_dummy pm_dummy: clock disabled; refcount: 0

> [  554.261820] pm_dummy pm_dummy: pm_dummy_runtime_resume() triggered
> [  554.263100] pm_dummy pm_dummy: clock enabled; refcount: 1
> [  554.264006] pm_dummy pm_dummy: pm_dummy_runtime_suspend() triggered
> [  554.264997] pm_dummy pm_dummy: clock disabled; refcount: 0
> [  554.265819] pm_dummy pm_dummy: pm_dummy_remove() executed

You should set runtime_resume() at remove function to match probe's state.
if your driver remove() did disable clock.

It is trick between runtime pm and devm clock management.

The beneafit of keep runtime active in probe, driver can work when disable
CONFIG_PM, but complex at tear down.

keep inactive in probe, code will be simple, but it will not work if
disable CONFIG_PM because clock have not enabled

Frank

> [  554.266609] pm_dummy pm_dummy: clock disabled; refcount: -1
> [  554.267468] pm_dummy pm_dummy: **************************************************
> [  554.268554] pm_dummy pm_dummy: [BUG DETECTED] Clock disable count underflow! (-1)
> [  554.269479] pm_dummy pm_dummy: **************************************************
>
> What I find interesting is that the device is suspended immediately
> during probe(), then it's automatically resumed and immediately
> suspended again right before remove(). The latter is probably a side
> effect of devm_pm_runtime_enable(). But in any case, the clock *is*
> disabled twice, and that's even without any explicit suspend or resume,
> it's just by loading and unloading the module.
>
> #include <linux/module.h>
> #include <linux/kernel.h>
> #include <linux/init.h>
> #include <linux/platform_device.h>
> #include <linux/pm_runtime.h>
>
> MODULE_LICENSE("GPL");
> MODULE_AUTHOR("Radu Rendec <radu@rendec.net>");
> MODULE_DESCRIPTION("runtime_pm playground");
>
> static int mock_clk_count = 0;
>
> static int mock_clk_prepare_enable(struct device *dev)
> {
> 	mock_clk_count++;
> 	dev_info(dev, "clock enabled; refcount: %d\n", mock_clk_count);
> 	return 0;
> }
>
> static void mock_clk_disable_unprepare(struct device *dev)
> {
> 	mock_clk_count--;
> 	dev_info(dev, "clock disabled; refcount: %d\n", mock_clk_count);
>
> 	if (mock_clk_count < 0) {
> 		dev_err(dev, "**************************************************\n");
> 		dev_err(dev, "[BUG DETECTED] Clock disable count underflow! (%d)\n", mock_clk_count);
> 		dev_err(dev, "**************************************************\n");
> 	}
> }
>
> static int pm_dummy_runtime_suspend(struct device *dev)
> {
> 	dev_info(dev, "%s() triggered\n", __func__);
> 	mock_clk_disable_unprepare(dev);
> 	return 0;
> }
>
> static int pm_dummy_runtime_resume(struct device *dev)
> {
> 	dev_info(dev, "%s() triggered\n", __func__);
> 	return mock_clk_prepare_enable(dev);
> }
>
> static const struct dev_pm_ops pm_dummy_pm_ops = {
> 	SET_RUNTIME_PM_OPS(pm_dummy_runtime_suspend, pm_dummy_runtime_resume, NULL)
> };
>
> static int pm_dummy_probe(struct platform_device *pdev)
> {
> 	dev_info(&pdev->dev, "%s() executed\n", __func__);
>
> 	mock_clk_prepare_enable(&pdev->dev);
> 	pm_runtime_set_active(&pdev->dev);
> 	devm_pm_runtime_enable(&pdev->dev);
>
> 	return 0;
> }
>
> static void pm_dummy_remove(struct platform_device *pdev)
> {
> 	dev_info(&pdev->dev, "%s() executed\n", __func__);
>
> 	mock_clk_disable_unprepare(&pdev->dev);
> }
>
> static struct platform_driver pm_dummy = {
> 	.probe = pm_dummy_probe,
> 	.remove = pm_dummy_remove,
> 	.driver = {
> 		.name = "pm_dummy",
> 		.pm = &pm_dummy_pm_ops,
> 	},
> };
>
> static struct platform_device *pdev;
>
> static int __init pm_demo_init(void)
> {
> 	int ret;
>
> 	ret = platform_driver_register(&pm_dummy);
> 	if (ret)
> 		return ret;
>
> 	pdev = platform_device_register_simple("pm_dummy", -1, NULL, 0);
> 	if (IS_ERR(pdev)) {
> 		platform_driver_unregister(&pm_dummy);
> 		return PTR_ERR(pdev);
> 	}
>
> 	return 0;
> }
>
> static void __exit pm_demo_exit(void)
> {
> 	platform_device_unregister(pdev);
> 	platform_driver_unregister(&pm_dummy);
> }
>
> module_init(pm_demo_init);
> module_exit(pm_demo_exit);
