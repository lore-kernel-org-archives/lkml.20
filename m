Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1E74A4823
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788624081; cv=none; b=f4bis1SoaoGi4VMwxCn4zwqIHPVVRu1S/QhY5frTmKrMy4WbpkJ7ZTAY0Wbqg0T+KZHNaQhdx0gbhuqQhfDjiT3UqAH/Nelkdb5rXZA/qTFFN7WatA8Yddk9zhuQAglNbfCuA/232QoaNUE9avn23RZopfJuxL9QqPeTjUl8G4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788624081; c=relaxed/simple;
	bh=Moj33rPMaIj1vsuqWiRfb8b/syhui1PHPWlI9P4jtFc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M3tvQ63sb41hwrNovilITbESKKRm90kNpILpAXn7wQd8lI8A0sa7nCzGN2xxuIRKSfVZAd5Pp9MU6XoflVw+IQTGSQYuTCbCAuC9Vq1WkeatmLjJ0oxPZwo0T/AfW1mGRdABwcMiJOMqgUSaxDz8wkycQ1JXATv3y4b0O1Tzgi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=MaUL/h2n; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="MaUL/h2n"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id C4D31C2AEE;
	Sat,  5 Sep 2026 19:01:14 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro C4D31C2AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788624075;
	bh=nJpLbJM2QvH9Ul90VbxG78/1WihyUj943tLuzM6CPRk=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=MaUL/h2nTr23JcGP+Fh6TI9EiVC5DH5wyz+3R+se4TkGLJssOmipgXGBWocIDRIOr
	 G9tg0nORbc8zZ+/jEyCseV+31eJxKpb0PusZxxhHLpEW+V5BJyYc7R5ptzZpsYeHwG
	 i1uO9+s15/5jwEF2+anE0oAJ6Mzo0Matb5ASzFBGdUXt31tVzGMdOt5NZozi6LbcfY
	 w791HQJapgfG+voYkZS+VZToZpeav/CP+zqDUPVA9Wq48pDlrAeTJXTj9IudOexECM
	 Z1hAAkR1utUAnz4ysVZGi+UBo2uoAErFO4dr+gu+wOb289Yq+Wbz6JAaRawtSfsjG7
	 iL+sjHV3b99eA==
Message-ID: <21e174343007038fbf480884f131bc38a97ff2ca.camel@rendec.net>
Subject: Re: [PATCH 2/2] irqchip/pruss-intc: Use scoped lock guard and
 devm_mutex_init
From: Radu Rendec <radu@rendec.net>
To: Andrew Davis <afd@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
	linux-kernel@vger.kernel.org
Date: Sat, 05 Sep 2026 12:01:12 -0400
In-Reply-To: <20260903185220.2014861-2-afd@ti.com>
References: <20260903185220.2014861-1-afd@ti.com>
	 <20260903185220.2014861-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-03 at 13:52 -0500, Andrew Davis wrote:
> Scoped locking simplifies the return path in a spot, and removes
> a couple lines in another couple spots. The devm mutex init will
> call mutex_destroy() for us on remove, which only really matters
> when CONFIG_DEBUG_MUTEXES is set, but it is nice to do anyway.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> =C2=A0drivers/irqchip/irq-pruss-intc.c | 25 +++++++++----------------
> =C2=A01 file changed, 9 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss=
-intc.c
> index cc3a7c21c2904..5a3e9e5bccbea 100644
> --- a/drivers/irqchip/irq-pruss-intc.c
> +++ b/drivers/irqchip/irq-pruss-intc.c
> @@ -181,7 +181,7 @@ static void pruss_intc_map(struct pruss_intc *intc, u=
nsigned long hwirq)
> =C2=A0	u8 ch, host, reg_idx;
> =C2=A0	u32 val;
> =C2=A0
> -	mutex_lock(&intc->lock);
> +	guard(mutex)(&intc->lock);
> =C2=A0
> =C2=A0	intc->event_channel[hwirq].ref_count++;
> =C2=A0
> @@ -206,8 +206,6 @@ static void pruss_intc_map(struct pruss_intc *intc, u=
nsigned long hwirq)
> =C2=A0
> =C2=A0	dev_dbg(dev, "mapped system_event =3D %lu channel =3D %d host =3D =
%d",
> =C2=A0		hwirq, ch, host);
> -
> -	mutex_unlock(&intc->lock);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -224,7 +222,7 @@ static void pruss_intc_unmap(struct pruss_intc *intc,=
 unsigned long hwirq)
> =C2=A0	u8 ch, host, reg_idx;
> =C2=A0	u32 val;
> =C2=A0
> -	mutex_lock(&intc->lock);
> +	guard(mutex)(&intc->lock);
> =C2=A0
> =C2=A0	ch =3D intc->event_channel[hwirq].value;
> =C2=A0	host =3D intc->channel_host[ch].value;
> @@ -251,8 +249,6 @@ static void pruss_intc_unmap(struct pruss_intc *intc,=
 unsigned long hwirq)
> =C2=A0
> =C2=A0	dev_dbg(intc->dev, "unmapped system_event =3D %lu channel =3D %d h=
ost =3D %d\n",
> =C2=A0		hwirq, ch, host);
> -
> -	mutex_unlock(&intc->lock);
> =C2=A0}
> =C2=A0
> =C2=A0static void pruss_intc_init(struct pruss_intc *intc)
> @@ -376,17 +372,15 @@ static int pruss_intc_validate_mapping(struct pruss=
_intc *intc, int event,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int channel, int host)
> =C2=A0{
> =C2=A0	struct device *dev =3D intc->dev;
> -	int ret =3D 0;
> =C2=A0
> -	mutex_lock(&intc->lock);
> +	guard(mutex)(&intc->lock);
> =C2=A0
> =C2=A0	/* check if sysevent already assigned */
> =C2=A0	if (intc->event_channel[event].ref_count > 0 &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 intc->event_channel[event].value !=3D channel) =
{
> =C2=A0		dev_err(dev, "event %d (req. ch %d) already assigned to channel %=
d\n",
> =C2=A0			event, channel, intc->event_channel[event].value);
> -		ret =3D -EBUSY;
> -		goto unlock;
> +		return -EBUSY;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* check if channel already assigned */
> @@ -394,16 +388,13 @@ static int pruss_intc_validate_mapping(struct pruss=
_intc *intc, int event,
> =C2=A0	=C2=A0=C2=A0=C2=A0 intc->channel_host[channel].value !=3D host) {
> =C2=A0		dev_err(dev, "channel %d (req. host %d) already assigned to host =
%d\n",
> =C2=A0			channel, host, intc->channel_host[channel].value);
> -		ret =3D -EBUSY;
> -		goto unlock;
> +		return -EBUSY;
> =C2=A0	}
> =C2=A0
> =C2=A0	intc->event_channel[event].value =3D channel;
> =C2=A0	intc->channel_host[channel].value =3D host;
> =C2=A0
> -unlock:
> -	mutex_unlock(&intc->lock);
> -	return ret;
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int
> @@ -550,7 +541,9 @@ static int pruss_intc_probe(struct platform_device *p=
dev)
> =C2=A0
> =C2=A0	pruss_intc_init(intc);
> =C2=A0
> -	mutex_init(&intc->lock);
> +	ret =3D devm_mutex_init(dev, &intc->lock);
> +	if (ret)
> +		return ret;
> =C2=A0
> =C2=A0	intc->domain =3D irq_domain_create_linear(dev_fwnode(dev), max_sys=
tem_events,
> =C2=A0						&pruss_intc_irq_domain_ops, intc);

Reviewed-by: Radu Rendec <radu@rendec.net>
