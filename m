Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CE43D6682
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605951; cv=none; b=RFod8bVU7LFr5wfcIAsanr/iG4rIzHkNdo3RDgseSBaMBWKC2yz0GriojcbhfJmbbjlp90AmHLE186AnLt1tLtdvjf0xe2u1r48Po5dBI7FgLuRrQ/N+KxgndDeC2p5+EtN2Wr1/4Qr1X+Rx6JoWJkauiSelzNj5dUbNjwHhx1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605951; c=relaxed/simple;
	bh=dXkENPo2wVumyHDmzXwLjWgH3JP+mqFSzaQO0/K8fYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4js+f6+OldjuCBPQ9NZhqphMgclanlFVS6x2n3bxEd1IXa3gibGHOZL9LwPyjD+b7uyws3yj1mt22VhL3N5IKlZVtctNyWX5NMLAuKss0DpOETllJibIPU/xB5oXt+grody3GHWqqQ4Rns/jzukTaKJ1Os+VsUZBQM1KVKvm1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KQb7D41i; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KQb7D41i"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e93611e7so3215277e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790605939; x=1791210739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/3sa9/J1OWP4CmhUpz/yxw8bRZqT4L863BARaR7FIk=;
        b=KQb7D41i9lJMOZ4n1zWT6sOnSabR22oQSRSKZb8l91TXkY97F1iQ0a00DPswIN/dMO
         mRHcsWfZyWOFZ78weYY8fCSv+7YLBZ9WNRDkELQxZJOaXmiU/vZvzP9MVzHsSu3ewZgp
         dEH3hDlpY6/ZmfhkHYlrGKmPRAhBCVj6ApvGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605939; x=1791210739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/3sa9/J1OWP4CmhUpz/yxw8bRZqT4L863BARaR7FIk=;
        b=yZDknOFH+62ZQtYLOXPADSAv1GAisibPAD7r4OGmZhrcoPZlJkB1NtNczLjgCU0RaG
         WsGszV+xX4z6vFpjFN8yDLcpPCU15rAUh/NCL/fNSLHI7HCSyEj9T16JL1Wlz8Y5dUVN
         m3qh8hYsGcykgT0xA9PLANJaxrkNIOiS3H8ZQqFWSjXCbw3vx9YhcRsjS1TTWTa7QGyl
         Okxg52abf0UNRgvYG1rhi9rP4M2k/CNpx2O5eZlw92R0kaq+HOAg/giO/h9CaHACY2HX
         7PDo8y3OwAD0mLa2/yiL3lEVlwIV7m48T+x6ssc+DpOLj31ks7C3r8Nx9PA9JtMCIjIW
         ocPw==
X-Forwarded-Encrypted: i=1; AKwUvBxt2Xj3NaDfSK+4x/LQpDJQ782c9/I7FgbWvTtkDHqYTFOphcAwmV9N8Zc5MDz4VCQ6vQndyR36382gSYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1bO/dwq/TYXOWJeqqSIwolJEwvAAWcIZIzrUyQvLlyGGqdRcn
	epWb7FzCoe4yo/TRL6sOR7U1CAKuF7atbmtA8JfnMbYTeHcb6hMSbgPNDsS5Fi6ZKA==
X-Gm-Gg: AYBFou3tng9USOd84tu41wNrgKVGBknqHxb5dRJRUnakwBITILz2cA9YaihrEVoAQ8N
	fYA0dew3I2aFdDIr2XAHb2ex7LLZK/Ifh/Igy3Hne/MNdgOsAy5ERPcuS24Rlou8VbrMNWiMWXP
	o0AMi5kkHWh6VJNI6p4WKU+o1fq5vdypOCjcE1zWoCLgpKaM+5JcpPuMogqeAABoJ7n7cOANOcU
	aDZF7AGHpUarmozIpgWjIfBy2EKBlK/smFCQ1FSC0mlATSvehSJogB5Nn1qyQ/yhAHqyUE45mIj
	xzIvS3FkXLKU22+GjYbrYlhTX1Nj3LFMr6Rao2gLNWoCHjSR5ZDZ6izYywiBPPo6yY+vwnD3HYQ
	+rxaxnB5+tn34QIzoX6IJvN1qZdyaLcpsVBEniem+p6n1GhuepK4olErLQhyPRAwd9gtcNJp1uo
	P9Js+33Agdsd+HNyeoRS6j5pvA54z41AW8PFJMmU0s9Fj4bHgFXV3itXNxHs76RL6SJDtpYY/zH
	ZmUwi018OYvnyYRv8yChnqgSG1zhctW8CA6Xg83KPJIVRGT+Q==
X-Received: by 2002:a05:6512:15a0:b0:5b8:c6f6:ab0b with SMTP id 2adb3069b0e04-5b8e6de10c3mr3442042e87.55.1790605934647;
        Mon, 28 Sep 2026 07:32:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb098dsm603606e87.38.2026.09.28.07.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:32:02 +0000
Subject: [PATCH v4 3/5] media: uvcvideo: Automatically handle cameras with
 invalid uvc_version
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-uvc-version-v4-3-da0e983fcb95@chromium.org>
References: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
In-Reply-To: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Currently, the driver expects that cameras properly implement the spec
version that they announce, and if they fail to do so, we do not continue
probing the driver.

To make drivers more fun, some vendors decided to announce that they are
a UVC version that they are not. Until now, we handled those cameras via
quirks.

Unfortunately, reality has shown us that there are more cameras out
there with an invalid uvc_version than we initially predicted.

This patch tries to handle these cameras with an identity crisis
automatically. We still shame them in dmesg. But now they will work.

Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++---
 drivers/media/usb/uvc/uvc_video.c  | 54 ++++++++++++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 3 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..ca75f8d1ec46 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1169,9 +1169,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 
 	case UVC_VC_PROCESSING_UNIT:
 		n = buflen >= 8 ? buffer[7] : 0;
-		p = dev->uvc_version >= 0x0110 ? 10 : 9;
-
-		if (buflen < p + n) {
+		if (buflen < 9 + n) {
 			uvc_dbg(dev, DESCR,
 				"device %d videocontrol interface %d PROCESSING_UNIT error\n",
 				udev->devnum, alts->desc.bInterfaceNumber);
@@ -1188,7 +1186,12 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		unit->processing.bControlSize = buffer[7];
 		unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
 		memcpy(unit->processing.bmControls, &buffer[8], n);
-		if (dev->uvc_version >= 0x0110)
+
+		/*
+		 * We are not using bmVideoStandards, so there is no need to
+		 * warn the user if it is missing.
+		 */
+		if (dev->uvc_version >= 0x0110 && buflen >= (n + 10))
 			unit->processing.bmVideoStandards = buffer[9+n];
 
 		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2a3b7431cc68..a69608666f66 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -211,11 +211,14 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	if (frame == NULL)
 		return;
 
-	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) ||
-	     (ctrl->dwMaxVideoFrameSize == 0 &&
-	      stream->dev->uvc_version < 0x0110))
-		ctrl->dwMaxVideoFrameSize =
-			frame->dwMaxVideoFrameBufferSize;
+	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
+		ctrl->dwMaxVideoFrameSize = frame->dwMaxVideoFrameBufferSize;
+	} else if (!ctrl->dwMaxVideoFrameSize) {
+		ctrl->dwMaxVideoFrameSize = frame->dwMaxVideoFrameBufferSize;
+		if (stream->dev->uvc_version >= 0x0110)
+			uvc_warn_once(stream->dev, UVC_WARN_VERSION,
+				      "UVC non compliance: Missing dwMaxVideoFrameSize from video_ctrl\n");
+	}
 
 	/*
 	 * The "TOSHIBA Web Camera - 5M" Chicony device (04f2:b50b) seems to
@@ -273,6 +276,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	}
 }
 
+#define UVC_VIDEO_CTRL_MIN_SIZE 26
+
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 {
 	/*
@@ -280,7 +285,7 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 	 * on the protocol version.
 	 */
 	if (stream->dev->uvc_version < 0x0110)
-		return 26;
+		return UVC_VIDEO_CTRL_MIN_SIZE;
 	else if (stream->dev->uvc_version < 0x0150)
 		return 34;
 	else
@@ -290,7 +295,6 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe, u8 query)
 {
-	u16 size = uvc_video_ctrl_size(stream);
 	u8 *data;
 	int ret;
 
@@ -298,13 +302,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 			query == UVC_GET_DEF)
 		return -EIO;
 
-	data = kmalloc(size, GFP_KERNEL);
+	data = kmalloc(stream->video_ctrl_size, GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
 
 	ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
 		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
-		size, uvc_timeout_param);
+		stream->video_ctrl_size, uvc_timeout_param);
 
 	if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
 		/*
@@ -319,7 +323,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
 		ret = 0;
 		goto out;
-	} else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
+	} else if (query == UVC_GET_DEF && probe == 1 &&
+		   ret < UVC_VIDEO_CTRL_MIN_SIZE) {
 		/*
 		 * Many cameras don't support the GET_DEF request on their
 		 * video probe control. Warn once and return, the caller will
@@ -330,15 +335,24 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 			"Enabling workaround.\n");
 		ret = -EIO;
 		goto out;
-	} else if (ret != size) {
+	} else if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
 		dev_err(&stream->intf->dev,
 			"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
 			uvc_query_name(query), probe ? "probe" : "commit",
-			ret, size);
+			ret, stream->video_ctrl_size);
 		ret = (ret == -EPROTO) ? -EPROTO : -EIO;
 		goto out;
 	}
 
+	if (ret != stream->video_ctrl_size) {
+		uvc_warn_once(stream->dev, UVC_WARN_VERSION,
+			      "UVC non compliance: Query (%s) UVC %s control had a size of %d instead of %u.\n",
+			      uvc_query_name(query),
+			      probe ? "probe" : "commit", ret,
+			      stream->video_ctrl_size);
+		stream->video_ctrl_size = ret;
+	}
+
 	ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
 	ctrl->bFormatIndex = data[2];
 	ctrl->bFrameIndex = data[3];
@@ -351,7 +365,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
 	ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
 
-	if (size >= 34) {
+	if (ret >= 34) {
 		ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
 		ctrl->bmFramingInfo = data[30];
 		ctrl->bPreferedVersion = data[31];
@@ -381,11 +395,10 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe)
 {
-	u16 size = uvc_video_ctrl_size(stream);
 	u8 *data;
 	int ret;
 
-	data = kzalloc(size, GFP_KERNEL);
+	data = kzalloc(stream->video_ctrl_size, GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
 
@@ -401,7 +414,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
 	put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
 
-	if (size >= 34) {
+	if (stream->video_ctrl_size >= 34) {
 		put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
 		data[30] = ctrl->bmFramingInfo;
 		data[31] = ctrl->bPreferedVersion;
@@ -411,11 +424,12 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 
 	ret = __uvc_query_ctrl(stream->dev, UVC_SET_CUR, 0, stream->intfnum,
 		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
-		size, uvc_timeout_param);
-	if (ret != size) {
+		stream->video_ctrl_size, uvc_timeout_param);
+	if (ret != stream->video_ctrl_size) {
 		dev_err(&stream->intf->dev,
 			"Failed to set UVC %s control : %d (exp. %u).\n",
-			probe ? "probe" : "commit", ret, size);
+			probe ? "probe" : "commit", ret,
+			stream->video_ctrl_size);
 		ret = -EIO;
 	}
 
@@ -2231,6 +2245,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 
 	atomic_set(&stream->active, 0);
 
+	stream->video_ctrl_size = uvc_video_ctrl_size(stream);
+
 	/*
 	 * Alternate setting 0 should be the default, yet the XBox Live Vision
 	 * Cam (and possibly other devices) crash or otherwise misbehave if
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index abcafd929c9e..b41ce01dc21c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -461,6 +461,7 @@ struct uvc_streaming {
 	struct usb_interface *intf;
 	int intfnum;
 	u32 maxpsize;
+	unsigned int video_ctrl_size;
 
 	struct uvc_streaming_header header;
 	enum v4l2_buf_type type;
@@ -662,6 +663,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
 #define UVC_WARN_QUERY_CTRL	3
+#define UVC_WARN_VERSION	4
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

