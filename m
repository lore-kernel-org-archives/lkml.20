Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815523B634
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904791; cv=none; b=ZGyYJzQBNsC5e6fxrGuqwrzUIfyWcWgVrVjGwjYCPwq/S/ayVZUUGfDv89Z0uNoZZ/j4iCJ7MWpMscDaVdhax0Kx7fkHUO+RM9FdbPAV7TrU4/P8eZAKKSE1BDD31Mp0p/H/uIhycI9pLVzJ30d22o1ii+ywiR9Kk41ijJsOxAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904791; c=relaxed/simple;
	bh=Q+j3UDObBBZKxzNODrS4nsARgFKDJeYd7KzHKQzHANg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rf0mnR4v8R6wSLoV+aPq3O/YG5L3qZjgi7BakTTZrHojb+4htK4Rfwt9+P72LxACYe/FpYiABxJ1c83YusGPOEDXYyiSod6n+yAdpTAaOfHT5HmI2huI6xdlI+hlbE/3ufnA1DdlsdzW6efIxtfxGDTgRsjvnJZmbJnuiEyOC2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JRkjL+Sx; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JRkjL+Sx"
Received: by mail-qk2-f38.google.com with SMTP id af79cd13be357-93cc8a412b4so34821785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790904789; x=1791509589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2AA8nsK6yGVbieGzGP1acY9x5Sm2bnl7C5LuPliR9U=;
        b=JRkjL+SxCsa51Bbn72sVix3OaP0NTjULWz1BqJyW0T+Sb7r5VhnAZo7mb9HpYk+lmY
         c/jsTTu21JONrnB42N5dfXBC6ypi0L1sZ30JpeEXLUXoAQLMdXoU9knqlW59e4TytljK
         6mcrx3M0eiw0hRnSuoP/5Lc7z6556XsKFIeCGtNj6nB2knJtOCSUft8vhBNjcfjVOd7x
         7viBpc6aTHP4DA/wyx6qpyNiwePJo7eTZYPnhae7g66J0jSJKxIrCdpYkVoBHTOWPEq3
         POMLP7mf3u6DUMAVGqZb9AfBcEuT+Y3sw26GRAgcrbZCWZ5ksh0SeVpk/XbmKNSxaQNZ
         a3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904789; x=1791509589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2AA8nsK6yGVbieGzGP1acY9x5Sm2bnl7C5LuPliR9U=;
        b=SM50VRvzjbqzNkpbnb89riu+bcKGxnnzv0ncIMtpfa3LjIdjjWxBpfo/olUr654z4T
         z/B5Gq5BryHweCUFtlbfPY+7HLfqUbbotFhC7oftuW6QObc+slpUmfRVz1/T3HJRpi5u
         cYhZ2qFvhPTrzs04+80Etsk1eAosHe+6cUDgBLogxTJQVHLJR9QcqjNXx17fRkQ5Js6j
         FCFkZQcCeL0NdZqeFpfWwJXI/VDX6Wdex8sAcS4EwP1bqIs7PAMyYJf1Pc0cJ90PMaBP
         h4ASht/ZiCNI8amtgfXAW4pq3wbnL3mCDe5rY0LOJatMO9IgsAUNGPSRY3ji3F86/aZE
         NhLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrRxYqiOfx7yCIIMoV2lnlpYWcgOerMwVGTM8y8uLKpB52TBaFa+I+k02wWcAn42JsjK88OfkIgAXNfg8=@vger.kernel.org
X-Gm-Message-State: AFuF++kQb1sFq+x+RkNfgSQ74GF6tfkyKwFvOexkTbIpO4Cgh46up4kr
	PIG87KEE7xHW/ERnDTGUiDgkETQKgtStKLSXcLEj9QiFV3aamL2sW5sPs3pAq1N4E+924FFtkdy
	onRcENwY=
X-Gm-Gg: AYBFou2JOzGIxi++x3YAhP4syEq/PrYUs/tC6N6Hj7+2EE4O+gkkoiWInYXL0nGzKbW
	YdwV8XsIOS1Ck0URJnIp8EAug0p/JUDGv2ODeZAj/lbpMyhXzqxwBRUpGwr93inIiPp78GcBSIp
	KLHGis8/dm4BFB1FWZy3aKw/0WZ/emRJTnnWA547Ukgg3AC7T6iHpBxjbJGHECyyZ9Xj5y8Man0
	kmjRWnf+hUYfroxnRo1D4xEzJJcimsR7QZem5g2YRZlD2sed77K8YR3NvOeBPi1jAE+iFMz0BLl
	Q76xuUam8ghV0Ncrk/d4qNlgeda2T/4EY5nmd5GlfTCZ2NGk4pDe9yMKNRwShOGXHJ9ox3z7AiX
	eaihhwnw3wtWPuNKGUAWEd0McM4utfwBxc4eKLZhbBP9g7LYt2lRtIHN9upCYVkzzNfePv6XlYF
	DAeBWIbFigOCgfFkzyiTJsOJ9ZFIlyRt0kFkTwYOh7Xvvb6Ga1UtFb8bFsAd1OXRemrgFCaxwVp
	Ec=
X-Received: by 2002:a05:620a:370e:b0:93c:68f0:f09b with SMTP id af79cd13be357-93ce7a85658mr210184785a.5.1790904788851;
        Thu, 01 Oct 2026 18:33:08 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca29e5e0sm95498185a.39.2026.10.01.18.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:33:08 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: daniel@riscstar.com,
	bhelgaas@google.com,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] misc: Kconfig: tc9564: fix a circular dependency
Date: Thu,  1 Oct 2026 20:33:05 -0500
Message-ID: <20261002013306.373689-1-elder@riscstar.com>
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

A little experimentation shows that the recursion can be avoided
when "depends on OF_IRQ" is added by *depending on* rather than
*selecting* PCI_QUIRKS.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610020124.ieOiopjQ-lkp@intel.com/
Fixes: 1304b0c47ef81 ("misc: tc9564: introduce base PCI driver")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/misc/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 9c5b1e9d672e8..87ea92af81dca 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -571,9 +571,10 @@ config MCHP_LAN966X_PCI
 config TC9564_PCI
 	tristate "Toshiba TC9564 PCI function support"
 	depends on OF
+	depends on OF_IRQ
 	depends on PCI
+	depends on PCI_QUIRKS
 	select PCI_DYNAMIC_OF_NODES
-	select PCI_QUIRKS
 	default m
 	help
 	  This enables support for two PCI functions implemented by the

base-commit: 04434a1d0f311d76b1f15fa987918b471a0b8c6a
-- 
2.53.0

