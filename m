Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910104B1468
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888045; cv=none; b=O06QIB9uXRuroxFR3B9I2pEpvNE4jt+N1sAaLtg5AwXQ9xTAHPbwKZmbfKIXHlK3MlIu+9hcFdnrYE+XN/Q3zSnH6aH2yrmAMbYyRx4ZMMu3qr2/i2KKAMssBpl4n/UKwXGXIbiazn7XBvhLSwqeZ/m3bmbGYf1RGh4+DUob+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888045; c=relaxed/simple;
	bh=qHY9r794klptAm5NgR6mXYBmIoJYfriMTv6kSe8rYJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ee2mQAhQbYOkt41vetgOfa0TCQSnItWiX/LV162f0n8PVOM+loXZkcab36cb/YbccSOkzB+a8YnQY0FY5TkpsHEcdNe8sE+5cECsSbBM5v6o8CUrgerpA2GbnJvgPo52rBlc51FeRgsQPvvuxyseq59jODJOuKKlaPrkjeOGxiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLbe/A6S; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLbe/A6S"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afe0081a6so1880060f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888042; x=1792492842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sVHIxs+v+8cplWEc7E3k57dIUCgaz9TOVCQUjbnRADs=;
        b=iLbe/A6S0R27vOfdRSw57HIOMG9w9805Y8l8y+5xtDtoKjWLV6Iz3yD4d4mYcDr07F
         9ZfC0tWV4Hrkoel2mcU+w9svCa4kj9AWwU5ZIZXfSSYhJpIRQjk2Rqf/63E5Fanzk9qF
         VUMlAxAzA29NgakPZOi3d15Fw4QQtzvOyL11iy1eSJRN5mp8IhZp4X6nRwry1mH+XywD
         o1k3qcatODG/kIxFbY6aMw86+SXzuq5nHOKN26B7FYi1UeucgWMUw5eemYSdLE37wBc1
         CuIOUqiz6EYNqJySjMMdjNN71Y4wmrxD56+XHVS8jQYu+x4sLSmPEMbxppIEWakJ3baM
         +3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888042; x=1792492842;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVHIxs+v+8cplWEc7E3k57dIUCgaz9TOVCQUjbnRADs=;
        b=dSQWVkY9VlpYjdVV1kZA0q2e9DpToOoLRtGBTZAG6hY2ILbNIGYfJWdv6ECq3jqHN8
         9M3FCQLxJGGAASEd0OSbLLTVQwKh98MO5x6MaGwduesRzqugAQHQHAw0E0dd7aPXoKwm
         R7W9mrq5LzgLHNTPZR7O68xeRQrdO6NLwxQJqrPLBE+TsyOFDRgY+VjS0RzAhZ0gZiWg
         ROZcHIaEvKvl3+fSceRQ+VqeodH7aTTJAtD3u3jVANl/nlIyW0yuG9GAOwncV8VEJOmb
         Gnm6Zxvmq5NMGiBlvv2PxSNbW8XMJ1wlRbK8bvNcmXNOt2T4jklwebOzJaWgBh1JrVZg
         pekg==
X-Forwarded-Encrypted: i=1; AKwUvBx9BcEl9NktNMrGUNxoQJRTy11oJKiCkQSI2F5WB1wRCB7Nl85tyW62FLC6HvmsfxW0/AiL1nfHQHhCsqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNhXmH0d59Kd2qc5hE1+tpm5QwjCPz7x1NsyCffyCjXir/Mlf9
	kDQNAsxgqO3fbT2Wv4LCeJA2rAingzJU99CZk0dhgt0Id9JxUY+1/UWc
X-Gm-Gg: AYBFou2+9w09dskiih8TlK+oHtN8O4s9UChxM1Fbtn2FgWrx2pd/4IOqN+iPzuC4lrw
	JM8iHUPf44BJ3DhavCPqoWJvXwwJ5abCyHWS4H7TwZSv+9BtK4QULjbhmyLq2i9CbKLE0j9eYps
	9uhbz1qt96WmJtxiJ+Xuesl87Wndlxv9A22DtSPXLMBn6ThrlbUFjnBes2IGp1SKWhBkV3XBNLt
	RbpdfbxUEmt+X5Bv7FJPh3PKzlJ/pjsyOXAU6yK3jmt/sDqeksjHL4g0KoRrkVBC25hNLshrTn8
	jI5R35tdNUO3eCDYliv9N8w5KJMHJ4im390ZI1ich/TcYDJHqe2WuYOEkgScxrU5gvDPMFVBAgw
	6IwzKVfDtUgzcAIPKeSwG5OjIZE/jvdTmyymyAa8jMUd+J5Uy9BxDQABi8/m9KQoiHsC9wRc95A
	Sn776vzOgnM3sisuD6goaCVbtnJRfbazCdwgWlvfV0ymHqPgiYyr5z3yoZG9yQSE8Kv9Bqsy8Tm
	LCtBZDgF8r/LZJ8c0wWz1hrI1aRBgcolMjhbPQb24mU6DdDp/kv2oLI4ZeS9QpPKYqO
X-Received: by 2002:a05:6000:27c6:b0:48c:58c6:99ab with SMTP id ffacd0b85a97d-48dba78775fmr15263242f8f.4.1791888041560;
        Tue, 13 Oct 2026 03:40:41 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:e22b:cb88:4091:8aab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac3ac5sm4498184f8f.38.2026.10.13.03.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:40:40 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Luke Jones <luke@ljones.dev>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 6/7] HID: asus: add prod-id, quirk for Zenbook Duo keyboard
Date: Tue, 13 Oct 2026 12:40:03 +0200
Message-ID: <20261013104033.36079-7-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013104033.36079-1-p.pisati@gmail.com>
References: <20261013104033.36079-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
---
 drivers/hid/hid-asus.c | 24 ++++++++++++++++++++++++
 drivers/hid/hid-ids.h  |  6 ++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 7b17553e94b6..503396963eeb 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1849,6 +1849,30 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
+	/*
+	 * Zenbook Duo detachable keyboards. The touchpad shows up as a
+	 * separate HID device with the same IDs, over USB and Bluetooth:
+	 * bind to the HID_GROUP_GENERIC group only, like the ROG Z13 Folio,
+	 * so that hid-multitouch keeps handling it.
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
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, asus_devices);
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

