Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618169;
	b=SxoK78XWW2RW24c5mOEQsCg6luP9vl237sGeYiOg2iwJlJtq/PIz2cEMGs8xmAJWJlzl
	 or6tLslchfx+wYUF0vzRYTOlob+oOyhS8/mAyE5VknMBSZKS/xHJXOpzL+j+oplod2mh+
	 X+ZZqtwQ3afkClbHqsGRJ/zK2EHivilVEjODmg2gs34s7knNT47m+B3qAE3sVCremC+sK
	 MXXujypViNB8B5/Kq+d08EbXp6kTXmjDcz8WqYMk6I6Adp/Fn2lUCbIHa5HwQ5z96I+xs
	 oGBGo2ubsGlDlu9c/g2m/tUaI7VjV/FqjHMcKQBLE5MNfA+GtCwqKdUz+6Cm/lvPMyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618169;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ulLvjB2y9T1z4HMnQGgYSXrRVyw3ZXpu9ePm+K5Lxeg=;
	b=yOfeENIUQFxDQaeQmWAnBG3mmOwa/vBZgsOBYKxeNu6WllTXjW8u4G/pTmJyp/6IO7bP
	 3sgnByUZUU+o7zQskGS4q4SPdSrVaZyIY9qEHk5zzWs6TU9Env00TiLgBGMJRTEwJ0e8D
	 L1k2wx2TNAtiIQ24IXyiJfQb8Kppyhyp9s9QuROZT5RvTLSZNIgDP+SVqFbtEYoXpZvV5
	 ASGwoNjsUC42OWcUMhMzlTxpzetNN40Szypfcu4QaDdn2z8pEyw4igr1JM1AYWWAUiCz/
	 RGHL2mgVQpJIoicLBvUbNvu9hPai3SnHCc//ImPUw+fgeot8C2kdOjY+XcIeTGmoHHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jBThxsgO;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB4C606A33D;
	Sat, 14 Nov 2026 01:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB4C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jBThxsgO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=SRmNH/H+Fk/ZSuR8eQSd2ZZ+GN9wcBRKt9HJ/EgoEgg=;
	h=From:Subject:Date:To:Cc:From;
	b=jBThxsgOrhy6IGLdVdNY5cdReZYHBLhCK9lB1LGJUAeFYIStWusGkj1GweLQjXNgS
	 8pvs+1aUzR4P53/kWYrEUJRNDLhQ9kONJ+oZWAH71fkoGJKnVaSdr6Zkak74+pvrzV
	 YkISmVX2+5C159OMEmHbsWmzdCD6CgEmmerXecB0w1ECmzDgDikQu0e97KdOAM2y80
	 pa0KGg9ysElYuAPBJ/gwo4uuEcK5iCXTJlbVUUjksQW39zuRrYCLPX/FJMhUP6tn5f
	 xgx5yO3398V668mpu+Y0Wre3KgYS1pGjL9FdIA+hAxzwtNjgB0LgoNJnnz2lLeAFXW
	 yl8xDFJ6T3Rkw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A5D517E0A27;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C02BA48002C; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v19 0/6] usb: dwc3: introduce Rockchip glue driver
Date: Sat, 14 Nov 2026 02:01:59 +0100
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTW7DIBAF4KtYrEvEn8Fk1XtUXQAex7RJSMF2W
 0W+eydO1EZVJLMb9OZ7cyYFcoRCttWZZJhiiemIA7dPFQm9O+6AxhY/iGBCM8sV9YrmFN5DH0+
 0/Qzyb9rtR6DWWHDSyLpVkiByytDFr6Xh5fU6l9G/QRgu6i2R4WPE6uEaI94VoCEdDnHYVpPZY
 GPg5LLdxzKk/L2cO/ElfDusXjts4pRRo6X3tdKNUPAc0n7vfMpug10LP3F9Zwq1bmpEudBOgOV
 SBvkQNb8oZ7ixihpEG6M7qxsrQXQP0eYOFXwdbRDVDF/LZBec+I/O8/wDOsg0TQ4CAAA=
X-Change-ID: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6809;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=SRmNH/H+Fk/ZSuR8eQSd2ZZ+GN9wcBRKt9HJ/EgoEgg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szW+W3M2xcPaPnPMkrHIYO/IdA02fdG05
 ZcGgmsQGNc4PYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qam10P/RpkpHIUKHeWI+SXrSwGv7tPRtCeGSnBlMgsCnFMk+pKDbLp84IpbntWLcSrb0FmOlt
 KkFpczMuJmg7xpl0g1cmEpyJDQEP6C9/fOLKLu31PZrdsRkAt1XCONEdC2kJ54m9bTkUj9lz3EP
 PmPc697qAld5zf4y57aMKj1WiYPYMuU6oW/rDRglukj2CXS8Ql/f5oNiLX/hZXkYCb85/5gDaTL
 M2ZSzVDSjqzBWWX5thza09MLEkTcT+ZzfIGBx93yWKxPos0HLK4fLhl+igO+B4OanrT0VbDXsfy
 43XretOo2na2tu4R23R49e0w9AODI3vv6rf3qveUmXsx8o3xtpJrBd+HRNad02LpiM3S2QyirFE
 FVWW4frc2CXsmR/AYf0GqW2HCkOopJrHZ9WpjiVZfZattFOHlau7/D1Hu5AQfKF77GLxdA+b6v4
 EBgm1AzsOdp7SGKiqTW14so3H0NUhddRN44/bvFMeT3PIhAVFousLPuToRQf486h2n6JSSto+Tr
 SdtZZo3H+uUz/fK2SkzGz/MpuEEtXZTdSlnCijSA0XPkdPsFdrA+Z8HeZBkk53vhLP1YSQymGVX
 2vl3YpmT/MkwCHSf/9ULHV+V6jYSznoeQscaIhAYkz6/BtbvuK6gTBFWF9r/QjwK9iWQmvGcsgS
 Ta7EmswpvMTCq4Qvv2FEzxQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The recent Rockchip platforms have a combined PHY, which does USB3 and
DisplayPort as well as muxing the lines in arbitrary order. Changing its
enabled functionality requires a PHY reset and as the PHY provides a
clock to the DWC3 controller, this can result in an SError. Apart from
that the PHY might not start up correctly when the DWC3 PIPE interface
is running. This series prepares a Rockchip specific DWC3 glue driver to
help out with these problems. To become useful more patches are needed
on the Rockchip USBDP PHY side, which are sent separately.

This was split from the USBDP cleanup series. There are some additional
Rockchip USBDP phy fixes, which depend on this series (which is also a
fix itself).

Possible merge strategies:
1: Vinod merges everything; the USB side is mostly a new driver
   and thus there is not much conflict potential
   => acceptable for Vinod, needs Ack from Greg [0]

2: Vinod provides an immutable branch with the first two patches,
   USB tree merges the immutable branch and the remaining series.
   => acceptable for Vinod [0]

3: Everything is merged through USB; this would block the final
   cleanup for USBDP from being applied for yet another cycle.

4: Vinod merges patches 1+2, USB patches are merged one cycle
   later and final USBDP patches are merged two cycles later.

[0] https://lore.kernel.org/linux-phy/avXB6ga-QVfks8RF@parshuram/

Changes in v19:
- Link to v18: https://patch.msgid.link/20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com
- Collected Reviewed-by from Manivannan Sadhasivam on patch 1 & 2
- Collected Tested-by from Chaoyi Chen on patches 1 - 4
- Use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
- Drop the gadget mode patches for now; they can be handled
  independently once the DWC3 Rockchip glue driver has landed. It's a
  bad idea to let that delay this series further as it fixes SErrors
  and/or stuck USBDP PHY.
- Add new patch ensuring that GUSB3PIPECTL is updated under lock in
  the core (Sashiko)
- Completely rework the reset quirk patch in the dwc3 rockchip glue
  driver; it now blocks PM transitions until reset is done. The
  mechanism is also used to track suspend state as a simple boolean
  (Sashiko)
- No change for Sashiko's concern about GCTL.CoreSoftReset in
  __dwc3_set_mode() racing with the USBDP PHY reset: CoreSoftReset does
  not touch GUSB3PIPECTL (verified on Sige5 across a DRD role switch),
  so it cannot release the PHYSOFTRST held by the quirk.

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
Sebastian Reichel (6):
      phy: rockchip: usbdp: Track PHY power state
      phy: rockchip: usbdp: Add reset hook support for dwc3
      usb: dwc3: rockchip: introduce glue driver
      usb: dwc3: core: add post PHY registration hook for platform glue
      usb: dwc3: core: only access GUSB3PIPECTL under lock
      usb: dwc3: rockchip: add USBDP PHY reset quirk

 drivers/phy/rockchip/phy-rockchip-usbdp.c |  82 +++++++++-
 drivers/usb/dwc3/Kconfig                  |  12 ++
 drivers/usb/dwc3/Makefile                 |   1 +
 drivers/usb/dwc3/core.c                   |  36 ++++-
 drivers/usb/dwc3/core.h                   |   9 ++
 drivers/usb/dwc3/dwc3-rockchip.c          | 250 ++++++++++++++++++++++++++++++
 drivers/usb/dwc3/glue.h                   |   2 +-
 drivers/usb/dwc3/trace.c                  |   3 +
 include/linux/phy/rockchip-usbdp.h        |  31 ++++
 9 files changed, 416 insertions(+), 10 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

