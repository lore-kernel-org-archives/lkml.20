Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6D83ABD96
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252617; cv=pass; b=W46nse/oAH3tCljwnDOsknE0aFICUd2jgwSBBrJSNUjkxcW01/oPy6UyFrFz6jWtJ8Fq5HsMB541Uxehnht+cT1UW1cjshr3w5IjTWumz3SU2kPtzEqqNhGDjL0ycw9nd6CGszDX8AjNiI+SAHcK2c5N3+Jhyuh3MGauUEgKjro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252617; c=relaxed/simple;
	bh=RNjjUPAqj04Zgmf3ERyYj6L+drgEgOadI/eoAl8Rxyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVphmkGXJD0794Soh9WPKnJNjgqmMVR3wZ0kaN9qKr1Cp5HIBcP/LAjw7Y3ZfuBLFXd51wha1RVttNHKnB4e9fT7oqi41tEbZK9ObpXHqCTNhmo6N9VplbkzjV4uOH0gn6UZvXCNmlx/6GpL8do2dWX+Pz6TI3vIpODCGypleYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUtIuKUp; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUtIuKUp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so1607107f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790252614; cv=none;
        d=google.com; s=arc-20260327;
        b=RusbhHDFE8UOoBCTAb1mYdvBDR+j8PMKn7egCqXWBYC9PboHv+bSMwBEYeD9JLRqxN
         cwA3hmMRu3xdCXmmfRoyHMVtHZMVlZr721hBSkauT8Q9wzHNTThKiYjqn41RrN+XIyB2
         5w5po1BrAJevEp8ArUcH8NBVRZnn5/kY0jj3SWJdPiBOlpd4MtB848fwgfjhO4Wvmm4+
         hIWts1WJjN7n9rpgfcNFXgi5K73ONThWbbax3hp8VC3oUZZGy7wDFzThGgwGdSghwgoy
         h5wbiiblHMT8YH3FgpeTkijVt6Y0Mn/KHiMR+eS2DJpdRByUtpYJfeZ53R8fvz5RU0Bb
         r6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rdRrzn5S9xJBL1cPeQCdlU0zlgaKl3QYL9gnErwMUoA=;
        fh=otee0Vvw2pu2a5nzBkqdpT/bFUkhsD+FUSAImWiLGeg=;
        b=dKiVjiXrZ0bZpi0DadXjqop4tVCI6Ul8oRBeCZk7ptyWA8c35pD4vKNwvB9Yo4imew
         dHFR7XiQM5sRKPXoJ9E4IQT+MtIE/rAq6oKx6rk5RNNCeiLQDX75Lb4Rl/8TCkcsVGQc
         YYH/3n7+ma1Hf9prLLMfmD+/ODM2iVgXzPBFvFns3Pk9Gzj09RmVVMMh2Z1+bZYLvU4P
         Eg44wvx9ftNMy0xWSQKRbG+l7PJ3q82b1HB9dIxeJKmWJEweESrJN/xSTCcwjGxxeiRY
         yUinxNzEZ9Wv02cHOWqwcM2G4VIowWote48Cmmxjs8MDNJUzCKvroc5VEo7zK4GtLdNz
         he7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790252614; x=1790857414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rdRrzn5S9xJBL1cPeQCdlU0zlgaKl3QYL9gnErwMUoA=;
        b=TUtIuKUp287WjjaJ/J5W1Doqa4hIngcO0ksxIaxRuZRwDbiWyRujH4zL8KlOWrED3C
         PJ9DW+ulAF/7H1TwMNpsJ+8LcvQF7R/ak0Zs5nIz7MqNdu/dTMJ/WA99Vq83XfmhYufL
         ktJe0Ll9WAQMi3GBDRKFzM9HxlMjPhYPfFTtIeIOWUxQ8W5l3D7pHmnsLDtngJcIqluA
         R97fD72gY5NRT/AFcd64rU/bVu8GQCKcxs7trNyBxlpgdwiZbStdwF6P0KRsbIXADimv
         tCiWJYgxFNGCZ+U+L+pXdFkKkMD2e3OoIfyUmzRwyZapeAnUb6tGU+a2eMNKlv4GTSD4
         4bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252614; x=1790857414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdRrzn5S9xJBL1cPeQCdlU0zlgaKl3QYL9gnErwMUoA=;
        b=nqcrzJfNOsipXBTK5CWIzkHxdQvb0GVGwFI0jhCPJn2iph4WlELJnUrubqHvBrmzQb
         Vh7hThY3IW0ZI40crlm4zoFy/nl4xpUKdG9iuYFDEqbo3+P9RTOzyTTm+4mu8S9Xwk2q
         eizQ09VJUHXIoRgHd20MZFkPqNzvkK2H1Y26rl7iqbLPa4cM7c1TO1PPg6xhdSL3SiHd
         dK0gP9ubJbuRo5Cql6koCVWJkK8Q79VTiV1/Hl/aoI5fLi1/b2Pk0kdrtKv0sUiECSRT
         IJhslMuLAd4ku0zkTkmMZ4ybtvuWm2bZDUkb/A4mD+zQz/Kn3/WwN+4qVYCXYG2GPH18
         b+uw==
X-Forwarded-Encrypted: i=1; AKwUvBzhEeeOIo/LB+MOB0+H5fj32tTYvpYV9cKsm5TFvsJdessPIEqB+ID3t9la1zOYiSJ57UohKiLbq5EEpwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mNu8YLUGnWx+Vf5JyivFdxCz5LtP2oCnjsUA1W77MFR5kl1A3W
	rYJvvbj7NChl3ouCVM4VSZEixLu66pMTQxOvyqtiex8ZqsPPp4NU2m/A6wXUl8NRDevED/OnSGe
	yfQIDCwfLcKnYfezbcBvXIYeP9Hti0h4=
X-Gm-Gg: AYBFou2IPuwkmUqimGM5yEz6al4spO2UZoRGMJWPa6uXuuKiLpa7QZ9e8Jaa4Wx5EuB
	6WbqE3rD40SXBbNRCZeqCAHGA5YJZrM/YS0c6FWMnhvzMXk0gKb3khg3XJTxqJKupeA1QqPd5yi
	vbE920H7IT34JbsvsV/J1hCUc4bgDD8/CIrjmlyPPxsZB9uBO9UpCHUBMSIGvTTxpmD829aHghy
	YxDD0hrhWXdH3ACBR+FuD1LyAp5oFC0r3HRKnu/y0XfGFII7UN77zioiMopNo4WCbinrvy53SAd
	u0X+g+wpNa9tHQP9q462lZZnFJLsu/MS/B8tzg0RKJpmOJO87Ogbj+9B9gSydxSjpbUKeXENkm5
	4+drUTnK1eoHsYKLYkc8YQ4E/TpNGcKCUM738NCswaQs=
X-Received: by 2002:a5d:5f8e:0:b0:486:e737:d94b with SMTP id
 ffacd0b85a97d-48871974c2fmr3738525f8f.51.1790252613801; Thu, 24 Sep 2026
 05:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-6-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-6-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:23:07 +0100
X-Gm-Features: AclHuK-A9mOEuZHDK0Q_tjNq3JBCpEEYs1c2VB24F6HG3wDPVZfQ5b43QBAhTjs
Message-ID: <CA+V-a8vr--5UVR+TLTWyEkzany3W-nwsteeVZEDv7D-sVqyK4g@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] PCI: rzg3s-host: Move suspend/resume code into
 dedicated functions
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:56=E2=80=AFPM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> In preparation for implementing hotplug using
> pci_host_bridge::reset_root_port(), move the suspend/resume code into
> rzg3s_pcie_host_stop() and rzg3s_pcie_host_start(). These functions
> will later be reused by the hotplug implementation through
> pci_host_bridge::reset_root_port().
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - none
>
> Changes in v3:
> - none, this patch is new
>
>  drivers/pci/controller/pcie-rzg3s-host.c | 181 ++++++++++++-----------
>  1 file changed, 96 insertions(+), 85 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 3ecada238402..40d5ef3e347e 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1742,6 +1742,100 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *hos=
t,
>         return ret;
>  }
>
> +static int rzg3s_pcie_host_stop(struct rzg3s_pcie_host *host)
> +{
> +       const struct rzg3s_pcie_soc_data *data =3D host->data;
> +       struct rzg3s_pcie_port *port =3D &host->port;
> +       struct rzg3s_sysc *sysc =3D host->sysc;
> +       int ret;
> +
> +       clk_disable_unprepare(port->refclk);
> +
> +       /* SoC-specific de-initialization */
> +       ret =3D data->config_deinit(host);
> +       if (ret)
> +               goto refclk_restore;
> +
> +       ret =3D reset_control_bulk_assert(data->num_power_resets,
> +                                       host->power_resets);
> +       if (ret)
> +               goto config_reinit;
> +
> +       /*
> +        * Since the power domain's genpd_suspend_noirq() will disable cl=
ocks,
> +        * there is no need to manually invoke runtime PM API here.
> +        */
> +
> +       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 0);
> +       if (ret)
> +               goto power_resets_restore;
> +
> +       return 0;
> +
> +       /* Restore the previous state if any error happens */
> +power_resets_restore:
> +       reset_control_bulk_deassert(data->num_power_resets,
> +                                   host->power_resets);
> +config_reinit:
> +       if (data->config_pre_init)
> +               data->config_pre_init(host);
> +       data->config_post_init(host);
> +refclk_restore:
> +       clk_prepare_enable(port->refclk);
> +       return ret;
> +}
> +
> +static int rzg3s_pcie_host_start(struct rzg3s_pcie_host *host)
> +{
> +       const struct rzg3s_pcie_soc_data *data =3D host->data;
> +       struct rzg3s_sysc *sysc =3D host->sysc;
> +       int ret;
> +
> +       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 1);
> +       if (ret)
> +               return ret;
> +
> +       if (host->num_lanes) {
> +               ret =3D rzg3s_sysc_config_func(host->sysc,
> +                                            RZG3S_SYSC_FUNC_ID_LINK_MAST=
ER,
> +                                            host->num_lanes =3D=3D 2  ?
> +                                            RZG3S_SYSC_LINK_MODE_DUAL_X2=
 :
> +                                            RZG3S_SYSC_LINK_MODE_SINGLE_=
X4);
> +               if (ret)
> +                       goto assert_rst_rsm_b;
> +       }
> +
> +       /*
> +        * Since the power domain's genpd_resume_noirq() will enable cloc=
ks,
> +        * there is no need to manually invoke runtime PM API here.
> +        */
> +
> +       ret =3D rzg3s_pcie_power_resets_deassert(host);
> +       if (ret)
> +               goto assert_rst_rsm_b;
> +
> +       ret =3D rzg3s_pcie_host_setup(host, rzg3s_pcie_msi_hw_setup,
> +                                   rzg3s_pcie_msi_hw_teardown);
> +       if (ret)
> +               goto assert_power_resets;
> +
> +       return 0;
> +
> +       /*
> +        * If any error happens there is no way to recover the IP. Put it=
 in the
> +        * lowest possible power state.
> +        */
> +assert_power_resets:
> +       reset_control_bulk_assert(data->num_power_resets, host->power_res=
ets);
> +assert_rst_rsm_b:
> +       rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
> +       return ret;
> +}
> +
>  static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
>  {
>         struct device_node *np =3D host->dev->of_node;
> @@ -1939,98 +2033,15 @@ static int rzg3s_pcie_probe(struct platform_devic=
e *pdev)
>  static int rzg3s_pcie_suspend_noirq(struct device *dev)
>  {
>         struct rzg3s_pcie_host *host =3D dev_get_drvdata(dev);
> -       const struct rzg3s_pcie_soc_data *data =3D host->data;
> -       struct rzg3s_pcie_port *port =3D &host->port;
> -       struct rzg3s_sysc *sysc =3D host->sysc;
> -       int ret;
> -
> -       clk_disable_unprepare(port->refclk);
> -
> -       /* SoC-specific de-initialization */
> -       ret =3D data->config_deinit(host);
> -       if (ret)
> -               goto refclk_restore;
> -
> -       ret =3D reset_control_bulk_assert(data->num_power_resets,
> -                                       host->power_resets);
> -       if (ret)
> -               goto config_reinit;
> -
> -       /*
> -        * Since the power domain's genpd_suspend_noirq() will disable cl=
ocks,
> -        * there is no need to manually invoke runtime PM API here.
> -        */
> -
> -       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 0);
> -       if (ret)
> -               goto power_resets_restore;
>
> -       return 0;
> -
> -       /* Restore the previous state if any error happens */
> -power_resets_restore:
> -       reset_control_bulk_deassert(data->num_power_resets,
> -                                   host->power_resets);
> -config_reinit:
> -       if (data->config_pre_init)
> -               data->config_pre_init(host);
> -       data->config_post_init(host);
> -refclk_restore:
> -       clk_prepare_enable(port->refclk);
> -       return ret;
> +       return rzg3s_pcie_host_stop(host);
>  }
>
>  static int rzg3s_pcie_resume_noirq(struct device *dev)
>  {
>         struct rzg3s_pcie_host *host =3D dev_get_drvdata(dev);
> -       const struct rzg3s_pcie_soc_data *data =3D host->data;
> -       struct rzg3s_sysc *sysc =3D host->sysc;
> -       int ret;
>
> -       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 1);
> -       if (ret)
> -               return ret;
> -
> -       if (host->num_lanes) {
> -               ret =3D rzg3s_sysc_config_func(host->sysc,
> -                                            RZG3S_SYSC_FUNC_ID_LINK_MAST=
ER,
> -                                            host->num_lanes =3D=3D 2  ?
> -                                            RZG3S_SYSC_LINK_MODE_DUAL_X2=
 :
> -                                            RZG3S_SYSC_LINK_MODE_SINGLE_=
X4);
> -               if (ret)
> -                       goto assert_rst_rsm_b;
> -       }
> -
> -       /*
> -        * Since the power domain's genpd_resume_noirq() will enable cloc=
ks,
> -        * there is no need to manually invoke runtime PM API here.
> -        */
> -
> -       ret =3D rzg3s_pcie_power_resets_deassert(host);
> -       if (ret)
> -               goto assert_rst_rsm_b;
> -
> -       ret =3D rzg3s_pcie_host_setup(host, rzg3s_pcie_msi_hw_setup,
> -                                   rzg3s_pcie_msi_hw_teardown);
> -       if (ret)
> -               goto assert_power_resets;
> -
> -       return 0;
> -
> -       /*
> -        * If any error happens there is no way to recover the IP. Put it=
 in the
> -        * lowest possible power state.
> -        */
> -assert_power_resets:
> -       reset_control_bulk_assert(data->num_power_resets,
> -                                 host->power_resets);
> -assert_rst_rsm_b:
> -       rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
> -       return ret;
> +       return rzg3s_pcie_host_start(host);
>  }
>
>  static const struct dev_pm_ops rzg3s_pcie_pm_ops =3D {
> --
> 2.43.0
>
>
