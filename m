Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6357747ACE7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976225; cv=pass; b=szxAe/rhychZWLPbcyH59LFvUFpWlwMKvdXkQx9poY3Xi5L9Lo4S6/f2tfNw8N/iy/awAQYAVNbZvMkSqQk/GcnN2whtCzU3OxY/9c/8/QYJjhOiUqJAeQFakpl6QNKmIEaqhvSdvlYuUu5gfdrsMs1iaVM5en0imiTEpT4IQ2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976225; c=relaxed/simple;
	bh=v92a07kZ9pv1iZ0gl/XUWpQyf6mAsKw5gJ3QL1iN71k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oG4/vXfHK7g/WYu/atqcpcVNvoLzat4nIEYHHM5LmJVpO0A+tOmjPXnDkyMajdFDaggzeV12XdySiBes3zfJcBQFEh+aIz+rcFYokd0atr9qjTEPIrsYV01W7N3XzOrLTWfJOtVouP3G55340tiIIqqAarWVPvBuLrYunl9jGO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5FGxH+0; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5FGxH+0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48af27fe287so392870f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791976222; cv=none;
        d=google.com; s=arc-20260327;
        b=QZNzT0N5zeGLoj7C944B6zRiPToM7wvI6er702xZJ6MAUB+s2uM/xHu2pIkZssagTC
         kPkQlMrQLG3fPGAorELkkNR0O4+uqBYG4Xl48bJ5sp2Q7lM4Ss5CrmaxqeWPY0lHyal3
         F6eUCvPJqwyH0lssgfAR50wbJZ7eLnpch6oFvKUBWEglWdkJ5gOLpCLRDLH2GjnbWBbu
         9lvucGJaRCgohYSccU/lG6fOSBw/6YepsmOtbakNi2IayQful52hDYPbvSg5wGVvKPIH
         Z1pG+NC2A8uHSKTHmcD2mCKv4mAEpwZ+igidLGQ1xHz104GMG8yhL8fMP8p+mAaWpDBj
         KTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sUDJh128qN21U/Zac0vqYWgqSkXm0ycHDE5s6YgcYz8=;
        fh=6R2qZ+piMKJKqLWaHDoctBjUq9roPEZokhV/BL21GBI=;
        b=ruNFaPOh4qDu5uMIjY2FgqV2BTi5WUSyJosBGxspQLnTpG2BkXpED+Ca6UkFcd+2IN
         2O1Wbc15SIdWdeiruOHbLUie5ADSrmw2YN7khPEuBBjVOz4qLFS2z3GbieJ/BBhg0Us7
         0gdP9ARmHClJduJEwNrU9J9r7ke7eV3FJbOhuIfVXp6+bZOuJUXT3CnlVm1MbmoDyLP1
         9+6HwfOq7W+fpCM9/aiI8/dQ7eKDVV/ZeufqVoF7Du6z564XCPedQo7jRw2SFowGvvXE
         dlaG1H+q5Wc65W985zoCaxcfqhYA1V5waZF5zy49qEZg6oAB4Qxa53zp4sy60iMWERVt
         E7pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976222; x=1792581022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sUDJh128qN21U/Zac0vqYWgqSkXm0ycHDE5s6YgcYz8=;
        b=I5FGxH+0z/Prn267fHkf+CyaJZA71gU35He0ty4Jj8o1IQIU4skBDiCxFLNaTQV1qz
         ZaS6WC4lH6k3BHebs0XORvU9LBHcvmvhhjlz5ZvgJvsabdyy3Q+jpRV/29Ec/yi6qmVR
         HzvtKtQ31N6H7q/WoTlkYbizhPbJ0NNeCsE/THeiPtn3Lh+YRIpyskDBa1greRZ5kwF0
         sOXKkyJ2rX6oyDchG4MuNxTLPm2ln/7Ziv6Snrk2VHz1WCuWH2eaQ2UU05/goTsQXcMo
         ZEiFzJ8kbHy30crHme205EmvIMbGzulm5J45rQzIt7tx03Frnp6w11vA9IsOwNUnDPxy
         T1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976222; x=1792581022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUDJh128qN21U/Zac0vqYWgqSkXm0ycHDE5s6YgcYz8=;
        b=Rgyy4351xxpQ6mjWRWHREVX21XTRqgUdPiExTVtdZMHdC1ZV08ZslVkjDj9qjLPTtq
         W+ukin2PPpUxWlCDZmfWbOinJZ6yKwwF+yj5AtbA6W0/Jv4fzvlIdObJrhsm7J34rSib
         YVpDtgt3Vjlf0DVA/j5Ee5V/Bi/rC+LmEkkLD5Vf/ITnr2G7JpOsI86mx+5MMeFI4E3I
         t4SMzqFYsdNJ3oPIT5Pj8OEhh3mbVex32Zd2rSEfcVtiowIZK2E4Pu1he8ZHaR241nxZ
         a1jANNzc6kUpxqfTPwJq6s2tE9zb97c+Vn9ySk6v/P6mOYlGQ401PFktOZZ8fU3BJZUX
         iEig==
X-Forwarded-Encrypted: i=1; AKwUvBxuCxtqwNPFHdf7xe3FD/Z3sykx8ZbPuJQhsKphYiFlNea+bdwDhY7vVtEg9X6ATGZRzrPhXN7qnjZbleo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP0QhFWUX/7Ulq8Q8yogA3b2L+OGqvpXr0HQg2u/U9jBUJDjwH
	eUO9n9/yPqMow2LABUnhdbOy518HsXZzZhCx3k6uEuSJ7hMiAaiGfjBdansKrFy7SB+wSlsW1Jt
	0jn4B5miXi1XPA39oKKiSk63huN6zvWQ=
X-Gm-Gg: AYBFou02A03qZceB2+lSIFR0n1rBSX8+Zuj+eaM/QQ5Wlc4O4Wx/mgRyr1rQgHOASqw
	r6FVctjpUO091RRRLfRypR7cGtvn/lTQhSGmUaFooUHBf3/GD4j8IZVb/8x3RUGhzl8Fdkbe0zr
	eiC1Pc0fzxwneCgcZOFcC2hKvd1rT2yIrxUFVw3AOzjN9xPeMfaPH8n+fi5D9N3iWytF/5dMxi0
	95mlZ3sbxHs00L5/6zWMJdDmkWwbptIdVHakx138NsLjJ5xRpzKzVJfUXtI4nyLyv1zytQhz3bR
	cAVS2cIZ+mb/MicCVjE5YKJCWjrwW4tCn0x+jRFw+NMfFzcRj7z4FFaKImUa4kfvmzFU6zeaXZs
	fwMJKdScY4vENkIFDdDeB7VsZURmUTbFVLHkKhS4ERq6cBRVGf9QBv8uPExVBY214fo4sg3XFog
	BOMwXI3wdV
X-Received: by 2002:adf:e004:0:20b0:487:88b:4681 with SMTP id
 ffacd0b85a97d-48dba9db07cmr22258882f8f.10.1791976222256; Wed, 14 Oct 2026
 04:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-miic-validate-dtb-v3-v3-0-68617b3dca5c@reliablecontrols.com>
 <20261006-miic-validate-dtb-v3-v3-1-68617b3dca5c@reliablecontrols.com>
In-Reply-To: <20261006-miic-validate-dtb-v3-v3-1-68617b3dca5c@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 12:09:56 +0100
X-Gm-Features: AclHuK_AtxgKnhvGzHMnS03oYn804x_h6ChuS1hEcf2qg0FXvn7x9yZA8Od0Jgc
Message-ID: <CA+V-a8u-Sa7zwYRDvwzQB0N4GT4kAz8fj2fJX1dZCNx3Gz85Wg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/2] net: pcs: rzn1-miic: Update port
 numbering for RZ/T2H
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 5:48=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> The port numbers on the RZ/T2H are documented as 0 to 3. Update the info
> structure and change the member name to miic_port_last to be more accurat=
e.
>
> This value was being used as the number of miic registers when setting
> default values. Add logic to get the total port count and loop over that.
>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 3aa513467060..31716241b58f 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -222,7 +222,7 @@ enum miic_type {
>   * @index_to_string: String representations of the index values
>   * @index_to_string_count: Number of entries in the index_to_string arra=
y
>   * @miic_port_start: MIIC port start number
> - * @miic_port_max: Maximum MIIC supported
> + * @miic_port_last: MIIC port last number
>   * @sw_mode_mask: Switch mode mask
>   * @reset_ids: Reset names array
>   * @reset_count: Number of entries in the reset_ids array
> @@ -240,7 +240,7 @@ struct miic_of_data {
>         const char * const *index_to_string;
>         u8 index_to_string_count;
>         u8 miic_port_start;
> -       u8 miic_port_max;
> +       u8 miic_port_last;
>         u8 sw_mode_mask;
>         const char * const *reset_ids;
>         u8 reset_count;
> @@ -485,7 +485,7 @@ struct phylink_pcs *miic_create(struct device *dev, s=
truct device_node *np)
>
>         miic =3D platform_get_drvdata(pdev);
>         of_data =3D miic->of_data;
> -       if (port > of_data->miic_port_max || port < of_data->miic_port_st=
art) {
> +       if (port > of_data->miic_port_last || port < of_data->miic_port_s=
tart) {
>                 put_device(&pdev->dev);
>                 return ERR_PTR(-EINVAL);
>         }
> @@ -523,6 +523,7 @@ EXPORT_SYMBOL(miic_destroy);
>  static int miic_init_hw(struct miic *miic, u32 cfg_mode)
>  {
>         u8 sw_mode_mask =3D miic->of_data->sw_mode_mask;
> +       int num_ports;
>         int port;
>
>         /* Unlock write access to accessory registers (cf datasheet). If =
this
> @@ -538,7 +539,10 @@ static int miic_init_hw(struct miic *miic, u32 cfg_m=
ode)
>         miic_reg_writel(miic, MIIC_MODCTRL,
>                         ((cfg_mode << __ffs(sw_mode_mask)) & sw_mode_mask=
));
>
> -       for (port =3D 0; port < miic->of_data->miic_port_max; port++) {
> +       num_ports =3D miic->of_data->miic_port_last -
> +               miic->of_data->miic_port_start + 1;
> +
> +       for (port =3D 0; port < num_ports; port++) {
>                 miic_converter_enable(miic, port, 0);
>                 /* Disable speed/duplex control from these registers, dat=
asheet
>                  * says switch registers should be used to setup switch p=
ort
> @@ -825,7 +829,7 @@ static struct miic_of_data rzn1_miic_of_data =3D {
>         .index_to_string =3D index_to_string,
>         .index_to_string_count =3D ARRAY_SIZE(index_to_string),
>         .miic_port_start =3D 1,
> -       .miic_port_max =3D 5,
> +       .miic_port_last =3D 5,
>         .sw_mode_mask =3D GENMASK(4, 0),
>         .init_unlock_lock_regs =3D true,
>         .miic_write =3D miic_reg_writel_unlocked,
> @@ -841,7 +845,7 @@ static struct miic_of_data rzt2h_miic_of_data =3D {
>         .index_to_string =3D rzt2h_index_to_string,
>         .index_to_string_count =3D ARRAY_SIZE(rzt2h_index_to_string),
>         .miic_port_start =3D 0,
> -       .miic_port_max =3D 4,
> +       .miic_port_last =3D 3,
>         .sw_mode_mask =3D GENMASK(2, 0),
>         .reset_ids =3D rzt2h_reset_ids,
>         .reset_count =3D ARRAY_SIZE(rzt2h_reset_ids),
>
> --
> 2.43.0
>
>
>
