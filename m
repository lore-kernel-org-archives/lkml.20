Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045D46E00C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425739; cv=none; b=BOCCFGWbYgfGWkyFYhDvVEglvLq2v/Y/r5wmIv/2d6tkiTdhc0iFVIWjk7OoM7dkv/B9WRgg58BOyScc3yz6g1OZWDl2n+If26lHHtffayaWz/QnRenb5VoYyhxIPwKV2xZ07e6BfIZRBB4KTVA2k1PisLh3LFcP48e0Ijx2xuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425739; c=relaxed/simple;
	bh=YKJfUdy5n6ffaKk39SK9sft7LcFnAbfH3T12ej/97pA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PuyLfLhmHWOoFil3OYOpc5DLiYw1EBg23Cj89hNuVJK/BO/Lql5alc5phjjM6KBok/gCii1vkmzZ2nWmxzXRub7O+kjSy6bvpl5b8eHUbOW153zaJWHeEOecVno0tDOOmQdEYMF6cuIEdtmK8LNd/UQZJ6LUf3/JWYICQbn2/7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UjRro5D9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UjRro5D9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22257165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788425735; x=1789030535; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lSve4FkJxmYJyxkKw1zIr74/VC3uYwUbpdZi1aoEPL4=;
        b=UjRro5D9SFd8INEOr126MoDwl1jtOvp+E6FiNzMcrqm5KFD18HPXnw1KPYtyx4Zo1J
         H7RAAnW14vekCbko1DLx1/pxCkY7V5JW5b3CTNuFT4dAVw1SJIc+ANtdEIiqBMnUUu1F
         ah0sSHXZ0JaxB4BrFjMnoEEmek6vNAufCdwgh40/jpsJFSHQ5gT8UYEqzOMA8NAqFwDp
         oYIBEQe+gVW4zkK3PYjtfEvF/PJNhIkYCTzQnAe1y/zH2mJxbP0cR+1EnS4L+Z4M1SzA
         Vw8FkxeW2bpctaruOlBmaOIRm3NAARvaIoYzo8NvboOB4m3ubLuRedpVR9C0YimaJkhO
         ToDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425735; x=1789030535;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lSve4FkJxmYJyxkKw1zIr74/VC3uYwUbpdZi1aoEPL4=;
        b=YomwwzjfCLbixEwz6eJLfwV6+RWRgNJ6pFv+Dl34/dbEqY5V38Cw/MfkRGJIQm/NuI
         LCnVxjtT74u5fVFIJRFJ2JrYhFE4lRnyAsjxnI3OduS3efH7vZrJEhLlRRldzD0NpaUf
         sPbr1QPjEdYg6lEE3OgboZkAzSXkoDOkAvQVvHpstwohQo3TmMofUxmtUCGGjQSYCHgO
         eUtsZfNuuWQ83F1Sr7kddh4dQZxueBiObWiAp0apfN3BopB08A3zrMCpjX08UnWC/Bla
         Eatnk6ARNw98bidOVJXYJtxlD/0j6xv1C68erYjMzecT/QzmBo0pax61i3tEUcy8BZyJ
         1ktQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCn8unzZMe7CNGUzBsXH7gvPwR9AeJaRU3yZNdtMTQDeC0cMnjvHiHseO6p/bFL05sVsM89rfUHMd+F4c=@vger.kernel.org
X-Gm-Message-State: AFuF++lwCBzjacnjjtwo4trWQBKDOYgjmcb4vP0GCyF95oSzlJkxkNSL
	7XkXoz87WMLQhvKGcyb1IwiGnZOKz9tuxaqYs9w0BscIs+xD+jAQPe5zj69/6Yr9RN8=
X-Gm-Gg: AYBFou1rlVtcgv/41kSCPQQS7a2UGhJguOfuOxoH8hXRJhzsAFuIY4zjVOuZLrWdNcA
	2NsSYwOsknBUSQETsLNDTU+s1I2hPdiazhRB5Jfm/P47t6gVf2CKNV4iXM8oh5epUOU3pDVxxtr
	0j26iduEqN6BnKB2KOAJZgSIaD9dgFw7iJ1Heca43W283WWpoDWNENOlhCIJS6OLKuviVkLHw3a
	fyaTxr2GBxUmzXs1ZZWqEmbfBSo5ZA7KYdWNJR4WhBGBq64ui4KJTG62YpThgJRAJCz+Bh3XtMz
	NJOKa1TgGn3V3yTBkKCtMAw6L6SMTGQCRdjbyCBSWJWIitRB9uh26Dl32WRhBaQKyVA+ItPtNu3
	tBwHcNN/Pn1sE3jk63t0jfj7Q+hkwjLCgcFg0tPl+scuRW5VMzSOHnReAieDB91Od+L9+FRJJVp
	0eYstzhJ9QIMHez3kkDqyze/VgvCffKerUO130FAquYzwwFBmdlRvInRMk
X-Received: by 2002:a05:600c:a00a:b0:49c:f4e1:3135 with SMTP id 5b1f17b1804b1-49cf4e13cb7mr4646545e9.14.1788425734899;
        Thu, 03 Sep 2026 01:55:34 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm65075855e9.12.2026.09.03.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5beb2c8dd38bb5ac7bdc9d94a1236578ac7d8d30c9e1c9ad030b45675f0b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 03 Sep 2026 10:55:27 +0200
Message-Id: <DL5K0CZS9PDB.1HD8YBEQOUABU@baylibre.com>
Cc: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
 <vishalm@ti.com>, <linux-can@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] can: m_can: add ti,am62-m_can compatible with
 out-of-band wakeup support
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>, "Vincent
 Mailhol" <mailhol@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260902-temp-v4-0-3896f7d16ce8@ti.com>
 <20260902-temp-v4-2-3896f7d16ce8@ti.com>
In-Reply-To: <20260902-temp-v4-2-3896f7d16ce8@ti.com>

--5beb2c8dd38bb5ac7bdc9d94a1236578ac7d8d30c9e1c9ad030b45675f0b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 2, 2026 at 11:03 PM CEST, Kendall Willis wrote:
> In TI AM62X, AM62A, and AM62P SoCs, the M_CAN controller is a part of
> the MCU power domain which is OFF in the deepest low power states.
> However, the m_can pins are able to wakeup the system from states where
> the MCU domain is OFF through its out-of-band wakeup functionality.

There are m_can devices in the main domain as well. Does this apply to
these as well?

>
> Introduce the ti,am62-m_can compatible with match data to identify the
> out-of-band wakeup capability for TI AM62 SoCs. During suspend, set the
> out-of-band wakeup flag when the device is configured as a wakeup
> source, the "wakeup" pinctrl state is present, and the match data
> indicates out-of-band wakeup support.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  drivers/net/can/m_can/m_can.c          | 7 ++++++-
>  drivers/net/can/m_can/m_can.h          | 4 ++++
>  drivers/net/can/m_can/m_can_platform.c | 5 +++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.=
c
> index 16f80607e150e2ca2950616ff2c39b7aa13710b4..0788816d881ef8ba84ad5a84a=
6d2d3e60517ea7a 100644
> --- a/drivers/net/can/m_can/m_can.c
> +++ b/drivers/net/can/m_can/m_can.c
> @@ -2598,6 +2598,7 @@ int m_can_class_suspend(struct device *dev)
>  {
>  	struct m_can_classdev *cdev =3D dev_get_drvdata(dev);
>  	struct net_device *ndev =3D cdev->net;
> +	const struct m_can_pdata *pdata =3D of_device_get_match_data(dev);

The core m_can driver works for all m_can forms, tcan, platform and pci.
I think it would be cleaner if you parse this in the platform driver and
set it in m_can_classdev instead. Otherwise of_match_data has to be the
same for all drivers which is not obvious when you are editing tcan for
example.

>  	int ret =3D 0;
> =20
>  	if (netif_running(ndev)) {
> @@ -2622,8 +2623,12 @@ int m_can_class_suspend(struct device *dev)
>  		cdev->can.state =3D CAN_STATE_SLEEPING;
>  	}
> =20
> -	if (!m_can_class_wakeup_pinctrl_enabled(cdev))
> +	if (m_can_class_wakeup_pinctrl_enabled(cdev)) {
> +		if (pdata && pdata->out_band_wakeup)
> +			device_set_out_band_wakeup(dev);
> +	} else {
>  		pinctrl_pm_select_sleep_state(dev);
> +	}

I just noticed these are called even if ret is not 0, so suspend failed.
This shouldn't happen, but not a problem of your patch. But you could
add a fix for that.

> =20
>  	return ret;
>  }
> diff --git a/drivers/net/can/m_can/m_can.h b/drivers/net/can/m_can/m_can.=
h
> index 4743342b2fba3823819b9e2bc5b085cc0fe6d1e2..486d808bc677482acf446b145=
0c3a9b6b7405178 100644
> --- a/drivers/net/can/m_can/m_can.h
> +++ b/drivers/net/can/m_can/m_can.h
> @@ -134,6 +134,10 @@ struct m_can_classdev {
>  	struct pinctrl_state *pinctrl_state_wakeup;
>  };
> =20
> +struct m_can_pdata {
> +	bool out_band_wakeup;
> +};
> +
>  struct m_can_classdev *m_can_class_allocate_dev(struct device *dev, int =
sizeof_priv);
>  void m_can_class_free_dev(struct net_device *net);
>  int m_can_class_register(struct m_can_classdev *cdev);
> diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_c=
an/m_can_platform.c
> index 56da411878af0185ff9cc512e325137428a68255..ae2d89b65fe8da65b1ca73cbf=
80cd8ee8483e2e8 100644
> --- a/drivers/net/can/m_can/m_can_platform.c
> +++ b/drivers/net/can/m_can/m_can_platform.c
> @@ -218,8 +218,13 @@ static const struct dev_pm_ops m_can_pmops =3D {
>  	SET_SYSTEM_SLEEP_PM_OPS(m_can_suspend, m_can_resume)
>  };
> =20
> +static const struct m_can_pdata m_can_plat_am62 =3D {

I don't like the pdata name here, this suggests to be platform data, but
this is of match data instead. Maybe of_data?

Best
Markus

--5beb2c8dd38bb5ac7bdc9d94a1236578ac7d8d30c9e1c9ad030b45675f0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapk1/xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOE
MgEA8suKsDAHr3gSYHcmzdKhgj4B1EP8BSKlE5dnGrdEz5IBAPey/srPEYR3ifbs
3kCo0FftLDoUSFKkYXGhEArbs10O
=uRnq
-----END PGP SIGNATURE-----

--5beb2c8dd38bb5ac7bdc9d94a1236578ac7d8d30c9e1c9ad030b45675f0b--
