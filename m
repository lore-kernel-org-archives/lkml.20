Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC2831716D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956636; cv=none; b=Yhu+4SApBax9pczx9s8JVath0fCIge2f+l2ocVLu8tHpBOkThiHfcvivkhIIJPOPEJDEhuvS2nEDkCL83Q/9OeGMuEZOn/GxdLE+hwVyRx7qLs7DN48QCxWbMq3lcrif7klB2fUmzpFLx/yIOotpBYECyso9k5aiR71WFaVIuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956636; c=relaxed/simple;
	bh=zPfkYPBRNDZAIPeOc1Bh7SiGbOZHjZUi09JwEfBFppc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xzza68OsN3M1GnxHH8H8MCovCCWThB5pkuTTe/5Ct7wiZzaYSG9/r9LtJNKfXxCBIQVL1tjFrUZ9JQ8qbZeFrNHmbXYs0yn17LEps6l36uHPVMtBj738MeqmTXWZKwmjeMg/fmCSjgeeDfvM7CgVBbUmjZq1j++dsLIAK819US8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=SkWb2vVc; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="SkWb2vVc"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-53331a61f71so71030901cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790956633; x=1791561433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyPIoRknc0baZODNB++KWg+6f+Pt5Q56HI9/cLH6iR4=;
        b=SkWb2vVcD6oHJh/MjEIPJpTTffb6x/iwpcIZgqgablj5WGTnr9GIha59HhH9l/Tc1B
         P2rrPdIFUOtnZvF3zJg6eBUUgXBHY4CY0A1Nmy/7siaxUeHQU8BmknLUBuGxievplIF7
         17FScLh75Jy0YTiZM5ZfmdbjZBOc6HgTFjtR1lWd9TFtWqG2UpfOJ6F2hxp9DcocpeNj
         7uUoomrldl8/fotk3U/JR2cfrv2HRpMz+vULryLbt4Pk6hb7LJSHC0scQyawoeDB18I6
         hHLCPt/9C2TPtqYwBmbsX5QdFUtWTFdAM4DndwcBl4AvSS6h3gPs6HSGw3D8OpDXwLvi
         KS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956633; x=1791561433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyPIoRknc0baZODNB++KWg+6f+Pt5Q56HI9/cLH6iR4=;
        b=OpoIl9xZyj8Z+K/R07vj3cgR3+ypBBqsUJqL6n5qpGHxSstZlfzw0Bllh5Or6YXW2u
         E+4ULyjA9eqCa2Mepqojh62q0cnimxwr5A721ycnZZiTJ201MF6Rg/kzMo424AOGtft5
         kpflXV1uCWfJw0oOraD0v4c7AhGaTxD9afBra1DQuWcof+BHZ5nQEbAarBvhQQ8W/2AX
         PHRuInbftQPIiMCCOtInh4DErWDM1n7V7b8dilGLcB5aCX9VY2+/joErfN7+TVxSQnze
         zzUPHiTH98iLRPbLwCI0xvJWaSzQpvVnBVrNy7yKNCCHCis28R1Dbb9u+i3Rk9fEx2dW
         74RQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIE7pmeOshZVfZf4IxYHzpbLD4TI7w+4QoJI/XBHf1C/jZzHjpDu1Qzd4O7S07KF9CxacRdyTPsl9T6Ts=@vger.kernel.org
X-Gm-Message-State: AFuF++msJ4M/J/DMrmsP3PrllXtg4DXCYD54pCd5C0Q3qe6UG/gJ6crw
	fjGmaAda5x9Bz17bzwlETyb6/Jza9sjilBusjwU8B6f7NrzjaIcAwRnL4nHN1MNlYPE=
X-Gm-Gg: AYBFou27i6Kxu9enRdzAYInAXDcHpIE6Cpt5PPvcvBXcO83Zec6Z6sPFjexs2lQd5Du
	CMgxsx9ETMVAAM/nGVMmpDg+n5Zl/q250yjjc5qPM0a2jeh9vCqGpUHKtWCMsm/ghJq1aMUp55R
	sCOs3xPrcHruqkJ9eUV462LeqIBbtKOkvVNHirAd27ptBzkAXcl3/FQu1XXfcHOBp/M0PT1EHsI
	OctRu8+fmvyDmld/t+DB5XOL7iZJZALJf4o2sLAwuA4m2mkvVP8ZXTh5+BozDvjyJUuicmcc7dG
	5pTjTr5tsaXSKI6SxWJAKlk4gtmsKQ1g2PNa/7nRO9ttolCgdTKqelrq//2K8M42xN029D4pf3e
	B6KnrNAqYKOVouPEWTJ7JszucyB+6DMyFETdd4EnE3Z9f/7PLKwzYcMfkCr9xnC9B8u1/vWBgro
	ujiKW7dr8sD7UcrwNbhwMByFY3e8gT1HAxNI4RwzSbGcJmbR/y1XEb1xpaabMLErQ0CACJlK4Tv
	s8uqe53UQbxIA==
X-Received: by 2002:a05:622a:e18d:20b0:533:99e2:fc62 with SMTP id d75a77b69052e-533cba67637mr42772341cf.19.1790956632781;
        Fri, 02 Oct 2026 08:57:12 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d41a3dsm29262531cf.29.2026.10.02.08.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:57:12 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: daniel@riscstar.com,
	bhelgaas@google.com,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] misc: Kconfig: tc9564: fix and simplify dependencies
Date: Fri,  2 Oct 2026 10:57:08 -0500
Message-ID: <20261002155709.492894-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564_PCI config option selects PCI_DYNAMIC_OF_NODES.  But that
depends on OF_IRQ, and TC9564_PCI does not satisfy that dependency.
Simply adding "depends on OF_IRQ" results in a recursive Kconfig
dependency.

A little experimentation shows that *depending on* rather than
*selecting* PCI_QUIRKS allows us to avoid the recursion when
depending on OF_IRQ.

Separately, PCI_DYNAMIC_OF_NODES is a user-visible option, so it
should be depended on, not selected.  Changing this allows some
further simplification.

PCI_DYNAMIC_OF_NODES is only exposed as an option if PCI is enabled,
so by depending on it, we can omit the dependency on PCI.

Additionally, PCI_DYNAMIC_OF_NODES depends on OF_IRQ, so we can omit
the explicit OF_IRQ dependency.

Finally, OF_IRQ is only exposed as an option if OF is enabled, so we
can skip explicitly depending on OF as well.

In summary, depending on (rather than selecting) PCI_DYNAMIC_OF_NODES
satisfies the dependencies on PCI, OF_IRQ, and OF.  We still need to
*depend on* PCI_QUIRKS, to avoid the circular dependency related to
OF_IRQ.

Simplify the dependencies for TC9564_PCI to just depending on
PCI_DYNAMIC_OF_NODES and PCI_QUIRKS.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610020124.ieOiopjQ-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202610021154.ObogJhHN-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202610021249.J94Hg1xo-lkp@intel.com/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 1304b0c47ef81 ("misc: tc9564: introduce base PCI driver")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/misc/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 9c5b1e9d672e8..f45b5ffa43444 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -570,10 +570,8 @@ config MCHP_LAN966X_PCI
 
 config TC9564_PCI
 	tristate "Toshiba TC9564 PCI function support"
-	depends on OF
-	depends on PCI
-	select PCI_DYNAMIC_OF_NODES
-	select PCI_QUIRKS
+	depends on PCI_DYNAMIC_OF_NODES
+	depends on PCI_QUIRKS
 	default m
 	help
 	  This enables support for two PCI functions implemented by the

base-commit: 04434a1d0f311d76b1f15fa987918b471a0b8c6a
-- 
2.53.0

