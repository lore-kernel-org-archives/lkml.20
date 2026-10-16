Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646DA3A7F68
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188994; cv=none; b=mbJ41ctYOYG7yFU77ey33RXvKLq1VOL8Amu86lKLDDE0uYhohv2Dm2CoSbbKQRr3RHUqlVmEQy8S7T3fRcVKnf2nDmZ5ibCa54agkOCu1fR1ffC5yeuDOzPLUXRv5ypbFwuDvMCsU5UMwDRgsGxtRf5y70SUcFPXK/I/UPKM+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188994; c=relaxed/simple;
	bh=TXBqsVGg9cAtgaVHRhNDFyJ7mFNE3M7pp6dyhTAsDp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPLNvT/k64RTpL2r567cP6p+AXVYzipy3oufyLBqCBPSV/iINOWxjdRMTbAjTvAQYt/IEOQH50ardhKu6/4XvL7pLhdwyURJLnXWAKwQXEqxyk+t9Qv0ho7CXihxWkRog7uvNyvra9tXqBs+2f1YHYmEvPeev2B/qRyWvyMSLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdpTr6tl; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdpTr6tl"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso418226eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188989; x=1792793789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RQWVgYSBP0OMtApng4YZ1gHWXM9hb7Ag3kJOb+CrpA=;
        b=CdpTr6tlGv6Dh3hjWO3vxHYfQjRfIFH/aG67epNUmoRlIpOAO5s3rrJQu2v/fjqZe8
         hDo2LvHALk4eLeTOAIdPzPgoMqXFNr1/upY+3Pl+Ql0Bilra+KS3ueCYJtAV6M3XUpFh
         HQnp65AjQ3kj/D8KYtrZU84CWbfTFnsPxMcdiIiLEADz0/BMnllKWJNLojQKKhvD8sXP
         cJaha7QcqNQalSNFY511Ce0AdJcG3BSMtOOQpIC5acZWCFE29AMokpoC4TtKZaJOdCVf
         KifKaDjYT5OGEUHrNK0V/N0xZ/WRg3zkN1DwzSApnmE1amkn7xWIW7G7spHm/JOQKtWO
         mNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188989; x=1792793789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RQWVgYSBP0OMtApng4YZ1gHWXM9hb7Ag3kJOb+CrpA=;
        b=V/Q4vvmLJLUHCIbI8Vehh4tACZVci0BT7grdLqote2xOi7IMH3rPeRQmSETIJdeoj2
         6l62bzmMnb4N4e7N1pUHh+F7n1tdfz9acQ1ks4y3K/TkYy7cqI/rwyNcmsh3FlX9nb3X
         weuWqFBwq5EfwOFrhpe8GEXlV3ncRU0TxgFWHF9Pyo0D9K5NvgWPa4fhTm+cicemN57f
         qLYLMScYWq/FUoaM/ja1vBi0Dtw0bxeRK4+8ZlPzqffP42B0oyWtFN8zD29nztIUydFV
         VvKp5uhaQdSD4YLO2htMITKJ4Ud7nO7BGjedP4Uup60rosjE/YL2hoXBUswc5XUUBmpY
         RQjA==
X-Forwarded-Encrypted: i=1; AKwUvByH8Ngaxb/CxarQ56hTXDJXOc7vhpzP/PK3axq45MOUrpoCevUayqzKJ4g8q3yQ8305h/lrAMDI2viQ/U0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgAc7QiISrBXDyyvnsuGf63lUM5fPkKwQdWkvPoECCmHTGQjO8
	pTtmboztih2ESMKwrOXXEMW0OCXtCYfQjWbLRmISVA09CHSXjpXQAdrC
X-Gm-Gg: AYBFou3XBl5S6YVUPOy6uX3PmsLDyuc3xs2XpJBJB9QviHEy/nR9e3QMkiH+T/K4X5S
	dbqs8/OgxUMHswAN1DdHJgUrsITiklI2r0wa9/OfbVg+xbRhNxjtwXv5TC17xbWJ0p2SR3n2Dz5
	3a+6jp9b6v048sj4lRq7l+JIZMTTMyIx84U6FdtCbZ0yoYUyTAEe0ZM5J/jNy8dBnzIMAjm5tHB
	DnPEbGed38a+wq1xnUlpqna2Bmaa5KuHIyELkBDgYpvgioiGJwMuKm235L3bcw56cMfHwTdAK81
	c5Qxd0CLd49+Ye51vRzLstAyld11G2f5R7qXr6wblLWysUB04i2qmLSg3NQ7BrXBYRgvIbdrd1/
	AuxhsYn4osHXNLWSmOqMMtc7CwUuk+5AydYcwBgp+yz6UOjIlgQze0+ljdgyDanql4V9k8ppiu6
	qGjgmM32pb5Hn46Hs8DXAwNmr4Pism1SA2tafXFdayG7IyTuFmLOHreHLG1gJMcP47MwLWjC4=
X-Received: by 2002:a05:7022:f118:b0:146:85b9:970b with SMTP id a92af1059eb24-18514256f24mr1604037c88.39.1792188989457;
        Fri, 16 Oct 2026 15:16:29 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:28 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 4/5] MIPS: Alchemy: Use the GPIO watchdog driver on MTX-1
Date: Fri, 16 Oct 2026 15:16:16 -0700
Message-ID: <20261016221617.2223004-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016221617.2223004-1-f.fainelli@gmail.com>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MTX-1 watchdog is serviced by toggling GPIO 215. Describe its toggle
algorithm and 1.6-second minimum interval through the existing software
node properties, and register gpio-wdt instead of mtx1-wdt.

The nominal 100-second circuit reset the test board about 82 seconds after
starting an unclean-close test over the serial console. Allow for circuit
tolerance and console transmission time with a conservative 70-second
hardware service margin. Keep a 100-second initial userspace timeout and
let the core schedule keepalives for the longer userspace timeout.

Mark the watchdog always-running so the core services it before userspace
opens the device and after a clean stop, without trying to disable the
hardware by tristating the GPIO. Enable GPIO_WATCHDOG in the MTX-1
defconfig.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/alchemy/board-mtx1.c   | 8 +++++++-
 arch/mips/configs/mtx1_defconfig | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/alchemy/board-mtx1.c b/arch/mips/alchemy/board-mtx1.c
index 88c20c0ca96d..8543ae42af92 100644
--- a/arch/mips/alchemy/board-mtx1.c
+++ b/arch/mips/alchemy/board-mtx1.c
@@ -125,13 +125,19 @@ static void __init mtx1_keys_init(void)
 }
 
 static const struct property_entry mtx1_wdt_props[] = {
+	PROPERTY_ENTRY_STRING("hw_algo", "toggle"),
+	/* Allow for tolerance in the nominal 100-second timeout. */
+	PROPERTY_ENTRY_U32("hw_margin_ms", 70000),
+	PROPERTY_ENTRY_U32("hw-min-interval-ms", 1600),
+	PROPERTY_ENTRY_U32("timeout-sec", 100),
+	PROPERTY_ENTRY_BOOL("always-running"),
 	/* Global number 215 is offset 15 on Alchemy GPIO 2 */
 	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 15, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
 static const struct platform_device_info mtx1_wdt_info __initconst = {
-	.name = "mtx1-wdt",
+	.name = "gpio-wdt",
 	.id = 0,
 	.properties = mtx1_wdt_props,
 };
diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
index e28a0b1e6d52..5e060daded9d 100644
--- a/arch/mips/configs/mtx1_defconfig
+++ b/arch/mips/configs/mtx1_defconfig
@@ -377,7 +377,7 @@ CONFIG_SENSORS_W83627HF=m
 CONFIG_SENSORS_W83627EHF=m
 CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_NOWAYOUT=y
-CONFIG_WDT_MTX1=y
+CONFIG_GPIO_WATCHDOG=y
 # CONFIG_VGA_ARB is not set
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-- 
2.53.0

