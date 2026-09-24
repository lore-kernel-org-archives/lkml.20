Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD24756CB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252393; cv=pass; b=CnCKP8wi7/GvmtQ15G4cOcciwrPGJlu8aJ/unyhyBRE/IV74Fkabwc5RT21usF5cSgRdC9VRbPuTi+E4OH0sVDYbl2obbbkKWDWKt8FGYtW9ymnSh1yAPNwR7rkPnsElMOEGboZZnAB4V2AogkAZEqQpmBf7kMBueOl5iWx3sOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252393; c=relaxed/simple;
	bh=QrzmK3wGyZKCxCcAVNUy/oG4X2vMWpqXP/L7GgMxP+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZA80IBcrL1lwQfP6PHR8WnqPKjvIeq1ZjFTc+hFh+Jv15ox07KUauk88Pjn5RpqH/OOUGh0p2S1A6uEUkEs75QlpdhbK4Q7cfR5mqv8Mmu8/5o6F9fzJatiXCxSubL3ByE3BjW5C1UtCrh+bo/U/XXOlQ1+Mo6S4Gz9zm1rgrN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPcUBqDT; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPcUBqDT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso1724863f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790252389; cv=none;
        d=google.com; s=arc-20260327;
        b=CDHqCobtv5a2GolJr/56Cljr2yUif50bqE9QzTW/mRIvowYtiu/KVP7o1jm6NO98m7
         gtSWGoq2OMPQuf3ba/rzQ5NHVCVEqIUPYxKYrier12YjMOl1+hqq3HWTsl+TYF0QrTap
         XvxswciGb8dyGgoeLL4yRwmvYxVV2ScHLHmrkuhMuUpeNl8Qku+dmhluhr2LRywmC0rI
         fT6s3O60CTf1WS/4y9bHFFCTTf+P9SM2945HBjT6D364jXz4nf6xBgzqJecIGOLZGrWt
         CF1rHOpisuc0uVMoTBuD8U91xzxRTs/MrUNfdDGnbJtHX+44mfa1tbudkOosT8NQBN7W
         kf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sOdRDaL5nLRUX0xNiudVZSR4Cv7Thxx5Y/qYJ603sMw=;
        fh=7r5wHRNYOuxXtPLW5qkbwy+FpmtC95I3F3avcJ69j6o=;
        b=loO95gboAJLj/o9JiZg0f+H8rOgYVLX70LntyUXv57nKFEixeQx69iKVY8yXTFy+x9
         xtDT+gq5v+VOw41qeGIlbjb//bxn9B3g6XpxCt9WfyJ921sdxtp96Nh6KlfAYJIQT55i
         2XTrr47cqP4IyPJQHyu5QfVJ+UZhDrHSnMM0WbUeqv6yKHJFmnKtzEgWV58m/7gosdle
         UL8nlpOkkVnctNGN1pNPFtTJ+lcmkfjM1eHqNWwZLHcAjaZr4tVSczfaY/SnHnH6EHMW
         gbklHL8w1gh9sIKxxRrkZ5UNLXVyFY9lkUhn8F9zVmPWSZQRIOO9t7rHnzfVFKIFfHnN
         K1CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790252389; x=1790857189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sOdRDaL5nLRUX0xNiudVZSR4Cv7Thxx5Y/qYJ603sMw=;
        b=PPcUBqDTOHXMbQqnuToY4PpxvUAX5PNdSZD+MIImFeeX20rDeNqccQ34vtNOQIXT6g
         pZhlGtSmi3tnU3UqqfatzdI39oYv/jOV3IoSW0AfI9cOenHrOK7q7T6YT3oNqtPonF6m
         6QMekfIz+0pozib8s0wmry63TNp94rLMeCWavcjj25q+GUIn7s7J5pqpVPCkLK+4iCJc
         fn8TdMKhd39RdndpsOxl35ica9Gdji9q3tCr9QaOKb4y9VSjXp9RwxJC8qJJ9WaQpqsp
         a2gxHy3jQfEHITsmAqkhd7/G/SBELSzqSIVW1ccdxXWVmUcfdKfqU98Ka4E0KL5sReMu
         aIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252389; x=1790857189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOdRDaL5nLRUX0xNiudVZSR4Cv7Thxx5Y/qYJ603sMw=;
        b=ByWQheudpn118mMBNQk/xL/nTmnZd2ntNL1tbRXPywoQing0fNeln1d/SxUXNTsznM
         mDVC9Gt4dyDjbhC+57kNWxvm9TF4t8TPFMgfzNG8HQU5OnU84rrXyUgNNfHMf2d/FtVS
         I6vaTDc9AJ0tRxgQdMOk6f7cNAIkFecdeT6F6HMAE9TSXC2nuz97ci2gVKSGkpKt7OBG
         kAYSw2hYqC6Z8F8GmhaBz4/5N47bnnJhBve9JP61h0NTSJRz5vM6mPRlNGrokOjpuJUb
         qMYJLFrbX12/S4wHiIljjOOlN/9PkTwE6eWV/F+6ovAbwyUrWngOM3mVrnAfi6IjR4j2
         YBCg==
X-Forwarded-Encrypted: i=1; AKwUvBxZKHHtdLMannTVNGzehZIHJkyFEbp6oAF5PDh7is7tx4H7uRfeDUeU6f+pRpE79pinR0BZjoJ6UqsHSaY=@vger.kernel.org
X-Gm-Message-State: AFuF++nAogyI281VPwsG8/VVmPIZsH3WF/udJVyfFagabQ29Tb0iBb42
	TroDLngdmNALoN3y61RdftbkFaZi1mo2Xneeec0sQmt//TJeMCP6CnmLJqlUHY3ACsSse1i5B3M
	CGL5pep078PieKS5h0i/uFd/BEY5UJKY=
X-Gm-Gg: AYBFou34i62BK2l6cpyiT4aZYjiITCD5w/BeN4vvIGLpBLi5YDxo/uRh7qSj5bR8U7l
	EcyNLCtxt39c6qEowUN3Ipz66VFnxausX1FvzNa175x+kVdNQW2HJMqbl9kh4z/leU+dSsiS1HG
	SdCNY1L+aziBZTkrjQNPdCF9U4gS50KDdq8XHXwmVg2Fey151FgAffdhZYoGyFX0sVvkQzH9UE+
	t8oDpLWA5UH4fZYbp70lPOU05FLErvo125LV26VcrYV0xiRT5NeDRDton7hyr8xy62FvFuHbDNj
	+eCl/9JiuBZJzkDG1G+GFmPefoQ7Lfmg8TuDMyyTIyq33dtCuYISqPKhOtk/BwKo+E0WtdPiE/u
	HMhkLuqXxlUuxmIHzTUEdebEONWVyxWlGURTC3+jvlV8=
X-Received: by 2002:adf:e188:0:b0:486:f980:2361 with SMTP id
 ffacd0b85a97d-48872ac750cmr3107347f8f.45.1790252389207; Thu, 24 Sep 2026
 05:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-2-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-2-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:19:22 +0100
X-Gm-Features: AclHuK-idVdhsB6tGLLC0zrpRkFq8euSZ0ifbTPMKw_QOO-4kHiRYVKAvxMjB_A
Message-ID: <CA+V-a8tqoLXKX2W2-QdR+_+grpskwXpDwg32aJ72cgmbUqMG5g@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] PCI: rzg3s-host: Follow hardware manual
 clock/reset initialization order
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:53=E2=80=AFPM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/G3S PCIe hardware manual specifies that the clocks must be enabled
> before the reset signals are deasserted during initialization.
>
> Follow this sequence in the probe(), suspend(), and resume() paths to
> match the hardware requirements and avoid potential issues.
>
> Fixes: 7ef502fb35b2 ("PCI: Add Renesas RZ/G3S host controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - none
>
> Changes in v3:
> - none, this patch is new
>
>  drivers/pci/controller/pcie-rzg3s-host.c | 40 +++++++++++++-----------
>  1 file changed, 21 insertions(+), 19 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 077cfb0834b3..e1105b1f2652 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1888,10 +1888,6 @@ static int rzg3s_pcie_probe(struct platform_device=
 *pdev)
>         if (ret)
>                 goto sysc_signal_restore;
>
> -       ret =3D rzg3s_pcie_power_resets_deassert(host);
> -       if (ret)
> -               goto sysc_signal_restore;
> -
>         pm_runtime_enable(dev);
>
>         /*
> @@ -1902,12 +1898,16 @@ static int rzg3s_pcie_probe(struct platform_devic=
e *pdev)
>         if (ret)
>                 goto rpm_disable;
>
> +       ret =3D rzg3s_pcie_power_resets_deassert(host);
> +       if (ret)
> +               goto rpm_put;
> +
>         raw_spin_lock_init(&host->hw_lock);
>
>         ret =3D rzg3s_pcie_host_setup(host, rzg3s_pcie_init_irqdomain,
>                                     rzg3s_pcie_teardown_irqdomain);
>         if (ret)
> -               goto rpm_put;
> +               goto power_resets_assert;
>
>         bridge->sysdata =3D host;
>         bridge->ops =3D &rzg3s_pcie_root_ops;
> @@ -1922,12 +1922,13 @@ static int rzg3s_pcie_probe(struct platform_devic=
e *pdev)
>         clk_disable_unprepare(host->port.refclk);
>         rzg3s_pcie_teardown_irqdomain(host);
>         host->data->config_deinit(host);
> +power_resets_assert:
> +       reset_control_bulk_assert(host->data->num_power_resets,
> +                                 host->power_resets);
>  rpm_put:
>         pm_runtime_put_sync(dev);
>  rpm_disable:
>         pm_runtime_disable(dev);
> -       reset_control_bulk_assert(host->data->num_power_resets,
> -                                 host->power_resets);
>  sysc_signal_restore:
>         /*
>          * SYSC RST_RSM_B signal need to be asserted before turning off t=
he
> @@ -1948,10 +1949,6 @@ static int rzg3s_pcie_suspend_noirq(struct device =
*dev)
>         struct rzg3s_sysc *sysc =3D host->sysc;
>         int ret;
>
> -       ret =3D pm_runtime_put_sync(dev);
> -       if (ret)
> -               return ret;
> -
>         clk_disable_unprepare(port->refclk);
>
>         /* SoC-specific de-initialization */
> @@ -1964,13 +1961,19 @@ static int rzg3s_pcie_suspend_noirq(struct device=
 *dev)
>         if (ret)
>                 goto config_reinit;
>
> -       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 0);
> +       ret =3D pm_runtime_put_sync(dev);
>         if (ret)
>                 goto power_resets_restore;
>
> +       ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B=
, 0);
> +       if (ret)
> +               goto rpm_resume;
> +
>         return 0;
>
>         /* Restore the previous state if any error happens */
> +rpm_resume:
> +       pm_runtime_resume_and_get(dev);
>  power_resets_restore:
>         reset_control_bulk_deassert(data->num_power_resets,
>                                     host->power_resets);
> @@ -1980,7 +1983,6 @@ static int rzg3s_pcie_suspend_noirq(struct device *=
dev)
>         data->config_post_init(host);
>  refclk_restore:
>         clk_prepare_enable(port->refclk);
> -       pm_runtime_resume_and_get(dev);
>         return ret;
>  }
>
> @@ -2009,18 +2011,18 @@ static int rzg3s_pcie_resume_noirq(struct device =
*dev)
>                         goto assert_rst_rsm_b;
>         }
>
> -       ret =3D rzg3s_pcie_power_resets_deassert(host);
> +       ret =3D pm_runtime_resume_and_get(dev);
>         if (ret)
>                 goto assert_rst_rsm_b;
>
> -       ret =3D pm_runtime_resume_and_get(dev);
> +       ret =3D rzg3s_pcie_power_resets_deassert(host);
>         if (ret)
> -               goto assert_power_resets;
> +               goto rpm_put;
>
>         ret =3D rzg3s_pcie_host_setup(host, rzg3s_pcie_msi_hw_setup,
>                                     rzg3s_pcie_msi_hw_teardown);
>         if (ret)
> -               goto rpm_put;
> +               goto assert_power_resets;
>
>         return 0;
>
> @@ -2028,11 +2030,11 @@ static int rzg3s_pcie_resume_noirq(struct device =
*dev)
>          * If any error happens there is no way to recover the IP. Put it=
 in the
>          * lowest possible power state.
>          */
> -rpm_put:
> -       pm_runtime_put_sync(dev);
>  assert_power_resets:
>         reset_control_bulk_assert(data->num_power_resets,
>                                   host->power_resets);
> +rpm_put:
> +       pm_runtime_put_sync(dev);
>  assert_rst_rsm_b:
>         rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_RST_RSM_B, 0);
>         return ret;
> --
> 2.43.0
>
>
