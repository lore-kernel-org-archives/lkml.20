Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4232E493653;
	Tue, 15 Sep 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467034; cv=none; b=FTkrXSdtZaXntftIVfR7vMpalgd2uAn90vf3Iae7bTrdqM09RY3M/MNtsFVrngM2KDRNaOsKeGKF5H7HaWq91nPu5+NZIzFOW/QFofaxTsmIeHqk4geDIT5KtuGNLC8Xbj+C0Lq/rydfAwtLtYTnSaWbhL3T0KplPpynej0pf2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467034; c=relaxed/simple;
	bh=D7vYRfDYX2mNbWggPeNQgbQs/Qp4rSvwGWxfHN5e9nY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rUGS0B/2mrjPbgVxuoBD0u/0eN6HIACK3ekQOzViG61RNnQJsQdWgFkrvWX2rcm57FQj7D9aIr7wTUp9qYgVfgb60XkvB3kIJGCGObowFXavqY9miOdCHGE/vjwnQ9BHuJAn+bk3Jb06941TN1zmir2gjSC95w5+e7MGYFF200U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ue0f0yL3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ue0f0yL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789467026;
	bh=D7vYRfDYX2mNbWggPeNQgbQs/Qp4rSvwGWxfHN5e9nY=;
	h=From:To:Cc:Subject:Date:From;
	b=Ue0f0yL3LGb2t5G/Q1Sb8TZOpHIw1yeqNoNSHBn4t3tQhMBak207yq/w5LjvwonqN
	 kLTYi2bvAxU5s4NVV/fWrJib1Cy7vF8ibv/Y/5SidlIrVPlUccm7I5PJqgMZ+Y2ctV
	 HDFykahu0/dTkwRYOCHUf6hAWgdGF0VdNRBzKT1gsLh+u5GI9WnPbdo5Ayy9LZ3PyN
	 Mi/N5e9I0S6woR/xwP5TRLIt7AnjOLUhXpTQf9wxEPBDXr08/Od1g6Ne8Ch+sEkpgK
	 JA2cR6JvCVobwnlhBE9fhRGMZ1h/I2Ogh9JiR16b1/jHwYtM+1IFaVeJ4FWi5ulbgL
	 fKooppqug/RZw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B4E117E089A;
	Tue, 15 Sep 2026 12:10:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Date: Tue, 15 Sep 2026 12:10:20 +0200
Message-ID: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
 - Mentioned MT6991 in the commit description for commit 2 (Mani)
 - Added comment to clarify that if one calibration is missing, no
   calibration should be trusted
 - Changed Kconfig to mention module build (Mani)
 - Changed header comment to add "Author" and change indentation (Mani)
 - Moved cktx_impsel, tx_impsel to the top (Mani)
 - Added pm_runtime_no_callbacks() call (Mani)

Changes in v3:
 - Allowed value 0 in calibration fields (as it's a legal value)
 - Fixed duplicated LN_TX_IMPSEL_{P,N}MOS writes
 - Allowed -ENOENT for nvmem_cell_read_u{8,16}() calls, as the
   calibration data is effectively optional
 - Removed two development stage leftover unused definitions
 - Moved num_lanes check in mtk_pcie_sphy_get_calibration_data()
   to reduce indent in probe function.

Changes in v2:
 - Added items/description to reg in binding
 - Added missing pm_runtime.h inclusion
 - Moved pm_runtime_enable call to before registering PHY
 - Fixed pmos/nmos variable size for 5 bits calibration values
 - Fixed calibration for single-lane PCIe, as in, the ln1 rswn
   calibration nvmem value is ignored in code if it's single
   lane and will not return an error; this is due to the fact
   that, effectively, single-lane may have a zero calibration
   in tx-ln1-rswn which is fine, as that'd be anyway unused
 - Changed calibration data errors to dev_err_probe and changed
   the "no calibration for ..." message to dev_info instead

This adds a driver for the PCI-Express Gen4 "S-PHY" found in the
Genio MT8894, Kompanio MT8196, Dimensity MT6991 SoCs (which are
all variants of the same chip).

This was successfully tested on MT8894 and MT8196.

AngeloGioacchino Del Regno (2):
  dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
  phy: mediatek: Add support for PCI-Express Gen4 S-PHY

 .../phy/mediatek,mt8196-pcie-sphy.yaml        |  93 +++
 drivers/phy/mediatek/Kconfig                  |  13 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pcie-sphy.c      | 561 ++++++++++++++++++
 4 files changed, 668 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c

-- 
2.55.0

