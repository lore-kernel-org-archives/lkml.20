Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0408D52B1EC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083535; cv=pass; b=AY0ehQpxluMPVh+g7QEgfo7Ub5MBqqedkA/2vlxP9DvPBh84N/qlYbuPK2OHO85eSRtqpYlWel0newXTLr+E/QNpcN/h/XV1opOxue0di+Xe0vvVQFAKAbQmvV0RrHuL3ZUmvxaqMYHM6B1gXpb95mXyBqoBqH9zQPC7h/6gMxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083535; c=relaxed/simple;
	bh=4m7SBHHakRxvWRxrFM8W3RjKHQwaQaOVYLNHKqhxYcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHhfhS+OKP1vt83+yduxkQoWLx65ahe81+hv5cDgpfR4m2b+L9wW9lq15DHBDbACIQSLYzBNQ3ZumDtepB/Ft4dERjsn471fAelxBQWuCwgtoeVuTncZoYkr/fXoVTG6uKpX/IAumeYkhVGnGJijEQ5IWlVRzsQjmNl9Cnzu/eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URfS4aql; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URfS4aql"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ab395abf79so44909697b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792083520; cv=none;
        d=google.com; s=arc-20260327;
        b=b7OERMHnIIHAZpMeT0LZKKemvbq+vVh1E17CFjwQ6D/VZS+zGiHwt1X86SOE1WKXaA
         zLOjtfeGXdrVpGrKJDEJfS2R9w5hDoFiCt1BZqCSHTQb1Pe/p17lEghS1Miifd9w8l7B
         oL9wN9NOINxAr9wMAdXLwvuTRSVJjoJKxEhtXCTDXrjyW0ZCiT5wHrzFUBguzuSXMEXE
         XfT4TILG6Ya7wa4C+MdeuFQMVl2xJIPfRKj8y0hmBl1dyssGQVacz1lW0867N9iOXXPe
         DxOrZFrGbzca3t+cx0c6nY4IpW4KULjLfcGFkEjYgWjJEgB4Qp6HajZ55hWhc02sjYOo
         FcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        fh=YFVIxaS+wEtJU/o1aK/+pEuM+f7A+qmqIgSd9PLAW9E=;
        b=UxoElDmvGqVwAI1ps8FBhBiqZ8Jnm0A+BszgOD7uLCc7zVg5i9TG4RKqKtqQVrztxO
         ChS4V0EtYMZmKe4R+KqW7U+vXa4erhqYZelpIdOH+JekaHaQTQHf9JS7WdqIw8k95Oo+
         BrCcBtbHmXH49c/Z/Z48i/xGlQM2w+OqJ7ZMSuTZJRvQYZqLRC6F42vOdgCPwPY7sUKg
         AAI17HtqSi/GvVFAzq2r7G+0hCM25SFfBydmtS98K89JFRmA7/5wkMkBJMjxe2YOuL9L
         qcbVbr+9BSiz1dBoiiToZ9iVBjqGwH026aDe2Z0hNcqgx1QePfTcpQKx8ikk9dFKCcI5
         JF6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792083520; x=1792688320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        b=URfS4aqlAzPZx+z0yG/kn68lj30DWGRr7UgAP11G2+3dS4Kr9TwyoVn3H6JroUu4+8
         RtVRw2GE/oMgw6+M24wJQN6GZhJJ9SCzhG7EJAW6O7ZgVCf0NZC79JHnznQBzWt6p/HE
         xB+IITysDqcxQFqQxzSEJdE64Uineo0eFROrOCta+qUnOuKFcFDnhHl6Xng8lmODnA3N
         SRkbv8FtqlyzK3/1fXi4M4d6MW3G8LDOOO/AGlB11wIUrnSxaAGDV0WIVXvEAAXW5EeJ
         bNMHd4oM/c7LRJiC9zV0AOvOMtuAQlaMB3mNCMHdWd/mJ4OSPPKSr4XjoR2KUaJd7081
         0fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083520; x=1792688320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        b=zWAfq9zi3MvCNudSCfggSQMSRXoOx4CQoQjmsOQu3pb+lygvYDoIpG0Um2MLPiIXoZ
         m0X/BOih9z0263IOPcbg6UsiKDorIIROIo5v+bz5UmgPIDDmEx8C13tR2PZxMGT+f8+H
         ngV6LXP//ojbCrTctValeUEekFUT3ZXmQQzRcD4E7wDchPU3oi/Q/+d61l077NVSEUxK
         nKbXlbWHnEnF27bbsEArIGO71VcP4gNqrXFHaNeZcsDFShQvdazzJgzMWScw+qSS4ff8
         uQ21Ntckr9G78DZLL8LLvyJOjtIAM0mkVI5k5bB+3fOLpHtr7g3wrgt2L3pHhad4vXvk
         +6Kg==
X-Forwarded-Encrypted: i=1; AKwUvBwL0fPPctW1MUwgryzkrmDQU9GnPX/AUAJN/hhIp/MtKK2Dj8bGak9Wl7PVCLqaGt6tE/YGd2XaTCEgEfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7bR+m02vgKa01tmgirN8YMEJBPHjnatnHXZQtO7F3sjpl22pp
	G4GYy/HiwpxJl5vPkccme2Z/wo3PrM3hYCqPYXkI1jbYhIVwPr360dh3b34JVeWSSpWZQeEwGpP
	3ytqY90PaRZTAOZ0oNFO5ocXEfm8Ue/0=
X-Gm-Gg: AYBFou2HGr/JlO/dOiANNGIwLdQg0/W64zORx6qT/yWN5G/q8Hq7rgmJBZ8qtgmOFqH
	vhhMR9exz3HcFlW6MM+zOMPQiRloFMQNEkG1JXS+ZoL4hCul0XHQ2DR0+qNDSzhk1/+NxKdmQZs
	7Ij9wTQGNqN9AEzA/VIA2jpPynhsRXRsl74Bq8L1hwfzubJ4HCF2RqKBktokoqeLP/9jBMP1lCN
	Ny4vD+lO5z4H+Zd9FThfOBfwzsnSI/iK3AGXypoFsFJn4JFHUaRIyT+bhAjxWRtdOM8XiP7IQ20
	N6G7vUGxHh+Cne2myDQLDR3ODqsNuIcVchcg8Vd80roBj5ADPQLLdxm7
X-Received: by 2002:a05:690c:4006:b0:8a9:9f40:24e0 with SMTP id
 00721157ae682-8b07edc853bmr64426667b3.14.1792083519586; Thu, 15 Oct 2026
 09:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org> <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 18:58:00 +0200
X-Gm-Features: AclHuK9x9oH7LPEYYVfq-eVNh1cOyJug_mdtxh9957qtgQ6Mf8exPEfJOQrJddw
Message-ID: <CABdCQ=OFZw+DnejaF4DothYGX=u=pTEgc3Gru09En7ApWHpCLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: spacemit: register pm domain auxiliary driver
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Alex Elder <elder@riscstar.com>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested on OrangePi RV2.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El jue, 8 oct 2026 a las 4:58, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3:
>
> The APMU (Application Subsystem Power Management Unit) register region
> block contains the pm domain management capabilities, introduce a pm_name
> member inside CCU data to register a pm domain device via the auxiliary
> bus if that is needed - if pm_name is null, no device is registered.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu-k1.c     | 1 +
>  drivers/clk/spacemit/ccu-k3.c     | 1 +
>  drivers/clk/spacemit/ccu_common.c | 4 ++++
>  drivers/clk/spacemit/ccu_common.h | 1 +
>  4 files changed, 7 insertions(+)
>
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.=
c
> index dee14d25f75d..9e2727521916 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -972,6 +972,7 @@ static struct clk_hw *k1_ccu_apmu_hws[] =3D {
>
>  static const struct spacemit_ccu_data k1_ccu_apmu_data =3D {
>         .reset_name     =3D "k1-apmu-reset",
> +       .pm_name        =3D "k1-apmu-pmdomain",
>         .hws            =3D k1_ccu_apmu_hws,
>         .num            =3D ARRAY_SIZE(k1_ccu_apmu_hws),
>  };
> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.=
c
> index 92b930d5ff30..e895d3ee6a28 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -1449,6 +1449,7 @@ static struct clk_hw *k3_ccu_apmu_hws[] =3D {
>
>  static const struct spacemit_ccu_data k3_ccu_apmu_data =3D {
>         .reset_name     =3D "k3-apmu-reset",
> +       .pm_name        =3D "k3-apmu-pmdomain",
>         .hws            =3D k3_ccu_apmu_hws,
>         .num            =3D ARRAY_SIZE(k3_ccu_apmu_hws),
>  };
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu=
_common.c
> index 56f3d081857e..38577fb7776a 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -169,6 +169,10 @@ int spacemit_ccu_probe(struct platform_device *pdev,=
 const char *compat)
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to register resets=
\n");
>
> +       ret =3D spacemit_ccu_aux_register(dev, base_regmap, data->pm_name=
);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to register pm dom=
ain\n");
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_NS_GPL(spacemit_ccu_probe, "CLK_SPACEMIT");
> diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu=
_common.h
> index 8691698e007d..221a92117b94 100644
> --- a/drivers/clk/spacemit/ccu_common.h
> +++ b/drivers/clk/spacemit/ccu_common.h
> @@ -41,6 +41,7 @@ static inline struct ccu_common *hw_to_ccu_common(struc=
t clk_hw *hw)
>
>  struct spacemit_ccu_data {
>         const char *reset_name;
> +       const char *pm_name;
>         struct clk_hw **hws;
>         size_t num;
>  };
>
> --
> 2.56.0
>
