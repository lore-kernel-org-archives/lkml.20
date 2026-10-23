Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767365;
	b=2aysViMicoSuiQ3sWAvd89q3cJaNC8Q5C6/5BGtpPzI0jshmKL+bgBOrXsJ6pU1UTcHW
	 t9Xmtl4j9CUpZDLUx8nKfGMdbtahtw2hZn17jMmOQQZXMswDRmz5560tWa+u0ABliUUSI
	 +W2a/XvSQJMOw/L77qcaU8VZZm/sRq+YCUN24Kyr3Aa0ZrmdJs/gIpcnKWCt5rIK4c1ZY
	 lMQLCn21euerBBG9VGTdmL8T6v9JHO+Q/UrD+gOYt+LCPH1CHNtLN8SSunSNnI1pzJz53
	 Cma5EOepmbUjliMXmdYUqVLOhDt3GxAQ+k9R/N68PxkIbxkxQvACgtjhXyoXUOpcvBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VHijqk7R7nkxNtNy7fBcVFoPcvT4XkjuXZl2ndqUfI4=;
	b=xlswHwyasvC1epJSeNivoC0cYdfHKaoWacmq7dK0li6DILvaGTKI6qw9IeTdpnZ41jRJ
	 MT7Hm/Kpme1ePTDGaqMOYtAVsrdP8J/1DuyaL/hcjAQdZrvgY3P633VU00OtyvGBhMkOR
	 WPBoDo26+VCnziLd9bnT0DlWyFKHcPvyZnaEP9IFHHjrIUG4Uc06Z0QvkIFC77L2S+uOd
	 x2AnuIkkQVa+Fo7jNjEwgqZKdLn720VgwBLz6k0SRp0msLG5wkzTCn/2ujFVBsMZSShlU
	 8Vtvt2PygMLq3PYoWARxztRCVR0+ssGRchZWJ2ntqvax0S/Z27aiPkVSxWhs1MIYskQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=n3OYrdy9;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE4E60A2615
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE4E60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=n3OYrdy9
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20edd106so830803f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767363; x=1793372163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHijqk7R7nkxNtNy7fBcVFoPcvT4XkjuXZl2ndqUfI4=;
        b=n3OYrdy9FM9nwj1ieI5oDX86AMR8SCt9xiUwa9f3q+/Oc03cZR3gfFU7OovUXsceRX
         WO/SuzO8VAEo65jxC2XS4kZaIbpZgw2HvNSwty/6lRf7iD0X5b5PmmmxzEeUYX91OxUH
         okzpOJ81Xk7LIzokWNF/elUjFI1/WnPnkY3iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767363; x=1793372163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VHijqk7R7nkxNtNy7fBcVFoPcvT4XkjuXZl2ndqUfI4=;
        b=kqrblpf/z4dv7uM8lbdMsOoXqTL2G1W/6HDxLFCgFSzA8Fl4FBF1v8+rKCtz49YEJL
         e7UHrpBVrSzvwha2aWPeW1xnpSe3iarospdPAcVu5UtZZ+ggRliGpHZW1NvTGIv999M/
         P0/IAC9dFA7bBS69k8rGb4EYKhtqFOrsNX6MnoTJeirY5RMwzGQZtBxa6tK0o7Ved6lC
         swswcNX+SDTbS5NUl4gW1bqqjtbtZtSF/+i+JzvyrYSLm10FhUN3viQaC8qcawjs0NZv
         Hdwlspwqu5Qx5Lz40lcHCX/Wz6LLq25SCs23KqTselbTFEUoLk6/G9KAzSts+JwGPIU/
         2bTA==
X-Gm-Message-State: AFq9FYJ0lqrB176a6t5RphG96faTmOKv5AiYINvEXfXk4qfoI0E/nlHa
	MGLXWzqaPMthftyXZP8iO2b5IcrG9V0XrGtQKRPmPOAuql/RZYE8gd2NBThQzgeIPVYNTwQIQdG
	/MVH3
X-Gm-Gg: AYBFou0OYlXs9yKNJd/wiyT+uJPBSfxdPMyEaqUhzJ9OdCIMnvjnF+0w2BEk/25azkI
	fSu7LvOuBIX8BKfP1QofR6+8wLEeD3R0F+mTkx4smeD90PEBBmszHSw0PemETcCAqC/uj6SJR1u
	h1ir5ChyWu1HxGGu+uPQxQCDz4M+2BGivlcC7NpQwgOP6FIjX3zsOoFSzi2ruKcmevOASr6sh0s
	YpgBvgfUdyXPPIEMshW5zjO6qWs5nETNZEv0AYfLR301M60mL1smawfrBTelPnvVYFaM2CS4kSm
	B2EQ5YAS7N6n3iqlYVCYaXS5abNNhjOWJw0UQ9bmzxfiPGvmIU7B52TGbIVNJuBNvygvuDf4HCG
	cDt9Ry2gdmH5Kx8h1cdOjGoXHWqxTou+SJKTZgpKx7OEJfR9+HH9kOOIk8oiV1Kv36orhGpo16I
	zDpz3N9xt/UORdWmZlB79+G5H8bx4h7tE/cA11mtaK417cVwGE82bFtfgBuyqSIAu6kTduzJCpQ
	c6J37YeeyB293cNPntzpG5/N0v7XDMMDXNdjZsta2lbm85Y0H9VvlcI0CJuYP2b8WcbumceyQ3I
	h0u04nhKGAFObqIbh/drZaixMJGPQ+lJgWoAiL9WXixPUPObx2TN395c9tSwNsUoxOffaFcZD3C
	Sc5qwxgR3y9w8G7L70TqyhyoFTFqNSlRVXn5MqEN53/M6S2bqYhNQ
X-Received: by 2002:a05:6000:29d5:b0:48d:f025:110d with SMTP id ffacd0b85a97d-48e385a0752mr3000782f8f.43.1792767363456;
        Fri, 23 Oct 2026 07:56:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:56:02 -0700 (PDT)
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
Subject: [PATCH 3/3] clk: ti: dpll: apply the spread spectrum configuration right away
Date: Fri, 23 Oct 2026 16:55:32 +0200
Message-ID: <20261023145555.3578469-4-dario.binacchi@amarulasolutions.com>
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

The spread spectrum clocking (SSC) registers are only programmed by
set_rate(), which the clock core skips when the requested rate is
already the current one, e.g. when the bootloader has set it up.
As a result, the SSC configuration is not applied, as it was with the
vendor specific properties.

Apply it from set_spread_spectrum() instead, reprogramming the DPLL
at its current rate.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/ti/dpll3xxx.c | 49 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 634fe0a1f9fd..c181bba2792d 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -690,17 +690,26 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
  * @hw: pointer to the clock to set the spread spectrum configuration for
  * @ss_conf: spread spectrum configuration
  *
- * Stores the spread spectrum clocking (SSC) configuration of the DPLL. The
- * configuration is programmed along with the DPLL multiplier and divider
- * at the next rate change. The hardware supports center-spread and
- * down-spread only. Returns 0 on success, or a negative error value on
- * failure.
+ * Stores the spread spectrum clocking (SSC) configuration of the DPLL and
+ * applies it right away. The clock framework does not call set_rate()
+ * when the rate is unchanged, so the current rate is rounded again and
+ * the DPLL is reprogrammed. If the DPLL is in bypass the configuration is
+ * applied at the next rate change. Setting again the current
+ * configuration is a no-op, so that the DPLL is not relocked for nothing
+ * (e.g. of_clk_set_defaults() runs twice for CLK_OF_DECLARE providers
+ * that register themselves with of_clk_add_provider()). The hardware
+ * supports center-spread and down-spread only. Returns 0 on success, or a
+ * negative error value on failure.
  */
 int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 					   const struct clk_spread_spectrum *ss_conf)
 {
 	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
 	struct dpll_data *dd = clk->dpll_data;
+	struct clk_spread_spectrum old_conf;
+	struct clk_rate_request req;
+	unsigned long rate;
+	int ret;
 
 	if (!dd || !dd->ssc_enable_mask)
 		return -EOPNOTSUPP;
@@ -718,9 +727,37 @@ int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 		return -EINVAL;
 	}
 
+	if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf)))
+		return 0;
+
+	old_conf = dd->ssc_conf;
 	dd->ssc_conf = *ss_conf;
 
-	return 0;
+	/* In bypass: SSC is programmed along with the next rate change */
+	if (clk_hw_get_parent(hw) != dd->clk_ref)
+		return 0;
+
+	/* Disabling SSC does not need to reprogram the DPLL */
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		omap3_noncore_dpll_ssc_program(clk);
+		return 0;
+	}
+
+	rate = clk_hw_get_rate(hw);
+	clk_hw_init_rate_request(hw, &req, rate);
+	ret = omap2_dpll_determine_rate(hw, &req);
+	if (!ret && req.rate != rate)
+		ret = -EINVAL;
+	if (!ret)
+		ret = omap3_noncore_dpll_set_rate(hw, rate,
+						  clk_hw_get_rate(dd->clk_ref));
+	if (ret) {
+		pr_warn("clock: %s: rate %lu can't be kept with SSC enabled\n",
+			clk_hw_get_name(hw), rate);
+		dd->ssc_conf = old_conf;
+	}
+
+	return ret;
 }
 
 /**
-- 
2.43.0

