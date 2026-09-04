Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4E549EC7F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530138; cv=pass; b=sBa0FOGSFTOeTTiOJfi/HuHNcAx7dWqgpc9f16WDdIXiUhK0VYLcdBL0wNQ3u/awwdqTJ0ukclwrHJ/O5q7wkZCao/0uYkeeKSuxWbdcyhRfu67B+/cs2g9edvXaJwm7JEzjkw8oYFMKRCtNQomd5mcgo/JmLLHjFWPrmP8O6ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530138; c=relaxed/simple;
	bh=aYGTw43PGiruYrbCRK8lrDyOCcUgVMqsAo0cR/fDfeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mfw0ljRzhjqfTFEpT+fNIpsqFJb1nAK/+fCXSRYoyUeOGnhJh/ZEOlTUheyzzzaBrrQPAPgRGgk6wdG0HtdAvf3ADnOoyY4rJmWF0saKQ5p06pDqAPWOqzDUI/YVgmo9CCMKpDQo++dYrU+A+G+GOquKw3p3fxRSnN72W6ZMCZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCxxW9q4; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCxxW9q4"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c253425b253so149005766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788530134; cv=none;
        d=google.com; s=arc-20260327;
        b=iSVqa04RmeXrl6PyEdtKg43x/iaibyFI2QpxH9xOBQFcR3Id0rAs4lAMykfx8y6+2r
         cyXS9qHLFVAuL3InN7tEsIjKNXvBkozqArfTCV3rl+CG4GHpXqzqaeZbXETNC59E3LJP
         m2rpUs2Hkgd5jzlJmmr6Ed6zo1UI76lD6H2HoH7fcnz79y8SPQxyULx5lYDUuLEb3gqW
         EFU2U3BMhcnQseYehTT0vyG6nLzLbiBRBmJIdD9VyYyrGOLAMUmrJLvw91WFmd7ngvdt
         XqGd7swEuVUW7LfZUbRyR1GfUQowPy2bqopk02dPM4IMAGx8U8STFZAlA76wZCwJTw5d
         7KoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        fh=Tc2aU7sn1ACARzCmAwossSklg5yWchdPwKI1scMoEwA=;
        b=n7YHJcNrY6topi2FZTQBjNzSyU5PfKS4sRdG2S1D0EiFkIGsjWflmab6N2jjMgycvF
         rlvjZD+Wiw+aFnMAsxVDQVHv9ttmTc7Qe6KIaojAs8XKnqcznnQQBdu8ihD33ih1xt1z
         51wGNFnKQB0yx7lnpwA6N7HrCJ3b9nqskD7dN4NdovgeIjoGM/EQLW2wDZ0OLhPm2RGV
         xnYyivFW9RBSj7PABDgbAQeA+lo9g6tj51GI5q/NjBCIW58Nvs9tikujUoBj6AfB/Z9t
         pJdl8+kVH/bz8G3e9+WF+ji/BdCicnTKRKLEAJ28OfargbE1TB57YNo2e1wNPfmy60+m
         XyNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530134; x=1789134934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=kCxxW9q41x6acDRBBZDVjfyTyqKRt/evee3/RMJ64zlf6SHrFgHtykPwYzwvAi3wVJ
         ZRIv7vOTkQh2Lr2n+smSk6EZDeGERL2XnUVdkdmbijX3sIq8nHQIT4bwdKQG9VlBvxBC
         8naCTVcUFcfSQHMrBLpJQGzu74JQ2aIQws7AXtvIxc14zHervNOo4KbpAp1FFOqd1BDh
         8sOIjGi6BVaoHydFmTO+nYefEIeAAEsXLvyc/0L2/jipTutRInYXfOINnr0YZQVJnXHl
         C2LFuM/tqHwSMwJQDQ8c+FIBz7PMpJ9MUu/9P80i1Y2oORNVkVuubgrLsPndLlRYakJI
         4DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530134; x=1789134934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=b/TynHbLuq4w3Z6SMZlg5wRlM4hBe9aCf+37OR25+HZwZLIYuhE5Np6fg9JbvPLrpe
         3CKJ592fqDPp7+gkguScJ6CzXwMx6MVyuRY4snB4FmcGhyQTuraVgAd60SPsn4Al/sTH
         KymMYoWEQVmxUBzWqNsw/Gwom9x7feJFt3whY+J5UgwcP8ltecGHHPSkNiORJ5rpTHHl
         QoAYnNA/uWFNsn+tU9Q5HAzc9qpuW8uh+Y7c2X/8zd5fSbUZbAmMxLb3hJ/3DXGBOWSG
         8oXPLgqY5x3Sjz3kUIjFbC9dTsI/MOdpoyhXEv1a74VAXIkt/cVaLPnlVA1u0NYOl9NF
         iakA==
X-Forwarded-Encrypted: i=1; AKwUvBynS54ntta2pO+d0av8nKqtZztNCKkXzolFmh+NspeIl4cDsGr4ks02jKQLHJfRHC/bOupIJv9U4c4Zev0=@vger.kernel.org
X-Gm-Message-State: AFuF++l4IAiphggz8BgVVN4zMooaKtsRNIA2jce3wqY5wTjRal3N2Phm
	GF64vcHLUv6+xXgll+sZdbDFdD+VcJdsskg4JR3Lwdf7jY82is6MNUnqXu2BSxACFtqOtb1kfLG
	eMt5ZfK4qO86KRUVGr2fR+n4ATdZbPfg=
X-Gm-Gg: AYBFou2JjMc01dC3VDunzEolot+tY3rwxtCA98DHL+DHSixVT+z5Pwf9a0ueFLoQrKz
	M8Hp5v0cqBNzwOkigefdKHq0zUztZwpErbz8/BUgmZJBSfYy5mV7wMZtYyTYWsUfZAITMorXB+a
	l9RTWs1ZexG8V6HEoNQxN9AGztPGMAg0LbCxSN5qKi2IbySaumQNL1dwpUgXYQBsQ+7zdYJthSw
	/AZfuXYdhhd9Yoqi32PeIU7rPEEmlTEBsQPzMKklcY6b/QoKi6up6da96RxVuPZTB3kMlT6g7Fa
	LjZqVr3ZbPMimtxe10a61M2bMhFt7K5DX63FyAvfzL3iBiSMhwchYY6tWzrt
X-Received: by 2002:a17:907:720f:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c260c8c21d3mr311924666b.8.1788530134042; Fri, 04 Sep 2026
 06:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-21-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-21-s-vadapalli@ti.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 4 Sep 2026 10:55:19 -0300
X-Gm-Features: AcwNN1WkMLBcSKjjx-549nVRZ1ZETkJHm5sDyQYa7o61EdbIDExabOintEMeFfo
Message-ID: <CAJq09z44PfcEKsoH9eP+c5rxmzQ52hQO33k8sO-e6po1bpE6rQ@mail.gmail.com>
Subject: Re: [PATCH net-next 20/33] net: dsa: realtek: rtl8365mb: Remove comma
 after sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, alvin.sipraga@analog.com, clement.leger@bootlin.com, 
	justin.chen@broadcom.com, dlan@kernel.org, rogerq@kernel.org, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	opendmb@gmail.com, andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, 
	amadeus@jmu.edu.cn, kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, 
	horms@kernel.org, vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 4 de set. de 2026 =C3=A0s 01:39, Siddharth Vadapalli
<s-vadapalli@ti.com> escreveu:
>
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/net/dsa/realtek/rtl8365mb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/r=
ealtek/rtl8365mb_main.c
> index 4c305756116c..f8220d832e46 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -3352,7 +3352,7 @@ const struct realtek_variant rtl8365mb_variant =3D =
{
>
>  static const struct of_device_id rtl8365mb_of_match[] =3D {
>         { .compatible =3D "realtek,rtl8365mb", .data =3D &rtl8365mb_varia=
nt, },
> -       { /* sentinel */ },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rtl8365mb_of_match);
>
> --
> 2.51.1
>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
