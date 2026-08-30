Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C27470808
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788115886; cv=none; b=t/x7WQid5E/7BKJ2t2g/0DvPgl6V1t1ySYU3BGsdrSbddOv87hqRhGcG0jo0nMPXykRyZFkpRY0cCssE8Ixb25NevBVhHaCRGYSFj4Tk0u+BbgH5F3AAu03H0IutXc3Mz5aOl6BnPKQkNw/6BPwWCAcE7T6TB0jufXkEJrK9Zdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788115886; c=relaxed/simple;
	bh=QQMmIiFqSRMKZClJTqnIdDtWU0W6cN2bBzswCbMBY+M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IPhJTdqB0+kEPjHUWP6oEWbsihD3Z/zJ9SD2zqMSs+5U6ytY/Fn0Md74MgkNCdmEFrL7kMK4l+VC3C/0mqxbz+aZW2Y4loM9VRjs4WdwMBwARRHXjo3RuF0QwRYtgGOIPp8KoRbRd4/SBx/cmeg0PVT2L/15rw7a06qNbqiIaQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=uK9SMcwr; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="uK9SMcwr"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 937DBCC95B;
	Sun, 30 Aug 2026 21:51:19 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 937DBCC95B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788115881;
	bh=wK6xzN+3Plvn93axdH7vBx6308v5Zc20K2PTI8OU66Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=uK9SMcwrGDUkhJUD/TPj5nJ/VK8tvOknO5yJVGOIM/4K0bB+mAi1UXUfLmjSlvOPH
	 k/LSbojHp3fxUrWjQ3e3okwfk1W3Q0xb520jf/YKhHDeX6Md3wtMNqxJfU+sRuRLSk
	 h4y/IRogxYms1ufelPBVxo34FOznKGEi121Q+sPiOBM/OezNpJKHIHnWN+8OxvEMal
	 xICMJ4xg7zkC9xkyRnUqR5H/6MxNYNcrvML5ao6BoHgVOXfvMUrUrxybGhSNRN9LdC
	 GX6ubkWy6q4lHpgsEwClU9eUNQ4jvilfAwl3HOwWouLvIwIXWQU8gD1xNesRZY4NYq
	 fn+HayBHsMJhQ==
Message-ID: <1079e16a322e9801d44712700ea7bf622af634c8.camel@rendec.net>
Subject: Re: [PATCH v5 5/9] irqchip/imx-irqsteer: Mask all interrupts in
 probe()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Sun, 30 Aug 2026 14:51:18 -0400
In-Reply-To: <20260821101039.4037925-6-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
	 <20260821101039.4037925-6-Zhipeng.wang_1@oss.nxp.com>
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
> probe() sets up the chained handlers without first masking the input
> interrupts. For a built-in driver this happened to be harmless because
> CHANMASK resets to all-masked, but once the driver can be unloaded and
> reloaded a child interrupt left unmasked at unload time survives in
> hardware. On the next probe() the parent interrupts are re-mapped and
> unmasked before the new domain is ready, so a still-asserted line
> immediately storms the parent with no handler to service it.
>=20
> Mask all interrupts in probe() before wiring up the chained handlers.
> CHANMASK uses inverted polarity (a set bit enables the interrupt), so
> masking means writing zero. This mirrors the sibling NXP chained mux
> irq-imx-intmux.c, which masks all sources at probe() time.
>=20
> Masking is only done in probe(), not in remove(): the next probe()
> quiesces the hardware before it re-maps and unmasks the parent
> interrupts, which is the only window in which a stale line could storm.
> Masking in remove() would also mean touching CHANMASK while the device
> may already be runtime-suspended with the clock gated.
>=20
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 071ab1ac1fe9..b63bf957ab88 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -239,6 +239,14 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
> =C2=A0	if (irqsteer_has_chanctrl(data->devtype_data))
> =C2=A0		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> =C2=A0
> +	/*
> +	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
> +	 * has inverted polarity (a set bit enables the interrupt), so writing
> +	 * zero masks the source.
> +	 */
> +	for (i =3D 0; i < data->reg_num; i++)
> +		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
> +
> =C2=A0	struct irq_domain_info info =3D {
> =C2=A0		.fwnode		=3D dev_fwnode(&pdev->dev),
> =C2=A0		.size		=3D data->reg_num * 32,

Reviewed-by: Radu Rendec <radu@rendec.net>
