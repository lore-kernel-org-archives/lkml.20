Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000825;
	b=zki+spCk8byqhfOCAW01zogxXfwJr75lNFoNogSyRgK368XJAeNmuMiLbaLd2FzHmwX3
	 0XDlTO37VvYcIK6St8bXQc6AXExahOqJtDpSbqPjl6yv3vM5Z/t05bAqrQPAsILjG8fjT
	 JF+J7IT8YkBkyFKskGP3P04079txyO9fZua5NksYupZRV8+Xwj4BbITEFDnTnEqNWfHJI
	 PlLtQmUtvLP63NTqVVcF0OgLYKfu4wElhGa7F98LGbg1f4shgotrUTuSF4qcHaOZoY1Oj
	 Z6BzIWx7FFUPo6Kc3KZXSk/TcacdeWuZvYeggnskx7oOS/szQidepB2K1xAfq0MLAdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y/fMNupjmUFDA4Fs7jz5eM8c/pdIIe9SGMOk6RgTsFc=;
	b=iLqQRiO1XSIv248SXTdpfIeSt1tLcfw9KJ+hCfWnTn8eytUFeEiMHpk5y1evTpxUIocv
	 6mF2gix0gMDkPi2AlkZhIAoYzPtu27f6j0M2xbabEKNgL0yTHTQmfsPqhi79xUfBvy3g+
	 Jk2ZnSDKFupBFUq8/qTS2CPHN43/drhzM0tKzE9FgIZso3f4ikRZyE1rRnJ1AVQqEMfjd
	 OPdnLlDn7UpkMnDtg+1XgcpMrLJgLDc6n94Jlcu21jEc8zNPFK7apZlmjvoVAgBDWRx/z
	 tC5XUojVQ0JsawDISN/+Y5xwTSTxlaznD6iWxcvdf3T3c1xGo3TYZcoklQLW8ae2v2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ChnSGDu5;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70321606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70321606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ChnSGDu5
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfb76b304so162721f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793000824; x=1793605624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/fMNupjmUFDA4Fs7jz5eM8c/pdIIe9SGMOk6RgTsFc=;
        b=ChnSGDu5hUuDpuWIH9opEBsyTk71WKjPlowVCbcYkco7zRAYFTYFWR355PNsm3a4sa
         2Hn+3ixvsq89ZYW9QBpqodArWQ9uw9Zh/QpIcMpDbsY/25Y8ndmRr8VW803t2vSoTx0w
         uKcrxv14SSBF5FhIgdvDejvWrtBod57QV2bFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000824; x=1793605624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/fMNupjmUFDA4Fs7jz5eM8c/pdIIe9SGMOk6RgTsFc=;
        b=MFbkzGnTGTZVFJ6l1aAg1/ppabjwcuMJ6hG+NMTebauLh2iK60QqtR6g13ro2mSttN
         WsZ6ziJ7BupqfKeZK+iXfuMN6cHc/vw+4eO3imNgE7/o40Soqr3PQxG/L2wo/HkXXazs
         XzXmHXiIi1IuKGAjFTE6Aosa5YI1l9jZx4I6EcPdW1GqK0iIMubfPLTQV0xyphtoghi9
         IUars9UrTlh6jkaoZXC39FMLO4ooB1qfQ8kmlGHXQxHrMLGEhMLmPeBvc1rZMfl/bF28
         rkIvVLn5Ajm3YMrbTSf2Lk1a6BcQPrkN/fHvDO9i7gSnQ7AfuMZ16Iu0mV1+TWBiFYP4
         vLZQ==
X-Gm-Message-State: AFq9FYLJnzO+vN/Ue/M5t8AIRSLx5kJ7+HhwFyCTamSjFThzw/+BL0l+
	B++Qsgcc9WU+tqI7cB+bpMdRMgLclOiY0xYALmH1yA7rCC/44V3dbcD81LEAXmC7ukvGlgQLK3N
	jFX6W
X-Gm-Gg: AYBFou37aSCN0EmNfypjDGSdqWyjLbw5R+6axypNPafrgh9RKb9g3JOTtyygyrgimZK
	+ynRR+htxIECi2/E90I6mOZQeUtWad9qMfb3ilwyavk8E+aMLyhjB6KncbApj2s8O1Mv1ld8D4B
	jnF9qypm6vWjl7bub03Twi5sUCCgC7JG6BWAV+D7Rhwg5lD7NZcuMbLzqHk6WFVfztBUXpd4O/7
	vYnwoLunulfKzWZWgIRf28hDa4ED2fpYFC5QXYgooyfvlROEfVIeR7TKZu1N/D5RmusTBXVTq28
	c4c+antram73Indzrqx0H0LANzjrMboxvxqumZBN0AJumnKz10NVVSdpAFSrkLUlBxlvM2iwHLe
	NseBIL8Q+C1ly9icT57z7rGqTHsp6cW5qOpJa8/piC//GY2zT9PGH0eyEbxPjlazLjUrGavpiNV
	uxGyHDmktB/kd5LmOPmeCQtdhIvZNO4n8h6qN75JOBLA99vFSqYgKelxQlZ48wqnQtwMwtYeF2v
	Y5CTBIu2bE866PdEEgGRSKeDBas3ELKwdUUuyRasyj+ecXF4olh0cyRjV91DHvVmqz2iFdN2KFw
	dUmdjHWWNCKHx9bNVghBoo3+5iZtUzaGpbPBnSXjqNle0KdJXRIRk2EjzThEy/o2GE34dw5qwIj
	Rfu5EQH5+BfsjXhm7M5Y3otWF/uxrzlfR/c8JSuv4Wydz5AfG51wtTg==
X-Received: by 2002:a05:6000:1185:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48e3eb8bd5cmr7348794f8f.27.1793000823908;
        Mon, 26 Oct 2026 00:47:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm13731353f8f.7.2026.10.26.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:47:03 -0700 (PDT)
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
Subject: [PATCH v2 3/3] clk: ti: dpll: apply the spread spectrum configuration right away
Date: Mon, 26 Oct 2026 08:46:29 +0100
Message-ID: <20261026074654.3997494-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
References: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
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

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

 drivers/clk/ti/dpll3xxx.c | 46 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 634fe0a1f9fd..16da86fbb25d 100644
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
+	int ret;
+	u32 ctrl;
 
 	if (!dd || !dd->ssc_enable_mask)
 		return -EOPNOTSUPP;
@@ -718,9 +723,38 @@ int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 		return -EINVAL;
 	}
 
+	if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf)))
+		return 0;
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
+	ctrl = ti_clk_ll_ops->clk_readl(&dd->control_reg);
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

