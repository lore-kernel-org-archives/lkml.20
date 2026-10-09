Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541DF4E9C3F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560115; cv=none; b=I0iVnvGoq8WasLkV/yWqb9ak3J4+iR+NGv5UfWx04mJZ97yQs/8rmLdAFXd4+kFoZWpFQWwGtzuiixyOV1i/Ik6fdw+HBoshaU095g839V/wuhV+oejoTE3o+cbkYjWbtSLSvoy1j7YUYg8nyHh3cmQS6pXR1Rmz47CtVNffWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560115; c=relaxed/simple;
	bh=MsXReVJC5eY+3TYoNs+2YfC4ePNs7rrfICxpQk8LZfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e21SrYubmVAJWKxZIfQGDDNc6PHyH5GwUuOVfajuddahq5uJWjltS7jbJJN+N6drTDzLRxnb4i5UFj2th/uuE7AIHYqJhrCnzxfw/2tJeFjT5pnkTsWQ0d2UYJTBSRYVFEPb8UkvfPCwEM3l++24nkVX1EITJGD8thutakuFQYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCpmoLI2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCpmoLI2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1923f15afso3044105e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560109; x=1792164909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aH516Swii4BfPmSR5FpU+6dB9l8TnCFu/KMnjN73oU=;
        b=UCpmoLI2ec51rBogm2ZSEI7VxhWAww3luXwSyOFYBO/ew38+1rnp4g8bZ0zMnsVkrP
         CBFalf7KlxkKeRvrVIbOOK0JI6V+x8WRzM46mXZIa8qDbKvN5obfK+aBskeSbm2+3rdC
         8EOpCyr1+BvrHrNu2bL+G0I4neKyGatD6zK7jX8y199gHfi7iBwGUXvJx3FBq6MRSE48
         kN63ucUJlRl5CcDW99m8EvEtrZRI8ghtha6GmcZy6wk5ZzAOaHG/T5sJ7esC2rmplvFL
         rQ9lQh1sqetdQzZfCLiyZdxkg4KPBfUO+pyCriCLykIoj+yJFEMV56Q4GrgzI0UGICYh
         ZzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560109; x=1792164909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6aH516Swii4BfPmSR5FpU+6dB9l8TnCFu/KMnjN73oU=;
        b=nezUZmRLNR1VeaLIM4KBOUIyzU26fF05Y+qpM8OOMuuP9TDCJrz8Zj/eIc9NDd8+FI
         63SeAH9m6bEx7wtbEiTsarc2jfUS8VZIKdhpbBWSIz0po7yUynEOH5t4Fgg0lfX8UsRR
         MjyjYcxD1FnLiIjxuB3jTWconn+70XEBuRmDuqzyRUysztqmfUDvHfg9peQ7ntC1XgJk
         Lt+MpzSDahT6kkFU0qxkXXHFPf+e3MfhiKUGw8qb3awyY07dSQ77DCn3pR7vnaA/oMQZ
         hmYLIKeauBmUOHHJRUlro7/QWzrbbWtGAWcWzsp5KsqtXuMUpQ7Ghz1MRNOQa3CWvkpD
         HVbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+bknC79ND2p7aRH+m8sTaoYCYYwMZeuJzhTAywbInM8aRIFYoRSMDLPZLyjnzdHK5OySu2pOM8O/EhDc=@vger.kernel.org
X-Gm-Message-State: AFuF++nYWRoQrz3NvoZTP7tLJRUlhJSYbgIL6TTpq5QZLUjuNxip3WJy
	98GZnoUq8Kd71761xUEeZjpL4WDJ+rdbJUAKSdTknd5c/EnSIvgaJzzR
X-Gm-Gg: AYBFou0SKYm3AX01c2KPI1ikydgGxISnP+5EAQItpZPCXPmdpPcs9+D3KYCbDhl3NpT
	V3/R1vhBOVONXADy4a9MvZja7QGjG+9rRDRgf295bf5Onjo2Ln5CxKeMQrQmciwTJ1DblWGaNGB
	kA9wJV9LPf1eDaZ3SZ82l46wo6l6WurHAyEqyRi6DJAfJE3HhgSR9kNNMtSW+Xo506MUnM/tkxP
	KAaVFU9opbrUglvL9KBeN0XMldMVYeSZBbnD1jw0DOwvr+mu8lnUCWTyI2f5tL+gAgTGZi5ag1b
	sEmMT059ujASH28wExWhFlQC8oFAHL/TzqXqkzSGaC9CwQfEEQeV+3wLEUl8pUKn80s4k6PrJj8
	SAMMfhVCrkC6QugtyFlhYehucnQtNjJVYboLYl9MJQvgOyt7GA0xVNG4e6P0v/Rkc9RpnpMJkyY
	jWhAII9jz9E4jbdJsmWQTqlNZ6SlqVqN/kzUtE3PjVBVcn7PPOFfQF4GiCseUjN7z4NULS1SeWR
	P8KPcE5UIyFaK1hPZlUWboXtAqiWgyDgkipIMZskeat648UBsqPp9eGYg==
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id 5b1f17b1804b1-4a18e4cb7a9mr43309525e9.20.1791560109246;
        Fri, 09 Oct 2026 08:35:09 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:8516:411c:ea75:bb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm66926935e9.4.2026.10.09.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:35:08 -0700 (PDT)
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
Subject: [PATCH v2 6/7] HID: asus: add prod-id, quirk for Zenbook Duo keyboard
Date: Fri,  9 Oct 2026 17:34:33 +0200
Message-ID: <20261009153459.124752-7-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009153459.124752-1-p.pisati@gmail.com>
References: <20261009153459.124752-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luke Jones <luke@ljones.dev>

The 2024/2025/2026 ASUS Zenbook Duo has a similar keyboard setup as
many of the ROG range of laptops, with the same init sequence and
control for backlight. Enable the keyboard control and backlight by:
- adding the product ID for 2024/2025/2026 Zenbook Duo keyboard MCU
- adding the Bluetooth Zenbook Duo keyboard IDs

Intended for the UX8406-style product line with the fully removable
keyboard.

The USB keyboard also exposes its touchpad as interfaces of the same
device, so bind the USB IDs to the HID_GROUP_GENERIC group only, like
the ROG Z13 Folio, and leave the touchpad to hid-multitouch.

Fn-lock is left out for now: with QUIRK_HID_FN_LOCK the Fn-lock report
is sent to every interface of the device, before the handshake, and on
the UX8407AA that stalled the hotkey interface for good. It can be
added back once the driver only sends it where and when it belongs.

Signed-off-by: Luke Jones <luke@ljones.dev>
Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
Signed-off-by: Ivan Levchenko <me@livan.pro>
[pisati: bind the USB IDs to HID_GROUP_GENERIC only, drop
 QUIRK_HID_FN_LOCK]
Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/hid/hid-asus.c | 23 +++++++++++++++++++++++
 drivers/hid/hid-ids.h  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 9e80a2bb54c3..a0a04ddb30af 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1834,6 +1834,29 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
+	/*
+	 * Zenbook Duo detachable keyboards. Bind the USB IDs to the
+	 * HID_GROUP_GENERIC group only, like the ROG Z13 Folio, so that
+	 * hid-multitouch keeps handling the touchpad interfaces.
+	 */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406MA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ASUSTEK,
+	    BT_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406MA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406CA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ASUSTEK,
+	    BT_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8406CA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ZENBOOK_DUO_UX8407AA_KEYBOARD),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ZENBOOK_DUO_KEYBOARD },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ASUSTEK,
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

