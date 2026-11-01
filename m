Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793526583;
	b=tr+cz2EX9CGsYRmtw6bXIwL2xXTD0ra2cZ7XtU8QINjMZnm9Y/CC6C6ZrKRNp6EHtz7y
	 Ad9SkPxs3JCYwQr/y+JEnxsq2/hviYQupbXCR3gh7YFEzAM9qHR7VzoxXh5/kw5IRNUWP
	 +9sbZ2sO5Ds7TbhaI9SfPoDkdb7C9rGS2TQZfTFn0bR1f0jYv2L3ZjUXdGIt1W3TV16YX
	 hS9HuIsIqi+S6SjU/+NTAWHR3a9gtEUOpomczLBlqV3+WWrJfUu1RRaWZ+u6uax1ii3Mc
	 2rIJkd2Z/7s70OzwUDHFXW7LSqolmgKHd9Gu6akYqRbeFga8vKuW9vphgS2O657klJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793526583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iZ66pNG8GoqKxl3dX3y81a9lvY+mrvP5917Q/wYwODo=;
	b=FcED91ota+BETh7UpYLcp4krx2Iiiupji4y4/paxULQtFj6jpjAqYu80uwVKrxlaaugb
	 mxT1NcWiAvMorrGv0HMqRV2+xS5uEPc4gnd28483dF9+6uFAkr4rUPEo7MCgyX/7I5vwi
	 8w97WF5R099inyRCz2lu8o191AJseduJzVqvJXhIjE2HAyXFfelBxDm7WvSqwDiZClko3
	 meKFcm5zCnuPBxXG8Ho1YAeAZwSV1qttzjVnciAVTJSzrothsSs9lgFxlLj8gONIAQumH
	 41HyrHzBXvhYpwX0V2wgwqi/npuGbEmQ1ZGdsd1C2owPlxTZ3siPM90DCS7XdIxSUGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u/8/bRD2";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E28606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 09:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E28606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u/8/bRD2
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so3589977c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793526582; x=1794131382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZ66pNG8GoqKxl3dX3y81a9lvY+mrvP5917Q/wYwODo=;
        b=u/8/bRD2Dahmc0w+8YjW5sCXVv8pBLBhfsD7KwtcQcOwHHzPoh6cjpKX0Z6g5DE+gD
         H+58U/JOUsoRluOzRy8yqgVG+wg9oQjifvZi0qkBbZsv4y4ekkOcJdBY5bQAcI4NGRO6
         8TF3h7sUd+KOPV8YKEmwSwmoBewcbmkDYo0PNdEb92k7x9ATgR/W/u8LPZPDe8Cm+sNb
         gXM5/GHMc/Rxa7wk/6he6aFUZCTNbWTUAcba+lhBL3KsnSix4zSf9hjGN6T9ywzZcKd3
         z2NSLxulHjwTz7yAQGz7D0nWoamsmjdWk2SQUGhKs5WP9sBzu/GTeBwTA53KPy7BwWYA
         64Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793526582; x=1794131382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZ66pNG8GoqKxl3dX3y81a9lvY+mrvP5917Q/wYwODo=;
        b=DsAnU2p3+DC+ftnJGH0hb4okz9R3bkpUHU+ZrTEXVYQTd6O06t49AdMy/xVxVihU2+
         vixHZZh1f9uLTZqEQjcIVflpxheE8qqwAgIzahm7ZEcSbhOAwXITZO4bjuHwoREgBZz/
         /SghgU6i9HQZmlyzDGm3f0cI52g6HK95qctCj/9getZAj1iehCrMk43WS0NT2lxRfh6k
         XzHT2lFWQUlhN0aRQgNyixZAINrpI5vbSTNsA16n4nk5qaI8e4TFdEWyaPCLXJ1+JH+V
         lzvbP4eKi1WLRxk991Odxeqj8G7wsnTwCE1B8l49BEfTtbLBe0o3GaGprOEGaHE9MXoE
         aCwg==
X-Forwarded-Encrypted: i=1; AKwUvBz3aRQp6Bb5CHyuzs/yychG6UwTo7DZx5NzmBKkQgsqxDp1pWjtufCUJ0xabGL1fknVlYDMgU3lMri5zTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa55mca4G6H1gxSXeu29qsKyF+yfMlaLtpSIQjevbm6HX14z5j
	3ivPZ3u421Ur2oPHHbKREd8dhjFOcI0WWGWZ41YM2Ldcw45dMTPwebSL
X-Gm-Gg: AYBFou1CZ5vh9/iFUIbcdFA1Ut5L/Mtueu58t500J9Qd/K6g8iLg0rI1ax5lUPXXirz
	Y3EIoZrmbdukI3nkJD0Z5qbUehh8IUTb67wccgVTRJU1S123Z0ykF0krMjAaXAbk4w/kenBvQ7i
	xwx8JVgj3+2K9xwES6A6qEQwVPNII9UuXN1U/sOtYhxZi8uBwJ7OC98Pb3XwsT/J9ydNYbCrln6
	i+4nzqc2fSELTH5zwPve3udLZMizPtxkGkYSGWq149fBL7p2eSdem2ioz5Nbeqp9Y/y5zHxKkU6
	HSB579LtZSfRYwLFQEhM7rCXm4OgN3OfoOyQn4mJ9vGhhPncfvexM8wHyGeDWe2fLB4nRfZE9qM
	xkIzRlueYHNOnib5lToKnVDJsRFJB44976ITtvGLRjtWGDHDkS3lv8IUtL0vP5s8YG6pDquGUNm
	6NI7fCZkR2SGGoDwaJ65Oc6KgeJbTznCX5CTmg7LMJt+94UOzT/VCIgMmOFUavW+J98/CbzSiLv
	I1NEBlyBLG0oN4gnkT1kOQ+hGdWhLLl0QhtWcUbJQcboj4CEPFSdL1YTGUrLPXIZzl4rsbijTHp
	Svr9B0elvauY5MH3l3qBOA+cjNJ9dnYXuKyF9WSJUhM87r2Th+rS87Cogw==
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr10726412c88.8.1793526581606;
        Sun, 01 Nov 2026 01:49:41 -0800 (PST)
Received: from xploitoverload ([2406:b400:f11:1bac:4040:640b:8a1:8629])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm40740627c88.10.2026.11.01.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:49:41 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH 1/2] wifi: rtw88: pci: Add DMI quirk for HP Laptop 15s-fr5xxx
Date: Sun,  1 Nov 2026 15:19:04 +0530
Message-ID: <20261101094905.1299638-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On the HP Laptop 15s-fr5xxx with RTL8822CE, PCIe ASPM L1/L1.2 and deep LPS
cause the card's firmware to fail to resume from low-power states,
resulting in repeated 'firmware failed to leave lps state' and
'failed to send h2c command' errors and stalled network traffic.

Add a DMI quirk entry for 'HP Laptop 15s-fr5xxx' to disable PCIe ASPM
and deep LPS, ensuring reliable Wi-Fi operation.

Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index ca4e779..30b7904 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -1813,6 +1813,16 @@ static const struct dmi_system_id rtw_pci_quirks[] = {
 		.driver_data = (void *)(BIT(QUIRK_DIS_CAP_PCI_ASPM) |
 					BIT(QUIRK_DIS_CAP_LPS_DEEP)),
 	},
+	{
+		.callback = rtw_pci_disable_caps,
+		.ident = "HP Laptop 15s-fr5xxx",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15s-fr5xxx"),
+		},
+		.driver_data = (void *)(BIT(QUIRK_DIS_CAP_PCI_ASPM) |
+					BIT(QUIRK_DIS_CAP_LPS_DEEP)),
+	},
 	{
 		.callback = rtw_pci_disable_caps,
 		.ident = "ASUS TUF Gaming A15 FA506II",
-- 
2.53.0

