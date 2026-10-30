Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383884;
	b=daTHCDiNk6GkpkJFjR/Mu7etqvJYbEOTrzUM/Uidcd5IMtM1IoKotSCxysIw79U0m/B6
	 hhJJ2JvDiAvNwm4nHFlkC8FR9VmrvP0THE9U0aKFjP3T8YJSAUjEiCaZgkqlKYHkkkFfq
	 omuB7nHSnmP2vktcwO4t4sf34rG24n3FzfTyNmz/Q66lyeSKJAOTkgDGSuE1R2C60HEJ4
	 oKJQDc9ttp5i8PffgObg/wPJg4RYJ2S7NZ14v+PI08Iu0sR7h6mdDoawiEKLhbaMmt1fa
	 UlcKriwJ6D94gOVjmkM3fO8IpJ9aNbFrQIdk/cMhSYrLIsrTVVZqB93QDuqYELKBwpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383884;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=9UEip65nRVFiwXi/RQ81IOIqu2Aa5gJjnBH6d1LLNVo=;
	b=uCWfb9xIxc2xwQVcUGpLCdbOQl5qaHm0gCPZzG78fed9b/14vjv0ypHZ3YXBsfPhLCYx
	 yoLgd1PPpP1h+3xIu+6gWIKNGXi6ZO+ToKru1U8cWME+XKDVqbpi30kedq0cIDfsWBguu
	 JoDHNHsgj/ACETPKJzWVOSqddiGS7xt5z3M23gB1UFkwDx4pKwqG6gL0Br6s75Z0h19sG
	 w5orBRCo53Mw6YYmyxo6cTqlLkAbUbARCsqSq2mwCgAZ5N7zS40utwRQNm6uyGGeLMcrc
	 fF7HhliHD+WCAH731jjE4XsJpd71rE5kvi+d3NcI1LjYxwjclsNS9YMLcTg65lSA48w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OJ9Hm7An;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B88606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B88606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OJ9Hm7An
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso510620a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383884; x=1793988684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UEip65nRVFiwXi/RQ81IOIqu2Aa5gJjnBH6d1LLNVo=;
        b=2KQoVOid98fPFie+1esQ6NKNuIJ6+HooHeQu/8VRuxThWF3ORnTU23pHdUg0Uh0c6Y
         B1nTnUFhvJdo77wEkS5wfTlsddeTTAYVy4gXTwI3NFoZKSTPItQkJoIO03D92NBP/En9
         A6P3ocnc4emJ5wHF0t0KyKGXToCC07LfVuSQ4J+ZCuJuQ/PuSoEum6oIeP/USLU6TVx9
         n4qKStF0YbYe/VcpC/ZSotHDczP4tkfyH7T/CptINQNGXz5LtexYBqiQlg+7XV620rqt
         DPFeYbBbtbAMgdUrEayNPO9ibpQpwyn9OlC+gWOXB03MDZvnRZkRIHD6kMvWSqo2EUDC
         9a3Q==
X-Forwarded-Encrypted: i=1; AKwUvBweqSWnREDP2J+z6EbuMIQ5cJ4epCxve+tZl51kncmzRTryJDDnoQrdOBGsKQYcLPBfnj7u3aFa3zvRhNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPgPZeS4c8qHApo1xINKI4tYcYiAru2x8D3xahj/6QFo2CSViS
	Lt1Iw9Glc6qlYUkRcVvmVgnsWL9wdbsGNK528+DlfsYTsPNnUb9vradCcxy4n5Bb1u98Chg7DrB
	pV0TtDZgvcHj9RruJ3hiHAc5+W4Iy86JoBKes/V4ZZBrmlIZvRqfJqVStK/Xzibxlkd5wUQrDB1
	OMvKAFjZYY0GCotdPv1U4hw+AB/Hd7IAvvjBNpkoy4j+7eba6JM+IMCMwn+/ZEaCZ0SCMtgu+XO
	tYCj0WIVVFXd6yQ
X-Gm-Gg: AYBFou2JvwTaJ61QJc6jEtViAkBdbmUUwnn3lszfA7o85XvAi4IFK03aQC6j40MKPVP
	PN99khIn7O8Kl0BnlAaFexx5FxwqK9bAdceboMbwg7H6p0C9VkqGfvRq5bh+XTXn31iJsIlnoHk
	/9jGD6Kt/v/27HeF6M5Azqy1r51cXHWaM4aD9v5r2R2zvV6LrICqk5OtKElXKvwE+6CYAIySJi/
	oo9boCp2SJQrodOEhOFV9cuxQqVIvm2VaPykyB4wG2bbqeyQx8DbyI9CD1JPubdg9gbXUeuddL2
	msxCVHnpEp/h++tvAoXYtHHYofJ8c0T3lH5gerW+AtsxM1dbAPtgZte3DvYgq9s966ylxDsnNpn
	h7gGJFTKOR1pEPuXEIs9nrFSTEW57jK02Uq5g99Ed+WCQ/aphnq+LLFZhxhunKY/4v1p3VwAd9A
	qofoWcAnrTMQ93UTGT20cakzlHLGxz01T+
X-Received: by 2002:a17:90b:17c1:b0:3ac:a7ee:6760 with SMTP id 98e67ed59e1d1-3ae896f7f94mr2690533a91.23.1793383883632;
        Fri, 30 Oct 2026 11:11:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e80415bsm4473207a91.3.2026.10.30.11.11.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so1235629c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383882; x=1793988682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UEip65nRVFiwXi/RQ81IOIqu2Aa5gJjnBH6d1LLNVo=;
        b=OJ9Hm7AnsYoVJvezEAHrWKPex8IJmOGo8m91YcPEM8p2xiBYyuym4Odmq9WxCnIYfS
         IF4BD4ogyRo+/R9w+2L0k6Rqy+adipFF5p8adrAKrdUU5TxqIufyra8YB/1kALExbRVv
         2334BQmmXmKWBWMLGWnT0McX5KPEVMyCO6/ZY=
X-Forwarded-Encrypted: i=1; AKwUvBx0lwr1RvyZ5Q0W/o1b5ZcU6Sc8h4sbRIcPgapwBdUbEaKW5jmeVBp3C3RTDsRuQZFJsgG3InzKqITaavY=@vger.kernel.org
X-Received: by 2002:a05:7022:208a:b0:143:26cf:8615 with SMTP id a92af1059eb24-1ac5dc65c45mr3734296c88.25.1793383880779;
        Fri, 30 Oct 2026 11:11:20 -0700 (PDT)
X-Received: by 2002:a05:7022:208a:b0:143:26cf:8615 with SMTP id a92af1059eb24-1ac5dc65c45mr3734232c88.25.1793383880060;
        Fri, 30 Oct 2026 11:11:20 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:19 -0700 (PDT)
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
Subject: [PATCH v11 6/6] mmc: core: Add support for resetting an eMMC at system resume
Date: Fri, 30 Oct 2026 14:10:33 -0400
Message-Id: <20261030181034.3811225-7-kamal.dasu@broadcom.com>
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
card would otherwise be powered off and system suspend is refused. Warn
about that while parsing the DT properties, to flag the misconfiguration
upfront. While at it, claim the host around the reset in mmc_resume(), as
it sends commands to the card.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/host.c  | 13 +++++++++++++
 drivers/mmc/core/mmc.c   |  8 ++++++++
 include/linux/mmc/host.h |  1 +
 3 files changed, 22 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 8e9e61839198..8b38ff45d20f 100644
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
 
@@ -375,6 +383,11 @@ int mmc_of_parse(struct mmc_host *host)
 		host->pm_caps |= MMC_PM_KEEP_POWER;
 	if (device_property_read_bool(dev, "wakeup-source"))
 		host->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
+	if (device_property_read_bool(dev, "reset-card-at-resume")) {
+		host->caps2 |= MMC_CAP2_RESET_AT_RESUME;
+		if (!(host->pm_caps & MMC_PM_KEEP_POWER))
+			dev_warn(dev, "reset-card-at-resume without keep-power-in-suspend, system suspend will fail\n");
+	}
 	if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
 		host->caps |= MMC_CAP_3_3V_DDR;
 	if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 026003ba507d..a9e3cf7ae039 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2320,6 +2320,14 @@ static int mmc_resume(struct mmc_host *host)
 	}
 
 	pm_runtime_enable(&host->card->dev);
+
+	if (mmc_card_keep_power(host) &&
+	    host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
+		mmc_claim_host(host);
+		_mmc_hw_reset(host);
+		mmc_release_host(host);
+	}
+
 	host->pm_flags &= ~MMC_PM_KEEP_POWER;
 	return 0;
 }
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
-- 
2.34.1

