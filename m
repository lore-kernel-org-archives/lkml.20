Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8AC282F17;
	Thu, 27 Aug 2026 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827734; cv=none; b=YzyUS0JMP6uhZJeCX5hfykDGIoGWdDVLB3LdvvIAoByyPH2WHWi7pPDHksMc9VI9OwD/bLKXk5t9j+/SR2+KQmoAIekiZz23zVvNc4T9/ZU/o8OLp/0GY83vQxC8dqTJeuqj54qFUl3KQ3czB5tIWUYw0kOLVRTTaTmrrygDGGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827734; c=relaxed/simple;
	bh=o1dAQgAx+m6E/3C1jmsoC6ZdA0OnuiIr4z+WYi2q7Rg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ihHTdCy9svptkM4/IYBKcoaCVS8S8sQoU1NJAE8qMORNqxJaS7uWZkhK0BYJmf0VW7wdr5kQV+UoSCmEIwjb9lCnrYl4NOXpv6WpWsA2XjObyQnnVdzdQL7CCKM4bTLQ1JrACvSYx10qv47YPVLM26Vn7ofyNyVc7ZZCozLlzeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tU1dxVB7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tU1dxVB7"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:306c:5b5b:3c7f:eabd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61478C1;
	Thu, 27 Aug 2026 12:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787827642;
	bh=o1dAQgAx+m6E/3C1jmsoC6ZdA0OnuiIr4z+WYi2q7Rg=;
	h=From:Subject:Date:To:Cc:From;
	b=tU1dxVB7yXmg6ldj8ZNFbZ4IUEipMlD70A9mlLny+8WOgV2EkOgviV9hUCiLREMk2
	 GrUdkftr/JdgT7X7LzzVQREGhXFVCKZ3NaSPBHtjPvRzD+MbWV0pYZk4tJCFcsu4FU
	 wDJF8g/eibtzgaZZK3FCrxoeWDZaUxlCMo0/chtk=
From: Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 0/5] media: rockchip: rkisp2: Add driver for ISP on
 Rk3588
Date: Thu, 27 Aug 2026 19:48:29 +0900
Message-Id: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4VkGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMz3aLszOICI93kFCNL0zTz1MRUk0QloOKCotS0zAqwQdGxtbUAX52
 Mf1gAAAA=
X-Change-ID: 20260826-rkisp2-cd295f7eae4a
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com, 
 stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com, 
 xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.2

Hello everyone!

This patch series adds a new rkisp2 driver that aims to support all
Rockchip 2.x and 3.x series ISPs. Here we add support for the version on
the RK3588, which as far as I'm aware is a 3.0.

Patches 1 and 2 add dt bindings and dt nodes; patches 3~5 add the actual
driver.

Notable changes from the RFC version:
- fixed a couple potential page fault storms
- use extensible stats (previously only params were extensible)
- no more subdev pad crops; all cropping has been moved to parameter
  buffers so that they can be configured synchronously
- the DMA RX sink pads and the main/self path source pads on the ISP
  subdev have been split into individual pads
- an unused sink pad has been allocated on the ISP subdev for future
  inline mode support (to prevent uapi from changing)

Changes in v3:
- add explicit padding to uapi structs
- reorder patches so that dt goes last
- move uapi header to a nicer location

This series is based on the latest version (v7.2-rc1) (at the time of
posting) of media-commiters/next [0], with some patches on top for
testing on the Orange Pi CM5 Base with an imx708. I have a branch [1]
that integrates this series on top of said patches and
media-committers/next.

Corresponding libcamera patches+branch will be coming soon (within
minutes), but since I cannot send and link these simultanously, you will
have to search the libcamera mailing list :) I'll be sending a v3 to
match the driver v3.

[0] https://gitlab.freedesktop.org/linux-media/media-committers/-/tree/4900cad020c0580dfb1be27776ff10a4ef110cfa
[1] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.2-rc1/rk3588/rkisp2/upstream-v3

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Dafna Hirschfeld <dafna@fastmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: michael.riesch@collabora.com
To: stefan.klug@ideasonboard.com
To: mehdi.djait@linux.intel.com
To: xuhf@rock-chips.com
To: zyc@rock-chips.com
To: dalong.deng@rock-chips.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
Paul Elder (3):
      media: rkisp2: Add parameters output video node
      media: rkisp2: Add statistics capture video node
      dt-bindings: media: Add rockchip rkisp2

Xu Hongfei (2):
      media: rockchip: rkisp2: Add rkisp2 driver
      arm64: dts: rockchip: add ISP nodes to rk3588

 .../devicetree/bindings/media/rockchip-isp2.yaml   |  125 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-rkisp2.rst     |  112 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   57 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkisp2/Kconfig     |   19 +
 drivers/media/platform/rockchip/rkisp2/Makefile    |   14 +
 .../platform/rockchip/rkisp2/rkisp2-capture.c      | 1540 +++++++++
 .../media/platform/rockchip/rkisp2/rkisp2-common.c |  180 +
 .../media/platform/rockchip/rkisp2/rkisp2-common.h |  620 ++++
 .../media/platform/rockchip/rkisp2/rkisp2-debug.c  |  234 ++
 .../media/platform/rockchip/rkisp2/rkisp2-dev.c    |  372 +++
 .../media/platform/rockchip/rkisp2/rkisp2-dmarx.c  |  706 ++++
 .../media/platform/rockchip/rkisp2/rkisp2-isp.c    |  839 +++++
 .../media/platform/rockchip/rkisp2/rkisp2-params.c | 1167 +++++++
 .../platform/rockchip/rkisp2/rkisp2-regs-v2x.h     | 2625 +++++++++++++++
 .../platform/rockchip/rkisp2/rkisp2-regs-v3x.h     | 3428 ++++++++++++++++++++
 .../media/platform/rockchip/rkisp2/rkisp2-regs.h   | 1736 ++++++++++
 .../platform/rockchip/rkisp2/rkisp2-resizer.c      |  407 +++
 .../media/platform/rockchip/rkisp2/rkisp2-stats.c  |  509 +++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/media/rockchip/rkisp2-config.h  |  643 ++++
 include/uapi/linux/rkisp1-config.h                 |    1 +
 include/uapi/linux/videodev2.h                     |    4 +
 26 files changed, 15353 insertions(+)
---
base-commit: 7517ffce3b70c999f6038fc87d4811004d994d25
change-id: 20260826-rkisp2-cd295f7eae4a

Best regards,
-- 
Paul Elder <paul.elder@ideasonboard.com>

