Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678930;
	b=hGVZstnydVnHkK/k+WyCuXynGK9SeycW3M2suEPzukKhpzqddj/jY2H4+Z9gIWh29PnX
	 xdjNFsIRrc5g5wJxaGCvcdazbhbk55dWyTQj3y4OZV38SIFtHQxFiOWfA2R4n4M4E63uL
	 QxT3XkKwrFn54q5VpZGSmC/1kAoBEcOgSLs+KFQHiK+0C4QE7qFuPQ0lhhF/c40P7yMnN
	 bqTk6uj4uwReC8MXZHS+wCZS0DP8llzHcCX5n+sZqg2a2Deo2RJUyBYvURdkHRJlvmi5e
	 2iY9Pmkze6rHtL8Rnwmcu0W4fSLKtUBHsfvSjssPvdxEpmV6BPTrvaVsdUcRp1MLGZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vUdHoaBVYZmPnE/s62HT4yYg3gzMJTqDR+eMVLrtAyE=;
	b=aSqM//kWzhq1exI8Yd6yyPBkr08Lr/cnqIqt8xOGXfaldBHOlrNmrKaIH3uFet8JANXs
	 eORASevmrBFaeejotbdVc+mh1BrjqYI2vIPLahlDQC3VJYBImISv340z6IsDMVp+puPsA
	 J3zWAP1n8C7Rx2BwQ+84ADybpehgzNWy8lAJdv7+lIYcmKb9dpm3DEiLhMDw0TpOCsYRj
	 yWO2CZvvAI6QVJClrZplIYbti+ocLxy/BO/t49O+7zvCAB2h2iVaFRVZVz/qIXS6zuXNT
	 PgqLYak4bIh9coVkSmH6N5zi3MyVy2Fv8oAeauwuGquzYpcDcpff9LNNy6/wDqJAJdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiM13zK0;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C36606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C36606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiM13zK0
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b139f8515dso587380a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678929; x=1795283729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUdHoaBVYZmPnE/s62HT4yYg3gzMJTqDR+eMVLrtAyE=;
        b=fiM13zK0DL/FdZuhzfWqUQ9xC5yOmnRfrBTlGDXRkL0eH0ShXWM1kNISd32sNJK11M
         EBivrGtddVHeC7bE0RelcKO56Az/DRdWpcVC1OihoMK679fbkrsIFFJwkNrhpxlf9SjR
         s6Sc2M3USl+Pz42a1HV9v85kpXO1rMxXjZF/PDbKxyIEqG3y9TiL/Ole9CcXxRecjI/N
         zhzsQ517jvvYIn70Pgn3YViNDh+D/aoB+6x19NZpFDYM9omDMGRFS6q+SMzvdaZgcAGZ
         2k7jGeynjw9ewaoRwMxyMJ6aGSSEH/xbyPDxbtDhP9GIC9ECBKkIO2sWBique9Rxinqg
         sOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678929; x=1795283729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUdHoaBVYZmPnE/s62HT4yYg3gzMJTqDR+eMVLrtAyE=;
        b=hL4ToiOJ93uG35NWnpokAlWwDDoDzNcUWtJsj7BcP10QgIiEPO+YLugELmAsevPn+I
         MhA4BB9WM2+J/MiPakXeHLBisH4nqHtkHooHd0mrClNrgCRsJaRIWePM6HWArnCMLOoR
         vkVx2+53SA3V45OcAekwV9oIm3ULZyd5tPVrQH8IxOf+JAycRCaOy6N2ObDbNonSDm27
         pFeIblrTU93Ojz8xBnzq1Hu2XYFuD3hhXSUBdF3y8knnqRfIALeXKsgxzTOdbJLlkSht
         8DhvzFldQ4/+QRnS8gimmGpQtv7TW/HuW4zhgr4gWLdkEna9iv/1FswJkT7//YXbn8x6
         xf6g==
X-Forwarded-Encrypted: i=1; AL+hErEvQcuf+cc7LTJITq5rk8556+sHbMEdSYG1Zihx4qxAGaonFVRTW0A9b9n1RGELVC9aoJ6WO2xcRRQhatk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KI72v0Yb+Ih6MAYEU+cXTC9DDL5/S2QSNGb4dlFNdp5zIwDvJ
	AVxwfpCJ0cF7QIBCscWyqp9lWXUnkEBPhJzhbuk0aUwv7+g1GJIcNJBq
X-Gm-Gg: AYBFou3u04nBUyZsfrPBxOSEPJ4hEtyRiD5FI0DKcB70S+245Ua5fTikLtlkd9oK0kE
	bsjAmUfG8temvg14Eunkq+JSOWewshTVXxleBVOMSwLuCdmlaL0P9ej2/zm5JYnPWXegpJ+0oRW
	AQbnAwwOTkYjaIXvIKmkEHohuiTYnvoTVCW8TUtCIcmcrqXZlDZyMLptPlHBmM7NetDSLf8dZG6
	jeve/Up6BpuDOfKpv1netV0A8iOPBl6ZXYesSESDm6vF0hq8Sf6zWev5xELk4Wl7vemZpf+yR1a
	pent3RId2bNsQwT0ENff1deanBPH8adMTcvTAc98U0l8mb0QZmX3umdCSz2qnfargRPcO9S804b
	yVhTWTbSqHKRTQ3TYaVs+f3II2TpdUB2yBxsEI0Fg/AbgqO4Dwj3+OaXS716xDIeo/cP6l/R4mI
	hOLusRJ3CZ9lIZmjWjSiMXqsyLLNkZTFDXi2rE2UvjbPyf43Zjr5TLKcL9y2XQ+2y7mmup3+CN4
	wJ4qJjcodqjRelvPJMoxPAhWGiefAaeLId7j9+bWO7cmAm/tBFfSgV7CE+vPXsG6XjH70iElanl
	w/HhvxSPNq+buIQr8/HEnoQG6ajC
X-Received: by 2002:a17:90b:4ad0:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b1b09f3fa7mr6658391a91.19.1794678929303;
        Sat, 14 Nov 2026 09:55:29 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:55:28 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 1/7] platform/x86: thinkpad_acpi: Report auto keyboard backlight mode as off
Date: Sun, 15 Nov 2026 01:48:08 +0800
Message-ID: <20261114174814.62153-2-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
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

The EC keyboard backlight level 3, which selects the auto mode, is
passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
then reports a brightness of 3 with max_brightness 2, both through the
brightness sysfs attribute and through brightness_hw_changed
notifications.

This is not only cosmetic: UPower 1.91.x treats the out-of-range value as
invalid and stops watching brightness_hw_changed altogether, so the desktop
stops following the Fn+Space hotkey once auto mode has been entered.

The auto mode is not a brightness level.  Map it to 0, the value it is
reported as most of the time anyway, in line with what ideapad-laptop
already does for its auto mode.

Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard backlight")
Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Closes: https://lore.kernel.org/r/CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..2c3f8cf32 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5102,6 +5102,9 @@ static struct ibm_struct video_driver_data = {
  * Keyboard backlight subdriver
  */
 
+/* EC level that selects the auto mode for the keyboard backlight */
+#define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
+
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
@@ -5191,7 +5194,8 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 	int level;
 
 	level = kbdlight_get_level();
-	if (level < 0)
+	/* Auto mode is not a brightness level; report it as off. */
+	if (level < 0 || level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
 		return 0;
 
 	return level;
-- 
2.56.1

