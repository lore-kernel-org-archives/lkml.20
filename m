Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497667;
	b=anoJTbPEpxI6yvbcuqIC0FaBV+QOGTzJyoQ+9nngbdV67j05nnPQ+XZZByKkVsDwAc8J
	 GUdGcya9Eo7FadWCdvgVFXnRT7VDH8sTbAF0rfhtcImb42N5eEmSSAkVSv2cywlFaSlfV
	 HmL6XuMKlfItnlXa0nz5xC/a3sG0ITuJCQUWPVqFJYURL60YpRiJycI+FdQVdJiGS622n
	 jbjcxgyilTOyEEwgNWpjPMIFYgZn2LeLkGg0OYqDNOjvOjbPQ4IFwJBEszm9ulAWbOF1e
	 t3XlrFTMMRQJeZ9Zd3qpKtwwXrY6X4tuSkuYlaoCOO0sqK96BUzIK9Co1XgzCznckRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497667;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=TalOl96alln21uvpuXQrkyMghf/Vuyhv5RoGgLmGEUY=;
	b=pVFmLknmVSchoUaNRTaFRcWku2CfZU4nOvVaLIZYBBhOCj1O8SzvxtniqXCyNtXdGlLY
	 itb4rrC4954jsqXfJ7maHomRAHVXt4iOVR2PHKzu4N71dNeF4MgVgtVyQvsp748ko8Xdy
	 cCZXtrK7ZAt7y+b2Y78hVPd67Sn19/jKs0UbFohNI6fzBxP9OBs1CzfF/SGkbQRLXUdar
	 pfCbo+odKbvTqx1RANh7D/c0vjNLDpxKN5Vv/6arX/3nWfC58rKhfiYTdpP/oR318iM0V
	 EYiiiwFw5ynJcn5g3OVib7vBMOb5yzfqvflhku1B1GWnbpLZ0wOZJwQPYYCVvMQAinw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=IoA9DM3u;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA58606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA58606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=IoA9DM3u
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 1A7F3D1E92;
	Tue, 20 Oct 2026 15:01:00 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 1A7F3D1E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792497662;
	bh=TalOl96alln21uvpuXQrkyMghf/Vuyhv5RoGgLmGEUY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IoA9DM3uQ4UY3J4z1Rpp24cbuQNN2UnOqLaUqj0hwLdCujZ1j2I3dvMfXrymdnV5J
	 dqo20YP+goVaiJIn3CCmsa/WzeVP/XFr9Q1ol5djxpIvuU13oMXXsOhyPehxgR8e6G
	 r2vuPCLgR7SAcDypK1g2agVgoIRzqdDr2avJqXdVhHHkBMUOVWebPI8XqAX5uxraEU
	 7gg4UX6chUbvk2yibIb2R5DXaEzWYUK+pwpwewdTTgjZpWN8u9nSSTCANy+KBHiG7v
	 Oo6eCJUOGOW8QqfS//trrd9vjdmAHV0/Pw+yeH72nmy4yeJhj3fsNcwn7KGL7KIEdr
	 1U3bawos4Pwbg==
Message-ID: <f642a27d36844b8cc4d164f518f7177252624975.camel@rendec.net>
Subject: Re: [PATCH v6 7/9] irqchip/imx-irqsteer: Allow building as module
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Tue, 20 Oct 2026 08:00:59 -0400
In-Reply-To: <20261008090231.796511-8-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261008090231.796511-8-Zhipeng.wang_1@oss.nxp.com>
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

On Thu, 2026-10-08 at 18:02 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Jindong Yue <jindong.yue@nxp.com>
>=20
> Make the driver buildable as a module by turning the Kconfig symbol into
> a tristate and using module_platform_driver() instead of
> builtin_platform_driver(), and add the MODULE_DEVICE_TABLE() and module
> metadata needed for autoloading.

I believe both high-severity issues flagged by sashiko [1] are valid.
Looking at what other drivers do (e.g. drivers/irqchip/irq-ts4800.c,
drivers/irqchip/irq-pruss-intc.c), you should do something similar:
iterate over the hwirqs and call irq_dispose_mapping(). That would
solve both problems because synchronize_irq() gets called indirectly
via irq_domain_disassociate().

There is nothing wrong with the patch itself (the conversion to
loadable module), so my r-b tag can stay as long as the above issue is
addressed in a separate patch. Thanks!

[1] https://lore.kernel.org/all/sashiko-outbox-163920@kernel.org/

> The clock, runtime PM and IRQ domain are already owned by devres, so no
> further teardown is needed to support unbind and reload.
>=20
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Reviewed-by: Radu Rendec <radu@rendec.net>
> ---
> =C2=A0drivers/irqchip/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 7 ++++++-
> =C2=A02 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 20b77fbc51ee..105108d2e6ff 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -555,7 +555,7 @@ config CSKY_APB_INTC
> =C2=A0	=C2=A0 the controller's register.
> =C2=A0
> =C2=A0config IMX_IRQSTEER
> -	bool "i.MX IRQSTEER support"
> +	tristate "i.MX IRQSTEER support"
> =C2=A0	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
> =C2=A0	default y if ARCH_MXC || ARCH_S32
> =C2=A0	select IRQ_DOMAIN
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 15ee50f65d54..85edd5e33ca9 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/irqchip/chained_irq.h>
> =C2=A0#include <linux/irqdomain.h>
> =C2=A0#include <linux/kernel.h>
> +#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/of_irq.h>
> =C2=A0#include <linux/platform_device.h>
> @@ -359,6 +360,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[=
] =3D {
> =C2=A0	{ .compatible =3D "nxp,s32n79-irqsteer",	.data =3D &s32n79_data },
> =C2=A0	{},
> =C2=A0};
> +MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
> =C2=A0
> =C2=A0static struct platform_driver imx_irqsteer_driver =3D {
> =C2=A0	.driver =3D {
> @@ -369,4 +371,7 @@ static struct platform_driver imx_irqsteer_driver =3D=
 {
> =C2=A0	.probe		=3D imx_irqsteer_probe,
> =C2=A0	.remove		=3D imx_irqsteer_remove,
> =C2=A0};
> -builtin_platform_driver(imx_irqsteer_driver);
> +module_platform_driver(imx_irqsteer_driver);
> +
> +MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver"=
);
> +MODULE_LICENSE("GPL");
