Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A77239CCE3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365009; cv=none; b=R0ieBxz5RI3mbp+GE50ufEjaolz8Yheu2VRkKIvygSsw/MMcg2kMT5YO4cScNRMkJdaf4DfRnXFJpA0Gc40Zl96dNFWUzzQF1dghRrSCXQ8fYq53fyzJawnxfXmg1HernLMroH7/sB4MwxIhZUuBSel4v2OQtJP6L2dcQnmawa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365009; c=relaxed/simple;
	bh=d0YA/mOtU9gtdFlzULhJnmKciSi4FjAwPe07XrQJ3Ak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lCccebVtqovVIPhi/Op6tMSDx6jLjlcM1ainpwDs/nZRO/uNfUkTWr86k3KnFRwaQHzSVIzlotctdOXz+4BQVW+m1zJBGhoZ2i1lcgXd/Wi3slSozIwetZoi0rEiT1KLmiSMCxdGlPohSnOYuyMQAkWfDBmFp++W9EKwHZfE4lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3WBWwrf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3WBWwrf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd9cbb661bso13055855ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364914; x=1791969714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE0R4zsEX//GEmygpcVf0XYVSLwXzC42OSXnTiFb//w=;
        b=h3WBWwrfJA9VRBjDSToW0joxh3ttnYTse3UUx1KrRUdd+EtK8ijvBT7044w1kD+Pnm
         rrjmslwNaTDwjHlZG8TQKNvyzCDV9vD6AB1NEr4lcB88Mh1+DnDRKMkdXVymInAgBhqz
         WjpvaTT3RcCT7hpFfzQ6pWKMMKW2yWcYlJTA3sq+SuXtzUHzmZj7CQVwUDvsKR4vYEgq
         HZ/gZvtT1/h+G6XG1y9ob3hYHjUCz2/+YivowwYVa8/rWge97gPi4JoATEOGB/z1iegx
         O6J5RaOUNQumZdM1jcWI1MDju2wz3jKTfTERyiLNuCy/I+BVkRPmLiGm7axhI0RK6yka
         UJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364914; x=1791969714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE0R4zsEX//GEmygpcVf0XYVSLwXzC42OSXnTiFb//w=;
        b=ARxAOUjO2MNF8I6/UpBxRXzGovpdCzbmzL6W1E2mrAuzbkPm82njoPwqgLTLafKShq
         cjnc85CqBwR4dN5pfuL8zdsaHjbyI5zQREFBtcLGjyBmZnT6gNYLYxXP5x6K4zhgJjF0
         o5pZMf+KCiwe6U+W25vcegTpUkVUMu0wjYrUnVvWUmrLQL6vNZJL67gwWPb6wiwm1QW3
         AgLJ2evJNegr5GKfdp6UVgiuRthekRE8Kuj5ARg6nHgFamFLtqsmxvbWXhWAzKEo9qzZ
         aVdQIjn5Q68SKH4QVLTFZIJ8xtVkmDsezPrs/JzIFsPPBUfW5e2qVomjGtEN4tLknelH
         KJbQ==
X-Gm-Message-State: AFq9FYKGnkEMqWzalJEs14v16D/pm5ddqhY6T2ovbpj3U0mPV+x6jbih
	VotO6IKKfSrfGKD3xF/Qo+gfu/4j2v38Btmvf49Y0qYxsDGu2tFMIlEy
X-Gm-Gg: AYBFou1lhVWwv1RAjzJgVpHYe+cQHLYr+QOWdvDoc/X5O70LQ1qRwo7qMLzFrHbDS9h
	KuE1gk6OgmKw8QHwdGv5JfWFEy2CVJBI0C/EMVRoDvw1npFqdJqyMNLO2MfHWxR8qvaioYPkxU9
	hl0u9qe0WlHPZtfpkaxS+ncmtNLLVY3o5jZ8eU8h4opnXE/2GXIHlIpC5LLDcWmfirlDACr/4+d
	qud993sS9FBYc6yvk2TQVHyxK2bHqmXlprtGQSf9vk9NVKWViwRn2g9nc3xRa2Ktt25wyN6yzxr
	3cg2JDZ/XsHTEDnPU4GQfvLcI/iwhiQE+w8W8VEz3f0yhJGpChjrv2LR1xMGXvefQUuN0QwYWUc
	DC7Ad67eU92/VGI+5Z3yL4II3NTkthYCtCz9rnyCEHHICkNVYlSv7CZQyiCZW+PSsiAwQ81P+uA
	tLtB2yYql4nl1GVdkyp6OovE/2uCj692i55tuap+y0J7w37jY7QaGtoCJor+fiQb5TtNyKxtBef
	HqigqwoqcAF0q4CZStTk4fPI2IQ4R0bCGgXIH9v
X-Received: by 2002:a17:902:cece:b0:2dd:c053:9c6c with SMTP id d9443c01a7336-2e6004e89d2mr14736725ad.34.1791364914009;
        Wed, 07 Oct 2026 02:21:54 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:53 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 12/13] mfd: nct6694: Add a Kconfig symbol for the USB transport
Date: Wed,  7 Oct 2026 17:21:01 +0800
Message-Id: <20261007092102.3768818-13-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Now that the sub-device drivers only access the device through regmap,
the core no longer depends on USB.

Build the USB transport under a new MFD_NCT6694_USB symbol and keep
MFD_NCT6694 for the core. MFD_NCT6694_USB defaults to MFD_NCT6694 so
that existing configurations keep the USB transport enabled.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- New patch. Split out of v7 "Rename driver to nct6694-usb and update
  Kconfig"; MFD_NCT6694 remains the user visible core symbol and
  MFD_NCT6694_USB defaults to it to keep existing configurations
  working.

 drivers/mfd/Kconfig  | 20 ++++++++++++++++----
 drivers/mfd/Makefile |  2 +-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a0d9d6ccfb0c..de7d2171f514 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1167,18 +1167,30 @@ config MFD_NCT6694
 	tristate "Nuvoton NCT6694 support"
 	select MFD_CORE
 	select REGMAP
-	depends on USB
 	help
-	  This enables support for the Nuvoton USB device NCT6694, which shares
+	  This enables support for the Nuvoton NCT6694, which shares
 	  peripherals.
 	  The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
 	  6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
 	  PWM, and RTC.
-	  This driver provides core APIs to access the NCT6694 hardware
-	  monitoring and control features.
+	  This driver provides the core support shared by the transport
+	  interface drivers, at least one of which must be enabled.
 	  Additional drivers must be enabled to utilize the specific
 	  functionalities of the device.
 
+config MFD_NCT6694_USB
+	tristate "Nuvoton NCT6694 USB interface support"
+	depends on MFD_NCT6694 && USB
+	default MFD_NCT6694
+	help
+	  This enables support for the Nuvoton NCT6694 connected through
+	  its USB interface. The driver uses USB bulk transfers to send
+	  commands to the device firmware and an interrupt transfer to
+	  receive its interrupt status.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called nct6694-usb.
+
 config MFD_OCELOT
 	tristate "Microsemi Ocelot External Control Support"
 	depends on SPI_MASTER
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dfd81356b485..a42b99250454 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -125,7 +125,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694-core.o
-obj-$(CONFIG_MFD_NCT6694)	+= nct6694-usb.o
+obj-$(CONFIG_MFD_NCT6694_USB)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 
-- 
2.34.1

