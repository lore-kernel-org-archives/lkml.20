Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B84E80C0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449938; cv=none; b=feAdAW3h6Trt6a8Xyo62TGeOXDYcxDqGyY/IHD1SeiiZL3LOFFGPXvFxSb6bCPKQVkdKw1LCPEL2YeUQTdtMmOtyKXRB1jVRRxzVWrvH/+svQ3ovFPPklkOuw7ZeNpK5gE/RPoch78HDj3iHYT3oAjwRidjsR7dresMHzNNqUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449938; c=relaxed/simple;
	bh=jqDxNsidN6eFRCeVQqRvHX95xR+s3cpiy6Fu25B0d+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FuN3LuO8MgTwVilUn6tYQeml4EEi01OUL5KiT4qth/TA4qDJtgaSSt0xlJltRBydnETBYHChtUmu6VKfueYL2u65dTmPp3i08fMv2/j601FlGuSg7tZYnbybkZpyI0Q1R+gjRiLbEppopywn1fNeQBfb7PmZ0sMPuG4WhNXsEyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JdV9mzTB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JdV9mzTB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso8868735e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788449934; x=1789054734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o+HCmOQx9XAtsX24zUFSwjZJzmYz+uo9CE80R3VvZQ=;
        b=JdV9mzTBhXYIdoynAn+8gdWXTkhRVbDmtOwIskA9NCWA77NXqLJgwzVNySVtHP/AVQ
         J64nMACeQhtuUrGShc3Lf93A2o3owTNzjgJnDPG7Qvg+Zc26D1CJzz346YfEyH6SCQXI
         dPrNGouOGUuKSSReJ28U9P5D8KBerz0At3Vfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449934; x=1789054734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0o+HCmOQx9XAtsX24zUFSwjZJzmYz+uo9CE80R3VvZQ=;
        b=MQuLdzk8nl9fqlptQK1zCnm5lfz+Y7S80p7Sk/9bCy9E7C4Qp4cP10z5/wzyKG5lE3
         0C4IYnmEgt2i/Cp3VJZyTUoIsvfyfI2rR9llXYTNZcLz/p/zDh6xHXBRzkoVqv1ZBBGf
         GvAoH2TT86XLiKErS+bsAcdQs7z6sxAl4l7C1pOKtQhWV/ks73YolH9cYTbAs+MP5B7k
         +Y4i9yB36D58hkLdQ/w3PtNEf58Jk+6p7Zu2o8oD65+fE6o53Y4J0txkcN03wMc3WIMD
         /5QJNs8U6PP4R0+6YdDa6pZwN8Si3hvXKzm7JyJiJXMaW4zIls0mveuLEgYen/zTzqEn
         JqsA==
X-Gm-Message-State: AFuF++kNW7YHd943Lf6AQ9osq0HwOBJOdrIx8WjnIUh7RtVMZV93NGvL
	isZBx/lDBuuQO/+ccBd5Wu+WwMpS7mSP9ogGTqEQ5sXkXOkCiEP42+YczsUe4FOC7Uw+XIvIJzA
	075yRrfU=
X-Gm-Gg: AYBFou2tD4eJOCPfBkDKIru0+TcueBiCtCxlGv+GgE1jBRi79O39EIlyj4IOz9U5S21
	LAXFwQ22cg7wUfrVxGKd7+FDjSA3RVRbaIHSPX1rDuZ0fWjsKTZvbHz1xXVZUboF2Berdxgksxs
	lu6KQGdZUpa2I/XoDIrL+T3i6N5Cp2RbpbdmEcvry9z97//LhlxUBORj+Bj1GnS1Ni/wDyKy8gv
	o/oBkrB//KFbNt5mG2z386+qLqx6SG0feelHH4JBhcFmfq09yy/R3NlabpJSxKbgsEcNtiTuHBH
	w2uIWmySWi37KUII/s9kTEs1+jznAA/kdpA/Q9g5aa2XQPNAFZEWPs3QZhCgBupletxAq07UHvd
	kxTswe10ihu/BKHfJevkD9GmHZALfdjmmo2GJGt0N3wBkycWwMZndFpaQzbtQu8XgWZA30LcMTT
	LWY6vq2q3iF+TKyfpzJ2aM2u6ZghGvP9TMxKnYeVE0XB4YUpzJmpKJN/KVltVXmJCXIJtgqkr6W
	rK9Tzr4Pb29ocDaqv8Tiujq4+Bj2dr1ktsvaXp/pFo329pju2Pk8J64mDH2fqPkoBOoWpD+YZmx
	GJ5GTUAyGPbTDQjkVVO0qKHEEOH/CJCH70QRgojxRNxoQwHQHcpjyHnD/oBwqaT2DjE=
X-Received: by 2002:a05:600c:46c6:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49cf1576df1mr45683825e9.2.1788449933923;
        Thu, 03 Sep 2026 08:38:53 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm15366301f8f.1.2026.09.03.08.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v13 1/4] clk: scmi: fix SSC spread conversion
Date: Thu,  3 Sep 2026 17:32:13 +0200
Message-ID: <20260903153836.373267-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spread_bp field of struct clk_spread_spectrum holds the modulation
depth in permyriad (1/100 of a percent), as documented in
clk-provider.h and in the assigned-clock-sscs binding, while the i.MX
SCMI OEM extension expects a value in tenths of a percent, as pointed
out by Peng Fan.

The conversion divides spread_bp by 10000 instead of 10, as reported by
Sashiko, so any valid configuration is truncated to 0 and the hardware
is silently programmed with no spread at all.

Divide by 10 and fix the comment accordingly.

Fixes: 77369b1e6a37 ("clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
Reported-by: Peng Fan <peng.fan@nxp.com>
Closes: https://lore.kernel.org/r/ZR6PR04MB375776A27E98F140534E8F7FE488B62@ZR6PR04MB375776.eurprd04.prod.outlook.com
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v13:
 - Divide spread_bp by 10 instead of 100 as requested by Peng Fan.
 - Rename the patch title and reword the description accordingly.
 - Add the Reported-by/Closes tags for Sashiko and Peng Fan.

 drivers/clk/clk-scmi-oem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index be11d359b4ec..c1ebbdc6bbc5 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -39,12 +39,12 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 	u32 val;
 
 	/*
-	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
 	if (ss_conf->method != CLK_SPREAD_NO)
 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
-- 
2.43.0

