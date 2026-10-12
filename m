Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B304DA9C3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839368; cv=none; b=p0Hk373pScZHYikWFHkIuKiIpBQDlID/xbnSMkVZUBGyesDelwloVV5p/yFVyxuG6wcNxuc9U+yzx08xky2ZMIg3xSt9mBdJpIzpaX8FVH4g4v9X9TU617hB+uel5gwLX3R36+NQfGHt/jsvw2hcfBi8Vas/+tgpnO6QEgKvFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839368; c=relaxed/simple;
	bh=n1yWGQjSRbgHn/kKaTgcEBElWuhrMX+884nIW0lSaP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdmZ4vcGykgivOfh+IRoiYlaU9NQiXU4uuAi6HKpzLgcAW/imdjky757vMnyvi3iKT46B6tHHZJgvN0ObNAr6BTP4N9qyBwMNMjOOC8olXw5YVexaAc/OGPUqzax1puUOB+3LlCtFTDzHxTzcHSYREogf7hiJgUVTkutzxCbjCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 2914371FB465; Mon, 12 Oct 2026 23:09:24 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] nvmem: Replace eight spaces with a tab in Kconfig
Date: Mon, 12 Oct 2026 23:09:18 +0200
Message-ID: <20261012210920.911354-4-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261012210920.911354-1-linkmauve@linkmauve.fr>
References: <20261012210920.911354-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVMEM_QCOM_SEC_QFPROM driver was indented with eight spaces instead
of one tabulation character, and had been that way ever since its
inception in c471245bd9f25152e398fb49f65cf6e1ed7febbd.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index ed5b8e21ded0..ff6c4c04cea9 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -389,17 +389,17 @@ config NVMEM_QCOM_QFPROM
 	  will be called nvmem_qfprom.
 
 config NVMEM_QCOM_SEC_QFPROM
-        tristate "Qualcomm SECURE QFPROM Support"
-        depends on ARCH_QCOM || COMPILE_TEST
-        depends on HAS_IOMEM
-        depends on OF
-        select QCOM_SCM
-        help
-          Say y here to enable secure QFPROM support. The secure QFPROM provides access
-          functions for QFPROM data to rest of the drivers via nvmem interface.
-
-          This driver can also be built as a module. If so, the module will be called
-          nvmem_sec_qfprom.
+	tristate "Qualcomm SECURE QFPROM Support"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on OF
+	select QCOM_SCM
+	help
+	  Say y here to enable secure QFPROM support. The secure QFPROM provides access
+	  functions for QFPROM data to rest of the drivers via nvmem interface.
+
+	  This driver can also be built as a module. If so, the module will be called
+	  nvmem_sec_qfprom.
 
 config NVMEM_QNAP_MCU_EEPROM
 	tristate "QNAP MCU EEPROM Support"
-- 
2.56.0

