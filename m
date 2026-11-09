Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207377;
	b=yM9g99y1CQRMsH2lbtJzoUmDBMjwjo76FtOXHtkDeGs9nHskwPD1RwHzmTuiikCaMx29
	 QB9LuawPBeawFKFUhsqQzNwmY3I5eAf3tYvLekDu5h9UzWJBeUTqh5WPVVOEwocPpK5O0
	 dAu12pAo5z5wq0iQRsQnqr03DkN2xYlZYLNiX7pcoU0lvJ68ebZ4wqu4dx+ujf71yQYLo
	 etV+/CvrIR+kTO+xZS0rBy+1K73YLJjhANq6l969hJs8J41WPDLL0FWays86xIBVKgwHW
	 R/MammcEkBYKe9bz3WcKxfxEqKIcGqPg2u3TCJloTYjEZipVi1j9HbI2VXYeXXCUm/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7XAv450XHDg88lcGf64auwSEy37dySq1HHP//7UhmG0=;
	b=MdXXiXG0tH9hxAW7TREFnEpBVxYbpvC/PF04XJx7EFmuIb/6qh+7iEK84x1lqNkDqiWE
	 CxWKy6jGt4kb4PNqwKG/oCtqMdjg5eRmeNKpodDYZ95Ckr8c9GOfXZtWubx0XUKb/KvIx
	 uqXpGv/rlDPyS6ixG2ey+9J4Z+iAo43BzS+Gv2yukLwu73ZjAfQ8owPuzb5o7Vqj0dg1C
	 3B1nL7kK9Epa680LNOIyrTAikk3A/iQBZV7ZaVqbKcw7Op5xx6IdJhYuMAUgUGrLCVYbW
	 hGkpM/3dD61iErUTRfmOp3yzVdeVnFb+VAnD2IZR8N/5mXzMT8I0y3myOTwwCg2ycyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsTi0Y+M;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB9606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DCB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsTi0Y+M
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1962474eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207376; x=1794812176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XAv450XHDg88lcGf64auwSEy37dySq1HHP//7UhmG0=;
        b=HsTi0Y+Mk3gTT3l/UetGneg/ZNX/YaWXQbrask6/6VAmO9ouZaMEfxqAtwfCQwGWSA
         EewCP0hULzrxoRtOVWPKDj+Ck/Y70s+dUEAOMuX3QEQFbyCVD1jUMnCbbckqxd+jbGrt
         gZDCKKMYUv3Ic4zP04Pnoc8cc/tfc6LhryTyoZn+nmhh0kokEkp8TSOohr8QOEQgMKb4
         cojnzzT4DyI6t25cQqWYE/KwRjpEUIGw8vkXj0udWuIat/yj7CoZFKtCqcgFT8JE7xhS
         /B+AnqxWqKngqnuSsoLrX1ohinOPGwMBuUoWmy9q3xLqXdtIFQ6WpZK267MqlRX5dsRd
         71nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207376; x=1794812176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XAv450XHDg88lcGf64auwSEy37dySq1HHP//7UhmG0=;
        b=0U/491vHLFBQWpDkrk41jBon3qcm5PUm5yTi1xxhCKgdkyGKUjym64PPE1/ze7Q6SL
         sctyL6kzrLIWbvisaEjiJsayzcZpTn1OJ88jht4r2dX17fbItB4WFw00AsGse/iHaPBW
         kaySnJSZ+WpJQhKdXXj/CVevJuRrJHEEE39yc4+9f54Op/9wAVH9ZGvuU6bPUjc558rd
         hL6mrHKJQ4ZpIIsuhgq+SJo23KBSzyr5rPAs1JhCjytZfUAgBYiE6ys+DWCcGo6apf0J
         BZBWGeaFDY4bHkHefjfeM+B10DH8un3YESfQ7lLNnXLnW5Q9jKEvmBYZeAVszt7ZsHWe
         dHrA==
X-Forwarded-Encrypted: i=1; AL+hErF/rMvJNdp98ve/TWA6mudwQXfBDrr0YquANek48wc8BlTXJABQC8YBFe9//JG2+F7I3PQgqXPg5VWsjHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3dHR7ybPPSVl2HBMA2ff+9nJx8hRybM65pow+sgEeC86fIJXR
	ELkxIvAdREUPQyc39CQVE/cTUplkaVMkzZXdhJJMiXmiwawmbWHSxya4
X-Gm-Gg: AYBFou3EJbbudh2KQUkkehilI2tZYWTRi3Nau1boEEp2CQu1CuabJKzrf0igODMWe3F
	TDli33/Mme3CVXZaMKNZgEelhHWPoVEi5CbBc0OfB1/RHw9utSEtnXERI765ev7NmUIdSNr8ulO
	J2J1T7PtfXoNvz6hAG0hgvzg075dHB+xi9HaatjVJaJqKCfvaHM7/EOKO+ya6UKQUC5rfF5v+3P
	tqVAsxtS+2qEXW6cw/Rs9cmYAdidTfMk95JshL4Z/B++BC2l0YD9lbkV6/L7yN/tFo6zyx3h5w9
	h8RxU5TyN+KdayxXo95VfmZcCnAPdhKI7rHBp+b8HtEOFcU9iUKQF2F9O2ppWTIgySsbpWL1RS9
	MD4Wo4cbr325PnE1XZapI5OhpG4Fl+zIeqiCPnKQNRiaNES15m4bbKq5Fsu4Rpyiu+uERFiIFl7
	da0DPbKEXxPAhuUOL7lEhpGayoZmIsywIPyn6O5KjfUc8z3fy7kEjhqZphZkTn3fEn0Orel2x/u
	k8fvsa0zdH38L+5Jk1WauvZamZFYRdef29tRnqRJdEMwY77ONEvozYO1C1DbUFSEFE6xrCTuqC4
	zNf0MqKi0xzm6krLEbS3LyE90GBHV7cEjINuS1JHZvBlOY9F9x7GMKJBoVAtJoYEzQDjHJ+Ykk8
	HsWR2aP5nEKAf4e4FyISw0Qk2Vmn/Q4Ba+pKxaJw=
X-Received: by 2002:a05:7022:2641:b0:14d:cb67:afc4 with SMTP id a92af1059eb24-1b39ff1d210mr4646567c88.41.1794207376356;
        Sun, 08 Nov 2026 22:56:16 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:15 -0800 (PST)
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
Subject: [PATCH v8 0/4] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Mon,  9 Nov 2026 14:56:02 +0800
Message-ID: <20261109065606.62641-1-a0987203069@gmail.com>
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
 drivers/phy/nuvoton/Kconfig                   |   1 +
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 313 +++++++++++++-----
 6 files changed, 419 insertions(+), 76 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

