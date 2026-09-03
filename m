Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A24B4E80C3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449941; cv=none; b=JRBNLNPoWg/fkAj5y7FwqezDSQNwZy5c9u6h1EfAevnLJoLvxDSr5YFCHHqKkoAsRmSTv0j0DKMyXMiWoiVdLVZP6h+jtTI1sCYzKqCS0Kdj4bfGbzVBVvWmLC15Fkll0FIOtylQznoy6BJck9ukx7Hx99vqXlABukP6Um8gQfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449941; c=relaxed/simple;
	bh=ZU89zNZTonpu3UTAUBirVROwnLH5x3/C32l17m76c3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWdrC4FcseQM1cO18bTWrH62BsgifHSm4O0jrWcqt9FEfbTUmWTdbk7NQdDe/b68ELof+/5oL9Lr4/6hJZEyDXTV/mNO7TmdwvwvuOFLaeIa0HdZtWlxsViXzo54lsOTwZlDZXUb3eEFlWaDrd/G1ejHBcHDH9kNbjyJ5jm/p3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MP9FYoSN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MP9FYoSN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-485852d03a4so28268f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788449936; x=1789054736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1yqnW0S/sSBoLbGGpdBGirLwApxYqu22jjVHzyaFhI=;
        b=MP9FYoSN+5IA4d3AmgmkLfgU63xttOdhXK3rbf3ew7qo5/pLCRsMk0MQSgMlsbdjxc
         P7Tn50R7V0sJsu7oWSH5jD+QuD68MCxCkdg1I3460+6zTLsy3+XsdO53jLU87bHdTjtU
         6FvHVAE8nwjrfANIYnrI4OzR5XepzEp1bvlEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449936; x=1789054736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1yqnW0S/sSBoLbGGpdBGirLwApxYqu22jjVHzyaFhI=;
        b=j8DFRUVaPi5ROtovmUlMOWPJzKvLBF5nPKUzqx/IRefHwfi8fvmReGEIzDFba3+8YO
         +0JNBV6xQdWI6/Va7uYVeqaiF/P2t1mR16q3V3sculbSc0MPu+Z80gmH2mhL+3ZUaw89
         IfCWPfNGPQ45ogt8JB/el86XxNIHjAe602xT5IJuJ3oIgQlL8AQN+rNAiNzMr9QtbgXh
         ue+ORrzvcB8yNz5cf0iQCr7hzz5flHV3BWXDuv6sPcUfh/jftd8L7am2i81TOJcFoduO
         CLFLXdKGWrZ+aZ2WDFhrRq5MiWUuIXP3olibA5TZAjaqV7KCyQqGCEhP4R3A+NfeedzW
         YXlQ==
X-Gm-Message-State: AFuF++mTQpvfUIg0YezHRVjh/PHET9TF+V1FskVvZWQIrec7OJAdDv0z
	RIs4iYxPGHSn/zw9ZLtv5Rd7U8f3/j6ZhwlvVCLthDNs2i3p4+BfhUDr4xwRomVG8TIiIb+fswr
	6zVZjUKM=
X-Gm-Gg: AYBFou0SuZR5W0NXyzTsk7vLiaNyrcNlK1I2VJ2L9bOrTl9Bqn72TFNayUU7UQ7sE5R
	0P1kLzJUBP65H5epwibwMTkLq3w+dGAqnGplBRB68NLzrSKfBzFsF7l0pnF5Ns6HBlyqfke5KQm
	12l83xb3sajX/Mx5KLf7sjv7CSM9YjqV8CZ6nx7h29L2KzcKLAgj0yLznm8EW9ZC2Woe7jS2wNz
	s2p/s/1qq4p03g7C+65CpamI3SjDRqunVdriKHEYHQ9MlJJludWyGU99+pw28P17/qShBfs/btK
	wA/zXir0bqyCsay1Q6pjaOn3gXNETqL4CZXQShGou7pcO2t5Eb2Pxf0302hIvwEl82syauyUxQR
	9Ozg/bPyZMfvvZvUZlLIknD6Ij85WCoHdbxrDT1J+U4WRoJiXGh4nTE+vvEy/76JhEnbb1Lr050
	hGAOxwAvWiiJMKv+L4Si7Kd/jgda048MRnEmcyGejLMdYIALcGmEZLIubULz8rh2WNBGn/VDxVu
	QGcf7u+5yAyhrMCr2eSfEAzQ6sPtvNEIEPszueJ5eZhWecA1MxjXBykdB7YGMb2JUCHZqlwUjIP
	MQaGIozSop+k/WdS5M55xIBVp/X24JqSrqdPZkhzvKSpJAr/KcdO6V4=
X-Received: by 2002:adf:e3c1:0:b0:485:847f:fd82 with SMTP id ffacd0b85a97d-48586034408mr1988754f8f.8.1788449935865;
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm15366301f8f.1.2026.09.03.08.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v13 2/4] clk: scmi: reject SSC configuration out of the OEM field range
Date: Thu,  3 Sep 2026 17:32:14 +0200
Message-ID: <20260903153836.373267-3-dario.binacchi@amarulasolutions.com>
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

The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
tenths of a percent, and the modulation frequency in a 16-bit field.

FIELD_PREP() silently truncates values that do not fit in the target
field. Moreover, the conversion from permyriad to tenths of a percent
turns values below 10 permyriad into zero, which is then passed to the
firmware as no spread at all.

Reject these cases with a warning instead of silently programming a
configuration different from the requested one.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v13:
 - New patch

 drivers/clk/clk-scmi-oem.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index c1ebbdc6bbc5..4dac608edd4c 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -35,6 +35,7 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 				 const struct clk_spread_spectrum *ss_conf)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
+	u32 spread_pm = ss_conf->spread_bp / 10;
 	int ret;
 	u32 val;
 
@@ -44,7 +45,19 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
+	if (!spread_pm || spread_pm > FIELD_MAX(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK)) {
+		dev_warn(clk->dev, "%s: spread (%u permyriad) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->spread_bp);
+		return -EINVAL;
+	}
+
+	if (ss_conf->modfreq_hz > FIELD_MAX(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK)) {
+		dev_warn(clk->dev, "%s: modulation frequency (%u Hz) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->modfreq_hz);
+		return -EINVAL;
+	}
+
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, spread_pm);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
 	if (ss_conf->method != CLK_SPREAD_NO)
 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
-- 
2.43.0

