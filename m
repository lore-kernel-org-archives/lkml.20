Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99832485511
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132964; cv=none; b=cEATJh0OWtkXVRlzPjDheYTNL5P4/IQLlku77xefRbTbSbI3dgSn42SIe4SwvSJhhshfzUG6B5B1q/t5Q8dW3LltUyxbdvEmVjeMk73OQkEI+5jMxcjXmvvYp51Gzry9/xhf7EOkIiSs8KfouQDzM5HBTp4nY49rcFT0KI/YGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132964; c=relaxed/simple;
	bh=CZ490TnQ+QDRO3YbnkfW5wNQ9T5PhgFDg8/101hqOcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cD57uVnEgsO8Qqt8kvHwyUvItCpp6eViMkCU4X42Ej9chbUfOgefhvN4hqawhWlPNwFTlpJhib3tqag7Rkq+UzrZF7Kevd2MXUuHf+NqW3UOgImNAH2/TNz7hxdWXZrKDX93YteSyUpEzJh8EllXIXB3BAA2wIxlnKnQme6sHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eH/aG7FM; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eH/aG7FM"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af39dso8864021fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789132959; x=1789737759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5p2P+h3m4/e/nj8H9is13HHWai02bAXGCTLAfQ+oro0=;
        b=eH/aG7FM9eLziVMDXglDlPUACeGZlb4g5tn4LdnbzdR/9mkzyqG8y9fQLwStzDQdSn
         T9UH1GdfIyRRdayYUxrGoLQm/dqyAO+yRQ7ueNROiK1+UbSl0IKiOpANvaWygY3a/VLG
         IvofhyvBQ1Fu1j1hTJjp5EMljQtXiC3+3mo5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132959; x=1789737759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5p2P+h3m4/e/nj8H9is13HHWai02bAXGCTLAfQ+oro0=;
        b=ZMXES76t8bdY2GdhRfA9mSIv0pTZWO6RkcDlXsE3j51qX5WY0oL6/HL4mDkq4szqtf
         Vwru/O8RFlIRCC4oj2AifpzgEoAQNT2FNyGtBqb9ZTKkRkQRzl5fluXnht+am82fKGhT
         FPdsquf6zMrWyxiD+t8lQIs5MV5FNZtZ4zBoK/0EgHcRm+bZ94kgaXFMIOU3gCcALNIC
         b4aNaUoIQAmy1lC4nuXIseHQU4dXRENMe1gjIZOk7tgKSlPsJiHmhayRNMfO1ioFNqMi
         24TqsMh1suzx9hohMf59i4XxJ6EfJdb9mUCFap7WnqKGfqCiMnjdOGQZHYn8TyjW93pX
         zVGQ==
X-Forwarded-Encrypted: i=1; AKwUvByY0Kr5YQu5c0TBzJQUwTX3i8x+fD+UZGzEinbYsbzvKXVygaWV6VBokOXEYlzUj8h8VXdmiUIKWGfuwXY=@vger.kernel.org
X-Gm-Message-State: AFuF++kLiV/vUhp2kwdadVJD/RSNxKnMRl+TcmM/qG2zWcLLrIXlFtAO
	WYbdh+w+nludvpUTxgjx6cMYTWgnSXE5xfUkYe8Oh5n4mb953MOO7MlEuC7Jom8CAQ==
X-Gm-Gg: AYBFou32L3qxNqabA1eBUp1Ywwcc2dKnEZcUh62DfGuJLc7swwFOAZQh5s+uy2ikSQt
	nzbZhjJG5eGu6006YiZtQK2d9IE2BMroMHkaakSUjeM5nXZode4RcqGAHr2WTkaFgOTNKUA7Dva
	9pU9DvJ9SmZ0LgelNxlHzCvfRr6VFEQWiNKBYVTwPravFfEtADLy9RMJ4vXrNs4fcMz2dUF6x+h
	mZvh/KcwzcKokW1Fm87RGJwWFgzFchRA1/6CAEbM+RqQDGSyS/2RHmEBevSc5KMsW57W0UnjA7g
	jDLL5h7kkfio6EfGCEsIj61yjo2hvI29nH3sNlZ7a/28/5rb5TfUQhTYMbQ5J9eB324YsfZbEra
	2PRWyigEQWPbCkxTBD84OPWOK1Nt4nPTpcUb4ZWcA5t2eqvnz5wL1/1WfV0cvGRDHTGJF9Uxem0
	wZ6AwsFvxuvCjWQfLXATkQwuqhe4amuTermUa8GMfJJAH+VvE6T9EKCTuNflM5y+3KshpRk1GGQ
	age90yZoa8XfsykipgryMLXuYXXmmXIcigGjDWdqzD3O9IZQA==
X-Received: by 2002:a05:651c:1102:b0:39b:3e32:4a58 with SMTP id 38308e7fff4ca-3a5a5271285mr9449581fa.10.1789132958926;
        Fri, 11 Sep 2026 06:22:38 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm6677511fa.6.2026.09.11.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:22:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 13:22:27 +0000
Subject: [PATCH v3 3/5] media: uvcvideo: Automatically handle cameras with
 invalid uvc_version
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-version-v3-3-604328d8a0dd@chromium.org>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
In-Reply-To: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
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
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++----
 drivers/media/usb/uvc/uvc_video.c  | 40 +++++++++++++++++++++++++-------------
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 3 files changed, 35 insertions(+), 18 deletions(-)

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
index 2a3b7431cc68..2f3daa920ffa 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -273,6 +273,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	}
 }
 
+#define UVC_VIDEO_CTRL_MIN_SIZE 26
+
 static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 {
 	/*
@@ -280,7 +282,7 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 	 * on the protocol version.
 	 */
 	if (stream->dev->uvc_version < 0x0110)
-		return 26;
+		return UVC_VIDEO_CTRL_MIN_SIZE;
 	else if (stream->dev->uvc_version < 0x0150)
 		return 34;
 	else
@@ -290,7 +292,6 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe, u8 query)
 {
-	u16 size = uvc_video_ctrl_size(stream);
 	u8 *data;
 	int ret;
 
@@ -298,13 +299,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 			query == UVC_GET_DEF)
 		return -EIO;
 
-	data = kmalloc(size, GFP_KERNEL);
+	data = kmalloc(stream->ctrl_size, GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
 
 	ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
 		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
-		size, uvc_timeout_param);
+		stream->ctrl_size, uvc_timeout_param);
 
 	if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
 		/*
@@ -319,7 +320,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
 		ret = 0;
 		goto out;
-	} else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
+	} else if (query == UVC_GET_DEF && probe == 1 &&
+		   ret < UVC_VIDEO_CTRL_MIN_SIZE) {
 		/*
 		 * Many cameras don't support the GET_DEF request on their
 		 * video probe control. Warn once and return, the caller will
@@ -330,15 +332,24 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 			"Enabling workaround.\n");
 		ret = -EIO;
 		goto out;
-	} else if (ret != size) {
+	} else if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
 		dev_err(&stream->intf->dev,
 			"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
 			uvc_query_name(query), probe ? "probe" : "commit",
-			ret, size);
+			ret, stream->ctrl_size);
 		ret = (ret == -EPROTO) ? -EPROTO : -EIO;
 		goto out;
 	}
 
+	if (ret != stream->ctrl_size) {
+		uvc_warn_once(stream->dev, UVC_WARN_CTRL_SIZE,
+			      "UVC non compliance: Query (%s) UVC %s control had a size of %d instead of %u.\n",
+			      uvc_query_name(query),
+			      probe ? "probe" : "commit", ret,
+			      stream->ctrl_size);
+		stream->ctrl_size = ret;
+	}
+
 	ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
 	ctrl->bFormatIndex = data[2];
 	ctrl->bFrameIndex = data[3];
@@ -351,7 +362,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
 	ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
 
-	if (size >= 34) {
+	if (ret >= 34) {
 		ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
 		ctrl->bmFramingInfo = data[30];
 		ctrl->bPreferedVersion = data[31];
@@ -381,11 +392,10 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe)
 {
-	u16 size = uvc_video_ctrl_size(stream);
 	u8 *data;
 	int ret;
 
-	data = kzalloc(size, GFP_KERNEL);
+	data = kzalloc(stream->ctrl_size, GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
 
@@ -401,7 +411,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
 	put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
 
-	if (size >= 34) {
+	if (stream->ctrl_size >= 34) {
 		put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
 		data[30] = ctrl->bmFramingInfo;
 		data[31] = ctrl->bPreferedVersion;
@@ -411,11 +421,11 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 
 	ret = __uvc_query_ctrl(stream->dev, UVC_SET_CUR, 0, stream->intfnum,
 		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
-		size, uvc_timeout_param);
-	if (ret != size) {
+		stream->ctrl_size, uvc_timeout_param);
+	if (ret != stream->ctrl_size) {
 		dev_err(&stream->intf->dev,
 			"Failed to set UVC %s control : %d (exp. %u).\n",
-			probe ? "probe" : "commit", ret, size);
+			probe ? "probe" : "commit", ret, stream->ctrl_size);
 		ret = -EIO;
 	}
 
@@ -2231,6 +2241,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 
 	atomic_set(&stream->active, 0);
 
+	stream->ctrl_size = uvc_video_ctrl_size(stream);
+
 	/*
 	 * Alternate setting 0 should be the default, yet the XBox Live Vision
 	 * Cam (and possibly other devices) crash or otherwise misbehave if
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index abcafd929c9e..8d99e857a69f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -461,6 +461,7 @@ struct uvc_streaming {
 	struct usb_interface *intf;
 	int intfnum;
 	u32 maxpsize;
+	unsigned int ctrl_size;
 
 	struct uvc_streaming_header header;
 	enum v4l2_buf_type type;
@@ -662,6 +663,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
 #define UVC_WARN_QUERY_CTRL	3
+#define UVC_WARN_CTRL_SIZE	4
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;

-- 
2.55.0.1007.g17ff1f9808-goog

