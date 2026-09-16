Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73A3C0603
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540185; cv=pass; b=I0j8X2iCN/rcMPHJl/POiKguufc2a/4nsBoadmdAO1HmqiBN5tx6/TBfI6CaiEjoEDZGYsnqavp38koMZrwMODgv2KJ+joWh3Z5X+QMNuZNWTidQK98EIuJvwCoxtun8c/q5WTIWGDOiovEseEiaUbttv6AzCce7HS8mrwuR2j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540185; c=relaxed/simple;
	bh=vxwJtKP5dyGMaNoczGK/7UXp394tRjI7aLg0dpu/cdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yq6QmKssSNxi18KXDWZgPEDj/FSMtmNYW+ODEgH7ONC8KE91AGPGrcnVHgxEPnAveeBmOktFPb0oIMhg4nL/b3EMMEBsE7ZCCtSgioIp9VcqnsYy69/WM12DWv3g4zJwX5M1FqgOBpPV2a3+QEAwdwXZdukxpwfQRxVYKgU/BHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSdPIk8Q; arc=pass smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSdPIk8Q"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-982dd15d169so288484241.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789540182; cv=none;
        d=google.com; s=arc-20260327;
        b=HxWY9oK34euZ73j+bI7+ykErmPH44oP710S7VLbqrIhTZFw7iOv2YeMgUOZvpHnKId
         gt4CBgGXvkNT1BL9ZV8juN/rGTpuXV8lBnLA8QPAnuIfa/M+X9yIDSl1rqrK7WHOjaql
         0KM+HAq1HHHaFl81EJKDsRv9fb5C6T0nffGBZYW6jawtaX48bravQG8+vl5JyTxncLPb
         rtZybdBh6/G7RqszDZBo7cG6r4N1kt+5SfbTKzLaE2CG/sxAnY+ClnnP17F6tUf9Vfdh
         F4gJo9BCewqKP1Rhj7i450ZWlYAhZDp0NZN8DKDTZ2mKF0Iav5Ok3Toc0VXxTBzn4pXW
         fFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        fh=42+lVH+Ab1dtfufx3bQHVAy4titpZ8C+/cOXKyF/u5o=;
        b=Pp9On4gmmPhgQhDK7vx5LBgMbG+EhUKxKsVwrK7YkM3n1fQJxF/uf252Fm6oH3Uban
         aRMIR8/w70GLzxlnLhYIEky0U6jgzlSEbXMvedKHF4ckklnaKEEGxgjWhu2e3TXbKwQf
         sdgVBYym/P4AlvJPiTfzhmWFOEQROtuxfYVt1jkGKoyi3hHCKMm2pu5ixYwp9tm14LC3
         C8UylmFbReKRo5d/fUKdkEcA4IBeBCLDBpCsVU7UWlxYK2U6apJOG+VMmFwCak7joRPH
         gtUBJkhPZWqFbtFCZfpjQdhMjiwEDZvS9c3QUXYoe5v1ljYXnSLemp6mNni1MthVmWVV
         xE0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789540182; x=1790144982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        b=VSdPIk8QtSsqlbhk10jiflIRjv3ecXSilDdxODs8YfeBkFbJ05RTbaYB06O/8VGSU4
         3YF4ps1fzrGJTymh4Q8xkKnvDjpFaIEZGNEAPfJ6oZMRtZCWWkW5cjhEy4RmLXEU/PT1
         4ihUWv9z640YKZNVdBkEoOddM8MG/th872mPE/pgsQJsIEM92wQakqmqkXYCDvkZICke
         i09Y3myRwwO6vsDBY0PcA/rPRgwfGNK5tmA6FmVaflb4vwYNpbeJzGvVrwEmXAXF7PZd
         pRVDSaqZAHFT5FwX5Ecg9IrKH3qL0CPopNBztr6a4Dm8Rqtl1ZhTJainKYbVoJ4zhTkM
         Zy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540182; x=1790144982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLQJlPVwEEi5+s2qt4TvZ0WfYKHDL+3w8HRDzcqcQ8c=;
        b=q25ScRBr5wTUIqnQGIhEgAJWpO2YqP7XEoM+oIkYaJGrn+Lhy6cLX6GhtbZV082ZQa
         Q4S0tp8ZOLEfIUozimPznIuNppJjX/71rEIwe5nDQdGOovHqjnedw7aaCJePKIow6dip
         SA/WRRmeae4W3wHoO3NivKCCicns73V1o9llTB/Beo9Gf+ifjzq0nuw7kGJmFXNDLJlP
         2oeb6fxR07s3hLtMGNR592Eia++zgKxrpLH/6xah+FeQ/nowyWGwFJpprszSuYV+/1L6
         dy24ypwdOUdprojwBZhzg9fHTwnSSO4bn4QjGtMKHXau++Wqu+zexk0GTEpB6in/okWK
         u+zw==
X-Forwarded-Encrypted: i=1; AKwUvBy1fHxOdhM2Z9mTgXbI/grVNhuyr/jXWtu2V9mKA8jlIQpBeoWTEvHZtZUB5wKEyXkB6Op5NZ7fs0AEhlU=@vger.kernel.org
X-Gm-Message-State: AFuF++kTem3MNYlmhqsJ4wLqacmrYhnxo4folqOlERDjUi9Ux41gFsOJ
	CS+y9k4gvSXNRycsVtiOv91LaR4ns3FOXoTZN4UQkYpupc2C7iPu1Qa+mocOPY1ZIAcxlG+z/eU
	++1NMrHQBJoYHoU/ZD6/BwY9mFeZP4oQ=
X-Gm-Gg: AYBFou3hBUq3XVPscmMc8oa7m5CLTTTBBzl6GQW7KLoKkUhnxkoCp2MTFp7nWfFnUuG
	ySRPNPvVubxDiIPPlY+4VzuzM1smSE8BeB+LsJAufbyXtlqrcXobkkQIgUcQXtQYIQBv+AOxlBB
	guKvBXvo7/edficuaULMX97crCKb8rESkh2pmSYseWCfwn6Sf6gBpWdIHyXos0jLVIMF4XpVMAL
	rEQYndJhYTXNpdh+BqJeUYF9LRhlF1NoLG0OoJWTJQpAFSWonNncME+yPnUl0xP21bPjmV7bc27
	z435HOyk8zDk9PdvODKedJrug5DQFiZxZfY8YjbMdJ5ZEoOq1KGd/17cwSAuYdWcPCEmUwZoRdu
	RpTxkrngEsqQMl4iTmJsLVbldDr2wJoqjgRYPeEMFSaFW1a3RCGnSCCTH5Wn5gdXKh23UPZ4OS1
	Ys2QPkpw76+/ujq2LyIzjFRY5tluUacT7ZPQkTltv3NxEA
X-Received: by 2002:a05:6102:3ec7:b0:79b:b116:2c5 with SMTP id
 ada2fe7eead31-7a023d19677mr1268443137.2.1789540182266; Tue, 15 Sep 2026
 23:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org> <20260916044119.475666-5-alastair@d-silva.org>
 <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
In-Reply-To: <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Sep 2026 00:29:29 -0600
X-Gm-Features: AcwNN1UffeYUy4Pp1zpzsKWqvpGpKHs9ZXj5jRY360cdZ_TOsQDRhTD1ZCtKs60
Message-ID: <CADvTj4pC2xGn4m5Medhpn16wwLj34uatw7v266CCmYWOyWPAZw@mail.gmail.com>
Subject: Re: [PATCH net-next 4/4] net: stmmac: dwmac-sun8i: Add Allwinner H616
 EMAC clock index and internal PHY support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Alastair D'Silva" <alastair@d-silva.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	richard.genoud@bootlin.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:25=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 9/16/26 06:41, Alastair D'Silva wrote:
> > Support EMAC1 and the internal Fast Ethernet PHY (AC300) on Allwinner
> > H616 and H618 SoCs:
> > - Allow reading a register index from the syscon property to offset the
> >   regmap field for EMAC1's dedicated clock control register.
> > - Add emac_variant_h616_internal with support for internal PHY, MII,
> >   RMII, and RGMII modes.
> > - Delay the MAC software reset until sun8i_dwmac_init() when using the
> >   internal PHY, ensuring the PHY has powered on and begun generating
> >   the receive clock before the MAC attempts to reset.
> > - Skip setting H3_EPHY_SELECT for H616 internal EMAC, which does not
> >   use the H3-style EPHY select bit.
> > - Handle -EPROBE_DEFER cleanly during clock and reset control acquisiti=
on
> >   in get_ephy_nodes().
> >
> > Assisted-by: LLM
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
>
> Even if this is a duplicate some of the work done by James Hilliard, this
> raises interesting points.
>
> > Notes:
> >     Tested on Mellow Fly-C5 (Allwinner H618) under Armbian, verifying s=
table
> >     EMAC1 probe, deferred soft reset with the internal AC300 EPHY, and =
100M full
> >     duplex operation under load.
> >
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 65 ++++++++++++++++---
> >  1 file changed, 55 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > index 48c52eb96233..1728893589a6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > @@ -130,6 +130,16 @@ static const struct emac_variant emac_variant_a64 =
=3D {
> >       .tx_delay_max =3D 7,
> >  };
> >
> > +static const struct emac_variant emac_variant_h616_internal =3D {
> > +     .syscon_field =3D &sun8i_syscon_reg_field,
> > +     .soc_has_internal_phy =3D true,
> > +     .support_mii =3D true,
> > +     .support_rmii =3D true,
> > +     .support_rgmii =3D true,
> > +     .rx_delay_max =3D 31,
> > +     .tx_delay_max =3D 7,
> > +};
> James's series [1] says this SoC only supports RMII (yet includes RGMII t=
iming
> control), and here for seemingly the same device, there's MII and RGMII
> support listed.
>
> [1] : https://lore.kernel.org/r/20260915-submit-h616-emac1-v1-v1-0-195de0=
bb1f8a@gmail.com
>
> Maybe you can coordinate with one another, can we connect that SoC to a n=
on-internal PHY ?

The SoC, yes, on emac0 for H616, but not for emac1.

> If so, can we use MII, RMII and RGMII ? or is it just RMII ?

Looks like it's just RMII.

>
> Maxime
