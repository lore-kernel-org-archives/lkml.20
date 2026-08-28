Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF835C689
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930771; cv=none; b=QBcTa8BnBwOwirStPP6vjbttzjOybwFCdmLlr3zw4jaSatIx0r46N7Y0ucEHEsdXhfIRySAbvJH/JhejShJgQGs1+dAG4RodC+5VE5+gcUgzk1/H6s6Zzf92aykC/S9v6J6h/XP6wlEpO+0SNWK+6E6b3EoUZmVg8Z/6lGMJ/Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930771; c=relaxed/simple;
	bh=IObbqso/ggAM0/BfNLc2KS7dYlYEizMMqnwAHLCTAUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7ASUm9c2pcPnUqayRN4Q/zb5osfEsVHfWXQBm6BEgq6TvjuqsKqo8dBokvfwTdBzCWBIB4zqe5cZqzF6iVgJzuU+V9gXXyxw+lnIwrdfety65FziMSdWQynILVRHSPrXUr0qQFbRLmfOVEk3RW6yMHMPGkOBtQa3W7cyHpoqo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWvoPtj7; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWvoPtj7"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-854f9c32c76so36569187b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787930764; x=1788535564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+OUbvtTk/YPKZ/nv6Q0Bv+DN8uRDS/4dfK2eB2Tizg=;
        b=LWvoPtj7nM3Ym/8yHKQWCWNw9Gzk3bGKTcGfgxMHtnA3M4CFWE1Kym3uVmt6QluHPu
         WGvloBVSUJPG6g4MvEYFzTidJfZ0I/RY2e5bubO+s8S5czVMQ6Ytvi0uJMQQITK0oxZJ
         vHnTgcvlaMP/s9itd5fmFVHga/c4FwkKORrMu5Wz0Gmvlej1ph/ausFRLC43N89QqPUb
         1AvQRdy0Gnx9IpA2UvGNvagrIOea/dfhluB6ZmfzvLGiZcGBU7mTu2YtCYnDpFiPAZlh
         feWrOk1AqiRxbb1AqYLaHP/z2DhB7mk36RPU+ZhwZ6rIv+Lqh3ZzCPrcW+ecMGvz8g19
         1pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930764; x=1788535564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+OUbvtTk/YPKZ/nv6Q0Bv+DN8uRDS/4dfK2eB2Tizg=;
        b=ql1b9ctFjiH1Rxn95I7RFenAPyO3O7VGEhT/gW5ni/wq1n67EPtOi6gnM2qzvKBFn7
         MWsdf6f12zqLOQSs9pvZnKPs4lG9dVaMXcUcKUZsM9nmqW5U6ick/ZwWGjSuV5rP436r
         727gms8h2wJCF0F+XhhUbuS9TFJUxUVVKDdyfO2WoHxmcxfzILdptCDnC/ZlMYzykemt
         5gJai8naXThThB8uWNfiF8P9UN6l3mpixbfgAtjt3jMPrYqtPPqY94DVhD6iOy+KOZs+
         ZxQJYaiMe3mYCdOla3b4SkGQLtchUWTW+q9LzdeVZbcP6r7az8JQGUcaolSMgbLg93Wv
         zARg==
X-Forwarded-Encrypted: i=1; AKwUvByelIK+YteC6zrvvmFMDcojDiW8GK0TTTIS8EMfuG3xNVvw63pFhmDd7cSiBEpspWzk7dOAImttz4vSzkc=@vger.kernel.org
X-Gm-Message-State: AFuF++mYdBInY+iheBRjAcl5KqY2blQU0Zlcubtm6BOfUbqy45iE7N+P
	zwa6yf0z0axNML6po4mt010u6JdQSD+nb7LKCqgsuo3vuAVd0P3ppx0xj4UrMAuV
X-Gm-Gg: AYBFou2FGZ/2zlwvvnVlM+UbKniW5SmVEIZz4l+ONehwf+qRLqLzity2q4c6lRFij96
	nqV5Z7e0fdWkKAi+DMVRmUsG8sgah2VgzUhyPH1ohH9rUBNG2MDZ0ZRRToIqoENdq9cIRfaSR67
	u3/NcC1m8eT56g/H23Lr/RRzltawrIX0L9DrlFb0OPBgn6h4lp9VkHwzatON+SbvXWy/l36bFPm
	XMqYVTLb8PHy3WV3MA4ua+KKaoaZs1/DDksFBAazWxop86J+GLg72PY5XwoECAJ/RWBYETwEpJ7
	YiM2+6owq6ltF/AHKkVPNcSF55ZM5p8OdNmG0U+LUCKnWMPdA1yYCveopyS0Iz+CBnHWDUZl5HW
	FqBJcqqxjbzCZXxSbS3l2MOHemGDMq6dyddsJ606lKXOpLPNXyunWOmaO3hza5A1KRCL1uATWMH
	PSgWUgJDE3d5Tv2RYPdhDtopkdAFP2gqx1GO9C1FyAgKNoI6kK0zYHM1JWau0PCXAGdY50AFHB0
	gWqHOjNTMpZfiwyXgUN7EySBTujKJEkLLLXr+LUR/o=
X-Received: by 2002:a05:690c:6c8d:b0:81e:c500:c6d0 with SMTP id 00721157ae682-85a91bfc8f8mr71813957b3.0.1787930763157;
        Fri, 28 Aug 2026 08:26:03 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e6756e0f3sm8064327b3.43.2026.08.28.08.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:26:02 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH 2/3] media: uvcvideo: generalise the XU flags fixup to all controls
Date: Fri, 28 Aug 2026 11:25:56 -0400
Message-ID: <20260828152557.653475-3-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828152557.653475-1-jordan.mymail@gmail.com>
References: <20260828152557.653475-1-jordan.mymail@gmail.com>
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

Rename it to uvc_ctrl_fixup_flags() and call it from
uvc_ctrl_get_flags(), where the flags are derived from GET_INFO for every
control, standard and XU alike. Call it whether or not the GET_INFO
request succeeded, so the table has the last word in both cases. The
call in uvc_ctrl_fill_xu_info() is dropped, as it now runs from
uvc_ctrl_get_flags() which that function calls.

No functional change for the devices already in the table: their
entries are XU controls, and were matched by entity and selector before
as they are now.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 87 +++++++++++++++++---------------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aceb26310..b16a5cc0d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2852,6 +2852,46 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
  * Dynamic controls
  */
 
+static void uvc_ctrl_fixup_flags(struct uvc_device *dev,
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
+			return;
+		}
+	}
+}
+
 /*
  * Retrieve flags for a given control
  */
@@ -2889,49 +2929,16 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 				UVC_CTRL_FLAG_ASYNCHRONOUS : 0);
 	}
 
+	/*
+	 * Some devices report bogus capabilities through GET_INFO. Let the
+	 * fixup table have the last word, whether or not GET_INFO succeeded.
+	 */
+	uvc_ctrl_fixup_flags(dev, ctrl, info);
+
 	kfree(data);
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
@@ -2972,8 +2979,6 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
 		goto done;
 	}
 
-	uvc_ctrl_fixup_xu_info(dev, ctrl, info);
-
 	uvc_dbg(dev, CONTROL,
 		"XU control %pUl/%u queried: len %u, flags { get %u set %u auto %u }\n",
 		info->entity, info->selector, info->size,
-- 
2.43.0

