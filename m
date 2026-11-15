Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736816;
	b=0kXgQQaq4HlP7dHV65D3srLWsc4JlPzY0MDDNAhajK6ROBj/K5UnfwQ69RYUh7FezhAg
	 OPkYZ/Jk7/1+6Lu1mh5YNbvtgtPsX9CjbFuPFwOTodxJYAnwVRiUa4UjE5l24tcaAIa7z
	 iOLS/DWkRI0iH/IYbmQVLOGJRAHcAxCMEBLjDpdefX5kuHHuwAu8uci01JbxMYvKlXgGh
	 PtI3QSEthfeSm9Mf1CYbU3xZdR4dI51m4ZhIxguMVlpJAtOPvoclJ5ZSWrhAjjAF1audP
	 yPFFexNQNAAt4a9x5phQQugoX4R/NrHY2oPtEhI9cGqD9bqLa0XeqAp5eF3L+HN7aRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736816;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NyTNgU3MDKNHP7luxta/A/OzHHMqJA4oTLAdOlcpPMo=;
	b=znFsHvBTZZU87s8OlahVaiY6aSzdu2mWHazMf95zDu6VxijjWbDOjAm6POaCKLStvHEX
	 F4T62E/gc3KuYvw3SdjolTvPL+EV/BynDstb3P4GRgiSDGNLnUlXY426Mulaux+A25f8V
	 iFOU4NgdZ7EjWxwKVupegLLRM+/JdpCGqQVw+4q5KCAF1pUDnTVYmmInNLGv2273Njjo5
	 xO6MXmEDTokxqlyYJFWdMlp7hWEu/NW5SE5uu6fC8ZbwfYszSAFX86WkDKCOAk3sTxRKz
	 +tiuo9JS8y1lwRkRnYwhDwH9xk0RXXDm7NCjPIaZ/df+DGoSK7BjucUifbYmmQkp9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAudH2q5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3E8606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAudH2q5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2381F000C6
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794736816;
	bh=NyTNgU3MDKNHP7luxta/A/OzHHMqJA4oTLAdOlcpPMo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=RAudH2q5p0QPykjXWFm3xcgFlBzLVWzxvRNP0PexyURDc0cnea/OrOFSy8fgzlsd/
	 Ishl154LxoEx44qVtKGMAlrfryNLyk59jr+oLLWiAsxM7oH/lxpFpQt8dsqITeBC2n
	 tv8XerFTUK9Ywx+LZALZDrK077Cp1Ra8tEb/S58X2IbawHyW0Udj43rzx/+WvCdJ9T
	 W6cqmqIPq2pcIzIxC926FNcXdA006mE8/TsnlRdCzwryc76aIvjxJZKt0i3BpcOvc3
	 vaKR8Z91cd9bwOm48ogCCWtl0sDbB79zQsi29NOdbIsxUAUS8m/2OOiUY/ptXHmX6p
	 DYl/2Va8vaq2A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so26383451fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:00:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHPxIMqTcMP25/U4UwwWoLWdH8unamoy1YyNDNXxouxnEFw+HP8Bmgihe6lNtwrFmWJZ9BUA5E+Mkz6PtM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OH/oYcrvpEAl2ViWuTw2TZa9GAjKnCTUHzLGc9Urdoi+yux5J
	BL2flkwaQnOUtWCbaJHwGaWt1kCmujKDKEMDS2LQFggSoYUfEZDkHTDPgqIGjR9/nUsgFJ4CO76
	Wo4r+6Y3451JnTHdQ0IvieSkfpOTxSFo=
X-Received: by 2002:a05:651c:a207:20b0:3ae:396d:18b with SMTP id
 38308e7fff4ca-3ae396d0372mr10442331fa.7.1794736814738; Sun, 15 Nov 2026
 02:00:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
In-Reply-To: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:00:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
X-Gm-Features: AclHuK9eevfH2EBPHhmpLnWPjLF3ubeY3uOjfZRW9DwFb4Y-flxnXpQ0T_-B6OU
Message-ID: <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: filipescu.cristian@gmail.com
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
<devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
>
> Continue Jernej Skrabec's April 2025 series, adding the board compatible
> and device tree for the Allwinner H6-based Orange Pi 3 LTS.
>
> Board testing passed SD/eMMC reads, both LEDs at drive strength 10,
> and five Ethernet interface cycles plus three MAC driver rebinds.
> Each network cycle reached 1 Gbps/full duplex, obtained DHCP and passed
> ping; PHY ID and 125 MHz clock-output configuration were read back.
> eMMC DDR52 at 50 MHz and HS200 at 150 MHz each passed 768 MiB of direct
> reads and 256 MiB of patterned writes with verified readbacks and data
> restoration. All reported MMC error counters were zero. Both board DTBs
> compile and pass schema checks.
>
> Codex assisted with DTS updates, review analysis and build checks;
> Cristian performed the board tests.
>
> ---
> Changes in v3:
> - Keep green as power and red as status, matching Armbian LTS roles;
>   default green on and red off without a boot-stage sequence.

The roles should match the schematics, as the hardware vendor specified.

> - Select drive strength 10 on PL4 and PL7 with per-LED pinctrl states.
> - Move PHY reset to the MDIO bus, before discovery and outside detach.
> - Specify the YT8531C PHY ID; MAC rebind fails with early autodetection.

Why do you need the PHY ID if you moved the PHY reset up to the bus level?

ChenYu

> - Enable 1.8 V eMMC DDR52 and HS200 after board testing; retain the
>   existing H6 maximum frequency of 150 MHz.
> - Shorten the descriptions and update validation status.
> - Link to v2: https://lore.kernel.org/all/20261022-sunxi-orangepi-3-lts-v=
2-0-70b899252c6a@gmail.com/
>
> ---
> Jernej Skrabec (2):
>       dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
>       arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
>
>  Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++++++=
++++++
>  3 files changed, 385 insertions(+)
> ---
> base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
> change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed
>
> Best regards,
> --
> Cristian Filipescu <filipescu.cristian@gmail.com>
>
>
