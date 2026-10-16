Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F933CA483
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179543; cv=pass; b=tX/XFLaHetxAs4DRcSIDgywprxvyvuL7DtQ77p7tdDxc35i2Lk4Z+qpheFjYAjussX/QVfr1vfv7T+sFGpSE7rtjAMUzkXucDL2tYWmG9q1cZx70N+ccvi1yC2CohVF7yddyiAbMl3kvaLdt1Iml6THF16mjCag8m0KwfDNf1EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179543; c=relaxed/simple;
	bh=ttNt0pCWtIYi5Xwqcvq+nRkbDyN+s8BRgGWTRR1hLng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFjsF0oRx3ArS3oksudULGKVO8kwWkf5D5dldR1NCTOZRX8471Ji4VE8cDgaUKIzzbHUlsEcq29FknOfDNWE/C95fXM+NI390OVZSis0H9iNWcJZSaq1CHCkzyOjLfrEZ+cSXu3cGwd94zKhcZ+MKJGTSD0MzOoMpfCTpqyMAmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4oXtQhp; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4oXtQhp"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f5d3bff929so210720b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792179538; cv=none;
        d=google.com; s=arc-20260327;
        b=XFufKaQBpEOuWr3sb/S4H4oqVn2MVWcQpa0UcG16pic9uA3jtV13YHiBgS8XfLefeb
         4VfYP2xDRIa9mltMDBhj5GYzTUENJgsXuZCDSyt3YFdWIpF+FayZmGAHwtdmGL123hyj
         3hLzLv+YWxAbDCucqI71T5p7vSnyv4XxAgy3Ylm1RzqSUUUoNNRjZwFayutjhhfJKDlF
         syhf9WTrNjCjEym5NLiPm2Lxj1422n5AjhzexnRM+xKKmK8pc3QvJ6Op1rpfQYjLVdSa
         THs9gS4NVDOrA5yq6pcPC9TJ9maqHK5CvGg/IZRP8ZuQTl9pPN8EvYzUC6BoZQ6kbhKu
         dlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=77hTM8EJJKmduk7MEyJTqP0/PRriK6Ki1atqibncfhI=;
        fh=QVAa67a3RvhstSJnY8bq3GluCD4uKTHgwIUbu+IQIX8=;
        b=UHo/GETK9xsvc4uSTjPqMvBNcuu9PO/RgSW2uddIwqPvjyoQJeuMgzWbQZYUzFh2Fj
         w5Z/JfTlGpoKJx6p6vyu2wh6PVSiHZvQacaBkkBFFSv0v/753weFFDFtbSL5PRZrg/ai
         HhCKAvq9T68Qbk5/yZZmBLD/lI12z18pcybkA267YaSjLnRNhL3rq+cC4nW+kK1LYKT/
         y6F+VGltcn/+6d/d4AogYo+51RK1GtHumTOpnNoKBgKNOYtCdKlVrXTL/BlXgS5xJMeb
         +LfblFEcleO5A0FPTAcWhuh1XvK6nhduP1kNNWpioKMngpoxPzRm51/3KQBRaR+nALrr
         T3jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179538; x=1792784338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77hTM8EJJKmduk7MEyJTqP0/PRriK6Ki1atqibncfhI=;
        b=M4oXtQhpHmumqaJWPWN8sZKGsqL6L5qPrNXGfv9Fr1/qsDPX6LprOewCRSAvxun2xM
         P1RbnyO9jg6e6wp5Rr5vVFAyE25iWBqGwOeEq1VeGdY7ipGRK1zIF96EcEIuDYAJVY4I
         nYawlVyji5PVQFozReAxGYtu44HEGbq7SuKujpYH3mJVA4DnHOX9JONMDYtG7p5GFl6x
         j4AgJflV6JGoq1EADqA3mzCdqWbdZJLszj15Md7pIT0t4im8LECrVVHEVneUIBvH8X9V
         gQJXab4oo6wMTFMKLKuuBHIaAjyrqSLmsZn43zuEuvUkVenT0XYbil6X6XDYLZoYHLOg
         LkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179538; x=1792784338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77hTM8EJJKmduk7MEyJTqP0/PRriK6Ki1atqibncfhI=;
        b=aarAvigLrZ6xmbEs93QBzTJM6uyJM+fmeVXGsusR6iws7zzzPppbif8FFPGqi3F6kx
         S0gxd1jATw36D6GUGTz3ok/nLO8ryppd7Bi+pH/7Xu8bI6oOL6swz0Y+lgtUSl74/EsD
         gf8IND0dsp7jQ3HTyhsCq1RPROmVRo4JzLiWrttwoWDzBO8QcCz9eZEM+V1IHrSyIMqe
         lNrFI9c9QComBb4MLiSl1x+R6IV/dlTHaeVrDarCwCbFfhoRNcoBJ1/NIqgX+kgWwlBL
         g2u+ZmqAs01FFsRDICxFHXcAGrTiGPKsSXD6CaoVoDp38dYugDIx82AK3W7t34TG86rY
         BhSw==
X-Forwarded-Encrypted: i=1; AKwUvBytSyK1L0MIV32AC3LEF2hdAFEX+pQAHHGeE7x/abRvCqH7lRWezcot5QEDYljzEQ6/Pd/zVbGU67pDSIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb7HlRrkkQ8ysbIGoq27ZUBWdc2c/xsPy+s9WOApML+1xyoIkT
	18EyytevriaNtYRvnc0ZlxWqqQI3ULryBlGu4EHdn7JN+1hhcnEXUZ5uOMsLntO/cqF8otuP8/T
	ih+RjeVEb1/6A5mm52mnD2n666i58fLE=
X-Gm-Gg: AYBFou19CNnlfLj1c8Fa11zFZ57dXAhB9NxUpGWcNjjt5hwXfZdLhSTt0rpRRju7uyV
	OdE4+Nys6Cd8WpLVQaik3sjGG94geTkjNbOmhJ9yBUkJibPK6Q2rXvxLlef5BBTnMQw9Q9TCcBG
	uGkiBMJN2N0tj0qRSTJ+G5O/U76TgAUGz6fv0Q5U8z7FMifu7OvWm1IOdd8LSRtBJtPDgfPxRpm
	J+CzIlKmvZDqp+32jMM9cUDj/+1uigOykY5dJLh8DJXPJgPVN6B6146Wd1jJJpkeKKY+rYZmHCo
	vAwI1YMebxQbudb8S+PftcUhQSdEqFNeoQAOq1wehs34DeJ8kZ0bG8enU5Mfs8KUSe+S2h7lqFt
	IfcQ/votcLRjLFg+Ivglm2ZlAnQxIS+MJ3rS/pMGKzcpUoA==
X-Received: by 2002:a05:6808:6409:b0:511:528d:7576 with SMTP id
 5614622812f47-53cd0b3dc69mr594244b6e.54.1792179537603; Fri, 16 Oct 2026
 12:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013011122.1889766-1-kyle.switch@motor-comm.com> <20261013011122.1889766-4-kyle.switch@motor-comm.com>
In-Reply-To: <20261013011122.1889766-4-kyle.switch@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Sat, 17 Oct 2026 03:38:21 +0800
X-Gm-Features: AclHuK9JrFOTB97m2FwJ_OxHZFE5heOx-9wmGKbfro2yt9RYpPOHq0k3WoWbavg
Message-ID: <CAAXyoMMw5ygXT7vO-GWWodY1HRuf+SgyfcaLenqnUGUvjTxjOg@mail.gmail.com>
Subject: Re: [PATCH net-next v14 3/5] net: dsa: motorcomm: use fixed-width
 GENMASK_U*() helpers
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
> @@ -36,19 +36,19 @@
>  static const struct yt921x_info yt921x_infos[] =3D {
>         {
>                 "YT9215SC", YT9215_MAJOR, 1, 0,
> -               GENMASK(4, 0),
> +               GENMASK_U16(4, 0),
>                 BIT(9),
>                 BIT(8) | BIT(9),
>         },
>         {
>                 "YT9215S", YT9215_MAJOR, 2, 0,
> -               GENMASK(4, 0),
> +               GENMASK_U16(4, 0),
>                 BIT(9),
>                 BIT(8),
>         },
>         {
>                 "YT9215RB", YT9215_MAJOR, 3, 0,
> -               GENMASK(4, 0),
> +               GENMASK_U16(4, 0),
>                 BIT(8) | BIT(9),
>                 0,
>         },
> @@ -66,13 +66,13 @@ static const struct yt921x_info yt921x_infos[] =3D {
>         },
>         {
>                 "YT9218N", YT9218_MAJOR, 0, 0,
> -               GENMASK(7, 0),
> +               GENMASK_U16(7, 0),
>                 0,
>                 0,
>         },
>         {
>                 "YT9218MB", YT9218_MAJOR, 1, 0,
> -               GENMASK(7, 0),
> +               GENMASK_U16(7, 0),
>                 BIT(8) | BIT(9),
>                 BIT(8) | BIT(9),
>         },
> @@ -3741,7 +3741,7 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv=
 *priv)
>         if (res)
>                 return res;
>
> -       ctrl =3D GENMASK(10, 0);
> +       ctrl =3D GENMASK_U32(10, 0);
>         res =3D yt921x_reg_write(priv, YT921X_FILTER_UNK_UCAST, ctrl);
>         if (res)
>                 return res;

The change below is fine, but the ones above aren't, the width is
already pinned by the variable being assigned to. Also DSA expects u32
port masks to some extent, those add unnecessary changes if you want
to change port masks in yt921x_info to u32 some day.

> diff --git a/drivers/net/dsa/motorcomm/mdio_bus.c b/drivers/net/dsa/motor=
comm/mdio_bus.c
> index 83f0212551ff..3aa1111efaa4 100644
> --- a/drivers/net/dsa/motorcomm/mdio_bus.c
> +++ b/drivers/net/dsa/motorcomm/mdio_bus.c
> @@ -159,7 +159,7 @@ int yt921x_mbus_int_init(struct yt921x_priv *priv, st=
ruct device_node *mnp)
>         mbus->write =3D yt921x_mbus_int_write;
>         mbus->parent =3D dev;
>         max_ports =3D priv->series->max_ports;
> -       mbus->phy_mask =3D (u32)~GENMASK(max_ports - 1, 0);
> +       mbus->phy_mask =3D ~GENMASK_U32(max_ports - 1, 0);
>
>         res =3D devm_of_mdiobus_register(dev, mbus, mnp);
>         if (res)
> --
> 2.25.1
>
