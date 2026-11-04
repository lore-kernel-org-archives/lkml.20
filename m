Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787471;
	b=0JL2Kk0eca8ozhkFoLJH2mPhFLhI0ibfchHt4ChpvpBPmfjrwb8fnCAImCj78wMYDwLF
	 0yT2KKtZyvGaQdcTMMnYwSV4LBZRhSh2rrQf02vv+wrTVqmuGlHiRz9wQ4ydMlQSOaDD1
	 hFqEYkfotj0KnBNsBcjfe0wpiLYkiJ5asY0K9nXuiw2NCeMsWjW7VWiZ5MeN5xvuJ9T94
	 oIHkNI5d2h4WI9z8XKr3Z/I1RgF3pYorSS4wNXKRshCvVuVKO/d/jOzzx4kUuWR09xkYA
	 F+++BPQ7HqyRF+iZFn1JuvT5UJpbpvAbtxVr/Pdm39aYuEbXugQ9l6BdYJ6igGdY+7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jbuhfSlfgFZ1tnBuSoCDBMKfZMfXYTX6enIbhL3dWk8=;
	b=C4StturJXacAQ2ANcX569EvF6V5YIolkfuMQX/u2iZ4rVbntS88QZzKlRDugNpb/qeuI
	 ol7os+dFvI2pim2nfHz411yV693eLWegoCAmnOyLcoPF8eZ7JDs7FjEbNxYVe8bVEX4Mc
	 03Pvb491wt/hUWIb9f1Uznc1jbtx3RvZ0v0vuh6cQEfKaAbx/Cj1snns7Qf0Gl40r9hz3
	 9hjwfHK4PIWl0qQRhM67EvLUow3WNkfYe3fS5guNUYDqFyZdXAKsoFFEKucEiTOYn6uv+
	 6pd+A3E3TrVmQDq8gvnQ6p8+dUZpkkpq44KD8pdQ0cPIiMQYMqSsLItpQWsASEN0i8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CyNEMifS;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B206D606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B206D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CyNEMifS
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so3347435e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787469; x=1794392269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbuhfSlfgFZ1tnBuSoCDBMKfZMfXYTX6enIbhL3dWk8=;
        b=CyNEMifSVUvkTiaf6KkOAei9iz6weszH54eAirXWayP4n7wL9TezYOigHf5joDbBja
         S8wK3tnIvZ92VTIq1L9pyaHv2pKagv+UCZZ7nZkVKoW5RvgTdmPteRu/OxZrHiL9upkY
         VhCzMqfWkaHnZgpb+uJjSCGYWdmBxAPIldN3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787469; x=1794392269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbuhfSlfgFZ1tnBuSoCDBMKfZMfXYTX6enIbhL3dWk8=;
        b=nwXxsdeaPUaaJHvQT/l6deiMTRumQevGzQ+yRR3XGRVmPszeX5L4/SPO21mNED3le2
         rqNbOSrB/Wz+1c0un0uN8gnIZ/Z8Kz2VDFW9sWNrRqXk3i9L0MskUJ6w2ZnAXRuKP7K2
         gBtYSDDlbAZkiONp3qbKngbnEiy4ijgNfkvegfuXsij9pzAIyP8OGOO9a44KTFkdj1OB
         DK5Xl4DEgxbbIbZCbIxqFluivCeEVjXJ8980LZ2w2IO117QH7X0p1opu9El43Y/3hl7r
         odG0S8S3O6EH4/gzTh7ksHI1E9ateD/3bGD/+Q7WkDJdEhx/kSbX+hC671IP/nLdeUey
         HQKQ==
X-Gm-Message-State: APuU4Z+Np5nAZ8Y2rFZp9gqWyGPXxtbRjcYnF+2b18RzJC7jrjJNn/HQ
	VwjqrL7Lde1lvKhGH/6PXFKiGovyvBLOCAqIFa1sR6X7i/ebFeI1Op6OPBPSoKHJEY9LvD6QZ3a
	1CKaS
X-Gm-Gg: AYBFou2WHrOVneRqX3CfzOPIGjiWXEqprsUF5PcDik1PrDkBiffdD41Bjewz2EghCwU
	80YezrgRrlC6OJ7I7AQigBV5xt+NOhQ5qtgpbm0bxayqvCSxKk8WyGBg9WZDpExAjMdwTxV51sz
	+qOT21+MzXSu4HgVtoztfiztq07wPBIQ7pAi+lUY4Wnk98YbKfr9sq7fodTieeUXpOmw3DmN2CJ
	a60dPnjlLUby7ANCeDOz39atAxpKiJST93AD+GB90aWLxk+8npU9ys5bkmZ6CZs575FaMSAYgS4
	nvryDmSRCXUXOOKvu0gm0j7p70cONRXZS67CWmEaCzN37b8nvgHzt5J7aCuc9Xh37t8PqVm3w/m
	ZbpinXdQCPUQhj/cr2PQ3B6CRFS5K0+j7IPsejAt54N0hIsIIpWQjHnVoHhUi9JXCbBa/rqOhQt
	Whdj2JoM0QnPQpxYRylkAvMpWQ3uwvTiurtREVyUwTA9f2EjeDJmeXPHfahbN6C5wJlAKxwJQzt
	ptz9ofJdd56sscKg9cQKNwwulKrJbTqRBpn8J/J+pmQlFeSwlvu6sjRo74T+U2sGEc5Ba2d57ci
	5YuwCa6oETJ+mUtphrZ5XIcHyoiF+4lF9d9MDSQtisXuv6BaZogxup6n8ZoQmhgVv8iZWBc988R
	kBiY+cAOOJg4MHV+/RI3pG805/EF6WwdJ9xxgckyuVyHYP3PS960S
X-Received: by 2002:a05:600c:1f93:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4ac180f299emr332117065e9.14.1793787469058;
        Wed, 04 Nov 2026 02:17:49 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb51a9csm3035105f8f.59.2026.11.04.02.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:17:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v4 3/3] clk: ti: dpll: apply the spread spectrum configuration right away
Date: Wed,  4 Nov 2026 11:16:57 +0100
Message-ID: <20261104101732.4043372-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
References: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
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

Changes in v4:
- Split the already applied check into the disabled and enabled cases
- Keep the reverse Christmas tree order for the variables list

Changes in v3:
- Skip reprogramming only if the configuration is already applied
  to the hardware

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

 drivers/clk/ti/dpll3xxx.c | 56 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 052233f2e12b..b48ea0492378 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -690,17 +690,22 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
  * @hw: pointer to the clock to set the spread spectrum configuration for
  * @ss_conf: spread spectrum configuration
  *
- * Stores the spread spectrum clocking (SSC) configuration of the DPLL. The
- * configuration is programmed along with the DPLL multiplier and divider
- * at the next rate change. The hardware supports center-spread and
- * down-spread only. Returns 0 on success, or a negative error value on
- * failure.
+ * Stores the spread spectrum clocking (SSC) configuration of the DPLL and,
+ * if the DPLL is locked, reprograms it at its current rate to apply it.
+ * Otherwise the configuration is applied at the next rate change. The
+ * hardware supports center-spread and down-spread only. Returns 0 on
+ * success, negative error value otherwise.
  */
 int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 					   const struct clk_spread_spectrum *ss_conf)
 {
 	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
 	struct dpll_data *dd = clk->dpll_data;
+	struct clk_spread_spectrum old_conf;
+	struct clk_rate_request req;
+	unsigned long rate;
+	u32 ctrl;
+	int ret;
 
 	if (!dd || !dd->ssc_enable_mask)
 		return -EOPNOTSUPP;
@@ -709,9 +714,48 @@ int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 	if (ss_conf->method == CLK_SPREAD_UP)
 		return -EINVAL;
 
+	ctrl = ti_clk_ll_ops->clk_readl(&dd->control_reg);
+
+	if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf))) {
+		/* Already disabled */
+		if (ss_conf->method == CLK_SPREAD_NO &&
+		    !(ctrl & dd->ssc_enable_mask))
+			return 0;
+
+		/* Already enabled */
+		if (ss_conf->method != CLK_SPREAD_NO &&
+		    (ctrl & dd->ssc_enable_mask))
+			return 0;
+	}
+
+	old_conf = dd->ssc_conf;
 	dd->ssc_conf = *ss_conf;
 
-	return 0;
+	/* Disabling SSC does not need to reprogram the DPLL */
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		omap3_noncore_dpll_ssc_program(clk);
+		return 0;
+	}
+
+	/* Not locked: SSC is programmed along with the next rate change */
+	if (((ctrl & dd->enable_mask) >> __ffs(dd->enable_mask)) != DPLL_LOCKED)
+		return 0;
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

