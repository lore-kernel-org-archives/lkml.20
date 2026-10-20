Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488273;
	b=ikxelEqh/2iOXdxVymk6197k8j6RcpMrFA2D/mtkOHkxJYvbfB6ZUzs9uroHfnJ1qGRK
	 sHP5/WU3pDjjJVYKBdOP7VHNM6FXshPzEq1UhVnRvagEI6moB0Z4qPNZL6JZnm0LMbrXZ
	 CysfADxV3SLIDRttdsDDeVBuquUY2yNZCRYxobj0xmPYhNlLfthAznGj6ij22ZrhYyvdI
	 /YvA/j3rVp1wJ4+eNckTtmks997Yp8FBytqIPNN1qG1GZqhOyMix5kXQUWJQynNhjKfM8
	 ZFe/RirVvmeQs7o24y1FItQ4LKTZdpy/JQmAGK4UfAC86KDE0IKqKvvMaGhEo0CIYsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YhR98GAugytxHRAb8hiWoVkmCXPdPB5LuVhvFCrlZL4=;
	b=Qkg6GT5oki5W2Phzty/6DzbPudZw0hnot4SukC/L7eVC0wWBr2AKmnIk+EvYiwHbhWKB
	 AuwFhU5tKHyf4Id0STf/cVhxaVuNSLmre3TH0GZyDDvwIwqJYEQOzfpDEHSPTay9FqO++
	 2EfZmEhPX9pqZOwzD188c9Hu/UgiZdXudqt6gBwDjAY7ELoc8QJdt6p2kNu0+Ou/kmHA3
	 4BrY9YmXakSdBRcXf5zRSqVXLhoI3OlaNnyO+wQxv3dMNi56CLGwPKHEUuiRRznUaxe0M
	 lRo1FepSn7NkthRjtJBf3loQaoAi0o/I/MPRVeWRWOpYoQoRopXKlSuZLJqiHNBaMIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GvQUjJvp;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB260A262E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEB260A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GvQUjJvp
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so4097915e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792488272; x=1793093072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhR98GAugytxHRAb8hiWoVkmCXPdPB5LuVhvFCrlZL4=;
        b=GvQUjJvpX8MyHATLYkvvoNIz3Q1Satw87dHSOpvtGHTZY2stmp0aHrhF1qWes0H6U6
         Yf6llFE+i1zpu7kghGnyhVasmvknYmKmllxmkPBuYb7ckOYS58lzWvXzIjWXopN3dOAg
         QiXTgqWBjMS/8lfnUh5P9E8N8rwelJQecwMJs/1J9dFd8aVP1ZpJ2GPvkH9im+AIHVAK
         xUmK8iZqqoLcE+I5fhGoRBwX6JIAzavCqmFx3YLMWN7Br0J8JX9zJvpIFCHP+9UXHVFH
         qiiDC7ceAH5L1+7iFaptb6nJPI06whJ33DS2XMf7uCoApt40hF90A+BN10NVORI3wAmq
         MtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488272; x=1793093072;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhR98GAugytxHRAb8hiWoVkmCXPdPB5LuVhvFCrlZL4=;
        b=0wNHkIpf0GYIVw5p+Cduy9GPdtyKzyGwgRGjg3d1eEzpwemmtb3bjaD+zyZblqbCvF
         1quEYvqFChWTXWqXs6nHnyISzpOM4Jk4l1VUBi/TVIDWdBvjXEWbG/8zhneuEi/xk4FC
         LV0G11T8F4upGToVQ+hsf8KJ6I94g5WSTZhxrEjdUednz08V5O1W13XElKK3f2xi8utF
         DIsAOGbCOH8UgPex4dLvW8YYQS19DoFSejrY3reid1lZouzNiGuxf+2QKOxCngnrX8/h
         9EeRogU0rCBVGeNogTXW4bRTG1NGjZU0W6W5pBv0JEmBKCl8hit7RgERissGxDL+q4UM
         57tw==
X-Forwarded-Encrypted: i=1; AKwUvBx90PeSKREW0zyxqmZ4a0dQZXP3O9lUIPHSvQdCJSlNgEs2D3a0LUILWHHXnvW5TD1+2YDeWaIiJD5A52I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBzdU0pqWJNhMvonff30idbyzUe4JPMcJYURoxh+5HKDPe4UHA
	gXfsIEj4qoUshJh9QerommMzA2pzkcdGDL4LYxNtLOGqgonPzRa/QgTk
X-Gm-Gg: AYBFou05j5c7QtFUq2BSHblpE197tTHGp3B5IN+PbvWQvizodhg6HVisG/xMaVGB/pL
	eAzKYrch94hzy03ImIc4jO/2eLIe4gnQarMeOsG7Vpp6WRAFFwfzoSGadWiFf5kmzHIfeKLcGxJ
	8qijQbPKLcoyOQPeL2AjqoaQHZzO/KqE9uZSsKm3Am5nZDew4A4WxPWBPqvnh3WuRuoFEIZdelT
	BrXM3SiO4A8PENjKlvg0uUtOGBPyqvGiZinOFt9ApbgUcA9LxGRYaOP1Hz3OBadLhUZy8AHo13A
	/9Fk8/1ZXGOPHtlRZq4J4jZvWeQxjkORZAORJIvexuNIwlztgcl4Bt0tcHVnu/cu5kzoE7I310m
	tdNs9E8o7Bbbgr+KpCe/6PAChxiWrljrQi9BnO/BnwLmKSzPFFFFpEh+hPw4x6CC1yRQZVdvMSC
	hafxNcjmQjr1g7cqcChXfZ02G9KfztGRYr/8gJdo4nmVyyONieIUrM93lTTOx6uR0cD5Baq8GWG
	FAuwWqDSoTOrofiju5oOwlz2u2HARmW9OW+0WdPMMK3MBBkFi/rfcKV
X-Received: by 2002:a05:600c:6289:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4a1dadf98d1mr196173905e9.23.1792488271636;
        Tue, 20 Oct 2026 02:24:31 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:f99e:1a52:655b:681])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3666sm59218245e9.1.2026.10.20.02.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:24:31 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Luke Jones <luke@ljones.dev>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>,
	Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH v4 6/7] HID: asus: add prod-id, quirk for Zenbook Duo keyboard
Date: Tue, 20 Oct 2026 11:24:16 +0200
Message-ID: <20261020092423.36380-7-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020092423.36380-1-p.pisati@gmail.com>
References: <20261020092423.36380-1-p.pisati@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Luke Jones <luke@ljones.dev>

The 2024/2025/2026 ASUS Zenbook Duo has a similar keyboard setup as
many of the ROG range of laptops, with the same init sequence and
control for backlight. Enable the keyboard control and backlight by:
- adding the product ID for 2024/2025/2026 Zenbook Duo keyboard MCU
- adding the Bluetooth Zenbook Duo keyboard IDs

Intended for the UX8406-style product line with the fully removable
keyboard.

The keyboard also exposes its touchpad as a separate HID device with
the same IDs, an interface of the USB device and a second device over
Bluetooth, so bind the IDs to the HID_GROUP_GENERIC group only, like
the ROG Z13 Folio, and leave the touchpad to hid-multitouch.

Fn-lock is left out for now: with QUIRK_HID_FN_LOCK the Fn-lock report
is sent to every interface of the device, before the handshake, and on
the UX8407AA that stalled the hotkey interface for good. It can be
added back once the driver only sends it where and when it belongs.

Signed-off-by: Luke Jones <luke@ljones.dev>
Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
Signed-off-by: Ivan Levchenko <me@livan.pro>
[pisati: bind the IDs to HID_GROUP_GENERIC only, drop
 QUIRK_HID_FN_LOCK]
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/hid/hid-asus.c | 24 ++++++++++++++++++++++++
 drivers/hid/hid-ids.h  |  6 ++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 65ce31a5489a..6ee2ecca864d 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1948,6 +1948,30 @@ static const struct hid_device_id asus_devices[] = {
 		USB_DEVICE_ID_ASUSTEK_T100CHI_KEYBOARD), QUIRK_T100CHI },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE_MEDION_E1239T),
 		QUIRK_MEDION_E1239T },
+	/*
+	 * Zenbook Duo detachable keyboards. The touchpad shows up as a
+	 * separate HID device with the same IDs, over USB and Bluetooth:
+	 * bind to the HID_GROUP_GENERIC group only, like the ROG Z13 Folio
+	 * below, so that hid-multitouch keeps handling it.
+	 */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406MA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
+	    BT_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406MA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406CA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
+	    BT_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406CA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8407AA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
+	    BT_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8407AA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
 	/*
 	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard
 	 * part, while letting hid-multitouch.c handle the touchpad.
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b3aca5aa9176..59f44204d738 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -228,6 +228,12 @@
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2	0x19b6
 #define USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO		0x1a30
+#define USB_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406MA_KEYBOARD	0x1b2c
+#define BT_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406MA_KEYBOARD	0x1b2d
+#define USB_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406CA_KEYBOARD	0x1bf2
+#define BT_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406CA_KEYBOARD	0x1bf3
+#define USB_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8407AA_KEYBOARD	0x1cd7
+#define BT_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8407AA_KEYBOARD	0x1cd8
 #define USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR		0x18c6
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY		0x1abe
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X		0x1b4c
-- 
2.43.0

