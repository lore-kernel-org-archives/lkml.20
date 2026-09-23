Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91BA4195A3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166684; cv=pass; b=JWDWiBGWCIbzowKjEyFPpjbf/Glo27oyAKMdPJ6cAvNjS+nacrItG2l2MvXHCCHyq9FYEY3S4Ko+c/nCNgAcNVOHjnegFPxg2BVHGusRue4h5c/h/Ud2ojGb1FwWFkgecPW1ERHq7H0/S7Mu/9bJGS8BSiafYk8EirWz/eK0EbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166684; c=relaxed/simple;
	bh=N5H/My5yGDkDx9/kp/ToxETnGGeoXC/DTFu6XXuB/a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=We2XB0YEVvHNt/LVKW8wXILGdvhsoG2N7CvpgHnWSrvM7iWAVLUaWmn+KcDjxQP/q66wZ5oi29FGlrEkFcV4GwkgYQTjLrJzmC6EiDY1mhsaZnYUxJFKbtI5N62GSunRUlXywjxh0y8yR1s4+3uWA+XyY7RIveAW6NvCX9u5jdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGLZtH4w; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGLZtH4w"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c29440ee0e7so49826366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790166681; cv=none;
        d=google.com; s=arc-20260327;
        b=szgxvIcRPQYOKq4Fj817tCLHwA+neS1XumQFOptT60ySh7DqVJATxJs1lzfeJANSlc
         dJl2ddN12NBzCPf9L0t/RWhyBcBnr7h7nFh5CQCpT1/FqMR04uwrHI5Qed5H7KfR/3Ng
         OR7DNw1MGGSw2mm5xauRXZBX/KRB3KzJ27H6H2wAjJq5fOkN+3RkmcNjAFt2+9KiEXFr
         uQblFfvdUKEtWKas+7d4CWHXpHzKWNlX8V12SesYyiFpSr7SmtuP3qE9dfNLJBIlz0go
         8FsN36ng3TjVIxRbrtoj+566SLCNr43DfFvknUXfe49JT34RfDxu3zV+2gpqddFMcZGZ
         zq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=geosNIRimRwfO8HRfTW0XaPt8QyFJOsPlxIx1190dzs=;
        fh=0Hx+dOnSHj8vr1hsMfZBlzgdYdm4XqEDnpoeI56vUOY=;
        b=ksYQRh5+9jXwN2s6EUG7Bjraide0l/A6aXrZhQJGaOLLM/9+cyuqwZi13s05HjFSup
         broMn1QFYXBzNn/bIjGPyzzOM0SszzhRS+jVeFOXlEvDKam7WVq8TDcSRt+AgXONL7FM
         4d0tK54D9tvBVWwUgcCBgUT/j8GizdbMeAbRrajMJPMT8DEYt64BeMnoJxSY89mhh0nk
         xK2wLviFmdbShdfZq7doqMOZjwOrOsV/a2s3jO/rI9x+eh68lMOxQhk1JPMXgmQQJrHu
         TzKDI979ElFLjRMwDS8DlyTDEm5MEyzhaWceRtgk69Tyo5D2LxToBokL2JoRdTwnnBIA
         lslw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166681; x=1790771481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=geosNIRimRwfO8HRfTW0XaPt8QyFJOsPlxIx1190dzs=;
        b=GGLZtH4wkgEHP3gt/fuSWbFGDdMIcc6K+AUcRCYLM1E95lE38MtYEUG/kIvD13fmLz
         P4TUqABYomrf6+WZnOWouZXi9EuerYpR1g2nB6Nt4B/TL0z6BSR4bCBUtWjPELJWH/qq
         obaklekAKBAPxnX/RTD6Y9KsZ2g3ju9sXPUJpQ2CeilwTiNwvpGcuBGnC/2Ion7iUzdD
         aiV/L1hPlGWcicr0b0YYXAT6f9Y5WYt9apFYDopXFnkkxOidbN99b7QJ6dWB9/vsdYFP
         vvQkmLbuHOmkV3CljYMSi886E2H6GsnwwWxAJesd4W8/xV1DD+V0ciho/J3m678LnqZZ
         7DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166681; x=1790771481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geosNIRimRwfO8HRfTW0XaPt8QyFJOsPlxIx1190dzs=;
        b=HyVDxsYAlykFhvKADXKtvRkIwvniVClJoWWYOO7qv/9RkHzVUovLy0jdB3VIMXKEuE
         TAtrv8BEk87R01Y27WUuLQfHRQlhtlqPZp3X3IMxwUNeJsul5+vpNl+xjQdBlntcuqBT
         6e4j/viykKr6jDccySksfP45TdJZbLwNRL4AHnpW0caAkMT19Z3vJXA0KqscUCj2NTqS
         B3HnTW7YZGJdTPk/xPykrgduvZVujBiAzVysTDm9c/dlqLe7QZzqNBkHnJnQeYt3U3dV
         kJk1gG7dskVFPGOZdw7qQyMpSFC5pEu5jw1tyIhaFrcBC7SHowq5F+af98PHzgp3+0PC
         Ko9A==
X-Forwarded-Encrypted: i=1; AKwUvBzVQLGIO1BGxIA8suwLSYxf8yG3CBv5eficE8ZfOUFAwnlILxVWPKG7ziCuYlugBBZOEt9SWJushmr6fbo=@vger.kernel.org
X-Gm-Message-State: AFuF++kljHvhwkIzqQfj6ndEUX+8k9r2sSH67tB/AtDAd09JT02Fwggz
	djEU5EeW5yyV5hql+njlGHLHMIwMGj4JRqLysm+k3V7Gf07n8eyZI5jBGxlUyysm0j20ZURJqf7
	o+RybgXZcfRjR5aQru11ADjXbMTxDRKM=
X-Gm-Gg: AYBFou0tJ2TgwByaLKjYO3uM43rp4FQfZZ+PqjDVbuvRMa4kn4mcIuwo8lw2cxjCHgx
	yOzIE13CpWAAnsHpWRsVcaNISlxcVGiplC/wa5uzIa3sqOKM2OU8nYuaWvuDJdnEhW7Q5nx6BoH
	xov70mVtUnj+Pd6oddnfx87g9aYk0qZfO6VE7Lvd/E8A4FMomXoWXtbMhMgzGyM+cXe1wVEvtWd
	AxR+WxGAW/lT8HTPTh7DGeEusjdPn9HKFTFn2QCZkbVLrkSvrDiiHRoy/R+VQgyfoA5LQ9b90Yk
	nrHS0EEHK4KH+ClGngTc8f6vMTv3LlBqeMUW5PDhc1lLhuQoJVWPuDmw5aC/Mvpa7lcG0g==
X-Received: by 2002:a17:907:a312:b0:c29:f5d8:9c6b with SMTP id
 a640c23a62f3a-c2aadc48e63mr193301966b.26.1790166680835; Wed, 23 Sep 2026
 05:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919174223.2356964-1-coiaprant@gmail.com> <20260922191758.2730da7a@kernel.org>
In-Reply-To: <20260922191758.2730da7a@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 20:31:08 +0800
X-Gm-Features: AclHuK-NKWB18tJ6bEfQMpRWykl2_zQElAqMu29cCy0C8SHDtVbj2c6Zd_8DHvQ
Message-ID: <CALj3r0gPjraK9wy_WbTkeYD1OK_HhSeMi8bDmk03gOVJUb825g@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak
 when the PHY clock fails
To: Jakub Kicinski <kuba@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=89 10:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, 20 Sep 2026 01:42:23 +0800 Coia Prant wrote:
> >                       if (ret)
> > +                             clk_bulk_disable_unprepare(bsp_priv->num_=
clks,
> > +                                                        bsp_priv->clks=
);
> >                               return ret;
> > +                     }
>
> Missing a bracket, EBUILD. I almost appreciate seeing a human error like
> this these days :)
> --
> pw-bot: cr

That's what I get for hitting send while my brain was EBUSY. Will fix
and repost shortly.

Coia
