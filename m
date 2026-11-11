Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398980;
	b=z1j2HXC679m3eXceIOhEPUgzXGp8vlJJjjvFUuCpKSEp/mi+ASCkZMmiUqg2eEcKUP8o
	 O9jQdrZRyKIu2Lg744IbvTIxwlxyefplLzy+k8diR8q7ke00S1y9nVt+B1DDLU8rjzQTG
	 wCzuG6UAFeH/GYxhlJl5Hjd1GZvPZAJ6nsrSBeVYXbHt6r7t680A+r5PZli4P1E8wCaOV
	 Dc3EO0VDYX/+SdmgBMFdww5msDx9JNhh/wIuxtCvb4Dwy4Z7HI025pCrky4HP/2mM/ntd
	 VplVteelCQ+YKq1uc54srBQdauFatfSCb2nYWXyt+P96J3KdNPrW3Z2KHfRRW08fewA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398980;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=dR4PGPQckLV9tTndULMkzgy4WYis6HK3fE/gJso4XPY=;
	b=MFJ31HbPp2V9/2+424j/jQWBDSXXbubo3CMP0V1Ms6nkLMaNVhH8l5r5J++GZgkzvb0n
	 F76CYx7qNOKE/rln0vx7+EdwDgIvAemLdQtGGwcYmVdQkFIPdbNydfvyKRWRZXlWhqDVZ
	 BOYwLPCZF9FgWCKTcUpC5Ftfx4vMbmXnOa9ITTbsBj2fUUnscFenx9e7Loc+dXGjWb9Ya
	 P9EGt6rzTHMD9XkqsO8L7DENo6e4bpfll7xos89FxNLlG+tr2bhL6uzj2yL2qrXmOifQk
	 tUZHCmXGT6F1PNujnLd8Lu/qD7zMYeHtOBblX3WuQVQZnY1z9svXUzRRQtTxFfldBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=michael.haener@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=YrXHGL17;
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B46606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B46606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=michael.haener@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=YrXHGL17
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261111120939351cff2ade0002078b
        for <linux-kernel@vger.kernel.org>;
        Wed, 11 Nov 2026 13:09:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dR4PGPQckLV9tTndULMkzgy4WYis6HK3fE/gJso4XPY=;
 b=YrXHGL17DFuR0z7nWtUKT+Uj2fowtv61rmp3WtNNuEZtAeWoxFFI0EfkbbXWXiIHlN8vv4
 i5j2Apd3yXaAuypGslndLfczAlC6Mu9zJbW8ToPDnUqhWSq95yEZ4/wVsiiUuYRp9z34Z2DW
 bNmgjJtksEhaFxZ62ihYIkQpO9kVFyDm92WhX7d74jzK4X/AHO4vizeVTdutfN9n3gRK22m7
 Tm5RR3tvp6KhpynQ3fkiv6pQQDsrhnFV5c494kEQnJ6WIOVqX27jKnvW8FmCACCpfoe+fbyK
 Xc4UM8nFXKL/lLi/jieU0AZeIlPpD6lQtPRs7jf3YHYoEnRc5I8B410g==;
From: Michael Haener <michael.haener@siemens.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avri Altman <avri.altman@sandisk.com>,
	Luke Wang <ziniu.wang_1@nxp.com>,
	Michael Haener <michael.haener@siemens.com>
Subject: [PATCH 2/2] mmc: core: saturate erase timeout instead of overflowing
Date: Wed, 11 Nov 2026 13:07:59 +0100
Message-Id: <20261111120759.100830-3-michael.haener@siemens.com>
In-Reply-To: <20261111120759.100830-1-michael.haener@siemens.com>
References: <20261111120759.100830-1-michael.haener@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer

With MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME, secure erase/trim requests
are no longer limited by max_discard, so mmc_mmc_erase_timeout() can be
called with a qty of several thousand erase groups. The timeout is then
computed as erase_timeout * sec_erase_mult * qty in 32-bit arithmetic.

With 512KiB erase groups the block layer limits a request to about 4096
groups, so the product overflows once ERASE_TIMEOUT_MULT * SEC_ERASE_MULT
exceeds about 3496. The wrapped value can be much shorter than the real
erase time, making the busy polling give up early with -ETIMEDOUT. No
card in the quirk list is known to reach that limit today.

Use check_mul_overflow() and saturate at UINT_MAX.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
---
 drivers/mmc/core/core.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 677e445dc48c..9730633dfa81 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -24,6 +24,7 @@
 #include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 
 #include <linux/mmc/card.h>
 #include <linux/mmc/host.h>
@@ -1568,13 +1569,21 @@ static unsigned int mmc_mmc_erase_timeout(struct mmc_card *card,
 
 	/* Multiplier for secure operations */
 	if (arg & MMC_SECURE_ARGS) {
-		if (arg == MMC_SECURE_ERASE_ARG)
-			erase_timeout *= card->ext_csd.sec_erase_mult;
-		else
-			erase_timeout *= card->ext_csd.sec_trim_mult;
+		unsigned int mult = arg == MMC_SECURE_ERASE_ARG ?
+				    card->ext_csd.sec_erase_mult :
+				    card->ext_csd.sec_trim_mult;
+
+		if (check_mul_overflow(erase_timeout, mult, &erase_timeout))
+			erase_timeout = UINT_MAX;
 	}
 
-	erase_timeout *= qty;
+	/*
+	 * With MMC_QUIRK_FIXED_SECURE_ERASE_TRIM_TIME, qty is no longer bound
+	 * by max_busy_timeout, so the product can exceed 32 bits. Saturate
+	 * instead of wrapping to a too short timeout.
+	 */
+	if (check_mul_overflow(erase_timeout, qty, &erase_timeout))
+		erase_timeout = UINT_MAX;
 
 	/*
 	 * Ensure at least a 1 second timeout for SPI as per
-- 
2.56.0

