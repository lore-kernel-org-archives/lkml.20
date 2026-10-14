Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BD64F6484
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976847; cv=pass; b=f1R/NhG0r/q0q+bktuSl5wLZVrhHuLYEa4BLsig1inQtsPdSDK017N5yxH6559VM7pbflN1DhSyeq7uCaiywMgbkbHPZ6FieqvTivnv5MVW2L0Ke0DqFXRe8ZGcr3B0CriA+K8duLmZMso0xDXFx5HfcXOqUYbCK7u2/XJQKad0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976847; c=relaxed/simple;
	bh=Dm1smR04ZivAMkU8QgbMvCQPxO0lGpCaWtgIm5vurN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Osb3UzNWgEDYs7BARuDVoBBYcuitlInIL4Z0t+JOMs8yHtGviU/UKZ/hMhInijGfLUCTA4cTIl8gsnHZS8O4vGDAD2ePeTGCLHvwS4LaIdQjg4gfXrYKyjEHobVOVogRn3n/AVvJPXm5jpnBTwAJeaEnaHzat096cFA+n40aCCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCp4paHr; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCp4paHr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so34951185e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791976844; cv=none;
        d=google.com; s=arc-20260327;
        b=I90+IxqIh6aWz12JG2s4PB06zOhCKFEuyfWPjQPaR3jX+tLNk5D4bYzgZWsTsBqKG/
         dZsjwrHvS1/dd2Rb0Lyo+y1Zri2pSb3EOOZhnCBq9rVzJDKPfCWp9gUHEnIaLzxhfCfn
         gHJjRm7m663eaiFr5g3a+Vx0MQbEZr9lp1iG4gzmGYPIhlIPJvp99jPXMRrPaidEZrtZ
         hCxw3OzDNez69W8JMtKgw89xIJnYNZcMOeQE70TKmrJZrUCHz2ahKWG6Rnlc2PQ5iA4e
         +YBrzeQ7GRRGzqfV3PXhV9r4aegn676cQuUU7zKzqh+3Xaw4LMoJBrkz7W9FM8L8PTTv
         tq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bO5/h39EF/Oj8X3PFjOOqCZcmmbplUnPDUCoN8XUO3Q=;
        fh=13WHpdli3d11ivXoqPIunuw13eZzSmq9HCwmw5j2/H8=;
        b=iIQUjpxChkw8SeBGxP88y6UsSIl441AwckJzQSGMBGvo4m76T/G5ZEO/4h6GoME/GP
         RZjtSynrHwsNPDx2y73upf/wvVN63lvQoG9bOBhRXkZx/5JuSKwj1WsgAJ2j82wio7m9
         nqN4RVDRgmbXM8OvRy/vhsyCzqpVmK9AEnmzlpI7m4g5bW9fQZekmvqJtPK1ugyTTOY+
         ilgaqP0l2WAc+tWw4V5cG1S4/AJKClrKU0PKFNdldKIANi/8ZHXQ6q9dqDyuB3zHzf+c
         pPixN890CkQbvHRIM7cU/bNXPuwjXVe+HrpYo3Pb/+iTiGLcRB9Mq6GGf+Wg2IQBs75x
         ONfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976844; x=1792581644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bO5/h39EF/Oj8X3PFjOOqCZcmmbplUnPDUCoN8XUO3Q=;
        b=iCp4paHrczB97BfRM2s9Ejtsf1TkEplvFt/4up8zH8BGspsqNcbsc8Gs/mLEhTgYj1
         sGm9CCM/komsQ9lr4+99Re+Ecjnzvps5UpmidI7SVbnMi3dATbEfhxdcftQg+UqM7Y+n
         m+tZ+c49dRFnc7yGaR08maSAmdg3qlMfZmXGRL8El4Zqo4AynX5J6oOxh7Y0IjW0bPu2
         62/B8Iaa5vOSBlTmTeGLZ/NJquY7xWH9OSIRywvO8skLVM4lrYrr+LDfZW153CABGMsj
         nqado3o3DM4ldUL4D6VxAOSTzOSl2GCjXxKzXnuVYbSGyAr/SAPxJw7uXbBt7utwCSst
         mhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976844; x=1792581644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bO5/h39EF/Oj8X3PFjOOqCZcmmbplUnPDUCoN8XUO3Q=;
        b=lYhBCwc0LS3q1cB2mrRiNmSt7Gw3717415VbZ1aRAozGqCJCUEEOYQVIehKjxQNw1w
         1MISYOe6NjpN+kn3UXbNiuuzcTN1D+vwX1gLe0fxN6hwAq/+RSuyXVC+ffWZLVAmP9hu
         mSRpi2jYCcfygTB7lnkkTFhL7spMamPNif0/Hbxn2gJrXIBDc2AMo4goIq7kvA1YgAU5
         00JPhMTC9Ry1eTgf75H9VMcC+E1whUxMrXhN7k5R7Jhoe5Nt+sTCdpuzRRTaZov2w5CX
         WmH68Vc96fsUL9RpQuiNlyOtAV1o7y/o2+5T0D6yyV6gpjmIYApvHHupH/ZxdriL8gsV
         gWyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+dD10V84BOZK5uGh0viFrIuP82ZHSflFCum3fKloL7mYejNg0KzU759VBSvRfIAz2PxXwRyLw4iMSqC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA1Ge0vv056eQaJ3AwHLdqYk/mpWja/HGaSt4EOc4HL+/VmCtX
	AsdsuMkBkDq4u4+zcxFRx2z2CAT94SN0XF+etUmKvqU0affzjVNM6BsBQ0Z2emEQ5oTSCZWdm8F
	7tDdBY/3gBAA9XHznetOmOe6KZ4E9Kqk=
X-Gm-Gg: AYBFou09UnqCuu2gvO2lqt69xL70r/cSY+kzzH1Hu5IljY1jvQ0BOwSKSDv2ldd8h3J
	aqnzjlJa68xMUtEADNAOO5c1RkitFn58QmN8cJcm78DnXCDmFb0684+vRoiv3s2Z11kd6hq6yIs
	HFwCTDto41KdrxWYuahXnAqFvc41tx/9GFPLJUe/h+8ARm4jsdVuiotK14+quV4QMuHTPCOvDBD
	zq41JZsjW8WAD7BA2oYAY6cDy3xmfGBFwqEuxWwCDa/Qt1Sx+HDG/7QC48aCXtd/dQUBdvBugQj
	tVJStjG4RATzVRcaDI8efv7jaAC5051xHoc3zjjMxFdQNjo/fYVGV62SBhJpz5UMgjLNxxpZo5y
	anFJ+m8/9VFxVlRfIuTOWT7sHTWoWZ277d1jgLb3EWInxaWn1psdR9/pEQUX8S9WXu1ibYbwkIl
	lZdJx0nJACHw==
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id
 5b1f17b1804b1-4a18e4b8966mr285168845e9.26.1791976844095; Wed, 14 Oct 2026
 04:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-miic-validate-dtb-v3-v3-0-68617b3dca5c@reliablecontrols.com>
 <20261006-miic-validate-dtb-v3-v3-2-68617b3dca5c@reliablecontrols.com>
In-Reply-To: <20261006-miic-validate-dtb-v3-v3-2-68617b3dca5c@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 12:20:17 +0100
X-Gm-Features: AclHuK9lTkcKfev6iJ1zocn1hec2LLI_EBu29VRkVnV_MFGRgCWPxR3baUck-N0
Message-ID: <CA+V-a8vZmCia0aRyx_KU+_3Wz4JJNOMG=-GC-QXcEL8RaE3-qg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: pcs: rzn1-miic: Validate dtb
 configuration values
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
> Bad configuration values from the dtb could result in out of bounds array
> access. Verify parsed values are within range for the SoC and fail the
> probe if invalid.
>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 31716241b58f..10622eb654d2 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -693,16 +693,40 @@ static int miic_parse_dt(struct miic *miic, u32 *mo=
de_cfg)
>         memset(dt_val, MIIC_MODCTRL_CONF_NONE,
>                sizeof(*dt_val) * miic->of_data->conf_conv_count);
>
> -       if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0)
> -               dt_val[0] =3D conf;
> +       if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0) {
> +               if (conf >=3D miic->of_data->conf_to_string_count) {
> +                       dev_err(miic->dev, "Port input configuration out =
of range: %d\n",
> +                               conf);
> +                       ret =3D -EINVAL;
> +                       goto err;
> +               } else {
> +                       dt_val[0] =3D conf;
> +               }
> +       }
>
>         for_each_available_child_of_node(np, conv) {
>                 if (of_property_read_u32(conv, "reg", &port))
>                         continue;
>
> +               if (port < miic->of_data->miic_port_start ||
> +                   port > miic->of_data->miic_port_last) {
> +                       dev_err(miic->dev, "Port number out of range: %d\=
n", port);
> +                       of_node_put(conv);
> +                       ret =3D -EINVAL;
> +                       goto err;
> +               }
> +
>                 if (of_property_read_u32(conv, "renesas,miic-input", &con=
f))
>                         continue;
>
> +               if (conf >=3D miic->of_data->conf_to_string_count) {
> +                       dev_err(miic->dev, "Port %d configuration out of =
range: %d\n",
> +                               port, conf);
> +                       of_node_put(conv);
> +                       ret =3D -EINVAL;
> +                       goto err;
> +               }
> +
>                 /* Adjust for 0 based index */
>                 dt_val[port + !miic->of_data->miic_port_start] =3D conf;
>
> @@ -712,6 +736,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode=
_cfg)
>         }
>
>         ret =3D miic_match_dt_conf(miic, dt_val, mode_cfg);
> +err:
>         kfree(dt_val);
>
>         return ret;
>
> --
> 2.43.0
>
>
>
