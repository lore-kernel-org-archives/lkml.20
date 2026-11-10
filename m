Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331102;
	b=Wj9n0D7bYMlDCa4/snATfLd1NKbcadCL1HjjSZEm838Zs1qoHv+e92seTE3iLfYlqy+I
	 qznJZjU51btIUD4ftWPS9FSZMdM4WpBslKoaXoAJcz+qBVi4hXXg7OMt+u0TPjtFJB5+K
	 c7F5t4/q2iNB8/MCrDALovnEF5pa1F5yIbO+9FzpuGS0uUVRbkzhNG5KNhXtYTNOFewM6
	 KUSc6gQT6KnwSH6poCzqoFdohI9fWOwo7RQrJMoYHiNmdxPD9BiUWgpiKdnSNoIwCPsKP
	 7/eHy4SmS/PIZnpvEKDDCcnmdGiSCS+aueQAGjE5j5IIfQ+U24PrSIjzJYDw9rmV05w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331102;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j8FQxXo6FZUSPml10ShMZBraDuh0DWA615xV0ciloLk=;
	b=GVFpKHdbN9qWZoE8byhIrRAqkhUj65AS+KpH987/M27f/ARBAey2eSAlTxotMpHdG99p
	 6oRs5CA7CoMI3X//AKejRHuq1gk6U0wOrZ6CP1YywxS5enw1Y20igeEkOJBtNzIz7mD8a
	 FnWU8aDknWm8U1ZXVgSYG9Yy88OH0juktGxrUBmHmgkMIMILxHZBiFlYv/0ma0JzOUR/8
	 eCdI+YsimkBGlihS3f2vnWoN5Rm823Rt+m8UqdLiJ6b0RDcGn6b1kgUCSZxBUdJbTQ3cB
	 UfQlwacJ722HcKqdzd7hLSL5byVTtoXd3ynG+rW3fZ/u9k5Q8S8EApvaUvhPByuXfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jG+BSeHj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BAE606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jG+BSeHj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96BC1F008A6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794331101;
	bh=j8FQxXo6FZUSPml10ShMZBraDuh0DWA615xV0ciloLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jG+BSeHjSHYbttSCCymAJ3DaRyR9zliWw87phwR6/zmYgWs76EuEntVdQod9FPCfB
	 0zyNmvS4m4o+263qcmt7ggEpQtR5g2oo0jiCXdZwYqHpmMqV3IMgvgaLdGREOIsYqK
	 LrLn5fsxHN5fkXqyty7hczX+2aDbeSDr6fv/1N6uw/7pZFMCqZGjnjb1NrZBdbhG4v
	 fJ1SUMZaAlbWc4BEe6m5xZGyuc6qGfOGDN80RG0OIDf8RS/463QBxHf368Ezki072k
	 5Y/sVhOuIHHkonK0aRdGxS08jTZzUI1xfUGayaStzNv/ikg7a485fFXmA83Tmw3oNA
	 h78lr397HabLA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so19362211fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:18:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEIxwqGJxMGSQfZ6wM6tdP73ixG//zDSToOeHkdfLTAg0yvqV5kHQBPI5R1t8pyK8Cfbn8Q6mc6p6pRgp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M8Aoa1TiK1JoTR2PLAGvk5j/OGQ8h17y57GC6LZH8T7spemII
	ueCo0rhYnixqtYfVPUiMGz6zjs9A5GvaEMmBJT/QuuULyP6BbWylEHUxVd19nWO+nBXw9OmGAQK
	HK7gzNZ1MPPTMB+Asu7S6teX7XR504q0=
X-Received: by 2002:ac2:4e11:0:b0:5bf:d26e:7992 with SMTP id
 2adb3069b0e04-5c156e98223mr999573e87.28.1794331100266; Tue, 10 Nov 2026
 09:18:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084718.8222-1-paul.cercueil@bootlin.com>
In-Reply-To: <20261103084718.8222-1-paul.cercueil@bootlin.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 18:18:08 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hi_+FCGCXqV71GwgPDpymNZsUv9jRwjLK2BFJV3sqmiA@mail.gmail.com>
X-Gm-Features: AclHuK-lgsf-2gKRSMJHDvvVaIgTtJKozCmDx_eo2YPCTpCkHxspQOm0_gh4sqM
Message-ID: <CAJZ5v0hi_+FCGCXqV71GwgPDpymNZsUv9jRwjLK2BFJV3sqmiA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: platform: Add basic support for ACPI 6.5 fixed
 clock resources
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:47=E2=80=AFAM Paul Cercueil <paul.cercueil@bootlin=
.com> wrote:
>
> ACPI 6.5 introduced a clock input resource descriptor, which allows to
> specify in the ACPI tables what clocks are connected to a given device.
>
> This patch adds support for the most basic clock resource, which is the
> one that represents a fixed clock. The new code will then create a
> clk_hw for each fixed clock resource, which is then made available to
> the device drivers, that can obtain it through a regular call to
> clk_get(NULL).
>
> Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

You need to look at Sashiko's feedback on this:

https://sashiko.dev/#/patchset/20261103084718.8222-1-paul.cercueil%40bootli=
n.com

> ---
>  drivers/acpi/acpi_platform.c | 64 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
> index 80ea7121744d..bae6a2eacd71 100644
> --- a/drivers/acpi/acpi_platform.c
> +++ b/drivers/acpi/acpi_platform.c
> @@ -10,17 +10,27 @@
>
>  #include <linux/acpi.h>
>  #include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/ioport.h>
> +#include <linux/kconfig.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/units.h>
>
>  #include "internal.h"
>
> +struct acpi_clk_data {
> +       struct device *dev;
> +       unsigned int idx;
> +};
> +
>  /* Exclude devices that have no _CRS resources provided */
>  #define ACPI_ALLOW_WO_RESOURCES                BIT(0)
>
> @@ -130,6 +140,57 @@ static unsigned int acpi_platform_resource_count(str=
uct acpi_resource *ares, voi
>         return AE_CTRL_TERMINATE;
>  }
>
> +static int acpi_add_fixed_clock(struct acpi_resource *res, void *d)
> +{
> +       static const unsigned long clk_scale[] =3D { 1, HZ_PER_KHZ, HZ_PE=
R_MHZ };
> +       struct acpi_resource_clock_input *clkres;
> +       struct acpi_clk_data *data =3D d;
> +       struct device *dev =3D data->dev;
> +       struct clk_hw *clk;
> +       unsigned long rate;
> +       char name[64];
> +       int err;
> +
> +       if (res->type =3D=3D ACPI_RESOURCE_TYPE_CLOCK_INPUT) {
> +               clkres =3D &res->data.clock_input;
> +
> +               if (clkres->mode) {
> +                       dev_warn(dev, "Only fixed rate clocks supported f=
or now.\n");
> +                       return 1; /* keep going */
> +               }
> +
> +               if (clkres->frequency_divisor =3D=3D 0)
> +                       return -EINVAL;
> +
> +               rate =3D DIV_ROUND_UP(clkres->frequency_numerator * clk_s=
cale[clkres->scale],
> +                                   clkres->frequency_divisor);
> +
> +               clk =3D devm_clk_hw_register_fixed_rate(dev, dev_name(dev=
), NULL, 0, rate);
> +               if (IS_ERR(clk))
> +                       return PTR_ERR(clk);
> +
> +               snprintf(name, sizeof(name), "%s-clk%u", dev_name(dev), d=
ata->idx++);
> +
> +               err =3D devm_clk_hw_register_clkdev(dev, clk, name, dev_n=
ame(dev));
> +               if (err)
> +                       return err;
> +       }
> +
> +       return 1;
> +}
> +
> +static void acpi_platform_init_clocks(struct acpi_device *adev)
> +{
> +       struct device *dev =3D &adev->dev;
> +       struct acpi_clk_data data =3D { .dev =3D dev };
> +       LIST_HEAD(list);
> +       int ret;
> +
> +       ret =3D acpi_dev_get_resources(adev, &list, acpi_add_fixed_clock,=
 &data);
> +       if (ret < 0)
> +               dev_err(dev, "Failed to add clock resources: %d\n", ret);
> +}
> +
>  /**
>   * acpi_create_platform_device - Create platform device for ACPI device =
node
>   * @adev: ACPI device node to create a platform device for.
> @@ -217,6 +278,9 @@ struct platform_device *acpi_create_platform_device(s=
truct acpi_device *adev,
>         else
>                 pdevinfo.dma_mask =3D 0;
>
> +       if (IS_ENABLED(CONFIG_COMMON_CLK))
> +               acpi_platform_init_clocks(adev);
> +
>         pdev =3D platform_device_register_full(&pdevinfo);
>         if (IS_ERR(pdev))
>                 dev_err(&adev->dev, "platform device creation failed: %ld=
\n",
> --
