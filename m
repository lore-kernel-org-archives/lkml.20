Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A695E59D63F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573207; cv=pass; b=j3qUsH8k+TMzpMZnfwYPPolC/zCuVclciysH+bAs1IaYJ2A4Zdo9Xok9nO2BWrcKVYBohfSry89Kk0vUqR7nrNSgOIZNoJNgWoB3eAn6jG8s2dBAaAmJIWYgxACQ/ZSxSA+Pe1+PznIbFW1MMkRZ20aNgaBtCiyp6cpEnBxXzSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573207; c=relaxed/simple;
	bh=ScU33nXDu0xiWx6jKL+UXDwoI8bFo8Hv2fJkfHqk390=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=de7aXiIzItMo2pCyXn+p/uHgAwqbKLbmqQLVmKoWaBzgZFOZDxnkZ/3ypgy6OBXBKlB8inZndI1D2G04i3/09JE2sO3e+CBftOKIog8mf3ebn8VA9XfioN/EbIfm+0KL6K4wW4adYH+UdSHpzckSwPLma/jIjfzjbxmQEFPHYy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnoBF6MD; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnoBF6MD"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a2ffee6so570105b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573203; cv=none;
        d=google.com; s=arc-20260327;
        b=jl0qKKKyP19Xd8gwAb6zUWIhjDXp5X8o8NGXfIGYX9KWBMBKksrdsvwBgEiRyTbInO
         G4YMIockCrp1DHrW6xd0aM8SVFAaDAXyGtolXzawS9Dp1aoUU0uET4U603a0/rWFFJqE
         E6fR9t8UrpTaCgjhWWQftWuNuL5FMaXRTtOh+mqSLYiKWSxID6qNEo4x/ROWdOu9Mq7L
         xrDtXJdyAVELdgNOUVBEwUIZoyR1m1r64IStChuL171Mx/fJ2xVW++Ba+/3Lr2f5oIEF
         OLqrXSvOESCZCwls5RbSbDa7E8tfSLWfs5RIs2yfpiJYNsD7+imrXGxUxZ/PaIQ3eTan
         e8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sMegSp48VdS8/8nJDTxTHp+bF7BopZADx5r2nyY7hWo=;
        fh=kdaqKRAKibEydHp1I/yVrBXtn5IkSZeZnvN02mK4PIM=;
        b=dCAmh+SLBrUZGZebjsDQvSylKTHiWAFFfTEPEZy0yaYcCgTvytn7dEUMH+sIf8+8yx
         81STkBf9xe2YRf0gse9w1RTN7vw315j5lCV896arG8mVe2TtWWRgNej0CSNZ6Ibo6YBm
         ZLEhVSQwaLJOlH1thFctMblPX7CGmFYLwa4UVl1gUQp/IL/EIohCcLQIx4sQNbPX119d
         rw9c3i9AQ78o+vO7N+kmrU8FnD7YcFw7cKTL2d5TEI3hafc+2PlPH+aleXGM3finaDpR
         AZ576LSEt3/ymd8QMJdQpwTcPq70Duqi8UFlfJWPy3ZKKyI6aUPTRjavMGlAAlLCPX+Q
         LHJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573203; x=1790178003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sMegSp48VdS8/8nJDTxTHp+bF7BopZADx5r2nyY7hWo=;
        b=cnoBF6MDTtc1zrW0GB2FjZBk3vwa+GR18qkEM+p4Sh4ysV8MunY8eQgm77b3FUe/Dq
         Zrnyi9OMf1RIcZuw2Rv9GPzAv/72JB5t4BET3x3fGCjexg8pu4Eq+qesOEVy4ba/LUBA
         Ii58lN15HzXy93WT/mmaWt7vxCEoLZmMR8/m+CfmQ0z9cHP8IO3by/aSAla9yXPbZ69h
         FPGf4BKsqKpzcHxCOjY/AEmbdm+fjvU5giWZBe8HoGqKdY5nJ9taLniKMxJzhrD3EizZ
         B0fvyiquNTHPhUePIH9E0MTRyI7IFxlT2rKjt7KXa2e5012v6Dq0uLC9wtFKKblx7w58
         uNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573203; x=1790178003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMegSp48VdS8/8nJDTxTHp+bF7BopZADx5r2nyY7hWo=;
        b=o3QnWq6nExajTen3ED7ngcjSHpXDRVkuJHvZCQztEG8aSie8BsgFyLOKwazlrN/x4W
         hgltdpP+fWXaJRdb8UHnsrke7rDqa6n/bFlL6QlmXihCd4sR8J0HbhUG4wOnAWfr9QJZ
         LqRu0EJgaarjDdVlFlFBZIktL4s4Mbj4nGzTiTshSfoE+lECX8/D/PG/zYe8alyY6mB7
         CIZdMV4UPMfY7zntaAGctPLCllLMXqDA9tNEdK745zxhidf627lMVChAbhRmcHo7jA+k
         Zw2kNxKTtgumPoes595CXuRzuRCm30GN+Ad+a3sNiilWYrx9ygtgIXDYyHU2ap0bjRxU
         oMKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGkZ3B/jB05u7ZejB0zTTMEaHgMJTVWzORm8OqGQaJbRfZ7DSiW7ukdbXPjJ95qDUW2EpyjXUy7vyif0c=@vger.kernel.org
X-Gm-Message-State: AFuF++nQS9CYCBZHiK5HqhVlctBqphwaHGE1ZTBwvh2prj2B906mP3Fd
	B05FOxCnHC/FDHsQ8suOi7V6Ai34xqDg5DXuKiSbC+20wManHB2mVQa4phKvpWBCs4yBmCtTXl1
	58+JBLrKZoYP1pGsJiybUfpnj8EXPZMY=
X-Gm-Gg: AYBFou3qFmJ2w7hMHcCD26GJL95+FTCQ1DtTQ9sjd+yE5XqyMxBEeU6eIuMeiAcTPH8
	nzhsA+vtTMPhqV8DBMcNOROARcZ0fWohv5JAPG1piuIhBQ3ZszZv4Y8Qf0+ql2UQIApC5ZC8U5/
	jkENxh91LUm3kftSv6CC0xM4HVjT9kpoIBO58acHlzQ0rZu5//FW/KfnuTSsQZNl0PZhTkBi31P
	yJWp5mS+KHb+bhU2WSpRFulBfMy1SGEXJFtKyyJGtGjKwuRzrqCyfPf417y8cXMVy2u1n9fw82g
	ctNU2YwSJD3kcLFO/MlEri8bXjMdFoAEERKTKuhvBa48wGeOgkz6yAPQC6zxoaNfixxjhZRvxhg
	7bSfkMlibg2i9
X-Received: by 2002:a05:6808:4f06:b0:4c9:6b4d:f2f2 with SMTP id
 5614622812f47-4ca4cdf28f3mr3107040b6e.39.1789573203299; Wed, 16 Sep 2026
 08:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914103009.3007019-1-kyle.switch@motor-comm.com> <20260914103009.3007019-7-kyle.switch@motor-comm.com>
In-Reply-To: <20260914103009.3007019-7-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Wed, 16 Sep 2026 23:39:25 +0800
X-Gm-Features: AcwNN1U_fts8GQYD_Z-WuUlflSmCu_4kdlK1Dg2zobnwyEiT5Z607efvH0tFpbM
Message-ID: <CAAXyoMN5Bmb3pJ3aaY-J7txM6XZc=+a65pSvNdY+Knsjh1s+6A@mail.gmail.com>
Subject: Re: [PATCH net-next v7 6/6] net: dsa: motorcomm: Add support for
 Motorcomm YT922x
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 6:30=E2=80=AFPM Kyle Switch <kyle.switch@motor-comm=
.com> wrote:
> +/*
> + * Initialize serdes configuration based on interface mode.
> + */
> +static int yt922x_sds_init(struct yt921x_priv *priv, int port,
> +                          phy_interface_t interface)
> +{
> +       int addr;
> +       u16 data;
> +       int res;
> +
> +       addr =3D yt922x_sds_phyaddr_get
> +               (port, YT922X_PHY_REG_TYPE_SDS_COMMON_EXT,
> +                YT922X_PHY_REG_SPACE_SGMII);
> +       if (addr < 0)
> +               return -EINVAL;
> +       /* write protect */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4be, 0xd);
> +       if (res)
> +               return res;
> +       /* CDR */
> +       if (interface =3D=3D PHY_INTERFACE_MODE_100BASEX) {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x406, 0x0);
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x416, 0x3458)=
;
> +               if (res)
> +                       return res;
> +       } else {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x406, 0x800);
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x416, 0x4558)=
;
> +               if (res)
> +                       return res;
> +       }
> +       /* PLL */
> +       if (interface =3D=3D PHY_INTERFACE_MODE_USXGMII) {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43a, 0x1006)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43f, 0x3029)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x42a, 0xf070)=
;
> +               if (res)
> +                       return res;
> +       } else {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43d, 0x207d)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43c, 0x207d)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43f, 0x3032)=
;
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x43a, 0x6);
> +               if (res)
> +                       return res;
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x42a, 0xf070)=
;
> +               if (res)
> +                       return res;
> +       }
> +       /* VCO */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x439, 0xC0);
> +       if (res)
> +               return res;
> +       /* Vdac */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x492, 0x7f7f);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x491, 0x7f);
> +       if (res)
> +               return res;
> +       /* Eye */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x454, 0xf14);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x497, 0xa44);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4cd, 0x0);
> +       if (res)
> +               return res;
> +
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4af, 0x45e3);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x48a, 0xfff);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x408, 0x7c00);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4d6, 0x7f);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x44f, 0xff08);
> +       if (res)
> +               return res;
> +       /* FFE */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x48e, 0x7d00);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0xd, 0x60f);
> +       if (res)
> +               return res;
> +       /* CTLE */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4b0, 0x804);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4b1, 0x7774);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x4af, 0x45e7);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x3, 0x5603);
> +       if (res)
> +               return res;
> +
> +       msleep(20);
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x492, 0x7fff);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x492, 0x7f7f);
> +       if (res)
> +               return res;
> +       /* CTLE */
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x2000, 0x40);
> +       if (res)
> +               return res;
> +       res =3D yt921x_intif_ext_write(priv, addr, 0x2000, 0x0);
> +       if (res)
> +               return res;
> +
> +       if (interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
> +               res =3D yt921x_intif_ext_write(priv, addr, 0x1042, 0x48c)=
;
> +               if (res)
> +                       return res;
> +       }
> +       /* soft reset */
> +       addr =3D yt922x_sds_phyaddr_get(port, YT922X_PHY_REG_TYPE_MII,
> +                                     YT922X_PHY_REG_SPACE_SGMII);
> +       if (addr < 0)
> +               return res;
> +       res =3D yt921x_intif_read(priv, addr, 0x0, &data);
> +       if (res)
> +               return res;
> +       data &=3D ~(1 << 15);
> +       res =3D yt921x_intif_write(priv, addr, 0x0, data);
> +       if (res)
> +               return res;
> +       addr =3D yt922x_sds_phyaddr_get(port, YT922X_PHY_REG_TYPE_MII,
> +                                     YT922X_PHY_REG_SPACE_USXGMII);
> +       if (addr < 0)
> +               return res;
> +       res =3D yt921x_intif_read(priv, addr, 0x0, &data);
> +       if (res)
> +               return res;
> +       data |=3D 1 << 15;
> +       res =3D yt921x_intif_write(priv, addr, 0x0, data);
> +       if (res)
> +               return res;
> +
> +       return 0;
> +}

You didn't read my previous review. Remove this from this series.

> +static void
> +yt922x_dsa_phylink_get_caps(struct dsa_switch *ds, int port,
> +                           struct phylink_config *config)
> +{
> +       struct yt921x_priv *priv =3D to_yt921x_priv(ds);
> +       const struct yt921x_info *info =3D priv->info;
> +
> +       config->mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +                                  MAC_10 | MAC_100 | MAC_1000;
> +
> +       if (info->internal_mask & BIT(port)) {
> +               /* port 4 to port 7, internal utp */
> +               __set_bit(PHY_INTERFACE_MODE_INTERNAL,
> +                         config->supported_interfaces);
> +               config->mac_capabilities |=3D MAC_2500FD;
> +       }
> +       if (info->external_mask & BIT(port)) {

Worth an early return or else if here, but still OK.
