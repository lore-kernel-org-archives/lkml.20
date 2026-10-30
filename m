Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383882;
	b=aTxCmZ8pbByCyI5k+ZrxIT8u2VTMUnTvZzZM9ihfj1axGBbIlL/8M+gHUCHU3WWMh4hs
	 FoER7h7zdIOUYXn0uVH7h5tu5VwVNjWI/T4bCG9ood01jXappwBlattcGNFlbKOoJU4YR
	 mg6ZCdG3yzPCm1W0YXA+c8f55G8Eg52IUmZUMnDQ4WvYZs0G8LmDadau6RFJu+8sdQpet
	 wZcnZoxmQ1yGDZIR1pKyAhErAtmzt2LGi0sMZG88Ujff1jU9EpR0iKnRYXPSWRCWhXiB9
	 ia9/fsTQhMmjr6hWqPKzmvGGh09cnO/WPlkvM/Zk9mAB3QmGWgIZbsVyn6jYtX1NEMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383882;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=0+uaoRo5l36iC7XTBrb03pfY3TZLNhetIMMz75SoQNo=;
	b=tMpBXDEf1OyaEojRDC4MmiQYIwtO3oBTLNHPUWbzJlvJIpig3pnINH2JqEZpv/VOBMr4
	 Ci5suKYEGgwnaV1pn5ci82bzc+b6M/4RBsuBNW4+Y3WHGMEYMKxjJ1Y0RLN1EeIit3rJd
	 HfeuT9nn6Gww/AxYGW+khi1KqJn1Qrcc/UWvK0WDQxHqPcE1hdq3cYeRzrHNZltbgxT8b
	 yxAV+ESp0cwpnbCAfdPsYkroOMS66RkujKFecX5XdLd7WrVhaklrLKRe2rRIbqXDCX1XW
	 Ha9BIOmKNsXdbpcoUUv3Pieb1tufhcc5IZX3fxN+ZGf8hV0RVRVaXEWdTkkBFqnLlTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lj5YJ6v5;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B4860A260B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B4860A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lj5YJ6v5
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93f2493c28bso89994385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383881; x=1793988681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+uaoRo5l36iC7XTBrb03pfY3TZLNhetIMMz75SoQNo=;
        b=iXwX4vpLAmidL+sjw7B2xl7s4z96TYeucV5yI7pJG2l8izt10Kh3JrtrcQ7pidDEFn
         NosHSu6Yh3/ySk9Mg8b7L3Ed0s3PyDr+IqkSG47rf0v5cT4SYIPyZmJq0c03yRloBsHg
         Y28l7G9CYCk+KrfY7l3rAThZAUU2lKqUJ5tYHxN3MN0+bofxN1HRgWEN4j7GS/YT0pFE
         ppuCjetKL/pTZIQDL2u5M8j8y16Npn76keBCi5Rq9r84iGDddXfYuAZdVd0MbAlq35Xf
         UINcG24RwFFKsZQOPe3n3n0w/cJmUHusSphoCHWyMgDm8SeIVI5oVfXHTFWedQGEfTZP
         4myw==
X-Forwarded-Encrypted: i=1; AKwUvBw1JkB5i5Ty+IYhtSep5dhEKXNAVHm37n6wSU8P1/CIGSaksG59fwYoV+okiwyYp5izSK5KhP28mQYuP3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZW8jVghNCMAHxROlpYw9QtKMB0Se9YwWUz7Af4v6ePpX7xVIW
	lgVRQCnhEVD4lQhTHOpUv9rDP8yXvd+3i2NkJfBW9Z+RF4DI7UWxe7a1YEK2KajTtFbyPO0bwy9
	pNl/akVWgIsmHkLIQYnq27YV1l3CrO4aX6NvLNT1CIDA3fpedP2lnXurEdfpEvfRpsh9jO3j/tV
	C/wud0Hj+tHiQO4FQXQ33xfTg1QrKVMgDrWydwJ1LLbrD5uijH+BD6sDW9OfMRtBHNeAqK2uPme
	TEUZzpqJQwV0CpL
X-Gm-Gg: AYBFou3u1XT/EK2nySyZFubqSECiqLPM3Z2uwXvPg/nSRUo8jTw/RFhJ4pp/EQZaxkx
	Jg2KlOUNT65Te1ETnndyZe0/DhtLcNhvBL6kQ1NkuESh/X1rYbOVCpwTZ4sYspFrE/+ZG+du3cZ
	f06l95KK+wCO2gwdDbugrfh1/iBswDXwMEjHqRNQxx1ojaDNOhwUQq9AXnZKiypqfgP9bjAlZfJ
	uAIcUFc+1CvPaG43E12ATZbLkamjbBnOorsTzl41L8UBB726YjeRHN8cDl1GdFSaUPhnLdFHqPH
	hfbHJr2yI5FBmFNdLaJq2nykixT486b88VIUEdP7CgNiAbIEKfHR2opGAy5Xna04w259dDk9fY+
	N3O1+OvlD8sZkqvr7V8KN5Ivtl6GH2dNt9vhmgZrzK3pCyTopIc8ZutGSbu7EzQcOS+q5ESgdTR
	f4VGrYP/FSa/dBQaRdv/OYB6kZSF1mis3o
X-Received: by 2002:a05:620a:19a3:b0:93f:33a8:8e84 with SMTP id af79cd13be357-944217a46ffmr532314585a.56.1793383881156;
        Fri, 30 Oct 2026 11:11:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9442582a2cfsm23834585a.15.2026.10.30.11.11.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1acbaf81bebso1089517c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383879; x=1793988679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+uaoRo5l36iC7XTBrb03pfY3TZLNhetIMMz75SoQNo=;
        b=Lj5YJ6v5jl9irQB/CVxMAEs4E75x08Vkbg/50xpvYKukWvA73aWmC31gyrddXHC3TZ
         P+TPJk0Wuzqe9DAaD0OrMSK/Wq0q9fbDeN92SfIx5QN6ZBz0KCIzkFSVIAfAWCFWUTwc
         EG2sgsqGXXtDOzK9KXgz5alXelShvq6zTAI94=
X-Forwarded-Encrypted: i=1; AKwUvBx8a4ZGj6AG3Y6yZEaxDW22KTeTYk25Q/tT4KCoxljer5J+QixmxDp831rYHTZMqp8XZQM26ZTz3lzKpfs=@vger.kernel.org
X-Received: by 2002:a05:7022:38b:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1ac5c45fd1dmr4838121c88.15.1793383878402;
        Fri, 30 Oct 2026 11:11:18 -0700 (PDT)
X-Received: by 2002:a05:7022:38b:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1ac5c45fd1dmr4838041c88.15.1793383877613;
        Fri, 30 Oct 2026 11:11:17 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:17 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
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
Subject: [PATCH v11 5/6] mmc: core: Move and split reset functions for eMMC
Date: Fri, 30 Oct 2026 14:10:32 -0400
Message-Id: <20261030181034.3811225-6-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
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
-- 
2.34.1

