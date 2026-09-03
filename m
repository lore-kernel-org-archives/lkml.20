Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870C1D63F3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398203; cv=none; b=nSnFJ5tkth/fk+ZOT804zCFhlny4hrno+XpYadVZ/dfUo1Qb4q7eg3+KVDzr+BhUmXULtcT6OeTFyELDK2GCG6nYCMfToVBNIbEKXdkzO8qtrik1xYJKC1lzR70LHoEM/FFIx73fTrICae22Nu0hv8sN7FOvmNyRgBs9q2AenAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398203; c=relaxed/simple;
	bh=6N/uGzfZ/z6s2knBb4sFIBYbeRmal3H64Kvddr6Mtjc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kvO2Hkxzn8v0p4g6xNwfPwANlep+6dn+acgXUzceumGUxNCNLecBc93yUSXrBKDjl8P8R0+ncz9QHG7VWMb3YNOcOZRo8VxDOa7yUh7uFGB/wJzT39UTNckmbEgspeQqhhQffbvgEiv3jk4lYpfKnpMnUQm38rMgvvHk1NLsWIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=YEOOrmM5; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="YEOOrmM5"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id B35CFCCE4D;
	Thu,  3 Sep 2026 04:16:36 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro B35CFCCE4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788398198;
	bh=K0e2bO9sZgwFiNy9Yf/ChdFp1jz620gjB++D5MNjCXE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YEOOrmM51NHwE9z1OyZ5tUl9Wg+KMhfeR3xhp21rd3UK7faHl/vTW2xUz9Hg3ne7A
	 KKKY/H7Df/rGVvFtex0Nb4GWwW1k1DF0YbYWkk7OkdubhnQlS09YlBQWG/sPQ4IiTs
	 9HGGJmapb/7iF+hlzUFMmpaCXLZiOcKWJurqENBaw/j3hoAKVrUWb7Egp6MaeUqzgR
	 jQKtXvRhY33DYPMveHSG1VfCenWFjjxEzDnqkC+mveuTjl/HT2N1C/V625BO6cSxEL
	 0l16w+5wqCL21ihAIxx/0jsqV49ikxN+KgeiRX6S71bUEolsexKV14wMtRH4c2vwCh
	 GStGKTrGxf/9g==
Message-ID: <860cba0d279223d6e5ac8cb86ba82fbe1f66b3d3.camel@rendec.net>
Subject: Re: [PATCH v5 7/9] irqchip/imx-irqsteer: Allow building as module
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Wed, 02 Sep 2026 21:16:34 -0400
In-Reply-To: <20260821101039.4037925-8-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
	 <20260821101039.4037925-8-Zhipeng.wang_1@oss.nxp.com>
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
> From: Jindong Yue <jindong.yue@nxp.com>
>=20
> Make the driver buildable as a module by turning the Kconfig symbol into
> a tristate and using module_platform_driver() instead of
> builtin_platform_driver(), and add the MODULE_DEVICE_TABLE() and module
> metadata needed for autoloading.
>=20
> The clock, runtime PM and IRQ domain are already owned by devres, so no
> further teardown is needed to support unbind and reload.
>=20
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
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
> index c2f58787f9a8..dad09e095ed1 100644
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
> @@ -370,6 +371,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[=
] =3D {
> =C2=A0	{ .compatible =3D "nxp,s32n79-irqsteer",	.data =3D &s32n79_data },
> =C2=A0	{},
> =C2=A0};
> +MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
> =C2=A0
> =C2=A0static struct platform_driver imx_irqsteer_driver =3D {
> =C2=A0	.driver =3D {
> @@ -380,4 +382,7 @@ static struct platform_driver imx_irqsteer_driver =3D=
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

Reviewed-by: Radu Rendec <radu@rendec.net>
