Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FD3346FB3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321616; cv=none; b=aPc4RueoMtqYVMc92OlCeXnDfYJbsLN/pqNA3921cDiB3vicLtiB88z/IQwpdbRZCWfsTx+9jVdyEA6a5/GijaDSqctVhk2ZjgEzS6we1KLJ9cruuy5naIQ+klzA66bMTN0hmLW/11loVucqUgS79vs2fObMp8VhsjlraxvkdJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321616; c=relaxed/simple;
	bh=o8qEB1K3roUnT9ubsTk6JkTQKujt+fQ5XSky6m8yCnY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XKa1Dt6UxgAvB36EtWe2G8WsgljfqVCgH+Hk+pXOtw9IAsCfrU4z/VKGPcyJ4t1+7uPXbhcVgrCvYkOWbnWYd56wv12jthz17X/rFyzlZKzgb7006tqoaWDoLbXeWEPP4YX8R6GAkzG95Ticgrx01IAZ5lU/JuP2AKtvt7An3+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=tC09IrwS; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="tC09IrwS"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 2F3EDC348B;
	Sun, 13 Sep 2026 20:40:32 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 2F3EDC348B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789321233;
	bh=3kVp9ftx8zdV1vMJiO0ohMeT8+KjRu1oX4KcUm+8AvI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=tC09IrwSiPOs7gHg7yWVRSy6mEZJmz5O/vGXTX8hb11vcs0jtlPZ2X1FOOFLl09G/
	 CjcsZODJv9Pxx3n7/3QBCBhoB/nDj89bv8+o5kGCI2SOkjWBPcrV4r5NVKnkHufRFb
	 OxMd50eiIZ4FLw4xDMNO6xttBSW8p31y2oOl7+D6rc3cbXomS0n3dr7yrIVh3TAUHd
	 DJmovyH5F9GNpQGRUT77Zp6KLaQObAtqbS2JnLQw7RuAmNDup6Jt+3k/PcUPUYfGoY
	 9D0pxIv6as7KpMtJreUCXExIVEkPzEZixQZvIYjeEdJbA3sZrDSOVf8sGd/EHYFJ/5
	 PKyDDV8HGecJQ==
Message-ID: <ac1f6aa6904852c1b73178a50fd6a0c279bb113d.camel@rendec.net>
Subject: Re: [PATCH v3 1/2] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_enable()
From: Radu Rendec <radu@rendec.net>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, tglx@kernel.org, Frank.Li@nxp.com, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, Fabio Estevam
	 <festevam@nabladev.com>
Date: Sun, 13 Sep 2026 13:40:30 -0400
In-Reply-To: <aqRXTITjN3rgjsBk@lizhi-Precision-Tower-5810>
References: <20260805192743.244441-1-festevam@gmail.com>
	 <f5e720e174fb74615f5c3c0702e63f6b8aa3ec87.camel@rendec.net>
	 <aqRXTITjN3rgjsBk@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 15:32 -0400, Frank Li wrote:
> On Thu, Aug 06, 2026 at 05:28:59PM -0400, Radu Rendec wrote:
> > On Wed, 2026-08-05 at 16:27 -0300, Fabio Estevam wrote:
> > > From: Fabio Estevam <festevam@nabladev.com>
> > >=20
> > > imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove() do=
es
> > > not disable it. Consequently, runtime PM remains enabled after unbind=
ing
> > > the device, and rebinding it triggers:
> > >=20
> > > Unbalanced pm_runtime_enable!
> > >=20
> > > Use devm_pm_runtime_enable() to automatically disable runtime PM when
> > > the device is removed. Set up runtime PM before creating the IRQ doma=
in
> > > and registering chained handlers so that a failure cannot leave eithe=
r
> > > resource pointing at freed driver data.
> > >=20
> > > Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> > > Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> > > ---
> > > Changes since v1:
> > > - Move devm_pm_runtime_enable() prior to irq_domain_create_linear(). =
(Frank)
> > >=20
> > > =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 8 +++++---
> > > =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq=
-imx-irqsteer.c
> > > index 87b07f517be3..653e25115083 100644
> > > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > > @@ -236,6 +236,11 @@ static int imx_irqsteer_probe(struct platform_de=
vice *pdev)
> > > =C2=A0	if (irqsteer_has_chanctrl(data->devtype_data))
> > > =C2=A0		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> > > =C2=A0
> > > +	pm_runtime_set_active(&pdev->dev);
> > > +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > =C2=A0	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->de=
v), data->reg_num * 32,
> > > =C2=A0						&imx_irqsteer_domain_ops, data);
> > > =C2=A0	if (!data->domain) {
> > > @@ -262,9 +267,6 @@ static int imx_irqsteer_probe(struct platform_dev=
ice *pdev)
> > > =C2=A0
> > > =C2=A0	platform_set_drvdata(pdev, data);
> > > =C2=A0
> > > -	pm_runtime_set_active(&pdev->dev);
> > > -	pm_runtime_enable(&pdev->dev);
> > > -
> > > =C2=A0	return 0;
> > > =C2=A0out:
> > > =C2=A0	clk_disable_unprepare(data->ipg_clk);
> >=20
> > I still believe there is something off with the way pm_runtime is
> > handled, and that the double clock disable is possible.
> >=20
> > Since (like I said) I have very limited understanding of the runtime_pm
> > framework, I decided to make a little experiment.
> >=20
> > With the dummy module below, I see this:
> > [=C2=A0 548.253591] pm_dummy pm_dummy: pm_dummy_probe() executed
> > [=C2=A0 548.254209] pm_dummy pm_dummy: clock enabled; refcount: 1
> > [=C2=A0 548.255028] pm_dummy pm_dummy: pm_dummy_runtime_suspend() trigg=
ered
>=20
> https://elixir.bootlin.com/linux/v7.2.2/source/drivers/base/dd.c#L827
>=20
> after probe, pm_request_idle(dev), which trigger pm_dummy_runtime_suspend=
()
>=20
> > [=C2=A0 548.255845] pm_dummy pm_dummy: clock disabled; refcount: 0
>=20
> > [=C2=A0 554.261820] pm_dummy pm_dummy: pm_dummy_runtime_resume() trigge=
red
> > [=C2=A0 554.263100] pm_dummy pm_dummy: clock enabled; refcount: 1
> > [=C2=A0 554.264006] pm_dummy pm_dummy: pm_dummy_runtime_suspend() trigg=
ered
> > [=C2=A0 554.264997] pm_dummy pm_dummy: clock disabled; refcount: 0
> > [=C2=A0 554.265819] pm_dummy pm_dummy: pm_dummy_remove() executed
>=20
> You should set runtime_resume() at remove function to match probe's state=
.
> if your driver remove() did disable clock.
>=20
> It is trick between runtime pm and devm clock management.
>=20
> The beneafit of keep runtime active in probe, driver can work when disabl=
e
> CONFIG_PM, but complex at tear down.
>=20
> keep inactive in probe, code will be simple, but it will not work if
> disable CONFIG_PM because clock have not enabled

Thanks, Frank! I appreciate you took the time to explain this in
detail.

The dummy driver followed the exact same logic/sequence as the proposed
patch, and the purpose was to observe the behavior of runtime_pm in
isolation and prove that something wasn't quite right about the clock
management.

I believe this is now handled correctly in Zhipeng's consolidated patch
series against imx-irqsteer.

> > [=C2=A0 554.266609] pm_dummy pm_dummy: clock disabled; refcount: -1
> > [=C2=A0 554.267468] pm_dummy pm_dummy: ********************************=
******************
> > [=C2=A0 554.268554] pm_dummy pm_dummy: [BUG DETECTED] Clock disable cou=
nt underflow! (-1)
> > [=C2=A0 554.269479] pm_dummy pm_dummy: ********************************=
******************
> >=20
> > What I find interesting is that the device is suspended immediately
> > during probe(), then it's automatically resumed and immediately
> > suspended again right before remove(). The latter is probably a side
> > effect of devm_pm_runtime_enable(). But in any case, the clock *is*
> > disabled twice, and that's even without any explicit suspend or resume,
> > it's just by loading and unloading the module.
> >=20
> > #include <linux/module.h>
> > #include <linux/kernel.h>
> > #include <linux/init.h>
> > #include <linux/platform_device.h>
> > #include <linux/pm_runtime.h>
> >=20
> > MODULE_LICENSE("GPL");
> > MODULE_AUTHOR("Radu Rendec <radu@rendec.net>");
> > MODULE_DESCRIPTION("runtime_pm playground");
> >=20
> > static int mock_clk_count =3D 0;
> >=20
> > static int mock_clk_prepare_enable(struct device *dev)
> > {
> > 	mock_clk_count++;
> > 	dev_info(dev, "clock enabled; refcount: %d\n", mock_clk_count);
> > 	return 0;
> > }
> >=20
> > static void mock_clk_disable_unprepare(struct device *dev)
> > {
> > 	mock_clk_count--;
> > 	dev_info(dev, "clock disabled; refcount: %d\n", mock_clk_count);
> >=20
> > 	if (mock_clk_count < 0) {
> > 		dev_err(dev, "**************************************************\n");
> > 		dev_err(dev, "[BUG DETECTED] Clock disable count underflow! (%d)\n", =
mock_clk_count);
> > 		dev_err(dev, "**************************************************\n");
> > 	}
> > }
> >=20
> > static int pm_dummy_runtime_suspend(struct device *dev)
> > {
> > 	dev_info(dev, "%s() triggered\n", __func__);
> > 	mock_clk_disable_unprepare(dev);
> > 	return 0;
> > }
> >=20
> > static int pm_dummy_runtime_resume(struct device *dev)
> > {
> > 	dev_info(dev, "%s() triggered\n", __func__);
> > 	return mock_clk_prepare_enable(dev);
> > }
> >=20
> > static const struct dev_pm_ops pm_dummy_pm_ops =3D {
> > 	SET_RUNTIME_PM_OPS(pm_dummy_runtime_suspend, pm_dummy_runtime_resume, =
NULL)
> > };
> >=20
> > static int pm_dummy_probe(struct platform_device *pdev)
> > {
> > 	dev_info(&pdev->dev, "%s() executed\n", __func__);
> >=20
> > 	mock_clk_prepare_enable(&pdev->dev);
> > 	pm_runtime_set_active(&pdev->dev);
> > 	devm_pm_runtime_enable(&pdev->dev);
> >=20
> > 	return 0;
> > }
> >=20
> > static void pm_dummy_remove(struct platform_device *pdev)
> > {
> > 	dev_info(&pdev->dev, "%s() executed\n", __func__);
> >=20
> > 	mock_clk_disable_unprepare(&pdev->dev);
> > }
> >=20
> > static struct platform_driver pm_dummy =3D {
> > 	.probe =3D pm_dummy_probe,
> > 	.remove =3D pm_dummy_remove,
> > 	.driver =3D {
> > 		.name =3D "pm_dummy",
> > 		.pm =3D &pm_dummy_pm_ops,
> > 	},
> > };
> >=20
> > static struct platform_device *pdev;
> >=20
> > static int __init pm_demo_init(void)
> > {
> > 	int ret;
> >=20
> > 	ret =3D platform_driver_register(&pm_dummy);
> > 	if (ret)
> > 		return ret;
> >=20
> > 	pdev =3D platform_device_register_simple("pm_dummy", -1, NULL, 0);
> > 	if (IS_ERR(pdev)) {
> > 		platform_driver_unregister(&pm_dummy);
> > 		return PTR_ERR(pdev);
> > 	}
> >=20
> > 	return 0;
> > }
> >=20
> > static void __exit pm_demo_exit(void)
> > {
> > 	platform_device_unregister(pdev);
> > 	platform_driver_unregister(&pm_dummy);
> > }
> >=20
> > module_init(pm_demo_init);
> > module_exit(pm_demo_exit);

--=20
Best regards,
Radu
