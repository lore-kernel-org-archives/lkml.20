Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203586;
	b=Ve5NJb2qo4gP6yQ6m/Zk7atJfN0No2YymXFZuNg6PwBCEZ2Jo5g+Fr42w7yjRSYekfsD
	 FGcyR7Qsv0LavZ5T1f5WET2fvXU2y8B591Kozj9JpyEqUSWTOl1+zox727ZWiXvI9QDxk
	 TnXxDNg2VWkFnf8b26NUuxYntrfuZKpBeAjtMfBhzLg0oQlPVmQ1bb+WkXZ6SHoOYaoFe
	 XeScOj+1MVi3FDY8yRQ3zSBHbYPhbaXb7lCJ1L1JUHBhkwNP22lLF8XuSp9zLQ4GEaypZ
	 pdfvC3GKmRpM5lixPswd1IDgNe9e8lVhWe8C2UPSpD/NDWqR7SGnAls8Ej1Gjx2YvYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yF8DTNoppb75llVRPX1LYhsClp6/Hcf2t++M9WagagA=;
	b=l0za5lwLUCQnPkNKHjY6stE3dD2VIbpIZDYlSKEUv4bnMxeDtVJwkBmSc9GKbzm8n1yb
	 buRGc4YvIfMPN1LIliwc4ESWQVkfRGDKzmOcGREk1JZ/Bbzej1NM+Kx8rR0WrCEbXZ8fs
	 wrcDFTfwtHrgUogHTC7nnU4Sp6ZxT8L60r8uacyWHVH/06/1T+I5p4u9zEY/3LgylWRLB
	 I/fKMwzhECST+sEsDhy/PNy1gjQEIpGVpDBNCFMrFwqSwnjl8unmLr9kKKfbc2w5rYRZp
	 1SmRR0V/5lv7GepjN1Tv/U5dDVaIjz3uGkE5Za7G0M/469+C3m0YCsyEuGiouoVb0HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=To7xsWAk;
	arc=none smtp.remote-ip=74.125.225.136
Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB8B606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB8B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=To7xsWAk
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a77811be24so6931605e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203584; x=1793808384; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yF8DTNoppb75llVRPX1LYhsClp6/Hcf2t++M9WagagA=;
        b=To7xsWAkeZoR3UfNxISL00p3TDp1YKvjvX5uz1h2JKzbs+n26BJ5d22BglVMx05TN8
         qRgpa1lt8F9FG3R7QnLnWMvjKkbUObRpmi+Mlv5YwH2OSlcnvtgD7WnJBJ4UzVX09VsU
         3L2MEbtIDsUjHI0GQRvW1dlfxkO0NoFrbAcMZfgsPyAgmt4Ui099XB9Nr6yP8KBVrIoi
         sXvVrvv/+goMtM9Ps/jBN0x7TvO/zD+hrcrAqdJBleAOvJza+0ETtZorHtLQj3GdjnjO
         dODy751fzWHx6xztkxJli1i1cvJN4xUP4GlsdQ2Xyp3i9HzHjvGqbg8L8GjPvOqRv8ee
         Id5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203584; x=1793808384;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yF8DTNoppb75llVRPX1LYhsClp6/Hcf2t++M9WagagA=;
        b=vxT5/s9Lf4Wn1Y18MYxDyLvNLZvWMqTHO+zAZJgrtz3h0Uc6rXpkpuLrFTtODaiRyT
         Vu+kHEGew+sW2u9rGzKTEnWGYrA6mL9FrIYgOvv3wDSGiTMv8x2Q0GkWzz6EirK9jDMj
         8Pb9/pzkg/iNJUVV760sN0sP8Bp5wQ4hOFeB/FuKpENqdSCdH48bxSeLIBBBR+Swug2v
         Q7Fff4D9LK2FkQXPZJnL2v1el2G0XL2Px/G+VHt1hqiobEMAzpFdjKTCjftiIIkpE3nK
         bnOpgsd6+lFqkOBX+gRLvaL59mFEnTG+BCjt5FRA97Fz1C7d4xy+Tl/vVRufrdlA08gv
         0NIw==
X-Forwarded-Encrypted: i=1; AKwUvBwfybZXgXA4UXIWcYuMufS7fArtXDdth/pXxwrcavNUgtgn+4VHlv3ZKWFKsS4T0sc/uW4/I4dxqw1oVYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyCwy8Gc18Q9Wn6EclP4Ev+5emyJ04zGzVuW4LviY5QsoJvER2
	e78aqmOKBgZUUDQLQ+Az2c63SRAYgJsPRp2b1GyN662GjdxY25yY9Vhxd13CQyvY+yARw5yXpwq
	oQdkZAekHbsb8
X-Gm-Gg: AYBFou0dfZHCRqx29cqCxC7D5yekxo7kfO/T15IVoZLPL6Xo0LQTdstZr+COPs4PZtk
	VJMcq+cq3tIPc35Ff7+QiHOcRtmJwufDKTnmSutmg5YVx+xkJzffVRsWS5/KD/5sjI6ZnA9dqxn
	pVhCdvgxRYJCWRSH7aGd11P7C/Zpe/rOBM5etHMOyGmBTMDa7aKT2ptK/H8NCfpuH+Uw0KSxU/x
	WFoIRCzYsSquvjXZ0id8OxygGg0h1Zts6rZTr3wugHm6OGk/f9pqoBonMrqxGMvD3ouxyGbX0re
	sGYTuRm+5pzN8uHQDGeRiUf3LcabLkIRugkn01AXac+c4ghbvpV8ivSzU0BSkFG51ifhmmeIM+A
	NnOtBMRceCdy7JihRhDz7pOvZDmFbJgTq0ubXNn99e9kP5nfZuvpK4BYyvFF9wnqtct0gQd52cn
	QtXDP1Xit1U5YugxZN1PBqGrd6iV/uTOjO0sMnI6gCfqBHaUQCg9CiPU6jeyFd+TNj8hOO2gmGf
	HsZzRDaoVjEvFtoDO7KlbAVnrx/fUGDVzv/PgNpoRzL/J31CjAMOXHj8xNtigNQs+OlG8kZyx8r
	3qabOBgeBv1G6hbiExo0jsB5AHw990UZDvcpuLIVRTCnS7hqwB4RtjhuQbBe8bLdLTYO2Q1OJ6u
	OLfhFdTITV31op/eGCtQa/j6fpt8=
X-Received: by 2002:a05:600c:3b1e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4a9665870e9mr66989745e9.15.1793203583947;
        Wed, 28 Oct 2026 09:06:23 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:23 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH v2 0/9] ARM: dts: omap: dm816x: fixes and peripheral
 updates for DM8168 SoC
Date: Wed, 28 Oct 2026 17:06:01 +0100
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V07ZhOgVpd+R+GBZQB6qMlbSUaw
 r9bMC5dnuTec2YWyBsK7JTNzNNkgnE2gdhlTA+17QlMm5gJLiRyLGGsox6AbtH5EtqHQqmgjQF
 E0eSlVhyPnWTpPXrqzGszX6ovh2dzJR1X3boYTEiS95aecN39KvJvZULg0BSaci7wwIU6342tv
 ds737NqWZYP2kByONEAAAA=
X-Change-ID: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2377;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=KPWUh12AlBMdTgY4W9Vvurzty1N3jd/W9TyN0OVcNqk=;
 b=jpFHpzmJ+Cs/Ugc/qNMlaeTbGp1SvOlBHHccwaTTgEAOwYwXAs/JkeskmNRK2Vi0n1/UsSoTt
 DbD9bv6fgUtDCFT+bcF24gpHTQ8QDlVsw8iFEUuBvKbSIFJmGbjIMuk
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

This patch series collects several fixes and peripheral enhancements for TI
DM816x SoCs and the DM8168-EVM board:

- Pinctrl: add correct pullup/down enable defines for DM816X SoCs, which
  they appear to be inverted respect to OMAP2/3.
- SD: explicit pullup disable in DM8168-EVM SD card pinmuxing.
- Clocks: Correct sysclk5 frequency definition in DT.
- Storage (MMC): Update MMC node settings.
- USB: Update MUSB node, enable multipoint mode, dropped usb-otg hwmod.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Tested NAND on DM8168-EVM, seems the pinmuxing is working fine.
GPMC_WAIT is left with the pull-down enabled where a pull-up would be
preferable, and GPMC_WPn is not muxed (reset default). Neither causes a
functional problem.

Changes in v2:
- Removed useless "Prevent USB being put into idle" patch.
- Dropped "Match up capability flags for USB" patch.
- Refactored USB node patch to use ti-sysc instead of usb_otg_hs.
- Added "Remove hwmod code for USB" patch to complete the ti-sysc
  porting.
- Using DT include instead of dt-bindings header, dropped patch.
- Link to v1: https://patch.msgid.link/20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org

---
Andrew Goodbody (6):
      ARM: dts: omap: dm816x: Fix pinctrl range
      ARM: dts: omap: dm816x: refactor and align MMC node
      ARM: dts: omap: dm816x: Correct speed for sysclk5
      ARM: dts: omap: dm816x: Update USB node
      ARM: dts: omap: dm816x: Remove hwmod code for USB
      ARM: dts: omap: dm8168-evm: Correct SD card pinmux

Christopher Obbard (1):
      ARM: dts: omap: dm8168-evm: enable MUSB multipoint support

Ettore Chimenti (2):
      ARM: dts: omap: dm816x: Add specific pinctrl config defines
      ARM: dts: omap: dm816x: use dedicated SoC pinctrl

 arch/arm/boot/dts/ti/omap/dm8168-evm.dts     | 17 +++---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h   | 20 +++++++
 arch/arm/boot/dts/ti/omap/dm816x.dtsi        | 81 +++++++++++++++++++---------
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c   | 21 --------
 5 files changed, 83 insertions(+), 58 deletions(-)
---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

