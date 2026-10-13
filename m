Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20BD4BFE8D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873252; cv=none; b=W3UNgdvksT3PBm+/ky0P+m4iOSikPLTSF4/CeC8DvWHRSk1f+9BJ6cEhWun6KNLWkz5MUw3MdWdB1uWoqjZoNfmyU83PJH27eJkHx/kfE8BHg82Tmx1lg0lF2DEfWANWv48cLb6n8wxrs7/BG6Rn3xffcVMrqzJ6GPurghEEgAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873252; c=relaxed/simple;
	bh=Qtd8muDZ583GPPiNwqXmbz1Hq3PEqQNJukN8yvtW0Ls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PrGanwl6bixgOWfvdSV2bO2QDTpiR/3wDyHKKumDLkQk7N0NkCLLr/Y2qzhwg8qQlL9phSR07+AkVPhjRVCebfW+6aPelvjVO6IlbGhIre2H9bm19TIkaK3I23hPhGC5If4lEpjaoR9HfaEToOpcO/yAd8bpiNAdvWbbS6IaGOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evEWBioo; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evEWBioo"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso754525a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873249; x=1792478049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgteruNmIFnnxJUKUfMJTxbBTmv9achvXjkbb9le4xw=;
        b=evEWBiooECEVCG5t5oBwuOxBVQbIpY5+dPFEUaR0gQtSh2Fo2W/n5Z0EszMOEVjiGF
         /UAuy4yiyT38Ew3XyaAUXG9av10eZbaw9klszhh18muXwCuxVBXk1nMOhBKW2quhNTRq
         tcW+sdN1JaXE9CpRZJHalKrOFQ8PSAnT1aj5cwVh1XvbApzRC2vPBsWn6kkCvYpXsn5O
         Cq98Q6DEH3qog3OaC2FroMESNzj3kaM05c3zz7rKynli6Qm693786Zj3IoAe82h1H9dU
         06TId5hw5qayLxEKJvDVjQZG67RzjN0HHLqwxwzNBXiSyt7LNcukdTNbWS22L7kGmsyx
         ZBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873249; x=1792478049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgteruNmIFnnxJUKUfMJTxbBTmv9achvXjkbb9le4xw=;
        b=omz9a82XxEve9cUIFhFEmCKN2wKSNJa8h2wFlmu2QkR82pwDYPujoDklFrUXbMP789
         al97KExO6ZwPW6mHQ0rVCxbiWhbGrFycUqSuHhjrQDE1WwuiyiK7ZBH9F7Acy4KhmYQe
         dNGsGtIN9MQOIU/Uv/84s9wYU74X6P4dsEm6xgWoESGCkwjPE2WXoYSkMHSUrBchjlAB
         CCxzJ+BknuPncXjBLF/Le3pFIJcgYalhwHNGWITK+VWjmVLk7+aYig6fenIN5aI233qQ
         cMs13OC/9VV0rFsPb5dsI4usMWFkekal3iShiVdIx3hMEqqyUS+2jWbIStkn1tRdizAu
         GBFQ==
X-Gm-Message-State: AFq9FYLHA/v1vnFFKZDeJZlzOEj4SjofRD8OiSvoExSfJPfp/1TqRVZn
	ZwW4HTyNxbbC+OuRCYaChktWnKOesYBEgs2Ai923GC+3i9tMeA627nrvv+YPDg==
X-Gm-Gg: AYBFou0+yCJEyIuU95AmYhSwzdwpWlnZAn1ibqIZ/Wcwg0V9B4yejkWxzenIR6BrZeX
	Io7FZXbzmA5K4RL8C/K0KLB7s0xDoEqeQSvfmADouzpLFq66hTpFkwhZcz8uT8FzGWyiJL/sBOO
	JnD3mtzzLFHFCqXe2D0FFpjcnuvW6s/j+BbRd9kFw4WlZR00z0pCqWfpvVrq0mE1dOo9ug5PJuK
	jJfhOprLC4X6+YblBC3FEUUUVvrYu5s1zwTH9jaFSYgkHhY/ZD5ErUaRm0f9vMU4IziZw9Z93bW
	dcyo0+z7rN+51E0H5NNYQvbQjelG34ZwhEd3ltQk6R+AEWOBnxex2RfiJl/s0T72tUPovgSWozs
	sQp4ocEFiTukhuQXqxg87xBGM8Hp99hJbvNuaK0h1FHRPD0YqEkjwUywFd4TSJAu4Mi/ZBbzllX
	GvUbtUH2tZJktuF3rOma1Qyl521uJQwQ3dfmoM11R2b7IKRgL/Er3EeoXqN4/JLYCa2B6EWfwoM
	GX97rnm+cVWC/8ZpijDuBm3E9zTGnDHSzBpvTLG
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr9259923a91.17.1791873249102;
        Mon, 12 Oct 2026 23:34:09 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:34:08 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 11/12] mfd: nct6694: Add a Kconfig symbol for the USB transport
Date: Tue, 13 Oct 2026 14:32:57 +0800
Message-Id: <20261013063259.2734757-12-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
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
Changes in v9:
- None.

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

