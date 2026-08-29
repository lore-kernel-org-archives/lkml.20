Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C41434D385
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788036886; cv=none; b=f+j/kdPZHpingUFHpk7M0LmPXBJDUs+iOQrUPPXB9+e6gP+iBWdFfkzb2h5UZUKrxQRRjWTz/1S8LYuO963k3f7tyjXS7G9tQZaSKbqliOfHk/NU+rZ00wbfLBKOH7Fklqs5xpkgQTiJ/G5Kg6DeY0BJZlX6NaiSFBqct8rFilE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788036886; c=relaxed/simple;
	bh=LVyC0XPmnX2zreJq78wI/sZdDJWzYKMX7Lhr3nt6LxM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EMCj2CyDgb+KSHkjA9d3ygbX4UekF1R0let8vns9PDOeTTcqsVZHVfkr0Ib+A5TdpjRG/VTeXQqKnqrBV6k3Z+K4c7OT4sMK8x/RB3dHenL8CTLvwZhOj/5oK5OWk4nWOZNXZQUn8C7Lu6YCsWDhK65gjiclYXnpYg3H7qqTWTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=kdldWcE8; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="kdldWcE8"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id DBC7DC33D3;
	Sat, 29 Aug 2026 23:54:40 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro DBC7DC33D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788036882;
	bh=TxrhR97T7Qu7CxRJdAD0MZKCPUClAmAqj06Q+J5Xu1Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kdldWcE8dlEfgLe/HjoUUtiCY30jL3gdhWlgdtcaDJKCjr9EP6UiQxJleWQZA/5hI
	 SCt3UmCYCrs79bvnXq4KRW69LXvlK16vaFVn1i09B0t20+fBRK07T8gnDRM+KeGxKA
	 DzFLm2NghgwQwz0PIdGTzwhBmulurcKCX2FjhBCY2GMO4x2S7HtOUBhvCrNcpnkcCz
	 Y5kDYKmBa8S/DGonlf9wCKyvG4Zi6KV26UAUtpDPYLWRtxkZoil64k5BbfAnV97GBg
	 pZTSyQAaJ2Kcf+fBp2baPEzPyzOxgkKL6kcMpjdyOdQwhdjD+xHCKq4nSDJtmZ5WCw
	 ngpxwirHS8wyg==
Message-ID: <b62d3077f3a3c8a12ac47b8a1e163499e2333b5b.camel@rendec.net>
Subject: Re: [PATCH v5 1/9] irqchip/imx-irqsteer: Call chained_irq_exit() on
 the handler error path
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Sat, 29 Aug 2026 16:54:39 -0400
In-Reply-To: <20260821101039.4037925-2-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
	 <20260821101039.4037925-2-Zhipeng.wang_1@oss.nxp.com>
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
> A chained handler must pair every chained_irq_enter() with a
> chained_irq_exit() before returning, so that the parent interrupt's flow
> control is completed (EOI for fasteoi parents, unmask for level-triggered
> parents). Skipping it leaves the parent interrupt unacknowledged, blockin=
g
> further interrupts multiplexed through that line.
>=20
> When imx_irqsteer_get_hwirq_base() fails, the handler returned early
> without calling chained_irq_exit(). Route the error path through the
> existing chained_irq_exit() so the parent interrupt is always completed
> before returning.
>=20
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts s=
upport")
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 87b07f517be3..1b8d0c8eedb9 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -154,7 +154,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc =
*desc)
> =C2=A0	if (hwirq < 0) {
> =C2=A0		pr_warn("%s: unable to get hwirq base for irq %d\n",
> =C2=A0			__func__, irq);
> -		return;
> +		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < 2; i++, hwirq +=3D 32) {
> @@ -172,6 +172,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc =
*desc)
> =C2=A0			generic_handle_domain_irq(data->domain, pos + hwirq);
> =C2=A0	}
> =C2=A0
> +out:
> =C2=A0	chained_irq_exit(irq_desc_get_chip(desc), desc);
> =C2=A0}
> =C2=A0
>=20
> base-commit: bd5f485f3f026225b86573e559af0b7254ef4184

Reviewed-by: Radu Rendec <radu@rendec.net>
