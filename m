Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E22F5A2D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308759; cv=none; b=I2gdnKw/d0fgtATUGEUoYxbv5yoX5biybCQYGwkLqYM1TH6jEeUBiRuKWUDerWhky2GkwAdzzK1FR9SkFUG8k3RWe8xVRe0RTOKS87UyHeSBQs7M1ZUiULZ/e60SLwOva50vlA1KDstWP+5Tg9fX2L19Ps98EInMzEKoXPRbaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308759; c=relaxed/simple;
	bh=heOUxFnfZ1Mv5w5T/wATPkt2ywMDCQWjEglYxe/ob0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5zLs6hOyNjeqVe75ZBOS48iQJgXDHJlhLvO549ZrM8WPVwmANPEpQe+LI4GqfkQmhpL+r+1/s6wu3+Qt5Y7Sx1zmSA2BQjKKkZq63mppqGx8EEiL7SWvRJ1xeQO1radftEOG4IW3lZIRq9yfq0ZLPbmFQlrbHhGA3PFKKqtNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKsQ4J3T; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKsQ4J3T"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c711b7f2aso462072d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788308757; x=1788913557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaX9nFI/ftp0aduMGpdZxQxv9LWib4/Sz+dza+s97Zc=;
        b=pKsQ4J3TS0sIa0/o19ovAr95avqb98mtM/WDhs5PUDhqFBhPkv8A8Jgd1y/nsydDDi
         3o6E2pTWeQhAP9tV9eKKNwUiLCw9xasQHbhVEpwnk84bjPhjyvnGtpvr1rxGD68W5/Tf
         u7Ts7/yhuePLaMOObVkrfGatMeqXBOpq5G3qBIKemela+k4AemegoDansbXUQU6cVZiU
         6UIwfDooM8ESdSpIql036OuFxeRBK526bfUC5FqDyuOVxuRAXeFRrW356zvePTEbZC/j
         Wp6hSFQtzzWSnZ4TfyHhUSHxyNxG6+8xBCd9gZBiYpLnnYHQamYlY9OvesyKzZSuc4We
         VaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308757; x=1788913557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaX9nFI/ftp0aduMGpdZxQxv9LWib4/Sz+dza+s97Zc=;
        b=c0fCTCe/X4zrWRJY3c6AkIDBAPDPuF0OQgyvH0fnPPfq7iXLWQcrzVDhfVdUwbmZYZ
         XdL30T3QwbJRu0ZqDyYXlCwVlGLUjZqJtyCigHnkuzsmNkotS5u2DqlvZCIZKa/HD0NJ
         l17deXpL50mvoVQwxbrkMveYuqoRx5SLqtAgeST/LCv8VCDHAM83l+LEVcaBWuZe+jdH
         WwwWKSWo73oatlfZAjWBy654o3z+C85rHInz6rAlFsYVUuYhQ8nMdZxsIRRsYsBgYyZK
         vgorEBnpZmeIZ5QSf6h1XNQaAi4e+2xNrG4Tvgvuqb3+P2/tHSgvMAZgrGh9xhNGoteD
         bFAA==
X-Forwarded-Encrypted: i=1; AKwUvBwJEepfpjkwL/3LwcFmgddF7wLKLKx6l+Pp2QtQK514f/6LP/yrBONDctXoC/DRx+vA2GhKypisVnZcXWA=@vger.kernel.org
X-Gm-Message-State: AFuF++ldCTIoGlL3zzro7UUoE2SEDSIreamhcOaBnHDcijTTu5UhGWTf
	Duf2XfgHsuc3rQP/PlH/MnhFlsdRkP6iovbs11HxOBcjMP9SM+lnCq/r
X-Gm-Gg: AYBFou3jDdHuZzbHdlsZf48vaBPKeRNwD29aaP39QcR7x7RB75RPldIdBXKDrC2xQcB
	GOUXlokrvLcT8Zt8KDc0VYeMlqeueQghBCVXxUAAdf5zkzSd5SwYURxvswS+IB8ULTI6Nl1jYeP
	qXePHGivlrNPnWH7tXmYrQ+5TkRMyoStihD07v8zHWQw5V6YDtN2dVTu3cDw77V4tl0w9HM3mtc
	B+NjwbA5CbJd1pUCdlOzLrF1NQuH4+vVM3T1vaz0x1Stj1U+9wE+MvNPXzq4F+Xj8Dw4PXQOyro
	IR73AcCnB+JrARqLbmiiY1DLM+MlllIk0WyxI3gsnBcOxMPivT3B9T+5lV7Lusy589ZYkBV9jaa
	gYBfZe7uwSrNW7f0wVNLO9bIe6paFYI3qqh4DBmHSs+non/Dd/CKitvbLp6m7uBzM6j5y58WIVh
	kGtU7mNcHO0Ytylii/XShy4cbzg7b00fL9EqfSeZQlq23AJuuWrbKdVBvU6H+fKs9FosPvUH8J8
	DSnkxrgq10aIO4UOEUYjE46hD4hjURCEWztwLnOHWnCyZqP+e2bLA==
X-Received: by 2002:a05:690e:480e:b0:66d:1851:1bc0 with SMTP id 956f58d0204a3-66f9be7f1b0mr230775d50.36.1788308756933;
        Tue, 01 Sep 2026 17:25:56 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f98656c1esm755344d50.11.2026.09.01.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:25:56 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v2 2/3] media: uvcvideo: generalise the XU flags fixup to all controls
Date: Tue,  1 Sep 2026 20:25:52 -0400
Message-ID: <20260902002553.34839-3-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902002553.34839-1-jordan.mymail@gmail.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_ctrl_fixup_xu_info() holds a per-device table of controls whose
GET_INFO reply is wrong, and overrides the flags for them. It only runs
from uvc_ctrl_fill_xu_info(), so it can only correct extension unit
controls, but standard controls suffer from the same class of firmware
bug: a device can report a wrong capability byte for a Camera Terminal
or Processing Unit control just as easily.

Rename it to uvc_ctrl_fixup_flags() and call it at the start of
uvc_ctrl_get_flags(), where the flags are derived from GET_INFO for
every control, standard and XU alike. The fixup replaces the flags
wholesale, so when the table covers a control there is no point in
querying a device we already know gives a wrong answer: return early
and skip the GET_INFO request altogether. The call in
uvc_ctrl_fill_xu_info() is dropped, as uvc_ctrl_get_flags() now handles
the fixup for XU controls too.

No functional change for the devices already in the table: their
entries are XU controls, matched by entity and selector before as they
are now, and their flags come from the table either way. The only
difference is one GET_INFO request no longer issued per fixed-up
control.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 91 ++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 41 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aceb26310..64c90c380 100644
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

