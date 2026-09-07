Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B95140682A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763740; cv=none; b=kAr0V3vG/O2KA0sWrXFXLCvDdvEght97yu4mqjvmWp7z7obT98+u84XfP9vT9nN93L4Yp6OIlMxNEb18HP6X1TINUlUmO2IzIwe5oT6MNyoOL/biezLjQSpN3cg+uqNhvBXjn8u5WyyJLOTLVQF+jqeiWRBnoWr6lSKx8eJmEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763740; c=relaxed/simple;
	bh=aiuck1QhxVta/kFDtwPFBT7fTbtOzo1NiRkLhMcEXbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hR04aihNYkE481hF96rTYMH4bgMsINWvQLa0OVgeY+pS1AAg19XKJlMvNQTTCc/En426S2drE8ch8FYWD+v36TIjWzyvKuzGt1+1CZ6R7gw5ECoHfDTgVm8gn+uRwykQis+uXqJAcFxCDftOFvkWu0/NlGG/v0ZAfiV1d+ufqfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nq2CDLJq; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nq2CDLJq"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso2263163a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763738; x=1789368538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rtoq7BEyavTGfZjSp7IB1b4Ruu54qj5DkL46/QVJ8UQ=;
        b=nq2CDLJqPeQyJvpGElBuZCiUY5t7B64+V77BJGMPxDh44dWWesHRMDFjYd512R2N5E
         DXNw3TM4t2RBrZi/9asE+tz9z1GWi4uu9VHN0PbJPWOelWHk3CiimCoLaRW5M5RgxbFq
         F3uT8mc85XjHUohvTKXBOJ+kJ7ferfomIFf9at3JQV16VCGnb1oVKrJ4NHfbFg2z88Be
         1e3OMzYTuDBnZU4pW1B2PTkK9MRHdhLf4OXM8Cr0qgfxiG8jh7RFhkFPcDP+H+Q6AMk/
         +/eAgNHaQlleGkd06clgqS/7oOS6ysnDufmtyOtKL/mkbP2tAOxBHet+VtwIX2F2cwD7
         HCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763738; x=1789368538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rtoq7BEyavTGfZjSp7IB1b4Ruu54qj5DkL46/QVJ8UQ=;
        b=SdJfOFjz1kd5V0YZ5DAbLAo1tLsefJvlHaX9yMFIjU4rZLWwZtaEKDIUtWbrXMttrh
         bUMafaevXtuqlnruOeoIiB+sPwvR629dCdDB/XWMenZkcIAjX/qMUkHW8YKFyhImh1Nc
         W8zeybMdGn2HTNrsAmKOwP/fMKV5gEzwF/G4wWgt+AufsibnjqL5VwAEb0TXk+dtBFm5
         PqLdORp2bG+Vboc+64OtHKWdQYJS6JdzYqFERazFP3CkMobJmIvmh394AJq4mkotL7CK
         18QCpRD88qfn/EXQQ1soTkIlNyWyTQyrWJAAcWTWgRjklZeu1SK844nyaUkR1NpsZNRG
         H+Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxbMmKR7Xph0IVjLqimlgL5jKC3XAGytv8hvrY5lJRJcLU1TAKg4vOePqdE8lxc6WnMK1sV0ixIJVbky44=@vger.kernel.org
X-Gm-Message-State: AFuF++nfo5Mt8aGCOllTO6T9j5O6eXLRSOp7jOv8kDvYsdKuJQ/e7IYp
	glthzofoY2kU554Hk3+i32/ZI9AARx/K/t0BJbmdzNv7sDoQsdv8VNVR
X-Gm-Gg: AYBFou0RG7d/kDwqDLacFeYR498sMRIis0EkR8q1raiAmuob2WT2AKdBbbzIwB2V2F/
	RLe1wsHufHP17vnl3DMKdju1Jo7ZrXa0/FFmCvV39Ib/baYBgUf63SYUe4rIxWIhgEvowl2KgfK
	lI2svhdO95NBz9jFnpwNONRKEmPfoyyTaPLRpqOZhgIEDTD75AEne2Z9JOmNz9IMQzuPnsynb4P
	d6NZ3DMQjLEAL7en0pZ6k4H6um2FJjOhm9/JB39Fl26+DPw0v2PkBzAzF5+g/c863cihNh197K3
	Jk772m7hCifOvZ71nZ+PEwS9qU/ghdXNqBa73z9u3+mXbcFWfxlEL1V607GEfQJXI4WzSMABZkh
	0hF3A+7vj+rgbdwosSdzzxNuWfouT6HkU127YHGWBR1DlDWgZTtH/hKsjx49VKun7rbaOWY3pLR
	8V9dRw46vCvSxoIYZnclQUuaYfaN2j1gPr1HY7b09KkzxNfceoxNY63GntzYR347cEkTUrAPtTv
	Gm1/jVzzwDKCw==
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr35180041a91.4.1788763737558;
        Sun, 06 Sep 2026 23:48:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm25057807eec.26.2026.09.06.23.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:48:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Paul Walmsley <paul@pwsan.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] ARM: fix typos in comments
Date: Mon,  7 Sep 2026 12:18:49 +0530
Message-ID: <20260907064849.23086-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/mach-imx/suspend-imx6.S           | 2 +-
 arch/arm/mach-omap2/omap4-common.c         | 2 +-
 arch/arm/mach-omap2/omap_hwmod.c           | 6 +++---
 arch/arm/mach-omap2/powerdomains7xx_data.c | 2 +-
 arch/arm/mach-tegra/pm.c                   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend-imx6.S
index 63ccc2d0e920..3f8670296358 100644
--- a/arch/arm/mach-imx/suspend-imx6.S
+++ b/arch/arm/mach-imx/suspend-imx6.S
@@ -234,7 +234,7 @@ set_mmdc_io_lpm_done:
 	 * mask all GPC interrupts before
 	 * enabling the RBC counters to
 	 * avoid the counter starting too
-	 * early if an interupt is already
+	 * early if an interrupt is already
 	 * pending.
 	 */
 	ldr	r11, [r0, #PM_INFO_MX6Q_GPC_V_OFFSET]
diff --git a/arch/arm/mach-omap2/omap4-common.c b/arch/arm/mach-omap2/omap4-common.c
index 5d924b85b694..633451b6f548 100644
--- a/arch/arm/mach-omap2/omap4-common.c
+++ b/arch/arm/mach-omap2/omap4-common.c
@@ -96,7 +96,7 @@ static void omap4_mb(void)
  * interconnects.
  *
  * This situation can happen only when the idle is initiated by a Master
- * Request Disconnection (which is trigged by software when executing WFI
+ * Request Disconnection (which is triggered by software when executing WFI
  * on the CPU).
  *
  * The work-around for this errata needs all the initiators connected
diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 03cd523dff87..0f4ba19804c6 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -646,7 +646,7 @@ static struct clockdomain *_get_clkdm(struct omap_hwmod *oh)
  * @oh: struct omap_hwmod *
  *
  * Prevent the hardware module @oh from entering idle while the
- * hardare module initiator @init_oh is active.  Useful when a module
+ * hardware module initiator @init_oh is active.  Useful when a module
  * will be accessed by a particular initiator (e.g., if a module will
  * be accessed by the IVA, there should be a sleepdep between the IVA
  * initiator and the module).  Only applies to modules in smart-idle
@@ -674,7 +674,7 @@ static int _add_initiator_dep(struct omap_hwmod *oh, struct omap_hwmod *init_oh)
  * _del_initiator_dep: allow @oh to smart-idle even if @init_oh is active
  * @oh: struct omap_hwmod *
  *
- * Allow the hardware module @oh to enter idle while the hardare
+ * Allow the hardware module @oh to enter idle while the hardware
  * module initiator @init_oh is active.  Useful when a module will not
  * be accessed by a particular initiator (e.g., if a module will not
  * be accessed by the IVA, there should be no sleepdep between the IVA
@@ -1706,7 +1706,7 @@ static int _ocp_softreset(struct omap_hwmod *oh)
 		return -EINVAL;
 	}
 
-	/* For some modules, all optionnal clocks need to be enabled as well */
+	/* For some modules, all optional clocks need to be enabled as well */
 	if (oh->flags & HWMOD_CONTROL_OPT_CLKS_IN_RESET)
 		_enable_optional_clocks(oh);
 
diff --git a/arch/arm/mach-omap2/powerdomains7xx_data.c b/arch/arm/mach-omap2/powerdomains7xx_data.c
index 921cb1b29cb4..df13451bd0f4 100644
--- a/arch/arm/mach-omap2/powerdomains7xx_data.c
+++ b/arch/arm/mach-omap2/powerdomains7xx_data.c
@@ -223,7 +223,7 @@ static struct powerdomain mpu_7xx_pwrdm = {
 	},
 };
 
-/* l3init_7xx_pwrdm: L3 initators pheripherals power domain  */
+/* l3init_7xx_pwrdm: L3 initiators pheripherals power domain  */
 static struct powerdomain l3init_7xx_pwrdm = {
 	.name		  = "l3init_pwrdm",
 	.prcm_offs	  = DRA7XX_PRM_L3INIT_INST,
diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index b21f51b8e19e..d7bc21bdb519 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -257,7 +257,7 @@ static int tegra_sleep_core(unsigned long v2p)
  * tegra_lp1_iram_hook
  *
  * Hooking the address of LP1 reset vector and SDRAM self-refresh code in
- * SDRAM. These codes not be copied to IRAM in this fuction. We need to
+ * SDRAM. These codes not be copied to IRAM in this function. We need to
  * copy these code to IRAM before LP0/LP1 suspend and restore the content
  * of IRAM after resume.
  */
-- 
2.48.1

