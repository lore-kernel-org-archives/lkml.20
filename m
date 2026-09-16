Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E471395AF2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535551; cv=pass; b=rhRdp/nrEHZjS3Kwr08dmPDkDXwC9tqCSEEknu/2mlu2/v91HvNX2c3fCihAUpR6tpfCqpATAC5dFoPQ4kZ4p8kGGLH/h1OiRe/sLtRK+bZUNa0R9++KqDLYpgUpXx7wOOtFn+ugwWfHgP5CxFmkxLUK9dgogI+wTxjScilfHjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535551; c=relaxed/simple;
	bh=xfMfjILt2qYVQAqWVFpTkowhP2xgf3MvNiTst1AwzOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epWVaK/0rgJido0UgWIx7Nwq39GkT+LJTkAKkcFn+xm8jl9CmqpiUU36crKr5aaGaOpBeqAkuneVTv63+SOA/QT6bhUTmsnfg1HNlwUlqaIYU7nHLtCWwpA2SYnjk6Hwvo8OpMtcRtwFcDoMk8YagGPwDT0kF216c3J8xpjt8ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoYzsp2Y; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoYzsp2Y"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e53002bso291990e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789535548; cv=none;
        d=google.com; s=arc-20260327;
        b=aoCKHwkTvh/KMkFk+QTuxffVDokEX+BpK/zmNf+Z87pQHAa+IMjf43gNYf9Eo1YSDl
         S0jefo7IbI5zm1Q2QecR6XartokukfqUwJkxIPbbEYFMrKNH3Q4S5W9Gh3Z5pkLWuuoI
         1zOc2J1QN0fgoF22c0cH7jlwcdXIdYn3sDHOS6piXLx1X3rPDHk3W4va42lIwpiJcmjb
         fZ0hkH/pi/Goez94/vSEvzyVUfGGFVYSHlGRaMr5TSIiRExDC/Sx9MDvhf9CxcmGYFMz
         /0GcFBKe3hzJdUpr6XEPiXLjqNNKvRSnBu2TbL/aip3Yp9wjTIstL34fx3dWUsr0oD4q
         fZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        fh=usancjy772ZSWpTq6Bp0WUGkHLN/P0qVRSFsNDCh4r0=;
        b=Qpu6IwsR/ZVhBmo+YSY6itRaAnmrC0xC6gaAlq+q0UhPv46DQcVkUMFXlSbhpXG/ND
         tkXxkCOQtDQJ3PXeXncklGOZWL3wm51XVjHuVqkR/x2Fc80Z3wTZO79rE5LHtswffatA
         sa2ZBdoDz4kjnV6b8yU/C7re5bwRcjbrKBm+Npr0MM6SkJy1rKpo90wu8vyuPMcZYr6z
         7iC2TUrVwvASxtjn0R23X+ULxbkgPWmL5kZo28ggdhbiXsVHA/YI5KlOezRwXN5Vd27o
         yBCrKPPgpQ3E8MvYlOW25ZaBgXr545K23UEgk4++cJ9CnBmF5gi3QrBy0+mF58Mv4axY
         3CMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535548; x=1790140348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        b=XoYzsp2YhnEj9tlW4XHgn995P2na4t2gSWWxk2SiJP8ad7mKThT4Y2a8CWDzf8C1Yq
         SrK6GhePfogTZkYeMNs+qudtEZCaHxoyZzh2l4BjVYrdsUC+YNor94INAd7cFvbnqkC9
         Ap7ibXqKgl6H/dBqrZLfL6jCQ0/pms6nLa6G6W+XeO2wm/uOpUm1pcgsDAVCcmlsoZ98
         2qzETLTUpMqnw7ayJIpBMm2PTDedi64KyixAtjwqd511aLIfxZ4V7dxzixwwZLpbZ5yI
         vybsmFdHC903hzXM9NsdCqWc8FOusttxOFXnLnMFtSEoH5CHPGZu4Hux4VAtPHi5ZKoE
         A0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535548; x=1790140348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        b=JRrQZn+nW0xwunYPPhKXblnwAHhGwRdDHdFoqYmgptsyiHKMKANjkyqb+3SrFDvDbO
         z26/NhvsPC04cmmxGU5bsi3zTHzoENHf6iwOY1tmnlXB71vD3fr1bsF20YXO4zAlNNJV
         xrgRMS0jYmsuPpR5O48dzRkqDR+E0QT11ZDrYwG80La6oao0F5S/9tXxS/+M1Z9/aYlu
         gd9bt7NEFN65PKoSnKzTzvGsTys9BsCtgDVf75S+FIyvcRxwMCg17aiF1IhjL3MJbOFA
         VWfX7cdrU0FUvJPKGGQzq3vlvR5qSNWDOGPiH4wZylfyy3ZkzyyU47T3lTHm0exaENEz
         AFwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmqkhRUoTDxdyN1pWa0QCF3SMWDFAdUWL5cN0WbLnRObkR4Jh9vr4h9gjopUpxMHn1VL1+VM2W1xcTzg0=@vger.kernel.org
X-Gm-Message-State: AFuF++lSL+2ufZIdBeUqMjVaYdjJoUBI2V+wPNeT3TCvbPIi/zMsiWd2
	jifJ7tCgIb4jjbu0MKXaB4qDEyge+r5nzcjCSDxfvZTdREW0ocgi6BK1JW+8PCR95fPLBLTLw/p
	mQ/zIGL0xmCWTjxuTP06Zhg2TE5wOJZI=
X-Gm-Gg: AYBFou0XqU7m9w7ioFIRPQwJDNhMQaHQjJuBEefNDrLezMhKhejIs0GexnJ9jSS2Xw9
	KxRyywXaDM2XVYJEWzTMfdk7dB+dLFRo00/7/UtEeicUvl23y8VDtxjL86G4WJNqR3WWJl+DrId
	vTPsrHR1+wU+/rkBrjb3dkEHznFWHN4QmSY+xuahaYXJWdC6Y/y7Qb006g2oFncqnuQged7x3vI
	fws+0z6PxbWihS4Ofbq4mJBost93cbBhJuYrqqu7I9xg1kXc0WJ/W2JpahOBL1JEwQDyZt+p9kJ
	iT1akIjXty3YZgDV5BPeDPVTk2cMpCQK9f//N2frzZEie9U9WzyM42s3pDth+5V7pUi2vGLre32
	hAvcsE4Z6mDsbMd6Zo3rh9w/U11bLaY+2qUivPtuosFerny5dPYOElLfb8h5PXF4qZkIAKSZKWh
	b7U2xY2ahdS/rHnSSpqswhAW0L+UC+L4TTvCNhKPBcoYkb
X-Received: by 2002:a05:6102:38ca:b0:79e:caaf:de9 with SMTP id
 ada2fe7eead31-7a02acc855amr1205112137.6.1789535548385; Tue, 15 Sep 2026
 22:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org> <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
In-Reply-To: <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 23:12:17 -0600
X-Gm-Features: AcwNN1UNecxTndtUibx9ggVDgut-WAi8ElAvEyyyzRhfanBmsu20NosAEZK33OI
Message-ID: <CADvTj4qRMviM=KXinCKi657pVC_kj7Kt1yizW_EGDu4m7VKQFg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] net: Add Allwinner H616/H618 EMAC1 and AC300
 EPHY support
To: wens@kernel.org
Cc: "Alastair D'Silva" <alastair@d-silva.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:56=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Wed, Sep 16, 2026 at 12:41=E2=80=AFPM Alastair D'Silva <alastair@d-sil=
va.org> wrote:
> >
> > This series adds support for the secondary Ethernet MAC controller (EMA=
C1)
> > and the co-packaged AC300 Fast Ethernet Physical Layer (EPHY) found on
> > Allwinner H616 and H618 SoCs.
> >
> > The Allwinner H616/H618 SoCs feature two EMAC instances: EMAC0 (typical=
ly
> > used with an external RGMII Gigabit PHY) and EMAC1 (Fast Ethernet,
> > connected internally to the co-packaged AC300 EPHY). EMAC1 uses a
> > dedicated clock control register in the syscon register space, which is
> > accessed via an offset index in the DT syscon property.
> >
> > The AC300 is an integrated 10/100M (100BASE-TX / 10BASE-T) Fast Etherne=
t
> > PHY communicating over MDIO at address 16 + phy_addr. It requires
> > retrieving factory bandgap calibration data from the SID nvmem controll=
er,
> > managing internal power rails and clocks, and optimizing transceiver si=
gnal
> > parameters.
>
> There is already a series from James covering the same thing. Please chec=
k
> the mailing list and possibly our wiki (linux-sunxi.org) to avoid duplica=
te
> work and subjecting the maintainers to the same discussions again.

See:
https://git.kernel.org/netdev/net-next/c/783f6f1fdcd5
https://git.kernel.org/netdev/net-next/c/6cc2fbceb49b
https://lore.kernel.org/all/20260915-submit-h616-emac1-v1-v2-2-322b32e40eb9=
@gmail.com/

>
>
> ChenYu
>
> > To ensure reliable link establishment and MAC software reset with the
> > internal PHY, dwmac-sun8i is updated to defer MAC software reset until
> > sun8i_dwmac_init() after the internal PHY has powered on and begun
> > clock generation.
> >
> > The series is structured as follows:
> > - Patch 1: DT binding for Allwinner AC300 EPHY.
> > - Patch 2: PHY driver for Allwinner AC300 EPHY.
> > - Patch 3: DT binding update for Allwinner H616 EMAC1 and syscon index.
> > - Patch 4: dwmac-sun8i driver support for H616 EMAC1 clock index and
> >            internal PHY deferred reset.
> >
> > Testing:
> > - Tested on physical Mellow Fly-C5 hardware (Allwinner H618) running
> >   Armbian with sustained 100Mbps full-duplex network traffic (DHCP,
> >   iperf3, NFS rootfs).
> > - Device tree bindings validated with dt_binding_check.
> > - Separate SoC and board DTS additions will be submitted via the
> >   linux-sunxi tree.
> >
> > Alastair D'Silva (4):
> >   dt-bindings: net: phy: Add Allwinner AC300 EPHY binding
> >   net: phy: Add Allwinner AC300 EPHY driver
> >   dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1
> >     and syscon index
> >   net: stmmac: dwmac-sun8i: Add Allwinner H616 EMAC clock index and
> >     internal PHY support
> >
> >  .../net/allwinner,sun50i-h618-ac300-ephy.yaml |  79 +++++
> >  .../net/allwinner,sun8i-a83t-emac.yaml        |  14 +-
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  65 +++-
> >  drivers/net/phy/Kconfig                       |   9 +
> >  drivers/net/phy/Makefile                      |   1 +
> >  drivers/net/phy/ac300-phy.c                   | 331 ++++++++++++++++++
> >  6 files changed, 486 insertions(+), 13 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun=
50i-h618-ac300-ephy.yaml
> >  create mode 100644 drivers/net/phy/ac300-phy.c
> >
> > --
> > 2.53.0
> >
