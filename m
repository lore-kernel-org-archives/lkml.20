Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241A363C73
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693582; cv=none; b=Tdk7Vi0aIU/J1QVjkJA08zk9igm3loP8tUbQS6RSSxKHUwqMO89czhFmbcRi0nuGyNvKK25epYaw8kklMOT8vXYbDOlwHpqiRnfLrCeMtZk6lG0a5zGaFI1LXOlF9DvkQyItxo6zKPfCdlDUAnG6cHMaWRKwfFvNfr/wAoA8spI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693582; c=relaxed/simple;
	bh=dYL1EmiskWTsxYzKg9ArQaRxWpmXh6w8TOfGbQe4cDk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l4PstA8i4U6EPMpWyhIPfoM35ShHNPu+omnvTVoRMvUoaH3gj1yceqs+B5x/DmA1ddpcgcS7RG1QtZ6ypiizLRoe6jRy+opNBcMIpJ74lOJ2EgSBJSlCIfEWojSUVhZePN3YF3uGuerTZtDqlIfbtL5fCdN38Hr0S8w00ANLzgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=bjZRLpT8; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="bjZRLpT8"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 11474CFAD5;
	Fri, 18 Sep 2026 04:06:11 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 11474CFAD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789693572;
	bh=j2QKuCwDLPzNQ2LtUH7DzrW8On/NLxd9snV9r1oS8yA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bjZRLpT83aVn24lyDRchJJGSjI2VHuD+Yvg8KbuGBpVA+AmAPDEm0qX8TQzBKZSWs
	 0nvl+tYo3jNHAnNsz0OTuHPaA0gSyUnGQn+MyvCblkaE2ZSGXoziExgdFwivCUU6Ea
	 whR2FsltkVqfPWoUxqixdOhouhCSexFt1aKDVmqHKRy4B5WSaZ6aFoonwotweqfb4S
	 PWJMvcf02NV8dcva6RHdC3KrJ1Mvn/fxaRKcU3sp/XwTukVuXgdGT3Mnfg1dYIOG4W
	 XvI0UMHka6ll7wZ3Ec34pYQmnX6x9S4UEGtMl9Vq2RvGlAZpGLp1Htlj2u9MMUcEyQ
	 HVe3L2ZNjEQ0w==
Message-ID: <2a0c6e71e4a9c80630d35e87e6eb516db3cd3ece.camel@rendec.net>
Subject: Re: [PATCH v2] irqchip: st: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
From: Radu Rendec <radu@rendec.net>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: linux-kernel@vger.kernel.org, tglx@kernel.org
Date: Thu, 17 Sep 2026 21:06:10 -0400
In-Reply-To: <20260917013835.223139-1-triet.hoang.dev@gmail.com>
References: <20260917013835.223139-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-17 at 08:38 +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
> and pm_sleep_ptr().
>=20
> This allows dropping the __maybe_unused annotations from the PM callbacks=
,
> also reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled=
.
>=20
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> ---
> v2:
> - Address the commit message following reviewer's feedback
>=20
> v1: https://lore.kernel.org/all/20260821043928.123543-1-triet.hoang.dev@g=
mail.com/
> ---
> =C2=A0drivers/irqchip/irq-st.c | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-st.c b/drivers/irqchip/irq-st.c
> index de71bb350d57..fef0521831aa 100644
> --- a/drivers/irqchip/irq-st.c
> +++ b/drivers/irqchip/irq-st.c
> @@ -157,7 +157,7 @@ static int st_irq_syscfg_probe(struct platform_device=
 *pdev)
> =C2=A0	return st_irq_syscfg_enable(pdev);
> =C2=A0}
> =C2=A0
> -static int __maybe_unused st_irq_syscfg_resume(struct device *dev)
> +static int st_irq_syscfg_resume(struct device *dev)
> =C2=A0{
> =C2=A0	struct st_irq_syscfg *ddata =3D dev_get_drvdata(dev);
> =C2=A0
> @@ -165,12 +165,12 @@ static int __maybe_unused st_irq_syscfg_resume(stru=
ct device *dev)
> =C2=A0				=C2=A0 ST_A9_IRQ_MASK, ddata->config);
> =C2=A0}
> =C2=A0
> -static SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscfg_resum=
e);
> +static DEFINE_SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscf=
g_resume);
> =C2=A0
> =C2=A0static struct platform_driver st_irq_syscfg_driver =3D {
> =C2=A0	.driver =3D {
> =C2=A0		.name =3D "st_irq_syscfg",
> -		.pm =3D &st_irq_syscfg_pm_ops,
> +		.pm =3D pm_sleep_ptr(&st_irq_syscfg_pm_ops),
> =C2=A0		.of_match_table =3D st_irq_syscfg_match,
> =C2=A0	},
> =C2=A0	.probe =3D st_irq_syscfg_probe,
> --
> 2.53.0

Reviewed-by: Radu Rendec <radu@rendec.net>
