Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315631;
	b=LgNJWk//MdElxPY7lf76iwHghGI2fpCVswv0inZnXqc3QYktRF4thN27jNl5asClSRrQ
	 hE2rixyT2UjTv9fuYoIzU4rDqVYwmkg8uOOOgpM1QKh6EcPvJ9OdMSzzR9hhMaOJC4KLL
	 ejunVIwE7FlHmFY42yCYaJHDFf8nbPzj1y/76uelWGi9jIJHuw4tLSWWSysPlBkZgSmAG
	 EePiOjD7FkRkUcjgG7kp/jz422bwX5Fnw+1yKM1GF82Yhzpp+ZIr2jfu/4QUZ3V69/mcA
	 GwifkRjKWwKVBnMD95dFfSo7fqVimVlC4ZrzFB5wSjilrV+h5EePs0hJtXUPCwTuT9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315631;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=zgFy5CRU+XIEddtxlRjTVtKMgKJt4RlY9Vj0+4wHiFw=;
	b=TmZLHgLAHcszjVthq6NRmmkDG/e5uHx/wACiA/lel9bMoNDQe+hhQ5Tq1xs7EDZpkb07
	 z3c9cgOSzh70PqbC1AhuvaPup5g4+BOL/bB9k+ohZypyTb3PFrBrI36z0n/dVw2cbdvk2
	 OYJaNRJRr6SDWZA7Rk4e4Lk41QWXYFN9EdZyk1FhHzCi7PCwySvKIoTCGe8rkoID0qwwH
	 wpkj9zwJMBcJvRohv+hRrRru4e8KCog+hIrb6RPbz/C0yEAZMXu+O55/akaXBBcEFQLAi
	 GQZsHIUQOknl97zbJPVQVjpij9BQi9u5dAFGq6Fdw7jsQy+nNCIxG1sH3IuJPUXgxrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TybdMyS+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eiIRDV+n;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773FF606D5D6;
	Tue, 10 Nov 2026 13:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773FF606D5D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TybdMyS+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eiIRDV+n
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zgFy5CRU+XIEddtxlRjTVtKMgKJt4RlY9Vj0+4wHiFw=;
	b=TybdMyS+dGCtkhFrs2Zd47nnOifCjECWnjdfDq0JHrwrC1a81Y4OMzcQcz+wbFpKKK0Rts
	delxSHrLjYCowMCO0QJ9uFoMxB4Nj44TtEyhmIZwLEKejSkgUxfNXqC61W3295Cx5pslVk
	71MKlH6Wv1k6znQVEPeYqpNK9IIMTK39ZgQITGZiY2+4Db5BEBBUFxP5+w2Q+h5uYCsEBJ
	IAh7/5cC6C0RPQiSTn1asc2lIWI4YnKopX7A//I+HkWIAAyvyzRGKQRQb99NX0D3bzMeig
	2GAWkMlX+ZH3FfUfxC4e0ehk6o9E85rEtaNPs0MXEpt37trrVx1RbzzFe/bA1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zgFy5CRU+XIEddtxlRjTVtKMgKJt4RlY9Vj0+4wHiFw=;
	b=eiIRDV+noTXYxAKPCBb5NG0tGgSUMz5FcdAPiLRfQ/J2+jUE+mnuJ7cEgqrzlJ2JOpNieO
	gWvqQPcgFp03YuDQ==
Subject: [PATCH v6 0/5] firmware: raspberrypi: Add support for the tryboot
 mode
Date: Tue, 10 Nov 2026 14:00:10 +0100
Message-Id: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAFsV82oC/23NQW7DIBCF4atErEs1DBhMVr1H1YUNQ0NV2REmV
 qLIdy+4alNXXj5pvn/ubKIUaWLHw50lmuMUx6EM/XRg7tQN78SjL5shoAaNkqdz5Dnd+nHMXKF
 FZ7EHg4YVcU4U4nWtvb597+nSf5DLNVEvTnHKY7qt72ZR737KelOeBQeuLPTCKaesgZfPOFxyG
 od4ffbEan3GP17C1mPxQbcevdNdh2bPy4c3YLZeVu+7FgMZ8kbvefXwFtTWq9UTtb1rZAi7/5t
 fLwBw65viNVrlhBTUtPK/X5blC78SsVC8AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=2394;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=+wl3d1TUuvEjVn7H52ib0UWFJ+5y1XGeyNy6URPLGGU=;
 b=mvz2dPsl54Dm9gIsFUMbKM/p47nd//BlAN/wQbmKYxuHpzsj3g0qWh8GY30eeLdoxL6mzZJ0z
 TSoV0vkTQffAl54NeMBezslJRBdakAfR2oqdq6C2+uAFQHEztNqFu1Z
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

This adds support for the tryboot mode on Raspberry Pis. As there is no
documentation other than the downstream implementation [0] the
implementation is based on this.

Tested on Raspberry Pi 4 and Raspberry Pi 5.

[0] https://github.com/raspberrypi/linux/commit/eb56da0c1925c07e8929ce4c9fe8aeafa7cb8c7b

---
Changes in v6:
- Rebase onto v7.4-rc2
- Link to v5: https://patch.msgid.link/20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de

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
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>

