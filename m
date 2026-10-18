Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108D23B638
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792285432; cv=none; b=fFJ+J51E7mj9wGXAcL7t7O65uHs1U99j9NO+bl82JIgIG+eJZSJK6n2Mbd3QaSA7vkMd4GioR0qKbJcRkxfozr1ini4d58m7MMcjpEbBk5ocusImnLqRXHqJGC7KxTszTTqjzHQ6EVoYmFLKbqPqz+UkY1wm/cloPRIWRb7npMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792285432; c=relaxed/simple;
	bh=59FIW6AoxPUKehPGzIxOMuGmAzYpk8/yXkoWF3/rClo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r0ECgj8Zap478BqlBSousNxA2SAiMjmPD+LKtiFlTABydfU+qypyGGPtTS/rICngk2Txk6SpLQXWtJIgXX4nb7Md6vd1eMuKhhu9sTAxd/bdvbSc/3kLn0U1MsqJopwMwdl6V++vsFBRGKTehnpjQDhbV+2skqya2jeiUBaTX6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=WoVdI/9x; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="WoVdI/9x"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id B54A1D1DAD;
	Sun, 18 Oct 2026 04:03:39 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro B54A1D1DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792285421;
	bh=kb0DgD9gEHv7zY1qNXYNJPY5G2hG6MA/GER2shJe9w8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WoVdI/9xI465FPzgCVPPyc49W+BHYm8znGl7tAZN/9X0uStHxlJdOkcl+TJWp8W5r
	 IFNrosVrID2R9J/TQm85e6ESrxCYps0Y/vimfZCymLiBlaEBYgUcfe1ImhBLMTnFRa
	 K7Kz6cd63ckoRm9DsKNGl76t8084Di3ZLtoTTz/DIo0r3xwEGxn7TULVSgo9F2WT//
	 XwuPASosLUpHQNyXLCloJj7R2xC6zZAAxL4upQRMBGFlKSsbMr/lXXHCOJalbPWy/S
	 odJnf1ImRcW4cWsN7opkq3VGo3bij64EwaBAdzFdUlgFCfi09MySCcrjJq/+/ZdJh0
	 bQwDPXEtzY2bQ==
Message-ID: <85c78f925ecac67f82e98675f80520bc6f71ab16.camel@rendec.net>
Subject: Re: [PATCH v6 2/9] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Sat, 17 Oct 2026 21:03:37 -0400
In-Reply-To: <20261008090231.796511-3-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261008090231.796511-3-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-10-08 at 18:02 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Fabio Estevam <festevam@nabladev.com>
>=20
> The IRQ count is validated after creating the IRQ domain. If it is
> invalid, probe returns without removing the domain, leaving its host
> data pointing at devm-managed memory that is freed on probe failure.
>=20
> Validate the count before allocating resources to avoid the leak and
> dangling pointer.
>=20
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts s=
upport")
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
> =C2=A01 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 1b8d0c8eedb9..766756e76c47 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -218,6 +218,8 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
> =C2=A0	 */
> =C2=A0	data->irq_count =3D DIV_ROUND_UP(irqs_num, 64);
> =C2=A0	data->reg_num =3D irqs_num / 32;
> +	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
> +		return -EINVAL;
> =C2=A0
> =C2=A0	if (IS_ENABLED(CONFIG_PM)) {
> =C2=A0		data->saved_reg =3D devm_kzalloc(&pdev->dev,
> @@ -246,11 +248,6 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
> =C2=A0	}
> =C2=A0	irq_domain_set_pm_device(data->domain, &pdev->dev);
> =C2=A0
> -	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> -		ret =3D -EINVAL;
> -		goto out;
> -	}
> -
> =C2=A0	for (i =3D 0; i < data->irq_count; i++) {
> =C2=A0		data->irq[i] =3D irq_of_parse_and_map(np, i);
> =C2=A0		if (!data->irq[i])

Reviewed-by: Radu Rendec <radu@rendec.net>
