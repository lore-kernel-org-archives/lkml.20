Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD8C55C1D4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961644; cv=none; b=CYWIf3QlUeU/GKDVm7aU/N/ac9LBRc+cC9MosKcYKy3ebiVoYt1MaJBYafNOI98adppKZw7fUg8HQffeVxXsPja3MlBM8xWi/dr1FdoCrZaEG1CZ2GehoghPqyOee+kv2J4PkalMvqhiA1xhMX5JythJzBZ+IsQGfsbPXGzRirQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961644; c=relaxed/simple;
	bh=SO6IThhDFr344N2+D1nK6HNO8BusJuqYj4UNDj3MiSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LUiAqynY6x/T7D7+jtNY3ymYbycIz0BgPOGduf0wKM+wa4qqS3LN2MJsnbG84IVymZTQBK9Mzyd0guptDnjymzDAA4GhPtJ4YdoPDBKsy+hxYq1+uUUTxryVWNnXy6BcZtP9AbJbCFOl8+ZoL6X/JVALGvT/kNNjwbqXrb4/j6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkObzryS; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkObzryS"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff16c0e6so2028411fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788961640; x=1789566440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pkp/eQf09LCqXaqLSVyyyJ0ciI7AzbJ9Q/c0YuMCG0k=;
        b=UkObzrySYdCOVpI5di8aGj5wirHhYgSO4mju2OAPsCH+kT12TiMvE3PYYMeyH/2kl9
         P1VdbqcPAajDJO85SNHxLaNDXKOgbSQhR2edqaL33GLjZrjerINls0AQ3qw1hIRkF0Oo
         unxHh1DhVo/BQIOjZZAL3Emog51hw+4FpExmOop0rXXljToEn4vwyL54vJhFiU0aV6p/
         7q4WfX9b+MsXaG1YquRjOhcE3zkCqZlGrOA9dKvE3KUMmp54aoaY9vxbdOWV0J3h9nex
         bHczYajsLFdDLm/6UeVN4+UoWpkel5pfFLNpB5iK3lSV9R1NGPc2O4vA/WUqcdoeP8oZ
         m4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961640; x=1789566440;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pkp/eQf09LCqXaqLSVyyyJ0ciI7AzbJ9Q/c0YuMCG0k=;
        b=N0X4hXGurIxkytZpAyCHBrKdUFm8JNnoLgant2l3obIHVnyv5RdzAAuihyhY7kGEyf
         2lFStbc38x/psAG1jwifZgcXpfuEUkFzivAuoeNB21zY1JsPeiTx/QWFTSqqzaD/PEC0
         s1iIYFVCgN16EDZxQuo/Kt/sTgkHvxWvYWIHq45J153qObd9xAr4Dv9z2+bzV/bIwBo3
         JoLYEZ6XRAAbkmQQt0rFDXcJC8laOKMlf6Vijx1hHmpfI0/34jiZIe/85qBJDWHS51Ti
         UlHe7DzIUpNsPraZAtTFixQCPYTVGJr5u+0pilJy0eCdHly9BZ2/pCFSVBx3J67NOK/I
         K4NQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ2Of7MJuUeg28YGEpDQwJkUwT95TotTWWQXg5/c9g7k6iCnjTC12B024ekVCDg87rRhfM140cnNUlvTE=@vger.kernel.org
X-Gm-Message-State: AFuF++kP/OI7Ofk5AepKBzz1a7pDySPFfNBI17YQgK5nqucGkcfVPKAZ
	/pw62EFZBfCeg6CYgfjmK514bh17Tx1ArpsZ6g7LCd8JV/cG3QU7lzbk
X-Gm-Gg: AYBFou216aBFRXfIbYDdZakBSIbZVo8JmEYd5iZOc+kFsXK8jdei578cbpSG7BMz0S2
	aG6w/uof9eJQbOocTmLuMcejidZtwVt/22iyRGKpC18VJeG3r8nmm9zOVmxS1RlvdrrBETVwXsH
	EQtVFJzVW3db3ZhS43oN6wxjFFICDIdmEIi1cntzYLTMO/CRGamIxLpFgRQ17SNlsLrBW3Tbsbf
	OreBjz5peI1OaAOZKFU4OZRllYgvoPP76iGaE0Nmbp85vcLOoMyYtal6HdC6K3HQTI08K+PgzV2
	2tfnXoxc97IjN4gsRlLpg8f2gM1I9BvS8ewosHP5LkRNcM5F5lq3i+dMpdl2gve0aCHZxzOOzES
	JTqIg+Jkd0quDy7Rh+QFue2ZYK3w+Kir1rDjrcuGzXAKNyS6ZApOy9hPakreozolnNPP/t+Lb9R
	S4OP7Qxz2kj3ggL/arxguAeOQ69kx3WBcl+D/SBt9IiStKys7E1hAHSzrajiA+FA+qBEPF2Nko/
	cgQW6chKPHtHw5tSfwRypHO
X-Received: by 2002:a05:651c:1511:b0:3a4:8913:a259 with SMTP id 38308e7fff4ca-3a58d59a433mr1654671fa.29.1788961639878;
        Wed, 09 Sep 2026 06:47:19 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705cd8d5sm42008571fa.37.2026.09.09.06.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:47:19 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: devnull+hystericaldragons.proton.me@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	jensenhuang@friendlyarm.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
Date: Wed,  9 Sep 2026 16:47:16 +0300
Message-ID: <20260909134716.879-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260907-r28s-upstream-v2-2-21ab570fc91c@proton.me>
References: <20260907-r28s-upstream-v2-2-21ab570fc91c@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon Sep 7, 2026 at 4:13 PM CEST, 安容 via B4 Relay wrote:
> +&mdio1 {
> +	rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac1_rstn_l>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	};
> +};

This is carried over unchanged from the NanoPi Zero2, so not something
this patch introduces, but it is worth fixing while the node is being
moved, because as written the port depends on the bootloader.

of_mdio_bus_register() reads the PHY ID with get_phy_device() before
phy_device_register() fetches the PHY node's reset-gpios, so a PHY that
the bootloader left in reset is simply not found:

  mdio_bus stmmac-0: MDIO device at address 1 is missing.

I hit exactly that on a NanoPi R28S booted with mainline U-Boot
(generic-rk3528), which does not touch that pin - the RGMII port never
came up. Describing the reset on the MAC instead makes stmmac install it
as mii_bus->reset, which runs before the bus is scanned:

	&gmac1 {
		snps,reset-active-low;
		snps,reset-delays-us = <0 20000 100000>;
		snps,reset-gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
	};

with &gmac1_rstn_l moved to the MAC's pinctrl-0 and the three reset
properties dropped from the PHY node. Then the port comes up whatever
the bootloader did, on both boards. Armbian carries the same change for
the NanoPi Zero2, for the same reason.

I had an R28S series of my own out before I saw yours; I am dropping it.
Happy to test this one on the hardware and send a Tested-by.

Andrey
