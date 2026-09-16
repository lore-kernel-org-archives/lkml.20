Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481FC361965
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534604; cv=none; b=IxLFuo1jfjl+NOxiaFfOItIizNU+47oprAap876ev+QlPYPJphQckZ2Ls3DQusbsXNA/9bXJbTZqaLAkgFDBpGom15fl7FJkH0bvFbk28oIaa5D7UrDv1I5TN0xNmxWOv9a5ViFEoFHqv1JI2h8Kxx/6ztf+17/ZJqyoMYdff9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534604; c=relaxed/simple;
	bh=4K3h3Rw54RjSRFKh9ol4ea6kBKJbtFDgm5hxnraDt+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXuAJLI5qnWIZkukWu5czf+rpp/+8XabbJ0x/cRmkQYkPYocDHLpqwKHQxdJ+YxGccPTbEeX11mSe6kK7pit5Gb8jDh19SUq9ZmmPNjEYxigOu4/umok4aECqmUQd12oT8TUR4yqsEwKP1053rqyOxUwnV8R6/DBu+boyB1AKzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uropqguc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uropqguc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E911F0089F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789534602;
	bh=C3tZpMYh27w/dm8oruC2ikSebTIKfee6UIDxXeFEmbY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UropqgucTk1RLrJBamQ3AklerGyhVADL72cabcJr+qZiALC9/pt00Six1PqD/aBWp
	 IjQoI5eEEc9XLBgpC6ZuL9CIe1FxKMhm4kmmiDZ+t8ChixGlHWjVGbFcB5SKFcDO7y
	 rfKDerJ430tO0RXwSgEXx7sykmqAQu32509yFRqrY47Js4c6V+os/iOcIvCozIlZqM
	 Fyrw1stapVkSsw2zz3EzIz1adYgf3ei4Xyl+MiIA4wZ3V29U2Dub/L+QSZe5swtJ5e
	 z7v6TW2YZ62M0k3suNhAi0GKNZHCObVneAyhnTkZ2WmQA8gATF/s1Foe7pHhrroFSx
	 U8aGmSxEREqQg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so492413e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:56:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzThy+LCNzmBqoJGhlkCywkTUEZJtbtOmRdXl+g4N/i8ErgAZPsy0eZj5pZsVHVnFFG2VVojAm9SNW425s=@vger.kernel.org
X-Gm-Message-State: AFuF++kINMD1Uck6DQLw6f+rQnHC+QQ+cyAJ6Jt12wk/2HOi8wFlZUCq
	4Kez6QP9LXUFiA5IiUkkDlNlBzn2zVr+t7MrAsiG+w1PlY8YbHJekzPalLEVTsJhHyKNCnt9y4X
	RO3oxYJyvPwkdS/59dGA9zau8g5B9aGA=
X-Received: by 2002:a05:6512:b87:b0:5b6:1a7c:fd86 with SMTP id
 2adb3069b0e04-5b8b6652ac6mr244953e87.44.1789534601132; Tue, 15 Sep 2026
 21:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org>
In-Reply-To: <20260916044119.475666-1-alastair@d-silva.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 16 Sep 2026 12:56:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
X-Gm-Features: AcwNN1UfVwvH_TTNjxWxYFWqmDiwY6R0M22kYyQVnOwJYHGWocQFI_cDBu05Ups
Message-ID: <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] net: Add Allwinner H616/H618 EMAC1 and AC300
 EPHY support
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:41=E2=80=AFPM Alastair D'Silva <alastair@d-silva=
.org> wrote:
>
> This series adds support for the secondary Ethernet MAC controller (EMAC1=
)
> and the co-packaged AC300 Fast Ethernet Physical Layer (EPHY) found on
> Allwinner H616 and H618 SoCs.
>
> The Allwinner H616/H618 SoCs feature two EMAC instances: EMAC0 (typically
> used with an external RGMII Gigabit PHY) and EMAC1 (Fast Ethernet,
> connected internally to the co-packaged AC300 EPHY). EMAC1 uses a
> dedicated clock control register in the syscon register space, which is
> accessed via an offset index in the DT syscon property.
>
> The AC300 is an integrated 10/100M (100BASE-TX / 10BASE-T) Fast Ethernet
> PHY communicating over MDIO at address 16 + phy_addr. It requires
> retrieving factory bandgap calibration data from the SID nvmem controller=
,
> managing internal power rails and clocks, and optimizing transceiver sign=
al
> parameters.

There is already a series from James covering the same thing. Please check
the mailing list and possibly our wiki (linux-sunxi.org) to avoid duplicate
work and subjecting the maintainers to the same discussions again.


ChenYu

> To ensure reliable link establishment and MAC software reset with the
> internal PHY, dwmac-sun8i is updated to defer MAC software reset until
> sun8i_dwmac_init() after the internal PHY has powered on and begun
> clock generation.
>
> The series is structured as follows:
> - Patch 1: DT binding for Allwinner AC300 EPHY.
> - Patch 2: PHY driver for Allwinner AC300 EPHY.
> - Patch 3: DT binding update for Allwinner H616 EMAC1 and syscon index.
> - Patch 4: dwmac-sun8i driver support for H616 EMAC1 clock index and
>            internal PHY deferred reset.
>
> Testing:
> - Tested on physical Mellow Fly-C5 hardware (Allwinner H618) running
>   Armbian with sustained 100Mbps full-duplex network traffic (DHCP,
>   iperf3, NFS rootfs).
> - Device tree bindings validated with dt_binding_check.
> - Separate SoC and board DTS additions will be submitted via the
>   linux-sunxi tree.
>
> Alastair D'Silva (4):
>   dt-bindings: net: phy: Add Allwinner AC300 EPHY binding
>   net: phy: Add Allwinner AC300 EPHY driver
>   dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1
>     and syscon index
>   net: stmmac: dwmac-sun8i: Add Allwinner H616 EMAC clock index and
>     internal PHY support
>
>  .../net/allwinner,sun50i-h618-ac300-ephy.yaml |  79 +++++
>  .../net/allwinner,sun8i-a83t-emac.yaml        |  14 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  65 +++-
>  drivers/net/phy/Kconfig                       |   9 +
>  drivers/net/phy/Makefile                      |   1 +
>  drivers/net/phy/ac300-phy.c                   | 331 ++++++++++++++++++
>  6 files changed, 486 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun50=
i-h618-ac300-ephy.yaml
>  create mode 100644 drivers/net/phy/ac300-phy.c
>
> --
> 2.53.0
>
