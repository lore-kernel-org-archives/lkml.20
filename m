Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7823ACA4B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815816; cv=none; b=gCPRxetAE5q9aLb/zNd6POM8f9QUJcdxRGUezNHH0ERY0FTt7C1YlwFYaBIvinNJAFflujq/xGhDAqN/x34YmEIDVgJKHhK64P1E2/wWvHT17klp8j8cz+QJERoWMyefczw6dwaZ/phHNa7Am1sR3H+7XbyTqFOgsVTFEJp0owY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815816; c=relaxed/simple;
	bh=v8UxETDcOYCAUtgy/1OmH2aAtNRYgM8jA3Jh1iTeyZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sAoRS2zQfpadedFOort7uMwgDt+FPR6DoZGTASa/Yoc4HrgrlFGuw64q4agFvtXrnyMrITU5t3TQAidaS7GzDDGyjy7x2Po9t4GSSYzXqn1m2LWbCaBeDK9skuruXaoleTCg64j795H82fzZHqvXJvvFWB3RjB+lRjHDEmkAap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ODs8rmlv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ODs8rmlv"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b60bcf9051so3452851e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788815813; x=1789420613; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHwke8rit8qBzK3OuQrOMc3AAUNWE9JY8EpurCwEM9M=;
        b=ODs8rmlvUCMMZJo80esQSFE2jL6TbYIh1LKY9PziD5G5aPh/9K6CmYsdsiBKkrWPh/
         Vm8vi5mx8G6HI4HXtQfVNRdfY1v/ZRhu0X+XhBPAFP/DpPVqrrzXIND1hdIas9S7VYvP
         J3YAwScNpWBsw1SlpiwrjgqaskRr5PesEBfGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788815813; x=1789420613;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pHwke8rit8qBzK3OuQrOMc3AAUNWE9JY8EpurCwEM9M=;
        b=YERSeO/eT67md/0rRgJebD413KCSihpgH/wxayW/3GowSdnWregzsI4WtGuymmC6Li
         EjKrq7yvEiXkQprM59SVBjfEqzdlwMS0ow2AEgiiDjuQe3nWP389riVVjn7dmGu//MB1
         Y0iqEzIkX7YSo49K7vAau4y86gTNY1rZ4DvqAseTUVphFL4DcxiYHjAZAfirougPT26u
         LrTJ4o9pGxchhgncRDWxVu5pLXm8aE4h6Z3PZRQVMkrYKiArMOK0Zxul6eSqHsjj5ymV
         fIZT4IM6D7VSm8B04fg8RCk9BU/5+Vm2wkye5VlBzMQ/XdQ0xWprZ6HaRDyWSW7l6CBN
         /szA==
X-Forwarded-Encrypted: i=1; AKwUvBx464YbTh0pFqvXMtjWDUa4Wf5lof/mU9JlSIPgWT11l+8j3oRq3IBvnwIyqzKbfEkRPeJFpZbFVg66Y4I=@vger.kernel.org
X-Gm-Message-State: AFuF++mSMPVbyM/KjumNkMu2f+g4I4zFbPnExujc9OgSGNd3HwwxQk7X
	S0WvhYQIFkjPz8aAtrGkigUa5o33uMzUCo/q2G9zOvIDcLwV2nOkQvQ76Ej9OnLBAg==
X-Gm-Gg: AYBFou1s//b/zrrN4Ntocd1Vrhu0eW2mmoQxVnMC+nVwswFx+BleJEMsH2PkXn/55x/
	r0wjTmTt+7lDcp74dQYDPOQfZxIIYKbP52RCyZXxGT9YwgfrmH1j69xieYxcdYj7RienogtELOz
	5PMaLQQ6OQQktwG3ezPFp9i0wcQfxx+iIKFeI+aAEfzNiujnpIu00/ZuEfRFqT/jZ3QKabnYsUN
	4FwEe3XvvMoAEY2KKUrLJdM7Rp4HMQMLrPwNMTIw4RrCF0HDTDvN3zRU4ECXQIZRlJbLuyNaYrE
	0IlNp7ueSCVLfNF4A0L4urhO3A0pH0RQ+y+HG/M01czaFvi4r5BIK2eGJBv24zBvthWU6BXArFy
	xBXBly2M64OfOxWPZ28/2UQUpgoi5XB5D5XApIIuPjEfdzXsu2R8cL8fGcLlEAb3zdNJZKSnIyu
	68FDncj7PBAgHvVzbg5i5IyPgJbxNUJbpyXD7eJ5Wluqmeac9THf/q820sdMw5MTm8ZADdCfI4T
	+4Pl3W3tw3RnKybwlNjh3DebtxCl57ukyG0zkg=
X-Received: by 2002:a05:6512:3a8d:b0:5b6:7fa:e96b with SMTP id 2adb3069b0e04-5b616f075bdmr8335146e87.14.1788815812861;
        Mon, 07 Sep 2026 14:16:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fbfacsm2548785e87.42.2026.09.07.14.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:16:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 07 Sep 2026 21:16:49 +0000
Subject: [PATCH] media: uvcvideo: Automatically handle cameras with invalid
 uvc_version
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-uvc-version-v1-1-34e45dfe04de@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMApn2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNz3dKyZN2y1CKQOt3E1JTUtGQTYwuT5FQloI6CotS0zAqwadGxtbU
 A5SvzE10AAAA=
X-Change-ID: 20260907-uvc-version-aedefc4384ce
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hi Edwin, could you please try if this patch alone (without the previous
one) works for you?

Could you share the dmesg output with it?

Thanks!
---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++----
 drivers/media/usb/uvc/uvc_video.c  | 23 ++++++++++++++++++-----
 2 files changed, 25 insertions(+), 9 deletions(-)

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
index fc3536a4399f..58e1c1fa6af2 100644
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
@@ -319,7 +321,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
 		ret = 0;
 		goto out;
-	} else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
+	} else if (query == UVC_GET_DEF && probe == 1 &&
+		   ret < UVC_VIDEO_CTRL_MIN_SIZE) {
 		/*
 		 * Many cameras don't support the GET_DEF request on their
 		 * video probe control. Warn once and return, the caller will
@@ -330,7 +333,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 			"Enabling workaround.\n");
 		ret = -EIO;
 		goto out;
-	} else if (ret != size) {
+	} else if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
 		dev_err(&stream->intf->dev,
 			"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
 			uvc_query_name(query), probe ? "probe" : "commit",
@@ -339,6 +342,12 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		goto out;
 	}
 
+	if (ret != size)
+		dev_warn_once(&stream->intf->dev,
+			      "UVC non compliance: Query (%s) UVC %s control had a size of %d instead of %u.\n",
+			       uvc_query_name(query),
+			       probe ? "probe" : "commit", ret, size);
+
 	ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
 	ctrl->bFormatIndex = data[2];
 	ctrl->bFrameIndex = data[3];
@@ -351,7 +360,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
 	ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
 
-	if (size >= 34) {
+	if (ret >= 34) {
 		ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
 		ctrl->bmFramingInfo = data[30];
 		ctrl->bPreferedVersion = data[31];
@@ -412,11 +421,15 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	ret = __uvc_query_ctrl(stream->dev, UVC_SET_CUR, 0, stream->intfnum,
 		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
 		size, uvc_timeout_param);
-	if (ret != size) {
+	if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
 		dev_err(&stream->intf->dev,
 			"Failed to set UVC %s control : %d (exp. %u).\n",
 			probe ? "probe" : "commit", ret, size);
 		ret = -EIO;
+	} else if (ret != size) {
+		dev_warn_once(&stream->intf->dev,
+			      "UVC non compliance: Set UVC %s control had a size of %d instead of %u.\n",
+			       probe ? "probe" : "commit", ret, size);
 	}
 
 	kfree(data);

---
base-commit: f9536a8065d9eed0d9114878c56ffc4e5a18bdfc
change-id: 20260907-uvc-version-aedefc4384ce

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

