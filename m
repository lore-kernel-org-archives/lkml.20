Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794782035;
	b=PtB0OMZ4oshxMMQKYG0bj42kxPze2KzlUI/I5PdCxcxeunJzoHdcyPpwlEHO9VLnrrQ4
	 LCK/fH34/GbsjTWJfZ6/PxFJqh8Qn3OoSkQAqokYchlUG1oCHv4yqcPTDKTzj0b43x/o8
	 +hCImxze5sQlr2bZAh+ijAkVg9TgOurJcUcpnEuevhXyIdEGIMNbYQhe1Pg3jF1QSdF3z
	 yf4gmGRIeuq4tbmdnFWvk74fxc8/4ZiMbdvVa7Gw76TFDMX3YodMn9R/nWH2n/XjEJkGf
	 vER+EKB5N0vmMdxpY4hSzvsCS/T1xryJe/nvJ0jPyK7vm1xKeCMJOqHn/FSHEUFrveQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782035;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=IsHAAFBlkVM6ou59b2piqx85V+e+bsPHreAZwXUu6no=;
	b=bRvle28v3f900U1eNQjz8Vk9Q1SJbohRkwdTLWAfNqmnPwTZ49/hrIyYOX9iqvetRAJP
	 511QJbuPLcxLpPvjcgxAwvJAlvrM3JfTLlESGnL5pk4Xs1BoHZ5AZ8SoE/9qt3YY5vTRb
	 QgK0gbNzT4ZpQ4EFx461Vm2ukGP1Qp35FZZPtX9Dy3Sh/jV918hxDm8q9nzR/moVqN0u+
	 XvtOb/WVgpnv4jtTiCmIIJgiEODrA3uWFjj5ji2Z+sqSf5XrrGVqu+s3tSOOZ+3/K5Nor
	 XngEQmFTEAlrI4TSHT69bBVxIzrQcGgHj0mCZNz/XB45/JVdp9gkJbxyvEautcr6NIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAi9+saa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B599606A331;
	Sun, 15 Nov 2026 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAi9+saa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794782034;
	b=mM7YE7KFobUjh0uthVGS1+jwUlzF+2lBt2ryI4W0RerzMU/bKnuI18VYXEw/a6wW0dFV
	 eziRR4ZiL35W9ev3/0h9A+YbIag16ph3EP9On1Zx5Qo5nT77CedhdaoPFq8F53PoN5DIP
	 FrHUmLrDtOI6c6rTN1PSBYYtrXmFrUVVLiARqkaZ94nWA7BrM/MfwwNfOXtiNIYVEVoO5
	 cQMx0xSWGZteMvldSvNoqoGO6rsTh48L5u57So1G4xGA5f0Eih//QbrvnrtS+SQ7IQjIH
	 4uRZTvTKabiT06SEUC6aYgfEAt2tTO0B1TrcuKhyjeIMaPqVh7KVsmVrZcuSym1BYcA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794782034;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=IsHAAFBlkVM6ou59b2piqx85V+e+bsPHreAZwXUu6no=;
	b=S7s+RZ5CVGXgiDkzV6cD1iZbp7zsrDsFHPjP79sIxCKgIyxBpXZMIje1D9FPaUUT3EAw
	 M8YpehQY9/c/Q7/f9VDLaP7yyBaGnqBSS6CTIeb/TKucFMWM3N6BpgLgBJJbNSMzT2zqL
	 06zjoAt7SQa5wBJ6U3VTitLfHKCj+sShpmnVyRMwlTCbOpdaKhbCNPdYb8NdXnqvNBUXD
	 Nl2mHe3f1FLfr9R+IX9v6BrgM7LPFMhhc5xjzENxqlFCnshew2GY7hYRq/N8T7Y0l48xZ
	 J9QgG/7oObf6JvTZxX8k71jItfwS8Hm1w+nZws2vOAcmyiGEz6pd+Aw4e3Fb9UDU62A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 434521F000C4;
	Sun, 15 Nov 2026 22:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782034;
	bh=IsHAAFBlkVM6ou59b2piqx85V+e+bsPHreAZwXUu6no=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=YAi9+saaDqGhp8edWfmy9p/dBNYsCZbJiEqDE91uPgiDdQMYPYrJpDFI9l9xB1hcG
	 lRmEgsVBq9Ui+ydSeBidLjeFQcIbqwSzjGuAGnPh9UlJWlcYHixHstCTvYxe2fhsf5
	 kMRjsCJ7puUVe6+QQld39tCiQhO/0P9xKmytSLM8KSYlZv0Jc+m0JgMw1E8xDoeUyU
	 hPbDqtmYXxMU4+vYxGFiNGLX9UcFHkUyopycqnymlRsEnL56+nqTxsy64kADVwqLSA
	 kadAKNQuyfneqcPJ+j38b9AMWr3QQ405rYYzRJ5OZzg/SkJvleczO48EZtiw3E4GuI
	 pdHuIlTuJ8JxA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 975624A21F;
	Sun, 15 Nov 2026 22:33:53 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH net-next v4 0/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
Date: Sun, 15 Nov 2026 17:33:44 -0500
Message-Id: <20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAEgz+moC/23PQQ7CIBAF0Ks0rMUAUyt15T2MC0qnitbWACLG9
 O4iujDqcjLz38/ciUNr0JFVcScWg3FmHNJQzgqi92rYITVtmolgouKcCXqKPd25K4+RWnToKSy
 VllA1wDskKXa22JmYyQ0Z0sGA0ZPta+MuzQG1f4rP271xfrS33B54TryLyt+iwCmjC5BQN91CS
 4lrj71Sx3mLIftBfAryjyCSUFaat4rVIGv4EeBD4H+eDZAEWQFKwZbltzBN0wNBZSIkUQEAAA=
 =
X-Change-ID: 20261102-mxl-gsw1xx-reset-37ac836b31fe
To: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794782032; l=4542;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=G9njGy7AXdGTSeQCneHiMCT3l8HgskeAPEcXYBj6wA8=;
 b=paHsuqgUXc4UJcePEFHJhWbSe01y6yUv4QUDa/hjvXEgElhewJmCeaUFkoEGLmfki/+wYfLwb
 DjNK5D97MlGDzubluveEfHLBBoU3YU8GjqmE0hqMlOyPLrv4DBmv259
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

The GSW1xx driver never resets the switch, and the MDIO core does not
handle reset-gpios for non-PHY devices, so the driver works with whatever
the bootloader configured. On the GL.iNet GL-SFT1200 (Siflower SF19A2890 +
GSW150), nothing answers at internal MDIO address 0 after the bootloader,
and each port's address answers with the neighboring port's PHY, so the
WAN port has no PHY. Describing the PHYs at the addresses they answer at
is not enough: with them at 1 to 3 and no reset, neither LAN port passes
traffic. A hardware reset puts the switch back in its power-on state, as
GL.iNet's own firmware does from Linux.

Patch 1 allows reset-gpios in the binding for the standalone switches.
Patch 2 pulses it at probe. A device tree without reset-gpios behaves as
before.

Tested on a GL.iNet GL-SFT1200 (Intel GSW150 / PEB7084 at SMI address
0x1f, reset on an active-low SoC GPIO), on OpenWrt's 6.18 kernel with
the lantiq_gswip and mxl-gsw1xx drivers backported from mainline and
CONFIG_RESET_GPIO=y: after a warm reboot and after a cold power-on, all
three ports find their PHYs at addresses 0 to 2 and link at 1 Gbit/s.
Without the patch, port 0 fails with -ENODEV after every boot.

There is no in-tree user yet, and mainline can't run this board's
switch yet: it sits on the MDIO bus of the SoC's GMAC, which mainline
does not support. The GL-SFT1200's device tree is under review on
linux-mips without the switch, which follows once the GMAC is.

---
Changes in v4:
- Cover letter: explain that describing the PHYs at the addresses the
  bootloader leaves them at is not enough (Andrew, Daniel), drop the
  unrelated reference to commit 82e2c7db0830 (Andrew), and correct the
  tested kernel: v3 said v7.4-rc1, but the board runs OpenWrt's 6.18
  with the drivers backported from mainline.
- Patch 2: say the same in the commit message.
- Patch 2: imply RESET_GPIO, which reset-gpios needs, and say so in the
  help text. Without it the reset core skips the optional reset.
- Patch 2: say that the GSW150 timing is used for all the GSW1xx parts,
  as no other is known.
- Patch 2 keeps the reset controller API, as Daniel asked for in v1,
  rather than requesting the GPIO itself.
- Patch 2 still pulses the reset in probe, so a deferred probe repeats
  it. This matches the realtek DSA drivers, and moving it into setup
  would also mean redoing the SGMII and pin mux writes and the SMDIO
  page cache that probe sets up.
- Patch 2 doesn't assert the reset on remove or after a failed probe:
  the switch was left running there before, as in the realtek DSA
  drivers. The reset-assert-us and reset-deassert-us properties are
  for the MDIO core's own reset handling, which covers only PHYs, so
  the timing stays in the driver.
- Patch 1 keeps the GSW1xx switches in lantiq,gswip.yaml. Splitting the
  schema would be a change of its own.
- Rebase on net-next.
- Link to v3: https://patch.msgid.link/20261112-mxl-gsw1xx-reset-v3-0-863e82074893@telaak.dev

Changes in v3:
- Patch 1: say in the slew-rate descriptions that, without the
  properties, a reset through reset-gpios leaves the power-on defaults.
  Rob's Ack is kept: reset-gpios itself is unchanged.
- Patch 2: say the same in the commit message, and wrap a line over 80
  columns.
- Cc Philipp Zabel for the reset controller API.
- Link to v2: https://patch.msgid.link/20261108-mxl-gsw1xx-reset-v2-0-46c1da093893@telaak.dev

Changes in v2:
- Use the reset controller API, so reset-gpios goes through reset-gpio,
  instead of driving the GPIO from the driver (Daniel).
- Use the vendor driver's reset timing, 250 ms asserted and 1 s before
  the first access. v1 gave 2 ms and 100 ms as the vendor's, which they
  are not.
- Patch 1: add Rob's Ack.
- Link to v1: https://patch.msgid.link/20261104-mxl-gsw1xx-reset-v1-0-53839bf5c88e@telaak.dev

---
Joseph Telaak (2):
      dt-bindings: net: dsa: lantiq,gswip: add reset-gpios
      net: dsa: mxl-gsw1xx: reset the switch through reset-gpios

 .../devicetree/bindings/net/dsa/lantiq,gswip.yaml  | 12 ++++++++--
 drivers/net/dsa/lantiq/Kconfig                     |  5 +++++
 drivers/net/dsa/lantiq/mxl-gsw1xx.c                | 26 ++++++++++++++++++++++
 drivers/net/dsa/lantiq/mxl-gsw1xx.h                |  6 +++++
 4 files changed, 47 insertions(+), 2 deletions(-)
---
base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
change-id: 20261102-mxl-gsw1xx-reset-37ac836b31fe

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


