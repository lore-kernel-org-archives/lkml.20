Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718764;
	b=nOhMEuaRsHpWDtFRUFW44C/SLxW5ttBTRfJSfKFdkKV2g72s4noS0FWRVtVVaUBiZViE
	 VZy/IiO5HYU2MiFo5RsykC489GB18AicMk6e5DbBZbtkF+z6FpNcDGrxNnV9vlGgTkMTP
	 dcbqiNoHnskHlj/0XflmF3hUHB1Yg40Ydjrtbojf0+fEdLJ/i5M7cUq6xb7C9k6n/y+60
	 hMpwUdKpMMQGwuHKFQzFh5TQA1KXOaWit8jie7HE27p8GTDz+9svWOodLDI/LY2RhBC7M
	 EGC98toywh6keTgIt4vaXn3cdkVu/p6epNm0VnCk1euaD3zCgZehDEFoPijjbpz8IFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718764;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=NaVbGjpCB1+ihGDMTWVDYCcxjn/9X7pRUYNMNxwpYIM=;
	b=phtuYbx44PC9j8rlZPrX2YgUEu+rFWGMLi19PLNBkwcNSi4wTswVmHK3pYcf4AQb3y2/
	 oOeQ2PnFpV4xxutrBZ+EOWOGpn7uWR5f/nR+u5XVUJvXGW9UTWSgzw3i2tsdocTKWLlqh
	 ip9c9Ao2jrHrK5O+S9ndcc9106yTlRNjZxi1uJPU9C3qNK7kJWI+pjbTx4qqFWATxdETC
	 lAKwPKTUlElx5qLrH9XV2FbeD02TNp3nVYQr/g1O1KoKLLWfSkZFEUzJZFuoFNb6p2k/o
	 wTXmsWxUDA0yhX5gsA9xRerLkPvPqR1Yr7HI+KiAw+WNJI2v23PuCEqCLgGU6Ra2TnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="aak/E1CJ";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D6C606FCC1;
	Tue,  3 Nov 2026 15:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D6C606FCC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aak/E1CJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=NaVbGjpCB1+ihGDMTWVDYCcxjn/9X7pRUYNMNxwpYIM=;
	b=aak/E1CJkpTq5CuU/H16yUcLd+d/zEpnL1YmWirIzje0zAB91ynHJ8gJJ5f142
	qM/Wy1Z3ZVq0IsqdoCb+lf9l/wcLVOJs1r6u7mRjvfil8qZNmmvYAJvVzCtNqAFP
	BoY1qk0D0bcf9S7QFKIMN6JV3G4vbtdrv4lJQ4pcnVJgg=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3NzWP+elqrXnHFA--.58335S2;
	Tue, 03 Nov 2026 23:11:12 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v14 0/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Tue, 03 Nov 2026 23:11:06 +0800
Message-Id: <20261103-quarkpi-ca2-v14-0-290990440b67@163.com>
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
X-B4-Tracking: v=1; b=H4sIAIr56WoC/33QzU7DMAwH8FeZcqbIdtJ8cOI9EIc4SVlArKPdK
 tDUdycZQmt7mJSLI//+tnwRYxpyGsXT7iKGNOUx94dSoHrYibD3h7fU5Fg+BAFpBFDN19kPH8f
 cBE8NYSTfutBCkKKI45C6/H2Ne3n9q8czv6dwqhG1Y5/HUz/8XOdNpvb9J5tV8mTqg8ZbFXRso
 06dfkYtH0P/KWr0ZO9gWyRbiY44RTC8lm4hCdfSVWlaAM1EHNq1RFhSuaYIxbrIDhQ6lUBuLN5
 swRuLxSYmpcFob6nbWLpnqdholIuOmbhzGyuXdruzrDeONkgIkbVJNzvP8y/s/mgDHgIAAA==
X-Change-ID: 20261004-quarkpi-ca2-21d2a59c50c3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD3NzWP+elqrXnHFA--.58335S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWkAF1kCryxZFy5Kw4kJFb_yoW7JFWfpF
	ZxuFs8GrsxtFyxuFn7uw1xuayS9ws7tr4FqF1rt345Za1Ygr1xAryftw1FvanxGrnYy3WU
	GF15W348GF9xZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiYFJUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+hG3JWrp+ZHq8gAA3K

This series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S based
single board computer. The binding patch documents the board, the DTS
patch describes the hardware.

The DTS was rebuilt from scratch against the vendor 5.10 BSP device tree
and then translated to current mainline bindings, so that every node and
property has a vendor-side or schematic origin instead of being carried
over from the earlier revisions.

Changes in v14:
- Drop the unused media/video-interfaces.h include.
- Write the ramoops zone sizes as powers of two.  ramoops_probe() rounds
  record_size and pmsg_size down, so 64 KiB and 128 KiB are the sizes the
  driver already used and the layout does not change.
- Keep combophy_avdd0v85 and combophy_avdd1v8 although nothing consumes
  them; they document the two PHY rails the board has, and the combphy
  driver has no supply property to attach them to.
- Keep both the direct and the amplified headphone routes: the vendor card
  routes LOUT1/ROUT1 and its "Headphone Power" widget into the same
  Headphone sink, and with only the amplifier path the jack is silent here.
- Link to v13: https://patch.msgid.link/20261103-quarkpi-ca2-v13-0-ad8c30cdb67e@163.com

Changes in v13:
- Add a link to the board schematics and the Reviewed-by tag from Shawn
  Lin, who reviewed the sdmmc, sdhci and PCIe parts.
- Move the pin configuration of the headphone amplifier's enable GPIO from
  the sound card node to the amplifier node itself, as suggested by the
  review of v12: pinctrl is applied per device, so the amplifier can probe
  before the sound card and request that GPIO while it is not yet
  configured.
- Keep the direct LOUT1 and ROUT1 routes to the headphone jack alongside
  the amplifier ones, contrary to the Sashiko bot's suggestion on v12:
  describing only the amplifier path leaves the jack silent on this board,
  while with both routes LOUT1 and ROUT1 each have two active consumers
  during playback.
- Drop the leftover Assisted-by tag from the bindings patch.
- Link to v12: https://patch.msgid.link/20261102-quarkpi-ca2-v12-0-d749d9bb2bf9@163.com

Changes in v12, addressing the Sashiko bot's suggestions on v11:
- Sort the PMIC regulator nodes in natural order, so that dcdc-reg1 comes
  before dcdc-reg10.
- Sort the phandle references in natural order, so that pwm7 comes before
  pwm14.
- Put simple-audio-card,codec before simple-audio-card,cpu.
- Add the blank lines between sibling nodes that were missing.
- Link to v11: https://patch.msgid.link/20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com

Changes in v11:
- Trim the commit message down to the board description and the list of
  supported peripherals.
- Drop the Assisted-by tag.
- Note on the Reviewed-by line which nodes were reviewed.
- Sort the properties in aliases alphabetically.
- Sort the nodes without unit addresses alphabetically, everywhere.
- Drop the deprecated regulator-suspend-microvolt properties.
- Sort the phandle references alphabetically.
- Keep a single root node and merge the extra root nodes and the &{/}
  block into it.
- Link to v10: https://patch.msgid.link/20261023-quarkpi-ca2-v10-0-9db904194e03@163.com

Changes in v10:
- Add the Acked-by tag from Conor Dooley, which I missed.
- Add the missing domain-supply for the GPU and NPU power domains.  Without
  it the power domain driver falls back to a dummy regulator for both.
- Enable the three NPU IOMMUs the enabled NPU cores reference.  Without them
  opening /dev/accel/accel0 fails with -ENODEV.
- Link to v9: https://patch.msgid.link/20261021-quarkpi-ca2-v9-0-b75006b22bc5@163.com

Testing: boots from microSD with this series on a v7.3 kernel, and the
on-board hardware (microSD, eMMC, HDMI, USB-C DP altmode, USB 3.0 and
USB 2.0, PCIe Wi-Fi, Bluetooth, GbE, ES8388 playback, PWM fan) works;
"make CHECK_DTBS=y" is clean.  The NPU works on this revision (all three
cores detected, IOMMUs attached, /dev/accel/accel0 opens, MNIST classifier
95.00% correct on 200 images), and so do the H.264, HEVC, VP8 and AV1
decode paths.

Note: there is no fiq_debugger node, so the debug console is ttyS2 and
console=ttyS2,1500000 has to be added to the bootargs manually.  Capture
from the headset microphone does not work with the in-tree es8328 driver;
that is fixed by a separate ASoC patch series (sound/soc/codecs/es8328.c)
and does not affect playback.

Please review.

---
Bob Hui (2):
      dt-bindings: arm: rockchip: Add ALIENTEK QuarkPi-CA2
      arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1210 ++++++++++++++++++++
 3 files changed, 1216 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261004-quarkpi-ca2-21d2a59c50c3

Best regards,
--  
Bob Hui <bg9oxa@163.com>

