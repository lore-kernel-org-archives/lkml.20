Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05E3CF976
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120232; cv=none; b=gbNxSf8gMSjb/q1O2vRDjFZMZYWlVJa74U3/BRY/4+YpPlfmxvJE2iPbK7AZkSASFN1OAi1QzTI8FoV62wplHx6Q9mIk4Y8PssmX+Ya+lW0V3I/OJaPJ2a6yLC0JC+45Ac7H8uPXoEsacE2udVJ3rkWh9jMbnM3GIVSfSUi3r10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120232; c=relaxed/simple;
	bh=9tXk3ZPAewPfyFZKQu+IkCIE9LAc0tIpxqr26LRPIgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNmwPn/1F9w1lb2UHhSJ4IogdplX3XZNgqYjd50+Xdd136pM9LfCm1tRaK7k95qHrjlRP/fUDQ3jWPFGH+knflB+9jTd2pq+162L0l+AGoyfQaanC6BpGRW3S1OLzn/WgQEat+Z4Gxah90Rx642+NDe0dmT4QZe0mKBcJg68gaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I/DiebuS; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I/DiebuS"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff17443eso4497131fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789120228; x=1789725028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gn6qkEjLLi70HzK/Q8W+KKNiCy2U+M4TIvbFvnVLaM=;
        b=I/DiebuST/+VLQGv03jSfZ3tJvqmJR611mcSfLbDoQmwJjeuYIddVI6pwVT9C3fugt
         L+bBBjHqGLvz1SbEXSL/mkfX/Jd7QNUX3/HKo8fS7QSF2B0UKZePqvAx8Q9j5FlgCtld
         UsBqhAtkyo9y90c7zDWxYIJKiUhOzeSoVjHcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120228; x=1789725028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gn6qkEjLLi70HzK/Q8W+KKNiCy2U+M4TIvbFvnVLaM=;
        b=bI9PwGEo5+fggzY2LyrP1N0Le2nLP2GfT9BWawtiT0VMbXjnUpcaBSZrBIKlfc2v82
         bLxh/FxRqzFHDZgmCelGvGoBG322PoZNBtmtG0POVMo+nLxoRSuACtwkciShS13rFC58
         vHPvLpZifntcYszRK3/DPu0lSN2z6mvzinJB1702gVHtpn2u5v2+ysJAI4XR4+hHP4y4
         ExSodiRVu0myQdjgcV1fh3m91nVfLk77Stm8F2scKGzXGjmjKwhcyy5TpQGOo9Uua57b
         QZpqzKuYbxUChmdN2ZPhgkOcOWnB7i9iIlTxCA7cvUQ2NVnSf00XedIHIehRqc4JwvJa
         wz7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw87L+AqYOe+seXbcGeCYGXwjj+vz6kWfnUxD/FYoiO9Wd7JxJW3FklwW9Fu8lzuX7PkF2DY8vV8/HaU4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lkPSoJKY8UtW3WBtqSiThTbYg2qNkU4Ui29576Y0EA5zTDcKiH
	Qv78IlHonYvFYAXeSTsnGj+efVQ927BWouR3KBE02GkBg1kCX+2JjPFQqBo+elDxewgRQwPSAtn
	yNjp2Wg==
X-Gm-Gg: AYBFou1O9hxvnaa1C+sVuvHZzpjkeBxhZv4mHZ1WLrqYJzIog1GHqgYZZeSxfbFtzII
	4hm15uelnrSbxRE8Yopsl63jqwicsIiEeacFPA7RfvvnvSiRkQXpNaW6FOiw820cREucDlFBxGA
	kTCbJBFu8PHsWkovcnKJLBmRQikCin3OAqS35eNMJBp39GInmwIIxi6K+VI6K3C40LQAF7dGXR7
	0BNQiBw8sxhTQJ1Z7FDhInhi1rsGtLivDrfS3sv++CQm70cfGjosU6IYIG0IefQdbUOiQXSLSFZ
	tUbxnV6fiCDhmlFrC25dzMbpqqlZd3zN8gnqlAhZAKsBF1O8hQN7bI6XurxwkzQgeb7jpUIM1Ie
	U9Et4PrCn1FdEqXOTKMwK4i/Ei4AGe+X2kFgqRfuqcAb0OvcUAc/Fh7Z9+tqnXzyv78bwdmDSYa
	Wn8tj+NwdewpWFKCHJ2OsBYX+DPIWjUONNvKjK1DuYusxsAPkyd7v19RDM+hWRYPL/KtptC3YtO
	XxESQcy6IiHCgbeTRRwOi2GRKnYk9doABRVMh9nVVDiJ18aGVM=
X-Received: by 2002:a05:651c:cc:b0:3a3:3fa5:babf with SMTP id 38308e7fff4ca-3a5a5044a7cmr5260761fa.6.1789120228371;
        Fri, 11 Sep 2026 02:50:28 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263ebsm5138231fa.17.2026.09.11.02.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:50:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 09:50:23 +0000
Subject: [PATCH v2 2/2] media: uvcvideo: Automatically handle cameras with
 invalid uvc_version
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-version-v2-2-395f27b0444c@chromium.org>
References: <20260911-uvc-version-v2-0-395f27b0444c@chromium.org>
In-Reply-To: <20260911-uvc-version-v2-0-395f27b0444c@chromium.org>
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
 drivers/media/usb/uvc/uvc_driver.c | 11 ++++++----
 drivers/media/usb/uvc/uvc_video.c  | 44 ++++++++++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index c8646032a65c..eede4b99b156 100644
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
index fc3536a4399f..f1d32776c594 100644
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
@@ -290,21 +292,23 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
 static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe, u8 query)
 {
-	u16 size = uvc_video_ctrl_size(stream);
 	u8 *data;
 	int ret;
 
+	if (!stream->ctrl_size)
+		stream->ctrl_size = uvc_video_ctrl_size(stream);
+
 	if ((stream->dev->quirks & UVC_QUIRK_PROBE_DEF) &&
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
+			ret, stream->ctrl_size);
 		ret = (ret == -EPROTO) ? -EPROTO : -EIO;
 		goto out;
 	}
 
+	if (ret != stream->ctrl_size) {
+		dev_warn_once(&stream->intf->dev,
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
@@ -351,7 +365,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
 	ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
 
-	if (size >= 34) {
+	if (ret >= 34) {
 		ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
 		ctrl->bmFramingInfo = data[30];
 		ctrl->bPreferedVersion = data[31];
@@ -381,11 +395,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe)
 {
-	u16 size = uvc_video_ctrl_size(stream);
 	u8 *data;
 	int ret;
 
-	data = kzalloc(size, GFP_KERNEL);
+	if (!stream->ctrl_size)
+		stream->ctrl_size = uvc_video_ctrl_size(stream);
+
+	data = kzalloc(stream->ctrl_size, GFP_KERNEL);
 	if (data == NULL)
 		return -ENOMEM;
 
@@ -401,7 +417,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
 	put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
 
-	if (size >= 34) {
+	if (stream->ctrl_size >= 34) {
 		put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
 		data[30] = ctrl->bmFramingInfo;
 		data[31] = ctrl->bPreferedVersion;
@@ -411,11 +427,11 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 
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
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4a222f..1866b26a699b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -461,6 +461,7 @@ struct uvc_streaming {
 	struct usb_interface *intf;
 	int intfnum;
 	u32 maxpsize;
+	unsigned int ctrl_size;
 
 	struct uvc_streaming_header header;
 	enum v4l2_buf_type type;

-- 
2.55.0.1007.g17ff1f9808-goog

