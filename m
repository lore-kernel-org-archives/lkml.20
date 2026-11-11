Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426290;
	b=PwmdbXBzpXwfwMUVzmggcatWh8lswZ//DE3cHep2+nTWo05lj2+5ItYSU1BOOQUucnNK
	 ZvKISoE/y3bVDWEo2bGZba0FDTrGDObS+PJIIhgfe+wWwNqPzhZBV2BhUNKfpsnR14FC7
	 prG+Acpwbiu246IAC7SeBwfgq4qs9boFTQ/rjoc3ZHRqeBgi2OHvg8b2I7rO2qc5nC1Cy
	 Bl0tYYK1ZQFZV/rKRzD6n0hRwL7KUhiD/b9ExKDFrtS+1CEUVlj8Y2sNkRjAJzyMIGUoh
	 xm3XsHV2rIFLLk9WVwjmh9NljU36jSAVWlJHFK40Jywu1cnlMfOAHmz0ino5dcEL9Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426290;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MHzk4Y5rg8a5GL6NtRlws2skWgvMQ4aNhHaizSYchuA=;
	b=XWGvkj/7zj0S7lSYF1SNDtShiLhQUK5AvZEBHjOjCvD82yOPdGbhCkFZeEOGOL1IMWM/
	 7/nZEK3gMLQw2jfCGZoNIE95UwcAlJmEL78vswSd9HLbtzFhh7dgdqK7pZHQssciAUkXX
	 v1cbjIg/B47od+Wh4+IedqpfmXavbodz/DBIXoz5QeBQNQoKmRKMx5f9rntvm/Us/ltth
	 nThfa72BH+5MzUxuQdMoUHW1kn5rJ1k3GpPmA2N+CG9F+24EbDQOWqaIW6Li8Agvcjzzz
	 NCRGOEhJwqjcF7kScBm8peDvzk1UpAE4D+TcxzohaN8hekj1sh0+uxb6r6qTipcPoJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f5hB0CDF;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39532606A8BB
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39532606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f5hB0CDF
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2633204a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426289; x=1795031089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHzk4Y5rg8a5GL6NtRlws2skWgvMQ4aNhHaizSYchuA=;
        b=kUBPaYbRRZS/gVn9+NWCza2RA6DmNFTtKW3lm4VVMg+azHtbAKrYCeHmd8/ksQoWJ0
         HljGCozBw32LUlnRHuVCAltGGxTMT95kIVK1nHE89B06B3iz3YZtFX0gdo1Xv57jxi8S
         QI2qhMU+lFIXZl7BDCBp0M7XOYUYXL3hegOL64XadYG5MstVg0gKIOtJj2jkpd1lcM0u
         l7xcRbGTpVsEPgcY2VxLyBCtiRiRgUR2Wir5SON8Rpbi+iiODPdoVOSG9ciGmdAxzVQo
         a/jMKGVxpY0oErKk0S5RmvCD+KO8d6gTp+26zauPxUu5CtJd+CYalpO80KYHN3I+zUKf
         jTiA==
X-Forwarded-Encrypted: i=1; AL+hErHMWCxcjnfBVJdrtLPXPCfwo+23baKN+DIbGMEvSnQIWEMA3sorjwCS1xjnEZlcZVkoiqnlu8LjuT+MWEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IrWUcTbZDpCA3xUFfcMKLh+3kLrUsRO1nyndoeM7Qk2Zxqz4M
	KW1ZOpYQYvLbb66J8R7mh2AmRBziNLZn/ULjTVLcdISsrVZALAigQOhAbROVima7NTTc0YL5xtQ
	bx3Xi6piWU2EgVzGnSzQSZ6ztq4mBsG2fkWcL+ByX80Q/RK66xR5DEcjXs9fZjp5hAR9szj9vm+
	Ynv+0wptjP2LErcRiKW3Sz0r1EefSS7TdpwXWroDkDpDpg2DtDv4ge7w0AFf/A6zwlGTChY8sVh
	He4w7E/udYbt2QP
X-Gm-Gg: AYBFou1fuvXHHCruCqigwxEuFEBxRBiB/7ZKp8zFfljXOH+wnDgVf+nKZmFJjkx9vJY
	DjZX2nlgJ1KN5joEO+ay/2onyH0NmQIRuXU2/WsvFrRohbivXzv6orfQY2gMMVEmWcT3IAg2/BO
	HiC2yJ1RQYWuPUsxcfx8GvQHMQ1m1QI5TzjA1giXpAqc76dQvQEiqNZp42DGvM/m6pkVGNCMMeJ
	N4houHgESti2aPEKSgoJTdAS+AOEpljvfv+zEmKLdWcCd7985RcO4ydf6sMIDEdCJaKACeNyUUv
	cqQDMUWgeMXzyTVvLbaPhs14SsZbztAJrBQwuMhKztmtWGV1NSJju5fOmu46nl9vzz7s0C5zlDF
	diNdKAH4FT5qxtXtuyLOlGZUtaNFVutRgXMyDXZJd6bgxPkppp8QqB3t1sFeIn/tpcyAEtz+D49
	pIslT6BHYM7YHdOgIvXpSnpw3sakBHUlWK
X-Received: by 2002:a17:90b:54cc:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b182eda812mr3307464a91.27.1794426289398;
        Wed, 11 Nov 2026 11:44:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0b6asm263093a91.4.2026.11.11.11.44.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6680009eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426288; x=1795031088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHzk4Y5rg8a5GL6NtRlws2skWgvMQ4aNhHaizSYchuA=;
        b=f5hB0CDFK1jCxFvsi6fFgMsT17qGggGNzWhUDj45/YPVuzErzkgOOT2rcIOxPGWkm6
         qs9N4SbC//eJ8Ap56sdArL6uxlKttQZz+a5xi4YnoNZFJHkwlsJYBeojQiJWQGWUEki6
         DN7WSf+kDzyw2NWkhcdHBJOqKcd/b+BditLp8=
X-Forwarded-Encrypted: i=1; AL+hErHTaFyyiqOM8IPeqiJpiskV89WvNCNw3brRLH5TUN6o/Y//iKAF95NF0iBpd8qfsD8F9319dlR642IRcJ4=@vger.kernel.org
X-Received: by 2002:a05:7300:f143:b0:36a:1089:9836 with SMTP id 5a478bee46e88-376855b265cmr3502320eec.15.1794426287310;
        Wed, 11 Nov 2026 11:44:47 -0800 (PST)
X-Received: by 2002:a05:7300:f143:b0:36a:1089:9836 with SMTP id 5a478bee46e88-376855b265cmr3502291eec.15.1794426286576;
        Wed, 11 Nov 2026 11:44:46 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:46 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v12 5/6] mmc: core: Move and split reset functions for eMMC
Date: Wed, 11 Nov 2026 14:44:25 -0500
Message-Id: <20261111194426.1652644-6-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

To prepare for a subsequent change and to simplify review, let's move the
function for resetting the eMMC card a few lines up in the file.

While at it, split the cache flush out of _mmc_hw_reset() into a new
mmc_hw_reset_recovery() function and use that for the ->hw_reset() bus
operation. This keeps the flush for recovery, where it was intended, but
allows the card to be reset without it, by calling _mmc_hw_reset()
directly. That is needed when resetting the card at system resume, as the
cache has already been flushed at suspend and the flush would only fail
with a timeout, after the card has been accessed by firmware.

There are no functional changes.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/mmc.c | 73 ++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index c936272bcd81..026003ba507d 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2271,6 +2271,44 @@ static int mmc_shutdown(struct mmc_host *host)
 	return err;
 }
 
+static bool mmc_card_can_reset(struct mmc_card *card)
+{
+	u8 rst_n_function;
+
+	rst_n_function = card->ext_csd.rst_n_function;
+	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
+}
+
+static int _mmc_hw_reset(struct mmc_host *host)
+{
+	struct mmc_card *card = host->card;
+
+	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
+	    mmc_card_can_reset(card)) {
+		/* If the card accept RST_n signal, send it. */
+		mmc_set_clock(host, host->f_init);
+		host->ops->card_hw_reset(host);
+		/* Set initial state and call mmc_set_ios */
+		mmc_set_initial_state(host);
+	} else {
+		/* Do a brute force power cycle */
+		mmc_power_cycle(host, card->ocr);
+		mmc_pwrseq_reset(host);
+	}
+	return mmc_init_card(host, card->ocr, card);
+}
+
+static int mmc_hw_reset_recovery(struct mmc_host *host)
+{
+	/*
+	 * In the case of recovery, we can't expect flushing the cache to work
+	 * always, but we have a go and ignore errors.
+	 */
+	_mmc_flush_cache(host);
+
+	return _mmc_hw_reset(host);
+}
+
 /*
  * Callback for resume.
  */
@@ -2319,39 +2357,6 @@ static int mmc_runtime_resume(struct mmc_host *host)
 	return 0;
 }
 
-static bool mmc_card_can_reset(struct mmc_card *card)
-{
-	u8 rst_n_function;
-
-	rst_n_function = card->ext_csd.rst_n_function;
-	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
-}
-
-static int _mmc_hw_reset(struct mmc_host *host)
-{
-	struct mmc_card *card = host->card;
-
-	/*
-	 * In the case of recovery, we can't expect flushing the cache to work
-	 * always, but we have a go and ignore errors.
-	 */
-	_mmc_flush_cache(host);
-
-	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
-	     mmc_card_can_reset(card)) {
-		/* If the card accept RST_n signal, send it. */
-		mmc_set_clock(host, host->f_init);
-		host->ops->card_hw_reset(host);
-		/* Set initial state and call mmc_set_ios */
-		mmc_set_initial_state(host);
-	} else {
-		/* Do a brute force power cycle */
-		mmc_power_cycle(host, card->ocr);
-		mmc_pwrseq_reset(host);
-	}
-	return mmc_init_card(host, card->ocr, card);
-}
-
 /**
  * _mmc_handle_undervoltage - Handle an undervoltage event for MMC/eMMC devices
  * @host: MMC host structure
@@ -2410,7 +2415,7 @@ static const struct mmc_bus_ops mmc_ops = {
 	.runtime_resume = mmc_runtime_resume,
 	.alive = mmc_alive,
 	.shutdown = mmc_shutdown,
-	.hw_reset = _mmc_hw_reset,
+	.hw_reset = mmc_hw_reset_recovery,
 	.cache_enabled = _mmc_cache_enabled,
 	.flush_cache = _mmc_flush_cache,
 	.handle_undervoltage = _mmc_handle_undervoltage,
