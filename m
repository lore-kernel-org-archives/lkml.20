Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19075381EA2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789897860; cv=none; b=acUpaHqkhoFnWxh84GqF2vNNhZnUkFQMzReye40sbmVh7dI2Eb5aCKg73NU05f9nxx0RKE5AZzdmxNOuEuQYX6No1MWwdKPyyNyxS6yi0pvQDUaj8FfrHZq76k9afWHpvlmOFR81TUaGAiVonHPWrM1lItL5VbZxDLqtN6PGInA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789897860; c=relaxed/simple;
	bh=fSQDFoD2QDiHdD9sozjPUbTo2K0Q/Jp9hC3TXlCvVoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPciaNTp8dvLWY7gWelkgk/PF3v8LJIQT79E5Yq88NINWnwna2wSfqTCoC7Qvt7tyYUrJ0YrlTK1dtimsVY7rck/5AGjaiXTFOYTvnO4bJ2x/bgjA3b4OCL4FqqQgsrgUW9RJj82MGNqGRa1gDWG5uLTGeK61VxYoZ+6l3Z/yzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEQyehoN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEQyehoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D7E1F008A0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789897856;
	bh=SjYJbPqlOSw/5GKAWiHuamoPBcbEI2Y/L8HWn+XiZW0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=IEQyehoN8tnzcIUUB2yod+5aTWoBewtFtg/Oee95XirMfEdlCGT2W7Z07zD0nbI4l
	 Z89zXci2inN8vcwuwzrc01Jvu+HI8H+ufABefjR1EggIHTO8V6pK6XssPoEKipUoul
	 BPudP+BFT/XiulSPHnO4nP2yakcWU0sP+V6y3woUaAqwjcY4x3jg+COgABnGgRlVmw
	 SaXpkSxkEPICfoVx/VFyTDgEjkieC46Ho6Fb74pGD8buuxmctwEpFp3KsRJV9J8cI5
	 VcmfHsBSnlPMC1OH3yHaPYPYnGaEe80cZiKrsKn7IIqM8RiU9K6zkM+ZgKPBlNo2w4
	 IXa1kW9mMowdA==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso13364011fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:50:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBOMiqeVcOu/6G8AVulhwbi+4Yo13PPCwAf1RYMEjYsogdBDc50zvsmDm0FVMVhlhd5v2HtaIuLfVyt3g=@vger.kernel.org
X-Gm-Message-State: AFuF++kMPfuWLc8KJThnWNSEIDfJgsXxOZp3XOVDAaTSNIyeNLy7Zp9h
	U4lEWK8LVrs4QlXV7oLVRxo3f05FTSfcoQms8MWBqhCj0lGi4e3ov2S0HpEHQjQhMSC4+9nDUiH
	LlgtVxInvWhHrPQ6YY58xgnKLaAjBXWc=
X-Received: by 2002:a05:651c:1543:b0:3a3:7741:b43c with SMTP id
 38308e7fff4ca-3a5fbf06931mr15872001fa.7.1789897854214; Sun, 20 Sep 2026
 02:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913145527.18148-1-iuncuim@gmail.com> <20260913145527.18148-4-iuncuim@gmail.com>
In-Reply-To: <20260913145527.18148-4-iuncuim@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 20 Sep 2026 17:50:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jmSPeKD-kr2MsASJy7v5Mqw+FBOvX9ziE__-35W6EJA@mail.gmail.com>
X-Gm-Features: AcwNN1XesilYUDb2NviAIFfSkaFxFlN66gg2pfogUxTJxiboh6rzWf-zN1gPLSI
Message-ID: <CAGb2v67jmSPeKD-kr2MsASJy7v5Mqw+FBOvX9ziE__-35W6EJA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] thermal/drivers/sun8i: get calibration data from
 two nvmem cells
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	=?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?= <juanmanuellopezcarrillo@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 10:56=E2=80=AFPM Mikhail Kalashnikov <iuncuim@gmail=
.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The A523 processor has calibration data in two nvmem cells. To be able to
> add support, the ability to add data from two cells into one array must b=
e
> added.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

I'd say that Sashiko's comment on "leaking" memory until the device is
removed is not too much of a concern. Sure it could be released sooner
since it's not used, but it's not a lot of memory.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/thermal/sun8i_thermal.c | 81 +++++++++++++++++++++------------
>  1 file changed, 53 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 1412bce63..360654880 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -300,43 +300,68 @@ static int sun50i_h6_ths_calibrate(struct ths_devic=
e *tmdev,
>
>  static int sun8i_ths_calibrate(struct ths_device *tmdev)
>  {
> -       struct nvmem_cell *calcell;
> +       struct nvmem_cell *calcell =3D NULL;
>         struct device *dev =3D tmdev->dev;
> -       u16 *caldata;
> -       size_t callen;
> +       struct device_node *np =3D dev_of_node(dev);
> +       struct property *prop;
> +       const char *cellname;
> +       u8 *caldata =3D NULL;
> +       size_t callen =3D 0;
>         int ret =3D 0;
>
> -       calcell =3D nvmem_cell_get(dev, "calibration");
> -       if (IS_ERR(calcell)) {
> -               if (PTR_ERR(calcell) =3D=3D -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -               /*
> -                * Even if the external calibration data stored in sid is
> -                * not accessible, the THS hardware can still work, altho=
ugh
> -                * the data won't be so accurate.
> -                *
> -                * The default value of calibration register is 0x800 for
> -                * every sensor, and the calibration value is usually 0x7=
xx
> -                * or 0x8xx, so they won't be away from the default value
> -                * for a lot.
> -                *
> -                * So here we do not return error if the calibration data=
 is
> -                * not available, except the probe needs deferring.
> -                */
> -               goto out;
> +       of_property_for_each_string(np, "nvmem-cell-names", prop, cellnam=
e) {
> +               size_t len;
> +               u8 *caldatapart;
> +
> +               calcell =3D of_nvmem_cell_get(np, cellname);
> +               if (IS_ERR(calcell)) {
> +                       if (PTR_ERR(calcell) =3D=3D -EPROBE_DEFER)
> +                               return -EPROBE_DEFER;
> +                       /*
> +                        * Even if the external calibration data stored i=
n sid is
> +                        * not accessible, the THS hardware can still wor=
k, although
> +                        * the data won't be so accurate.
> +                        *
> +                        * The default value of calibration register is 0=
x800 for
> +                        * every sensor, and the calibration value is usu=
ally 0x7xx
> +                        * or 0x8xx, so they won't be away from the defau=
lt value
> +                        * for a lot.
> +                        *
> +                        * So here we do not return error if the calibrat=
ion data is
> +                        * not available, except the probe needs deferrin=
g.
> +                        */
> +                       goto out;
> +               }
> +
> +               caldatapart =3D nvmem_cell_read(calcell, &len);
> +               nvmem_cell_put(calcell);
> +               calcell =3D NULL;
> +               if (IS_ERR(caldatapart)) {
> +                       ret =3D PTR_ERR(caldatapart);
> +                       goto out;
> +               }
> +
> +               caldata =3D devm_krealloc(dev, caldata, callen + len, GFP=
_KERNEL);
> +               if (!caldata) {
> +                       kfree(caldatapart);
> +                       ret =3D -ENOMEM;
> +                       goto out;
> +               }
> +
> +               memcpy(caldata + callen, caldatapart, len);
> +               callen +=3D len;
> +               kfree(caldatapart);
>         }
>
> -       caldata =3D nvmem_cell_read(calcell, &callen);
> -       if (IS_ERR(caldata)) {
> -               ret =3D PTR_ERR(caldata);
> +       if (!caldata)
>                 goto out;
> -       }
>
> -       tmdev->chip->calibrate(tmdev, caldata, callen);
> +       tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
>
> -       kfree(caldata);
> +       devm_kfree(dev, caldata);
> +       caldata =3D NULL;
>  out:
> -       if (!IS_ERR(calcell))
> +       if (!IS_ERR_OR_NULL(calcell))
>                 nvmem_cell_put(calcell);
>         return ret;
>  }
> --
> 2.55.0
>
