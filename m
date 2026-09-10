Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5E3D565D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035950; cv=none; b=BOmh7q7lAnhP9ZwjIkTWGkoo7NXcqFurE/aB78rqhSpm1hx69HuMvnaKhJgKaTSdEfUMVkJfqVBzAl4wqexg3LjFXW2E3BO/NzhZdYlBQ/JXNjhZEIcKJper8Su/gASs1NIHHx4RgIM4Pb6ZHmzfRVwEuGRd94n5pUVzOWOh8vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035950; c=relaxed/simple;
	bh=7qUwZtlr3g9YvFUyXqLdgxisTOChhV+RcK33AC98QRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SaXF5tpfbNl8H8+/pyNp7OWy4VhfOlcwUAAM54kH2VHuAt0zVJBcRsWZuzGUz4CeiF3kWZA9GA7HdxuaV5AEZyuaZkU2swCuLkPOsUXL9TDF3cElUmhFnjHhqva5+C94fXVP+xSqD/VF5ZhNKuGHp6bGbUnevnYjlRMdz4VH51k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VotxvBgf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VotxvBgf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so53476545e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789035938; x=1789640738; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+7IJqvcZA5OncSvcOJnYdP+bmpbkD68/BvSiNe18T5E=;
        b=VotxvBgfLVQpojEJxUDO5puX2F+xyrer2P1yB7LhwzYvXTa9Q064JtABQKWuPMndpa
         7Hu3VxKEJ9l1zyw6xcdfF45adcXzN303P+gNIfUIZxP5uo86A40+SUFu/DQdTCT9jWoj
         aE5dSuvb2hyoIAc1pBPB5qeplh1M6L7667bL0VvexqjJcfLFkmynPk4LkeOmT0Zh1DZL
         vfv7ZNVD8CM4Qjq8EoxPLmKwGa5rhSCLedxqyKt5HpR/9htAR1G4smKTixvXw60L6QSR
         GicXyD5tatXCycV8Qsw7lAVgK9dERzIOHFJ1ftAv73CVX7GU1cZNNoNHcPAX8S7sLxN8
         EfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035938; x=1789640738;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+7IJqvcZA5OncSvcOJnYdP+bmpbkD68/BvSiNe18T5E=;
        b=YysojEIiD9kqGAcxG6bvwQBkLsWX42SB6y4w1XuEC2uBaLs4H6h5gdbqktDauqGRBY
         baN3qH1JLF6NeeK6gCoka+51VKda7HwbKnSbIbbuB3L6WO+wWk0+DIelLcSstFuvszOW
         sCJMVbeLPDu+8rgqbb2Q6GcwYR0z2+EpeOLLLiMoQXa1FxHYRMjW7o4vr6wfoJn6b1zx
         A7k0YYHThcjMLPW2o8DwUxg3/egPcVDLO06tcx7zxC14BpZOkpd3JE1opS9b6HBwO8sR
         tFvZByGfHHUuuyL+M/I6rWbsqNJhF6anzSmJ/HAmaqQc2Kvolqdlvhh5UqTwRZW9fhGi
         hCxA==
X-Forwarded-Encrypted: i=1; AKwUvBzAqzhzdRa8hQWEAKPPIZw3DqU/o3HnGHltfcPm27tADiBz4ixWFdHFGA2NbG1sF71wnrdVf/dEP+y68rg=@vger.kernel.org
X-Gm-Message-State: AFuF++nuJYN6gvcge5kA6FKW6jcoWkA/cilBhWH5B2smaDjtOnSvPJ3Z
	yUGiYTc59K4Z2idupWm1dFO8La1cUX2aQbfNmhoponh2bkNSgY2Ymj23cXwdIG9I0s4=
X-Gm-Gg: AYBFou1YEw9j3X3Jbd/WYaWeDqNAujEVtz0oPG4b2tUzkPC2PePuPklIJYwxLux/cal
	qG4gqBViLORnKyDNK/01X8p54iqmio8sT71U7ukksIqmjah35Un2d76oqyJK0mBWIXVb4SLHV/Z
	o0buN5Zb7UhOEUpaSaGLG5HI5kHaq2bJh5wpwm3NChpudXzzPcMQ5ixw9TQyUmvHd9joORllSP1
	FPi1+F78mPIowDnL2M89AL1c/7I2J3oGNSTzE7qNuzYl4KoElCGEDa0m5yj+GX//V02MhEzRcLb
	F4vQFqc47yqngdfalQL/F1LFX1ryhTqE7U80+GgD0i6dkcEvFlC2GYUxkcRoOMl+SCHcajVM0hG
	pk6/msgsR7t+CZNHgNz6XZNi7174ChYuv/OP/QmgfrauGAEoLRzIUIcJgZDHm0kV5+HXEdbzwNd
	G/yxZg7EYpqSehwg2MUB1Gwdn0B1ngXC/QXqCVIOQ2vK0+GwVnwA3N9xvHIZzwdyY9qhnm4LFrI
	hdxePe2t9pc7j9x/dETAJwYcsro
X-Received: by 2002:a05:600c:4e8c:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49d093cd93cmr287529095e9.20.1789035938072;
        Thu, 10 Sep 2026 03:25:38 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm70880845e9.5.2026.09.10.03.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:25:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
Date: Thu, 10 Sep 2026 12:25:25 +0200
Message-Id: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWFomoC/42OTQ6CMBSEr2Le2mf6E4G48h6GRVseUAMtaQtCC
 HcX8AIuJzPzzawQKViK8LisEGiy0Xq3C3G9gGmVawhttWsQTGQslxxV132scxRQ5VJi0yuDcRw
 GHxLyTOqKODP8LmAnDIFqO5/0FzhK6GhOUP6cOOo3mXTAj2xrY/JhOY9M/Gz8tTlxZFgxVeRS6
 FoV4qnV0lkd6GZ8D+W2bV9+z4//5QAAAA==
X-Change-ID: 20260731-allwinner-a733-gmac-support-163bde10c152
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=7qUwZtlr3g9YvFUyXqLdgxisTOChhV+RcK33AC98QRc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqooWdOxAijB+jJS+fc+wC7Ey7871ysV+SjXf4b
 Nbhv0NnxkGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKFnQAKCRDm/A8cN/La
 henXD/918KHss64h9WEI8q+zv9g4EDRbjvrn5GDcLZ6kxRcq4Cq4CW+zC6fvSQ3qg/cCngZ5Gld
 LktODbMz1g/VLuibDxDkP1r8b2Mpj83kJiR86padlPKOlyQeUfmejmMy5FzC5t5d49kEC77KwS8
 CUDsf2i7NhfsxqgFc0ZeDuU44EQ+02pvHKItXbAQzpGsvIjF3AA0DWzEONfnwvyONCJHndkSbfd
 0uyts01se2An64GMtICogGNygSaK0Y7+Ko4isgbioxJuB9hJgd26dP86aNtpimyAczCqiSFDqxU
 21jmXAjAr5ff3qqzq6xfOG2k+dr/1p94ttFS9bTG63ogRSEnyb1Hf2lzbTBaGRQu7aXRGX7CD4S
 G9hhtgZMrHKPqKQLbL8gZCQ6f8bBClbHPp2ZaB6I5x2+CrXCnfiOYliVbtmNVMwLRrAgyDrqFUR
 q2AmDPEYgW09v3aPl28CCdxGkvVx2c1wygS2x52UuugVyNge9oIpfFV7kTlXpm4od2hdpE5P/VX
 fGUrRUJ5jLLJ+0/twR64ARZEYzgs0c/VMecuv7d+PBpaBFUXENEbxZKA6dbfjHaw2tGleg/jNbS
 Xq3xMCP6hBv7ObaQJf2hDYYeevyktHNPM2pZUc7EJz9WOy3F6XbMIfQNh+1JnmZFeRm4+RHn82A
 A1HO2hQngziPiKw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 GMAC210 is a DesignWare MAC 5.20 with an Allwinner glue close to
the A523 GMAC200 already supported by dwmac-sun55i, but with a few
significant differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register.
 * That region is inside the controller reset domain, so the reset must be
   released before the configuration is written, and must not be asserted
   again afterwards or the configuration is lost.
 * The DMA channels have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * The controllers do not require a power domain (AFAIK).
 * The TX clock delay value is 5 bits wide instead of 3, split over 2
   register fields.

The DT changes for the A733 and the Cubie A7A board are not part of this
series and will be sent separately through the sunxi tree.

Tested on a Cubie A7A, RGMII with a MAXIO external PHY on GMAC0.

Problems found while testing (none impacting this driver directly):
 * Unstable EEE/LPI: If the device stays in LPI mode long enough, the                                                                                                                                                   
   link sometimes (but not always) goes down, coming back up when the device
   exits LPI mode. This is apparently due to PHY, the vendor driver disables
   this feature. Solution is to use genphy with eee-broken-* DT prop or wait
   for the incoming mainline driver:
   https://lore.kernel.org/all/MN0PR19MB609154F210DF84DCB29D3696ACC62@MN0PR19MB6091.namprd19.prod.outlook.com
 * Tx-delay: The vendor kernel ships with a Tx delay of 1.2ns. It may seem
   to work at first but breaks under heavy load. It turns out the vendor kernel
   is configured for an external RGMII clock but this can't work on the A7A.
   Th 125MHz input and 25Mhz reference output are not wired to the PHY.
   Most likely, It was not tested on this device. Using 0.9ns Tx-delays works well.

DT example is available here (gated on CCU and pinctrl mainline support currently):
https://github.com/jbrun3t/linux/commit/7b8be41a4130d2471b187b3a1ab33643970ef8a7

Changes in v2:
- No driver change since RFC, just more tests.
- Rebase on net-next/main - proper prefix added
- Link to v1: https://patch.msgid.link/20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      dt-bindings: net: sun8i-emac: Add A733 GMAC210 compatible
      net: stmmac: Add support for Allwinner A733 GMAC210

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 130 +++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 145 ++++++++++++++++++---
 2 files changed, 242 insertions(+), 33 deletions(-)
---
base-commit: 211f2a875f6f447745d80d5762d6d614503ac84a
change-id: 20260731-allwinner-a733-gmac-support-163bde10c152

Best regards,
--  
Jerome

