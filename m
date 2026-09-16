Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42BD30DD05
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789597783; cv=pass; b=hHG/4hV9GyFAHx70P9ZIe5vB4RqFy3kM7hqyCqaTljrkTLbPs0FdNj18zb3jM4wqCw2cK5qMyfacu8q911ZMU5EEnghV4MiIj4iboAER1+XVmBQ1CjRp4jHuPoovSVAAWfTzfkkwplkimhT5vSyHduG/Jzuc+cy+/DQ0WWB6HFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789597783; c=relaxed/simple;
	bh=pGZ/71YA8CSBb9++N0cC++WjH4Vc8ogllmY1COp7VX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGlnj0//tjwPZbQtD8LzCE0vPuwL5xqSTkEJiXy9Vol/GR1QepMP4ZpNV8sJBsQ1FTcGNvzmof/P0QmHXbZWkVFmpt72L2gYpAD+ZYniZEMPZZO88QiQ+Ox6db4x61MOudZyEqaxvznjWvp+jSBkXodKpoG7kgj3N1SFukpFpKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VypkWEso; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VypkWEso"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c169ae1cb26so18169466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789597777; cv=none;
        d=google.com; s=arc-20260327;
        b=T7Am6b15BLO7k8zE8FjiXDsio9i8LHtwM5wz7eY1+zgtsGRk13GW5q8IDYZ1ft/Laq
         dWmazzZTtP0fOwfZQFSZPUJQjZ+E1NHrBmydRc8sz9GJ6sz0jkXazAIet0CKSfplcVuI
         jCI7r6FZsIJxFcC0YxqS/CmIUxAa67YnqADJn3UMynUpHaclyFkPRYnKLgfe+5pl5dbB
         UnCqPDi7TQoJNTkDh7s+kyqhTARMDgAT1COXxT55a3atWqyP5R03VJJn6/Fw2tX2Fv6e
         eGwx1lq/+cwSr748qiZYbBuT9/x3yPnGgC7je0FFls0nXfNzoJCIkAGkeUFKqU/QfSyU
         6FMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S49vLPerQfvIiWHoJPoKgafWU31+ORUFFMofvJ5+kis=;
        fh=AMpd9AiQPonSDF9Fvkz6hvIbACt/zG4xcNtMCAwUhtY=;
        b=eywMxb12oA3TEjiloqZRfRM8Bjhd4TZkb5lj8Jk1lZN/hL/1IAJV2kSEDacLJrarGy
         wHPwBQ6sqGYYAgiSzv1y8iRLv1RrrucHMjmrJ81xjeU7h9UyDf9W0q/1iTkAsLusjVcq
         AIpdAufGs7Hh02XsmKaLbM6eA/13sv9b/Hmtc2bKDl4O/UhmpcMEmMtL2YZOFJJYNrNr
         ceHobPAXxap96VERsAwmYGn2S9/i0HgJHuUM260SIyeZrhc1cYAWCfdarGy9m9WTfk9H
         f7QaqCQ5GICbfuUTYjTBiWyY0lTei1JApsNXdvGWcMtRHTq7gTvDNySuB01n+5nA2XEd
         lJcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789597777; x=1790202577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S49vLPerQfvIiWHoJPoKgafWU31+ORUFFMofvJ5+kis=;
        b=VypkWEso71wPY8UypkK/YhjngRya//EWHCTQqTvynK42T4Gxq81DBGKWTKnRwgqPxd
         J8h4SFRSUp4ayk7TPxW2Zd9GcqQsgv69Ke7y+Ja9wIHGsONyCSdNNZuGUaoJVzBjG0ht
         BcTrFrpIfM5vEafjt/Or3GwTHFQVytQkdKhKX6Ll90HJxjzesx3WSUoFXcAoNtxTlgd+
         xMWrNYdy2j4ZicCTVdTCXIFQquDM9YxznlX1TqpTRTFukgQSN0WbsCd97yyhftAptaxG
         9Zg0aIt0gj9qD4N/kn7QZNjwjFgjyFZLi06xSOupLTK6BXudqEaVVkQ7WAEFo7LPiOai
         eckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789597777; x=1790202577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S49vLPerQfvIiWHoJPoKgafWU31+ORUFFMofvJ5+kis=;
        b=2075AFpkCzPMI9S/4HicH0+S90HPQ9Zz/pEoCoAcH11ADtekZom8KzL2BkJivhIq7d
         lCYYk/Ohlz8EMofEcXiDrOdbVilJG3amEaSkVisWRUbqHr7inhuOnJhKjIab+5yQaMyP
         cOcgHVqNEvYwJqiCZlOA7PTQ6OK1IlKQujRUfP06EM9R5YUxim0S9WFIFJtY35bRHcbv
         BbxjO0+BoTtZD9we/C9LKF6p5QiaArXl2Ku01bGgZzKsRRWbXjkb9YXDjh/nSm+asKoa
         3svdJEw0xJ2dnTRtmieuTluTXNpzT4fYdISe4PJ9/QU6LFvdzQyH4z/nRlamy2S6ZFHG
         ezWA==
X-Forwarded-Encrypted: i=1; AKwUvBzsB/o1fEChsX+ZwNICHoRliLP8MsA7YIKA5/zW/O2zUQdN7d7ekKRxtzrJVNmK4HzyiaP1dnlhsJzYPPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mOTSEcvAyI0Mkl7CdomGA7FF7foKhUwknTiN+Qz7Ya7CKfkxN5
	xOiBEAZSL2jIP6bzSkNw/Ku1x/4PKPYIRXvCDTuodyykLFGLxRzbCr3O4JP40GOPseJ5ZauHrHR
	606j/Zd20fYHNYi/wrZNVSAcPG4SsE7s=
X-Gm-Gg: AYBFou1pghaEb7MnChZ5GnuTJnv95br5gzc2blXJpFUoTnlN6bdivgcMQu+xde4defy
	BMQNm/K9wQHfN6dHyy0pzy7qxsqRMmJ0XxB5Y4/JUVio4wcMT3i/akWHG3byBIakrOfA2Z2xdbS
	95GEsNHGeJ8VUoEe8hPkKdpQK7XWoavz59A7GhihliYZi3TZ/5oAdNVxIUVOGHD5HCHmiDmEoJ6
	37kH0FQAkUWikMwLRlUclI5IwxSSOx493b5juxrtyMhlvcuuD176ZU/0u0uEdww4T2dB/v9pQCn
	bMeg2MuQzUZhNIDvlSwvJU6Bj+eRokT5h0GVyoM5plAX4L/L3hfBvFOpmuPIt8L2HKkfhXBB6hv
	J5GZOA4pxHScf4YJRgpL6HraiT9kyOhrgpmcZ9NcMf3qhYNlkwbLM/gbpSr8SQ8ghWigwUPG9pK
	cgsHWZGcdOsXyllTs1fucwuY2tHtHxtGPG3IbHb06iVI3mD0KMPHl7tyAVW+c0WudaDQ==
X-Received: by 2002:a17:906:7945:b0:c25:4d9e:bb28 with SMTP id
 a640c23a62f3a-c29f5229606mr88747566b.3.1789597776312; Wed, 16 Sep 2026
 15:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916220931.262932-1-rosenp@gmail.com>
In-Reply-To: <20260916220931.262932-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 15:29:25 -0700
X-Gm-Features: AcwNN1XfvFE2d-KqqJJucIZTjIcWqKEqlJgqdSjJo6IKZHJ_MeeZJH_xFe-plEo
Message-ID: <CAKxU2N-T3urb8Wv3sW1=YaT6AjoicgJ95msTDA8cdsivkiR5vg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: fec: gate MPC52xx driver on PPC_MPC52xx
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:09=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> The FEC MPC52xx driver only applies to the MPC52xx family of SoCs,
> but only depended on PPC_BESTCOMM. Restrict the driver to MPC52xx
> platforms so it is not offered if COMPILE_TEST is applied to
> PPC_BESTCOMM. Otherwise the following errors happen during linking:
>
> ERROR: modpost: drivers/net/ethernet/freescale/fec_mpc52xx.ko: symbol 'mp=
c5xxx_fwnode_get_bus_frequency' undefined!
> ERROR: modpost: drivers/net/ethernet/freescale/fec_mpc52xx_phy.ko: symbol=
 'mpc5xxx_fwnode_get_bus_frequency' undefined!
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/ethernet/freescale/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/etherne=
t/freescale/Kconfig
> index b34c0fcfddea..d81984fcec64 100644
> --- a/drivers/net/ethernet/freescale/Kconfig
> +++ b/drivers/net/ethernet/freescale/Kconfig
> @@ -38,7 +38,7 @@ config FEC
>
>  config FEC_MPC52xx
>         tristate "FEC MPC52xx driver"
> -       depends on PPC_BESTCOMM
> +       depends on PPC_BESTCOMM && PPC_MPC52xx
oh this is against local changes. Please ignore.
>         select CRC32
>         select PHYLIB
>         select PPC_BESTCOMM_FEC
> --
> 2.55.0
>
