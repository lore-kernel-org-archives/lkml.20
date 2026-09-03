Received: from mail-ed2-f9.google.com (mail-ed2-f9.google.com [74.125.228.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FEA3FD129
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425507; cv=pass; b=gKc+mFpZNP1454uidTDmOiSJPTCzuLXH72Kk5SqZzAF7tl7Ve5XTpQ9ma2x8rzqFTQd2zHrAFGjnFXJBH+MMnd9HoNk0d3hd7zpe18YiqZGW9s8TR8/bCaB++CoL9mOO6dJ75BITwj0ODrNoAwr8IQSfKizat2rKOTAtH7n7iNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425507; c=relaxed/simple;
	bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/H57IdN6u5T6ejMS2CsT2g7YWCTN099k7gQTT01578FYC1cv/TFYCdBwYQ1RVuHsrWxkiuoizNRbJU5bssKq4fEuIJQj7/8HHRS1b/w9EV7NtoK8WD3xJQrHYIVFQByNOsbKmXBwKN6O7ek7rhNLcfsJQI8rXy/nL9SVUvGKyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2bDsdyi; arc=pass smtp.client-ip=74.125.228.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2bDsdyi"
Received: by mail-ed2-f9.google.com with SMTP id 4fb4d7f45d1cf-6a64841e8a5so1077435a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788425504; cv=none;
        d=google.com; s=arc-20260327;
        b=E35EylqStemScNziqfioAGyiAcDmfe1HVS2zUWQmmsGRBpQNHeRXSAzEdQ7r/akqyQ
         uaq4UgcOxD1o6BSC7y1P6C7XZGiZyFq8+S+QFl2c8gSwEtj3AdQ2MLFSnPtZGKnnubUR
         ElyCxDMkHcjkcwT6pUJSuG76CCl87FoZY08ZHgg6LgIHCErTCgyBVnMeP3jZ15kZSBtg
         cGWfJ2bAZ1Lu5OGmu31+9D1DyVC4hCAHqeh6b2e2FI/kjohki2Wr+wIQUZEP3wg/WFSb
         ieO35q5Yw4rDurYTISzGhHkaUWBicm9X6nz9CotEnnl0oI9TmjgZ8Uia3GKeSUqs/43Q
         NA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
        fh=HtUw4xROiEOk78ArnS49+b8oI6Gz88Ea2gEaKQWWff8=;
        b=K16a6D7yvy3LXK2Z6fJqCCue7bWkBv/cruzlSQjNikiXVVvFhp5z4tdcw5hGym/CG1
         guXcP8S2uSbFYrtbhbmXKCUPHoG2IwaWluBdY+x4s8C+h5E4gpsQOamR6zXdcoXjYVYZ
         ZAiRZptL9INubZGG0jL85LwjESTZtRBpHDnAsxT8A95ccmf+O24lVoD13o5+g0zuW4CM
         XPn2vHCWVuDROC/10DUi6PwtdzpVdmgunnwRE+lFroCrFSyuvKv7gJ7LuJ9pRbhg6o22
         OyM2fHvkBgdohzUdcAQKkPkU53Rd9aV+3jGyNR7VDbLNPtWDkqq3vKtI/+P96OYtxK3B
         awhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788425504; x=1789030304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
        b=B2bDsdyie4uFLTSvRBI5G12tsRKBuEEPJP2lgXhdnzVTTLvYhGvF9EJ4Yc57LHB0OQ
         IBKSyzlieVHR7SzT++4+YZIW5ow82U9CPLW3Ajl7jRT83TQqXLUikvvirIpUzvTCt3lZ
         IeMapLnCg8QxqKZZaG4PNqZUTVbCxOF4soa/kJjmtmrTmOh00na+Ci1KnpYznJ5TvHWj
         7UxxIy+S7RSV3zXvLZ+uvjE1XWNnxNi9yeCwi6rrsFXRUxgv4/43OJ4GEA73qzKUnUy8
         ZoL7PuoGqOCagCNoSpRWdso+efjSz4y5eKXEgB3wPi3xpJwFkcHdog0NZNn+omepYfLu
         yXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425504; x=1789030304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
        b=CO1D1VlOcG+vuCLsqrG1kM/gZFBq7ja3J6bkDSRZi6Rxb0p7VBANzxuiVMt/nJp2Bs
         f7OPrlgschwgnELTnMRMS2ged2M2vvv3R5skaoBgCyAvm+7e4OMX0nvrLzGjfbzSegIT
         pMdoRvt1u9PGNexNNV2nLzNIiUdNDDGNKBeCxAgOEsI4xyFT3FHhsVGKjh1BcbvTIOfb
         giu3nIW7dOP++9Fx9Q8EtdKTcMkINViAKMhrLy7NLraBH6PFkmfnfu6zg8ugBfhnQrMm
         hK/+2CAORwcu3g7q73MCZwIp2Iw5JRlVqsDDTMrraZN9QJufq/U6GkkPXEj7eKbET4ZG
         1QZw==
X-Forwarded-Encrypted: i=1; AKwUvBwVdTTIkcXtnC1/6j0xJ+oDuQfMLu/E4iJnlLiQtIQjnLMY8Jxfenkz8D5WdmnRKE7HhU8kXccYTK9USII=@vger.kernel.org
X-Gm-Message-State: AFuF++l/sg8oNk2VOHTIx8v7SfkV8ulytlGtFZ1W9+GQu4DQrAlrcixc
	+Vw5gfFUO/6YljVmRKDD6R/iqplUbZ0cUXFzc5mZGthEYG4zJZtO+ZM/GwBJ9xhpsgS0La53J9Z
	b8YDw0B3gw9jxH3m+7nYSNY8rvgr9+8I=
X-Gm-Gg: AYBFou0y4WWt2+wxeVPZwfN6UlacBKFzbIYsuXkKglwdzSKK0j1DJ1FuA1YbCrDmjRT
	lUajCaeAHkzz0zkgiRAMBsZQ1w/99mf4YlH79BIaxxifV8TyOOpYPENblYfW6JNgw9XSW3T2Ava
	4t7ow0CaOFvsFmYYIU7is5M7MC8OoV2k8wRPBbtGeqwI3mfN7ryBQikDArehXJJOz7zhPrTgdOa
	Fg3DzOaFOiPD2i6Va0jraUncC8PqA3Dt9iO43OyzB2vvHUtdJU/g7ytHZMaDV8JYRSxsQktAqpV
	gOBzr0DhV+zpwFwMgOI9S5H/k7dZfV7pgYw3SxYple7wWLV2hLkTPPyjazQ=
X-Received: by 2002:a05:6402:460c:b0:6a3:87b7:b516 with SMTP id
 4fb4d7f45d1cf-6a68313fb0cmr6808251a12.6.1788425504326; Thu, 03 Sep 2026
 01:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260901150111.141037-2-coiaprant@gmail.com>
 <0dec5462-f6d5-4ef9-9d02-5fdf7f3090a0@bootlin.com>
In-Reply-To: <0dec5462-f6d5-4ef9-9d02-5fdf7f3090a0@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 3 Sep 2026 16:51:31 +0800
X-Gm-Features: AcwNN1VVEgAP8GgA8LdwjKHcWBmFmP5U9Mjud48d0pq7C7tHDzymcLYpjmHugJk
Message-ID: <CALj3r0i2msRXH-uqA2QX=cRkQwM_H2bFH9GiroEys2NfEbTtCQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 01/10] net: stmmac: move XPCS lifetime
 management to platform drivers
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B 16:32=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi again,
>
> Sorry I had a second look at that after a good night's sleep, and actuall=
y here
> we may regress. The original logic checked for "pcs-handle" presence, the=
n
> for the pcs mask, but if no PCS is found we didn't error out, we returned=
 0.
>
> This is making it mandatory to have a PCS. Please handle gracefully the "=
there's no
> PCS" case :(
>
>
> Maxime

Hi,

This change covers all callbacks that use `select_pcs`. Drivers
without `select_pcs` callbacks will not have their pcs used by
Phylink.

Currently, only the Intel mgbe driver uses xpcs, and Intel has also
set a mask for pcs-handle not set.

This means that on Intel platforms, the parts that implement
`select_pcs` always require xpcs to exist.

I think there shouldn't be any problems here, but I agree with you,
regression issues can indeed easily occur here.

Best,
Coia
