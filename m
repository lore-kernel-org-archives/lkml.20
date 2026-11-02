Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634076;
	b=DpmAqBquJTwbGSrtSIluZNJq4z6+bmGhbq9dfpGpgRBbIaIMUYRAeone1BawbkCxkKKK
	 DLo5JDTCSg9+oxuix6B6vjFQkmQ2cPWn4wdjdfsJtphPlvv6Qf3gpci84W7Nwkv61o6EY
	 fD8cSJR/3MusinahT6eLRkL7JKOv5v9HQhJL+JLNpNskZQC/vMc8CkmIndUT4yX7gCrNr
	 YHh6CbU4iPw3ro6/98trYx22dk2hgSKBQEaTkTGBJlT1A0d+pC6QWrFH3Qm/LNwgiDLlJ
	 nnVSlD53hNf4WOkX+qdGMIGrfDAezH3agGCXFhm8G/vZ35saKcNXPND+LIgyCqDaazg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634076;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9HNEAr4lT8p39eVaiLtUhAY8ZzSREjueyplNX7G/Cwc=;
	b=xbSW4DovpLbtJRrv9S/3HvyikYSF2datheEzpismngdrrPl3S31XxkGmlibBNoehrp25
	 XhP9C7F93cqbHQF2BIwbBHcaKcbh1a3pUNr2jAevMqfEvTS7Xwusa5jHZvscxiRYAxw0O
	 luX9M2nY11ThL4Fszibp1AMs0npS/MogPvVIYQztue4am9PY1zzzsE/GIzh2vppE4eUzY
	 TmLwhWyW3xS19DYprVGW7wuePjwgw1BdGjyz4S38mQpEEMA2Yxr8hTIzV/njLCDEX9lD8
	 Z7fu0hQ3Ro7wpZYWe0M1kqN7yXXzx8sMkwsR8BZAycRHphnaBM1plXdFmn5nTkYeomg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m2pKbDXg;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06550607365B;
	Mon,  2 Nov 2026 15:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06550607365B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m2pKbDXg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=9HNEAr4lT8p39eVaiLtUhAY8ZzSREjueyplNX7G/Cwc=;
	b=m2pKbDXgx9CFzvhcTiLxFuIi8TnE/+xm9S7JmVZUh5LrjU88bFuifpTMQVX229
	0xKLx4m/5VTTy4jBig51luVhQHgxYfUWRwxGlcOjLMKtTyt7ttLi7hMeJqOoz6Rx
	/Y/Cm6eRqJSKD+hAUdgW1Sq9/9+Cn3g9X0aKf9LPhFhYs=
Received: from 4F-GAME.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCn74XvruhqEea+DA--.56588S2;
	Mon, 02 Nov 2026 23:40:32 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v12 0/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Mon, 02 Nov 2026 23:40:12 +0800
Message-Id: <20261102-quarkpi-ca2-v12-0-d749d9bb2bf9@163.com>
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
X-B4-Tracking: v=1; b=H4sIANyu6GoC/33NS04DMQyA4atUWRNkO69JV9wDschraEB0yqQdg
 aq5O0kRatMFUja2/P05s5LmnArbbs5sTksuedrXAelhw8LO7V8Tz7EuGAFpBJD88+Tm90PmwRE
 njOSUDQqCYFUc5jTmr0vu+eV3Lif/lsKxJdrFLpfjNH9f/ltMu/srm668mPaAu0EGHVXUadRPq
 MVjmD5YSy/DP3io0g8CLfkUwfhe2htJ2EvbpFEA2hP5oHqJcEtFTxGqtdFbkGhlAnFn8WorvrN
 YbfIkNRjtBhqvdl3XH+nQPhCmAQAA
X-Change-ID: 20261004-quarkpi-ca2-21d2a59c50c3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:PCgvCgCn74XvruhqEea+DA--.56588S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWkAFW3uF1UZFW3CF48Zwb_yoWruFWfpF
	ZxuFs8Grs7tryI9Fs2gw1xuFySvw4ktFWSqFn5J345Za1YvF18Zr1Syw4FvF98CrZYya4U
	Cr15WFy8GF9rZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiYFJUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3hG8KmrorvH9pQAA3c

This series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S based
single board computer. The binding patch documents the board, the DTS
patch describes the hardware.

The DTS was rebuilt from scratch against the vendor 5.10 BSP device tree
and then translated to current mainline bindings, so that every node and
property has a vendor-side or schematic origin instead of being carried
over from the earlier revisions.

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

Changes in v9:
- SD card: drop enable-active-high again, the power switch of the card
  slot (vcc_3v3_sd_s0) is active low.  The v8 conclusion that it was missing
  came from a test run with the wrong DTB loaded; with the property present the
  regulator core drives the enable pin high and the card's rail stays off.
- Audio: the I2S0 MCLK pinmux moved from the I2S controller node to the codec node.
Link to v8: https://lore.kernel.org/all/20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com/

Changes in v8:
- SD card: add the missing enable-active-high to the SD card power switch
  (vcc_3v3_sd_s0).  Without it of_gpio_quirk_polarity() forces
  OF_GPIO_ACTIVE_LOW onto the GPIO descriptor, so enabling the regulator
  switched the rail off instead of on and the card lost its power.
  Reported by the sashiko review; verified on hardware, the board now
  boots from an SD card:
  https://lore.kernel.org/all/sashiko-outbox-162297@kernel.org/
- SPI0: describe the two chip selects as GPIOs (cs-gpios) instead of
  muxing the dedicated SPI0_CS0_M3 / SPI0_CS1_M3 pins, so that both chip
  select lines stay usable from the 40-pin header.  Verified on hardware:
  both lines are claimed by the SPI core.
- Link to v7:
  https://lore.kernel.org/all/20261007-quarkpi-ca2-v7-v7-0-a84c6d5d6ef6@163.com/

Please review.

---
Bob Hui (2):
      dt-bindings: arm: rockchip: Add ALIENTEK QuarkPi-CA2
      arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1209 ++++++++++++++++++++
 3 files changed, 1215 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261004-quarkpi-ca2-21d2a59c50c3

Best regards,
--  
Bob Hui <bg9oxa@163.com>

