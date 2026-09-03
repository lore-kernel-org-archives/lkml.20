Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE134BB5D2;
	Thu,  3 Sep 2026 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446919; cv=none; b=VFWlgcdDuw4r9ZG93sam0XIGD8utBjP++MnYzQjOGmOTjX6a2kH3huhStnopP/38kdUjCISdkpSxt3IM57VE5wnOPsITsEGmW1fThRcsOz/t5PmDJAKQhjl9Ui1LLAIU0qM6vZPcMG0IRTu6V5I0kmtTJ+wnjLp3eVxDNa5TnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446919; c=relaxed/simple;
	bh=14lHZ5IUE0OuXdbjmNVpbHbGuq87FsQqQ2MFozbW3Iw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PWvKk72+Uz75n1XPKaC9j+xS0vFi2Oz9Cpy1ZvsxYtBZVUJu+VbcaDNpCMziDczOEp0/xvkHy1V5Joxk1HDrbmLiBBT23f05mWHJB6EHaPNACPRxivnV0uIpBB7sY/SwCNWAO1VMANARRoJAZwjbr5ilLH5cLHdleRKPVfg/Brw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mA07u7Op; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f0BWuNmU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mA07u7Op";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f0BWuNmU"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788446914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3NuArli8YmZC5IlHt4V7im8YxCZ8U4oEjJSqoHJ/Es=;
	b=mA07u7Op0A8cujKltEAeKdK0q2Py9oeCNIm6CqwGlzSDDtejNp3t2HvzMkvoShCQMKJ7oX
	ag4ksjj+9nF6DCdbcfuNVsMi0Q5tXgiXCR1ekCTPv9RY46pW5QTAEa9i7lTNT1nVI74DYX
	EvBnhxGRPAD/4ppTjPwsxYNR0lrLT0eUVLRTOHU3aW0Zm6CNyV9S4MfWvofQP5vHqYzntk
	ImJidLhn9s3FFsdz+vn1U+LYqqe3S4FgWI+xiRK6VlfqRamF9Kc6+WcfBiJgJGHUUgx/7r
	EmT19LVFBfVpwuCvOfJTw2TmJ8IVav6ZtOZp0Uarm7wBUCZtOiKgj8bh1BLhzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788446914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3NuArli8YmZC5IlHt4V7im8YxCZ8U4oEjJSqoHJ/Es=;
	b=f0BWuNmUtGu/YroonxfBBWE1FiYBQQt3KWD/0CPLzZX+ebL7tP0YIfdw7DiaZKesZwZZWD
	5VKss09Hrlo7QpAg==
Subject: [PATCH RESEND v3 0/4] firmware: raspberrypi: Add support for the
 tryboot mode
Date: Thu, 03 Sep 2026 16:48:24 +0200
Message-Id: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788446914; l=1925;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=14lHZ5IUE0OuXdbjmNVpbHbGuq87FsQqQ2MFozbW3Iw=;
 b=dDcRSE52L1L67dM9M+0Nj8EM/SKASdJ34aZkUnY/lx8lMYkKMcnpci7z3QfNd9GFrm5UYeqvm
 /nco4GU/OWjBVXmfds2u3YQX9eWPKbwGfTuxwsQd09LGSEHIGIA/QOI
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

This adds support for the tryboot mode on Raspberry Pis. As there is no
documentation other than the downstream implementation [0] the
implementation is based on this.

I tested this on Raspberry Pi 5 and therefore I only added the
properties to this devicetree. But afaik this should work on all
Raspberry Pis. I will add it to the correspondings dts if I get some
hardware to test it.

[0] https://github.com/raspberrypi/linux/commit/eb56da0c1925c07e8929ce4c9fe8aeafa7cb8c7b

---
Changes in v3:
- fix use-after-free error by using devm_add_action_or_reset
- ensure endianness of magic byte
- refactor reboot mode registration into separate function
- Link to v2: https://patch.msgid.link/20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de

Changes in v2:
- Remove unnecessary reboot_mode_unregister().
- dt-binding: restrict to mode-{normal,tryboot} and only allow 32bit value.
- Link to v1: https://patch.msgid.link/20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de

---
Gregor Herburger (4):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
      firmware: raspberrypi: Add reboot mode support
      arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  9 +++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
 drivers/firmware/Kconfig                           |  2 ++
 drivers/firmware/raspberrypi.c                     | 40 +++++++++++++++++++---
 include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++------
 5 files changed, 60 insertions(+), 15 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--
Gregor Herburger <gregor.herburger@linutronix.de>
-- 
Gregor Herburger <gregor.herburger@linutronix.de>

