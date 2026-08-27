Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FFE401494
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834850; cv=none; b=BohiIQ0JZeLEMmQdwtFc26wIjwiMkVRtRz20rq8muGv+56tahhYz4jxWYQs4LYhi4p6SYvb5IPUjv07lzFnFe+K1RPvf9KztvB7mofkKr16aGUKEjowI42GIMwhpwcHQRpJWbDAqYE2eqoH2qKua4zk9K16XcG/JBFexkeYTIXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834850; c=relaxed/simple;
	bh=PdyIiFnfwutzm1suEhff0HPvIUN8xuHSPVRJYXoda0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZ7cCZdKMaIsEN7l2QDgmCNSLnChkYwwYCG+JXSotl86BE4q9w0znctcYk5k7imAXN64j0gKq2dNxkJ1z6RyxRSkBCnReJ7t5PIB1dDme0PA9rUubuIctpXGx8XeayNl0tbeaIpD41Rjg7KJo7WaT76ivXNJ2aS4iF8HIoJ+pIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7tOBn/Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7tOBn/Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973FB1F000E9;
	Thu, 27 Aug 2026 12:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834841;
	bh=NoqGPVIyc97ZcKe2e0S4qLnfmIW5lJYQNfdANgG+8i0=;
	h=Date:From:To:Cc:Subject;
	b=P7tOBn/QhLqeIal3wc43l9DZYhfR8r5tvfChWEKQIHwfV2P/PjZ7bpD8vqrpOnEua
	 IsnbKvRc5nM2N3b+smvjERJb2Q37PhJB0wrurTDpPjEvr3VGFSUAWRfm/TgGCfs0re
	 d8qQ68i5FTNCwwv+AHUdCfMMbeMn30LjxUHx80ZosmcF+EqrDKioKoy+MRvjhxncCa
	 5QTerUCUrOECWRTOCdG/hFlcZbYFLt04q1Pl2z+I3dEF18te4vlT1p4+RQs8IVkOC9
	 kY3HL+oQQ6+2MGFrSoEq+KccTr/RzyzvcpcPmS/X3Zka2m8IQZC8YhaU8o+TlKtV5D
	 KFlD/rFtk6Ptg==
Date: Thu, 27 Aug 2026 13:47:18 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Daniel Thompson <danielt@kernel.org>
Subject: [GIT PULL] Backlight for v7.3
Message-ID: <20260827124718.GG770273@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Good afternoon Linus,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/backlight-next-7.3

for you to fetch changes up to cf1a12e0804515e0ed8b3f50c1c32f7f425bd660:

  backlight: Use sysfs_emit() instead of sprintf() (2026-08-12 14:06:29 +0100)

----------------------------------------------------------------
Backlight for v7.3

- New Support & Features
  - Silergy SY7758: Add driver for the 6-channel high-efficiency LED driver

- Improvements & Fixes
  - Awinic AW99706: Fix device tree property names to match the binding, consistently
    validate all property values, and honor the core blank state in `update_status()`
  - Kinetic KTD2801: Add missing dependency on `GPIOLIB` in Kconfig
  - Qualcomm WLED: Remove redundant `dev_err()` calls

- Cleanups & Refactoring
  - Core: Use `sysfs_emit()` instead of `sprintf()` in sysfs show callbacks
  - Maintainers: Update Junjie Cao's email address for the Awinic AW99706 driver

- Device Tree Binding Updates
  - Marvell 88PM860X: Add missing bracket in the example
  - Silergy SY7758: Document the 6-channel high-efficiency LED driver

----------------------------------------------------------------
Julian Braha (1):
      backlight: ktd2801: Fix unmet dependency on GPIOLIB

Junjie Cao (4):
      MAINTAINERS: Update my email address for the AW99706 backlight driver
      backlight: aw99706: Fix DT property names to match binding
      backlight: aw99706: Validate all DT property values consistently
      backlight: aw99706: Honor the core blank state in update_status()

KancyJoe (1):
      backlight: Add SY7758 6-channel High Efficiency LED Driver support

Levente Szajko (1):
      backlight: Use sysfs_emit() instead of sprintf()

Manuel Ebner (1):
      dt-bindings: backlight: 88pm860x: Add missing bracket

Neil Armstrong (1):
      dt-bindings: leds: backlight: Document the SY7758 6-channel High Efficiency LED Driver

Pan Chuang (1):
      backlight: qcom-wled: Remove redundant dev_err()

 .../bindings/leds/backlight/88pm860x.txt           |   1 +
 .../bindings/leds/backlight/awinic,aw99706.yaml    |   2 +-
 .../bindings/leds/backlight/silergy,sy7758.yaml    |  52 +++++
 MAINTAINERS                                        |   2 +-
 drivers/video/backlight/Kconfig                    |  10 +-
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/aw99706.c                  |  25 +-
 drivers/video/backlight/backlight.c                |  16 +-
 drivers/video/backlight/lcd.c                      |   6 +-
 drivers/video/backlight/qcom-wled.c                |   2 -
 drivers/video/backlight/sy7758.c                   | 259 +++++++++++++++++++++
 11 files changed, 350 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
 create mode 100644 drivers/video/backlight/sy7758.c

-- 
Lee Jones
