Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376811;
	b=AJLkKXLhU5ygIurVneIOvU3rd3CzG85qM0wbg+CzTcYROgDTaRAPjVQoW4tWJ27faIio
	 25GBbuQhLs4GHVTXhHEngfF/it2/q1uF5nrrXh/AkSHcsW80h+y5B2jODQa5v3EPPQiad
	 kcLBN/Kxe/Rs8gsXYMjQDo/K3bnNLtIwF/G8b7IrvYVnUgz2P8IaE3SbRPELmUtLxd+ht
	 0TaDWgBikTkPKPc+JSwa4fbTkbOPS4BgSb634Vxt81WyM/yWRoLKeLHOlG0Gxlw9aNmIg
	 25pMC7uax3wk4iMZhn5XqnOZGk47JmHh4odEbQyQAW5UUDpRLHR5G+tjk0nvIObUYOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376811;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=rWyI2kn+bRFE4cg/aEwcjlnzCwXp15YvqY3EZ5DhaVY=;
	b=fcGJWC83kdHZpqbiUFryijDYJCrtGEBaPtp7t+hmK9Vd5pczUWhtY9IUNwifAbraApPJ
	 GyHNuGoLxpS8Zig8atlvyR2O3GhAsnlO3dLXh7rGl0fJz36SVYf7+ISH31jmbeWB5oOM0
	 59x6qBU5NJG8RDQgnerWlnpT36R1VgZYI+OzToCIyQ88i3i2xccqlN/pgLPM9MHY5HrBo
	 QAElHR8EALSiN+z1RmtQm76hUcQL7Lj7Tklp3XYdAZ2rX4ZRbXxxz+bEARZEXltNuFdgf
	 yX4WSoOD0s2ko6pQR/tHIDiQ9zrELKUkkTc8gzNAuguivHk1BTd1uGJOpLKzYApspFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfHrM5Q5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AB0606A31C;
	Wed, 11 Nov 2026 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfHrM5Q5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376811;
	b=pmteJnxMAmJrgXq0GK40OQL4ZgOENIu9PMC+QhgRNUB3TQyqWQqxcB1W/kyUmSIQxTlD
	 +YKJfGC6xMErZI+m339vH78Ta401w9lEV5zVVVNrEn3fXxKbu6Mp0J+WOdZupeQ9jQNTe
	 gdnyJ4AeyZcReGef7dvWXaqOG0LQgoEaxRw30F9a6VZNa3WSpVJVNf3ZVT0UkZjbxxSUF
	 hPnl1hjRF8Q8lK43urSujpCHvNT0yiG1o/wo3xu2IJNDWa5o6F4hHMPBnOBQTQcdDlFVF
	 sJc7nePjNhoayQgUx226ELnCZyR4B62LzD9i+EhosuX9gh5xMvj9Gk+hXA6r79E1MUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376811;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=rWyI2kn+bRFE4cg/aEwcjlnzCwXp15YvqY3EZ5DhaVY=;
	b=IAthSS9gnVfxktqq/T7baSgMc+QzxY8db60yQtXnHIOgiMJ+AODSrDyNIvKTwsSvrb8v
	 SAejvY7r0QRSuh3HAjDL0nZC/BQleXJ9Nc35PR4io/EZ+W6fk5IB42/j1P2tZQM75rA7A
	 afJNYNC0KD4nFRBI8YNFPf1uWBBOYvOGwsO4ifXhmJN4Z7sNGxOYUu2btYIF6hhJJ24CC
	 4mR+vFxhHJyG/p7og1m97LW87HA4j/+KpwShWx0t5tnda/tPuRNAjPmsnNYj07MCb06Fy
	 sqmA35rJHeKrr43y1YHjpugu9E1zhHXBkyGSyovgQuQvMxG/rG7A7x2yYU/0m9reNoQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FCBB1F00A06;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376810;
	bh=rWyI2kn+bRFE4cg/aEwcjlnzCwXp15YvqY3EZ5DhaVY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QfHrM5Q5tlCF82OayNgYUv9e9GxPsgBGJpXEE7XmMvL8v0yuuMNnE0pdUjIsX8uaS
	 L1s5QL69aqWukC2B+SONdqxjSsaG4ev5/SPxrs9CqED6WJvuYaYRDZsey6XRaz2Ro/
	 urZtTUVUV54J6ScA6Lz6fRmFwdbtwwMfRHKKrJ9bnJuC3kG8aDNGF27tOKj4ntOK1U
	 MggPKSgKDOm62Mnm+gO3fTgxTEy+YX7hp/3Dbj9jOvAAoR6zPBBOms4WltT9h8Rsjp
	 gWbKvXS5CFJMaIugejZXhRkpZDsjNd2mkwQHyQGqQ6kL0CjBhGBsEmdCasVJbZT0Yz
	 2TfuqjfKT7xhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 838E648DD7;
	Wed, 11 Nov 2026 06:00:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/8] arm64: dts: allwinner: h616: Orange Pi Zero2 fixes,
 GPU DVFS and GPU cooling
Date: Wed, 11 Nov 2026 06:00:06 +0000
Message-Id: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZhOIzVx5T0MizIMMEaoaYGoh
 LsLuHb5kvffnyFJVElwyWaIMmnS0K9gDxlw6/tGUKuVwRrriMhg68jhR2KwWA3ouTwxC3tvalg
 3zyi1vvberfhxGsu78LBFNqPVNIT43g8n2rx/7YnQoMlz46qzM7Wla9N5fRw5dFAsy/IFAwUNP
 bwAAAA=
X-Change-ID: 20261110-h616-zero2-dt-acb4ccecaa0f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=3816;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=6jel4MoJqtTxrypSxxUTQ6tVnFHWyOMfTonT2Q2GlFE=;
 b=hSLIz7TyuZtdWQpe2KdWRIiqTkjVZpDUD2GjXphRwSTHIhU6vD4iiunD1Ci38649ec1wddF1P
 zaz9AqIzrcwCsV5BKSRpyIUJmDEhY7ZYYAxFm5Z+/Q/bvih9Y3rS4I2
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

This series collects the device tree changes we carry for the Orange
Pi Zero2 (H616):

- Patch 1 makes the H616 codec node cover the DAC RAMP register that
  the driver uses (it currently works only because ioremap() rounds up).
- Patch 2 fixes intermittent dead-RX boots of the Zero2's Ethernet by
  letting the RTL8211F add the RX delay ("rgmii-rxid"), as the Zero3
  already does.
- Patches 3 and 4 add an H616 GPU OPP table and make the Mali-G31 a
  cooling device of the GPU thermal zone, with a passive trip point.
- Patches 5 and 6 enable GPU DVFS on the Zero2. Patch 5 first raises the
  floor of the GPU supply to 900 mV, because on this board the rail is
  shared with VDD-SYS and the video engine corrupts decoded frames at
  810 mV.
- Patch 7 describes the SPI NOR supply, patch 8 adds i2c aliases so the
  header buses keep the controller's number.

Testing, on an Orange Pi Zero2 with a v7.3-based kernel carrying the
same DT content:
- RGMII: 10 of 10 cold boots with a working receive path (the problem
  showed up as intermittent dead-RX boots before); iperf3 853/873 Mbit/s
  and 86 minutes of traffic without loss.
- VDD-SYS: with the VE at 600 MHz, only 6 of 13 4K H.265 decodes were
  bit-exact with the rail at 810 mV; 3 of 3 at 890 mV and 3 of 3 at
  950 mV. With the 900 mV floor, a 70-minute decode soak (H.265 and VP9)
  had 42 of 42 runs correct.
- GPU DVFS: panfrost devfreq scales 306-600 MHz and the vdd-gpu-sys
  voltage follows the OPPs within [900, 990] mV.
- GPU cooling: the gpu-thermal zone binds the panfrost devfreq cooling
  device. The 85 C trip itself was not reached on this board (it peaked
  at about 70 C).
- SPI NOR: the "supply vcc not found, using dummy regulator" message is
  gone; the flash reads back correctly.
- i2c aliases: TWI3 enabled by an overlay shows up as i2c-3.
- Codec: analog line-out playback works.

The series is based on sunxi/dt-for-7.5. "make CHECK_DTBS=y W=1" gives
no new warnings for the H616/H618 boards. The Zero3 shares the GPU
supply design, but I have no Zero3 to test, so it is left out.

These patches were developed with Claude (Anthropic) as a
coding assistant: it investigated the problem, wrote the code and
the commit messages. I reviewed them, and they were tested on an
Orange Pi Zero2 (H616) as described above.

---
Changes in v2:
- h616: Add GPU OPP table: use <target target max> voltage triplets
  like the H6 GPU OPP table, so that boards whose GPU supply cannot
  reach an OPP's target voltage lose that OPP instead of running it
  undervolted (found by the Sashiko AI review). No change on the
  Orange Pi Zero2 (AXP305 DCDCC at 900 to 990 mV keeps all ten OPPs).
- Link to v1: https://patch.msgid.link/20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com

---
Arun Iyengar (8):
      arm64: dts: allwinner: h616: Cover the codec RAMP register
      arm64: dts: allwinner: orangepi-zero2: Let the PHY add the RX delay
      arm64: dts: allwinner: h616: Add GPU OPP table
      arm64: dts: allwinner: h616: Throttle the GPU from the GPU thermal zone
      arm64: dts: allwinner: orangepi-zero2: Keep VDD-SYS at or above 900 mV
      arm64: dts: allwinner: orangepi-zero2: Enable GPU DVFS
      arm64: dts: allwinner: orangepi-zero2: Describe the SPI NOR supply
      arm64: dts: allwinner: orangepi-zero2: Add i2c aliases

 .../boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi    | 62 ++++++++++++++++++++++
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts   | 22 ++++++--
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 17 +++++-
 3 files changed, 96 insertions(+), 5 deletions(-)
---
base-commit: a7f6e476aaedba0d8ec575acaeb3257f900a592f
change-id: 20261110-h616-zero2-dt-acb4ccecaa0f

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


