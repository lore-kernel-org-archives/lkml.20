Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BC84E06E8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839367; cv=none; b=pVZ8Lw8gnanCpDTTbbzs4YuWPm+dyccQddXW5mr1IOCXVXTWeEz/DpiDxWtbGdO8zogd+vzkcsgzOOA5x9jq7GPQEGQ6GQzYpnoOGwa3hpGRU4iq1/ywAUN1+cIAZ2lg+5hY2KzdOn4JzmZ6U3PT5rX1TJNrNt+uVaXOoDQtO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839367; c=relaxed/simple;
	bh=luX6/oKKuHPrDjYZ+nn//yueos+18SecsIXQt/0w5RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r4hv+zCWoYft/yn20y4s5w7rCEYZK41iyYRHXTk2aRuMXPp6QpfMv9vuBMwFgyDmQqahsVLlMefGBwXFlV0JAExn57J3w2WPwpAgzJ9/bMWprt8VJr++d8fvu+6+ONeA/lrHFOvcVCttfiTuYpx2i/bppaAVocUpwXodus6q2r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 2552471FB461; Mon, 12 Oct 2026 23:09:24 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] nvmem: enable COMPILE_TEST for more drivers
Date: Mon, 12 Oct 2026 23:09:17 +0200
Message-ID: <20261012210920.911354-3-linkmauve@linkmauve.fr>
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

Three drivers had a depends on ARCH_*, but didn’t also compile when
COMPILE_TEST is enabled, making it harder than it should be to test
them.

Some other drivers also don’t have a COMPILE_TEST, but those have
additional dependencies and I didn’t want to investigate too much.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index e614d56ff7a8..ed5b8e21ded0 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -368,7 +368,7 @@ config NVMEM_NINTENDO_OTP
 
 config NVMEM_S32G_OCOTP
 	tristate "S32G SoC OCOTP support"
-	depends on ARCH_S32
+	depends on ARCH_S32 || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This is a driver for the 'OCOTP' peripheral available on S32G
@@ -535,7 +535,7 @@ config NVMEM_SUNPLUS_OCOTP
 
 config NVMEM_SUNXI_SID
 	tristate "Allwinner SoCs SID support"
-	depends on ARCH_SUNXI
+	depends on ARCH_SUNXI || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This is a driver for the 'security ID' available on various Allwinner
@@ -582,7 +582,7 @@ config NVMEM_VF610_OCOTP
 
 config NVMEM_ZYNQMP
 	tristate "Xilinx ZYNQMP SoC nvmem firmware support"
-	depends on ARCH_ZYNQMP
+	depends on ARCH_ZYNQMP || COMPILE_TEST
 	help
 	  This is a driver to access hardware related data like
 	  soc revision, IDCODE... etc by using the firmware
-- 
2.56.0

