Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B383D53FD5C;
	Wed,  9 Sep 2026 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965294; cv=none; b=ov2R6JK8CiGWb9pgyfGcKZEj+oSHOb8QOrcs3ZAX2FxkxrsJbek+KhkZ1Ngw0gN0pcD4VkVvUo0zWj8NVZrKRU690/SSwXU1A1C+3XpI76EuUmvVlnq7mkxYY6wHkeQSqRVLaTyaXyP9U6wNgDrQNtWcI8ERvPWIHw+oiISZ5Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965294; c=relaxed/simple;
	bh=FH1l0J0w861ll6J8cWgCzFfonI6e9QEAr/ZwFhnKEpw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dYEcTwCskeAbwpMpS94Xrr3PHNM3g/lE7m62YESOVXSfKRHvChWui09w8pb9zGzq484BgdQGPVapb88qAyI1z9L68mDtiyZjmLRQhlYKWwUukGIUOT2EANNkgxgTWpKhdxNnDNIWYCPnXm4MFmtb7Bu1rX3Gaa2IVIK/C3NKHzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=heutEvUr; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="heutEvUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788965281; x=1789224481;
	bh=9e2xytwfhYr9357vCuzcaoFTrbV5rohrhm5PdDDzSoQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=heutEvUrdiuFmplmXJMuc/MIXcK8rDdVN01E9hZKtvupAapM8EQBEfLXHhJHeVnRG
	 2KrI+D8MvNFYPe9ACX4wwZ2vYNfruxJNL30sDLMYqHwsJg/w7+3xKq+9kiAvvg5vU0
	 UKamY5cxG3lKfORVNJrJDzGXw6wU8qFicYcySDCPkQq9KJt16dgf94BiJZV7kDIf0P
	 9QyeHFXJrWjxGinp5lzCyTt1VdKSdGWCVyIDUJhV1qBvK0z/dSdF5D+Y3+HuB6QNKp
	 4IeuCSHp6HkMsfRGGMJZ8BDzqlH66pkVuPUhxWMRoblSBy/CVa0O+mktugN1dzsDY0
	 D5j6GOlabvFAw==
Date: Wed, 09 Sep 2026 14:47:54 +0000
To: Andrey Korshunov <razor1702@gmail.com>
From: =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
Message-ID: <BxIHWWXJmSvUm8NVgiaDUYHBOUaTS9qf4cAXQKfx8UgN_F90zHJpu0fMHWAZr70as9EnmOyj4cUPeFCO2p9JljBigVijrvYWzRpTG0WMm9U=@proton.me>
In-Reply-To: <20260909134716.879-1-razor1702@gmail.com>
References: <20260907-r28s-upstream-v2-2-21ab570fc91c@proton.me> <20260909134716.879-1-razor1702@gmail.com>
Feedback-ID: 91982645:user:proton
X-Pm-Message-ID: 362103fa24347cf345c686bb025fda6f2830d27f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 04:47:16PM +0300, Andrey Korshunov wrote:

> of_mdio_bus_register() reads the PHY ID with get_phy_device() before
> phy_device_register() fetches the PHY node's reset-gpios, so a PHY that
> the bootloader left in reset is simply not found:
>
>   mdio_bus stmmac-0: MDIO device at address 1 is missing.

Thanks, the diagnosis is right and I have reproduced the ordering in
the code: `__of_mdiobus_register()` registers the bus before it walks the
children. And for a PHY node with only the generic c22 compatible,
`fwnode_mdiobus_register_phy()` reads the PHY ID via `get_phy_device()`
before `phy_device_register()` gets as far as requesting reset-gpios.

> Describing the reset on the MAC instead makes stmmac install it
> as mii_bus->reset, which runs before the bus is scanned:
>
>     &gmac1 {
>         snps,reset-active-low;
>         snps,reset-delays-us =3D <0 20000 100000>;
>         snps,reset-gpio =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
>     };

But I would rather not use those: snps,reset-gpio, snps,reset-active-low
and snps,reset-delays-us are all deprecated in snps,dwmac.yaml,
so a new DTS using them is unlikely to get through netdev.

The MDIO bus level reset in mdio.yaml solves the same ordering problem
without using deprecated property. `__mdiobus_register()` asserts and
releases it before any device on the bus is registered, so it also
covers the DT described case where the bus is not scanned at all:

=09&mdio1 {
=09=09reset-delay-us =3D <20000>;
=09=09reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
=09=09reset-post-delay-us =3D <100000>;

=09=09rgmii_phy: ethernet-phy@1 {
=09=09=09compatible =3D "ethernet-phy-ieee802.3-c22";
=09=09=09reg =3D <0x1>;
=09=09};
=09};

with gmac1_rstn_l moved to the MAC's pinctrl-0, since the MDIO bus has
no device of its own for pinctrl to bind to. There is only one PHY on
mdio1, so a bus wide reset is equivalent to the per-PHY one.

v3 carries this as patch 1, against the NanoPi Zero2 and ahead of the
move, so it can be backported:

<https://lore.kernel.org/r/20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.=
me>

A `Tested-by` on that form would be very welcome, since it is not the
variant you tested.

> I had an R28S series of my own out before I saw yours; I am dropping it.

Sorry about the duplicated effort.

Thanks,
Rong An.
