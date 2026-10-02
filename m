Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E34DA553
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790962111; cv=pass; b=iATBY/9puUKcIWknM2lzx8fv3lPAw5lhuJlgx7yUWK951b33XAfpYT5q9Cge56fxWwZMkFZRjXhRgRNTJ646YfLotgmIApo441sW5KLUyvFVxVFDGB/dHFH7Yz46C1L46+Qx4oDAlTMU+3De4+/VO1viH2KxtIxV1hQofXjjIYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790962111; c=relaxed/simple;
	bh=RaLAehqtthYGfFxr1fNAI6j/LB07e/Xp2k/TOc8H0sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJ9jSr5TOdPkUjIQCLwEKAuREI3dK+/LV378UMVDjHGKaL9tIgy81bSugfW6RwDpVD77+fZFjMA8XNb0h4eEP7JKaFGCHa7YcnbviTn9cAM3WJbnsx2m0xK+uhT+2Dg9GSMr+P9HLRC2OAa/mZzQTBGAnQU9sp4hEAt3xnmNVsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpBhbUF1; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpBhbUF1"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8ac8eb87a11so32600227b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790962109; cv=none;
        d=google.com; s=arc-20260327;
        b=E70J/RS4a2cF3KTcOis08aCzMO+Cxwx3L288DKPcMUhrkG4SjTQbYcuCaIeKqx1kvm
         VuNE2HEelANhrs2PB5ZaW+iTDAgd9iaeDc1RZBmitxu/RpsfciqkUhCKM8DiJ8Famgvp
         5T5Ygr1B7xWt5H6GmY4vLZgWhOKrrB35BeMpXJPh7CCGgTkyBOEj8uCU6MH1NSLxJPlb
         j0STbxfn+f2iXDTIazahrzK8ZcbSyxAlJltNivPRfLBA/XrlE0qBy/+T9uzm0frMSzzB
         fyPFPZu2fxuHRabBSpK6oEEjIqNHfBUOOdf+qp1/jsNrykYHMdIHZjNpt0sumj3jH66c
         BPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=;
        fh=Db//qXcYAPQMn/MdPLC0D6oM+KB6d0J4G99Vw/oGduM=;
        b=C4fxfK9aB3JbA+PGoa6WFm1Y4cWuSKuzGTEnoLeKnAPxOmPieu1GSiMBVZB0aHaNGi
         9psbITb7T40IcBBD3GmLJmpF2A1t9FW6m2G9h+VPS2guj3fP9U+IlEDUJag2EMqsftKl
         oJ69K4ld0ao8J9OonZ/ecScO/XXggj27vLuvc6Sb2HNDpor5eGyUdkCPNYF35HQdj/DO
         LwRNnw3JiS+BKcGjbIHJeBpAxyGr5MDpolqRLOsuzQSRT9y9tLxNRaXQ2NuCC2pWePRl
         lY1T5RdN92a8bMxp5aJtoM79OX5CkPwJveuBEL5w2qtDX4+hDFi1JKZWAxLgepRXotHh
         rYEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790962109; x=1791566909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=;
        b=VpBhbUF128kN3aRo97onoOMYBmOl0gOBvPXorzxk6ZkGuDvfwAd4aetnvdeGIyDPRQ
         O59PkcIfIuHcgPXVGclVw6cTs7B3RSc2Rl/FX7BZlH8sYZrbocim7Y9p1cYgH8TM4YHL
         S0ras1e3brzApTZJhOEX/jyRj7s8wEvZv8ukO15Xd5WI1GDB5yQfysu90SN5IH8UnZh2
         Faw6MDwgj2YldngV0OSXv7Bu+58JaXkk4eL4O/Ofn9/eDNMIieq23SvUogPKrRLt0RnP
         kNGmVHjtYbay6+kpQL7YuNvAagKAn1/qJrxwGyqGRsXxbarxoRBWl3b1GTHaugWZ6aFO
         Aopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790962109; x=1791566909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=;
        b=1s4IyuS99RQ/8+XLabIbzCK5wvq1R7lXApcPYJ0ZLvplKgCxZui9zLb5H4W/MzBSIP
         70dv9A7mbvlYtG8qxTB6rOc3Q5UG/Fir2azgJvqwXIeY9yjWQRRUWK4ufdaX5AmfDxcL
         fE+H4Ddu43Hn57y1dp3hj57/lkEOLmfhPPr6+1c3aV+fSpSz7bzEvDuzHJ3bKMf8O6CY
         qEbtDEye4nWyLcGupomTUSVyCdkGiiNmL+vGMBt8ELgdsudHWlK+KbI616OfU37SkRpk
         goduFnZ6AcQ2VD9bW76SPujDQnepvjT+Cb6iytdhKKC807lDRvftCCjSSel0tv3rtzbG
         CyNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ+vtuwHv8PC+grCwd/Bdns1ntvUN4e4GYQgWNIfJsQACEnw3WS4+gFliJE0YbW+C+6kYArhiske+V/pw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwJ//d0oUHC3iJPdMGxXgdqrkaD61db+fS3N0C/1oUHAnVAsSo
	Om3GheguRpkiNJOKYOPSpl7RRxNqqdCCKvEDOlekHMVwOdb6SZQyCnxLHxQsTz6bJZnc0xuIdlh
	hiLlq2fUBAozOHRdcBaXmslfnm6H+bbWyeO7G
X-Gm-Gg: AYBFou3ydn84X5Ggc8cnEQ2jvkSCKNt3TpxDH04NVKopFgf9L1J/emrgUQpmsMAKcr1
	JpVzrvd6nuidSKgygmhsuz98S39gc/UiWU1UWY1hp7DLT+FywXOZTkx4eaOcf8Y+DN8nbxkEnS1
	ilDwCj5DUH3hwTPpcA+eB+k3u0eGSOFEZ8Hkpquvd8b/VNQyMI7etN0NMZMv/GaPX69yeJFrz4T
	+iiAS5gUwFp0dDxAijePWPmiFFU/UjxdfWp+VwvgF/+jEhSr+iyW8RXmyDSnF2myEFbuyqkYUA2
	mPhOYLfAn4mYg7Jel0yTxIHQ1PHpPJVymWy9wYufwuGOBzQ9MmplpVTd1Q==
X-Received: by 2002:a05:690c:4191:b0:89a:63da:cbde with SMTP id
 00721157ae682-8ae39c24e90mr13846367b3.36.1790962108737; Fri, 02 Oct 2026
 10:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002131634.113680-1-prasanth.padarthi10@gmail.com> <9cfcd3e7-bbc3-47c6-ad43-72b595a90110@9elements.com>
In-Reply-To: <9cfcd3e7-bbc3-47c6-ad43-72b595a90110@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Fri, 2 Oct 2026 22:58:16 +0530
X-Gm-Features: AclHuK_-cjgeNcqjWWE-fRWp3-4f5pXhe0bXkxn9mUfCwvl8hZuFbXmIKRHKAIY
Message-ID: <CAMFFDGhCMr+9OV4ceo+SG=xrsoASB2AiFSUZwMJpyQou+eR-fg@mail.gmail.com>
Subject: Re: [RFC PATCH] soc: aspeed: Add B650D4U power passthrough support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, 
	ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the clarification Tan.

For context, I sent this RFC to document the hardware-backed experiment and
request guidance on the correct kernel-facing implementation.

Using the current OpenBMC integration with the B650D4U hardware, the host
can be powered on through the standard D-Bus command, and the OpenBMC web
interface correctly reports the server power and host state. I validated th=
is
on the real board before sending the RFC.

The RFC was therefore intended to obtain feedback on whether this sequence
belongs in the kernel or should instead be expressed through the existing
GPIO and pinctrl configuration. I understand from your review that the
separate SCU passthrough driver is not appropriate, so I will investigate
the GPIO request and pinctrl configuration and withdraw this implementation=
.


On Fri, Oct 2, 2026 at 10:17=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> On 10/2/26 3:16 PM, Prasanth Kumar Padarthi wrote:
> > Add the AST2600 SCU passthrough selector support used by the
> > ASRock Rack B650D4U host power-control circuit. This RFC includes
> > the driver, Devicetree binding, and board node to discuss the final
> > kernel-facing interface.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> This is definitely not the way how to solve this. I've already said on
> linux-aspeed as well as off-the-list, requesting the GPIO lines is
> enough and enabling GPIOP passthrough here does not make any sense, as
> it would be disabled by pinctrl anyways.
> There's a whole implementation in userspace to solve this issue (at
> least if you use OpenBMC). The issue you're facing here is, from my
> point of view, a configuration error, and you'll not solve it with a
> kernel driver that literally just enables GPIOP passthrough...
>
> So my answer to this patch is:
> NACKed-by: Tan Siewert <tan.siewert@9elements.com>
>
> > ---
> >   .../asrock,b650d4u-power-passthrough.yaml     |  23 ++++
> >   .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  |   5 +
> >   drivers/soc/aspeed/Kconfig                    |   9 ++
> >   drivers/soc/aspeed/Makefile                   |   1 +
> >   drivers/soc/aspeed/aspeed-b650d4u-power.c     | 110 +++++++++++++++++=
+
> >   5 files changed, 148 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/asroc=
k,b650d4u-power-passthrough.yaml
> >   create mode 100644 drivers/soc/aspeed/aspeed-b650d4u-power.c
> >
> > diff --git a/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4=
u-power-passthrough.yaml b/Documentation/devicetree/bindings/soc/aspeed/asr=
ock,b650d4u-power-passthrough.yaml
> > new file mode 100644
> > index 000000000000..e6451d17955c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power=
-passthrough.yaml
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/aspeed/asrock,b650d4u-power-pas=
sthrough.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASRock Rack B650D4U power passthrough
> > +
> > +maintainers:
> > +  - Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: asrock,b650d4u-power-passthrough
> > +
> > +  aspeed,scu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +required:
> > +  - compatible
> > +  - aspeed,scu
> > +
> > +additionalProperties: false
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > index a4e384588a54..86291c250562 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -32,6 +32,11 @@ gfx_memory: framebuffer {
> >                       size =3D <0x01000000>;
> >               };
> >       };
> > +
> > +     host-power-passthrough {
> > +             compatible =3D "asrock,b650d4u-power-passthrough";
> > +             aspeed,scu =3D <&syscon>;
> > +     };
> >   };
> >
> >   &fmc {
> > diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> > index 11e4db998c06..1b0281e0bfb0 100644
> > --- a/drivers/soc/aspeed/Kconfig
> > +++ b/drivers/soc/aspeed/Kconfig
> > @@ -58,6 +58,15 @@ config ASPEED_SBC
> >         Say yes to provide information about the secure boot controller=
 in
> >         debugfs.
> >
> > +config ASPEED_B650D4U_POWER
> > +     tristate "ASRock B650D4U host power passthrough"
> > +     select REGMAP
> > +     select MFD_SYSCON
> > +     default ARCH_ASPEED
> > +     help
> > +       Enable the AST2600 GPIO passthrough selector used by the
> > +       ASRock Rack B650D4U host power-control circuit. This selector r=
outes the host power pulse through the board's passthrough logic during pow=
er sequencing.
> > +
> >   config ASPEED_XDMA
> >       tristate "ASPEED XDMA Engine Driver"
> >       select REGMAP
> > diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> > index 5f61bb4cc36c..3e9618d1eafc 100644
> > --- a/drivers/soc/aspeed/Makefile
> > +++ b/drivers/soc/aspeed/Makefile
> > @@ -5,4 +5,5 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)     +=3D aspeed-uart-=
routing.o
> >   obj-$(CONFIG_ASPEED_P2A_CTRL)               +=3D aspeed-p2a-ctrl.o
> >   obj-$(CONFIG_ASPEED_SOCINFO)                +=3D aspeed-socinfo.o
> >   obj-$(CONFIG_ASPEED_SBC)            +=3D aspeed-sbc.o
> > +obj-$(CONFIG_ASPEED_B650D4U_POWER)   +=3D aspeed-b650d4u-power.o
> >   obj-$(CONFIG_ASPEED_XDMA)           +=3D aspeed-xdma.o
> > diff --git a/drivers/soc/aspeed/aspeed-b650d4u-power.c b/drivers/soc/as=
peed/aspeed-b650d4u-power.c
> > new file mode 100644
> > index 000000000000..22a6925539dc
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/aspeed-b650d4u-power.c
> > @@ -0,0 +1,110 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/device.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/mutex.h>
> > +#include <linux/kstrtox.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/bits.h>
> > +
> > +#define ASPEED_SCU_PROTECTION        0x000
> > +#define ASPEED_SCU_GPIO_PASSTHROUGH  0x4bc
> > +#define ASPEED_SCU_GPIO_ACTION       0x51c
> > +#define ASPEED_SCU_UNLOCK_KEY        0x1688a8a8
> > +#define ASPEED_B650D4U_POWER_MASK    GENMASK(27, 26)
> > +
> > +static struct regmap *b650d4u_scu;
> > +static DEFINE_MUTEX(b650d4u_lock);
> > +
> > +static int b650d4u_set_passthrough(bool enable)
> > +{
> > +     int ret;
> > +
> > +     mutex_lock(&b650d4u_lock);
> > +
> > +     ret =3D regmap_write(b650d4u_scu, ASPEED_SCU_PROTECTION,
> > +                        ASPEED_SCU_UNLOCK_KEY);
> > +     if (ret) {
> > +             pr_err("B650D4U: SCU unlock failed: %d\n", ret);
> > +             goto out;
> > +     }
> > +
> > +     ret =3D regmap_update_bits(b650d4u_scu,
> > +                              ASPEED_SCU_GPIO_PASSTHROUGH,
> > +                              ASPEED_B650D4U_POWER_MASK,
> > +                              enable ? ASPEED_B650D4U_POWER_MASK : 0);
> > +     if (ret) {
> > +             pr_err("B650D4U: passthrough update failed: %d\n", ret);
> > +             goto out;
> > +     }
> > +
> > +     if (!enable)
> > +             ret =3D regmap_write(b650d4u_scu,
> > +                                ASPEED_SCU_GPIO_ACTION, 0);
> > +
> > +out:
> > +     mutex_unlock(&b650d4u_lock);
> > +     return ret;
> > +}
> > +
> > +static ssize_t passthrough_store(struct device *dev,
> > +                              struct device_attribute *attr,
> > +                              const char *buf, size_t count)
> > +{
> > +     bool enable;
> > +     int ret;
> > +
> > +     ret =3D kstrtobool(buf, &enable);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D b650d4u_set_passthrough(enable);
> > +     return ret ? ret : count;
> > +}
> > +static DEVICE_ATTR_WO(passthrough);
> > +
> > +static int aspeed_b650d4u_power_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +
> > +     b650d4u_scu =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node=
,
> > +                                                   "aspeed,scu");
> > +     if (IS_ERR(b650d4u_scu))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(b650d4u_scu),
> > +                                  "failed to get AST2600 SCU regmap\n"=
);
> > +
> > +     ret =3D b650d4u_set_passthrough(true);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "failed to enable power GPIO passthr=
ough\n");
> > +
> > +     ret =3D device_create_file(&pdev->dev, &dev_attr_passthrough);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "failed to create passthrough contro=
l\n");
> > +
> > +     dev_info(&pdev->dev, "enabled GPIO passthrough selector 1\n");
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id aspeed_b650d4u_power_of_match[] =3D {
> > +     { .compatible =3D "asrock,b650d4u-power-passthrough" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, aspeed_b650d4u_power_of_match);
> > +
> > +static struct platform_driver aspeed_b650d4u_power_driver =3D {
> > +     .probe =3D aspeed_b650d4u_power_probe,
> > +     .driver =3D {
> > +             .name =3D "aspeed-b650d4u-power",
> > +             .of_match_table =3D aspeed_b650d4u_power_of_match,
> > +     },
> > +};
> > +module_platform_driver(aspeed_b650d4u_power_driver);
> > +
> > +MODULE_DESCRIPTION("ASRock Rack B650D4U host power GPIO passthrough");
> > +MODULE_LICENSE("GPL");
>
