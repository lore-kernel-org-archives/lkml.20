Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4131A682C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516778; cv=none; b=Nz8ifIztt0C/e0aIgaArSPNd3Bgd4hhW0IRvLXlVXzmRDdLNLjaiQTWfZhLab7zrVfsSoeQj0oekKVFM7+TvbJ0pCUGdN1P5/WNFH6rjwxTRivwMK0lCSf6hUMU0A+PNZV80jJXGuQg/NvUMieo2YjKavq+qjZKOJTTXA6m61rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516778; c=relaxed/simple;
	bh=NiMVJbmVsoK8R121qi2cF+5KCHnnjg8UxRitDRHK/AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MC3pAZqS2NS+zAOH0T4OPFpp+hZQDuyhfENDizNnR59hdNUlNgZY4hS/XvmRzTUntsjCvnhuhi5Z+92QzODe4Twpbu3C0kYYnSYnyYcTvpwLmijOnqCbpKYJq/PAdPCuhFaYldQNZOEmp0b/BIma3f1UbvtCYXGIhOfyu0OeinE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=jkv57C+4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jkv57C+4"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441fa5c37so523967f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516775; x=1789121575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjBHI89nbApApOn8aT/Os8kMb1n8Jfct1CD1+zTK8UU=;
        b=jkv57C+48mN347W1j2kWJcKnKw9Mvsl73qJPHmMXY2Gcoa3RMwpxHduWxkalOt+IUm
         F0dzGMy26cOjWffdB8fGy+fp489u73jQ9rV4l+Lro7u5NxNXIleNx0w+iRG/L/YH6dzx
         Wb7eR1+vP3fiVcYx8GvxSj3edvn2X2X93SfMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516775; x=1789121575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjBHI89nbApApOn8aT/Os8kMb1n8Jfct1CD1+zTK8UU=;
        b=k/wnlxhC35rslmsmPsu0iK4ngcZjYJU86/iQdeb10L9KH0aOMtluxhW6mV3x748kyP
         HG6vLtyuof2sKnGaRtfSKdCiD1NmWRsrX/XBnAZ7a8uNyDSqKcnz0aVP3m+rWuayue27
         8H/ZSCSdLULWroZsNP5cIX3BtfcRbfV63PSwBMe+JZN92tqb7G2LEkv9Dt2m90x+b+Z0
         T9V+oJ/bw17RjwwD5PNpkRtNG6BNZyt0pu3lBax7BOQ+jFuCmSCyxfmgyE32UE2O2yCl
         Ixt4g7ApF1NZ9+FTUzqB7kM19Kcf1078pcyrCy6Gx9n+KOJafDFPxjmxnJ5I21JitNeW
         YBeA==
X-Gm-Message-State: AFuF++mO0DLpRdSHsIdmB2u+++O4lfuEiUgrqu0F0AxqYhgHrYgrVAne
	uV4xsx3hSrP7x9wvaz35hqLx/1ufa81A3QQUbF7rN6I7amNIl7hwvY9Lc8gMZJOkHSs0BXVbT90
	Q+rQckkM=
X-Gm-Gg: AYBFou36nFEY9OK8vH89PB6XWpwdU4ZuXvmUlEmb/rtB2hKru8lkT53SPLOFOZfvEjm
	PSgEXKVjeIzbv1dkTTRZVxWMfB55UUsy8ZI9YT0jwINkDRf6lyJTmTqpDsB4LKV5vftEjQU8xt7
	tJrzPdJR34FcB3UmV3lFdJJhX+gZJ6V64fdHIImLib03gYiLyUQwTJZNEP52rFEShH9UcCb6SVu
	ia9a574GkAFSMYGv+3//IsAqcRO4k+sowrvhOqoOQS1YRKUL5uCmQunizW6rf9R5R1h3lqO16tq
	+jOuKGafHfkATCdacfesXjM8tzfeXssRPCJyn+xNSeFk8nMuTdlX5mPi9rNvTe+FinpGMNGwujz
	qOPXvT5KzGYxn7/vRQ+6pTJrKh/ZRvv33KuGPxpQHGz+gFBOhwukGjaX0TQ2HEngZOk8jqgRQK/
	jbIkR3I9alXhDkW4F6dqXvSV7A/jnkl78Ac95Clpb+jw2YdWwyM8ihTsm0ferycokBlttk9A/B9
	je/bUK5FNvVm65TyaYYxkt1ckftvdjuGHtFtCUT468SOMTLGNMVfmXDaTtm4PzOEmY+sBuJFpTg
	o1WPreA0urOk9d2Y1f1vG4AF0w3X0T24HckezkrE7S3dC4pNY73ykkQ=
X-Received: by 2002:a05:6000:26d3:b0:482:f5f6:d253 with SMTP id ffacd0b85a97d-4858728a2ddmr6662967f8f.12.1788516774774;
        Fri, 04 Sep 2026 03:12:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v14 3/4] clk: scmi: reject SSC configuration out of the OEM field range
Date: Fri,  4 Sep 2026 12:06:32 +0200
Message-ID: <20260904101243.412006-4-dario.binacchi@amarulasolutions.com>
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

The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
tenths of a percent, and the modulation frequency in a 16-bit field.

FIELD_PREP() silently truncates values that do not fit in the target
field. Moreover, the conversion from permyriad to tenths of a percent
turns values below 10 permyriad into zero, which is then passed to the
firmware as no spread at all.

Reject these cases with a warning instead of silently programming a
configuration different from the requested one.

A request with no spread method disables SSC, so send a zeroed
configuration to the firmware in that case, without checking the
spread and the modulation frequency, which are meaningless then.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v14:
 - Send a zeroed configuration when no spread method is requested,
   instead of rejecting it, so that SSC can still be disabled.

Changes in v13:
 - New patch

 drivers/clk/clk-scmi-oem.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index c1ebbdc6bbc5..29acd2923fd6 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -35,19 +35,38 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 				 const struct clk_spread_spectrum *ss_conf)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
+	u32 spread_pm = ss_conf->spread_bp / 10;
 	int ret;
 	u32 val;
 
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		val = 0;
+		goto oem_set;
+	}
+
 	/*
 	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
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
-	if (ss_conf->method != CLK_SPREAD_NO)
-		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+	val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+
+oem_set:
 	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
 						 SCMI_CLOCK_CFG_IMX_SSC,
 						 val, false);
-- 
2.43.0

