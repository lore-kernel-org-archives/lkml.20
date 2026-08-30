Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F9243387
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788118303; cv=none; b=Y9Z0LUaXTtETtkDSQxP4h8bGI3Yv+ROoZwhFaQn3pOBFlUtyAppHCkqEl4owFOt+0XMPoIJ1XpN1tHqexOnqtw9ERafIMOVd8k8hsQjAyigOi6nfwigCJq1ePGXxlfHN2uciuHmOKtYFSI62a0QXU62lJY6zgmH2sQrJXMPwfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788118303; c=relaxed/simple;
	bh=vk8de1R6uSeaXSsFypxM/cBs3QZ0Cmsvam6QbYQxahA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fzhCB3zyZz6pwgXk8gzHqnSLU66Ybaf22GFGSpztsBkGWEYL9BI5gBOI1spCjQyG2E227RTdOKHqcCFOjPXkWR2ncL66zTWTrExNlatxZUPqHmxLFHJbwrkZsCq55Zvnl/sJFqm/nUNOfZm+HIIEveaHnR4YMpCuRC/eBHghio0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=QAHtyZVb; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="QAHtyZVb"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id A582CCC95B;
	Sun, 30 Aug 2026 22:31:37 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro A582CCC95B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788118299;
	bh=+Fy5x9FF0h8DlYnAcK60dnMjg3c9NH7hhRhO/p8tocQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QAHtyZVbZEWfOoPcRRdm158SQZLEu8kKH/LmD567H/xyFuJhAwv9TobgbI1Y6jHsV
	 I1AzzDO0lXxGZrYEUECSpaSU1j4WsMSqQkMtR8FMdfJPMLzZKPMZMZ1u679e331atG
	 lLLLcy027WBNg/IRx+9h45FoqvCmeoQvrOe9+wHqYICYKmuCFrvy+HZbnnZjVIc5NO
	 8ouO9IjRhqOKxsZGyi78wDwKBN4Sv30GkX45Xkcr/Z3nzH/FQQUYhHOn3f2VU7nlj4
	 z+FoFbyMYvHWK1trUNE0SnV071fPI3zUJwvgOr1ulHmTSUV9MP7J/+XFxpHoKVvCpA
	 HPS6w87mTR72w==
Message-ID: <41672e22fcb4b22df9af08ac73c2da54638e70db.camel@rendec.net>
Subject: Re: [PATCH v5 6/9] irqchip/imx-irqsteer: Let devres own the clock
 and runtime PM
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Sun, 30 Aug 2026 15:31:35 -0400
In-Reply-To: <20260821101039.4037925-7-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
	 <20260821101039.4037925-7-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-21 at 19:10 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>=20
> In preparation for making the driver unbindable/reloadable, let the
> driver core own the clock and runtime PM lifetime so that the probe()
> error path and remove() do not have to hand-balance them:
>=20
> =C2=A0- acquire the clock with devm_clk_get_enabled() instead of a bare
> =C2=A0=C2=A0 devm_clk_get() followed by a manual clk_prepare_enable(), so=
 it is
> =C2=A0=C2=A0 prepared/enabled for the device lifetime and released on unb=
ind;
> =C2=A0- keep only clk_enable()/clk_disable() in the runtime PM callbacks,
> =C2=A0=C2=A0 since prepare/unprepare is now handled once by devres;
> =C2=A0- enable runtime PM with devm_pm_runtime_set_active_enabled(), whic=
h
> =C2=A0=C2=A0 marks the device active (matching the enabled clock) and dis=
ables
> =C2=A0=C2=A0 runtime PM on unbind.
>=20
> The device may be runtime-suspended at unbind time (autosuspend), in
> which case the runtime suspend callback has already dropped the clock
> enable count. The devres clk_disable_unprepare() that runs after
> remove() would then underflow the enable count. Resume the device in
> remove() so the clock is enabled when devres tears it down, keeping the
> count balanced.
>=20
> With the clock and runtime PM owned by devres, remove() and the probe()
> error path only have to dispose of the parent IRQ mappings.
>=20
> Suggested-by: Fabio Estevam <festevam@nabladev.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 37 +++++++++++++++++++--------=
---
> =C2=A01 file changed, 23 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index b63bf957ab88..c2f58787f9a8 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -194,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
> =C2=A0		return PTR_ERR(data->regs);
> =C2=A0	}
> =C2=A0
> -	data->ipg_clk =3D devm_clk_get(&pdev->dev, "ipg");
> +	data->ipg_clk =3D devm_clk_get_enabled(&pdev->dev, "ipg");
> =C2=A0	if (IS_ERR(data->ipg_clk))
> =C2=A0		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get ipg clk\n");
> @@ -229,12 +229,6 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
> =C2=A0			return -ENOMEM;
> =C2=A0	}
> =C2=A0
> -	ret =3D clk_prepare_enable(data->ipg_clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
> -		return ret;
> -	}
> -
> =C2=A0	/* steer all IRQs into configured channel */
> =C2=A0	if (irqsteer_has_chanctrl(data->devtype_data))
> =C2=A0		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> @@ -275,12 +269,21 @@ static int imx_irqsteer_probe(struct platform_devic=
e *pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, data);
> =C2=A0
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (ret)
> +		goto err_irq;
> =C2=A0
> =C2=A0	return 0;
> +
> +err_irq:
> +	for (i =3D 0; i < data->irq_count; i++) {
> +		if (!data->irq[i])
> +			break;
> +
> +		irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
> +		irq_dispose_mapping(data->irq[i]);
> +	}
> =C2=A0out:
> -	clk_disable_unprepare(data->ipg_clk);

With this change, the "out" label becomes useless, and the error path
for devm_irq_domain_instantiate() above can simply do:
	return PTR_ERR(data->domain);

In that same vein, the err_irq label can be eliminated as well by
negating the condition on the "if" statement. What I mean is:
	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
	if (!ret)
		return 0;

	for (i =3D 0; i < data->irq_count; i++) {

In fact, the "for" loop is identical to the one in imx_irqsteer_remove(),
so it can be moved to an inline function. Then, assuming the new inline
function is called imx_irqsteer_unmap_parent_irq(), the probe code can
be re-written as:
	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
	if (ret)
		imx_irqsteer_unmap_parent_irq(pdev);

	return ret;

Other than that, the patch looks good to me.

> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> @@ -289,6 +292,14 @@ static void imx_irqsteer_remove(struct platform_devi=
ce *pdev)
> =C2=A0	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev)=
;
> =C2=A0	int i;
> =C2=A0
> +	/*
> +	 * The device may be runtime-suspended here, in which case the
> +	 * runtime suspend callback has already dropped the clock enable
> +	 * count. Resume it so the devres clk_disable_unprepare(), which
> +	 * runs after remove(), finds the clock enabled and stays balanced.
> +	 */
> +	pm_runtime_resume_and_get(&pdev->dev);
> +
> =C2=A0	for (i =3D 0; i < irqsteer_data->irq_count; i++) {
> =C2=A0		if (!irqsteer_data->irq[i])
> =C2=A0			break;
> @@ -297,8 +308,6 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =C2=A0						 NULL, NULL);
> =C2=A0		irq_dispose_mapping(irqsteer_data->irq[i]);
> =C2=A0	}
> -
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
> =C2=A0}
> =C2=A0
> =C2=A0#ifdef CONFIG_PM
> @@ -328,7 +337,7 @@ static int imx_irqsteer_suspend(struct device *dev)
> =C2=A0	struct irqsteer_data *irqsteer_data =3D dev_get_drvdata(dev);
> =C2=A0
> =C2=A0	imx_irqsteer_save_regs(irqsteer_data);
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	clk_disable(irqsteer_data->ipg_clk);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -338,7 +347,7 @@ static int imx_irqsteer_resume(struct device *dev)
> =C2=A0	struct irqsteer_data *irqsteer_data =3D dev_get_drvdata(dev);
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D clk_prepare_enable(irqsteer_data->ipg_clk);
> +	ret =3D clk_enable(irqsteer_data->ipg_clk);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(dev, "failed to enable ipg clk: %d\n", ret);
> =C2=A0		return ret;
