Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656B8357D17
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387622; cv=none; b=AZm8N5iRc4NU4mxj7BANIko0WzAX6XVIL8cFrxY7pupfZOGoyTElID7/nkiz0FkYuzNEJT0zUFxWPzcyxd4d2jod/84GFOToeyYKr6TIA8YaIfbRk0UGXEs9ocCSDC4C+0Hb0cxy1dnsqeTbzwlxrgw2YIZdAgsybIN9VTHSPPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387622; c=relaxed/simple;
	bh=vxK97kKjZ3lVGvkiTJiojCl0+uWyc0eS118X0/+w+oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NAHpSZOL7Yhq9KMsBwfiGUKxriPu9qrNfxKtmBDA0NojgyCb1LpCy86BAQI+bnP4FIuXfPuX35vOnezUnkgf8P1O8D8+22sunNY7/VMeTQioPFZxcJbjPcLHttws6ferMh0ghViFrF52dowlG8N8fFfo2uwqp25C9ObPfYCf0V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGchz8ss; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGchz8ss"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39682983a0fso2132017a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387615; x=1788992415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fyRUPWtmRNwWz6B/B/Z+kuE2rtbBrZ9WaHMXlXktatE=;
        b=HGchz8ss+vmykX5lTYhANf5aiNgsxyniR9sbRgLsPuPoyCdclPb0zNGTQBnQDGtUyG
         M04YGByQ3qMPU+GQ34Id3MV9klgzscXN6Mm8Sv9j68lWMZ1Iav1GWwmEaM76czvyb9wM
         PxA2XNDZsCXdI1d6S3YfQZZS4joglROHbzC1fAbte9jqgGlLVZr2RaQvuD11+z1ymptc
         Uc2ecCE5XmietFZw0Sxuajwgoyto1pmycVk7YCe17r/zDyw7Ez1f3Lu6sizerAZXuEga
         ppTXAwHD3LxntS12ZjbEtezxgqjpamdkEFzPFFUbW945kFdnMoVTkWx/+05Zjfh6iDwG
         oqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387615; x=1788992415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fyRUPWtmRNwWz6B/B/Z+kuE2rtbBrZ9WaHMXlXktatE=;
        b=Db24k9mhund15lofBjRnb2KI38G9iP3My058zeT85QXK1KwmG9yUCh1aTGe2bL+5hv
         EmANE09viy0UtjmxWWS7VVIrzwxaQUiYu1oCiw48VX6vKph7x8FKx/tjtFubbcDBe+8o
         L2VDX2yXpANYa4rfVy1Jt4Fvk/nAUONeQf/bxY2yT+kkHqBblhO/7DS4ByAC81rzobe7
         poT9iMUXGfB9AYNWpPehPRCC3JjQfZw5NuJJqQpjQ835IPVabDzF29AJFvojKBzo15E8
         ANMid+PKIqaV9F5N8XQ7EeZsgpTsUy5U2XGZ3pmAroTxWVt5lysNTak+0g75sYMzilB3
         rjqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn18tZRp1qcEooWeQe/iUwe7lFknqM/Df0e9TwCMnJIOuRk/NJqoHdRxc+Biy9jldaeGrgPm+Bk3qDh8w=@vger.kernel.org
X-Gm-Message-State: AFuF++ntCnxxccMaWzJshfpxK4DC8R/tO8dE4WerMqiM3RIhW1hRQF5n
	9IJvyquDO7mcIqCppt4Jz2YNBEglobnWZiwUEXXB07beEvMkddnq0fls
X-Gm-Gg: AYBFou1oTAkP3fUQC4RRqnn043ZQ2TCSv4xLXpRGs0gKOM6ELMWCzY+YoQw+sRdZ92F
	htoKfynhVfJefVtohOG1qDb10T9JvKn/3PHCy7jtyzy1tJaQM4KmoGuQcmi1giO6e0saOI2c3jJ
	8M35ghrg5a5zC+GrW9qLB2Bv4P/BnQ3yi9mdkqvFWLyBQAhwJBz/FFbIV+Hni9UeuFXIdsPys/h
	4E6GxytU5qL54UPG1+Z9BXC1FgKb+nfdWfZPKsaW/jqIULn8nZpmsZ9FYfBGgDhPDpjdZyHrT7E
	CS965eIsBYThq/rmn6Hywgzao2TQnqtaDURCnPMJSkDJF0m3B09q+NLiPCtMLPNnhuifXlQvpRH
	2QoCOMuFN/8JmDGFUOGb9aOAtnG1yMNREl1COd4GsxD6fMy/RvMPhOpPR4aZi7K8acohNfballK
	THqbb9mJ1JkTqkY0/bC/ErOy4vzqApzo1M6cKZ1/bxeTqc9WN72cr0lFVJwPd58z4/+9kUtX67q
	Ij4T1uhlO7RnLhKOOH2vyJ0R9CWXwua+PG8E+PbTnH4njpJkBl4rx+6Hj3HCRREmICfTWFqFn1r
	7WMcBKkw7DO4azZXGX44s8J51+mXMtfnj0M/VA==
X-Received: by 2002:a17:90b:6cc:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39aee0eafb9mr12273618a91.20.1788387614634;
        Wed, 02 Sep 2026 15:20:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08766a2dsm1381049a91.15.2026.09.02.15.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:20:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	David Lechner <david@lechnology.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] clk: davinci: add COMPILE_TEST support
Date: Wed,  2 Sep 2026 15:20:12 -0700
Message-ID: <20260902222012.344765-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver-scoped Kconfig symbol for the DaVinci clock drivers so
they can be built through COMPILE_TEST without selecting the ARM
DaVinci platform symbols.

Keep the existing ARM platform behavior by defaulting the new symbol
from ARCH_DAVINCI, and use it for the davinci clock Makefile entries.
ARCH_DAVINCI_DA850 is the only remaining DaVinci platform symbol, so a
single COMMON_CLK_DAVINCI symbol suffices; the whole directory builds
together just fine.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 v4: rebase
 v3: remove pointless symbols for single user.
 v2: use COMMON_CLK prefix.
 drivers/clk/Kconfig          |  1 +
 drivers/clk/Makefile         |  2 +-
 drivers/clk/davinci/Kconfig  | 10 ++++++++++
 drivers/clk/davinci/Makefile |  8 +++-----
 4 files changed, 15 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/davinci/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 36b4801ee46e..c2edbd3393b5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -517,6 +517,7 @@ source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/cix/Kconfig"
+source "drivers/clk/davinci/Kconfig"
 source "drivers/clk/eswin/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 64095c805e6b..69a09b7d0097 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -132,7 +132,7 @@ obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
 obj-y					+= cix/
-obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
+obj-$(CONFIG_COMMON_CLK_DAVINCI)	+= davinci/
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
 obj-$(CONFIG_COMMON_CLK_HISI)		+= hisilicon/
 obj-y					+= imgtec/
diff --git a/drivers/clk/davinci/Kconfig b/drivers/clk/davinci/Kconfig
new file mode 100644
index 000000000000..7b8c518ef6b4
--- /dev/null
+++ b/drivers/clk/davinci/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_DAVINCI
+	bool "Clock drivers for TI DaVinci SoCs"
+	depends on ARCH_DAVINCI || COMPILE_TEST
+	depends on HAS_IOMEM
+	select REGMAP_MMIO
+	select RESET_CONTROLLER
+	default ARCH_DAVINCI
+	help
+	  Support for the clock controllers found on TI DaVinci SoCs.
diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
index f9d5c9a392e4..7cb030b5e046 100644
--- a/drivers/clk/davinci/Makefile
+++ b/drivers/clk/davinci/Makefile
@@ -1,11 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ifeq ($(CONFIG_COMMON_CLK), y)
-obj-$(CONFIG_ARCH_DAVINCI_DA8XX)	+= da8xx-cfgchip.o
+obj-y += da8xx-cfgchip.o
 
 obj-y += pll.o
-obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= pll-da850.o
+obj-y += pll-da850.o
 
 obj-y += psc.o
-obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= psc-da850.o
-endif
+obj-y += psc-da850.o
-- 
2.55.0

