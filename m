Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281717;
	b=EPc+4EwzEN8grqvUSEG2dwQcbryCNgf67opvGkG0wrJzf/J7xAgf738WdeVlK8XYwX7H
	 TbxULVSllQu5zYTX02gzZAQn9VKTTCrUoj0/zwMhhHPQn1O7rvHwRQF+t1Hoc5Ipa7q54
	 VHEMmc2uCiZSuyp/9872TFG1pHSNHV5Apq7gFueI3DuAQF20z12QRgxgnzy9M1XD1OqpC
	 +RcQj8etduHPRpGEKRp/uZUhvPOQ2BabyZsswH6NGWv47ULA20OZinJE0/x9KniD9Kg9P
	 T8qFXDKg84WXziFSS562zX6xkqePxTGVFeV/hCkyVg5BCRNOFujfr63m929VN5+lKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t111Z5ZVS7PeCXQdsj8l6nyoiLjplHZhuxx+kxKc2aQ=;
	b=w47qluAcXHaAMGruBHCMzoY5lLoFQOuq3gHPirB8MhdpFN2QgXtRIkWFHMTkBvPlw1ry
	 vzrJCnsBGFo6c9mWUCt940BK8ulWYATJwcCwxNMwICWLo5SsQlAe7T8OnNSA9yDfaIYw3
	 Hu7YPzP1YA63WU6CcZLNRYJ+h6BOhvQumJsdghWGwD20+EpXyUqsyySssSCt8iiYQ3FJU
	 Jc0NyKxu0sETTsdf4wSVIlO7a/7WooiMpEgnNwZdZ8i4dC55AB545zjLR8eLmcPZujCOd
	 SXkrl50Gowgx+w1oPZmz3Btqbzc8xGjfJ8XebncrCgrhGP6/yk7PpDn6L36AP3IvG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcHuEEPG;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C69606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C69606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcHuEEPG
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e7ad9f78dso191590085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794281715; x=1794886515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t111Z5ZVS7PeCXQdsj8l6nyoiLjplHZhuxx+kxKc2aQ=;
        b=vcHuEEPGEfS9GtHdi1oSomu34fd2QFM5OBHgNS/GrPPOfyFLmWZUAF6xrjz+9wFZmE
         cJlmqTGzsmKPzjsLZ1bGn3ZfftvGChh6fjP1TgutcGSfDtMX8uZ+ch7yp8EPXwbPT0Hq
         U6T5CZAR5dJLHpjOAqLwBw7QjzFmM6rRFgrLaZwUifXZIL9DyPBxpb5e52p03r4AfNTm
         Ws2CdoHm+eLYIDShdbcU9DpSEjCD7iEkFF86Fe10fY+SiD2unK22Kvp9GWvohEWuVHFy
         mxvCr6R1/9edUkg/C7CslJKekIYZKe+CC/fTYmmT726MDOTgUEmcYgY6CCbVT3L6kM0E
         Bviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794281715; x=1794886515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t111Z5ZVS7PeCXQdsj8l6nyoiLjplHZhuxx+kxKc2aQ=;
        b=pDZBlVZ5XFghDjUu2LtB5Vi+NtYEGGZmSfW5n1tr1TlQ7mM3dg4QQkI177pngbjKtz
         6B0KZY/JAY3iuCgUNm4bHmDbzjHoUOkXTiJwyedc2LLWtbTlOoqjt2MWP3gbbvn8t0G5
         bTtMUnlEQQkXRkr2litmM2rvVB6c/gsI8+dp5cdG5jTfF55sCttmVevbHVTAe9YxLfs6
         EqOgBPQiLMGMaSQT85Clt6YZ2L0oqGeiE+1wiz/o//EQyhIGIuCbnQm2Qr/MkrwjvChE
         DP35ePwQL87XBHPBEBvHViXi7bVeSuvKH3rY5IAB5JWBt+Gn109aLK8/C6Zajm/s50yA
         OnyA==
X-Forwarded-Encrypted: i=1; AL+hErGHAWlxSkJ4/jR9F+CPNERKv1mQ4L1si3NUSkWF6rOjOAQMYfRMT08xkYymdM0PFiolJi5QZvKgQ33ducs=@vger.kernel.org
X-Gm-Message-State: APuU4Z82ulI5WTjvUAJe/blXNgYQ0fYSgflCIKuNZQ0lX1N/3Y5eNBpp
	+3bnr9tJLDexYyXKtCeGCDRF+KIOr9L09E8q3/NhL5RsX2Uew2LHRS26h3IOILaL
X-Gm-Gg: AYBFou0tS7iNfSJrxy/SHhKQhG7ZU9e6/sy0Xz1ocn0r8DRLLSrQxOJIq+zg9Yj7c0Z
	BraaTRuXj/Fhirl61/+BKaux0wBWw1q9hBimKB2HVDV11YLv5UI9aV4vUVELdkf4JB2StErAkgh
	1wXD2AqQDKgXl0u6GM8m74YEldOOGVzH3mreOkO0KG1Kt5UU0ZXRtfzSmk71CS5FcStHjF9ONvd
	zOSoEJ3finm19jMo9fctJbw1kjQEwqHKCKjRAAMzWLZT76Cb21+Z3/OFjZtOABS+xdDrrZHVb32
	FCn8NxrAEj+NHHs31uvnuvQXVRvWT5KN1eZkA0oBjs6r66TKpPE41mVn4JrdThv+M7oAI2HCx2Q
	N+WoROyZaSTO+Rr0Cpi4UV1i5t2HU1RkzQznInuF+3qu2nkOsK8X/l4zpEWcb3GsNtFYW8dfs7v
	w2sq1tTYoIaKIOBDCv/D0l6H0VuyORE3FMvN1Gfq4vdGCMoF2M5o4pb3oBAzd6h2ZywSNmvZnJU
	FnuVZM+VaGvXyx4CIPCYMXbm7E1Li+z8hunUQodITCHp58W8iPs2abX+Pd1HL3HeIsApNKgqxOr
	R8sI+KcY6eYMGmjObL0Xc+N6h1SYNIf5cCP52Kizbi3obwpyy5SEz7bt12tP+S1KXtE=
X-Received: by 2002:a05:620a:4385:b0:93e:d1d0:67f with SMTP id af79cd13be357-9479f3bf9damr224060085a.51.1794281715382;
        Mon, 09 Nov 2026 19:35:15 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:9dc4:9216:4f52:6891])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7ffa11sm125282585a.43.2026.11.09.19.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:35:14 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [PATCH v4] USB: serial: visor: add vendor/device IDs for PalmSource devices from inf file
Date: Mon,  9 Nov 2026 22:34:52 -0500
Message-ID: <20261110033452.306269-1-adamsimonelli@gmail.com>
X-Mailer: git-send-email 2.55.0
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

PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource 'devices'.

Vendor ID 0x13e8 in the inf file indicates PalmSource as the vendor.

PALMSOURCE_DEVICE_1_ID (0x0600) appears to indicate PalmOS 6.0 Cobalt. No
devices were actually released with PalmOS Cobalt, but a development ROM from
a Tungsten T3 made its way onto the Internet. This ROM can now be loaded and
booted into RAM on a T3, which once loaded, the T3 now presents this deviceid.

PALMSOURCE_DEVICE_2_ID (0xff00) is just included for completeness since the
INF file from the driver also defines this one.

Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
---
Changes since v1:
 * Fix compile error when changing from 
   PALMSOURCE_DEVICES_2_ID to PALMSOURCE_DEVICE_2_ID
Changes since v2:
 * Add note for what changed in v2
Changes since v3
 * Fix up commit message

 drivers/usb/serial/visor.c | 6 ++++++
 drivers/usb/serial/visor.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 5706c46c49c2..18c586d552d7 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = {
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
@@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) },
diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h
index 622d639ce74e..0f86bd06c4fe 100644
--- a/drivers/usb/serial/visor.h
+++ b/drivers/usb/serial/visor.h
@@ -32,6 +32,10 @@
 #define PALM_ZIRE_ID			0x0070
 #define PALM_M100_ID			0x0080
 
+#define PALMSOURCE_VENDOR_ID		0x13e8
+#define PALMSOURCE_DEVICE_1_ID		0x0600
+#define PALMSOURCE_DEVICE_2_ID		0xff00
+
 #define GSPDA_VENDOR_ID		0x115e
 #define GSPDA_XPLORE_M68_ID		0xf100
 
-- 
2.55.0

