Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389765505E4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996246; cv=pass; b=lfZL7/+hjQOGeE5dUpy0Gaa61RMZSO0tm+8/zDrxSXwSNfSqaS8VNoCIv5nBTZw9TsFJL4/F/k0QUM0GzYNGtIQf4mqk5v+fVHHXVVlNrdGKHyFd1Mn204tn5lai+50stT6A98hxp+nxEEb9gOc93jRmgCzDsfknlmdWJLDTYW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996246; c=relaxed/simple;
	bh=MMVXINMr7JZIMgeHG/AqGaqfPCjKzr4ZpfV8KNupDrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGrj6XNtFlH4Iay62HNydsS2eSD1YnRbLg14yr8uIYARFNllJ/hl/DpatGMYNIhgDGOd4zVP4jauKLPv1laVq71f4gBaulbdvFc2MADLWCRJl7yJXVhUk0xscJDlkM8hkQ/6iDySsDeUyfIquINwuMrOEsTeDfiP2sVMIoXXzB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITh5ZqJA; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITh5ZqJA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c45111bebso2710147f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996242; cv=none;
        d=google.com; s=arc-20260327;
        b=lbJ8HZPS5SkZENz4bjw73ZL1VNnPreSxW0LZeer8yyjmpUqWbJ5NHPOpsqYfvcIVLe
         DJaG9o+qd9Pylrq6XdPAa7X0ITd4NFCQDeDqghAyN4GFAaqME1/fivDaT8FNdegC1Zsv
         i1pqhQlffliBykVqkbiH9mIFF5v/9178tTEI0NS4HUtMkltK5PIuQHBmWljR2NaXOHiQ
         9C77UaLi2mi+QzrmZ+CK3+u35/+MUTaGdAPOh6t1sKU+MSoXAdgH6aTNljcR7FP+WWsN
         f8j07FgRdlabDm7FjjdCprucuFUvf20H6FvvBCmC9H39F7jG/8SOrCQPlfXWQn0JsBni
         96ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9q0DwdLIhqOGN7zNyyRQRC7CNxZQsLpoJL1VH7y7f/Y=;
        fh=K6z77Rv+WCLVzA4Bafypy7pCPChWBbubxgPCAC4UwgA=;
        b=n8boZBgloyVy3ffdh2JnOMn9yi00NzWkgiKz2zMh3Zcpe/US3mxzt+d7ZdnUVHF1ak
         1udVk6dfpg1G/T29JcgXqZ54Y93zzeDR5EFJpTRotDcBf0DiJ9o4vC4J9dSNu5y1XeJd
         /PQxyKMUtnpS4U1Vij7wV8+zlweJCspJY9MaBpl2lU+b8OZMRftac7TgYn/dC8xMg+eU
         MBCdG8qRoaMGUe45DSwWX5AoHawtmy+nzNuTDOBBpVYM9PE/nAJ0/Bwl0chzsalPmvPr
         gUzrMDaAPITVG6Jps+ZwGvayE2jy0PPMlf4eDUoi+rizPhsaGFZX0rZ6rbGtSHjp8h+K
         E4PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996242; x=1792601042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9q0DwdLIhqOGN7zNyyRQRC7CNxZQsLpoJL1VH7y7f/Y=;
        b=ITh5ZqJAGwUOL+qfGJ5aTDDRPWjr/F2s5ihb2gm7iLg1wULunz/3uz8Tld7bXRQepF
         LRwChIWZxumyb7DM/dsI/5+hm6Ks0TkoTKm70QllgZPgwsD3TNGriXksOxbwCWKd0Rs5
         cVQk3vVlHCKQkaQRXhQJMgcV6wVOAE49kcKVxsEA/k4FJIx6RWAsfQAXgmWkRfRkwQWY
         NSLMpbLWNbS5eS2B5m5NKZv+zb9XCIP4E+qpnxN0IVTbPSNy7h/XpID9J3dqlqMx3A0E
         Q318TeIJISdhqZo8fqJOhM0QkuBViOyaT+RxQ2Pihf/QSPHxxqzAdbVaYSNceYD3TL/H
         6hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996242; x=1792601042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9q0DwdLIhqOGN7zNyyRQRC7CNxZQsLpoJL1VH7y7f/Y=;
        b=jOUvEwoLAOQDmCCCRucX0SBNCiOwPT2vB0001b4y/OecpzrsNI6uW06vtjgf9IIti1
         QwXrzxYwz2YyNe6InAWbJz8q54iqAwEvEKwYHLEkXhgY8mMmpUHMXqB1uEgr4rT2yGgU
         D2yFY9H4bEmtBN4q5t6F92VvJ0atk3sXEV87sTrROUlrEZEjxuBwvW16GIqMiQ26hB9x
         2nLD+q7rXqGBBO0E1ty0EuxzI20ZcbkRZptWfgHWDIr3F6iuUfOAGacFTKfbAUm17AGr
         5MBtVFtf8UFA8BqfVdI169PH4qmhlK6xYUmSRLJT3DwKWgZob2bli03bL6fJxUlYlxX9
         P3qA==
X-Forwarded-Encrypted: i=1; AKwUvBwn41vhSf+uBElBhBo5PrllRQezG2Lrh8Gk+xgbCi4zZbDN5ghahNxQKEsJQqiWij0L0j7jjzP4usI8Aqo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVHBLoXHaw8edmog0N64fMob3JvXAcOntVZaSkAg0tPTNnAgk/
	U5UYBGkjKLQJcCHC4HFvtQ1mDDDF7bs/63oWYXI1+agCVi5KBfxwMdjgLnHAt7rLn3ZBcwDRdsR
	IWUrU3RUPUuDKW6MeNJ25YzVDRz3H6/s=
X-Gm-Gg: AYBFou3JMubBnWo4OBOdRswGXH7HRJb5GYUDXFmR+zD+foMUVA5UlbjwMXpNBWprab+
	HDVtnwOmvCJhWOBJhddhIGXUuVUrWx5zZrGO/a76ccnRJ0slJ/+S85R9FcrNIsAHBrWVwjYTg9Z
	hdX7Bljl3sQs6L+joObFtP4+4fHbKLxRUyjoSUFhUDASa08JxYKZiIv4DgVvl6DjfS6pccvWdu3
	4KNVIkwhGM1n1EsKGZc1A92sLmpQBlhF/MPAi+hixr7i4m7VsUi0VFZYzguWBTNvQ0kgVUzD/Uy
	5yZn41MP5D7DGmtNjuhiTlCZZSi9Vjq1lfGPe3ZGGr0xGW0lTKZxT5znklfjY8cpLrn148/MFR5
	oRY3TKajAT7r87BUVro9j3YWF1PM/jDCZ/DGQsm1hCfUS0ul9jH2lF8xdeMxc2C4r39gzOjTtqw
	==
X-Received: by 2002:a05:6000:987:b0:488:7787:469d with SMTP id
 ffacd0b85a97d-48df14ed887mr2129597f8f.25.1791996242209; Wed, 14 Oct 2026
 09:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-miic-validate-dtb-v3-v4-0-b7da71b3a106@reliablecontrols.com>
 <20261014-miic-validate-dtb-v3-v4-2-b7da71b3a106@reliablecontrols.com>
In-Reply-To: <20261014-miic-validate-dtb-v3-v4-2-b7da71b3a106@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 17:43:34 +0100
X-Gm-Features: AclHuK9L-1D3Yt6ZN3HGXxulOCvvWz_eF-6S1YFQfIBvUb-SHdPO_MInoJxTrNw
Message-ID: <CA+V-a8v-YXma2NbeWP0Fhz+Fa5gmmq3oSPEZuKrDZhy6MHWcMw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: pcs: rzn1-miic: Validate dtb
 configuration values
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 4:37=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Bad configuration values from the dtb could result in out of bounds array
> access. Verify parsed values are within range for the SoC and fail the
> probe if invalid.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 31716241b58f..f8bafce26bf1 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -693,16 +693,39 @@ static int miic_parse_dt(struct miic *miic, u32 *mo=
de_cfg)
>         memset(dt_val, MIIC_MODCTRL_CONF_NONE,
>                sizeof(*dt_val) * miic->of_data->conf_conv_count);
>
> -       if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0)
> +       if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0) {
> +               if (conf >=3D miic->of_data->conf_to_string_count) {
> +                       dev_err(miic->dev, "Port input configuration out =
of range: %d\n",
> +                               conf);
> +                       ret =3D -EINVAL;
> +                       goto err;
> +               }
>                 dt_val[0] =3D conf;
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
> @@ -712,6 +735,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode=
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
