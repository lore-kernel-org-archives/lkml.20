Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEAE455632
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516775; cv=none; b=cttqrb1AJyW3wNydx0DoKmsHYdEaDTowBmIzGOptrxSWt5tIX4gMSjsY+GoxvYRNoEoHNNqgD5eQi7JJeXskHsDYWvuH0MqkaOaZwNH8alE7hWtFNQ8TYTaJbAP/s0LwBeugu7UgOfxbdfDICf7HPtMvkVju88Mwx2beGTLzILc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516775; c=relaxed/simple;
	bh=JOoI2fQ3bWoSNiNb4j+XTtCV5WPlewq2Kxd7FdUTZYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgWvNLffUwwSYwMwIacluIVfauKf0xsu/HbmvBzrTnrkdiZKO33G5g04P4R4qZeIROEH/Ca8xJudrKGpKqg7Mx02MyhrlHw0LCoesKQPS1ZpMxghd8dZBa07yicB9LLMgOz2ZBbpq6vpWSt8b4qo65GWyJ82iANGf177iICpRJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DmMak626; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DmMak626"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f96c5b722so545274f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516771; x=1789121571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trMLdDdWbBp5aYskl2hpYhEKm0ijNRyi5bjjWx05fj4=;
        b=DmMak626qAsG77i5dAhWAlPlfCMsx2Oz348NUbAba/CD4zmHwh1PMqhB0I7NZeLFjQ
         D0R1QVQ8GAWGzc/iAAbnZo9Ekv8TBuIUWcKRCbmvxBVvxpmeZzwV80gAZNBs8FpTlF5F
         cRmx7eNC3o9JArisZz1Ctbv5EoFixFxHJWpHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516771; x=1789121571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trMLdDdWbBp5aYskl2hpYhEKm0ijNRyi5bjjWx05fj4=;
        b=hJOTGHONTnkvTiQCYh9KgehDA6uYYL2nityMsE3eeNHyDF204FaOlljgn9CH8G1GtB
         VZ3HUX27SLG5/jzQzec+PxRqvyOph9aymR9nZoym52w1kFD6+q88pXWKgV7MImlugKtg
         JZ+HyqKiJ/i3NMtRWwC/wEB5GSnP04L8sgsEYRse/naGxqqdNB420RDVLGAIC/ZFL4M/
         X43bC8LUkeO5FTCIfy/Vsbjn216yZRt+jdkibbDkW3BKAahrFeVNknDtKRUIrtzOyUZm
         itznYDu9ipisTj4PyoDGBvvX6DWDCBnwTlHYG1qvRW3AjEW6uhBHwKGGg53BrufhyqWt
         Kq5g==
X-Gm-Message-State: AFuF++miggwk1CFS/hxdXVdYFn3+j1IFkuUP/Abp6qvNbChRGtjmG0vp
	e2csPOxxTwLm63u/fd6DDllLbfX6CDFqnZXmthYZAvR3oWwLoycCrPY6ZUWLDXk5JB0ovUN6g20
	Sind6f0M=
X-Gm-Gg: AYBFou1vfclpxmxIgSUYJFMOD5S4Z3Qu7f1B2Nq9RyvZuPC9/GHMuOl3AQ6BgDh0a7Z
	ty3eyNdDeDF1/RU0PSKwyvs0LK6eJCl9k5X/DPIpM9bEaOc/+qcuAAF6shiOfW7/uwue9fqAUKd
	mcX6PvLR9iznwxnKuJTxUsarSdr+e5Jh2TOxe1uARzsBZVprnmAaDAtDn1n71Ocyd3E6s6KrhMy
	TK5v6flowNRA9Ra9s99CZxAVuQfEQzcFAVRsnYWiUieIAwp5b0sGqoIqvpYzUeE1tM/AR+64b7C
	TQVzIAjJsfJysBUEc/wx7Z43t/RlTY68MjvB1KMw9fsKzkIrlZuR1b8UCCpYEhmzQW9Ymf2Xdh1
	Jmsv4Wl3I3Es0h/TwlVnexNq/73r91PuNNIJMNz8jVg4FI/IbL15Dg8fEqnmox1/UR/bh/3UMWX
	CxSJRs8mT5apSKOjisF6VvUhYzg7TdD2t58Uy2MIoQ/yIpgVPT2UQRLUu1hq7PhZ+mL98TV60dT
	Tgtj+C98KVs4kfGuKHrmJC1W+VfzP3k1nAo23dQcTY7w5VPmwgYDNnCAblIB2vH36HDcSHmVSsQ
	bhxH2KOsIaJlDQNbeTm7z8PWDBhyeuENRQl6YoWC7ysIM1zKzNHM6Bsol6diOqiAdw==
X-Received: by 2002:a05:6000:41d8:b0:485:8a47:5b96 with SMTP id ffacd0b85a97d-4858a475cc1mr2833945f8f.51.1788516771007;
        Fri, 04 Sep 2026 03:12:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:50 -0700 (PDT)
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
Subject: [PATCH v14 1/4] clk: scmi: fix SSC spread conversion
Date: Fri,  4 Sep 2026 12:06:30 +0200
Message-ID: <20260904101243.412006-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
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
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v14:
 - Add Reviewed-by of Peng Fan

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

