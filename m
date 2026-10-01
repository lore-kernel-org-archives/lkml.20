Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B034FC344
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854115; cv=pass; b=GRwDgBzPFtwPWCAiHcHeQiR91XjO0RgfSLDnYRomnUfosaYl+JJ3t5sE1aToorYojAjccASYRCFa6Gyt4QQzSnydL9NIkZfF6kSgciVgzBgdkGHwsKbNgE84xHxiSgIFVxNSIQuYM27fma1gOHbx7gDX1qjni3YKFeDa6sQSY6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854115; c=relaxed/simple;
	bh=AwszME0PVQXG1C2Shl+TVih5js5vNu61zvf1dP2CyC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8aqJOVoj2smlCfzV/MegNI+AxTY+/bNpW3+8V2m8m22ynlAQImyj74Z/ePg5nfa4GzwyGFuDNF52cDUHTH3TeWPZzHEG9ItKi3MRK49QbyFswFa3E5JYJHKOWJCpHqxAUH4AML9XM2tb485X2d8bOAqf7sGFMQ3gVMIzk3ZhdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmRgA7XM; arc=pass smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmRgA7XM"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so209526f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790854104; cv=none;
        d=google.com; s=arc-20260327;
        b=Zyq4RDAd257F68QcAEjmoUsnZm2jO5Qxh7fIUEyzflMARioLmZQkM9UE+5z2BHBMvd
         nT5Y6B53FGbDeTIO39PRN09VT8I7uLIrOfMXrCjLl0zMV0WOTKrEEgdMAPpVivrt/S4q
         AK5AB0LsJGIcp8+DW43BHSOkAbSplmBP9ioQAyTuu/AhtJ6X3rMORZsNh50e8gRS17Fj
         eJUFrlYmtP1SWhlYozX9lt45apG1sdtnDxz3TU4KrsUoCfTPfvEtTAPSrSTiCNDTEeLr
         HiMPPUx3qc5nlnRJKTRXz0zLJBGRrRV3SrrA1bCih0C85HlCzoqtWIskjlStLQRF2AoJ
         ezgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wlTXVZFyOCFbc+V/2yF4m7zDYgmRZl4N5AzvlwIj8Is=;
        fh=JOE6W07lHR5EugTPoF3cgZqi/8DaCHMa/ij64NWoR54=;
        b=PII/zhzaE1kl+5i2B2JqS8xo4KXW7atPuDT1YU1VJAwKsnTvgrjNZrrmpLTUiwygnp
         KyS/YlrQHUfUsYl3pg9luhthX/1Qsjab7r2GGrx3lWvt4QX754qZNCKrYysTXCGFid3r
         JPJ+WptICX0m14ul8SBtZoD3w+j8tmEztjzYxNb/0W6wga1JwIQzHZPcKr7mYt0hUOOc
         7kHaQvOvMgBTBbXZoecGIUbDfEK7CtYuzo47X3yL6O9S3Za7adm6nA5bLpsaRNAizDUj
         Pni5lfCpmvRdMxGWFV6XWbjerqfKAbALH+i5CW+PbBF/tG+/TFgUk11AbZXCwIn0xy+2
         zjTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790854104; x=1791458904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wlTXVZFyOCFbc+V/2yF4m7zDYgmRZl4N5AzvlwIj8Is=;
        b=hmRgA7XMkdEUl5NDDcgnxH6nPHV45XbFOLCGcbW6yI+zubzTerjygoc2LBiwsmEZMY
         Z5sVoZc72Xc22ckzOZ2IJVDFOpxSGVn8Uw3mPLFJKbE6IX5hsi6ocKjWNa3VpPTIGEIw
         vEz4TFynFiB+apqfoP18RiyMc/TgfInaxGvebKBiwx/xzcccAcMXPsAKMX1/UChjKbVw
         jr47EM+HKDM9cvF29ONKb1phPGWuoZ2rawclhn93dovhH4dlbnsxXm/USeHV8OZpVdB5
         1bwQkcTF7V8nOyXeX1NfHfGV+hJj3iYn74DPrTPbdZVYztIEKyDhoADHfLlDaIm2iS8Z
         lE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790854104; x=1791458904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlTXVZFyOCFbc+V/2yF4m7zDYgmRZl4N5AzvlwIj8Is=;
        b=BYhr1rRDMi+pO7FcTpCdL+ZniiEsarOnz/3VU0tHwAUFdtutayPL91LjQdDyHynLJB
         f/y2IaBv76NGl6S51e6rwYL37uFEyrJGYm+a3hqvaQc2z0MoX+h6IvkcgQD0rRJZECYr
         9iOdJRruMQsIIF04ZDzWFCJ4RN8zjG/OOI3KumxP0MjyRBdQokOgXqUp0n+7Tqd/adfR
         9V0qppbSeMZgTZL2bfYpy4VNpR/ZcVo2GlP4GZHp+OPYT6X0CfyzMf1FIGZPdRtxGafB
         z/lsemzXKezKVrC2Z9qcLpv4q5EEVctYu6CY/2ZhBCK30pW6Dq0u3TMtQudU6255CY+h
         qwFA==
X-Forwarded-Encrypted: i=1; AKwUvBw1XoxNM4Uc6g64tF5HsK+E4N4V4TEGGpvZRc3A+0Ny4sAgTZwIc3Rkxnrwi+YBMqmmFqgNOvR/sVQgmqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpqLC0bMXXVydUpO2L/ItguzwUQOaAiqKuISOdt5ruar/s04zc
	b5IOp+VXPOefmcr6PHNgz7HwOsH0dExBRitHfDH6qO3Z622aQXREkx5nqKEI58i3zdI+oPOujWn
	LsuwEPhw62bVa2e9utHVfpmlVxLUjjTw=
X-Gm-Gg: AYBFou3Bgmd7O+fgqsjfj87hqq3HoDIeGkKHKtKP1hNfvrlscWU5hjvb2SbdubWuCIB
	+kaECUW32vum4qpophXv0Vwx5e7o5Q/Asc9JRmGxw54+4yUovQVMtZUPiga+J3cXh83FtTVd+Ga
	uJpILE6XQbINvJWskspAhPq3kXd8N2K6X/6r8ryx0MdN9aKM4YURjGHKhHl5qKMdXTmIuMO5e9m
	5xL3CwXyRs84F5+sA2I3W+cqxgbGKRd7ua+CDG1icGt5fNECegAwetU2uHq8hNCRRG6X/6RJ2ft
	bXgGSwEf+jUBgE1ncBm2nnUmmGw8mxCmFO8X/Xv68z/jXCjXtA6Spd6BH8R3cpeGcnz7W0WWzav
	oixM5gFFm1f4/v6WpLjxsLVkthRJsYhVGub/pq/Q2zw9c6IFvcxGVvohcg8Ru4Z+Sb+6ZgaYoAQ
	==
X-Received: by 2002:a05:6000:290c:b0:48a:fcf8:20d1 with SMTP id
 ffacd0b85a97d-48b02550600mr8872303f8f.48.1790854103827; Thu, 01 Oct 2026
 04:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-miic-validate-dtb-v2-0-1ee3d33748e9@reliablecontrols.com>
 <20260928-miic-validate-dtb-v2-1-1ee3d33748e9@reliablecontrols.com>
In-Reply-To: <20260928-miic-validate-dtb-v2-1-1ee3d33748e9@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Oct 2026 12:27:56 +0100
X-Gm-Features: AclHuK8F6U7l3QWG93hRCdan52bWlrmjNJx7o9EjG92O3k2nxmSLT0XW8-w3RDA
Message-ID: <CA+V-a8uGauEQZD4dT7woBmg4b0dqgvWNQ7JCdCgpf4U=aZ0X-Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] net: pcs: rzn1-miic: Fix port numbering
 on RZ/T2H
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

Thank you for the patch.

On Mon, Sep 28, 2026 at 10:19=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> The port numbers on the RZ/T2H are documented as 0 to 3. Update the info
> structure to reflect this.
>
> Fixes: 08f89e42121d421b ("net: pcs: rzn1-miic: Add RZ/T2H MIIC support")
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index cb74861e823c..df70309c2d97 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -838,7 +838,7 @@ static struct miic_of_data rzt2h_miic_of_data =3D {
>         .index_to_string =3D rzt2h_index_to_string,
>         .index_to_string_count =3D ARRAY_SIZE(rzt2h_index_to_string),
>         .miic_port_start =3D 0,
> -       .miic_port_max =3D 4,
> +       .miic_port_max =3D 3,
The description for miic_port_max in struct miic_of_data needs
updating. I would suggest renaming this variable to miic_port_last.

Cheers,
Prabhakar

>         .sw_mode_mask =3D GENMASK(2, 0),
>         .reset_ids =3D rzt2h_reset_ids,
>         .reset_count =3D ARRAY_SIZE(rzt2h_reset_ids),
>
> --
> 2.43.0
>
>
>
