Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497592;
	b=Y9rzbFCNJvkRqA/92kSR54ytriwAPHIS5rmkLWBpwg8uvn4EL1BcvxETBVMDJDVixkOH
	 dNsGCLomaIl+6MqM7+kyGFVLtaYLBtZQ3HJH047Rg4Jr3p4h3+Db7xCXpevSRY5eb9qpX
	 B7hGR30KA4zAPfJCRMXlnAEM8qcw2IUgH+BDkD6rIL5Fb137slrahK26PC/dDc4UqV/Sp
	 V7aThF0BHCuEH1AXoq5PxP33Z6lGN+GgipwDO4R1rw9HiYnRlLfW7dIpoJUaPTlFnLgG5
	 IjJkwnOXr6bO8ers2AZLkKXEVk/X5HfYI6CfDURp7eMUxFv/6YYdoyQwMwkdNHRfeGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497592;
	h=DMARC-Filter:Received:Received:From:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=46IyvM73UruEFoU5tvYGZme473bX8sHtZFFnADjSTtM=;
	b=QgcjKFSg4ACXcgt8fj2Xrjl3XeiYPqgylkUVnSacVy7sn1vxU4p+wrfb/ORjNZPf1BLi
	 BC3jNa/56KuR8biHaMfV98n62oBpcHAR4LgxTINMJzXHliDPdZCiOnw7+hWYD/ngX8att
	 //lW8P1kQB2DdIkwDNk73WUbQYv55n/IqZqV1O8Eq+o3IV/dUGge2mZDr653mOHCHLpau
	 fF0YmSfAgWCvqrwOQDx+SkFL+rQZoEllMq+J2Av5zjlKJ6Z7H97jFd6PVbWImXABQvt1W
	 d2Hwum9uWjkUafK1q4FsiCE1pYycKA4FUPEKwd4RBnM0bdA2sWtouQMChk5gtTYJVyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D4606A31C;
	Tue, 20 Oct 2026 11:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Oct
 2026 19:59:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Oct 2026 19:59:50 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH v10 0/3] Add ASPEED PCIe PHY support
Date: Tue, 20 Oct 2026 19:59:48 +0800
Message-ID: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
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
X-B4-Tracking: v=1; b=H4sIALRX12oC/43R22rDMAyA4VcpuZ6DZEU+9GrvMUZxFHfJRpuQt
 GGl9N3nFrYUauguJfg/gX0upjh2cSrWq3Mxxrmbun6fBoSXVSFt2H9E1TVpUWjQjAikjsN0GGP
 YbQbp4mYU5aqKLfumdkhFyoYxbrvvm/n2nua2mw79eLqdmPG6vWFgkIAIAEtCJkNWofoM8nXaS
 NsfX8M0xNgcorSl9LviKs16qS0yUEUaSs1M7j81LbUHBGavdYmpZobndfVXI2gLnp3mEh2iwec
 xLzGifXzDmRWougroHVsTZJtVzKJowIxikuLEOQBhU6PJKvZOQZNRbFKqEGvYMkklMau4O4Ugo
 7ikALF30jQOpMkq/lcxgMgZxSelMeJ0SB9lgn1QLpfLD8KAQxjFAgAA
X-Change-ID: 20251103-upstream_pcie_rc-8445759db813
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792497590; l=6380;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=nsaiDKDcqqGMfom04v8aWN0Ba2aHC4xg9Hlr8F8E+a4=;
 b=5UFcNODqu9txzKJ83jT+ocQVK77jeiXxOQwW6FRy6eVJJanU2IHEeSn1chJJb642IbW+uncc3
 9ptecfQeVuOCKpvxaobrKIRy6f5IurkWzCJm1vmqhcJaRb1wWIu1tfS
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

This patch series adds support for the ASPEED PCIe PHY, including the
device tree bindings and the PCIe PHY driver.

Summary of changes:
- Add device tree binding documents for ASPEED PCIe PHY
- Implement ASPEED PCIe PHY driver, including reference clock handling
  and an AST2700 host bridge reset sequence
- Update MAINTAINERS for the new bindings and driver

This series has been tested on AST2600/AST2700 platforms and enables PCIe
device enumeration and operation.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Changes in v10:
- dt-bindings: add required 'clocks' property (fixed 100MHz PCIe
  reference clock) to the PHY binding
- Drop Rob Herring's Reviewed-by on the dt-bindings patch since the
  binding gained the new 'clocks' property
- Kconfig: allow building the driver with COMPILE_TEST
- driver: get and enable the PHY reference clock in .init(), release it
  in a new .exit() callback, for both AST2600 and AST2700
- driver: add AST2700 host bridge internal reset sequence around the
  port-type configuration in .set_mode()
- driver: make pcie_phy_ast2600/pcie_phy_ast2700 platform data static
- driver: fix ast2600_phy_set_mode() to read-modify-write PEHR_GLOBAL
  instead of overwriting the whole register
- driver: merge the identical ast2600/ast2700 .exit() callbacks into a
  single aspeed_pcie_phy_exit()
- driver: include <linux/of.h> directly for of_device_get_match_data()
- driver: remove the unused dev field from struct aspeed_pcie_phy
- MAINTAINERS: fix drivers/phy/aspeed/phy-aspeed-pcie.c file path
- Link to v9: https://lore.kernel.org/r/20260115-upstream_pcie_rc-v9-0-d6c82a1556a7@aspeedtech.com

Changes in v9:
- Remove '[v8,2/4] ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node'
  and send it separately.
- Use FIELD_MODIFY to configure register.
- Link to v8: https://lore.kernel.org/r/20251230-upstream_pcie_rc-v8-0-03598cdd80cd@aspeedtech.com

Changes in v8:
- Update the title of cover letter
- Remove 'default y' from Kconfig
- Change 'PHY:' to 'phy:' in the title of ASPEED PCIe PHY commit.
- Remove unnecessary headers from phy-aspeed-pcie.c.
- Add ASPEED PCIe PHY MAINTAINERS
- Remove applied patches
  [v7,2/7] dt-bindings: PCI: Add ASPEED PCIe RC support
  [v7,5/7] PCI: Add FMT, TYPE and CPL status definition for TLP header
  [v7,6/7] PCI: aspeed: Add ASPEED PCIe RC driver
  [v7,7/7] MAINTAINERS: Add ASPEED PCIe RC driver
- Link to v7: https://lore.kernel.org/r/20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com

Changes in v7:
- Add PCIe port into aspeed,ast2600-pci.yaml.
- Remove aspeed_pcie_init_ports() and merge aspeed_pcie_port_init() to
  aspeed_pcie_parse_port()
- Refactor aspeed remap pcie addr to aspeed_pcie_map_ranges()
- Link to v6: https://lore.kernel.org/r/20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com

Changes in v6:
- Refer to pci-cpi-bridge.yaml to update aspeed,ast2600-pcie.yaml and
  the pcie node of aspeed-g6.dtsi.
- 'dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST#
  group' have applied, remove it from this version.
- Adjust the defnitions in pci.h.
- Link to v5: https://lore.kernel.org/r/20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com

Changes in v5:
- Remove legacy-interrupt-controller and the INTx points to pcie node itself.
- Correct bar mapping description and implementation to PCIe address
  configuration in pcie-aspeed.c driver.
- Link to v4: https://lore.kernel.org/r/20251027095825.181161-1-jacky_chou@aspeedtech.com/

Changes in v4:
- Remove aspeed,ast2700-pcie-cfg.yaml
- Add more descriptions for AST2600 PCIe RC in aspeed,ast2600-pcie.yaml
- Change interrupt-controller to legacy-interrupt-controller in yaml
  and dtsi
- Remove msi-parent property in yaml and dtsi
- Modify the bus range to starting from 0x00 in aspeed-g6.dtsi
- Fixed the typo on MODULE_DEVICE_TABLE() in phy-aspeed-pcie.c
- Add PCIE_CPL_STS_SUCCESS definition in pci/pci.h
- Add prefix ASPEED_ for register definition in RC driver
- Add a flag to indicate clear msi status twice for AST2700 workaround
- Remove getting domain number
- Remove scanning AST2600 HOST bridge on device number 0
- Remove all codes about CONFIG_PCI_MSI
- Get root but number from resouce list by IORESOURCE_BUS
- Change module_platform_driver to builtin_platform_driver
- Link to v3: https://lore.kernel.org/r/20250901055922.1553550-1-jacky_chou@aspeedtech.com/

Changes in v3:
- Add ASPEED PCIe PHY driver
- Remove the aspeed,pciecfg property from AST2600 RC node, merged into RC node
- Update the binding doc for aspeed,ast2700-pcie-cfg to reflect the changes
- Update the binding doc for aspeed,ast2600-pcie to reflect the changes
- Update the binding doc for aspeed,ast2600-pinctrl to reflect the changes
- Update the device tree source to reflect the changes
- Adjusted the use of mutex in RC drivers to use GRAND
- Updated from reviewer comments
- Link to v2: https://lore.kernel.org/r/20250715034320.2553837-1-jacky_chou@aspeedtech.com/

Changes in v2:
- Moved ASPEED PCIe PHY yaml binding to `soc/aspeed` directory and
  changed it as syscon
- Added `MAINTAINERS` entry for the new PCIe RC driver
- Updated device tree bindings to reflect the new structure
- Refactored configuration read and write functions to main bus and
  child bus ops
- Refactored initialization to implement multiple ports support
- Added PCIe FMT and TYPE definitions for TLP header in
  `include/uapi/linux/pci_regs.h`
- Updated from reviewer comments
- Link to v1: https://lore.kernel.org/r/20250613033001.3153637-1-jacky_chou@aspeedtech.com/

---
Jacky Chou (3):
      dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      phy: aspeed: Add ASPEED PCIe PHY driver
      MAINTAINERS: Add ASPEED PCIe PHY driver

 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      |  49 +++++
 MAINTAINERS                                        |   8 +
 drivers/phy/aspeed/Kconfig                         |  12 +-
 drivers/phy/aspeed/Makefile                        |   1 +
 drivers/phy/aspeed/phy-aspeed-pcie.c               | 230 +++++++++++++++++++++
 5 files changed, 299 insertions(+), 1 deletion(-)
---
base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
change-id: 20251103-upstream_pcie_rc-8445759db813

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>

