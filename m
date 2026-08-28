Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3FA37BE93
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892197; cv=none; b=AR78uS+dalvGXTLC2pYvZ2rJEad3/wDVb8oL7xC9kDIG0quo0gt4AjvS9kjP6kreYMm+pkAhfbDkHNhhPs1kXJiEEF78//ZE7wuX9voBMII4v4U7hN4dYNqXftSn8SMI1B0yqAaw+fPkHBqLdrGP39SVS9mhUlhYKqNZMd04TNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892197; c=relaxed/simple;
	bh=HmYQGD+I5nP9MGSMp6rCzVD0nnlHV9eD1YAEeFkbNCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZRykKeo2YhsbpanY/6G175p+/DDO6GVoLgByr+L/09KtRWbOKQnpBB+IwhaMgheIPS6odto+3IpR6/WVnviWJOc2zdsYidtB5FTZVYaI04gIzynkxAUko65vEnvIsxfrUxkU0ou4XnOGzSM4I7Tq4xRH/t/col/xMCH0o3uqIQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbvEy+8G; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbvEy+8G"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-45eb688c891so178802fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787892195; x=1788496995; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xvo929vZe40Bej4+5nG1zx+7ENE5vhyPaIbe1OuxRao=;
        b=IbvEy+8Giohdqb+0/E3V+DTBc8JQjlvgjhbrRapoL/58WGs/uI2sqmYaybsWHw680n
         Qu39cNP7aW7FpsvNS06+cGZSk6Kt4gjOo/Y8epgHtSm0rop+N6D6/Z4YLIMlog4sc4bs
         KQXqtz/FTyWK/4ADgK1HqvDllGKpGD/T73ajRFOZhKiUvLnPM9dVcucBFV8L7kz3a8EU
         dmq2cDwjCIvWyEJQcZiHGujp8NkXrob3cQgO9BmATVzXuMiAnBkh7KGpwuWn8Y11Ufau
         K/Wkw1MIAZREM9guBuf7j6mO5QqqFupSoSzgsHVXlRPuZha6kQmTbcDGxqq0YfTYjncY
         sPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787892195; x=1788496995;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xvo929vZe40Bej4+5nG1zx+7ENE5vhyPaIbe1OuxRao=;
        b=VUc2dWPWisfk00kXthMf3pEuL3ceEb5xP6Yx6lnIHy3VxrFxy1WeZyT+PBTNxGg2VX
         ub+MRROH75Gtsq/hZKnojDjZew0YSVoxsPIqVe6NiKo7GMjCEqgZhNIzhWusb6YEyRzB
         eLRUhDKRy6qf8VBT7t/IiTKcLQANpQ455gvuPVmxGWk+VwL4+DEmF0ZU1/u4RmCMcgkR
         4Av47vM2fu7dAyXc9iFXa+8Q5gdyTJ+6R5uNNw4qMNN0ht5u6F2C+L1QXyHv4yq10JQ1
         VEgGM7V6NLBzuPUi4lZ2fE1g0aXUBMs15A6VPGb8A+nho06XARdV22AhhXFRzvPatTPO
         kTIw==
X-Forwarded-Encrypted: i=1; AHgh+RrdNZr/JLn8xVslNiqqrtq50YcJz/1U1HAzIvDiQ9M48vm13bmA9qYFEjtgBD9HoDCYf7WhaPjxeBfdcDE=@vger.kernel.org
X-Gm-Message-State: AFuF++kbuG96Y1PpMCT8WTIbto6v0cnKt1DB/M7MYG6B+/2Ye1KcCUH/
	F70UsB0T/oUshlfFfYYsgPChdXcek786/4H47Cx2Eu1xXouyCS2vLePM
X-Gm-Gg: AR+sD135or2KljKfZ+Eb617pAwNWuIFiBW5vyE9VrqZQ/XZu0xhQMpugGnJqMMgRhaT
	pUWSAkakDR07ArD4JWgrwinNiOIr+bQjq+orOrs3rUd3UfZJfQL+gxYDENJzMXUDc6kKJNJXY/+
	KYvq4Ge/4JPDd74mo+nrCmENPzkcqkQosP4jz4WzZgMtIzbvPBNFZqdoEWxs+Kufa32yAw/Xx3t
	rTFloZuvhBVW73yXxbe9zATxfPdJzD8TtVo9Ag4NWnFTfHjJwDCoZzzE+MWG/+S4bHEQKlf/amS
	PLcsMGbfleoyMvY6yS9vHhajXtD6vcEEQwaZc2ErDdPReTR79LagMhJEmTeOGnihiGAzrfG/EAV
	dL0sJUASYsxoTCCCIpAdikVYtAJ3o546z6NlpPFlBACToZ1p+rZByKkRdLUN10tOyZOavqWa/oJ
	Z8sKA/ZGOeNyue7VtYe+GMQPKuFJg8ouRKiFkvzQxRAYFZ39QviBH2u5w12kPCm1KfmqxYuNoOo
	l8Y04Gwpwugb+dt4KJVVzxlVTESbE6dWR4ldYIalQYiR8yTOFsmQfOuQdQXG026vA7GKg6TqT9e
	MkpPjGMvK2zQxGE1+6+ejtDTYjuAyWnWmC1JBA6CmbrU9aFqvRP869jCWvmprezIWvEK1iM6CRO
	cvd25GUj0yspEI/S21dQ=
X-Received: by 2002:a05:6871:a516:b0:44c:d6f0:7f70 with SMTP id 586e51a60fabf-468377989e0mr4945563fac.17.1787892195218;
        Thu, 27 Aug 2026 21:43:15 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-468a2fedbcasm497632fac.2.2026.08.27.21.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:43:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 27 Aug 2026 22:42:31 -0600
Subject: [PATCH v2] watchdog: sunxi_wdt: preserve boot-enabled watchdog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-submit-sunxi-wdt-boot-enabled-v1-v2-1-610d37dccc97@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dgytiMWV9zAsaDvAGGhNWxFDu
 LsFT2Ayyc9Lft6fhQX0hIFds4V5nCiQswnEIWO6b2yHQCYxE7kocykuEF5qpJjCzgRvE0E5FwF
 towY0MHGoCm1KhVKejWBJ8/TY0rxP3OsfJ8cDddy8W6OnEJ3/7D9MfOv9MZeOg+FlW50KrWVe3
 bqxoeGo3cjqdV2/S14P++IAAAA=
X-Change-ID: 20260827-submit-sunxi-wdt-boot-enabled-v1-94cd6be885d2
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Carlo Caione <carlo.caione@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

sunxi_wdt_probe() unconditionally stops the watchdog even when firmware
left it running. This opens an unprotected interval during boot and
prevents CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED from taking over the active
watchdog.

Detect an enabled watchdog and decode its programmed interval. Preserve
representable timeouts, and round the 0.5-second interval up to the
minimum representable one-second timeout. Use the configured timeout for
reserved interval encodings. Set the Linux reset mode and ping the
watchdog without clearing its enable bit, then mark it hardware-running
before registration so the watchdog core services it until userspace
takes control. Leave disabled watchdogs untouched.

Fixes: d00680ed0026 ("watchdog: sunxi: New watchdog driver for Allwinner A10/A13")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Use one second for the boot-enabled 0.5-second interval instead of
    falling back to the configured timeout.  (suggested by Guenter Roeck)
  - Leave an already-disabled watchdog untouched.  (suggested by Guenter Roeck)
---
 drivers/watchdog/sunxi_wdt.c | 45 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b6c761acc3de..3db34524ed13 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -128,6 +128,38 @@ static int sunxi_wdt_ping(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static bool sunxi_wdt_is_running(struct watchdog_device *wdt_dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
+	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
+
+	return readl(sunxi_wdt->wdt_base + regs->wdt_mode) & WDT_MODE_EN;
+}
+
+static unsigned int sunxi_wdt_get_timeout(struct watchdog_device *wdt_dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
+	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
+	unsigned int timeout;
+	u32 interval;
+
+	interval = readl(sunxi_wdt->wdt_base + regs->wdt_mode);
+	interval >>= regs->wdt_timeout_shift;
+	interval &= WDT_TIMEOUT_MASK;
+	/* Round the 0.5-second interval up to the minimum representable timeout. */
+	if (!interval)
+		return WDT_MIN_TIMEOUT;
+
+	for (timeout = WDT_MIN_TIMEOUT;
+	     timeout < ARRAY_SIZE(wdt_timeout_map); timeout++) {
+		if (wdt_timeout_map[timeout] == interval)
+			return timeout;
+	}
+
+	/* Reserved interval encoding. */
+	return 0;
+}
+
 static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		unsigned int timeout)
 {
@@ -259,6 +291,7 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct sunxi_wdt_dev *sunxi_wdt;
+	unsigned int running_timeout;
 	int err;
 
 	sunxi_wdt = devm_kzalloc(dev, sizeof(*sunxi_wdt), GFP_KERNEL);
@@ -286,7 +319,17 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
 
-	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	if (sunxi_wdt_is_running(&sunxi_wdt->wdt_dev)) {
+		running_timeout = sunxi_wdt_get_timeout(&sunxi_wdt->wdt_dev);
+		if (running_timeout)
+			sunxi_wdt->wdt_dev.timeout = running_timeout;
+
+		err = sunxi_wdt_start(&sunxi_wdt->wdt_dev);
+		if (err)
+			return err;
+
+		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	}
 
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260827-submit-sunxi-wdt-boot-enabled-v1-94cd6be885d2

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

