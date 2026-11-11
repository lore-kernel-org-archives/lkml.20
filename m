Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426293;
	b=5YRfm5ytcDx4NMS6H4iOsEFfiORk+2tahPpKAdPD19dzXCAGJpD8WkB7loak1ELoCetA
	 D2Q8Qalmsw7ZXzoWcy7OB5Mfk9PLHc9dHrjDEoy3yqkgmMWLCj0Dea7gWrmNgAOz3KoNF
	 sICPmUHqD7TiLj9jHsJYcOAvT6RX1Z1QKiDiQ09ErUZrN9CZ6jYy25Fcqf0Dv9udnc6pm
	 ZX98/hPm2Tb7M3XZBHgbDKY7hSH0KZbiSPbSXk6cnu5LuIJq/uL76S84wyATTPVu8eYQ2
	 Mvt012pObX38GA8LePUn5pCWHJd0W4xLDFUKdzNTvkaNucOwNtyEr7Ii+DWoY3xSUTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426293;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gw48uU5TuI97IZTqjbPClG+wxWg8KU+drJon/k2SkSQ=;
	b=wI/TXRN7UOOludiyRda2CBW1f/0oY2KQB9fzbW56tL/gc1ZilPJivqblXs4JbbbH5TV+
	 cpWGX0Iyz1y9lo83teE8AsOYlE3t2pfEDZpRlvCIR1LYR3uof8pcBQaElSBJ5P4U6eycA
	 F/PBMJdkZ1baHxebBKFfdF709fANlbd7lIe801WjWsJhl38eZR4RGeQXvKs0PpQZ0x9B+
	 TOHmWH7/uPaWheFruo/+tNTJuJ1kgu4fUWSOVkP9VgJJCssTgjpS9ILuw8X11wtvL0WFe
	 wuasXC03mWNJNTeX161xxl4xl8gimSEKpD5IdveOoNn9JMjzRm5CdSLwnxnDBVtk/Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KOTABQTy;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C860A2614
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90C860A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KOTABQTy
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6280231eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426292; x=1795031092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gw48uU5TuI97IZTqjbPClG+wxWg8KU+drJon/k2SkSQ=;
        b=qj8SiPzB3+6dY45q2Bl5lwf76LNLLDzOXA0Du5b7lqNLja5O0JBaRuIMgaV9Tz43IZ
         dKp47kSbIgJr2tiQZ8/MPCFz/t5WVipj3o5+1ga0AT61BgmEYKk9Mg8pihtW60dp3kT4
         tyQ/AJwA4ZxUY7VWyOE3xxkmNZik8RrQaj4NzRr/SW5ez/Hv0VpCCJwkSb9hLMBTtFsq
         qF4PsJqgf/JHwUc/WjGVuGEefmnUOV5vQBXX2kICLJCXvwuA4XUV81klknHoIxghdqra
         x1DBCn6xrGhStAVoruEuQycyBJWL3GKZ39YZV5G/pYYZ8/Wt8uEInqSpKTL3LuuxwKtB
         vbxg==
X-Forwarded-Encrypted: i=1; AL+hErEbtQQ2VQRRSWUqfmbhiyDr/LpGOszPrU09ym9jHOrimkroXieUvP/K0THmLN5I8YZJCk0KBiWjRHkVPqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U1A0c/S1PILxPriZAmTmGo024DXp5wpfGJl2SN1mZDCuxhwQj
	Mjx2TrSQC7ryi2dw/h/BwpnG6lLjjZyfiVXgF6xbwrRi1JFgVmoo/bQm9XlA3cPQuOfM5JoS5zX
	iJ83O9YIWky0qG1Q2MBYM5JaS0NrPfDvFvbvZnMVvzZhB6NEBBglgWxCTJgHuuxC2mxM1aN/OO6
	1V7FrnB5IEVRlWmAhEuQL/E1SxBUmpMDskjOz8s4DeK64p5gUQDXPsvZ8Yppk+GVT/crraeAFgo
	+FZt9VKd/sd+YIN
X-Gm-Gg: AYBFou0TCZj6aBnn+Q5MxhGUQGf5EnNyxjg745tkefFOJVPg8anm6H9PqsFYIijfzFZ
	/kjFvN8IpjgbXNJTem0YddRmG8s/PcRGMkNtMrYhXHBVMcWzKsrXPnO6pZz5zIOFwZ4pEC2n/li
	9T550M8DVRM812fIA9+a5pyjqSmX1Wm1WY3om4oy89YTUUCh5ZAspviTHFbqXk8hscVi+oM6XYj
	fQTaAADvBdf9OsHocNZCq6pNyIa1/hoOz7WvhVy2JvnLx0She1giZVzfgCrnXzlR7WubXs97a2e
	Wqw2xPlAGITLkn/8WQWcWWLbVVlvPWah8gQFPy96HKHzb1Yow1YsKm0Tk9W6F0C7RmRf2UsVj70
	MkP2oa+hy6HxK6wNEYhWnUgqYWg+5wOYd4nrR9S6SMngjFMdUI6hqiJ8FiCIHahnItQKIVIMJDK
	44saVHfUQQKwGSe+UJpbuXLMbXTdXzI3im
X-Received: by 2002:a05:693c:414c:20b0:376:703c:8819 with SMTP id 5a478bee46e88-37687211c61mr4200823eec.38.1794426291806;
        Wed, 11 Nov 2026 11:44:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3776b2d69dasm15872eec.16.2026.11.11.11.44.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37628596fc9so580977eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426290; x=1795031090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gw48uU5TuI97IZTqjbPClG+wxWg8KU+drJon/k2SkSQ=;
        b=KOTABQTyMmSotnDBqowcSSEsu2WGYMXB1N5ZVC96ERVJ6H4jgXrEuqOj1J5TMU0zqe
         NOqtCkW3n+1LMjoBIxceyQzR25kXBJGFZyuVXYdA6teWUjsVIO+3W9B10GK3oa99rxOx
         4+6gpq5X4gSxixbltiAwtclOUq6Dz8UKzQadY=
X-Forwarded-Encrypted: i=1; AL+hErFlHk/8VZqBybOjidc9Sw8Kag+/w8bcMPHSPxOYNq93sS+NNzTOTtlAj1PPqUwhDA/Z2o0Bf0as8BBevUE=@vger.kernel.org
X-Received: by 2002:a05:693c:42d3:b0:36a:54a0:6b4c with SMTP id 5a478bee46e88-37686757ce7mr3184469eec.25.1794426289693;
        Wed, 11 Nov 2026 11:44:49 -0800 (PST)
X-Received: by 2002:a05:693c:42d3:b0:36a:54a0:6b4c with SMTP id 5a478bee46e88-37686757ce7mr3184439eec.25.1794426288973;
        Wed, 11 Nov 2026 11:44:48 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:48 -0800 (PST)
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
Subject: [PATCH v12 6/6] mmc: core: Add support for resetting an eMMC at system resume
Date: Wed, 11 Nov 2026 14:44:26 -0500
Message-Id: <20261111194426.1652644-7-kamal.dasu@broadcom.com>
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

The DT property reset-card-at-resume specifies that we need to make a reset
of an eMMC card at system resume, assuming it also has stayed powered on
during system suspend.

To implement support for this, let's start by parsing for the new DT
property and set the new bit MMC_CAP2_RESET_AT_RESUME if it's found. Based
on the property, we must also set MMC_PM_KEEP_POWER in the pm_flags for the
host, to keep the eMMC powered on during system suspend.

Finally, to manage the actual reset during system resume, let's extend
mmc_resume() to support the needed behaviour.

The property only makes sense together with keep-power-in-suspend, as the
card would otherwise be powered off and system suspend is refused. Validate
that in mmc_validate_host_caps(), to make the host probe fail upfront on
such a misconfiguration.

While at it, claim the host around the reset in mmc_resume(), as it sends
commands to the card, and propagate any error from the reset so that a
failure to re-initialize the card is reported by the resume path.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/host.c  | 17 +++++++++++++++++
 drivers/mmc/core/mmc.c   | 12 +++++++++++-
 include/linux/mmc/host.h |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 8e9e61839198..94c8ec81ee08 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev)
 	if (host->bus_ops->pre_suspend)
 		return host->bus_ops->pre_suspend(host);
 
+	/*
+	 * If it's required to make a reset of the card at system resume, this
+	 * indirectly also means that we must keep the card powered on during
+	 * system suspend.
+	 */
+	if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
+		return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
+
 	return 0;
 }
 
@@ -375,6 +383,8 @@ int mmc_of_parse(struct mmc_host *host)
 		host->pm_caps |= MMC_PM_KEEP_POWER;
 	if (device_property_read_bool(dev, "wakeup-source"))
 		host->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
+	if (device_property_read_bool(dev, "reset-card-at-resume"))
+		host->caps2 |= MMC_CAP2_RESET_AT_RESUME;
 	if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
 		host->caps |= MMC_CAP_3_3V_DDR;
 	if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
@@ -620,6 +630,13 @@ static int mmc_validate_host_caps(struct mmc_host *host)
 		return -EINVAL;
 	}
 
+	/* Resetting the card at resume requires that it stays powered on */
+	if (caps2 & MMC_CAP2_RESET_AT_RESUME &&
+	    !(host->pm_caps & MMC_PM_KEEP_POWER)) {
+		dev_warn(dev, "reset-card-at-resume requires keep-power-in-suspend\n");
+		return -EINVAL;
+	}
+
 	/* UHS/DDR/HS200 modes require at least 4-bit bus */
 	if (!(caps & (MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA)) &&
 	    ((caps & (MMC_CAP_UHS | MMC_CAP_DDR)) || (caps2 & MMC_CAP2_HS200))) {
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 026003ba507d..71c59cf1178f 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2314,14 +2314,24 @@ static int mmc_hw_reset_recovery(struct mmc_host *host)
  */
 static int mmc_resume(struct mmc_host *host)
 {
+	int err = 0;
+
 	if (mmc_card_keep_power(host)) {
 		pm_runtime_set_active(&host->card->dev);
 		mmc_card_clr_suspended(host->card);
 	}
 
 	pm_runtime_enable(&host->card->dev);
+
+	if (mmc_card_keep_power(host) &&
+	    host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
+		mmc_claim_host(host);
+		err = _mmc_hw_reset(host);
+		mmc_release_host(host);
+	}
+
 	host->pm_flags &= ~MMC_PM_KEEP_POWER;
-	return 0;
+	return err;
 }
 
 /*
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 032c018650e0..3c0ea74e3e35 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -430,6 +430,7 @@ struct mmc_host {
 	u32			caps2;		/* More host capabilities */
 
 #define MMC_CAP2_BOOTPART_NOACC	(1 << 0)	/* Boot partition no access */
+#define MMC_CAP2_RESET_AT_RESUME BIT(1)	/* Reset the card at system resume */
 #define MMC_CAP2_FULL_PWR_CYCLE	(1 << 2)	/* Can do full power cycle */
 #define MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND (1 << 3) /* Can do full power cycle in suspend */
 #define MMC_CAP2_HS200_1_8V_SDR	(1 << 5)        /* can support */
