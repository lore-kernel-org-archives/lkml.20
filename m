Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908F64E73DD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609062; cv=none; b=ZfmWm4YLgj9ntNIlnvblCiiSjaxdS1aUJ/BPyEiaimxGMD0M4K32A5zutaV3QYUbOGlzrSOFcNV8GlGpEXIcfY+k45j0msjdFRk6gvRSUfsqILlbC3SD8nBfOEXFK0pxUsfPy7SxuOj1EmiIhzCR7jFP3wquECXEyn0xZ+PYBGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609062; c=relaxed/simple;
	bh=RuP//N9uzjxTyT9JdGxXhEyQ148US8+ujiI2RhXbwhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqRLjr/ZC/VvAN10W1Fwgk4d8wy7qdU0/Knnr0NyFKVUkx+aSttyC6JCcfzJE01Xs/F127CTXmg/k2mYyTBWaNyO6I8xcqE2qmuEHEDdJos9tN6KuiS/epsthEWm79LNJsG0tYx1fvpQ2FZyHwzbc+aKdhwws56eul/M5kbyjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dlv+EuF2; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlv+EuF2"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a8878695e8so9966637b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609059; x=1791213859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQJBEt5F+3g1IlMrcS29eqi3x1TK5IX1o1gGax0D0no=;
        b=Dlv+EuF2ZatQQkd9qVkxfBrqB4IvAB8L9gz1GbT3AcLdnBqzRfnzRjlHuoXMFchtI2
         bimDS2/q+60SQlvQuYWUDy0x8vSykvLdcPzG1ClsbpEoDEiNVc2NJy5kZvFXawrlk9Mj
         6gHUuMAT4cWIAU/V+TVBgOUroH14PkNCv+TOkzOEcR0fsPH9JAaWdhKECa6ndKDD6HLw
         nPCpadiu0vPtExODlD+ZLyYwDeuyuO8HuRLhxz6sNY1uw6YEc1OE3QPP+1hJ5pxoTrNF
         irHmik9FQCa98sINEOh72W2k+Sy3Q65csgA0v7cIBYg+yfkK/XHaN25ka/r3QA+agIaT
         GEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609059; x=1791213859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQJBEt5F+3g1IlMrcS29eqi3x1TK5IX1o1gGax0D0no=;
        b=UqI64ww8L7TckM15xXZEc0jSte87glsqYCCiJrPQ2YGO3KzObvh1GoEGGSkI1MaH5R
         /etT0J6dt6CUkVi4EAR5KpaBD7m/X7rN7JFO0hx3ngImycgOeXftntr9tSfcItZihT5o
         QJnIFtMuQFk0JkS4NZGvomWUnRyl76BJVwojxplFU09FYZ+Sjti7vmzH1ujK1feUMF3r
         EgaaKOP8bFlUVTkG+iY6IOjLzT6aNOZrBaRdb9TGCOPGhxAUmxEY/8pPOJSm2MMrfH2o
         pC6aFm3I2YCMYZAlMzZKoOuCoOBDIhp2YDf2+ev0JkPe6agOKVBywjxSqefb8+znDb1T
         wX1A==
X-Forwarded-Encrypted: i=1; AKwUvBy8obtqVpO+rKD1LelARnJDZon38TU2qXXlDT7YlWjzCtTfT6HdpsgvbxrYJXdZs9XEQvKY7kgIBrpF5uU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSJpFL2iAeAypYbs8NzyemmQdJU2wycPZUy5ADwB5D8c6brMW2
	JIvFx75mh3WsDbrwriV97z82uM1krjzHYwJd2Yn/ouS8m4txF7S0dhGZ
X-Gm-Gg: AYBFou04RUsyi2aaUrQ8t0D/jSjX9Gxo/7LRmE7dmT+5zLzmlqm+jwIiTihxp9c87+R
	UVvWm1xrm9EhrdMQXGwFMW4gKMqhZVD7oG3NoWeNPxvFzvU48HjcUXXHmu0jHh4KoUFHhzTIkqW
	mT/i/3Z4EY6hmhuFYj56L7U4t9kUzaS4XhIJ051vWMFJ3FBoPP+yH5HHrRb+Q1KhVIirrj1+cn3
	f1GZvvhJww+9WoBma2a/YBzVa5ZOB63WkZ+TH1uSMN4QMcVdPzlOjmSN4/5uPmekeo2KRrrLvDU
	wXWjiRpJHPS54Jw8q9LAjYvq5lBSr/bzrsA8H1o4g5qvwdEBdnQYhgLnB6jttKWvR9lpuzHDj/m
	c5/x3ErgNKYbjry6nftzqJSDH6bobtO28kfa/5nppmkqBTfO+GPe5tfNY+35PZu3ifLNNnD2XrN
	CuKoJfrKDcGFloApS2sd5YA0/bZYhCFkngLFQP5FJ5nlu6qX3O2Ri2Ucw97Rf9ddrJQ7dlatMRs
	qaRJgytsXotzU6InfZSDKjzSLNO8b2R0xshSk1Q/0bn839xxyQsrw==
X-Received: by 2002:a05:690c:386:b0:892:63a4:15dc with SMTP id 00721157ae682-8a64f2cf5cfmr66722717b3.32.1790609059514;
        Mon, 28 Sep 2026 08:24:19 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f882ddsm45777777b3.21.2026.09.28.08.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:24:18 -0700 (PDT)
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
Subject: [PATCH v3 2/4] media: uvcvideo: generalise the XU flags fixup to all controls
Date: Mon, 28 Sep 2026 11:24:14 -0400
Message-ID: <20260928152416.766957-3-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928152416.766957-1-jordan.mymail@gmail.com>
References: <20260928152416.766957-1-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_ctrl_fixup_xu_info() overrides the flags of controls whose GET_INFO
reply is known to be wrong, but is only called for extension unit
controls. Standard controls can have the same problem.

Rename it to uvc_ctrl_fixup_flags() and call it from
uvc_ctrl_get_flags(), which handles all controls. When an entry
matches, skip the GET_INFO request, as its result would be overridden.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Assisted-by: Claude:claude-fable-5
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

