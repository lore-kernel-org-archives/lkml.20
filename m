Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA6414428;
	Thu, 24 Sep 2026 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270765; cv=none; b=l9TLmomP718VBOiDUSk0T/9qg8Qo/1FuOA6agObuk4oZmGk59ooFdeaDmUQ0JlcRQsNpe0soXaECNQ6yYIaHQ0spfWuX0I/PHtAMLrGRJipTLCwm0NOxf+lKYvlSnyJpkY2RyEYyOl+kWgCtGBCVUIi4Jq2LhYNlxLdYVz66xBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270765; c=relaxed/simple;
	bh=3sBvjQKw6DJCadb53xNtWm7YOjLNwu7mLDnxmC9FK5w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kw+YTjlUaQIIl60VcRTYT2dWo9aNEy3ziCU4IiOscBhgsqjYtYi1MUtkm+2nFEOdhqTWpDYACO5ZAEVYGgyPlKNWrI4bcjit/l3crxHOMWs+Qlly/4/RadShnWD67J9zYhmz7D6bMSj40nTRV5tODcBD/oypcWSyMipVgB4WijQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OvimmMZv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OvimmMZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790270762;
	bh=3sBvjQKw6DJCadb53xNtWm7YOjLNwu7mLDnxmC9FK5w=;
	h=From:Subject:Date:To:Cc:From;
	b=OvimmMZvvNPbU+qiwT8pkh8D04s1znDaTjrL5RbYxyw91Pols0o4QT8N45TstG/Dm
	 iGeGhgTuxgZf3iXKZfYhlYm3Uyn16/MQz1q7PyyO5JWveBJEiKJBNnpitJBdGtn9mv
	 bXqNJ0hd9BBvpOmBjZBYoJUBYl38ZxT0A7+6uKVzqCVlObkzyln5hB9OfQp3WjD4Ou
	 25rZ9AIRM3jE/C5H3E5oDFyu7TTUu6Km2b9QsYLreFkRV4wc52AdY8Hj5joQIlQo9R
	 D/CPAEDJxn/uCfilhRjAta2OvzhZOGLJXTvQa79Vzvfx39gUaC+XrmmasaEFddaXwN
	 exQA2DZIpwKIQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E96D517E0082;
	Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9861748002B; Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v16 0/6] usb: dwc3: introduce Rockchip glue driver
Date: Thu, 24 Sep 2026 19:25:36 +0200
Message-Id: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOyw6CMBBFf4XM2hpKCwgr/8O4aMsIVaDaFtQY/
 t3ySFy6PJM799wPOLQaHZTRByyO2mnTB6DZLgLViL5GoqtwgCROsrignEhOrFE31eg7qZ6K/ah
 uByRFXqBgOUsrziCU3C1e9GsxnM4ru0FeUfm5dUtYfAxB7dcYSOGQKNN12pfRmO+DQ1GYvxvtv
 LHvZe5Il/A2LP03bKQkJnnGpEx5dkg4HpVpWyGNFfvggvM0TV9qFEn6DwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3046;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=3sBvjQKw6DJCadb53xNtWm7YOjLNwu7mLDnxmC9FK5w=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq1XSmZhKGkf1izi3YlOhbYNbqIV6op3jl0F
 61epOfYQ/gp/YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqtV0pAAoJENju1/PI
 O/qax+wP/Ahzg72x8NLtRMgZovPAcWOphz1v0/zYHXkHMkouZ/xu1IREC7H0l4cDhe28zyTX3m/
 YxxadEhLponFpvA8np0OcKyYAolg8zpmeC+/v4TCBg1aFShNqzoHn9gszHl4X5ne0WtSVQKSguE
 v7qfEyZ/JaTwSev7frVc2ugB6qvKKxJJ9y0A9PobV9TPNwyH+hk7jfFE/9jmMZi4pxXRYAY1zBo
 7rUQivWhVwXY/Q8BFZGMRmt236pw3mi+7WB5bSTbG7JJFHgMptpxFNl6o9tBi6ZB9iTy5L1Q8PN
 RVTfVNSMrYCRyFsFlhdfKj9QWhrO8foy2da0jA4sMO7oE21448UBXbFSexttcDOU5a0VS88Qfw2
 6oUg2r4s2XaUDsz3wqp5z7ggpP9r44wt9pID++jPj5kg1r06evftKwvBMuwlSXxtjctoOTr9x4x
 mSgJlWQeSjUMIhQM2JqE/IH9fNZkQfN0/JT4LN6pHffnlxfGRaRlYcU+fdBdF5x46KwMpC1UnqW
 C0ECA4JA90wYmPtNQ+vXlTkoVEziJqdwahqxPVNM0nJEwCekH85jvn8M+03hXqG1W6ktj+KyscZ
 fRYWL2+33Qn2AEJahnc1gZjIit5GgyQHDzngcb0fAC4EGu+c4yzOATk30+A3wiOiRacRbVhRuCs
 VQNrQqAWNhZUF99CyjXAsoA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The recent Rockchip platform have a combined PHY, which does USB3 and
DisplayPort as well as muxing the lines in arbitrary order. Changing
its enabled functionality requires a PHY reset and as the PHY provides
a clock to the DWC3 controller, this can result in an SError. Apart
from that the PHY might not start up correctly when the DWC3 PIPE
interface is running. This series prepares a Rockchip specific DWC3
glue driver to help out with these problems. To become useful more
patches are needed on the Rockchip USBDP PHY side, which are send
separately.

This was split from the USBDP cleanup series. It has no dependencies,
but is required for part 3 for the USBDP cleanup series (which will
be the final part).

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
      phy: core: add notifier infrastructure
      usb: dwc3: rockchip: introduce glue driver
      usb: dwc3: core: add post PHY registration hook for platform glue
      usb: dwc3: rockchip: support PHY reset notifications
      usb: gadget: define stub for usb_udc_vbus_handler
      usb: dwc3: rockchip: fix USB-C reconnect in gadget mode

 drivers/phy/phy-core.c           |  65 ++++++++++
 drivers/usb/dwc3/Kconfig         |  12 ++
 drivers/usb/dwc3/Makefile        |   1 +
 drivers/usb/dwc3/core.c          |  17 ++-
 drivers/usb/dwc3/core.h          |   9 ++
 drivers/usb/dwc3/dwc3-rockchip.c | 254 +++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/trace.c         |   3 +
 include/linux/phy/phy.h          |  40 ++++++
 include/linux/usb/gadget.h       |   5 +
 9 files changed, 405 insertions(+), 1 deletion(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

