Received: from mail-qv2-f35.google.com (mail-qv2-f35.google.com [74.125.230.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AF252FE59
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072078; cv=pass; b=jJWIlnmrci9imI67j0cb0ky7OmrD6+W6YyQxMEEzhGF5iO59wHDea56RNxLd8RIZDb2X+Icvd+cYxLw9Ld1u+p81FJBuOWIsdaB+uNp4xl3A13q6B7py5ZFgNw4pV31t0XTpZ5278gzDcRhMW6RLU3KzJI/w7/MRt5+kAk5dqAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072078; c=relaxed/simple;
	bh=MP7qOWwL+P1a6ht9RviQn5PbhcTDg1vQhBcP5eyXfGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZB2AbZb74Sq06iVZQV0/V7+ZKctleuOBguQBOyFigsNCcA7qA2W2AG5klg7z55O5rG0194kNdu96SnCNY2lhKamwJnHDFHiIIGRUbx66sSwqd47je3Cqhmt+oU2iCN4tY7LvsKoGIDRKL8wDa/oUnpNV+hDEpXiTU0kX5/2PTbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABLRxbfE; arc=pass smtp.client-ip=74.125.230.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABLRxbfE"
Received: by mail-qv2-f35.google.com with SMTP id 6a1803df08f44-9104e54b1abso53094546d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790072074; cv=none;
        d=google.com; s=arc-20260327;
        b=Sc63k7FqwH+KzPlnPYvIOvc5i7rqRvXlQHuZCTkc8OFi0docitCedDrvZmA87C/kjD
         pQVTWNFaNOpFm6G+W3SlantcFkTcmEshwug+68y2xtD6Qi4JCiEfftKdWpmz4rqVjTU3
         jyfZN8FldMWcouENYE/wZtwvMK9/yvFL44clyYSE8TEerLSJtyvv9S1xXCV+wfRPSbrs
         GgiSz49ByMqUuaCeYLltcQI9h1oMN0qDOjxrJOOEJknOb1Gd2mI0mSoDqdKKW3XEbAmd
         OL3upoz08ODwIJIpi7PdfeAz83YKEWY1jehriA5wxSXNmV8aKjU1YzcSkhb04ly7+wvN
         wIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        fh=oHSdXrgHu0Wh8VK3Nijsz6rcsBojxVf4Cvh6zRV4M/A=;
        b=eBp1hXe+zp2dPJ3xHb38dFKWwRXjd5kNzHG5QoatnQDqH3kW9+PmNTJoAHq4ScMH8K
         jG1ZyzCgraqtEaX9Br0otCOgj2vyTEkvCNbnWkG9IjLYj/QeFcI5G0hEPswWCcF4yet8
         gKhW7y8/SxWTkuKdrjF2eODR74QNZxNk3ut+9ZrLERsBnBN02g8wehecJwFahf1eRgsS
         N2ly+xCxch3TISDSK25od8OHqZlRtE6FswnCForU86lObvbLlCsLlMqaPkX9eps5AQaW
         8cddOw3bg1/2OINTXwkF5ETKZdo4cG7mi0KCKnB2U4dmsrFKJJJXXmnBd5/z6hw1YEYE
         J8DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072074; x=1790676874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=ABLRxbfE6NZ7sOy0INwd3XY4Y8s168Ra8wxGTqzrQIAqw3hou6Rq23TKQfmnHBAk4X
         v6L5jxxM+78pAkKkVrqsf+veesjFiiVPt1Nep3U00Qni+c0cyjFj0uYJGrUSfewG8tEk
         Zf33LvNghY6aF4qFJ/unoVK1XAkMLk84VEVKgrcVJmXrk7yaoFNLBl+IQxIQW8TzO/8J
         Or6asyop9L0UhvpjcU2RvrwYTH4zND9/xJckQizoWSri9lGro6occWnxQ453vWCybkQ3
         89ypd/XfD/SNnBwxfujW3QDPgn1lIyfdwNb58dmF2FPOa8jygoN1f6YPsbBzLHlJwARU
         Ga8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072074; x=1790676874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=2kawZXVwBBPqpR76Q7KY7mmU3ds7PWi41lfv1YRFIHk8wfZ4PyMBCwa+GfTtflySgX
         Xxt0UpgZageyW32VPfGAcRpmBETCmjSmElCy5zqGCqdEhWnL/jVEsTRVxD3e6oLtUXGR
         6z62MKbsKJY2/MJsFdeZw2TGFO1uFR6uyFPxpYipooiqG9piS8TakOSS/pTUHPlKaR/m
         SbU9/gwaM2Ev/fYUpIRJqdLOsAXhbPduDepUEa1DhRGS+kVG40TXbS84hIrTJoqaGPtu
         nrxi7UCxAjn2bN+lwfKCCZRDtybFq4MTcebka1bwd97Qqolds1aXzJLcnrY03ZJegbjs
         nOvw==
X-Forwarded-Encrypted: i=1; AKwUvBw41BYg5c3H+hRNPanSKt/orCtZqQjGrXZy1HZrGpsbS4iHBibn1xwfbpQ7Q/rjrxlcFLj2aQAFRVIjpIE=@vger.kernel.org
X-Gm-Message-State: AFuF++lnFm9nXeOthvKqf+PILj5L5s9ScEpksxR2en9waiKmWTslB+Yx
	pi+Zh26GF7qzIqTW1yzumst0q4csZu1+ZLjNOlLJFIYw/3L0sGvKRuUIQgwmi1H222sJqjEohGk
	Rxg6VhDQltpfI4WOINfCil99Ipy5gGyU=
X-Gm-Gg: AYBFou2ZZsebxPPUPPWceRJ1z5QFBDmIiszkJiFLIcm7BZ1G7y/K7w9FE7ooJrF/XBU
	cdm+Q3n3WMA1sxGx5qtWUl0NKyF6a0TmgmJ+d4yGQ7zWVknuB400u48XEzygvuyS/mCgoWUJvgG
	4wl7AtLarxiO/bufQzpWYms00qm5aSfFc5OMcZ9ZOYJ5Rp8m4dQ8cM5dYePkp3XWVTBDeV7TTuR
	goYHbWBmIaXe5aKdLMskC9jwvlsBR4CjQFFQF6aqZx7viplLhPNJfCx/vk3eirTMCgXQR66MNXC
	FnN+p8A8NsqycCN7P9SGatC12yEPReFDOEByGSWvQ3kc0rUsz+eEqgA=
X-Received: by 2002:a05:6214:d63:b0:913:fa79:99c3 with SMTP id
 6a1803df08f44-913fc94b160mr46562816d6.43.1790072074583; Tue, 22 Sep 2026
 03:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915123812.14747-1-ansuelsmth@gmail.com> <20260915123812.14747-5-ansuelsmth@gmail.com>
 <20260921134410.13a7173c@kernel.org>
In-Reply-To: <20260921134410.13a7173c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:14:22 +0200
X-Gm-Features: AcwNN1WQadm9kZulSu2D2w98S17OkpHd-MeZLtXiKqWwHyLw9Fh6tPwUuh65TfY
Message-ID: <CA+_ehUyFH_ZSsjhp-U9WBFoRZR-ZMWnNQ5pY5vAy1LxUU5hSsw@mail.gmail.com>
Subject: Re: [PATCH net-next v22 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno lun 21 set 2026 alle ore 22:44 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 15 Sep 2026 14:38:01 +0200 Christian Marangi wrote:
> > Add support for Airoha AN8855 Switch that provide support for a DSA
> > switch and a NVMEM provider.
> >
> > Also make use of the mdio-regmap driver and register a regmap for each
> > internal PHY of the switch.
> > This is needed to handle the double usage of the PHYs as both PHY and
> > Switch accessor.
>
> GCC spews warnings:
>
> drivers/mfd/airoha-an8855.c: In function =E2=80=98an8855_mdio_register=E2=
=80=99:
> drivers/mfd/airoha-an8855.c:438:48: warning: =E2=80=98-phy=E2=80=99 direc=
tive output may be truncated writing 4 bytes into a region of size between =
1 and 61 [-Wformat-truncation=3D]
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                                ^~~~
> In function =E2=80=98an8855_phy_bus_register=E2=80=99,
>     inlined from =E2=80=98an8855_mdio_register=E2=80=99 at ../drivers/mfd=
/airoha-an8855.c:469:9:
> drivers/mfd/airoha-an8855.c:438:45: note: using the range [-2147483648, 2=
147483647] for directive argument
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                             ^~~~~~~~~~
> drivers/mfd/airoha-an8855.c:438:9: note: =E2=80=98snprintf=E2=80=99 outpu=
t between 6 and 76 bytes into a destination of size 61
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>

Hi,

 I also didn't receive the email for the AI review... Did it broke also her=
e?
If everything else is ok, should I send new revision or maybe we can pick t=
his
and I can send followup for this warning?
