Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108A3C1406;
	Tue, 15 Sep 2026 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485491; cv=none; b=SrAPHrKkpLLThUUIvWL5mcuQIK5+QzPJpGB4lfEyhzY+7Coa/6SueymeKzQZIFNKqrtbaMx11GmAbq79XEIMQ5nIJ9H4RxZnOs7Pc2e1El2aDBxCnsSA8MYlq0jHME9BXMermSa9MPFJKvF78guUZZfcaUZjlHKDfxM9GWafAZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485491; c=relaxed/simple;
	bh=jgdWifKPcWdMtqmrqZ3Slx0WzB872SaeXohnnWZg518=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q2KK3ppUhYR1Vlz+WMWY0ggeXAOQ/SUBkK54UHeIX0CU/Ka7Ocl9amPtObqWv+rF5k6NQ8Yqmp0u/jkwelftGvQ2LXHc6kXd3TZdbPpWLUzWLW+DKtxH1aR5ssigH4jKaekK0CVyGL/N4eEmyMPDU/qjwGscd4Fu7f4UAUOqWBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TGEJ7Wg0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TGEJ7Wg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789485488;
	bh=jgdWifKPcWdMtqmrqZ3Slx0WzB872SaeXohnnWZg518=;
	h=From:Subject:Date:To:Cc:From;
	b=TGEJ7Wg05p6fh+Z8loFcMiM9GN5kHSCv/Jir9Tgk3zOHnZre4M/hKtBjn8HkTxUdZ
	 27qAXK6yKAq4M4v/hdmtY6qRB2a7STO+r2ry5HgnVWTzYLZB0iKIbMcptsMWWWqaB/
	 KE8tnmoQQJANTNf1oWo2Yw0GcEIO4Vd6q8w36vCxK7azB1Hin+zgnOf9M3GQg6nEqk
	 RPpVYjtklKtbh1MayUddWDVPX6kHBtpOnLyTZX7bMskPAgFJEcvS10OiJSyjs07JZf
	 kvtp/T82yXmvFgn7JUOLyQnjzD8fRM0azx5aC0b3xgFhOtSPihW3HSME6YZi8jMiPT
	 /8GkKxblGz87A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A6F417E015A;
	Tue, 15 Sep 2026 17:18:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BC02348002B; Tue, 15 Sep 2026 17:18:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/5] usb: dwc3: introduce Rockchip glue driver
Date: Tue, 15 Sep 2026 17:17:40 +0200
Message-Id: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ6CMBAAv9Ls2RpK0aZ8hXCAZYVVodgCmhD+b
 hUTj5NMZlYI5JkC5GIFTwsHdkMEdRCAXTW0JLmJDGmSnhOrMlln0ju8YcejbJ6o/9TeZ5LWWKq
 00acm0xAjo6cLv76Dotw5zPWVcPpUf4anxxzP065BXQWS6Pqep1ws5hgfqKDctjdAVniurgAAA
 A==
X-Change-ID: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jgdWifKPcWdMtqmrqZ3Slx0WzB872SaeXohnnWZg518=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpYa9phPuAtZmEodicGIBpyvzuNcZhYi3ZR
 CWpfFQoDysxz4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWGvAAoJENju1/PI
 O/qakiUP/1HqzGnpqVuhIU6EcsoD2XGnnvkaPnzhq/V0pnbVD2yTcaX4ddS3Ya4Z+RVBD0c3Ubs
 grubOhpN7meIkxoaiz3xozzR9hE0oAaLS6riZ1vIrBysjURQeHbrZlnNfPIGnzt5jVM+xQxhDH9
 KkIs8nDFqys0su6ayx7TMpARtNkVnbRXcQPxdgjlYFOD9SR66T0dHsP58EfVsMR2GOD6hK8A/hX
 2rgF26qhC2fllrZxRh0bvwfwl0xhB+yyvDQiyzSyy19b+7mPfBpqb4CgihisHaNTs15i2aJ4muy
 YEI0btSjA01P1hek/g7Im/o/84jWlECmrIXYgXm6YNFHY7+Vk479i1VgaQxMOFhODCNNCqR6np7
 PgEqdP3F3lh5hgTambwkvYZRx8rFJcYI1vahKFNBxYKhfrX0qkVb74r54ezNn3872kUcqt/Z1g1
 E9TbpcYrZFgNlrRmtYXqcwG+Q3ch5y54UFvTkg2LVPAKLfx4O7JD0F1Q6sNMrVh1Dt2gLRqWqpO
 satKM8/yzwNxxh6E+ZE6j2+2FIHF/Kr5kwkgeDo0BRDXxoYIyQDJCJ3OkXe+HkvmTRtssJ68A7I
 Rh9g+21m3arpO8qAc0bccgajwtYXVns98LZiX9O5P29i89xBTfPrLGAB2o2P+PWPka9l+eypAn2
 MA4o7Qw1hruyNTHGcG2UqfQ==
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
Sebastian Reichel (5):
      phy: core: add notifier infrastructure
      usb: dwc3: rockchip: introduce glue driver
      usb: dwc3: core: add post PHY registration hook for platform glue
      usb: dwc3: rockchip: support PHY reset notifications
      usb: dwc3: rockchip: fix USB-C reconnect in gadget mode

 drivers/phy/phy-core.c           |  65 ++++++++++
 drivers/usb/dwc3/Kconfig         |  11 ++
 drivers/usb/dwc3/Makefile        |   1 +
 drivers/usb/dwc3/core.c          |  17 ++-
 drivers/usb/dwc3/core.h          |   9 ++
 drivers/usb/dwc3/dwc3-rockchip.c | 254 +++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/trace.c         |   3 +
 include/linux/phy/phy.h          |  40 ++++++
 8 files changed, 399 insertions(+), 1 deletion(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

