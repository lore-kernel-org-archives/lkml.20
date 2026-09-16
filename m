Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF0A4E8E03
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555792; cv=none; b=J8Ku5b4i3WHh+JxADGKxqiCs7NhBGwXHruSjAnxu1iKgohHGfXdyArqHkGfm1qItiF5OQWqRFQnbgZRK/ApyYv0B1SC5mbBV3+AtmVVryzEfaEgS2z+HYOh8tdpqXo0H+Tp2MaMVVuGGvmwVYc6hOGh9S0Sqexm/3GL2d09OV9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555792; c=relaxed/simple;
	bh=srp3ADG1b1oZGPE/2ZFZo640T4qzsA76NYnMKoCWgn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nlldbUWbLjplLBZpy2XNm8gOnfd9xh77yuzdKZQNHKKZo/WghtHmWO9QFaD052ILDgtAKODVOgaLohk1vj4R6r4vUOPA0K3YkJsdu1mLRh35aAFpWGgidMdIyc8/t1m8qWq7d9HrlyNVOvJNuOzMxB2MuC1WsXUADcKtEGQpPfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=tCOOCu9+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="tCOOCu9+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so4470825e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789555765; x=1790160565; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPrmKt6fjdtzKQMfjHOce8MoH8Mwpyf4BPOVo+W5EYI=;
        b=tCOOCu9+ZnksjUB4LpWPRNhpcKunYzj9FHBdc2MJcWFDA6eGqyHSjPChu88/GSAzxQ
         oS4qoHurJQYh/tiHcO6zqk5lhdDXNFl2cTmvezZVk3MHeWqCoaFg1mXA5of0wz6SIcFy
         t0X0KCs8R7ttSXm0t/tcauCGP05+PEeQ2Nlq3SGGPH/a8NnhX9qTwarRe35fo8XjFZ4X
         dvypzwfSaL9KshmEbFt00LVO427/Obkz9ddgW3PZtutm5MgZLdMvboBuBK7NVUCevWCn
         x8d1jUNCC+acNoPwLbleSBvIGHqEMS5GC/iarkOuTVAFtyQfcVU5YXd/JDugoLDgXRHu
         r1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555765; x=1790160565;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPrmKt6fjdtzKQMfjHOce8MoH8Mwpyf4BPOVo+W5EYI=;
        b=sn1hHIe/2Im9Dg9nKPFpZCu7cCm/HjZUllbOfVqncyKvIKxqcNwdtylyE/OJxNuSxo
         wu4PK1ggIhghZSrZ9VkpcSH4hsiE/GxVB2qVSWXw/NmaErxTnAH/13/qFCu0n0+4iVfA
         hzz/r3LCtSWQrxcvdtuupJa7Zo0Zv7zUZDSfaL8wgYYs1xbAbyFVf4pUem0UErvhIse9
         zkivQQeKjy4bCTrCDXfSCuUGUBM/qgoYK/Hd6Q0NM9mq/oBybdGUYgK0lr9ojNzV10x7
         nAanVS1GAjY4zFaBcH1wkJ5OklOrtU6rtssDQmpEhM/yiXMpzvc65zLNYNcC0Iw7CJE6
         DSBA==
X-Forwarded-Encrypted: i=1; AKwUvBzmHkW0wekMRP6d+0ptY9t5AVQ1t8UHILrA8qgzA4i2TmFq8lrKFGc81TVCzMArLW5dbDCM9u9Kpi5hK+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lw0hVKfK96bE1riDxzap/Va7SkKbN8pusgV7C3qP/ku7Km4UL0
	3TvtQ+FK/HZ4xE+UoybhQJUnErta+hyVaPLIGhp+FprG4oQPQ49/0F5MiiwjRdoqWwQ=
X-Gm-Gg: AYBFou2fMrot3lJ3cwtBFZ7hhQTwtYsl5S6KEYh7XDAq2juWUu2gukbZ6fekvpV/Zvr
	FYq+NMqfN0lTDD+tYWE/Yxo8X4+tfC0+gl/PJUYW0VY2RF6x/AHrYdrOUDpHmDf3LxoX2nSghkk
	P8ej8wPbIMOlT82/sxzcIslwKlsV9ygePbGVLasHvLgfsNfxEABLhH/D7NqXM1ahIa38RoyIAjO
	reIVA7oZImZlgv66+PGdMiOWQee8GnA7aO2sR4UmQJU04EXtqorbfm9l9h09evik5LXiPDc7oE6
	YnAuPhoWWtlJC/rGW2dzJrmf57nHhQUfK10WdipSAayqvn0OFj0y1Myr4E6Fh9+a8z/lDPTmAcn
	sqnNb7S6wE5iITq007MdDvlIkNLUhoG02s/nveu70fWYksFeQkzLC/HsL0uzGWxGWCBQhwDFWE/
	Zde8oYx6YtXlsIqyWUnIqPs7dET5qBlMy+RGhgQaTpEMX86wKv3GV/pfzIpqzOTAZ8Il9L3Pyqm
	SiPFyINN5VZ558=
X-Received: by 2002:a05:600c:46ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49eb7339895mr43206945e9.13.1789555765101;
        Wed, 16 Sep 2026 03:49:25 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef766dsm6157208f8f.4.2026.09.16.03.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:49:24 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux@armlinux.org.uk, dvorkin@tibbo.com, wellslutw@gmail.com,
 linusw@kernel.org
Cc: arnd@arndb.de, afd@ti.com, aaro.koskinen@iki.fi,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Wed, 16 Sep 2026 12:49:19 +0200
Message-ID: <sa6bj9x31zk.fsf@dev-ag>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
help text suggests that the user can build it as a module by setting to
'm'.

However, it cannot currently be set to 'm', because SOC_SP7021, the only
platform that supports it, is a bool option that uses 'select' on it.
Also, the SP7021 requires this driver to be built in, in order to boot.

Change the tristate to bool and fix the help text.

Tested on linux-next-2026-09-14 on a LTPP3G2 board.

This impossible tristate was detected by kconfirm, a static analysis tool
for Kconfig, by Julian Braha <julianbraha@gmail.com>.

Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/pinctrl/sunplus/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunplus/Kconfig b/drivers/pinctrl/sunplus/Kconfig
index 69f82590f6d2..aa9435d023d8 100644
--- a/drivers/pinctrl/sunplus/Kconfig
+++ b/drivers/pinctrl/sunplus/Kconfig
@@ -4,8 +4,8 @@
 #
 
 config PINCTRL_SPPCTL
-	tristate "Sunplus SP7021 PinMux and GPIO driver"
-	depends on SOC_SP7021
+	bool "Sunplus SP7021 PinMux and GPIO driver"
+	depends on SOC_SP7021 || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
@@ -16,6 +16,4 @@ config PINCTRL_SPPCTL
 	help
 	  Say Y here to support Sunplus SP7021 pinmux controller.
 	  This driver requires the pinctrl framework.
-	  GPIO is provided by the same driver.
-	  To compile this driver as a module, choose M here.
-	  The module will be called sppinctrl.
+	  This driver also provides GPIO.
