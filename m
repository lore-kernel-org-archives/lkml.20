Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01F5013B5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632227; cv=none; b=ZAT3IbksPVKBovkMXhuPr1up4rNt4bsE4QeylP6ybNZdWoHoMfL9KvC3w5t7tN9Q1kqnxrLOaY2ccV424CC1fGyN+PckAaZwTvlYTPK54/Itydi/djai+qFhzMPS1uQ1K3eRaWBJEpw1KZLrZSU99MMQsR0H3wwm7mnQyW9MwfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632227; c=relaxed/simple;
	bh=QC4J/6QeYIlwsv7Vkkp6UFs9YSatQh9e2xY9af6CeYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIo5LnTWM1tszGd5nmh9bGYWv7gjBECAiGhrYyEJkicoTsW7Mkgd5ju8ROj9ABrX2T3V+AeUfziT3UYL+Aon8n3A8G+cpkzfczd02y9xO+Y+3d8gnbbG3Ovz1TdvTn7JKX3UB72fFNsgRxRgL4Ra81THcqC98ZMxMDgdn1IUzoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7GDhqPe; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7GDhqPe"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so3712070d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790632225; x=1791237025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECD+uqPUnEUa5HfMXeRcHJj/AmDdNuHIvC/PHyRvxuE=;
        b=N7GDhqPe1CfyPvEYixBG6j8nng50EGwI2uupEXZSyxqlF6yGosLRyD6OM8iJirkSGV
         OS8zR5WADK5VFKKeb3IpwZHRa0VgYBJWhSbyUYqlgXLsOog6wI3p/qrxtfP9y6FdmKIw
         vKTLuqleE1kCL7vp/xJ9F7nBrb7ZvrFh8oAN0oLurlOHtFEQkkU7NCIw9LcOpP5puhg+
         3Im4oVNxJmsjldh5N8rFk2f8VUYXkJvf+hi0H8zYt5ywK+P/miDiCOzxniDYw8Tcba5a
         XRIL/YPijmKgRQlZ0GOFJ+pYtVfdKcjJ7iYqjsoocPl6sLd08KlY5sQ7dYkohGsjiVW8
         cPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632225; x=1791237025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ECD+uqPUnEUa5HfMXeRcHJj/AmDdNuHIvC/PHyRvxuE=;
        b=wco3gI90i7MZnsjRhRScYoa4I8hKm82UhPzExdE0G2lD3dCyAKf2qGnvp6M299R/CD
         47IkLjvBceiN2ABGyq4uxO8fQHWW7L5BFX7JicPTrIPtCEyDEDtLmC81+n1euE0wOCcA
         Gq3tcNHNrUtkFpgXEMgfgxF6UfmcvlzCzI7f2oJfV3Qj5bmQxuButihrNi1z+9z2elsR
         3pw38NtTihF6VWYHOO8Z0XGeHQxD59gDQD66OOjq4DUY4ck+PI35dkgimKwGpDo5eNXC
         xheUJ3eWJtzMmeEeeNDfVNHIbXSMAMJ0CPM/JyIWTNn1XaSebWtxwur34C9SbPMvedts
         1KXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdk5Vu6t+WQF8vQjODEp/aOS9W5A3Nh9FSx2kx0itNwYBqIzghFDDUuDRUX04B50LN/C96/UNGWIGpdXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN2i+UurO/YDAacqABbMqHJSPebhxnfWk7LnimI8V9GN1qM8gC
	Tt8sKYmb5YVp3MeoIxZd9ylt1LgJGu9+24qazSZyS+qBOBkYF1b67eaj
X-Gm-Gg: AYBFou2etZuGZxnpatFep3S+AM6SQALAGaAhLf8zDgAnHgAjFouDInhOmoICTrOAuGz
	z4KmG94XG4KF6c6U6uFROT6jtd8sfMKQ/EBnGZxLOU8xCQbMsNp7QGYoQYx4N/HVF4N+6vkqvmD
	L3OxiDu6fltGL4c2b/updkxkqRUDtt68ySnP2k9dA7aCstx5TSY3geuDzgKLDRTf7+f9d6lJtR7
	ldIGAzDhDLOhsUx4efQfWP9JWduMeanNKGDgQrIqQMdWTUwWNAldqGWLHRXGUPtUS0Ydfz/VVX/
	f/RZkIbILwmAIFb6kHDI42MX0e3/OOL2VzXGXIkjAhzFbbRZjVBGx/Fk7vAwsx+dfyQ7kK1b2LI
	4immEG8LmAl9CrjLXdRiTuw8q63HSnpmZ+LRb1EIz+NpkjUtuumTUjhRBLh/zUDwTERARH/U0ZH
	U2MS4qIZ7gaVPVk1kIvAUpGr3L8eiE7kNHwgtY9YGx8G2j73LvqQpB1ofGRxudi9MNeqhipPKKg
	14a9K7NRcNKpWobjwa7aQW+w+5QrzB7+heKATpsBSPBdzkPZpupCg==
X-Received: by 2002:a05:690e:128b:b0:675:3c31:4cc with SMTP id 956f58d0204a3-6753c31084emr2433886d50.147.1790632225398;
        Mon, 28 Sep 2026 14:50:25 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a861012f4dsm50897647b3.37.2026.09.28.14.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:50:24 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [PATCH v4 2/4] media: uvcvideo: generalise the XU flags fixup to all controls
Date: Mon, 28 Sep 2026 17:50:19 -0400
Message-ID: <20260928215021.819064-3-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928215021.819064-1-jordan.mymail@gmail.com>
References: <20260928215021.819064-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flags fixup table is only applied to extension unit controls.
Apply it to all controls, and skip GET_INFO when an entry matches.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 91 ++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 41 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aceb263103e9..64c90c380d3d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2852,6 +2852,48 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
  * Dynamic controls
  */
 
+static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
+				 const struct uvc_control *ctrl,
+				 struct uvc_control_info *info)
+{
+	struct uvc_ctrl_fixup {
+		struct usb_device_id id;
+		u8 entity;
+		u8 selector;
+		u8 flags;
+	};
+
+	static const struct uvc_ctrl_fixup fixups[] = {
+		{ { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
+			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
+			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
+			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
+			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
+			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
+			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+	};
+
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
+		if (!usb_match_one_id(dev->intf, &fixups[i].id))
+			continue;
+
+		if (fixups[i].entity == ctrl->entity->id &&
+		    fixups[i].selector == info->selector) {
+			info->flags = fixups[i].flags;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /*
  * Retrieve flags for a given control
  */
@@ -2862,6 +2904,14 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 	u8 *data;
 	int ret;
 
+	/*
+	 * Some devices report bogus capabilities through GET_INFO. If the
+	 * fixup table covers this control, take the flags from the table and
+	 * skip the query altogether.
+	 */
+	if (uvc_ctrl_fixup_flags(dev, ctrl, info))
+		return 0;
+
 	data = kmalloc(1, GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
@@ -2893,45 +2943,6 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 	return ret;
 }
 
-static void uvc_ctrl_fixup_xu_info(struct uvc_device *dev,
-	const struct uvc_control *ctrl, struct uvc_control_info *info)
-{
-	struct uvc_ctrl_fixup {
-		struct usb_device_id id;
-		u8 entity;
-		u8 selector;
-		u8 flags;
-	};
-
-	static const struct uvc_ctrl_fixup fixups[] = {
-		{ { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
-			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
-			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
-			UVC_CTRL_FLAG_AUTO_UPDATE },
-		{ { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
-			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
-			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
-			UVC_CTRL_FLAG_AUTO_UPDATE },
-		{ { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
-			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
-			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
-			UVC_CTRL_FLAG_AUTO_UPDATE },
-	};
-
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
-		if (!usb_match_one_id(dev->intf, &fixups[i].id))
-			continue;
-
-		if (fixups[i].entity == ctrl->entity->id &&
-		    fixups[i].selector == info->selector) {
-			info->flags = fixups[i].flags;
-			return;
-		}
-	}
-}
-
 /*
  * Query control information (size and flags) for XU controls.
  */
@@ -2972,8 +2983,6 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
 		goto done;
 	}
 
-	uvc_ctrl_fixup_xu_info(dev, ctrl, info);
-
 	uvc_dbg(dev, CONTROL,
 		"XU control %pUl/%u queried: len %u, flags { get %u set %u auto %u }\n",
 		info->entity, info->selector, info->size,
-- 
2.43.0

