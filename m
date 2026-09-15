Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6490472093
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502656; cv=pass; b=Gb6oXT5iutXyywSoyChRNr0sdj0gR75jU824owI1gaHv5o4tgcAaNz3GjOOJ6HnihEr1NWoJQtimeXWkM3jzjEzDxxsWnJm3E+rXcTJcejAcTUtVeEhxgONpbol7toVis5NGYxsLK2gfswxd6oPlQ8Y1vEJJk0weH2jL+TRtmiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502656; c=relaxed/simple;
	bh=67tAq1qJhAYCAKyoVSg1Qc+3onHjSmhgjfysUABNfB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQCkYzstEAil56z8hxdPVQ/1RPZ3SMFb3VZHZwgoU3YTlnvWEFUCYLQwhdJDIR26McKv//k4NnLhzf6U+BMONByJN13jALAV+wB28WAkykVeEwL8G+fKbC6xoN6vgtNeJ7PXvL0Nc9WDKt9ZDtzeathWJwyzrTyM3eBPj6GZ39g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJuatJKy; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJuatJKy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so1182055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789502649; cv=none;
        d=google.com; s=arc-20260327;
        b=MqybBjKtnT7DCzvQDHqjdKPWXazXNCbqmhRfDtpiqbLUuKarLiugpxExc/r/U8zgFo
         1O5grykvfP5VBjKrJnmNuhlG27Bud7UVgn2qvqXdgm3+Jk0LG/sXTX8CO8114I0LoWeC
         Hh7XtRBmVWXYp19KmlOkuL6d30ayXqwzuMxLTSCRTRx8aQF//d9qX+TxGNxofEiZd8S/
         DP56BrvX7SWRVxJzxHVjvBwvggUERlYnInRvu8z/2qjKhEtauWvY29xcUpfG3BNqVAow
         8NZcIXDiXJ5GJmUoiCDPsx1eILdXXTQnuVmD9BKHyAupA2VW6CNi28n2c6g1coouI54l
         a1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VbWmhOGlJLhxr01yrGYucTT6Sp4rdowe8PfmPHelJMU=;
        fh=L6ei55+wQ7uSPOPEG7dayZpkkcFfgsaFYrOzwi0mkoA=;
        b=GuGvB3fb8ymdkd7Qi3tRkfQAa4oWRywdzIIXDP7Kh3v2zmK/FuoMO+/UOxIMp6y9kd
         3rOGKFlU9DsRB/tNUxoQKIxhgzmSIVK03zSdRCMK0oYzLeVnTrGt1MUfdukcQmDyIrvR
         LkGKdrs395EYZ3NMQniI3HGypqRLzGMObqh5w9XXQaTk7rtou0th4c0NEw1RI2p2FtcG
         759F2w/2UTvhOdyviWmdHb1kpKBal1h5wNuWSPGDjNt0f9F52jj9SjLM/QIkzVgax5QW
         JKZVOAyGv/FFMSrVBEgg69rgQ9upIo5phKrkxGn1o48EhppE9s74FmGr62h13XI3AofW
         DKuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789502649; x=1790107449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbWmhOGlJLhxr01yrGYucTT6Sp4rdowe8PfmPHelJMU=;
        b=nJuatJKyLYsQ+Q+dYlM9q7v38jxcSKQ3AXVTq7p4t4H+1BAZwsLVfJjQUYaXIRueoy
         mdW3iK0EXcioFKKEGxpx7fo3c57yWDzGKGeHdw00u3RtckvWatA6stl7nqpmvcq0hFvV
         xeRMtnEAwsCdrfN3VhfcnhCY35jOq+tY1h2BWmvNd4p4UlYrpU/BMlCrsUS1nrRmunc3
         SCXvi2Y9KzkmIm+S9sq9etWjLXATTjVZQ7xTjOUmsOPpzhHWNkl4M9moc2O1HRtawZMX
         aAC7ebxYXgQt6heYplL/hPl+feIjZ4z/HtBEwMSwMeUrwFB8alSdKWTDHS2lnBn9M41z
         qlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789502649; x=1790107449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbWmhOGlJLhxr01yrGYucTT6Sp4rdowe8PfmPHelJMU=;
        b=uNdrEpX04Mk6L7JuWDEz+nXTGFj8gUxY9TAXGecUTvEI8+kgyXiQdE0TK/sbBdPp4Y
         mPYooanMY8SdzXGSLwvkiDG+Zw7k1MwgKIeMnLclVojmX2pt3O+saWwfiRqR/g8Q8Xko
         z62wNFxcZXTuXdbkDFAr98dzXx94b/pX8gxTuTRBZbXRgqiQcrXSoT1NCmYGZ/Jy7412
         ZDmH2b8KnDzYAWYI1a3H7p3N93wRcC51SJhOeZud8k6wdHzOZrmclUbnm/+SYrlzS8OC
         KX2TIpzE939dYnPtG1qHDKT3Wl9fPOXCXuTklV5UefWKVtlpJwjJE1KHKQjagMarHxjF
         RvHw==
X-Forwarded-Encrypted: i=1; AKwUvBxlaXzNrezVXwm6qHvy9X+0SVQYTC/9jBiVWZuH583RPZm+/bii6ZgePTXj9g3+8biB2wkeEU3nJHNFOGc=@vger.kernel.org
X-Gm-Message-State: AFuF++loktWysNTGL1zMipWIa4OxwZ+GwsaHzP168SrWQiDQTfy2py4+
	lmkzEzt6gLy08cAf6ZfIzq/uNpJ8p2SSUpmUa0THKlkXxZ1zyaAWZzuPnVjHrTB9J2H8CFs+nJr
	woEsuWTy5h+C+lOxn5trFjMsMKsWF5PQ=
X-Gm-Gg: AYBFou2UtYEY92nDuCKhfkdU88nDBUQgDxsQuJfwHGF7k4socvsrDZtmFYmtK5XR/pi
	5wqZXFIxFZkU3hcb9oFhoMQO2z3MAGtYKpfxm4PZigkFqwB9B+XmOQPNXHQeBnjPHV3BEEoU14d
	SJOnzPmDmpsnVr3g3i/2ZAhL+1MXZ7nJx+4zJULI6KDcQHqZSLt2Jn/NO1ndyLgh8cic6U7WEyt
	St3ALcJnW8FI9I0/ufixyhhnMUJvSdhDLoLbTgdG+8Z6P5HIC8L9F8ynt9npkbTd4jLkiVxKYwK
	nBARPGZZXhvYD58DcSuJlFY4fn0wW9vrP2BMP5CdUKGf5+Yxre8PgkNF2hTtcpCPFqqn6gprOqD
	KHOIzwdrICRBRgoSG6sC31RWubSoZ7OIp5b7qk/cPd3M=
X-Received: by 2002:a05:600c:8b23:b0:49d:1d6a:4cfb with SMTP id
 5b1f17b1804b1-49e8222d175mr32905135e9.1.1789502648344; Tue, 15 Sep 2026
 13:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-rzn1-miic-fix-array-v5-1-b7173fd5b97d@reliablecontrols.com>
In-Reply-To: <20260915-rzn1-miic-fix-array-v5-1-b7173fd5b97d@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Sep 2026 21:03:40 +0100
X-Gm-Features: AcwNN1W_W8KYsdZp3NjvMcl83DNtuo32RgFL8XJ_q1dWoFykhtUqHGE8Zf0GyvY
Message-ID: <CA+V-a8sdrexKiRE_Mev=qRjRdbnx7GoPhsDGeAi0Gpmw5QbaHQ@mail.gmail.com>
Subject: Re: [PATCH net v5] net: pcs: rzn1-miic: Fix config array initialization
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 6:54=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Fix memset parameters to initialize the entire DT value array
>
> Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data to=
 SoC-specific struct")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
> Fix issues when populating dt_val array from device tree values
>
> Changes in v5:
>  * Target memset patch for net
>  * Drop port number validation patch for later submission to net-next
>
> Changes in v4: https://lore.kernel.org/r/20260914-rzn1-miic-fix-array-v4-=
0-069112feec86@reliablecontrols.com
>  * Fix lines longer than 80 char
>  * Add of_node_put() before returning
>
> Changes in v3: https://lore.kernel.org/r/20260902-rzn1-miic-fix-array-v3-=
0-3f7dccffaf5a@reliablecontrols.com
>  * Make invalid port number return error
>  * Update commit tags
>
> Changes in v2: https://lore.kernel.org/r/20260901-rzn1-miic-fix-array-v2-=
0-3e907049e770@reliablecontrols.com
>  * Use a more correct array size in memset
>  * Ensure that write to dt_val is in range
>
> Link to v1: https://lore.kernel.org/r/20260813-rzn1-miic-fix-array-v1-1-b=
58cafcc917e@reliablecontrols.com
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 2b72fa98ddf1..cb74861e823c 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -683,7 +683,8 @@ static int miic_parse_dt(struct miic *miic, u32 *mode=
_cfg)
>         if (!dt_val)
>                 return -ENOMEM;
>
> -       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
> +       memset(dt_val, MIIC_MODCTRL_CONF_NONE,
> +              sizeof(*dt_val) * miic->of_data->conf_conv_count);
>
>         if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0)
>                 dt_val[0] =3D conf;
>
> ---
> base-commit: 83a945a529d6e002dd7339c532288a931f463dba
> change-id: 20260813-rzn1-miic-fix-array-e6ae4452c017
>
> Best regards,
> --
> Kyle Hendry <khendry@reliablecontrols.com>
>
>
>
