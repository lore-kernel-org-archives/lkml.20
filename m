Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9292D1F7B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302818; cv=none; b=UcfcEPsqU3XiI9PpyZLcY96acpNAax4JJdGUlyXEgGOhMMELjL4TznoDkIZbfRq0NzssVXFXFLzHz1ReU9ZOEQVNHwUuJKXVmhT7Ft7+drBzu7Nrnq+xz2TFbJC4IfoI5UPLfISyDdB3uBnIMjcfLRFn8Ziaa+IeNRGfpSTlFjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302818; c=relaxed/simple;
	bh=whAmQiE464wLFqByLfpYn74BEgXcBIDOT5HHlO034iU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=owvi/nizOSY2kyRqhN6hCfxh5OaCNZDYVywhNhlviINOoHTbyA5wVAl8bYUtJJnsxV/L9pQQFbDcUeDVeqbgoUzWibNJ8CopL92u2IaMOZRRFka2npmWkJb0vKOlj3KY+E9j0VHo4ssaefoq0rseQ/cyRpzBukzeOLWvwtlWudQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABvUmaVx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABvUmaVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414751F000C4;
	Sun, 18 Oct 2026 05:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792302817;
	bh=8eQpPEBo/924nr+HvvS44frL2SHZuO2DwpkNSU2t1pY=;
	h=From:To:Cc:Subject:Date;
	b=ABvUmaVxGuG89GfdBa2nNNJyn99e0KpDOmCMN+X9X1PBp95veojBJLGfy0BbDx8zw
	 Wy1K+nXKscj2D1Bvvb8YYRDMl4eFfnCd5+giGOon2OMPEPlaOQUIcv5o6sdC2t9CbO
	 fHJ5G/Pve1n5sSUMbeBYeJ4/9ryl59ToAndKHZ8hWxdnbfSgKlyLu8FiXeA1IFmoFK
	 bBFosiYrK1m8YOP5s0C1CRIpKvKYDhsnughRLdXjivHrI/D5wfIxvSEIiACQbPXgje
	 z0ECmbg8U2Zu7uomp3azv/UmsXYHZvymnPopsv0VB0qRxvjpnLE2l1B9Rhu+ci35mK
	 0cTnNgcpAlMIQ==
From: Stephen Boyd <sboyd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] SPMI changes for the merge window
Date: Sat, 17 Oct 2026 22:53:35 -0700
Message-ID: <20261018055336.1037077-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git tags/spmi-for-next

for you to fetch changes up to 8f70c729e68c3e02ccca6d13c733175489fdc069:

  MAINTAINERS: Add Abel as SPMI co-maintainer (2026-10-14 20:06:02 -0700)

----------------------------------------------------------------
More than a handful of changes for SPMI. I'm bringing on Abel
Vesa to help maintain SPMI so the tree may change in the future
but we'll probably continue to send patches when the pile is
small.

The big change here is that we gained a new function
spmi_subdevice_alloc_and_add() to support complex PMICs that have
different devices spread throughout the SPMI address. We've grown
subdevice drivers that use OF APIs directly to figure out some
base address to add to all their register read/write operations
which is tightly coupling our parent/child drivers. This change
allows us to clean all those drivers up to use standard device
APIs and their own regmap instead of relying on a parent SPMI
driver to do all the heavy lifting. The series also updated
drivers that could use the new API and I picked those all up
because they were acked by maintainers.

Beyond that we have some minor fixes to the Qualcomm and Mediatek
SPMI drivers for bugs in software and hardware and a couple
maintainer updates as stated earlier.

----------------------------------------------------------------
Abel Vesa (2):
      MAINTAINERS: Add Qualcomm SPMI controller entry
      MAINTAINERS: Add Abel as SPMI co-maintainer

AngeloGioacchino Del Regno (13):
      spmi: mtk-pmif: Add workaround for FSM lockup/error in read operation
      spmi: Fix potential use-after-free by grabbing of_node reference
      spmi: Remove redundant dev_name() print in spmi_device_add()
      spmi: Print error status with %pe format
      spmi: Remove unneeded goto in spmi_device_add() error path
      spmi: Implement spmi_subdevice_alloc_and_add() and devm variant
      spmi: Add helper to get a parent SPMI device
      nvmem: qcom-spmi-sdam: Migrate to devm_spmi_subdevice_alloc_and_add()
      power: reset: qcom-pon: Migrate to devm_spmi_subdevice_alloc_and_add()
      phy: qualcomm: eusb2-repeater: Migrate to devm_spmi_subdevice_alloc_and_add()
      misc: qcom-coincell: Migrate to devm_spmi_subdevice_alloc_and_add()
      iio: adc: qcom-spmi-iadc: Migrate to devm_spmi_subdevice_alloc_and_add()
      iio: adc: qcom-spmi-iadc: Remove regmap R/W wrapper functions

Fenglin Wu (1):
      spmi: pmic-arb: return 0 in spmi_pmic_arb_register_buses() on success

Wentao Liang (1):
      spmi: mtk-pmif: Fix clock reference leak in mtk_spmi_bus_probe()

 MAINTAINERS                                    |   9 ++
 drivers/iio/adc/qcom-spmi-iadc.c               | 116 +++++++++++-------------
 drivers/misc/Kconfig                           |   2 +
 drivers/misc/qcom-coincell.c                   |  45 ++++++---
 drivers/nvmem/Kconfig                          |   1 +
 drivers/nvmem/qcom-spmi-sdam.c                 |  41 ++++++---
 drivers/phy/qualcomm/Kconfig                   |   2 +
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c |  52 +++++++----
 drivers/power/reset/qcom-pon.c                 |  31 +++++--
 drivers/spmi/spmi-devres.c                     |  24 +++++
 drivers/spmi/spmi-mtk-pmif.c                   |  42 +++++++--
 drivers/spmi/spmi-pmic-arb.c                   |   2 +-
 drivers/spmi/spmi.c                            | 121 ++++++++++++++++++++++---
 include/linux/spmi.h                           |  17 ++++
 14 files changed, 367 insertions(+), 138 deletions(-)
