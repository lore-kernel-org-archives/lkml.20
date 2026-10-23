Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767363;
	b=j6K2Q6GeUmJmLrHq5RhStKJid7V39Jo8U6eQB6ApBVn+Bcp+jx5rjHNbQ84hIm3WVKPa
	 VZVTXfYMfCARGogbybL5eKLxsWRENB525XOKpl6+Mn6esUP8ewSCBmJ0g24g0NBEs/22P
	 LURFjYQaBzI2CyZ0hT+AN6L58lc2LX76MOaJLJIVDZf4TKnsEKtuJe/Wl/wn6zbefcxcT
	 eAV79T6283mLC6VIMkXt3Sxg2It+rR4oJQkLhcA1z1Y5u1mHrNoPipL9UTvFrI9cYlGFQ
	 rgQlP1w2X8iII2pyYZc1sF8Y3e9gNXKbeWYoDQDELD/5DB2wWmrJEdIfKZ0J5Reupzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=80oQFk83gUm5oUkUtGxTmSCfXu9EgvcllbggxNBcnbY=;
	b=mJNQRgTOGqfHwYUXTHVv1Ttelig7Ci1ZAb2p+vBNL6DTJJP8DWxKhBR6HqDRBK0+2uX5
	 DUym8gHGxdtkReVWBN9LFQfdvFyWYXUwGpW/3M38asJ34YJyTBeAJK4mSz+fct6n/eCIh
	 gXVnXZRoZcfiFMRG+0z4QjkespDocb9OJEBZ658Ohh+wPfarrqeKiElSw8Ql4q4seScn6
	 d3ThtFBG6bubb6cvrbT7yLUJWcTbPa1gOhZFP1ZASEFbWirrvZU6UyI61CxRlhHPyN1Cx
	 5hU8pE8DluZItQJKPOwcf6+6y+yhOZcHsp0sqKVd5tBvhEu5IvWiIYJAAcb56iXVzCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PvBALgAA;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF960A2605
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91CF960A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PvBALgAA
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d1da913so800818f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767362; x=1793372162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80oQFk83gUm5oUkUtGxTmSCfXu9EgvcllbggxNBcnbY=;
        b=PvBALgAAP7XgEy+JeWS7jSJ8oN15TObVPVrkdh2Ho+aV84B7yw/9CZnlKDygebCd7U
         lx9QjMG26HSs7LwSdiogMUvSe87GuGzoirZdgjNzeoBbHFEmyQi/cgbGmR02+B/kVULD
         NNg4OGBBKwk46lrzgeKv9pNOKlQwE1tv2Wje4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767362; x=1793372162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=80oQFk83gUm5oUkUtGxTmSCfXu9EgvcllbggxNBcnbY=;
        b=whqCiOdvYKj/fwoXodlnCi7MiSEtnZpHz68tA9WdyELFyFyzitJcf0mmjuHYl0lDmj
         B76hRAOn7FGdrbCB6dvs7KQPN5/st8+qilbc9wHTdE5lPSG2crzmbPxdBGhTyWV9IOJh
         m4ZME2Daev6L9cf7SVZ3TTBmJeLAEQxuD54bxyWizNovSR51NS8fA/beOYVAQ5akCiBe
         uDnJAldQT4Ff1h89OX4UjZWc1coOvAZjyzeBeLTXFvJIFyLu17SQgQLa358l73lXUL+h
         1MYyPBzXoDpO2zGlhP4j0T1BVboK2LXmP2BwC5EKWPJMB4nEg4vmd0jJYvw5OyHrJBAI
         KYbg==
X-Gm-Message-State: AFq9FYJSmvY1mG+M6RO/PSVbEY2qDu80YSoJIVajFE2bFkEzkniZEjqE
	xrFcWNbiuSUmffG2Nxk3/XfXVlf1Dn+fF3XTYIpUiCWpUj3MaZQ4jvtybf3uPnQsVQXeZY8/Ysh
	+fDNn
X-Gm-Gg: AYBFou3SpGRrtxggNneVM1uy1Ae3Dm80rLg0o8FLH8PxG4EoViOi18YH9wYw5zPzT/y
	i1gRRGJLpn+CCAWqAiAUTmnWWy1CY36ChvVpSg85uB7frKQmosYYIqO9jPkyQxUwZ7RowNCespN
	JXXl/rYMVyR3KIx/aikM3k9DTvM02D+k+726QkCZeehK9rU+omD+ECo4iHxaE9scqItdBXnPk6w
	WMNtNVl6ySx/i9WiCr3RJIe2jLG8na3d5sYtyZjWgHf0SGfyvAn+C/ctBTPYFdnzRxSrFSdyJ5t
	iRl015KNJBvSn++6VQyXFfEegjJKBYssZtZUk9wFzVEfvP4sln6wciD6vmFXfuxqgHGUXO+s5Rc
	jik1pkfQq2IXercYFrEosVLuAaQQ2iFxVm3VHlEKrQpfRg+SUEGdMEWztNIVt6PEgNxnNgA1jJi
	bBWx6yENp2MJWPS+JvVHylYr200qqoX+J7wnDKkHGISLJyvui9uMBx6OO8Ku4XnTs2VIScy0Brw
	X7IbdKyUt8/q9mX6ZNsTySbHKBnGXE2F2EtsIeJuXsBqUtagAZLRM3t8wBLjaL3GawwhWvklTtW
	0u2wl80Yl5UwrGY/IJrx7b3FMfu+qi6vzR4nlZq/hN+Pf/wq0mr6lu058f29FQ3Q0RtdjRDcjbU
	yZkknX1S3ZxeMHVa+BnJDChXpau3xdogl9thFK9M1TorF7wwaZpX+
X-Received: by 2002:a05:6000:4a0a:b0:48e:22fd:1ea3 with SMTP id ffacd0b85a97d-48e2d279e8fmr11095010f8f.28.1792767361919;
        Fri, 23 Oct 2026 07:56:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:56:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 2/3] clk: ti: dpll: use the generic spread spectrum configuration
Date: Fri, 23 Oct 2026 16:55:31 +0200
Message-ID: <20261023145555.3578469-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
References: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
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

The clock framework provides a generic API and DT property for spread
spectrum clocking (SSC) since commit c86814e70390 ("clk: Introduce
clk_hw_set_spread_spectrum"). Implement the set_spread_spectrum callback
and drop the vendor specific properties.

The SSC registers are programmed at the next rate change, as with the
vendor specific properties. The generic framework expresses the spread
in permyriad rather than permille, hence the change in the deltaM step
computation, and also supports up-spread, which is rejected as the
hardware does not support it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/ti/clock.h    |  2 ++
 drivers/clk/ti/dpll.c     |  8 ++---
 drivers/clk/ti/dpll3xxx.c | 61 ++++++++++++++++++++++++++++++++-------
 include/linux/clk/ti.h    |  9 ++----
 4 files changed, 57 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index d5e24fe4ae3a..83225e506314 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -271,6 +271,8 @@ int omap3_noncore_dpll_set_rate_and_parent(struct clk_hw *hw,
 					   unsigned long rate,
 					   unsigned long parent_rate,
 					   u8 index);
+int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
+					   const struct clk_spread_spectrum *ss_conf);
 int omap3_noncore_dpll_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req);
 int omap2_dpll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req);
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index e01272cd628d..626b44297e42 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -51,6 +51,7 @@ static const struct clk_ops dpll_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
+	.set_spread_spectrum	= &omap3_noncore_dpll_set_spread_spectrum,
 	.get_parent	= &omap2_init_dpll_parent,
 	.save_context	= &omap3_noncore_dpll_save_context,
 	.restore_context = &omap3_noncore_dpll_restore_context,
@@ -63,6 +64,7 @@ static const struct clk_ops dpll_no_gate_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
+	.set_spread_spectrum	= &omap3_noncore_dpll_set_spread_spectrum,
 	.save_context	= &omap3_noncore_dpll_save_context,
 	.restore_context = &omap3_noncore_dpll_restore_context
 };
@@ -348,12 +350,6 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
 					&dd->ssc_modfreq_reg))
 			goto cleanup;
-
-		of_property_read_u32(node, "ti,ssc-modfreq-hz",
-				     &dd->ssc_modfreq);
-		of_property_read_u32(node, "ti,ssc-deltam", &dd->ssc_deltam);
-		dd->ssc_downspread =
-			of_property_read_bool(node, "ti,ssc-downspread");
 	}
 
 	if (of_property_read_bool(node, "ti,low-power-stop"))
diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 8c51b988a04f..634fe0a1f9fd 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -295,30 +295,32 @@ static void _lookup_sddiv(struct clk_hw_omap *clk, u8 *sd_div, u16 m, u8 n)
  * omap3_noncore_dpll_ssc_program - set spread-spectrum clocking registers
  * @clk:	struct clk * of DPLL to set
  *
- * Enable the DPLL spread spectrum clocking if frequency modulation and
- * frequency spreading have been set, otherwise disable it.
+ * Enable the DPLL spread spectrum clocking according to the configuration
+ * set by omap3_noncore_dpll_set_spread_spectrum(), otherwise disable it.
  */
 static void omap3_noncore_dpll_ssc_program(struct clk_hw_omap *clk)
 {
 	struct dpll_data *dd = clk->dpll_data;
+	const struct clk_spread_spectrum *conf = &dd->ssc_conf;
+	bool downspread = conf->method == CLK_SPREAD_DOWN;
 	unsigned long ref_rate;
 	u32 v, ctrl, mod_freq_divider, exponent, mantissa;
 	u32 deltam_step, deltam_ceil;
 
 	ctrl = ti_clk_ll_ops->clk_readl(&dd->control_reg);
 
-	if (dd->ssc_modfreq && dd->ssc_deltam) {
+	if (conf->method != CLK_SPREAD_NO) {
 		ctrl |= dd->ssc_enable_mask;
 
-		if (dd->ssc_downspread)
+		if (downspread)
 			ctrl |= dd->ssc_downspread_mask;
 		else
 			ctrl &= ~dd->ssc_downspread_mask;
 
 		ref_rate = clk_hw_get_rate(dd->clk_ref);
 		mod_freq_divider =
-		    (ref_rate / dd->last_rounded_n) / (4 * dd->ssc_modfreq);
-		if (dd->ssc_modfreq > (ref_rate / 70))
+		    (ref_rate / dd->last_rounded_n) / (4 * conf->modfreq_hz);
+		if (conf->modfreq_hz > (ref_rate / 70))
 			pr_warn("clock: SSC modulation frequency of DPLL %s greater than %ld\n",
 				__clk_get_name(clk->hw.clk), ref_rate / 70);
 
@@ -337,9 +339,10 @@ static void omap3_noncore_dpll_ssc_program(struct clk_hw_omap *clk)
 		v |= exponent << __ffs(dd->ssc_modfreq_exp_mask);
 		ti_clk_ll_ops->clk_writel(v, &dd->ssc_modfreq_reg);
 
-		deltam_step = dd->last_rounded_m * dd->ssc_deltam;
-		deltam_step /= 10;
-		if (dd->ssc_downspread)
+		/* spread_bp is in permyriad, convert to percent first */
+		deltam_step = dd->last_rounded_m * conf->spread_bp;
+		deltam_step /= 100;
+		if (downspread)
 			deltam_step /= 2;
 
 		deltam_step <<= __ffs(dd->ssc_deltam_int_mask);
@@ -353,7 +356,7 @@ static void omap3_noncore_dpll_ssc_program(struct clk_hw_omap *clk)
 		if (deltam_step & dd->ssc_deltam_frac_mask)
 			deltam_ceil++;
 
-		if ((dd->ssc_downspread &&
+		if ((downspread &&
 		     ((dd->last_rounded_m - (2 * deltam_ceil)) < 20 ||
 		      dd->last_rounded_m > 2045)) ||
 		    ((dd->last_rounded_m - deltam_ceil) < 20 ||
@@ -682,6 +685,44 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
+/**
+ * omap3_noncore_dpll_set_spread_spectrum - set the DPLL SSC configuration
+ * @hw: pointer to the clock to set the spread spectrum configuration for
+ * @ss_conf: spread spectrum configuration
+ *
+ * Stores the spread spectrum clocking (SSC) configuration of the DPLL. The
+ * configuration is programmed along with the DPLL multiplier and divider
+ * at the next rate change. The hardware supports center-spread and
+ * down-spread only. Returns 0 on success, or a negative error value on
+ * failure.
+ */
+int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
+					   const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
+	struct dpll_data *dd = clk->dpll_data;
+
+	if (!dd || !dd->ssc_enable_mask)
+		return -EOPNOTSUPP;
+
+	switch (ss_conf->method) {
+	case CLK_SPREAD_NO:
+		break;
+	case CLK_SPREAD_CENTER:
+	case CLK_SPREAD_DOWN:
+		if (!ss_conf->modfreq_hz || !ss_conf->spread_bp)
+			return -EINVAL;
+		break;
+	default:
+		/* Up-spread is not supported by the hardware */
+		return -EINVAL;
+	}
+
+	dd->ssc_conf = *ss_conf;
+
+	return 0;
+}
+
 /**
  * omap3_noncore_dpll_set_rate_and_parent - set rate and parent for a DPLL clock
  * @hw: pointer to the clock to set rate and parent for
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index 54a3fa370004..81ac070551f9 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -65,10 +65,7 @@ struct clk_omap_reg {
  * @ssc_enable_mask: mask of the DPLL SSC enable bit in @control_reg
  * @ssc_downspread_mask: mask of the DPLL SSC low frequency only bit in
  *                       @control_reg
- * @ssc_modfreq: the DPLL SSC frequency modulation in kHz
- * @ssc_deltam: the DPLL SSC frequency spreading in permille (10th of percent)
- * @ssc_downspread: require the only low frequency spread of the DPLL in SSC
- *                   mode
+ * @ssc_conf: the DPLL SSC configuration, as set by clk_hw_set_spread_spectrum()
  * @flags: DPLL type/features (see below)
  *
  * Possible values for @flags:
@@ -124,9 +121,7 @@ struct dpll_data {
 	u32			ssc_modfreq_exp_mask;
 	u32                     ssc_enable_mask;
 	u32                     ssc_downspread_mask;
-	u32                     ssc_modfreq;
-	u32                     ssc_deltam;
-	bool                    ssc_downspread;
+	struct clk_spread_spectrum ssc_conf;
 	u8			flags;
 };
 
-- 
2.43.0

