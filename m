Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326237;
	b=kP0Ndlt5pN8N+UjAC3mn2jc8g0H/3lFcM/DA+UyDYkZdZn4pG5XAbMLi9wKHkjwXRSna
	 Cz1EcaBXAfeanbTUG+UlKi4VPFkztW+WOwSAE2fOMpRqeqA/Xoy0S8sLYuXSbKlHxaOyr
	 k89SnaF+d6koGdnEcqK6z7F4DDU7cZ2zlNdcep6S85zl4SCCm5ict/9zj8Ej8cyS+6HVG
	 YNoVmg7y4kR3E9i1x8sv5LeVFx7jR75GPqReKI7cZGM4KqpIrX/Q6a2x27qpe7npiZZBW
	 I0jJ+u3J6PpCVG1agF7tEUvv0tMFPM1gcSO4XdvDpfIidHrcbVkbcDkNIALZqpZXA3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
	b=K9x13ttS+zDPcsv5jNHJ7C3xF5IVeofiPosjPdB6Or0t+mysKBrskd0FBMAYDS3a0/yk
	 /GjqgMqmfjvhIS32Hw8ulSAKlUPo0oEIZufseribV0csMhE2PyN7ez88J6whBaZYzfN/d
	 5AeQLGYuZgMIOi7STen+PI4HD2AEj/XFoXfQZRUTgamBz3DT0nzohC2zGe2OS+CTwnbfA
	 VM48my7Zr6+WxH93eaxCOmdmphPOZR5/gRU/KSHE6mG4sZ0IpYB1dp64E7CKKmsepNT/0
	 +GIhcXlZx1qUhSP2zXnLdpjNrHWgehpGVnJWzTH0+eZ5MPZiZeIdPNXw2rLiK+6VYWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZExvN5k;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E39C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E39C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZExvN5k
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so14657585e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326235; x=1794931035; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
        b=VZExvN5kuJ0d2/dlZ/+SumROpUETm4YWleyxygMe/Xsa5GJkPCIOEwp7jHoqHEpktk
         xW7wEUn71VE5RedIc6b7+xHys21fWni86TM7h3AxRjwwcaKhloiicxQr/IZAsh/w3W5R
         qju69PjrjvEtOJ5uZZka2jpVTBjCWBX+nDb6Mm3xSAAiTvF5Tu8MzGar39Byx7ToJwyl
         gmQxdvskNcBG4D9jNGJ+NRxsZdNTwVg/C18aau0bm+BsEtePDBQN6m89s5BQC6tez7p9
         BAcObCc+z6h34sxpqjvZSn3w+NTQTcNQBWP2dd/x8J3GsR6WreFLk4oDjeu/NOhTrTAu
         DVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326235; x=1794931035;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
        b=HVs//69HeBRu9oJlmHeMhXXPH2nSh3r1kOHgAiZNdtX0AHU2VXPerWaatbqwEYoX0V
         9BmrQpknRiIFv2ChME6QBX3jo5yswzN+xNyUaWylV5Y37Lg331LvKPKEfDQe6ysbFd3G
         oXlp2MY7DpX5rTwiMT1njSltGTvNCNvMum83ma8NNpc8ys22HIYioSvA7nVpzWcjHb8b
         IlSk+SfKvS3g4Gy24K6ULYZDW2AzkFEuXuRs3X4oHOOeRTEdwdxzjHBieAHADtzqWE88
         kWu7M1UnaVXoXyieHZzLivf+7eVT8BBlS7qWn8s25DnRItwPPc/8D97zcH3dPS0U/5Kl
         boww==
X-Forwarded-Encrypted: i=1; AL+hErH2oD85Fw/Xe9QycGdk4G9fo5wjU9T2AJP9qKtJK03bw4BzKZoFwonQIlboHFbPIHDrny7WD/nwubKOXJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aarPpFRpShRhLXqMFkK1h9oc1QIs3TDTcOqQqnkuD5C0y2HGK
	2xN1/GXC8IBtyLmfcjzZE4ri6x4Pe05wKpoRYZrQdm4XmYCk3M+lyy7g
X-Gm-Gg: AYBFou16aqAuGSk344BkCpJUy72Qu48J9c0hXHwN16pqVhS3Za3kfjrtz4kqHJ8HkKU
	i4HLCQ19PEmbEG8KgjXd6SIGVvrTByBZKwgP8LTS+hZX9F0ExxUuBw48H+CM0DUBiiWUf3Jb4pm
	OgPl32SBLmsdHdCOBNwuaJW8HTwz/oRAnj2WO1Gjy8YwDhKhQfRHjqdny6I0UpTbgSApNAD3VKA
	CewXBV4QwVUelwPsOpB0kKx1J2YdfPrzngPtnofyyWrhFfvTzcA9UpzOgYRtKUejiD7xwvJ51u9
	aLE9+/ZhYQPaPSgc106Apx/TsSxPljzwipwTIpI+/kt9OFau+ZoSA4HyrEWeDNw+wfKBK5NQDO7
	UjEZ4WtSgA/B7PWx4Gn4T03GYvQVPr+KkrRV+6QQn8Mfg1N9OzAj2ulYZywPm8jkFuFayzlcwKX
	Q5FPGEpOE5H9DAA3D+dZ3HkONhKoAMrWhJISi1049R8ZClMr8NBDrKEV/kdabFJCQ7vAoneqNbR
	s4IDzABtyoWdvgfTE2CNg9D+9eBB3N7Q1rbcqVUeLP0o21stSVrykKMXbQggvWZq/t+6cBJYJft
	/Pe855dE5B+yEXRzr6+Uv890ltgiPxyueeoPPOiCqvfkPIk2gdlYP5TbBLuZHDtThYZ/sn5rC1l
	nQqeaWji6tin48b4v8kl5vDsKyR2NSMHGXZICyufUKFoP3T+PdS+fatR5GmeeFpoBwIitQow4ID
	7zE+LGmoVogPEdHlZM0waEmRjmBxfIlgyXtS6HKKrqvsLlVCd+ndOPd5G6okOAgn/JfuqZ6BF3l
	e9GAUtS5Ma8ox+5p9i3Vr/XKwM5GN9ih4BRA/Wsr4SU6QdR8frREL11+073lHs=
X-Received: by 2002:a05:600c:46d0:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ba023052c9mr57287525e9.4.1794326235267;
        Tue, 10 Nov 2026 07:57:15 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm56975655e9.3.2026.11.10.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:57:14 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/2] clk: sunxi-ng: h616: Fix the EMAC 25 MHz clock parent and
 divider
Date: Tue, 10 Nov 2026 16:57:13 +0100
Message-ID: <jHidiYvvSNm_NWg1iHXN0A@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
References:
 <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
 <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 10. november 2026 ob 07:03:00 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The H616 user manual (v1.0, 3.3.5.86 EPHY_25M_CLK_REG, 0x0970) gives the
> EPHY 25 MHz clock as PLL_PERI0(1X) / 24, with bit 31 gating the output
> and bit 30 gating the PLL_PERI0 input. The driver models it as a plain
> gate below ahb3, so the clock framework reports the AHB3 rate (200 MHz)
> for a clock that runs at 25 MHz, and the clock tree does not show that
> the PHY clock depends on pll-periph0 rather than on the AHB3 bus.
>=20
> Model it like the D1 driver does: a gate with a fixed /24 pre-divider
> below pll-periph0. The register writes do not change, only the parent
> and the reported rate do. On an Orange Pi Zero2, emac-25m now reads
> 25000000 with pll-periph0 (600 MHz) as its parent.
>=20
> Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 C=
CU")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 955c614830fa..d2625fec651a 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -489,8 +489,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(spi1_clk, "spi1", =
nand_spi_parents, 0x944,
>  static SUNXI_CCU_GATE(bus_spi0_clk, "bus-spi0", "ahb3", 0x96c, BIT(0), 0=
);
>  static SUNXI_CCU_GATE(bus_spi1_clk, "bus-spi1", "ahb3", 0x96c, BIT(1), 0=
);
> =20
> -static SUNXI_CCU_GATE(emac_25m_clk, "emac-25m", "ahb3", 0x970,
> -		      BIT(31) | BIT(30), 0);
> +/*
> + * The EPHY 25 MHz clock is PLL_PERI0(1X) / 24, gated by both the special
> + * clock gate (bit 31) and the PLL_PERI0 input gate (bit 30).
> + */
> +static const struct clk_hw *emac_25m_parents[] =3D {
> +	&pll_periph0_clk.common.hw
> +};
> +
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac_25m_clk, "emac-25m",
> +				      emac_25m_parents, 0x970,
> +				      BIT(31) | BIT(30), 24, 0);
> =20
>  static SUNXI_CCU_GATE(bus_emac0_clk, "bus-emac0", "ahb3", 0x97c, BIT(0),=
 0);
>  static SUNXI_CCU_GATE(bus_emac1_clk, "bus-emac1", "ahb3", 0x97c, BIT(1),=
 0);
>=20
>=20




