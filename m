Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814762;
	b=tuxcEOSj7h4jnqO2egkXxTvVq2XL84q/V0hj3Q3p0LSCILwoYlY+k/am1J86s2xy2Hc6
	 AftFPb0Rm0FdR8ZAFOvmydquBHoTnp+prWWfvlIXB+Y6HjNi/gewISHQFvdYvDX9cEJQb
	 OHQeyXhWn/VToUOKd0QFL50VU3ZlmE/sJWLMSWs34YR1Hwi80Ucx4Uajyrk1fWW6ho70w
	 XGahh+bQu9DB6pePhgBbmS+KgB7dcYpkDgzFsCHwhYK8iImEXonxmlDa8Zvca9KmydvTD
	 AcsrC5cBsdSTXTtdg2EwNd/fJiB4YFAhjydL6VYm5fJcft8ksDsE7HmLNWyzMNrCFWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814762;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=hVoFltioV/Os7uCTNOdUtsATLlsQ2VJPx1x+e8Pga0k=;
	b=EjbJR6cjY1HjhiKjc6bParmghary6BzAxidwlIRx8xtwLUjkpPYpAvjZO58VMa2duSQQ
	 VrMKTYvaftarivgZLWKkzUWA85atMmqM429eJOot/v0FdvLxQy4YQHDDu1AskL4OINwnF
	 X2NiQqTKK+hJb41uKjUeWkYg5WDx5rj3ZXwAuxsTWKt1TxeF7QZl4mMOZhNubbPaXWLNc
	 Pzitf7ZBb/W9uwlVg8zqjkwRJJvwTdS78GCBWHa/iQaKYHYJdVJj7MdYSfpW29HZOFEW4
	 lD+1j8Jwy66GmCnlGRRSvBVr6GQgmVrU5ihlcig1IjuMTSR1ycoh3WKMuq8M6v9l1Pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmieTsc5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565BA606A31C;
	Mon, 16 Nov 2026 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmieTsc5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814761;
	b=LazHn8VXC39dkRzj9xqZTP20d04KjrRvprABsh5B5kySm/wUrpYBQNgHH6PSgGKt1bSn
	 Gzek/g8jx9UgZTF1hwNz/x1qk4ng3uEjWxuvUTKwJhQTlOsPIwYMeyKlw+GyOu8h2xRR0
	 t8YnoqrxX9BiEO6/3vXRdtXx4EpENqBMK8deyBAnOYSjCfXi78zs5W4fmh6k/nTuR9lPq
	 H8PETrUm/V+u9lPchaPaHyEd/ySCDj9eXkbPGUjOwrSZe2vdXX0Ac2woByRvvwRsBCOFm
	 rh1JmcFnuPb93ZGr3glXgZVRjrg41A0Yx+wZFFD4vb5ANFqFyll2GPewOAGnjxbTzsg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814761;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hVoFltioV/Os7uCTNOdUtsATLlsQ2VJPx1x+e8Pga0k=;
	b=ZYvsIm21+ljd0+XDC6VBDucvMv8blTLR4NwKMUxfa1sFo/ZaP9BIgK0YY7LQib3U+NQJ
	 XcuEbV19wmFs0ccdPRFKVVffLw8qGVjx407gWprQ3kV2h9aLoPy9ylVXvyRFAB53uKU8H
	 HYnQPnKNi8CVi6a5aHvCc6ocZJDomyS/7gUUCej7yYfGwDc22dYPJr36VPsvkvV37heZ1
	 lK6FANYq4j79trGEvNK2TFyo3EbcfXK6c29kKzlJqp7AcKkkJ+iGtO3KmNFbwh5RWJ2Ez
	 Z9PUA3+XJvxfVEmUsMwfOQ3pLBqtGXJqCyQ3mNfSIAZ3/yPASLyefy5RJJd4qSrYBzQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BA8C1F000C5;
	Mon, 16 Nov 2026 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814761;
	bh=hVoFltioV/Os7uCTNOdUtsATLlsQ2VJPx1x+e8Pga0k=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FmieTsc5pYgqzStptuxvxIcMb+6tg8ZK7ZR2vHAyx98ipkfnYKZdOzARBQH5xrnwb
	 zjoQ+PyHMRB7E5QA2I08pyyYvaWXO31pXwaqTuywsoJBd15ZMg0g13affj1jSJOVai
	 yY73YIhTBj2L5Pk1WZ7X759rlT2QgXER1H160xJcpSKM5iBJtKHsU4tjYrnsaJoKAc
	 kmvtd5pfzUN2fRf1vV0H3e9lQmU57aisoIbTmoa4trv1PFbBczIjoCNMM0CDrI7OGe
	 4Y6dDjUzdUbPTPoGnCYvs2bXXcjLro3pDIpc4yCdpcAYY9D8UTzgv83Qj3jf1ohjwf
	 RnVH37adQsCgg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 982104A37F;
	Mon, 16 Nov 2026 07:39:20 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Subject: [PATCH net-next v3 0/2] net: stmmac: Add RK3572 support
Date: Mon, 16 Nov 2026 15:39:13 +0800
Message-Id: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
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
X-B4-Tracking: v=1; b=H4sIACGz+moC/32OzQ6CMBCEX8X07JrSH348+R7GA7SLVCOVFhsM4
 d0tNdGLcW+TnflmZuLRGfRkv5mJw2C8sX0UfLshqqv7M4LRURNGWZ7Fg1praGztNNgrlwUDBT2
 OILSQZVkoWciWxPDdYWumBD6S1dDjNJLT++MfzQXVuHJXb2f8aN0zbQhZSqQ6ytivupABBdrQV
 pey5hniYRh2yt4SPbBv/s/cwCKDUyHynFeiKuiHsSzLC7dkfdQVAQAA
X-Change-ID: 20261111-add-board-ok3572-c-net-4d45887c575f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Wu <david.wu@rock-chips.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814757; l=4122;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=LxqYt0+Iq/eihPSSDe3HWKJJWGmfN3WZKQQ1CIPyjfo=;
 b=Uv0jByIhY6SMGv/IOvRZ0MFtcNERUxMqvPm8PXX2lYwiWrEEb0oJqbPCqEAKh39fMcKW+79ME
 dpBa6uGGrACA499afQ4s4iS0QQfxq+qIcRCxSkK6JoHWon8aZqhynRh
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com

This is one of the subsystem submissions for RK3572 support.

This series adds the RK3572 GMAC bindings and support for both Ethernet
controllers in the Rockchip stmmac glue driver. It provides RGMII and
RMII mode and clock control, together with RGMII delay configuration.

The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
ports, a Type-C dual-role port, eMMC, microSD, and UART.

Testing was performed with Debian 13 minimal and Linux 7.3 on the
OK3572-C with the FET3572-C module.

Passed functionality:

- SD and eMMC complete the firmware, kernel, and root filesystem
  boot chain.
- UART console works at 1500000 baud.
- SD read/write and data persistence checks pass.
- All eight CPUs start; CPU frequency scaling and hotplug checks pass.
- Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
  transfers.
- All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
  and reconnect persistence checks.
- Type-C host and device modes pass in both plug orientations. Physical
  reconnects correctly select the expected device, host, and device roles
  in sequence.

Stability:

- Repeated cold and software reboots complete on SD and eMMC without data
  integrity failures.
- A combined CPU, memory, network, SD, and USB3 stress test completes
  without a crash, lockup, CPU offline event, or thermal shutdown.
- Ethernet error and drop counters do not increase during bidirectional
  network tests.

Build and checks:

- The kernel, modules, and board DTB build successfully.
- The series passes checkpatch with --strict.

Untested hardware and paths:

- NPU
- PCIe
- GPU, video output, and audio
- Other low-speed external interfaces

Some files in this series are derived from the Forlinx OK3572-C BSP
Alpha1. Thanks to Forlinx for their support.

AI assistance:

- Codex / DeepSeek V4.1 Flash were used for:
  - Reviewing and adjusting code style to follow community conventions
  - Automating tests
  - Collecting data

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v3:
- Deprecate tx_delay and rx_delay and disallow them for RK3572.
- Link to v2:
  https://patch.msgid.link/20261111-add-board-ok3572-c-net-v2-0-304466394970@qq.com

Changes in v2:
- Split the original RK3572 support series by subsystem.
- Add rockchip,rk3572-gmac to the shared Synopsys compatible list in
  snps,dwmac.yaml.
- Link to v1:
  https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com

---
Raw dmesg: see the v1 cover letter.

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: David Wu <david.wu@rock-chips.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
To: Jose Abreu <joabreu@synopsys.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com

---
Cunhao Lu (2):
      dt-bindings: net: rockchip-dwmac: Add RK3572
      net: stmmac: dwmac-rk: Add RK3572 support

 .../devicetree/bindings/net/rockchip-dwmac.yaml    | 15 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 53 ++++++++++++++++++++++
 3 files changed, 69 insertions(+)
---
base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
change-id: 20261111-add-board-ok3572-c-net-4d45887c575f

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


