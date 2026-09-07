Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C685367295
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808789; cv=none; b=p92rKyoXe1gg7OywkFZzfF6/tsooSqpfSfdAoTSKv7pd3JJt3qyQdgzmCIlNUjxg0m3v3g/seXpDHjcCDXyr63MhHqFNXqN9972PMspq02p+AIZGaEzoXywx3EjHy3Qq2t20UYhktfVxUI4F+TRiyRWbwRj6tnh/mB8PfibbtcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808789; c=relaxed/simple;
	bh=X1cxe9LTfm0MWVMHD8ZVie2/ZFrkeJFXtLRCR4KT9k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=olBWMGQZWiXS+LMggLAtTUNLiX4ktqkWUAsYLvxBeHgQ3DkE/omrvnxD1aXPSjgDTb+IrAfOXxPhSOuP99wQOQMbnzODS13BloffiIdNyoWFWx+7ZAzll3s9ngNTVY3Dxhkxq8aSF8eRIAcQkxJB/g0XCNvGb8zSmKcKPN8kX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/jG6jhb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/jG6jhb"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4858303de5dso4793887f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788808785; x=1789413585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P88mw7jxmkXBU/JAeuDwKiJ/YVmoCPyskYUuX4IRFD0=;
        b=O/jG6jhb92mBsrs5XrnwcNIyETLpzQ99NXtrY0cIaFNk245oYnL3PXGhNPW1UGXjGU
         Bi7wriWvvmE1ZafwehjAszmHj/7NvTcVNxgZ3hB8JG50XwKacuFRprxgiIVJXdK9aWAR
         xSfpLjTdua8hhTAWvhZAAbeMcwO7dQp6Nk/lANPeE1p707GH/MO7VF7WF9DCnOxN53xB
         42zSXZeKISsDc9TH0Vnr2nNAFnYGtEWZbWCDbfnf08hsy5VpHwtRG9czuEOAHCwGNTpl
         +NF+mNHbpDIN1WFsrnBg7n2JOq7ORKp/5VHOxlAHDP3jYT6Sw7cPzhoqpE2Q3tQxKkBS
         Kt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808785; x=1789413585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P88mw7jxmkXBU/JAeuDwKiJ/YVmoCPyskYUuX4IRFD0=;
        b=kdW6ud3XeCzZF2fHSNSzxuYgV51zZiq3HET0P/UTy6pw6kkTpHyvlgZ+cZ4gf8bzX6
         DoYy8saxRHiR/Sk+FLeXfp+M27vdDksVm/QVnIWZangISTVobFf4l+BllkZG2agX3vqL
         YD1RXO3U0p/sPQsrKG9hdy81+lszHjWwwO8l+DzTyLEg9udVFgGaJQSTvG9kvbumg4xY
         2r4wpyG+IT+1JBzXr4UuTDfoSiCHlClYcr6L4+i3a2VaGcDxo4/3hklnYICA0cYs/k7L
         W45PPfXkAykM5+fvDMpVx59n/2owMIIvAIZEsTEzB4Qo9iWLSih//5CJsUysBN/pIjWo
         peaA==
X-Forwarded-Encrypted: i=1; AKwUvByi7PdzEz2OemQetuSfh8Ra+oZHLqD7Qe1w/rXGScuBonzRzfDr5GQPN/sec/Lw0TTPTCXUrEz1TGI8Igo=@vger.kernel.org
X-Gm-Message-State: AFuF++m8wdjxrrEXRpn8gu8/ttF43sMEf8JTvlkvYZnvu+r+/3d0obr1
	BJJxyVGp8LOZvmMVkIZMzjo6pAjZ3WChDsP7QB3RyoVexUDVnpGrWStJ
X-Gm-Gg: AYBFou3UjlHhDBZILY9vUT0bUtnKCzCWyYn5Z7l4asy0loyJ+YTntg1dtWyyU9CvxNF
	UomlnQmt9z1R3IpgPHYtkCzVRV4A/VvXvwN2/QivxVS5q/JrkJLkIQ0Ysr1XluqHfrxXCDRDyaO
	rupTdpRQArQeQm63A6EanoNedeIVWZ7M744BEQCeC+TzN8h3R0Z1uT4MqybIeej+1ESp724TMTC
	4GfzHuEHUE8Lft2qygqs3bJ3SSXseGiSY0u45NyDkSxeyaTSuNsNeaF7GcF62LI3rq2ycifcjL/
	R9Km3LS9mMSJSnl1s11cQV8Bs0TQrdkRwqjCMUeUSFnYOPssfdD6voiYlkf04FSn2QTiqD7dU3c
	ema5MoT+YS5WybC64gGRKdk0YMLpG1WFGggJJDy333KIOwLlbQJAY89nHLBbxEF1CsHFm5Ujg6w
	wY6sVcxAIXle2an5uQzA+krBo5NpSAF64wVBFwx5N+LZ3WEaFXeFNrru6ZPcc6k9kw2tSxGqUI0
	YJq/QLyGKvqoXsWVRvT6BX5eKea1FrltVZnj0Gk
X-Received: by 2002:a05:6000:2910:b0:482:d98f:ec9c with SMTP id ffacd0b85a97d-48587050696mr26889219f8f.10.1788808785339;
        Mon, 07 Sep 2026 12:19:45 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs692038.centertel.pl. [5.184.246.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm31975196f8f.30.2026.09.07.12.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:19:44 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislaw Pal <kuncy7@gmail.com>
Subject: [PATCH net] net: dsa: realtek: rtl8365mb: wait out the full chip reset time
Date: Mon,  7 Sep 2026 21:19:40 +0200
Message-ID: <20260907191940.806734-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset bit clears well before the chip has finished its internal
bring-up, so configuring it right away makes register writes to blocks
that are not up yet get lost. The switch is then left half configured:
the CPU port link comes up and the switch still transmits towards the
CPU, but nothing the CPU sends is ever forwarded - no MIB TX counter
moves on any user port, while the MAC reports every frame as transmitted
without errors.

The driver already documents the 1 s reset time the chip needs and polls
with a 1 s timeout, but stops waiting as soon as the bit clears. Sleep
out the remainder of that second instead, measured from the reset write,
so the total wait stays at 1 s regardless of how long the poll took.

Seen on a TP-Link Archer AX55 v1 (IPQ5018 + RTL8367S, 2.5G HSGMII trunk)
on roughly three out of four boots. Unbinding and rebinding the driver
always fixed it at runtime. With this patch: 6 out of 6 clean boots.

Fixes: 4af2950c50c8 ("net: dsa: realtek-smi: add rtl8365mb subdriver for RTL8365MB-VC")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -136,6 +136,9 @@
 #define RTL8365MB_CHIP_RESET_SW_MASK	0x0002
 #define RTL8365MB_CHIP_RESET_HW_MASK	0x0001
 
+/* Time the chip needs to complete a reset, per Realtek documentation */
+#define RTL8365MB_CHIP_RESET_TIME_MS	1000
+
 /* Interrupt polarity register */
 #define RTL8365MB_INTR_POLARITY_REG	0x1100
 #define   RTL8365MB_INTR_POLARITY_MASK	0x0001
@@ -2980,18 +2983,38 @@ static int rtl8365mb_switch_init(struct
 
 static int rtl8365mb_reset_chip(struct realtek_priv *priv)
 {
+	unsigned long deadline;
+	unsigned long remaining;
 	u32 val;
+	int ret;
 
 	priv->write_reg_noack(priv, RTL8365MB_CHIP_RESET_REG,
 			      FIELD_PREP(RTL8365MB_CHIP_RESET_HW_MASK, 1));
 
+	deadline = jiffies + msecs_to_jiffies(RTL8365MB_CHIP_RESET_TIME_MS);
+
 	/* Realtek documentation says the chip needs 1 second to reset. Sleep
 	 * for 100 ms before accessing any registers to prevent ACK timeouts.
 	 */
 	msleep(100);
-	return regmap_read_poll_timeout(priv->map, RTL8365MB_CHIP_RESET_REG, val,
-					!(val & RTL8365MB_CHIP_RESET_HW_MASK),
-					20000, 1e6);
+	ret = regmap_read_poll_timeout(priv->map, RTL8365MB_CHIP_RESET_REG, val,
+				       !(val & RTL8365MB_CHIP_RESET_HW_MASK),
+				       20000, 1e6);
+	if (ret)
+		return ret;
+
+	/* The bit clearing only means the reset was accepted, not that the
+	 * chip is ready: register writes issued before the documented reset
+	 * time has elapsed are silently dropped by blocks that are still
+	 * coming up, which leaves the switch half configured. Wait out
+	 * whatever is left of that second, measured from the reset write, so
+	 * the poll above does not add to the total.
+	 */
+	remaining = deadline - jiffies;
+	if ((long)remaining > 0)
+		msleep(jiffies_to_msecs(remaining));
+
+	return 0;
 }
 
 static int rtl8365mb_setup(struct dsa_switch *ds)
