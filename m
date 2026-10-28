Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173500;
	b=f2Qw714GIoXE3ir9FmMK0Qj/X0L7I4w2/luK2pnvbdvpOlpZ5lo9FWHyUOQKGI2hPNkL
	 fxnSnD2w0r65Cm24OtMxk8S5Yg1MYYsCw8DlCX43uQD/7xeOHEKhi4oylnjicAyKGWlkM
	 ZWuhoWdqzub5NrEM/xm1mL4pjMwZ9YcaDxMKqCq5urTYJnNDiVE1IDZ3X4cJkZf8EUhEN
	 KuHMVP/f9VbvOCdyWuWQbg7nCOLBY6XsITLASFUrqsqcYaroBq0j4K0c7BxgsLH880RDg
	 3kvZQbM7YewgiPhg6Gw2e2JaPPzoApolUuzbw2F/JbFsHZkPu/dmVGkxkTiwSevFxHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QgCBPMZCOQV3dhf3hMT8g1VGDheFKuoWsIpy3UHh9yk=;
	b=y45w8oXp6iDfHJR0vh17zA5mTNPEEp6pZimq/fpuCahKfMqSWSSMkQj4hO1P6T6NgBh7
	 b9wr2Dub7ElqNUGfJte/mO1cAuOhqfuCRhOySWNvn7gRzCHa3N9yUjCP5NHiWXAF1evv8
	 rtPB25rkwJKh6I/WkZ5G+wVQGhqqiitEztLyEtCRNtlUprJqHW8OXNcLDA74u0CIAwzBW
	 FBL6YbTupovaqlzbA2qscgqL5Ak2QHgpPLSjk+WX7BGtppMOgTIRbO/gzKs3bNFa7R+hb
	 +nFKg8XATnhzuUVHvrey+5ZFgzTVY/2kR3Z/JrU88S+s2dRTdapdhEU1KolHc4HJYgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b="eN1+/EYN";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D3606A334
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3D3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eN1+/EYN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso378363f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793173485; x=1793778285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgCBPMZCOQV3dhf3hMT8g1VGDheFKuoWsIpy3UHh9yk=;
        b=eN1+/EYNYIDktRuxOw3uNO+DZhgK1GWfGibNOD5IQI0n647iKIz1uwnOAUiKB+IaUU
         RGmtoSAUHPd9KTANMfgITpg8Mc3y89eyII0bdCh6frOc6UEOPfv6mhFQ8haF5svShK9E
         9KZXLr3JaUq2J+MR8hBkWNAmj+iRGkD2iXYtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173485; x=1793778285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgCBPMZCOQV3dhf3hMT8g1VGDheFKuoWsIpy3UHh9yk=;
        b=dqbXPKSL7VGXWKkmsOae2Pou7tnkD6iM6uSZQxw+h/Rik+uceVcNA3BAyHyiipI9nm
         bOj1WCew/OBqC0CNvY2t1a4xyocjGVSk4+c5fPh3bGBac89EOYyI40HKajw0+x54dhDi
         nHhc+C/80olXHyxLYS3WMuiOnOJXk9EKLiz8QzCA5koDTmiB+BDbF3msQJ7rJMS/CFDF
         PU9tODwOGGGb+XGqR77+64ld4EOMLm9DDWWjKL+Bu98utDVRzA3y8wrU1flxwmFSa6/f
         DM089DDmnmHA6/zyKGkBZTTQl7FIKsoOgMDNhhG3SDeofWjoXxhdzHOh9HIWhHyAk6Jw
         Qc4Q==
X-Gm-Message-State: AFq9FYJrce9QyRi+bqGSWrt5TO3Rozz5nlOX1xrJ9RQJH4QOoND2cfXo
	o8K+JrFa5OP2xWT5QNwGeNyooCeygK6fFR/I1WxtYPJkUeYE1HgWR41nEX8jzek4ME36RIJBOq9
	hsO65
X-Gm-Gg: AYBFou25v6ze976U56IEHjrjV26Gph9QyQrQQQfoodSDe+IAZr2pUcQE/97PRvKM2YT
	ceVObFO0u83dU4z+NWKQXxzB8uoyawxn79To5c1eabL601UHlvM+AIbHBJR+K9NKuZupCbGJ6FZ
	GfNWx5p/Ae6VGgo19cTll1mJxRMCnk7KrqvI+DxIEi+8SDclQ8kPx7h20DE+Cd4car+FJ3cMAuq
	7g0fO/ntfd17ZJfFXdoy8COUuEj9tWT/RQeSusRsnI+sdPaeVWAcQ2lWZMR0eJA3v87oFiFMlLY
	PpAcNQgSQw57SJO0puMdCUOw6I6nwyXYSqcYx3AxvzzHO/Rv5LTZ2QrGtBvGIkDp3ZY6GkeJsre
	X4F3JNO1agxGNN8jTAxsuev1w+SB07pNx0lAtvBeEh5pz7Ze05RvWgdZOqhhDtwtmSyF0+iG+vx
	K8C8g6a39QPIcCKC1TsLwcdkDi5bRsRkcy8bk0Y5ilnRZqXXkjGGzQnl/vw49/yJAL1giRgCKD/
	19m6vQR7SLAxexHnvk7Z1/3w+Gx5gNPhluJcq1/vuI8hQgnUi+sASECbjfNA1ldhmn3T1hb65mE
	z0jCsdISwtGntBzPSylHHQuU849s1Sd70CJKbHkZQpDABN/RclF69quw2WZ8MQ59l2dqya7QPwg
	tqAZVN0dKdfW2HJZx9d6uwGc12kxn/fOA+hPeFWET0RCECnGPgxJsdrdNgQdopYbZX+ZbdyhXZ7
	EOPgq9o2DgmaZAyqDf4LAoaTKsXw==
X-Received: by 2002:a05:6000:29d7:b0:48d:f6d2:9c88 with SMTP id ffacd0b85a97d-48e5d5cb889mr2331992f8f.47.1793173484835;
        Wed, 28 Oct 2026 00:44:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm25324882f8f.7.2026.10.28.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:44:44 -0700 (PDT)
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
Subject: [PATCH v3 3/3] clk: ti: dpll: apply the spread spectrum configuration right away
Date: Wed, 28 Oct 2026 08:44:09 +0100
Message-ID: <20261028074436.1958132-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
References: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- Skip reprogramming only if the configuration is already applied
  to the hardware

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

 drivers/clk/ti/dpll3xxx.c | 49 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 634fe0a1f9fd..d32d81a27bfe 100644
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
@@ -718,9 +723,41 @@ int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 		return -EINVAL;
 	}
 
+	ctrl = ti_clk_ll_ops->clk_readl(&dd->control_reg);
+
+	/* Already applied */
+	if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf)) &&
+	    !!(ctrl & dd->ssc_enable_mask) == (ss_conf->method != CLK_SPREAD_NO))
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

