Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4D7501F36
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632228; cv=none; b=hz1b+xH8uSGyJ3hzgaRTCh+6T9vRV+tKnp8B/WwmOBx+qhPDsY2Y1Dcldv7AKy+AMCMj483t6dtVUaYT7adiTGYJh1VXDk/j5S4OnevdOTAtUUvgANEVi5d+s7ot6D4DxWQvbf3vRtaBZF6EBcRmzzr/hU1CohP5kwF3KCwiOSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632228; c=relaxed/simple;
	bh=IIBHO+Sw6Iv9Typh78TXUOvYbodkq7YZ6nHtg3eT110=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=laW2hUMxi2msL+o4T+cI7qJNZpwIx5d4pnP7WhY8jSQh7oFpY1ai3Y85n0lhDXnyo3YBNv7i+0/hFjf/19QZKkOnZ4fk7KCt4AyB1HwaNDqsZh7+v6sL9y+L5+HhJ7IK3HimTIcXwaj4LldXLOx9sE4oRE9/ahOCz+P20Me6kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbJkubHp; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbJkubHp"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8aa1a91809aso14845977b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790632226; x=1791237026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOVKY+/2Y+5VXgBa8mexKsBUTTO8lhGPBPoG6WjQr6w=;
        b=LbJkubHp2Yoomfo/nlaF5bBqpUh6ZiXLvVZ6zcqb22Mclf1iBcyMg/l8C6yppVGOMN
         rLP639B0X0Uw4HbASwyETezvfE7MJxdPnQH379uiaEzmO4tCkk5+TiFwMxhVpjwKmw/4
         aUZvAHe6Kh6QDIp/yQeqU8fHQOui6ynugYBhgH4NGejI+bcRf7etAaAz93O4G+6DZxe9
         1EwSYYzh6K/EsYbpTWBIu4+cF66IfUMs13pP5hEGkH9Ceyyk/WFxAKkWTGUcHFnCzd2k
         g8SqFz6stpAvC3UCQ94j5X5wNFjTm7bIj0pUKAWBGnfEhaF+UEIGW82vL/+za+ie/rQv
         b9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632226; x=1791237026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOVKY+/2Y+5VXgBa8mexKsBUTTO8lhGPBPoG6WjQr6w=;
        b=2dzTjJ2gaV5kphvA9Wg2nqjNOEF2duLrI78ErKCFQbaySfzIob+sdPLq0l0cMKnxPY
         wpZZrURiomDsjLVNsr1J/MA3jaA00RBUmR96KA87fgDZLCSUv6D/brQle808BTDelO5p
         JOIQ0YXa6vPLZxHKBn7yW8y9JLrq+mVonem9E05PflgLdj/ES/pbTRSSY8hJum8TxzDL
         NmIQJJVfeVmsJTu09YUwsfNypFcAFuDhEyq+Jrxxj3o0rF8itEtIYpclp25CHL2v5Slw
         RbVFIpdAif8zUIfpFcgRfKoTNYiZWscJIrfMa2dAp25lx9uu46G9rqnPVPhgFl37qy8J
         TcgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx2yB7j2ZhxVXECr6zCghfgk1gvJfOW8j+FHXtl8yNQx6XmvrTEWfjOPJX5EjB4kFwdKARQvhdGGu7oog=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYwOE8W++Gvj2SdXVDoTfi8AkJQigKszod1Jb656IoCSSXEN7p
	UjZzwzImS5B0q4pvUQ2plEYsYJHpc3lDS8XWzickFpWfJTVW9Y8q/7MO
X-Gm-Gg: AYBFou0H2QMbB9vZ50bn+eEQddJBiXjzvN3evGKxlx6XRDmrac9uFaCo6u2hLISde54
	048s/5HETwR33WVCM+Ak/Dic8Hz6hYOPo4u4O3C+SCIuC9ZJFWvfrsskyu8XUlyIElG7Os8d0zg
	9ICeu0mxlD4MP2sFZ0tU64DPHhYnLJ43JI0JTKmnT9uulbwJX5zBjC8MujuJpDDfWA5Xo1cFGe5
	jobfYGTyx7hTUXuMIZmHXJ85zEAdIJP4lAYEQSYUGw9O7yzX4EoP+W+mhkgrqgv9rvl4z3dshcD
	yGrAgbvj357DlyLzJBuc1FjdoTKF+qxzHXhNT4ltqDk1dfkIRvYtxdh3ULCFTPPXZXZEgGL18BQ
	6nyEXyi5e+MQ77BBTHvZfWDTPeGyW9vaNj3lh8sfwRtynT7OYzgul3gAkDJjCHJIgGtQ6uSPGbX
	CPtl54QHEh2g7sVZ0MdogxKLG6iK5qRFJe/wb/q4p6VS2OIIrBYqsEF2+Wthi5uaswuQTZbXio1
	iYvuHCHRjSQK1movYbm9NShQBD90npOc3y9OtleeAGVNkfemd6i9w==
X-Received: by 2002:a05:690c:3489:b0:8a9:3c0c:936a with SMTP id 00721157ae682-8a93c0c94c1mr36945387b3.35.1790632226346;
        Mon, 28 Sep 2026 14:50:26 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a861012f4dsm50897647b3.37.2026.09.28.14.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:50:25 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v4 3/4] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
Date: Mon, 28 Sep 2026 17:50:20 -0400
Message-ID: <20260928215021.819064-4-jordan.mymail@gmail.com>
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

The OBSBOT Tiny 2 does not set AUTOUPDATE in GET_INFO for its pan/tilt
and zoom controls, so reads return the last value written. The camera
moves them on its own when tracking a subject, and sends no control
change events.

Add fixup entries for the three controls.

lsusb -v (device descriptor and Camera Terminal):

  Bus 003 Device 006: ID 3564:fef8 Remo Tech Co., Ltd. OBSBOT Tiny 2
  Device Descriptor:
    bLength                18
    bDescriptorType         1
    bcdUSB               2.10
    bDeviceClass          239 Miscellaneous Device
    bDeviceSubClass         2 [unknown]
    bDeviceProtocol         1 Interface Association
    bMaxPacketSize0        64
    idVendor           0x3564 Remo Tech Co., Ltd.
    idProduct          0xfef8 OBSBOT Tiny 2
    bcdDevice            4.09
    iManufacturer           1 Remo Tech Co., Ltd.
    iProduct                2 OBSBOT Tiny 2
    iSerial                 0
    bNumConfigurations      1
  [...]
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x00023e3e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
          Exposure Time (Relative)
          Focus (Absolute)
          Zoom (Absolute)
          Zoom (Relative)
          PanTilt (Absolute)
          PanTilt (Relative)
          Roll (Absolute)
          Focus, Auto

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Assisted-by: LLM
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 64c90c380d3d..49ea6a6bcf57 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2876,6 +2876,18 @@ static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
 			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
 			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
 			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_PANTILT_ABSOLUTE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_PANTILT_RELATIVE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_AUTO_UPDATE },
+		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
+			UVC_CT_ZOOM_ABSOLUTE_CONTROL,
+			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
+			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
 	};
 
 	unsigned int i;
-- 
2.43.0

