Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A394A2A56
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842077; cv=pass; b=L7NNcf9xUoTYigtG8dLtTHvBFw5UmP/hhZIN9x6CDaTKrvkLBS0P7T1vBZyuiX6jFBdoSH61l6Nq9FAGHPzrN46818/6jSFmEA9htSfNX8dIyLdb69HwQAUOUevLVa6gSDN+tpmf2/XJna+cjn6QHFWieHQ8/lt9n1Xx/jxnLTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842077; c=relaxed/simple;
	bh=mhPnoofehpAnih/7vt9wRjfa6Jbx3NTWojOWvQWkOmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNJht7Xx5PMR8zGVczmAPcwoTPdsHFhbzToudgaJxYn4XRZiyRBX9eIB3q8TFPQcq4BhAJV1/SfEV2rYh2a2sCc0smb95pxL9a+UmUcL/O9eDYghaGUtqlsempmVpON9GJDPMAvUti69rn9xV7wzn2pkQ5Nb0FANw2kWSeHThOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3hwn5FG; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3hwn5FG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a01b560392so6028715e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790842073; cv=none;
        d=google.com; s=arc-20260327;
        b=eZW3euUZ8z5n8zBF58UosMC8V0A2MZvEMaLMY8D8ICvXmN19SIpZV/n7/IsxjZXbXU
         Nhs/BRETaUjhljlrYpugnsnKeEPE7N6lZZTM2uWSmQqGeQl67WniiQ9lfw+cEPOFW95d
         4iIesydPtv5XextKut5eUbWjKNF8Kilw+7tiobWREXj1asVMf0ij8jBITDTximvwbBZq
         B5Hg021hvV0fUABlyTMCQVjMnwEHcj8fnKwvYrFDM1Mamb4o+y5rMIANSqB0necNEb7o
         R9qPN/qUVqLoti05pCNodNWLEF/E96Q6TJ0IPJXIarDX3aT93V+vLa6edjGaHF6tPurp
         tQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=18zLq0gxDFVMpNFIuebbzGpXcEbEbepSMRwKNaKe0Ds=;
        fh=6hclIFyO3dNsqxhwD0nuQgefiLTQUOtOUNeIUakZr9c=;
        b=PYnmC8Evy/S0uKRKynLyaGw+cUknI7xmStwpe0pt2aqAx/SvSTJVvMckASGQOVze6Q
         nDBjEqnuMWvJZM2zpuMaayPF1iI0vTcSF96TtqbQhV55aUXA0aGWz6cuY8iu7DHUcByY
         w7+iqseBrtgqgq9Xd+A+8j+4Sy2gz9dIVtcUwvQmsCjfyMsO0xV3hoWAEqEY2pnW4A0E
         Twy4is0/rozvOEyBg0MO/0TtYbUBKW5ERwLo3K3DKoS70O+Tcrjt7nqL26u/fUpLntY4
         CbEYRUDligBFaI/d6vQ24o+ctD1Odb8CPg6eVNVeWTupxkHOtVkimL3c5E4Jsam3hMDY
         qzHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790842073; x=1791446873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=18zLq0gxDFVMpNFIuebbzGpXcEbEbepSMRwKNaKe0Ds=;
        b=E3hwn5FGUIcK9ldfaqmc2LF8LdTA6bAz8tY8cYVssVBIGar3uwDcTuyE39v25MPVSY
         6A2hosd9DZzg2cSp3B3OIImhKfTEtNojoL7sYGfWpzsHfE+23wkdoGxd0TV7bqCJDkwG
         WEcAsJDlye3yLddX0Ctu0MtPDy3BYaGnh01k4Bw6fIaYT5Wqv7L9EGi+PhQKLT6vGstF
         y56R5U1M/AVc9YpMlWAawApFj5Unsl7va8wYNoVwPzWqoLAqTNEnPuUkM1reCuWk68Y1
         +brhaS7XutlpEdDPVAFwO98VOCEN/vnLGgKIbiLUueukBs1u8ZIEX3/u3woBUqubClAB
         LqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842073; x=1791446873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=18zLq0gxDFVMpNFIuebbzGpXcEbEbepSMRwKNaKe0Ds=;
        b=0uXzDxyHk6Po+L7Oiu/zvRe286nLw/Q0O9PuR3FueK1x1+rp+uPsDHoEJJtU6ICPbT
         eXA1dxk4CKJS0c4MbXziT2n+fi4lNY0DCt027lp9zIzTkGPCqAzaDM141Aahwh0M+6+y
         23pZWkeSVfQc4ouxiqILP+3Xtb9kkTWeRLLUoGH1zDGR2C5NxxgIk5uRg8J6lv9kfDLh
         GQKrnlIZTB11BA4670qd6OO35KRg4aS//gtYlkMiWBLiOoUg4I4rnlZbDyjWLsX8rnwr
         uND/JL9BWyBILihTAX7RWcudSEf8K2ngYTBTcvsr/EpKhQzQVA3AVVa3f4w5LIIo4lcL
         1OVQ==
X-Forwarded-Encrypted: i=1; AKwUvByfKoWNYiqh1mbs8C7b+yWFSC4eNhicRvSjTv2i8WfOCZAheQwlndxmbPfYN2zf8g4wwVQT0iRfiV6JVvU=@vger.kernel.org
X-Gm-Message-State: AFuF++mJmdbWa7br3/Z+ApcCv00myY9P//39amVSq+5xNQqrP54oCuPC
	tis+jtlbXFyP3fM68ThRy4FMHPWBhwcZcb2AsNHCEqFi+g/TF0CXhR96muZlJRdf5IPPASC3gxE
	6r7yMIOiTHrpY9eicXsmzbraFqmD8OwM=
X-Gm-Gg: AYBFou0mx8zq7m2JcR610fha8fcFJIM//uuyVt479fO6R/vPdGMAvogj8u7jAeCr4PZ
	C7SW//C92XmG3SjbT+ZnVPORaEciy13Y1V4/IHMkl+EmexXq8B5wm07qr0K91Am9L7jBJnqf1xH
	Rhn7vMpWgMDBPaZNnt/RiNmyopqvG8HFc/erCwQjCuEY+RutlRgdT7uZwQEvsxUT0U8rSy+mJZU
	ADUm02JyZfdNmMQJgvz/fGvjIqLnJSUHts4HL4CG+2dpso1DKmdOzcvcswI9spiF/oMy4fTeMnT
	zPqcy52bwRqeyb0H5NajSTY+euoQM7vstvgIjJ/FEw4B3U6JDozGq1zJzMlKnAdP91pcz5gXckL
	5dkp24HWcQ0GWtbJrOd+BDLcMziIaUAZ5F2S8ag3QcA==
X-Received: by 2002:a7b:c319:0:b0:49f:bd43:5a1c with SMTP id
 5b1f17b1804b1-4a01eb388aemr28276965e9.15.1790842072599; Thu, 01 Oct 2026
 01:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com> <20260930133257.23210-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260930133257.23210-5-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Oct 2026 09:07:25 +0100
X-Gm-Features: AclHuK9cX00JQ5BRsiOahPrZyoL_jqZij1NEb2GdYg1yn5CCJaNcWxmYljLqQbc
Message-ID: <CA+V-a8tQZONUkeZYFBTvO+L+FTnrq6AE_aJQsm7MFX9CBnA-8w@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the patch.

On Wed, Sep 30, 2026 at 3:47=E2=80=AFPM Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The register for controlling power to the DSI region is in the SYSC
> (System Controller) block. Add support for controlling the DSI PWRRDY
> signal so the driver can efficiently manage power to the DSI region.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped pwrrdy variable from struct rzg2l_mipi_dsi_hw_info and instead
>    using feature flag RZ_MIPI_DSI_FEATURE_PWRRDY
>  * Dropped rzg2l_mipi_dsi_pwrrdy_off() as it is taken care by
>    devm_pwrseq_get().
> v2->v3:
>  * Updated powerseq API names.
> v1->v2:
>  * Switched to power sequence for handling pwrrdy signal.
>  * Dropped header file regmap.h and mfd/syscon.h
>  * Added header file pwrseq/consumer.h
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index d67e1230b70c..5263b2b8f1ca 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/units.h>
> @@ -38,6 +39,7 @@ MODULE_IMPORT_NS("RZV2H_CPG");
>  #define RZG2L_DCS_BUF_SIZE     128 /* Maximum DCS buffer size in externa=
l memory. */
>
>  #define RZ_MIPI_DSI_FEATURE_16BPP      BIT(0)
> +#define RZ_MIPI_DSI_FEATURE_PWRRDY     BIT(1)
>
>  struct rzg2l_mipi_dsi;
>
> @@ -87,6 +89,8 @@ struct rzg2l_mipi_dsi {
>         struct clk *vclk;
>         struct clk *lpclk;
>
> +       struct pwrseq_desc *pwrseq;
> +
>         enum mipi_dsi_pixel_format format;
>         unsigned int num_data_lanes;
>         unsigned int lanes;
> @@ -1396,6 +1400,25 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops =
=3D {
>   * Probe & Remove
>   */
>
> +static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi)
> +{
> +       if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_PWRRDY))
> +               return 0;
> +
> +       dsi->pwrseq =3D devm_pwrseq_get(dsi->dev, "dsi-pwrrdy");
> +       if (IS_ERR(dsi->pwrseq)) {
> +               /*
> +                * This platform requires a sequencer. If we can't get it=
, we
> +                * must return the error (including -EPROBE_DEFER to wait=
 for
> +                * the provider to appear)
> +                */
> +               return dev_err_probe(dsi->dev, PTR_ERR(dsi->pwrseq),
> +                                    "Failed to get required power sequen=
cer\n");
> +       }
> +
> +       return pwrseq_enable(dsi->pwrseq);
Do we want to add a devm action to disable the pwrseq when the DSI
driver is removed?

Rest LGTM.

Cheers,
Prabhakar

> +}
> +
>  static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  {
>         unsigned int num_data_lanes;
> @@ -1454,6 +1477,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_de=
vice *pdev)
>
>         platform_set_drvdata(pdev, dsi);
>
> +       ret =3D rzg2l_mipi_dsi_pwrrdy_init(dsi);
> +       if (ret)
> +               return ret;
> +
>         pm_runtime_enable(dsi->dev);
>
>         ret =3D pm_runtime_resume_and_get(dsi->dev);
> --
> 2.43.0
>
>
