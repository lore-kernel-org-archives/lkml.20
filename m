Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392183F9F2E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181748; cv=pass; b=n1CFVa9tqhXbM2r0kIy68H3q6vvzh8P8eVqNst1HlO4Aw56Tff2iTmr8uK2mzCdTZCvXRPPu9oJg1IuJjHV61fNPitOEjUIAx4TRaWd+l0OVeTaVQOcDnzTLfVkPEXv9qeGTe95MGEg9+tIekYmyDuVj0+0uS2/+BLXUE8EK5ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181748; c=relaxed/simple;
	bh=gCtW1g9OXbHbP5WARIAr6crnyFAi76AA0+tgDuZZFxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMpbs/IOQQqm2slEqXRgjXMLUVHmWj6pDLHX4GtCHaHpVLn+X95mrvD/b+dkOj+/1sDzpFN9sN7ZSyz3PSUDp4cqtYb0gGn5gJta2vey97ISwtnP8hQW6Xy6vFBVYPjxTfAhu4yZ95RJGMe/7LF+XxhFEPq3PhQsoh3Fl0lUnUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxIjCsFF; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxIjCsFF"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4c5d8c7f326so176735b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:15:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792181744; cv=none;
        d=google.com; s=arc-20260327;
        b=JWfeDeyOGPJrsTOH8wAZANa8ilDeaAfx3y+cyLy/LF+kgG7LdjvbRJJTeh0rvRFp5d
         RynSFEa6ZEvD4LFsw5sYTvVHw2OzI/0Z+vRyR8d9jaqd5IAgpI/43VdJMLRkxUDtRtbQ
         5inm6rhnEXQXlCvLkRdhXExTiRf0bd96t/w12tjgsOhEgXJXxG8ZCEPVt56/oU/qXBMZ
         Rb1nVurHwwtT3VnaTzrgIzZCM7JJHPkyiT1NMgMxdXFF1KgRScjMs8IrG0dC1QtLQemS
         NfA1KHeVwGdEAzRUV8UAOllkW2v6fPg+IrozCUltbOhJPhrJz2gfFXMboVvwdZyP7kQl
         uKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bu/RyIDM5PTqk4ZpQzE0STFmO57l8GWV7zB4VPEn3po=;
        fh=FsvYRa/XwU+ldgFdHNAcZUGLYvlJkGK/GT9vqITjsFU=;
        b=U/gn+F3IZYG3tPzVXBS9P5B2cC19nPzcJ6G8CjAB+QpmCfahRVBx9eq6+lU0lVFauB
         10POA04LAnb/iHz2+Tt9hHkEpWREquH+xX1jUEZL8O3meIPeMNoZ+22ZR4kFrEbDdlAh
         21FHix1c9cIeOmDzOijflz8cKeEQCSXbacP9eH575dgNuDJ6R6PMmVb7/vEf5t+2Xs7N
         tOzpJJRaA4tdqUMmPi2Hrr6beUwYVBF1G8UbM05hxE7q0Z4nuWVfUd2Ps5V7kCBZQXb3
         MgX9LQB30IDldO++/Ktk1D0OHP1+uoiC/lSiaF24AJuhyGR+FC1r2kEyEN8EEezlNm7p
         AX4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792181744; x=1792786544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bu/RyIDM5PTqk4ZpQzE0STFmO57l8GWV7zB4VPEn3po=;
        b=BxIjCsFFDsYdZjwbYAmRxyVgsKZ1UOeeyABiGWQ5zGvPiFH0UypL+P5sCSGkjMiub7
         XTdnY7DCDTzwMZdEVuf8o1Nqjrg5NMxueZegQv1pk4nO1/aE6GjDPVq6o1adl0AbMDsR
         GROdKgDJiyqbUe4nFaMElmgy9pqjVg/gdFtR1wnx4VLdDZvGV9HU/Mgf2WYbhrrEG/zI
         M4CtQrik2JM3wUn38wZfDRDeRa6QBJM2mz0cc3oF4xRt40EOUf2Pvs03JHu5DfnoC+tk
         SfCXfrjz/ITEpxtf857t+DSknLbM81vw8pRrTQMfsA9Sd6PuL5TBow3z5bC0R00bDypM
         Wu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792181744; x=1792786544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bu/RyIDM5PTqk4ZpQzE0STFmO57l8GWV7zB4VPEn3po=;
        b=CtUPiBkjj1P7GPh708xttmt9YlUcI9CGgWKN+w6yCdf4I/0Cv6rEzqO6eitz7GC0P2
         CNOisR38oKngs4Jy0QCj+K11O3IxEP+4nZBjoc+d7BKvgnXu2BSjyME1YhWOqEA4nVco
         HS8GUfhm2ZwdsGiisrAWu5rm5AbFvEABg4wxPWL9kZ4fXxasnhl9JGDfCm8HJ5fOPE1o
         B+v0khIflpSlUG3EMbtZE0HF9jVsCXu4ct4E+3v+LQiC/EPUMaHrgvMVTkzzsbJMTGw6
         8Nw7N2vnYA4LXkWoKkYFXRDcSi+WZi4PUP31lD/efqNxrLrl5QsNUpJYof/ZdlRoUA6J
         /cHw==
X-Forwarded-Encrypted: i=1; AKwUvBywKmXKTQEfd+TH4U1IMxqti/Y+fE0gU388AMhmrstnK10DjsP6cHKDeasnA6t2mXcRQFP55EZk30P+yUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeZAuIk3MnPfSwA1AAU66ECBSzfpuuZ/Y6xHlBYyQykQHf6GPx
	VAZScQ6l5kjzcguqbFI3d8WOIDe8CW7zQZl+eo4kXwrOUChJx6JMe4ipuv/qhK53t6bcmoYzjfs
	Xrc3P+S+huzv7Dx+X/yeTe7jYnywCQAE=
X-Gm-Gg: AYBFou3mvqyBNf/XC4Ld4vESdGL/Wt03zMo4okUR6W0eQONuh/4nkWbhBlmUYUH1bpF
	Gy2hHQK7Y8QrxHTkBhLOBfhr1g7cvQSFdteoPjS/vDAVFsu75w+sUITUc6V1Hpkn9TfU5r0h624
	2zZ9Y+BU7Kz7D2WTXsMlUTErZ17D0zvrbPb+yuuVz2V1VRKTywEDCtiahbxKUrjCaT2Sk/EDdGA
	fkTpZYnt1jQ/91W/LcesjXhIOs8w2eu1ZBfJ9goELcIY534HXHoiKIUV8idVvBvkAS5Jx4PLqAm
	UjfvP6/7rZIPdFq82DnpYH0//38jtxh9Q7mxcrY9TIPnkVi23r7PSZBKmkScTjzXeRhMlOOKVQi
	JPTZ6pEqAEVX8SUEQsWO85Im87Hx3j4H+/tl9E2TY5b0jGw==
X-Received: by 2002:a05:6808:1507:b0:504:5fe1:c8d4 with SMTP id
 5614622812f47-53cd2f4386fmr654852b6e.59.1792181743855; Fri, 16 Oct 2026
 13:15:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013011122.1889766-1-kyle.switch@motor-comm.com> <20261013011122.1889766-6-kyle.switch@motor-comm.com>
In-Reply-To: <20261013011122.1889766-6-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Sat, 17 Oct 2026 04:15:07 +0800
X-Gm-Features: AclHuK9indAuT9sQ1gYBXpJavrWPxXYJRGBt8G_7TObPBqWYMK0ks2cmSCXGj8Y
Message-ID: <CAAXyoMPeOmMZ8u=+S9=W=aJ0riSRbkBX9afrcVdfrE4BreO-Hw@mail.gmail.com>
Subject: Re: [PATCH net-next v14 5/5] net: dsa: motorcomm: Add support for
 Motorcomm YT922x
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:11=E2=80=AFAM Kyle Switch <kyle.switch@motor-comm=
.com> wrote:
> +/* yt922x register lists */

The indents below look inconsistent. Please adjust to match the existing ma=
cros.

> +#define YT92XX_PAGE_SELECT     0x1e
> +#define YT92XX_PAGE            0x1f
> +#define YT922X_PORTn_STATUS(port)      (0x80200 + 4 * (port))
> +#define  YT922X_PORT_LINK_STATE                        BIT(8)
> +#define  YT922X_PORT_LINK_DUPLEX               BIT(7)
> +#define  YT922X_PORT_RX_FC_EN                  BIT(6)
> +#define  YT922X_PORT_TX_FC_EN                  BIT(5)
> +#define YT922X_PORT_SPEED_10           0
> +#define YT922X_PORT_SPEED_100          1
> +#define YT922X_PORT_SPEED_1000         2
> +#define YT922X_PORT_SPEED_10000                3
> +#define YT922X_PORT_SPEED_2500         4
> +#define YT922X_PORT_SPEED_5000         5

Leftover from yt921x_speed.

> +/* ISO */

The comments here (and below) did not provide much information beyond
the code itself.

> +#define YT922X_PORTn_ISOLATION(port)   (0x4 * (port) + 0x180d80)

(0x180d80 + 4 * (port))

> diff --git a/drivers/net/dsa/motorcomm/mdio_bus.c b/drivers/net/dsa/motor=
comm/mdio_bus.c
> index 3aa1111efaa4..a4cb74d0fd90 100644
> --- a/drivers/net/dsa/motorcomm/mdio_bus.c
> +++ b/drivers/net/dsa/motorcomm/mdio_bus.c
> @@ -299,3 +299,42 @@ int yt921x_mbus_ext_init(struct yt921x_priv *priv, s=
truct device_node *mnp)
>
>         return 0;
>  }
> +
> +/* intif extend register read/write api */
> +int
> +yt921x_intif_ext_write(struct yt921x_priv *priv, int port, int reg, u16 =
val)
> +{
> +       int res;
> +
> +       if (port > priv->series->max_ports)
> +               return -ENODEV;
> +
> +       res =3D yt921x_intif_write(priv, port, YT92XX_PAGE_SELECT, reg);
> +       if (res)
> +               return res;
> +
> +       res =3D yt921x_intif_write(priv, port, YT92XX_PAGE, val);
> +       if (res)
> +               return res;
> +
> +       return 0;
> +}
> +
> +int
> +yt921x_intif_ext_read(struct yt921x_priv *priv, int port, int reg, u16 *=
valp)
> +{
> +       int res;
> +
> +       if (port > priv->series->max_ports)
> +               return -ENODEV;
> +
> +       res =3D yt921x_intif_write(priv, port, YT92XX_PAGE_SELECT, reg);
> +       if (res)
> +               return res;
> +
> +       res =3D yt921x_intif_read(priv, port, YT92XX_PAGE, valp);
> +       if (res)
> +               return res;
> +
> +       return 0;
> +}
> diff --git a/drivers/net/dsa/motorcomm/mdio_bus.h b/drivers/net/dsa/motor=
comm/mdio_bus.h
> index e79b725d435b..513a8d2d7618 100644
> --- a/drivers/net/dsa/motorcomm/mdio_bus.h
> +++ b/drivers/net/dsa/motorcomm/mdio_bus.h
> @@ -50,5 +50,7 @@ yt921x_intif_modify(struct yt921x_priv *priv, int port,=
 int reg, u16 mask,
>
>  int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *m=
np);
>  int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *m=
np);
> +int yt921x_intif_ext_write(struct yt921x_priv *priv, int port, int reg, =
u16 val);
> +int yt921x_intif_ext_read(struct yt921x_priv *priv, int port, int reg, u=
16 *valp);
>
>  #endif

intif_ext_* should be placed right after intif_* (if they are still in
mdio_bus).
