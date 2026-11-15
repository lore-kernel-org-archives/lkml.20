Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739886;
	b=xTEOSc0MenO2Aj9wCQe1jgBUYxAW3ZB/EtteSUE5Cx2AOJUGK3ChImoG9zLB//tkbNDd
	 t2KjecgqMBMnRITovFEIMO79ubi3k7n4GPny5clKcMgCL4mK/AXBQZbBes7VAf6RNZd1d
	 9h4610GOCiTupRuGLiswVCJxjTu51+lPae+9F27yaG+h8JtYw/i4AfHcHcRdwOAHhHz9I
	 WmSGb1A7gyGkpJGWow4mZukPS/Z9Dg8cGvVZzg3gF61JT27kbUq1O382N5oqnulk4JlpU
	 6thNZQFoYTxEejGdAhTHQMjv+19bmeOSpmWdmaT4FI4bOgrreSXtpl/zeFgjJ0NQySA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739886;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7DTQ+ilab30T+Zv/iDCe98ocWkWdeLKP4PE9a5e/7Dw=;
	b=Zbums91GxKfDOSPnaWypXyviAuJLXAU+lWJUbXoS9CGucLJL580c5IHUnmyt6KGTzqkl
	 tYmIyztAkZlD9fwUQVgQjMcDvVsngdkaj0a2oA/uvbtqUsNr9p54K23vIDVLh1x8Lhi/6
	 Vhcfx5y3sH9QhkNnTG+2yfrW3mkPt29NpbJW73bVF3RAMptAbW1Www8HeT00n4xvUi+9s
	 s1WUXBYeAXJoiAsiuYOZ4cvY67su0grGSGloHsi0OrQcA54pSkVTA9wT35U8ekbKR8oTd
	 Ono7NtZVAPAN/vRf6RFbUMKVGaNwyoYgu7Zr19vDUYRHIfkPzH/aHR+6YRGH44cDNIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFbrhBwC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20C4606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFbrhBwC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D3A1F000C9
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739885;
	bh=7DTQ+ilab30T+Zv/iDCe98ocWkWdeLKP4PE9a5e/7Dw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=JFbrhBwCSgbkxt7pujKUY9zMMDpruMpZPoGoVimkLdFTRt+YMaPEQxmHjxjG0+gSw
	 yFrzjsl8fgqFOYnsTQ7pFT8QAEeXDFeoblGeAMmxN+8jx0naXanE7y2kjubAcJqMo6
	 1Zq5KpHe1OtMJTK8SObA5BHtEA2AMwPlp/v1Gz/PChsEN3MeOWH2GaAIWBrcJvlPOe
	 +P7H7cNxSbrX0e4xodkKjkrTrKvHdMRX5a8em6RsoTuoBjUs/4VuYxu7wI1BSRR6Ld
	 wjHmPIRu9vNB4K2xxOrmE9VPnZVvb24wINjOGKAtoVCt+1O1vHmt98BZ8AFT5tWI3m
	 yEHbsxKYuD5FA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso29232021fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:51:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEETv637AyuCydpZYtVlG4LbB1H+FYiz+l5fmRelEe6fvaN2tuLOPi2lLePFAN0w7HWNORkJFvvL7SaffE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZU3APC4Xs3xNh6I0gPVzr5vUgCJ8hq79gvJTehzeEKXS50+Jp
	Duq/jVafcICqhi9gVa9en8lIO2iS18MfLGk1p5wTr0WwXrzWeTxxqnUoDht0XIQGF+JzoD8s9bf
	Wij9BYWNF6IVe5X34ApAf+XzyKnptp2g=
X-Received: by 2002:a05:651c:1544:b0:3a6:70bf:622e with SMTP id
 38308e7fff4ca-3ae2b5373femr23084821fa.4.1794739884136; Sun, 15 Nov 2026
 02:51:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com> <20261112-h616-zero2-dt-v3-2-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-2-1cd2664230c8@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:51:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Jw5zPWG0HD75_nJQLRD7QJhHRw4Zs3fvFxyOFFUuGew@mail.gmail.com>
X-Gm-Features: AclHuK8Xtqejh0T-mPLGkGVR4M7UNRwaVG1Eqq6UzreOqahz90WQKJmVFXxqRSg
Message-ID: <CAGb2v65Jw5zPWG0HD75_nJQLRD7QJhHRw4Zs3fvFxyOFFUuGew@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] arm64: dts: allwinner: orangepi-zero2: Let the PHY
 add the RX delay
To: aiyengar1990@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:22=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The Orange Pi Zero2 describes its RTL8211F link as "rgmii", with the
> whole RX clock delay (3100 ps, the maximum the H616 EMAC syscon can
> add) inserted by the MAC. With "rgmii" the Realtek PHY driver also
> clears the PHY's own RX delay bit, so RX sampling relies on the MAC
> delay alone and sits at the edge of the window.
>
> On the board this shows up as intermittent boots with a dead receive
> path, after cold and warm resets alike: the link comes up at
> 1000/full and frames are transmitted and seen by the peer, but nothing
> is ever received and the EMAC raises no RX interrupt. All EMAC clock,
> pinmux, drive strength and syscon registers are the same on good and
> bad boots. On a bad boot, setting the PHY RX delay bit and clearing
> the syscon RX delay restores reception at once, without a link reset.
>
> Use "rgmii-rxid" (RX delay in the PHY, none in the MAC), as the Orange
> Pi Zero3 with the same PHY already does, and as the vendor BSP does.

Flagged by my review agent, and documents reviewed by me:

The Orange Pi Zero3 uses a different PHY, but the pin strapping is the
same, and has the same meaning: the PHY provides the RX delays, while
the MAC provides the TX delays.

I can fix up the commit message when applying.

> The 700 ps MAC TX delay is kept. With this change 10 of 10 cold boots
> had a working receive path.
>
> Fixes: 5a378f9f2b15 ("arm64: dts: allwinner: h616: Add OrangePi Zero 2 bo=
ard support")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index f2e3300e078a..1fdf2d3c1a87 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -18,9 +18,9 @@ &cpu0 {
>  };
>
>  &emac0 {
> -       allwinner,rx-delay-ps =3D <3100>;
>         allwinner,tx-delay-ps =3D <700>;
> -       phy-mode =3D "rgmii";
> +       /* RX delay is added by the PHY, TX delay by the EMAC */
> +       phy-mode =3D "rgmii-rxid";
>         phy-supply =3D <&reg_dcdce>;
>  };
>
>
> --
> 2.55.0
>
>
