Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4284E47AF5C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252524; cv=pass; b=t0UsUjfl8HYh2OvE0FjYXL23B7s2W8MNSt8XISIDLrDMn39SEpVe6aG+MvzlJ/vZmHTOlhbL+pBGpCAlClhvPTNfbOagJ5fXIOpOVe4Klo0gM1rFq+v4y+FRG/XJl4aDUY5MGbgi+aBKa3Chs51vpwa5C5ESkO6Y3FhbmMfgeZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252524; c=relaxed/simple;
	bh=EvGodLlEbslRWzVQvua6EH6r9eVohRL7wEOeWlhU3Ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Skh3bQF/C6qJSrXCwNHAmwPl4/ml4jMNg19FKpu+46iBYmp+bunlJ2oPstGNPrGOeQfovn7NFkeO4kMGeIQ02pp+loThpfa5hL1idl4Erb8RtWLD6+0sGMNZn7hWxIY78fSgWTkN5WNIUsg/71fdEPXhmBozlkPW+iSJYOhty2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePhEyO2t; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePhEyO2t"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so12314715e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790252520; cv=none;
        d=google.com; s=arc-20260327;
        b=KIYwa5BUWZkgyvtUFj5tjY5vwyToLuBixAsKweTCvYE27jf18LUEKDIFPFgrp4RsS7
         Zh54KH3+YnjBj4OdYlVmZvcFdw2AOMSjK+DoLCp0XEFoEK2j9jmFzQIeOYDxSGHE++8a
         X4D4c78vz/gwLBwAFaMkVoUdnWuIVFlasFfEUv2zkMP14rHzF+FIrpbxVuQM4InjYOhc
         MIfSBo4yH1gZYFlKG2cvOXj6hPhsYUOvoG3Gx5V49V9boB9kNF5nqQzpHOibaoaYeO+5
         2i3Zse6zyfb7543oQnCFVBsclALFiABbP76Abxq+KB6Rlp38GpFu1Eb/NLJ9TWxLAAKT
         1TuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bkDqHG9FQUeGbwC5soK6us7Sx1oxX72NgwVfnkQyDfQ=;
        fh=S5E8T3IvMouYVO/n3wb7Vezs5ZnWJHiD9HNAt3piKCo=;
        b=Q6EDR8K68+KCKx5Curhmc/ka+8WHnhhDy4m8fZSqKJNDYq2fxdrsGdeP/QwcVCx0cn
         CGBa4SvQMDeJIMgBOoMmp6SQoVVXcRd3Etl7gGaAevStqJefidH1PwAaNBqZFTuCd/sm
         N+fc0VNx0JlxRzyXPA8VuUuSIRv9bunHCVNj1R/8ZJZVNiZec2GBEV7KqBwt/JYOUaxF
         SRJqi03jL1z5tGh5WIlvx9mDysZIo2yEc0pjqhylFGSo5SLf/kI+G8HbIEamVBax5F2X
         ZNx/jpGx6IAbPcBHpSy7TwhtIhBg3g5hwCe49w2k2+Mg0IIGtVJur8iVa82wXraD96yc
         YPxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790252520; x=1790857320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bkDqHG9FQUeGbwC5soK6us7Sx1oxX72NgwVfnkQyDfQ=;
        b=ePhEyO2tW/V68Azdc1SrOFp8Egk1JuGFNZrprJGBOjDuUNXPzVfsrijDB4CY6IXq4q
         BEIxFRZ1m/nKocoki5oPe4qRwWHCqwgkl+39McIsMfxU6aQdyPi9+VVJvSyFYfct8MZu
         v6UlhBteJLmY9LIlCHaWz3AvEzgsWnmMME5ZpwG1K2NDgDdwNL9ho75gZmsGSbUkGHPs
         xdktlGnnTWTUtRJtJviZo/Yy06ckRfVFYi+G05IWtUy0JKL84NsDvjEnVPrmQ2uAKv2g
         98HBVHPpRHbv/HtkybjnoU6jFNV7SuS3Oe/B0dRGFTiCemfEfGyc3QNgrbUscrbXNNo/
         hNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252520; x=1790857320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bkDqHG9FQUeGbwC5soK6us7Sx1oxX72NgwVfnkQyDfQ=;
        b=SgA8DXn3TREZFTclLAOafeQVm4lsvOmO5CzY2V8VMUHpQ/p2C6pPuX0gqd3b75fVZu
         gy7UEqsolZm9gx2C8SD/nouNm3T/hL7iFXvybx6QmEo2bJKGTF/bh16PElV994atYhn4
         5NTX+wsU6dCPqubj02Cal7+fnItH7x7+QEv/SJ3nF+LJIJwn/qocR7316JWDuWURv5iG
         cC2pcSOBlUTjk6JCerIMU9vlMlsSmuwHQuSGGHpr/1EvQ0g/mCBE/8bXfiv6fMbKSC8V
         68ZkO5NddAjmUTiApbHNTQ+nfyrruOP73FDTHxgVBtxIjOXdWUNU0DGprMAXs5/SYzGe
         0RLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8jkC6KuKGE84t+733PvUC5cR/Gai8O/5zHCxLYr9MT7crp83i66bsOP/iLdncEdmXPJCx1XbFGSeAYSU=@vger.kernel.org
X-Gm-Message-State: AFuF++mza9MfmoJLKlxrc0jMSay3TEhWKgAiwJwV3W04/Q990hs7bUkf
	NifPMuktrXML3MAGf1xvVrlOgNhtABJ8IZ+jydQBpfzWQwsP/+TSPOjydw2pi7M3nNE8y/G5f3B
	PJQXqoV71yynyKTKEo53mtWxF12m8p4c=
X-Gm-Gg: AYBFou128n6/QvH4iMmCPTA/UIMoV5hJUCRun+uA2yoK8Q3Rwm5KeNgMfFDRlvzK2rS
	YsOEFsFNdKvlKhBfo8MJdqLLO1OZLqNFgel7u3ZMSVDZnR/RcsYL4qGI+YJZ2QjBFFQm9qIj/iV
	J3O5OjTUUu1wHLKNfzpdmFbDHnOtaRyjt3aRJiv7F4/ksq2m5KAZ62PPco1DKJvLQ6HaEQhLpzp
	FK3hXbfEO+YurKJu5j9cvXYYl5xa/9D/J+/0nHb1eV/yA52eKYKiEBEUIrV89JHVHowA6RRmCi0
	1snE0ts0koq+bNlvB/XRASB/csRi3L1RLE3uNOTwBpAwiBIIeG5soV8Eb5Ryd58DEK//xqSprMu
	lHSL6uJWE0kraiVNrbBr/5uqnt02Bn6RRL1D90ycPuEA=
X-Received: by 2002:a05:600c:468c:b0:49f:bd3c:bc19 with SMTP id
 5b1f17b1804b1-49fe66f4cabmr36315625e9.20.1790252519986; Thu, 24 Sep 2026
 05:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-4-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-4-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:21:31 +0100
X-Gm-Features: AclHuK-O6h2RuWBPz-mV7C0IwMn3AQUXjZUOx9GCiSmdjH17BlohJmlvE2MoUV4
Message-ID: <CA+V-a8vicb6j9MAU=E_AxXr8JV3ERZGUz4TBWVCHD6nS4e-yzQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] PCI: rzg3s-host: Drop nop instructions
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:54=E2=80=AFPM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the RZ/G3S PCIe IP variant (which is similar to those used on the
> RZ/G3E, RZ/V2H, and RZ/V2N SoCs), access to the PCIe Type 1 registers
> requires setting the PCI_PERM.CFG_HWINIT_EN bit. Since this bit is not
> set on the code paths where rzg3s_pcie_set_max_link_speed() is called,
> the writes to PCI_EXP_LNKCTL2.TLS are nops. Drop them.
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
>  drivers/pci/controller/pcie-rzg3s-host.c | 5 -----
>  1 file changed, 5 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 0ef49bb5ab1a..362aa923978f 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1144,11 +1144,6 @@ static int rzg3s_pcie_set_max_link_speed(struct rz=
g3s_pcie_host *host)
>             remote_supported_link_speeds !=3D max_supported_link_speeds)
>                 return 0;
>
> -       /* Set target Link speed */
> -       rzg3s_pcie_update_bits(host->pcie, pcie_cap + PCI_EXP_LNKCTL2,
> -                              PCI_EXP_LNKCTL2_TLS,
> -                              FIELD_PREP(PCI_EXP_LNKCTL2_TLS, link_speed=
));
> -
>         /* Request link speed change */
>         rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_PCCTRL2,
>                                RZG3S_PCI_PCCTRL2_LS_CHG_REQ |
> --
> 2.43.0
>
>
