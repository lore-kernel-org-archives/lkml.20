Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382305;
	b=LUFrkuAJEVQfIEDhUI4miMY4WKWZ3vnG+1UpYxlqb/ASlmoaNaCAE22iXmLN9E05ctUB
	 J51e/WbRPs3osAGgtmBJiDsPd0SHjJmxk3VxUNf5I3+mNMDY/RKm7pE5hCcYX4dJXFDFr
	 uJTPx+QO66JfswURbADsEg+Y/sSXIvCRn+zI07HAxG4MrE5vLT7eqg4QDg0oqvnrhS66g
	 tqERlXXTv/fx7j8tMDJLRSptKFsYa6s7GsapgLHDlLZ3K1FSHJMwO5qUBtl5wKMFqK4ie
	 SHkOxDG4lMd6SfiGfPuMDtSFK6tYfGjM5FvUzUIEG8ym8g5VazN52PjtNbZycUEs+ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8NGJF2GluLUXT5n0TBAtOAqoo1zFr6A4uWG8k4Arcrg=;
	b=hzWawp1vLNotcpNhZ5WPY6yZETkX+yNnCp2bD6sOFvCZC/ZRVPzq7xIXUDfJENSzArnG
	 MBEy1tWsQ3U6WgVNZCcXTEWSL8vUeuqXLTH8T8Otk/ynm3Boj1aEruoL1CW7hZFvjkHqs
	 X6SpQs+pgkAjJaQ4/ch4q/ht1cQ7zbdiiL6EpUiMsmlY+DXkKfO1HgkL26ySAhsPw8f3P
	 tQv+lGYAyte9zsWuUtsycr4TF8eNpwNfL6EIU3CHxoCX4LTBwTR4VhHK9OCqR8hixK5CV
	 nNFQCLstfP023ShdvQjPIGSTzZ+MALr+k7uxcOQwGxu2FJr/TvwO0IinC6rTZiPTgoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POBHpjgW;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE86606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POBHpjgW
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3704d30b84fso3684385eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382304; x=1794987104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NGJF2GluLUXT5n0TBAtOAqoo1zFr6A4uWG8k4Arcrg=;
        b=POBHpjgWKutWrj0vlhgfSILkVOELfl8bF815uz1giarrjJe2IJjQrnYXSNHzlrCRhp
         23KvuDunKN3OHSJPvl3IBkvKRHpnfQUAnOlbYTo78spWsndzQW26MjmiVDTMPo6itnxj
         6kAcOfZDJqH/mZhdZj4ceAWvs7nQW+Tthc95Z4s8IZpKyFyNWRGzpiAQREjv/00cVqfK
         6rLIQchypvAKppsNraKUfzE5gsraXCW7UF9IuoTc1eizzc0STkupEtRi2NncNkh5PeZF
         qbZHFf9ZZGSq+YVYAr0mnWZs6DFErVBIW8HeIcQxR5KdRqoog1cf2EkMMLwNjUnnzFR+
         jDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382304; x=1794987104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NGJF2GluLUXT5n0TBAtOAqoo1zFr6A4uWG8k4Arcrg=;
        b=YxHRkTwJ2hV+azs7xl8t5nuavX0QpwYLy0xBZzhssvSFX/ONP+u0eGP3vn/g9vUxKX
         m8ldjuGbdNOyKvd28sQ7OZLiSdAU60L8UWQURWSgFlyyHNr3HOgU287gkxAeqOUfKDov
         dwiXrOlEHK7pGWpQbAcshKjM5T3SyFZGzGNOd/SWZXSgsJbqM6GrGVUbnIHmJESscdy9
         OW34u4lNOdZomoYiXIvOeVccClfwTF65/gq713ae0ZwqiRExi5Z/1SY5YuOyZzF2ki4O
         oIqYs4OZ4iCuZADe4Ji/E9dSFNAAMsfwZmASLnAr2RrtZmhW9ozPrXhwWDBCYN2NJx30
         7Qvg==
X-Forwarded-Encrypted: i=1; AL+hErGlf5xzekUXHcK7gey41xyT5TwnWiut2a+imxMTdsNfhnrYwhxbs9zjnq+O9U4vAtCNDdfV3OTc26DWPuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z980/EXZdaW9RhOD3WOpBptEKBsS7cXW/KDSQ9FrKzpG4BIXnuN
	zNbv7OhWVYLuG0GHlYTb2EEE/zzohI7LHtQmX+KidaLzFafpx3QeUEJs
X-Gm-Gg: AYBFou1cFA5C3rHtK1kzPDIjk1P5rT3kzWRLIZMwSoEwt2rfuFTKLHelD1rF4+5qqe0
	Mvz/UO/KviNlRhfM3cyZJaAhtl4Ln1Tm9ZxJLjCiuEy7yeE+lLW310dLsoevi13z1P1sBkYV5eC
	TpFAwfDoNdhmf5UEG3Tqw4LevnRNnraimzknkSV9m7vncCosYw9ncCScssx+OWGX1COQGSownAg
	qSZ0sJjlvPNgh5KHaj7pV8rHflG7BWZQMEmCFFnycMkZfTNlTwJ+UaOxs7T/R3j3qOQXoBHJwtb
	1/mFNCWdtHOv1DLM1sKbaVj2gzJ/ndj33BLYYNqDcsonAsjzcPK9WfIdybJTpJPQe9BUELDssea
	UVJEeJwDAeu+PNbjyFvg/JHq4Yn/0Py/iv4iyhqzEp8Itl8APKh6/5t39zIorz2hRKDr2X0SF9g
	bP+M/8zhpxRHl06bo0XH/FPr6ZT9D1fGrHBoXr3N7MLHoiDPn59JIEZG6kha1igbcUgYS4CwJ0I
	PfwH1MM2wQtpW4prd47wJT2whzLS5nEK0/4G/gdgyw2dY1N0PbJGIsSaPpk0LspKOws4Ouf3S5m
	lZIyzgRdRH4jVU+l+u/h9hqT5T8FYuiu6j6VxgtlsD6dTb+jvFjUJrkO5HF8pEb17GGPSTEo22z
	2E6gNf0mTLNzEgVuH5Q==
X-Received: by 2002:a05:693c:42d3:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3768694ff22mr1816814eec.32.1794382303560;
        Tue, 10 Nov 2026 23:31:43 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:42 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v9 0/4] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Wed, 11 Nov 2026 15:31:33 +0800
Message-ID: <20261111073137.381966-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v8:

  - dts: set the DWC2 (USB0) register window to 0x40000
    (0x4020_0000-0x4024_0000, per the MA35D1 spec) instead of 0x1000, so
    that it covers the per-endpoint FIFO region at 0x1000 + n * 0x1000.
    The EHCI/OHCI windows were checked against the spec and are
    unchanged.

  - phy: select MFD_SYSCON in PHY_MA35_USB, as the driver depends on
    syscon_regmap_lookup_by_phandle().

  - Patches 1 and 3 are unchanged.

Changes since v7:

  - phy: add "depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH" to
    PHY_MA35_USB, so a built-in PHY driver cannot be combined with a
    modular role switch core (link failure on usb_role_switch_register()).

  - phy: restore the PHY reset fallback.  If the PHY is already in
    operation mode but its clocks do not become stable, reset it and poll
    again instead of failing immediately.  The reset is still skipped when
    the already-running PHY reports stable clocks.

  - phy: gate the HUSBH0_GATE clock dynamically again.  The clock is no
    longer enabled for the whole lifetime of the driver (devm_clk_get()
    instead of devm_clk_get_enabled()); .power_on/.power_off enable and
    disable it, and .init enables it around its register accesses.  The
    gate can therefore close when neither port is powered.

  - phy: nuvoton,oc-active-high: keep writing the polarity bit
    unconditionally, so that an absent property means active-low as
    documented in the binding, regardless of what the bootloader left in
    MISCFCR0.  The bit only affects the EHCI/OHCI host ports' VBUS
    switch and is irrelevant to the gadget use of PHY0.  This is a new
    property in this series, and no mainline DT depends on a
    bootloader-programmed polarity.

  - Patches 1-3 are unchanged.

Changes since v6:

  - phy: update the copyright notice in the rewritten driver header to
    "2024-2026" instead of "2026", preserving the original 2024 date
    rather than dropping it.

  - phy: split the unused linux/io.h removal out of patch 4 into its
    own patch (3/4), since it's unrelated cleanup that predates this
    series (the driver has never done direct MMIO access; all register
    access goes through regmap via syscon_regmap_lookup_by_phandle()).
    Placed immediately before patch 4 since that is the first patch in
    the series to touch this file.


Joey Lu (4):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 ++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/Kconfig                   |   2 +
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 313 +++++++++++++-----
 6 files changed, 420 insertions(+), 76 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

