Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1639397331
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021875; cv=none; b=ZAjYxNsfWEfgNnnB4feltn4w0hVRl501kRzd0fGK32ITGcr3draCtM2PKMXOBFJXrC8WMsDZ9W4E65S6eZ2pddjzgwP4tqgdgQ/ppIh00SrSU1p5KnqvlElgleFcnF9iS1PJymO23DslEW63UF5qfzGG3Ah6d5/HcTrC3wqTTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021875; c=relaxed/simple;
	bh=t/ovtFrISDktBvngN1BFezgR29OO5wT7f3gkFho/p6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJ94QhmmjP/l9064D1vQKvTWOJ42IkLnqf4hAJhlvGvdQvg5a1sFTENLSKS6Zmgjg+hcobe3e3yyddqPbdXknm+3qteGe+lSRZ82vupWUVxI8n6WNjAhQC+vnuOhFT8AJIpL9UsBgc/sMiXAxIc7Ae02xi5/lFzBFX/aS5X+Sf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNrNfNC9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNrNfNC9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso59564035e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021870; x=1789626670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gk/nJeJxwPg2pq5tNRM4eCstoAGF0TBlM4pNX6SM0kY=;
        b=iNrNfNC9cTcOPf73Bu4NWCktp4uMi/GEHfZIUF9uhx6CrOyzSI8ghXjSr3+Akdo3Fv
         QnLwwzuur8bDe+8LwJMyVKKP7syhPAPmqYPun8j82LsXVRArdQTDHkZCrGbJZI56Ds3j
         vo8c115Uc5PsB4fVt4z/q0mMP7+1LroH0/AF3pF3v07YfIGhQKjJ90vhQzKZU+4qtTkF
         ltte5PL/WpX5DEk5DzOAsXyjr9utkGB4J6Xoa0YeCEdo/e/9hWQHDngIaM4xnjArb/IQ
         WMO0JR5kucFBQroVmG36s1Xvpq8WpQ/2pRYZBDZ5XPyAlLdMqc0HzJHUfk9PxMVBWm9M
         xS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021870; x=1789626670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gk/nJeJxwPg2pq5tNRM4eCstoAGF0TBlM4pNX6SM0kY=;
        b=XZ6uzy5fcG6wD1P9yqulUQ6lxNTlLvDGxlLfwBUR5hVkHLTLZSdbxbJFEJr8MCvjVa
         8QSjvTM2/6yRAw5X1tLi2VQ9iWW4/+zuiAGqwPmpK6rc2ad3S7iSSCswkHBrDZf5Ywf8
         sfKIY8aCGl9u8KhuoT1uYfwYliEM/xBVCWHqYEkktyafQnfX+9DQxx8WA0oW1LgrFV+/
         aEZP1JEolAX/LQFCgKFY0Qv4KKxX1hRBxq45BBeE3XxzEqTp5xFAJdSpvIlOcZjN7feK
         Fpy4hEX/04iyd4d1wQcmR+wvyoqxYbi+o1II2wY94OWCRzXJ0zjTK7Vm8xnFzkXqTRYG
         s+IA==
X-Forwarded-Encrypted: i=1; AKwUvBw7bN4iYrrl7l+pJi03Q+9tVpe7W5kgJu2N7ZsA0f5dcu/hQIVb/R9lETLESbdjzk80EEyKuFsCS4BCs8c=@vger.kernel.org
X-Gm-Message-State: AFuF++lXxtNpDRsVwjxtIa0oV8bMzMEB5Us7FZnQB6hdkfyHB0fbJQqT
	vnx1fgJ1Yqet4FSkIzZ0C2p84Y4al3Qm2OHCh0dHdTkvPRgbyzWkr25G
X-Gm-Gg: AYBFou3ZNJhyLGiaz8ziE/PL8RmGtRUWAoqfO+/3acqNV7NfKrIKz30u1Dqq/3xQeue
	BOm7Z0EzEw9D1ZsirfLCfIvI3Dr40OYFucvyiqY5n26TbHJ0503XUFIofAaZ3na+wlBxagxSmu3
	OtqdLsqrQPbVGW6EUHLLA7KJCMvFahVftpqh8YNNUOI3xL01WPEaQTRfMtioMf7nbkF8gQVpNhw
	XIuBOEXZ4GvhdXWTbm2xxsFq2pHCxcTgXDzvfhu4c9sAbK4lL+iocBdNRkPGHDba7z8/EfTSive
	RRlq0OQP/FZP4O6MZ7x6/aPSxpedToo6rSblGIY+sTg7WjAT+aylvdtbtsd5C2/NdQGu8PUspoa
	RJv2CrW6bVRm0zqle3RA6I7IJ4bpnqcK3pikhu0vSjT1VCSsuWXBIsTZTVp7lsFwDtqRTPx1MbP
	iUxrbqwUOa9enlJ7amZqAL8yTVdxG+YmVG1D/+Mt/UJyvrK0CFd5WIfKngUMRLFWNNUoUyYgnuW
	a3iTc51V+ccHBSDKj6Dq0+91wEuzSrWtnBMXmPrpS8=
X-Received: by 2002:a05:600c:4693:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49d00399d19mr308998655e9.3.1789021869734;
        Wed, 09 Sep 2026 23:31:09 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bfdb4asm47441825e9.11.2026.09.09.23.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:31:08 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] HID: lenovo: suppress phantom radio control input on Yoga Slim 7x Gen 11
Date: Thu, 10 Sep 2026 08:30:51 +0200
Message-ID: <20260910063051.4556-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910063051.4556-1-okerixx@gmail.com>
References: <20260910063051.4556-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ITE keyboard controller (048d:83db) declares a Wireless Radio Controls
application collection, which hid-input registers as a second input device
advertising KEY_RFKILL. That collection never reports anything: the
airplane mode key is wired to the embedded controller and reaches the host
as EC event 0x19, where the platform driver emits the key.

Map the collection to nothing so hidinput_has_been_populated() discards it
and userspace is left with a single, real KEY_RFKILL source.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/hid/hid-lenovo.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 3976d7b53b14..617bba662659 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -476,6 +476,16 @@ static int lenovo_input_mapping_x1_tab_kbd(struct hid_device *hdev,
 	return 0;
 }
 
+static int lenovo_input_mapping_yoga7x_g11_kbd(struct hid_device *hdev,
+		struct hid_input *hi, struct hid_field *field,
+		struct hid_usage *usage, unsigned long **bit, int *max)
+{
+	if (field->application == HID_GD_WIRELESS_RADIO_CTLS)
+		return -1;
+
+	return 0;
+}
+
 static int lenovo_input_mapping(struct hid_device *hdev,
 		struct hid_input *hi, struct hid_field *field,
 		struct hid_usage *usage, unsigned long **bit, int *max)
@@ -510,6 +520,8 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
+	case I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD:
+		return lenovo_input_mapping_yoga7x_g11_kbd(hdev, hi, field, usage, bit, max);
 	default:
 		return 0;
 	}
@@ -1568,6 +1580,8 @@ static const struct hid_device_id lenovo_devices[] = {
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X13_TAB) },
 	{ HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD) },
+	{ HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD) },
 	{ }
 };
 
-- 
2.55.0

