Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605952;
	b=H48AE1ZmahvpY29t4MjtZfagDBI4ctsWlbiA74466ruvvQsw/ZNRt7jF2uFlaxGr1C/O
	 4aQMerdNC/wHw6EnYKwk+NQD7ezJRxDWwnZQssbLTvPlb8OxWcYDiz+B97Euv2QC8dTck
	 KOoOxTe2QfZHoamZNafStKuyBhC2rrRmPKegYh/TLQTp+Zfo0TNgFR0wTyUFLt1FsH+lD
	 PyvgnBa7jtmKlv5iBYW66dS/2ff+9dXgI45Ey+6krqkF3IO/E9WsuI2jFRm/sT7rEqQbs
	 tEkqMEdbAa4zISJiE4QJt1qNzI1RN28zaYZzrCt43G8RI/eabyjWBDTwZywFd8NbzaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605952;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=hOD5mLcBK7GdDzc+hP/nBfTeNhiJpFKyDAI5dsuQmz0=;
	b=5fb9C8Q233/uyzZaZyay3Vs9onftgR3X2V8GBx4m74wQ7QRVTqdzkN8QMLZrqlrAH2tk
	 XobwrWMzP+f87H+iiF03O8KfTByEYFW1bcxqRQfZ4jep99IlKI07JLE68tAlxl5L3RssU
	 GQNuG0Elqtn639MKuYs7wmEq58IyilWoGebIQL5sqmFJGIKLnH0IKW9uRso9Ay9iuYFVw
	 O4oTmHFD+oI/AF1u3aN6ms0BkGwMGZ21IAd34sAusLETJR7CTjeWisykGjUUl9mDerC8b
	 uYazXJiFVm9+MjtmEl2j4vgidZlBvycxqfcUW+ePiE5FnMv9+Yga11n64dUU76fN/4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kUmatMKE;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7647E606A324;
	Wed, 21 Oct 2026 18:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7647E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kUmatMKE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605943;
	bh=GBz8KxB0mYTo8vmR2wcwHafVwvgU21md1OrcI7l2HBc=;
	h=From:Subject:Date:To:Cc:From;
	b=kUmatMKErNeM9ljzSWIMX+UQfYouqzl3ucc7gFAwICBSvYokGLFupD/ydnSGdfnhF
	 lAa+5EeOTkuACfy0hVyAbMqPFyEtqTa9iIjPfnXKqBo9NW02XW3LHuyRPUNo6Dalye
	 PqIMadd48zR/igZuF4++hx+9Ai8FGce2XyjuRYTyeYS61T7Xg7k2dwxkJzuLO/xQ2f
	 iLklXjn3QYVvoIJb2tBT4NCOGiKYgER0ue3DGDX3rVSezsdM4UcyrrasbRACIdp0Gp
	 6T0VUgEZUe5s0DqASTHGXt+NfsdEDZP3ORtMu+IRAjmxoQvKe+xEeqsPYt7/5GECFT
	 ABOuFIaTyHi0A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9ECB017E07EC;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 60A3D48002B; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
Date: Wed, 21 Oct 2026 20:05:25 +0200
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOy07DMBAF0F+JvMYofsSPrvofiIUf48aQ1sVOA
 qjKv+OmFSCElOUdzZy5F1QgRyho11xQhjmWmE41EPXQINeb0wFw9HWAaEtFqwnHluOc3Kvr4xn
 7d8d+0mGYAGupwTDJOs8Zqsg5Q4gf64en51suk30BN17V+0aGt6m+Hm9ryJoC2KXjMY67RoVOB
 B+YV86iq9DHMqb8uVaeyXpwL9dtlZsJbrEUzNqOC0U57F0aBmNTNo/138rPRPwyKd82RUUJFYa
 CJow59i8qv1HS1otNVFZUSRG0UJoBDX/RZVm+AGE++sC9AQAA
X-Change-ID: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5152;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GBz8KxB0mYTo8vmR2wcwHafVwvgU21md1OrcI7l2HBc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vfbPeL02jCoNIekbPtoQlNPY+XtBmtvX
 cWUYUEIHQl93okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qa8b4P+wYNFLYmfkpGcFycLnG2Zl0B1mN+MmmzH3Y5PVp9rjv7vePW9Ie0U5yb3GUtbB3Cq/o
 nfNuINH27ifU6aPxRVG45ylk0SPJM08wzwoY3gBPKo9tbgZlcxODxrzFggr5tqKjlccqzXb83Aw
 IyaC/JQS0XcNRt6DxK22rCxYLyLKu+O2ueEVX4CDhER8AHCzgtsv9Nt3ORxhztldk0IxfIo6Xl7
 kHGaIw6olCK3Q2W1Auahkc832leCOlqRde2p8DQd3GcDLz/amq7+8yRvZ4px1+0it/2b8kOmM7a
 QGW+QQj2RN9avpWfZ2KbJGYtUm7aS8PnbAFmnlsNZuEAsuc8hNscZlKFIcaSH/qm3rIJxihfpM/
 9wV71i21sj5BMubWZrQU/AuoPEm8sp69RLnG5gp9ofRhh6O7hVMq9P+wZAnsaatTFw6id96/ddE
 rksO6eOFzTPvRdiqH7Zkx7kAmFcYQq4jJQ0UBLxZbo3A/YlgcPWM+j9duFR7CSAWByFgITLo9Ys
 MgjRz9JetqE1L5S19rLtJtc+wYFqHxF05x6UB49fJXw6n5oYOL+A9Xy8l6+4DeRqLEFiWgxsxlI
 Z2Psj+1qW5cUu6c7tPYPEw3iYVZD9u05mB2vU6+QUlImDqBHW+2Ko666m7L6RGC3DKUgACf7foZ
 fbGs+L7TCFIPO1NUX6Kg1Cw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The recent Rockchip platform have a combined PHY, which does USB3 and
DisplayPort as well as muxing the lines in arbitrary order. Changing its
enabled functionality requires a PHY reset and as the PHY provides a
clock to the DWC3 controller, this can result in an SError. Apart from
that the PHY might not start up correctly when the DWC3 PIPE interface
is running. This series prepares a Rockchip specific DWC3 glue driver to
help out with these problems. To become useful more patches are needed
on the Rockchip USBDP PHY side, which are send separately.

This was split from the USBDP cleanup series. v17 has a dependency on
the patches that have been merged to phy's for-next branch. There are
some additional Rockchip USBDP phy fixes, which depend on this series
(which is effectively also a fix).

Changes in v18:
- Link to v17: https://patch.msgid.link/20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com
- Always clear UDPHY_MODE_USB in rk_udphy_usb3_phy_exit (Sashiko)
- Add reset quirk stub functions for CONFIG_PHY_ROCKCHIP_USBDP=n (Sashiko)
- Add NULL check in phy for loop, possibly needed on older Rockchip platforms (Sashiko)
- Hold DWC3 lock in dwc3_rockchip_vbus_handler (Sashiko)
- Drop 'struct dwc3_rk_phy_nb' left over from prev. versions (Sashiko)
- Rework the runtime PM code to rely on PHY side serializing it for us,
  which simplifies things (Sashiko, myself)
- Skip reset in high-speed only mode, as the USB3 PHY is unused and
  it does not matter that it wouldn't work. (myself)
- Due to the rework, make the reset callback return void (myself)
- Replace useless cleanup from unregister function with WARN_ON; unregister is
  only called after phy_exit and afterwards reset function can no longer
  be called (myself)
- Use modern guard helpers for the spin locks (myself)

Changes in v17:
- Link to v16: https://patch.msgid.link/20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com
- Add new patch adding just sw_mode, which was part of the "phy:
  rockchip: usbdp: Fix power state handling" patch in USBDP cleanup
  part 3 series; sw_mode will be used by the dwc3/usbdp reset quirk now
- drop generic PHY reset notifier API; I discussed this series at Linux
  Plumbers Conference with Vinod Koul and he prefers a local driver
  hack/quirk instead
- rework USBDP and DWC3 rockchip glue for the local driver quirk
  using direct function calls
- Ensure that the reset handler in DWC3 is only called when the PHY is
  initialized (and thus DWC3 is running)
- Also set vbus in the last patch when dwc3 is configured to device only
  mode (in contrast to dual-role mode being in device mode).

Changes in v16:
- Link to v15 (sorry, I missed force setting the revision for this
  part in the series split, so the series says v1 in the patch subject):
  https://patch.msgid.link/20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com
- Update first patch to also build the PM functions even when
  PM is disabled
- Add new patch for defining an empty usb_udc_vbus_handler stub
  when USB_GADGET is disabled
- Add dependency to Rockchip DWC3 glue, which disallows the
  configuration with USB_DWC3_ROCKCHIP=y and USB_GADGET=m
- Collect tags

Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - Avoid #ifdef for CONFIG_PM in the new glue driver (Thinh Nguyen)
 - Do not add #if IS_ENABLED around the DT compatible blacklist in the
   generic driver, using the glue driver should be mandatory as the
   generic driver results in arbitrary system hangs. Thinh Nguyen suggested
   updating Kconfig for this, but did not clarify what that means.
   Current Kconfig works the same way as the other mandatory glue
   drivers.
 - Split series to simplify review

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (7):
      phy: rockchip: usbdp: Track PHY power state
      phy: rockchip: usbdp: Add reset hook support for dwc3
      usb: dwc3: rockchip: introduce glue driver
      usb: dwc3: core: add post PHY registration hook for platform glue
      usb: dwc3: rockchip: add USBDP PHY reset quirk
      usb: gadget: define stub for usb_udc_vbus_handler
      usb: dwc3: rockchip: fix USB-C reconnect in gadget mode

 drivers/phy/rockchip/phy-rockchip-usbdp.c |  82 ++++++++++-
 drivers/usb/dwc3/Kconfig                  |  13 ++
 drivers/usb/dwc3/Makefile                 |   1 +
 drivers/usb/dwc3/core.c                   |  17 ++-
 drivers/usb/dwc3/core.h                   |   9 ++
 drivers/usb/dwc3/dwc3-rockchip.c          | 227 ++++++++++++++++++++++++++++++
 drivers/usb/dwc3/trace.c                  |   3 +
 include/linux/phy/rockchip-usbdp.h        |  31 ++++
 include/linux/usb/gadget.h                |   5 +
 9 files changed, 383 insertions(+), 5 deletions(-)
---
base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

