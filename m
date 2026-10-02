Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB6D47CA9D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934982; cv=pass; b=K8b6JC0yHv5qYAStRz6Ksk6Iy4xh1S/iO30XcG7TYoXKmfTLN9984Q2AVDI/CZIha+qdzKt+ymEC2fq+losoKzFxkA33RMOEUFxm931rfig3NkmXEsiixiasZv41C4CPYdyCkTNMhHq+ohwexQlhdHXdZiVC9OhRT1VyFCGqQzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934982; c=relaxed/simple;
	bh=PIV246cnJxiWld6fG73VJaAjdRohhc5UJi70mQZSenU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrgBceRGHkxITm8ShflS5KgLnun21RLMPeFnWUJ1gZOpYdu65pSK8BPSRskgcGXU6LTcPy8BmzgdmtLWxHjL5LZ6pdE3aNslWlWyI8htam8EbgMCO6To2z6Vl8pIgsNBUvS75DfpSLDeBe9tF/NC7BRQOJKyk3ZGdcWwZrvm9uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMf0RdAJ; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMf0RdAJ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso11778442a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790934977; cv=none;
        d=google.com; s=arc-20260327;
        b=swg4Ufbdj1w8keuX2cCTzbjwckFIl7c0GvnMVOvB51EoKSWpmqKDSzWlg3Dn63UijG
         TCh5liRRhDRKnxSwNiJLFJ1ZLg2tRsHKWMrQOTKf5JohFknhg82TbrVDXxXxhD3fff/m
         w1NUOTtjp2qkb92Mcl07z165t/BYvESTfB0dmDLldSKDVT3SDPI5HdGZE9HT0QtAUc6Z
         qiPb73yatHSRZKcHKs9+vOUYODcm1oNb4EDQPljhg67HZUY4eAFL8Wts4pijVVvVXrLs
         B6yzrU64kmdpvwOz0nwwu9LmMkuSOm6rTpO0LzupO1vJPIM8FDcxCrkeXDwLjA9H/tjG
         CeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+JwjfY/TTo9tiK2/DA1dBsTMGVjOohtHrYWOad65DM=;
        fh=voWKMsZ+Za0rBjOyMXNfQtNBqJeFlx9eyHmmxXn0Vxw=;
        b=F6nXKTC7ac3bU98kvyrPJ8NyD9uq+KAQDBooo839z/otmqUO0GxrnvNCOw/HPHhAeZ
         Ks+qnF7USueI1DoQqEIWLdzTlO7zwZnn5jy9jB33Ejso2DOH+gKVqK40hI5JtWf8hG1q
         KFk2AQ8lQqCygA+3ctHlINZaTspX3RS5iw6Y7pPrBDx+FWD5sRy+Zk91qWzlJ0Sh9Ma1
         zh5E6WQL0//vDJWARcdAdjPID6uNkWzF8Bic73Jv1bakhI8LIFI6ZdLMoBXIcoZIzhKV
         duXiD9LNfHK4TYXFsWACYs1XjWj7MugwPdrz+/8uP0O7Ie0rJI8zyGpTLL7gwPlxqjJl
         aGWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790934977; x=1791539777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+JwjfY/TTo9tiK2/DA1dBsTMGVjOohtHrYWOad65DM=;
        b=SMf0RdAJizkAP5vY3PKiQ1oa2Gp1hKvfieE8nbmR6iONyGZZMDfOZn4PCJ+vsSMYH9
         dZEIGvDV66W16pWAtdFE/O0/hAe8y6bslBa4r28yVIOZi9QbDUy2Ssji7Wz2jbZghjyw
         Jb3mjNVTsCx8jUKonpyZ7BpN9GDK6t3H9dQ8IugbVxKwGXLcAtHgwa+LWUqzHVk/rbYp
         QbQyl3yZ3Vw8Sbmc0+nDHiBYw9w0zBJjOevk1qpNmoabQsNEuQ5qx4W5WdSsd+I0p+kk
         n8+njxVVY9f55oV69VrsTrl1ohdmE0UB0+2SVBc96/IQzj58cXP45LFGbtxbFkdu5l7S
         lUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934977; x=1791539777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+JwjfY/TTo9tiK2/DA1dBsTMGVjOohtHrYWOad65DM=;
        b=tygodiYhaJMad/2Hi1dRKRUOBgTa/SutHyRoQsG81Ll982ZnMaK/o8cEUcab/hm48G
         vdbqqJoJi7LvHo7aftjQBjKI6ihbIQrKqeJGMWo7MvzSP51ehSrxZ0Cfcc/QDLzQEqj7
         NuzctsWcC+U7n/Gfti+XhAgYe9rDfMlbLa3yPgAkvLb1CVnCx1W5B0xX1u/GyFAADfVU
         +DIoyY56xNEPNW30fWDZrrMCJ8dgBn/6HywJ4lbdAv6mQuaJotrAGjiMMUDAy6JaiDgy
         alCOU92coROcG31hpR6DK6yA5Thmk+8Hw5Wm9ZDgW0M9Fo1g8Fuh7BloMZyFDUc7n4c2
         ppcg==
X-Forwarded-Encrypted: i=1; AKwUvBymXVPkmAGTPElRXU1Er2C1CyfcODzt6Jixp1Wk7a51rLPG9GgX4JEcnkFsk+zwaSPTQpUgyCkmOIFkPTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT1L/D7UvL5/m5VX8V6ta4k07F40L8n1/kyjnuq36axsVrBSLi
	kdj0zL0yIWn92yKsljWZiIyGonVIdGCSrpHidqcM3e4c6TN0qKwvdN02ap6TCNXiBGm+13ClSb9
	xdCEZyzNUuzvyY6AmTYNbl97w8u3FxwV8eb/k
X-Gm-Gg: AYBFou3XFCxVAqke9uXbR9RV7ECvS9hPcqYapDtNZUbUYqPKP13RgYaZbUN2Hv8bfsn
	9P/4SyGIPUCoYmWDl4t4+r+Kel6ocFaPpKPx02eR1ZSR39LKCQ61zrfEIQavHM5soHuyMdUD+G1
	VxP9xIWU9uMuYoPtso0NmkdwpXuvmcJVaoMKy4DGkvxza4TDzGxdbF7fis1Ng8JZeQEyNiSc6lg
	hH45vq9afXMEPYJNDCVDmmpepXk7EcHnbe17LI1hYPgL+bDy73hDnPYqw1Dmh9Vgl/JxJ+9c6ev
	PQEGbV3yds8TWZr1UZDjG7GmWCCO4+zKGX8Oad2XWiv48EHCRngd1Xl4gWj3nfsvp8olgk+DQ1y
	c+zqwQ0DQi459qGqaBohh7KJUX0fzoG7QtxYThrBkogKE6u63bMyv
X-Received: by 2002:a05:6402:388d:b0:6a9:dc6a:689c with SMTP id
 4fb4d7f45d1cf-6af9e301663mr1468421a12.22.1790934977199; Fri, 02 Oct 2026
 02:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001165018.415526-1-mattst88@gmail.com> <20261001165018.415526-3-mattst88@gmail.com>
In-Reply-To: <20261001165018.415526-3-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 2 Oct 2026 11:56:05 +0200
X-Gm-Features: AclHuK-C5xjbiWGgs7Kiq2X6uCfyO0MWm9WcEBM4-_0N5B70siILbPn5B04b88k
Message-ID: <CA+=Fv5Qxd9m_6EL9fO+u7QHtO-mh5P+yR9icpsUBuPZ2Q2Cv8g@mail.gmail.com>
Subject: Re: [PATCH 3/4] alpha: link platform help text to the alphalinux.org wiki
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 1, 2026 at 6:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The alphalinux.org wiki has a page for each system and motherboard
> covering its CPUs, firmware, Linux status and known issues. Link each
> platform's help text to the pages for the systems it supports.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 47 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index 920dd10e7df0..0fc61d986a7d 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -177,6 +177,8 @@ config ALPHA_ALCOR
>           memory coherence when a PCI device DMAs into (or out of) memory=
.
>           It is used by the AlphaStation 500 and the Alpha XL 366 and 433=
.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:alcor>.
> +
>  config ALPHA_DP264
>         bool "DP264"
>         help
> @@ -184,23 +186,37 @@ config ALPHA_DP264
>           API NetWorks: 264DP, UP2000(+);
>           Compaq: DS10, DS10L, XP900, XP1000, DS20, DS20E, ES40.
>
> +         See:
> +         <https://alphalinux.org/wiki/hardware:systems:webbrick>
> +         <https://alphalinux.org/wiki/hardware:systems:goldrush>
> +         <https://alphalinux.org/wiki/hardware:systems:clipper>
> +         <https://alphalinux.org/wiki/hardware:systems:monet>
> +         <https://alphalinux.org/wiki/hardware:motherboards:pc264dp>
> +         <https://alphalinux.org/wiki/hardware:motherboards:up2000>
> +
>  config ALPHA_EIGER
>         bool "Eiger"
>         help
>           Apparently an obscure OEM single-board computer based on the
>           Typhoon/Tsunami chipset family. Information on it is scanty.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:eiger>.
> +
>  config ALPHA_LX164
>         bool "LX164"
>         help
>           AlphaPC164-LX, a 21164A-based single-board computer using the
>           Pyxis chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164lx>=
.
> +
>  config ALPHA_MARVEL
>         bool "Marvel"
>         help
>           AlphaServer ES47 / ES80 / GS1280 based on EV7.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:marvel>.
> +
>  config ALPHA_MIATA
>         bool "Miata"
>         select HAVE_EISA
> @@ -208,17 +224,26 @@ config ALPHA_MIATA
>           The Digital Personal Workstation (PWS 433a, 433au, 500a, 500au,
>           600a, or 600au).
>
> +         See <https://alphalinux.org/wiki/hardware:systems:miata>.
> +
>  config ALPHA_MIKASA
>         bool "Mikasa"
>         help
>           AlphaServer 1000-based Alpha systems.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:mikasa>.
> +
>  config ALPHA_NAUTILUS
>         bool "Nautilus"
>         help
>           UP1000, UP1100 and UP1500 systems based on the AMD 751 or 761
>           chipset.
>
> +         See:
> +         <https://alphalinux.org/wiki/hardware:motherboards:up1000>
> +         <https://alphalinux.org/wiki/hardware:motherboards:up1100>
> +         <https://alphalinux.org/wiki/hardware:motherboards:up1500>
> +
>  config ALPHA_NORITAKE
>         bool "Noritake"
>         select HAVE_EISA
> @@ -226,12 +251,16 @@ config ALPHA_NORITAKE
>           AlphaServer 1000A, AlphaServer 800, AlphaStation 600A and
>           Digital Server 3300 systems.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:noritake>.
> +
>  config ALPHA_PC164
>         bool "PC164"
>         help
>           AlphaPC164, a 21164A-based single-board computer using the CIA
>           chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164>.
> +
>  config ALPHA_RAWHIDE
>         bool "Rawhide"
>         select HAVE_EISA
> @@ -239,12 +268,16 @@ config ALPHA_RAWHIDE
>           AlphaServer 1200, 4000 and 4100 and Digital Server 5300 and 730=
0
>           machines.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:rawhide>.
> +
>  config ALPHA_RUFFIAN
>         bool "Ruffian"
>         help
>           DeskStation RPX164-2, AlphaPC164-UX and AlphaPC164-BX boards.
>           They have no SRM console and can only boot Linux through MILO.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164ux>=
.
> +
>  config ALPHA_RX164
>         bool "RX164"
>         help
> @@ -252,41 +285,55 @@ config ALPHA_RX164
>           Polaris chipset. It has no SRM console and can only boot Linux
>           through MILO.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164rx>=
.
> +
>  config ALPHA_SX164
>         bool "SX164"
>         help
>           AlphaPC164-SX, a 21164PC-based single-board computer using the
>           Pyxis chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:pc164sx>=
.
> +
>  config ALPHA_SABLE
>         bool "Sable"
>         select HAVE_EISA
>         help
>           Digital AlphaServer 2000 and 2100-based systems.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:sable>.
> +
>  config ALPHA_SHARK
>         bool "Shark"
>         help
>           AlphaServer DS20L and API NetWorks CS20 systems based on the
>           Tsunami chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:shark>.
> +
>  config ALPHA_TAKARA
>         bool "Takara"
>         help
>           Alpha 21164-based OEM single-board computer.
>
> +         See <https://alphalinux.org/wiki/hardware:motherboards:takara>.
> +
>  config ALPHA_TITAN
>         bool "Titan"
>         help
>           AlphaServer DS15, DS25, ES45 and TS202c based on EV68 and the
>           Titan chipset.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:titan>.
> +
>  config ALPHA_WILDFIRE
>         bool "Wildfire"
>         help
>           AlphaServer GS80, GS160 and GS320 SMP based on the EV67 or EV68
>           core.
>
> +         See <https://alphalinux.org/wiki/hardware:systems:wildfire>.
> +
>  endchoice
>
>  # clear all implied options (don't want default values for those):
> --
> 2.54.0
>

Thanks,

See reply to patch 1/4 for details.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
