Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6907395266
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790552969; cv=pass; b=A/UgvSyd2MbaLMIOuuiL+jT77/BFBtHfmHHoXuFVMHVkbXvWWQtvUguVJB4wZ+CTT1BtZcNT0LyZXZfcBEusCxgi4G6St6fYCwqTfqNng4+Oj745RgHy4G3qmQOSVU3rvUgVoCSLkgiXtybzPK/nWtPFMKIQW0jhnJeHU/C2d8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790552969; c=relaxed/simple;
	bh=aj5nUGzscZlYh9Hwnq0OGDa+XHJvROniWRXccwlok3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXC1peKFdtVPtKqFMiCATmqTwSGuraneUBmTBCMwP9ddTqpB5mzyCgNcB0l4nabS8eXoeFbBOirciRkeFGJ0O58oHPmHsaRSUjrjmZzwwkZsv9s8vv8664OpONFNYzjvEztKzU41x3MfAMTxYm/liPnTPc4TdS/vR43t2P979h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzA9Nri7; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzA9Nri7"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so3158927e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790552965; cv=none;
        d=google.com; s=arc-20260327;
        b=RKH1OMrre1YIHf2fygTiDes/xjuASr8bht9tq639j2uFCMMpfpya+3+Y2MntPBFO7s
         /ANfQVse2qoyJ8n4jRWABIMSN85ALb6rc0+9GMsm8EcAUZKH9gzztYiaz0SLegt9Yzoz
         L+B1PxkLmiCPrM9W/eIzukwtdzhXamI6Mc7IjgM24iMB/GX9SKyaS5y+wDetjK01n2j7
         k+RzsEQrtjK49ltVE5W6Trb+bNvSlMrl78odky+7ZG6OdwfjcA+XnBe3R8fM+qTeoHL6
         7+nf37BHPmyiDNRU2SY6ybshDhsX6zeFwMCs8pAe5gEUDYS1FGtKVXrgT/rnJt2x4nA9
         y5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aj5nUGzscZlYh9Hwnq0OGDa+XHJvROniWRXccwlok3k=;
        fh=a+mrwjTKNvMbL4DEvuYtNaOmSH3R4SW+Qt1HEcp7xMU=;
        b=FHN8wVHf98cEgiGxAK7xLjDkARAisaCuN0NdU4EsxI8YD2vvUqPOZsyCCVtKgNMgGz
         v/5cXOo42ksOPxZcOihMmUj4bSgDWDWjEBmkfAsZX0vtDNYRi24nEOxgnJFUsdzhhv4I
         xXRm2ifkeLtM0kR+PAqk5HDiZzgRam6B3tm0ZxLPSitgdpKlvIxbGFDEKJJy+UwEJRwa
         ROqN4U+bhDGspuwHgBCH6fko89onaIIhhDo0NUFqw4cspgXl+U6D8qz28T8jlI2WiUlH
         xDQ+C20RqmSdTBqBF6TS5DYcHS22b4SfllMFiQ9VW/XaJgFU9Uz+d1UDvoTxxBsTL9Tw
         dY8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790552965; x=1791157765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aj5nUGzscZlYh9Hwnq0OGDa+XHJvROniWRXccwlok3k=;
        b=FzA9Nri7T4U3IebPd848HcP6cigfKerJRhb7sIEg1ErKjSZH0l+K+urJn3jmHecBom
         IVWYc4Oj8iXJpHYPVCdheYnpGSSquFASMnrHIJRkLnlKVI/QYY95QgrpOP2EmMgHb50L
         TzIpfayItHXkuKymhDFfR+lPSTOVzNj+kyYsrkib4TAohTyKVsTtiqSOhkfGuWkXOz1H
         RbTYzok96Z2U5FI6K1ffqxl19gHUJD3jLV5Tn5MmADV5cv0gA23qJSzQQ8J36oo1tm1P
         baGYda1HJzLfB90K4O0fzC3RhCbk3hMoFS0rs89K02Zn1DavNTDqpBDos9dhRRnksjD5
         sLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790552965; x=1791157765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aj5nUGzscZlYh9Hwnq0OGDa+XHJvROniWRXccwlok3k=;
        b=nUQYj87S7/hfvr4e2OVs3/6L2xsDMzqrlZV+vpn8zBe/Iv8t3Lx++jWUDybtXamdbU
         oKz6uTxPngv1cSU+F+aSyk5V3iyq9vLi3SVRNrfLIuGMthSYoSllyyFLEa7y3ARWaV8Z
         pbmWVaWgGyX7M7JFEclm5+ZXqH/a6tsxlhW+QXchiX8NAr6PcKQcx+qQ62IhDtkb2JLo
         Kjydoiczr99fH7eurQK4iB7WMwNXzn2qpcTyh4oWhlACvE8Gj5WGh62P/Rp0r7n7w8I8
         B08orIOftvznqw8DUFqP4lXgonJ1X1XqBxyECAwa4i7uhrwCj7Q4FKeLD6PoD0ZmpYa6
         sDag==
X-Forwarded-Encrypted: i=1; AKwUvBzNATrVNI0i2pmPNX65Le2r8ZeOZrkbc+a3+OCOevyXQ+mFG2AfMhtAzQZ0UFcRdyCq+/V36sBVImphXcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLurKEmZr0wn3FPVfi/EaC8QlExegpLQf7k9dhWQoUt7f36K3SC
	4NM2wb5yPik8hupre3BtkgPFdpNqQD6J1J2I858xiXUKizKJT1jTzwgnnXdeCqEFP4xFr9pZlkp
	jQsZ1JgIY/Ygntbmip2YCXZGVo6tSv6k=
X-Gm-Gg: AYBFou3brjuKMnMdceKwx5mc39ZfavwS6o9S3FUxkTdW8QZcplpN+vCPtAognImvk4A
	OB9maiv0JQKFkC7SZdMEU3uhn+3FESjktEGSoP9q7kT3o+I9lBTrdergPAVQWXOOaw9u1x9oqwx
	RpehX0mxxM5yL92FnlHCoXTmiec3MAWOP6/Vuk68bZ9uFw48ZS3vLb2EF2X7Asfis6m3iUdlgjp
	XKY+ASPkodF+FpoBhTo+b8cnA96PzUVbmxN1wqjgCBuvaJ7onBjI+1ntHkD0OBjJJ2HQA8V2U61
	NJXj4IOkDTXZJqrQ1eyS7c/IYwwDDdIsxXIJFVLufabXQe54LwoMN6mFMEjUhde/y6heI2FrRuN
	Q56xv+CQt4ytiUR49hGL+QYaqUs7AgxOIY/LBf3BUt32tHUbGd9uicALddGPOXmq3rIYjZzq0Cg
	1vHcWmjsEOat7LmKG9AneBEB/iUbe5EemLrDOZTt0jCTZX
X-Received: by 2002:a67:f24b:0:b0:784:a925:3f0c with SMTP id
 ada2fe7eead31-7af19524bedmr2659589137.0.1790552965528; Sun, 27 Sep 2026
 16:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
 <20260927-submit-stmmac-reset-fixes-v1-v5-2-feec6c14dd06@gmail.com> <CAD++jL=6Ov5BPK1naX6orzMsrJPm_g6SkdRaU6Ji+okXMFaZdQ@mail.gmail.com>
In-Reply-To: <CAD++jL=6Ov5BPK1naX6orzMsrJPm_g6SkdRaU6Ji+okXMFaZdQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 17:49:14 -0600
X-Gm-Features: AclHuK-WcfEa6FiZhcRlahLtNjX_NT7F91zfb25DNSpArVL9Tas2WI3NpVSANt4
Message-ID: <CADvTj4pU6EXgx1-dupQoQBm8OrrvAeR5NyCk4of7zya2V=yvEw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 02/19] net: stmmac: request the MDIO reset
 GPIO only once
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Serge Semin <fancer.lancer@gmail.com>, Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
	Richard Cochran <richardcochran@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Ong Boon Leong <boon.leong.ong@intel.com>, 
	Voon Weifeng <weifeng.voon@intel.com>, "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, Yao Zi <me@ziyao.cc>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	"Alastair D'Silva" <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	ZhaoJinming <zhaojinming@uniontech.com>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Ding Hui <dinghui1111@163.com>, 
	Linkui Xiao <xiaolinkui@kylinos.cn>, Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 5:35=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi James,
>
> On Sun, Sep 27, 2026 at 11:59=E2=80=AFPM James Hilliard
> <james.hilliard1@gmail.com> wrote:
>
> > From: Linkui Xiao <xiaolinkui@kylinos.cn>
> >
> > stmmac_mdio_reset() calls devm_gpiod_get_optional() every time it runs.
> > A GPIO line can only be requested once, so from the second call on
> > gpiod_request_commit() returns -EBUSY. devm_gpiod_get_optional() only
> > turns -ENOENT into NULL, hence the error is passed straight back and
> > stmmac_mdio_reset() bails out before pulsing "snps,reset" and before
> > running the STE101P MDC workaround.
> >
> > The first call, made by of_mdiobus_register(), succeeds, so the failure
> > is only visible later on: every resume that does not use WoL goes
> > through stmmac_resume() -> stmmac_mdio_reset(), and that caller ignores
> > the return value, so the PHY silently stays un-reset.
> >
> > The descriptor used to be requested exactly once: stmmac_mdio_reset()
> > resolved "snps,reset-gpio" itself and cached the GPIO number in
> > stmmac_mdio_bus_data::reset_gpio, and commit ae26c1c6cb9b ("stmmac: fix
> > PHY reset during resume") relies on that cache to reuse the line on
> > every call. commit 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in
> > stmmac_mdio_reset") replaced it with a devm_gpiod_get_optional() that
> > caches nothing, so the request is repeated on every call and fails from
> > the second one on.
> >
> > Parse the whole reset description, the GPIO and "snps,reset-delays-us",
> > in stmmac_mdio_register() at probe time, and keep it in struct
> > stmmac_priv. This is where devm-gpiod is meant to be used: the line is
> > acquired with the device and released with it, and any failure to
> > acquire it is reported during probe instead of being ignored by
> > stmmac_resume(). stmmac_mdio_reset() then only pulses the cached line,
> > with the delays that were read once and for all at probe time.
> >
> > Cache the request and delays for DT devices regardless of
> > mdio_bus_data->needs_reset. That flag controls the registration-time
> > bus reset callback, but system resume calls stmmac_mdio_reset()
> > directly. The reset routine no longer looks at the device tree: where
> > the description is absent the cached descriptor is NULL and the delays
> > are zero, so the pulse remains a no-op.
> >
> > Keep acquisition conditional on CONFIG_STMMAC_PLATFORM, matching the
> > reset callback, so non-platform configurations do not request an unused
> > GPIO. Also skip acquisition for a disabled MDIO child: registering that
> > bus returns -ENODEV without calling its reset callback, and the driver
> > must retain the existing disabled-bus success path even if the unused
> > GPIO is unavailable. Remove the unnecessary gpio_desc forward declarati=
on.
> >
> > Fixes: 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in stmmac_mdio_=
reset")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
> > Co-developed-by: James Hilliard <james.hilliard1@gmail.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Dostoyevsky commit message, I didn't read it. Ask the agent
> to be terse.

That commit message style mostly just came from the imported patch,
I'll change it to be more terse in the next revision:
https://lore.kernel.org/all/20260921015727.2643540-1-xiaolinkui@126.com/

> I looked at the code and from a GPIO PoV it does the right
> thing: use 1 as asserted and 0 as de-asserted RESET line.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij
