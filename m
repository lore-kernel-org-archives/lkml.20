Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A926341650
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996884; cv=none; b=P9Z/twSX5yk7kL1mhpE/bTEE8bzEtujXtNLWveXr8fE+66KcJ7nah3V31+vWMC43nSgkHiH8c3dV0C+z5ZCFq+hVivYGDt2cvLgQxfxwALPInp+Ctv74oMPDPuGe66afMWBifiELusQUK0jq1naUGg8VT6KN5aJN0HdfZJZikBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996884; c=relaxed/simple;
	bh=qtHihgUfVJ7dLLyKBNMnY1uHg9+U0eAjPmJBvsAA+mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbGYdyvvhSdlNCECs66sHPY+NTvI/E/qoJ/P0kjy4EGe14STXJ3DJ9hsqqaXJIu5jgFwjn5P5tWQqyYkAikQgP4SDM4zxMD2QW+3haHK5c1E0GHhIwIa+sow+bw9Vb870h0xrKV85AsJv+wBgSBkVOheFr/FcBlC4QCzesbqA+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1045226f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996881; x=1788601681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGDbub8U4HXvEWoNu7b7TUqir4ckSWpnsJ/08Cf1vHM=;
        b=PVGzn2WhvWRdfNZFF+FNF72VgRNvFyu3Xy/b5O2bdfI+QgIPt1LLw2GfoRj5Ph8fHt
         eN+ltQvS4CEYIFO5gWM2pKL0wW40mjF15fyCbr+t/1YIVR+Q2gG5lnE0pgTevtMHlms6
         59uC1bNI/XSeD2EBmEles30NquoY4ZinfIPeUsMTJDBx37ZHNBhd6UdZkEhe/gKzm/o7
         chXe1/UH+zGw80KZVVYqV97SVb19fA0didmYXHJrDFEs9nGdlPpaRLe0v+MD/horzUj8
         T+0UT7FfeQib8C2yRbhYYVCJsq7PCX7NI4SzjoNAv0rxrlcNkllxrusdEf+6AHH04XcY
         A+Xg==
X-Forwarded-Encrypted: i=1; AKwUvBxvpc3t9Ksg4pblRwTJqR2GrjvxA0MTuXZMgWJ/I33TBP4Af6OaogghNXTp4op4LJr8nc9TweA8rAElG5U=@vger.kernel.org
X-Gm-Message-State: AFuF++lD7VbhLKk8wQ2F0PWhpM4v7FR8K3vaH9BEUImxyduoSmPwgUsI
	xZ6ouXk0+O2m1XPxUL4D8Nl0y+mXeqDVxBvx/4+jdfU7f/mQP8kRfl5x
X-Gm-Gg: AYBFou1yjJ9G0UI+xbKf2OQrFZ34pjGoOlYu+LtpDZ0QHlfXD2z51JlYPral2yI93dY
	rzB5W3W8tYsddQPztnE1UMz+sosT5zL2YS8tlII6b3zjR/5phS71c9sXYKrXie5hjBss9TFX2i3
	SyHBQybRfBTOqfHyCGzgrk0/JlMJyF9kzoZzajXtorvLt815BwujUBMGtxZmEiadKOskoC5gDYb
	nx9HD+kNF+W+HVWx/ArtsoI8TbkgfqcSDZvhg9HW1XJU2epTJdL24LrS5FvABj9LFTmJ1ylzpE1
	+sbK8k/yvs1Y7iGNqxrcU8oQTRxgGqhGdYUmI+Wj93wLoNGNEuAP0dxE8JTxfpT//9QHrsxAUfU
	yk93FNoo77iMUucV/U6DgtUK+wZAs8HnPT4T9L8afeRwlwqaldREeLCtTtbUz1A0aO7jxZnsyZo
	7J92SlEdfFjCBjoBz0iJP9N0gdSTUbWnKBeVwbWYkjm4pbiDTwJOezErpKTg6EqCOxUJbzEudbc
	XYkSTMyV/pRl7NHLt87/qZl+qQ=
X-Received: by 2002:a05:6000:2207:b0:484:3310:f398 with SMTP id ffacd0b85a97d-4843310f455mr2068417f8f.25.1787996880459;
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/4] clk: meson: t7: keep the memory fabric clocks running
Date: Sat, 29 Aug 2026 10:47:55 +0100
Message-ID: <20260829094758.23248-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four clocks feed the bus that moves data between the peripherals and
memory. Nothing in Linux claims them, so they were switched off shortly
after boot, and any device that started a transfer after that point
simply stopped. The SD card, which comes up about two seconds in, never
finished reading its identification.

There is no device these clocks belong to, so mark them as always
needed.

Fixes: fab4d651b592 ("clk: meson: t7: add t7 clock peripherals controller driver")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 214db7850d86..55d09e78593b 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,11 +945,16 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+/*
+ * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
+ * used for DMA between the peripherals and the DRAM. After the clocks are
+ * disabled, a device that starts a transfer cannot complete it.
+ */
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
-static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	0);
-static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	0);
-static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	0);
+static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_sd_emmc_a,	SYS_CLK_EN0_REG0, 24,	0);
 static T7_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG0, 25,	0);
 static T7_SYS_PCLK(sys_sd_emmc_c,	SYS_CLK_EN0_REG0, 26,	0);
-- 
2.55.0

