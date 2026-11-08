Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169497;
	b=hNVxCzYbWi2KaiBIRDC3I9enwvOzfLeMHlkQ03MH0OHB5fQk6J6pVi4Fmgpax/i7j6nb
	 iAL/YoLgIZpzIN6aggP/iUEV/AAxaeWmtkuYnnmUQ2+IqJJoYPbsMFVezln4vGxBBPRxE
	 8D12WgL9Dvg67QAnNoh1vSUhb55S53D5BxJqlCROzS+E07y9mHINXQe034sHonbo/V1Df
	 LucsAGLqn4sC0z1/Rk0MzSpgCoRShyliZjnLCZj+nNdibMEwPTbxTrn66bnwJJHopuU1e
	 4GQBQewK36EihzmUGanAjikNiASZZaMGYhffoaurrwM3HnHm5SJai0q2XceEiKQvNPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169497;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=R3v5E6SNCq7UvDHGsaVgQX7pHBfqmsknhHYIo4WDvV0=;
	b=ciKcCusMeXM4xg6PuLgSzq/6wBxArccf+tYnH/1FdAmykFEhITixhSA5EcTk4AZ/Oad1
	 QXLqGN2eY9AwgHYuVrQRCs9VbR1lp0IP0LpQr3TJWpUFCe30rot+Spj6UpCnseP2sdNKe
	 gDgG78V2EovRDIakO03Lz96bfANCCZpV1jAc9DMHZNrduoiFh+NLefOQ90wjFr2eu0R6G
	 g/dmfernDXBOhlvvkOLUZGPgM/qK8cVsBUBMVB8wTOiaSSRoC7ACfgaqYPEqApwQEVuM/
	 UD2uwYbZwLWroRAlFaSieNHkwGmoXZa6XqQNAWWbFVrAfv+71R1CdNjxDofEljo0kPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=aHzLZn9t;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFC06080C4D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFC06080C4D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=aHzLZn9t
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 45131D4223;
	Sun,  8 Nov 2026 22:24:45 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 45131D4223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1794169487;
	bh=R3v5E6SNCq7UvDHGsaVgQX7pHBfqmsknhHYIo4WDvV0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aHzLZn9tkRvOVkfpnsUMQMHZiAQWh3Gzqp4ZTW8AszPuqSZvBpI0Wt/XRSEP6uq9l
	 rehiNqgcnUGn6vf7uYXo70S+xjC+Kg3v42oYibC+BxZYcuJ8kJyVe0qXewWwRvbo6B
	 g+uFZ5xMFpGDnuEF3aSewpeiRs5hsMHqS3fYLYCK7OalyRJcendJtETrh8nMznB+JF
	 EntSpYa1g6snYfARIJYyWr3DdjcW9KaKMNDgG/eN79QbO1u1Jj3hzcRhMwdDxZlLKz
	 zHoSOLZlxPgKQq39eBkpMq4AYkmL1b0NQkNJ0TO8iWcv0JmZUdrAd4BhWsAmWCQnIr
	 9DVViC10ITaCA==
Message-ID: <0df179e374de91aa3e671f0fe66b45bca716e095.camel@rendec.net>
Subject: Re: [PATCH v7 08/10] irqchip/imx-irqsteer: Dispose of child IRQ
 mappings in remove()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Fabio Estevam	
 <festevam@nabladev.com>, Jindong Yue <jindong.yue@nxp.com>,
 xuegang.liu@nxp.com, 	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Sun, 08 Nov 2026 15:24:43 -0500
In-Reply-To: <20261104073759.386777-9-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261104073759.386777-9-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 16:37 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>=20
> Once the driver can be unloaded, the IRQ domain mappings handed out to
> downstream consumers must be released on remove(), otherwise:
>=20
> =C2=A0- a parent interrupt racing with the teardown can run the chained
> =C2=A0=C2=A0 handler while irqsteer_data is freed (no synchronize_irq());
> =C2=A0- downstream irq_descs keep dangling chip pointers into the unloade=
d
> =C2=A0=C2=A0 module.
>=20
> Dispose of every child hwirq mapping in remove(). irq_dispose_mapping()
> calls irq_domain_disassociate(), which runs synchronize_irq() and frees
> the descriptor, closing both races.
>=20
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index a14a8b80d60e..d15b806b278c 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -272,6 +272,7 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
> =C2=A0static void imx_irqsteer_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev)=
;
> +	unsigned int hwirq;
> =C2=A0	int i, ret;
> =C2=A0
> =C2=A0	/*
> @@ -294,6 +295,9 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =C2=A0		irq_dispose_mapping(irqsteer_data->irq[i]);
> =C2=A0	}
> =C2=A0
> +	for (hwirq =3D 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
> +		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq));
> +
> =C2=A0	irq_domain_remove(irqsteer_data->domain);
> =C2=A0
> =C2=A0	if (ret >=3D 0)

Reviewed-by: Radu Rendec <radu@rendec.net>
