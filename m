Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8AF1A76BB;
	Thu,  8 Oct 2026 01:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791422449; cv=none; b=ZHsWppnvVXKs3OA4C6rjAi3cl8jz1ukbRh8Yx5TAljt21O1OBUmrw8NZ+WP/uCKY/g8nZRZceMmfY+FqCTgZS//kNANGd2Ee7WItvul3YTBcwDuQgtuoYSgf9UoU4oTyJovgORp0gnrtwCfBacvbpBzFbvo3hpyRCbxxAbqzjgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791422449; c=relaxed/simple;
	bh=CLPOfl3bbRiD5l6fcc46ga7VhcI0uwZ5ljr5joJHmSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AQvO5soTY/s44Jw4KF0EU9hhonjKErnSjDuZu4XndurgvlSBVl6peG7GNgvPcLMcvmUcsC33zbPq2VEdQ8sOFdNgXLWd75qKTCeqfrq675VnWTUKV4xDIeG0j/I3t1xQ4PdxY1xGSaUett3WUtRW3knHJvrbH96ELl1q0DefNHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0doytP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0doytP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6961F000FF;
	Thu,  8 Oct 2026 01:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791422446;
	bh=SRa88cNDS8cS4jU92wvDH+YDXSST8V7u1mZXBFhdDVk=;
	h=From:To:Cc:Subject:Date;
	b=m0doytP40LLZ4FriMFqm1HtdO0LZMo+7+bougZMLabiZyfioaLVMGzcDBgKp/wsHi
	 nJya4to7vF6IUI+ZEuKyDK2VUfdp7oGG1e81PtCEoFNATLGdhtHzrYiGuVSH9dfndy
	 Ptf0S1OtFQr5zrgVjf0rECIFzLXHoqXE/As4gJXXnKe8ZQUE26rQWivNNjEJoFgx+g
	 Hjf1JCC0dP9m+3SMvCm2XUoqmjY/dzT9q9ySWxyR2xCu1VvOUVi6+/K8y6OgVoRLpN
	 sRmONQUjn7Q8ex+38j7fb4RyKW3FJrmwgGwCbDTZYYNaDmzsPVET4Z9WXitb0zgaXh
	 X+8NUW8ExfY2g==
From: Yixun Lan <dlan@kernel.org>
To: soc@kernel.org
Cc: Yixun Lan <dlan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.4
Date: Thu,  8 Oct 2026 01:20:40 +0000
Message-ID: <20261008011902-KYC9093695@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi SoC Maintainers,

   Please pull SpacemiT's DeviceTree changes for v7.4

Yixun Lan

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-dt-for-7.4-1

for you to fetch changes up to d5eefaf546eb83f98206137a5784b6b8510e4fe5:

  Merge branch 'spacemit-misc-for-next' into spacemit-for-next (2026-10-06 11:51:34 +0000)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 7.4

For K3 SoC
- Correct CLINT and ACLINT
- Add USB nodes info
- Add cpu scaling
- Add rfkill node
- Add i2s info
- Fix IMSIC
- Enable thermal and fan control (CTF230)

For K1 SoC
- Set mac address from eeprom
- Enable onboard eeprom

MISC Changes:
- MAINTAINERS updates

----------------------------------------------------------------
Andre Heider (1):
      riscv: dts: spacemit: k1-musepi-pro: add cpu scaling

Aurelien Jarno (4):
      riscv: dts: spacemit: k3: move USB3 phy to board level
      riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
      riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX board
      riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX board

Chukun Pan (3):
      riscv: dts: spacemit: sort nodes on OrangePi RV2
      riscv: dts: spacemit: enable onboard eeprom for OrangePi
      riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi

GUO Ren (XuanTie) (1):
      riscv: dts: spacemit: k3: fix IMSIC num-guest-ids

Guodong Xu (1):
      MAINTAINERS: add entry for SpacemiT reset controller driver

James Morris (1):
      riscv: dts: spacemit: k3-com260: keep dldo4 enabled

Jennifer Berringer (3):
      riscv: dts: spacemit: set console baud rate on OrangePi RV2
      riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
      riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes

Jonatan Hazell (1):
      riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC

Junhui Liu (7):
      riscv: dts: spacemit: k3: Drop guest properties from M-level IMSIC
      dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
      dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
      dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
      dt-bindings: timer: sifive,clint: Remove spacemit,k3-clint
      irqchip/aclint-sswi: Add support for SpacemiT K3
      riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes

Troy Mitchell (4):
      MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
      riscv: dts: spacemit: Add K3 I2C6 pinctrl state
      riscv: dts: spacemit: Add CTF2301 on K3 CoM260
      riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

Vincent Legoll (1):
      riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC

Yixun Lan (1):
      Merge branch 'spacemit-misc-for-next' into spacemit-for-next

 .../thead,c900-aclint-mswi.yaml                    |   1 +
 .../thead,c900-aclint-sswi.yaml                    |   5 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 -
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |   1 +
 MAINTAINERS                                        |   9 +
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |  35 +++-
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |  69 ++++++-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 132 +++++++++---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |  77 +++++++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |  18 ++
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  38 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |  11 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 229 +++++++++++++++++++--
 drivers/irqchip/irq-aclint-sswi.c                  |   1 +
 14 files changed, 571 insertions(+), 56 deletions(-)
