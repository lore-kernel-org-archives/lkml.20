Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1E64078D3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032464; cv=none; b=dN1mF7A1wZ/9vA99qEo3vza3H9JS0oOKD4lSsMPvGBXbigoIQMIe9nOqObV34gzn99ovfOYp1cyA0H50ydegCCEcVVKqq//j/CaIswWjsuC2ESFL3SAd1arKe/o7VO7vq891ZHOSLixgd2Z4yQSsiSFMYlN/xkiwvsnzQHkT+Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032464; c=relaxed/simple;
	bh=Gd5YAVL6EIN4lTGunNhRX4wLApyDRDMCioI9Y958CAo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qWnNphljFT0bYD5+yrGUnDadRAlvAvJs3tlqXu8m0LsiGM26pPqcpjSO9p2AcKcEXINqTzhIGsCqrq4PmEJ6RNeT2bXeyaMvP+Lf2zBoxopOW+JCFJDF8CxJ/0Xb1TqrjDRw15F56UkKzqClYzcY8XwyO68Ru5xy76OaB80kCkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=lXDuLOOD; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="lXDuLOOD"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id D5AFCCC9F9;
	Sat, 29 Aug 2026 22:40:52 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro D5AFCCC9F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788032453;
	bh=AdqICVblSf88UzYXqzspaDgZ/zYf2aw5CtiuIfxDPE8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lXDuLOODARLAEeoPuFkgkccvV1bGpDCKKs+NowOKJF0IKU68XgfDj4gxgH8dY8zxI
	 sVSU+cMUdW0U7jrI/3Esfeg4iZi+FrgZmYixmNFcUs7H94Lf7W4eNVeUrRBHvBeasa
	 BXoz6Agx50HQSZMp9nHjtNtblMo9yievERZk+5hwWmWI9gp39GhrEbhJiiq2+TCy6I
	 UUTk01hxP2x4rMLOtlQ7bAbnVPGDZkT21aMgBYiAGgEbqsOSHLIMzxa/ru/4dTjR3H
	 /gDjhC9OdeziZz54kZZWjt8LXw0NyvfZVuaJ46Ei0pXgftSC2SJaaNsISEq0JFSPYN
	 hVLhVaSqDk4yQ==
Message-ID: <f2acee4027dfc48515091bc75422d52494ec7547.camel@rendec.net>
Subject: Re: [PATCH] irqchip: st: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
From: Radu Rendec <radu@rendec.net>
To: Triet Hoang <triet.hoang.dev@gmail.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 29 Aug 2026 15:40:50 -0400
In-Reply-To: <20260821043928.123543-1-triet.hoang.dev@gmail.com>
References: <20260821043928.123543-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-21 at 11:39 +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS
> and pm_sleep_ptr().
>=20
> This lets us drop the __maybe_unused annotations
> from its suspend and resume callbacks,
> also reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.

Thanks for the patch! The patch itself (the code change part) looks
good to me. You can improve a little bit on the commit message format:
 * Please realign the text to a 72 characters line width.
 * Please avoid using the first person in the second paragraph. For
   example, something like "This allows dropping the..." is better.

> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
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
> =C2=A0 return st_irq_syscfg_enable(pdev);
> =C2=A0}
> =C2=A0
> -static int __maybe_unused st_irq_syscfg_resume(struct device *dev)
> +static int st_irq_syscfg_resume(struct device *dev)
> =C2=A0{
> =C2=A0 struct st_irq_syscfg *ddata =3D dev_get_drvdata(dev);
> =C2=A0
> @@ -165,12 +165,12 @@ static int __maybe_unused st_irq_syscfg_resume(stru=
ct device *dev)
> =C2=A0 =C2=A0 ST_A9_IRQ_MASK, ddata->config);
> =C2=A0}
> =C2=A0
> -static SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscfg_resum=
e);
> +static DEFINE_SIMPLE_DEV_PM_OPS(st_irq_syscfg_pm_ops, NULL, st_irq_syscf=
g_resume);
> =C2=A0
> =C2=A0static struct platform_driver st_irq_syscfg_driver =3D {
> =C2=A0 .driver =3D {
> =C2=A0 .name =3D "st_irq_syscfg",
> - .pm =3D &st_irq_syscfg_pm_ops,
> + .pm =3D pm_sleep_ptr(&st_irq_syscfg_pm_ops),
> =C2=A0 .of_match_table =3D st_irq_syscfg_match,
> =C2=A0 },
> =C2=A0 .probe =3D st_irq_syscfg_probe,

--=20
Regards,
Radu
