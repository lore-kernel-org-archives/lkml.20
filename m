Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788588;
	b=LWYEpbQ7fouLMsBPe0/sZfyUmmQNxUFdMMSlq1eZjHpYuC7NWkTc6LKFV/rThF4QbOIm
	 ABz4zLgMbGvzHCebjYvqu+ZGaBWGadjjKZzBsAXbXl/LMAZkMttOJbeDGkJF4hq+GYZsZ
	 gN4k/HuHGq4DEFIbWoAoybMk0f09O8IQ03Sdc/1RaR0hQPvpX4pUQKGVU0KhPPKiXcBY1
	 1ANBS4hdugLkphNGYizItUHRr9GIR1ArJ90vEyL2j84XzE6XZf1jojw3e8/uf1HIDofTD
	 N/rjCDFOZLzuoMn2zIJuw1xQZg687BDpjUKcwrt7sTI5PwhMgcW+gm+5gNU092IQKew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
	b=f5zUOgwBAkvALvePiLTeu79ftV4vMZX7tjQ+TbrA5lmukLrrSOfTdqb7MrKs9lb6uZy8
	 CoPwamCO4qGO9oThLrtpEPHLtY1NuEun4nqxbUGquieEVXwW832erW/ESyO8mVuyXJbem
	 l3OTru4pDG3OJXZPEJR+6zhglUP5yAwm8JLeL09auRv+K9Nlfk0JSyoEnxKGarbGR5R2P
	 9/uCcaNt0vUpIkfpszbvyfrZDBtZ3iFMVmNVYSWGDb/dC5gSaaFJY7R6vrXGdXqeMUBco
	 ylMbocvvEFVk9X1iYAZCfjkq+VCJaGmyFfrhhps0bqBmdmoK5jCtJBFLOX+7o1AeLbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZoewCmxe;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5510C606A335
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5510C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZoewCmxe
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b060ec084so337450f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788587; x=1794393387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
        b=ZoewCmxewUIzN6aiIcngtU40jl+60XtSwir+Tt5YZrbVwlPRzVt9zqOQyL/2XkaI/W
         6eAD+yC8vtvtBhAzkm7VnlG/6CYdjB2db6CMh2Yqpz0Ej3/nkaIWTvaSb7KtqKH8ndqA
         r322RBM1X+mbl/85NKWpX5q/wDRW9pTJ2HHx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788587; x=1794393387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
        b=eJD6Llk+SyL5sUlGUlyIIKmJOq6dQ5k2nenDgjt07T+qxiqSWtJyUFU11H8NMhKAbl
         UQYcQUUZ42OsIS6Dt5zfhJlrOABdF2IqfF9l9dvwi1BA3tAUJlXSC/zM9p9WPTOkDe+4
         dwQm++obeTf0z4zcwHZH/iJhheG1deDzmep2IKnSvfI3g+9wrkhqSMh3LiPmeISwfQoz
         r4oLOxidM5VW3Imjy3iNtfPpONeq8x9ypYSH3bT51cs/Y6fuVfcnCi94KE8u6F8HL7sQ
         NBrvdU1Vf02/ASSc9vXKKrmW8Iwam729aAUV4c1UGxImUXph0Q14fRIuOJdcaohyiA4m
         KDcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzepqBY6mvz7vNKWHvzNRaoJw9Y3sWo9oNJ9rdfWqEmgVGFfaHxl4VEt1u+ANExh4lptXbPbFR0p5EOX1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z90wNd50D+qaEBqwodR0lQdWDmM3c6aSlTWhnzKnZ5rWogJ5Hf1
	Q3u/0rIJWa7bFHOxw0+Skkw4qcwM2uuTVNy9FEgNLbvy1zc6j4GPqf0cY2WPBhBmtyc=
X-Gm-Gg: AYBFou1UxGlGUdfQ6EPos9CXaZ9aRgF3RUir4wtYNTBbh/9e8JlXvHav11IJ4/gJazw
	ipCXIu3yvPoJKU5V56lM8M9FvbZac40dQwhgwiXY47F606Qk3C+aCl/rMEJpEDVGoxgcl5B52lC
	YQF9McOWCeVgE/zDCmkW+txbKvNnMKMU13vNmP5v3/3vuyPEU8CYzTXuch0Pj57Xrv1v2Hs0cl3
	ZksvACft+kNNWmOYveVLqX8ZA3SsArHzzWjz1s+UqGse0zSPIhbgV3sZnDSps3j1vqoyw2lZ+AW
	3t3GSSg+rrdo3bUmecMiI9sagHQheej7X4GME+4vMA7TgfUS1WxUAFGAlkbxKt65/AdBUS9d6Qx
	RsUqrbyAvSTZdpe2noyYlb2w9tuOr+QA6lKBrdS4OMcnOm7V/PZiDCor9fGCURo2yTNYVdpxowH
	sefTO6b1lV2FzK+sGKR0wuM0EdeN6B753K8hZqsWPx5t/BD7BBMk0ZNcq7sGvpuFBb+EKDaD0Qn
	oWvNrD9gEKaoFX8pMrQ++FrsYFmyuN/PG33j/A1YW4zOmmeN5SJXElVovg8xEuooPf9Bhk52EdX
	WKzoUQZhF7LYKaZgdYbt0Z1f0K9zIMg3Ngf4j894BfcgibPoGpcmmo3U4Y9p++ituhiyB59qn7d
	W4905/3gz+x2VZ1wRKCqd8faUY7iIHro97cNieMPEl6BeScxMnOc=
X-Received: by 2002:a05:600c:6087:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4ac17753befmr352610105e9.15.1793788586637;
        Wed, 04 Nov 2026 02:36:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 1/2] clk: scmi: fix SSC spread conversion
Date: Wed,  4 Nov 2026 11:36:02 +0100
Message-ID: <20261104103620.4054694-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
Reported-by: Peng Fan <peng.fan@nxp.com>
Closes: https://lore.kernel.org/r/ZR6PR04MB375776A27E98F140534E8F7FE488B62@ZR6PR04MB375776.eurprd04.prod.outlook.com
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v15:
 - Add Cc to stable.

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

