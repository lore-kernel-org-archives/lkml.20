Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1EE4477F7;
	Fri,  2 Oct 2026 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934828; cv=none; b=SuYfCxOlphoV7Bt9cqViaYAvmg/MXqJPQETqg8mlnwEHFHQYeDzVfHh0ug5X7Zp1O/syy88KV4dVB4P58Kx5dkjJ+UaUAytORsX1jg+9pwh++ThNtu14z7P4vYkLV61svWos3gOxz9iOxrY6cTwASJxI104l4nFXOMO9ywG+heE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934828; c=relaxed/simple;
	bh=ommQaz+996XWxGAdGpfsl57SPv5twf2rtNuOL2c7ogM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tGYTGkNzOPkiVGxr2X5GsB2O2dmlNDgJyIe7uSm/QfAaWYt6tDQBacp2o8j5qsjsPQzdPQxoNGeLUaKKb3FW6oqY5TdaIbaL7pHRvvmHCczqCyryCHc+U0LITyaw29EuME41m6DlW4W2QgQxvR7qLm2M7CvKEZUPpGfkH6RAJlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DxWKWsQ6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u1cvQAru; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DxWKWsQ6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u1cvQAru"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790934825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wh9xWcUPndi1IraSPg61IdZ5HAFfOo8+nBKdXLgcsYk=;
	b=DxWKWsQ6L1TcEcByD1j6oiyQQPGrGC50fu92G26ti3WDS836Q0VK6eprzZy5Q3uDWtu4rw
	u1xWBizUN2pwpK1IrFuRquvy7sL3BxYvipWRnnAv1K7TvGZvRV7FWO1McfSIpZYarW9GOO
	9oPIj+VCVHABI0Xt5rl0U5nThgMnYrp2b5Mxztjo9hP1jWLfeRjkj4xaJXjA0FKuVj51Bu
	A+90k7MkYfPJUR9B4RIq48EIkyytD5qK1RZv2Gi9EFGHsuxkviQq1r4fGIDAtE7Iuif86u
	WbsyvgQuviSxgsqBmXcxJqGvdpfsPvqfbuS1oOYxWibNEsT2E+ZVr2vhl0ImtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790934825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wh9xWcUPndi1IraSPg61IdZ5HAFfOo8+nBKdXLgcsYk=;
	b=u1cvQAruZhuRQPiIGv/EM6X43zOPbRL2hkwWQgQseWl0Ol0qPf80PdXDVtlJoCvQ4MOZAa
	MZjw69RgJE/hyEBw==
Subject: [PATCH v5 0/5] firmware: raspberrypi: Add support for the tryboot
 mode
Date: Fri, 02 Oct 2026 11:53:39 +0200
Message-Id: <20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACN/v2oC/23NQW7DIBCF4atErEuFBwKmq96j6sLA0ExVmQiIl
 Sjy3WMcVanVLJ803z9XVjATFva2u7KMExVK4zL2LzvmD8P4hZzCshkI0EKD5PlIvOaLS6lyBRa
 8BScMGLaIY8ZI57X28Xnf5eS+0deWaBcHKjXly/pu6trdb1lvylPHBVdWuM4rr6wR7z80nmpOI
 51fA7JWn+CPl2LrYfFR9wGC18MA5pmXD2+E2XrZfBh6iGgwGP3Mq4e3Qm29Wj1i7/xexvjv/zz
 PNz7g0+l8AQAA
X-Change-ID: 20260623-rpi-tryboot-4292c92b0727
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790934824; l=2259;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=ommQaz+996XWxGAdGpfsl57SPv5twf2rtNuOL2c7ogM=;
 b=b/2QVIcc7mFLdMeZX3+sGemj49mgaowYSfkGK9YQhk178XMi43yy1CH18O8QlkrSa2sfSbAqZ
 PtAy/WVTpIFBWge0EJhKaD9iY1K1hRdpYmjvqcTqOKw5YrjfuO2hZ1y
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

This adds support for the tryboot mode on Raspberry Pis. As there is no
documentation other than the downstream implementation [0] the
implementation is based on this.

Tested on Raspberry Pi 4 and Raspberry Pi 5.

[0] https://github.com/raspberrypi/linux/commit/eb56da0c1925c07e8929ce4c9fe8aeafa7cb8c7b

---
Changes in v5:
- Added patch to add reboot mode to Raspberry Pi 1-4 devicetrees.
- Rebase onto v7.3-rc5
- Link to v4: https://patch.msgid.link/20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de

Changes in v4:
- fix use-after-free error by moving devm_add_action_or_reset before devm_add_action_or_reset 
- Rebase onto v7.3-rc1
- Link to v3: https://patch.msgid.link/20260707-rpi-tryboot-v3-0-fda82fe7ed76@linutronix.de

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
Gregor Herburger (5):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
      firmware: raspberrypi: Add reboot mode support
      arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node
      arm: dts: broadcom: bcm2835: Add reboot modes to firmware node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  9 +++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        |  2 ++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
 drivers/firmware/Kconfig                           |  2 ++
 drivers/firmware/raspberrypi.c                     | 40 +++++++++++++++++++---
 include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++------
 6 files changed, 62 insertions(+), 15 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>

