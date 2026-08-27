Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852E331237
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874193; cv=none; b=Rl0MJ4VFkSYqI/WxphgDBFPW/e7BRgud3htMSlbMxNplPxe6TVdCvBlCLQjLPc8TxJjOGKMWBtrSTcq3NzimILHiB4KTbaBqAB0OGzxdloEIVeCJ5dtr3DCBKyXuaz1crrHR7Wq6mxVepdmXOE/FQbnAWrsuObtaMBlkjnOiV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874193; c=relaxed/simple;
	bh=seGeJVUaBY4csPp307lVbWcygAp1HQ7VLHvAmGqgjqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EpeIFdgoNH9simBQ0/gszUAMsWSgaeVZ0TSXUXnrP112w+6+J6Ylm+qclTME+i8gLkJglzlHXixYJqGq7wq2ORLPP39A+33FMPONahCXGOSYPs8trlJtJmesSkYxTjifglWhlUhIicNhdoiu6WwG9a81bqRbxJmBIjWtJTpojfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPSUEmyi; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPSUEmyi"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b381337e1fso547357b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787874190; x=1788478990; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zVdJjWb3UpbdKuHlq3/PIvwY2V+KiCYJBGO2pCIZorA=;
        b=lPSUEmyioWixJqw5SNKGhsnHC6EX8ahzI/se4rXMRGiIZ+3lFRGrgbqioGeSuujjHI
         UflpVKFv/iA4riekGlQbrkZzy72Yq8ygl/1OI3TXpp8bG9VZFPKJ0akAz0g6WdDYF417
         B0KB9nGFO2ku5uTpWIvsEFTflXJSl3YqUMoRzHKLlKldKvMCWU5Ho0XNwWcjtxYpiHxm
         E2b0p69ceR++scazCRojMnDdziHUvKeWwfCycVBh+fgdZeTn9s9NeESHhe7nUXIH3/GE
         eJE8rB3pkkrrUtxCcE+OtQAQHraxGZ8T9g5hUFVyGafprPaQurvh2lUGvIie4YVanqJ+
         woDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787874190; x=1788478990;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zVdJjWb3UpbdKuHlq3/PIvwY2V+KiCYJBGO2pCIZorA=;
        b=KY9Aq50XVkT6aUOeAO6hHpkFDVrpzIYSC12nW2HTOZQPkOhGKcmlqtdG+4gFjMShZ9
         EhZWqusC83r2//FXk4nSCfrUfWyrg0KD5MNcvWbr2Rs50IXKN7DvB2407k0DxcFu1Z1j
         CPap57jqBNWMtw06ucQSn6rXqV1r6sBK4LUIwTjKWP4XtqP7VLkKfa60+gv/Bpf6x2Y0
         cODNz8NpnIey3z+bsUvT0bexNnThzC/4we7b1qlqQ/vmjSyScSYkWNppvgv6UjCxgwKR
         vt4/ijaZQYjdAupEYh/kY8m/smIu1oAEih1nnss7TVhfKyA8L/ujKYteIxW1p8Ve51b5
         bpWA==
X-Forwarded-Encrypted: i=1; AHgh+Rp09z9/2iLDMG3pGIuLE8Xyj4Q28Sxz9M+M8zbTKm5fAMV0seuV7v0nrudmYXBrtybnWVJndsG9vq9GkSg=@vger.kernel.org
X-Gm-Message-State: AFuF++kmF9FLR3uKxMDTM+RxLYxUzCwosPTSegpPQcKHr/EcukDd21rW
	oyMTgullF8RS54BLOEYGUnnuNXw/Kmy4XE9YycPdPPf5undRvTlxj1jq
X-Gm-Gg: AR+sD12IMACTf4EDFmxtEsgZjjByAoXvT9r1e+rwiUtwxNXrPadTlqUM3OYYNnL3GNJ
	B5RF+PvxexLVtUw4rwtQpISZAYVroryHEXasHYB6sWiudyhBAzHJtHaIDb+bh9VlLshAW8WUWxR
	41aVS2XUUFbk0Ub8PPJE+qCnnTF9P5PEuEEQNvFZ5nI702xYA5PpUeszu1hLIUCXaa3nCayQA2x
	Qxdo2FvN4y1s3dSQC76Kpa3D9EDLpk1VLL3V8UKYJIChbHJ6lbR+FN7dOJcG+3rE0Hqq89+iAQw
	0xuKVqjb1XhYm1nJjyM4xw4aDzE3ryRwQCSC5UM+dSh58jhIEafPiztpP31agkK6wri6TkCA1hP
	LQLZisjyZvI0MxZ0T3sLIV9xBotJS7ZpM7hzvppo+DLv2ByWQVFWCIB+Tjf1RfRKCOYWqHz+8sS
	HLQMG4zVyruuk4KFBvXtRK4+JU323a6l74I6BPpiCVTTZvN5Eu1p4h1GxbEo91ChgmUvktPlAl/
	zDQXh9LosamEVHbsf6195uVx+LOt8a09BXxoWC9sDDXaVF27wWX5AqvvH/q2Pbwpq/oCpoj3poZ
	bwAcUWSMyJTQCiyplP8sl/dKnDn/ibmH3W5FVPYH+fLfXcz+rzF7hG6JPU8s45IVM+zgS444ALN
	xYOlp5anUgnXMdXD4tg==
X-Received: by 2002:a05:6808:1308:b0:4b2:21e2:82d5 with SMTP id 5614622812f47-4b3981256e5mr3096321b6e.10.1787874190443;
        Thu, 27 Aug 2026 16:43:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b36abbdb56sm5279979b6e.17.2026.08.27.16.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:43:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 27 Aug 2026 17:42:51 -0600
Subject: [PATCH] watchdog: sunxi_wdt: preserve boot-enabled watchdog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-submit-sunxi-wdt-boot-enabled-v1-v1-1-d16f934cc809@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTsJNIrVqxgWtDPIEG1NW5GEc
 HdHWb18m/+tkDkJZ7hWKySeJUsMiuZQgR/7cGcUUoOpTVtbc8b8dk8pOmER/FBBF2NBDr17MOH
 c4OXoqXVs7YkMaOaVeJDlf3HrdmtjYl9+Xdi2L4+MHriEAAAA
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
that timeout while setting the Linux reset mode and pinging the watchdog;
use the configured timeout only when the hardware interval cannot be
represented. The enable bit remains set throughout. Mark it as
hardware-running before registration so the watchdog core services it
until userspace takes control. Keep the existing stop operation when the
watchdog was disabled.

Fixes: d00680ed0026 ("watchdog: sunxi: New watchdog driver for Allwinner A10/A13")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/watchdog/sunxi_wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b6c761acc3de..1f3da1d47fa5 100644
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
+	/* The 0.5-second interval cannot be represented by wdt_dev->timeout. */
+	if (!interval)
+		return 0;
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
@@ -286,7 +319,19 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
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
+	} else {
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	}
 
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260827-submit-sunxi-wdt-boot-enabled-v1-94cd6be885d2

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

