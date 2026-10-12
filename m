Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A3E4D488D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839368; cv=none; b=R03eVCac0CuVDGgtWbmgzvNB3ID+4X8gSvmt6cFVbfEMpN6TJ6+kiOhE1ZJz3+0PVlLBnahXSwIjzoYHwrLVQV9ma3/AiWftX5GppNoxRPnWW1uL9QYWbuz7Mr61A5q3VX/tWmmEyQHAmyf96QQVLTx0jDDyNE46u+MnLmMN6TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839368; c=relaxed/simple;
	bh=GB2E/BfJcJbD6I25FH8PGUoUJ9L7F0ZWocYzS/+denU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvP32ErIciQRKgXcdsG9+ewaqfdPfLmgaeLvRrku2DqyQ8MWrp9nVttCZurhP75t1BIuAlENE+uKB4Mrn3jW2buDfXeprzXjzkS1XfnuF8wI6AvrBtikkkKUClFjwDdUFGnaOwyj4CbsrizVZMjz9wgl/OQErZ9PKuFw3bD2aWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 210D971FB45B; Mon, 12 Oct 2026 23:09:24 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] nvmem: add missing HAS_IOMEM depends on some drivers
Date: Mon, 12 Oct 2026 23:09:16 +0200
Message-ID: <20261012210920.911354-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261012210920.911354-1-linkmauve@linkmauve.fr>
References: <20261012210920.911354-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At least these three drivers access MMIO and weren’t depending on
HAS_IOMEM, which could cause them to fail to build with COMPILE_TEST on
architectures without MMIO support.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 083a5e528960..e614d56ff7a8 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -303,6 +303,7 @@ config NVMEM_MESON_EFUSE
 config NVMEM_MESON_MX_EFUSE
 	tristate "Amlogic Meson6/Meson8/Meson8b eFuse Support"
 	depends on ARCH_MESON || COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  This is a driver to retrieve specific values from the eFuse found on
 	  the Amlogic Meson6, Meson8 and Meson8b SoCs.
@@ -313,6 +314,7 @@ config NVMEM_MESON_MX_EFUSE
 config NVMEM_MICROCHIP_OTPC
 	tristate "Microchip OTPC support"
 	depends on ARCH_AT91 || COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  This driver enable the OTP controller available on Microchip SAMA7G5
 	  SoCs. It controls the access to the OTP memory connected to it.
@@ -354,6 +356,7 @@ config NVMEM_MXS_OCOTP
 config NVMEM_NINTENDO_OTP
 	tristate "Nintendo Wii and Wii U OTP Support"
 	depends on WII || COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
 
@@ -366,6 +369,7 @@ config NVMEM_NINTENDO_OTP
 config NVMEM_S32G_OCOTP
 	tristate "S32G SoC OCOTP support"
 	depends on ARCH_S32
+	depends on HAS_IOMEM
 	help
 	  This is a driver for the 'OCOTP' peripheral available on S32G
 	  platforms.
@@ -415,6 +419,7 @@ config NVMEM_RAVE_SP_EEPROM
 config NVMEM_RCAR_EFUSE
 	tristate "Renesas R-Car Gen4 E-FUSE support"
 	depends on (ARCH_RENESAS && ARM64) || COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  Enable support for reading the fuses in the E-FUSE or OTP
 	  non-volatile memory block on Renesas R-Car Gen4 SoCs.
@@ -508,6 +513,7 @@ config NVMEM_STM32_ROMEM
 	tristate "STMicroelectronics STM32 factory-programmed memory support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	depends on OPTEE || !OPTEE
+	depends on HAS_IOMEM
 	help
 	  Say y here to enable read-only access for STMicroelectronics STM32
 	  factory-programmed memory area.
@@ -530,6 +536,7 @@ config NVMEM_SUNPLUS_OCOTP
 config NVMEM_SUNXI_SID
 	tristate "Allwinner SoCs SID support"
 	depends on ARCH_SUNXI
+	depends on HAS_IOMEM
 	help
 	  This is a driver for the 'security ID' available on various Allwinner
 	  devices.
-- 
2.56.0

