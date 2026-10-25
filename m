Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=176.9.219.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938988;
	b=YeK0AKlRfoy6PaiHKAnWq1oES076iS7qtMVvIxUdK9AhzkYKNDkhtEXMWhvfxvJTZsVJ
	 b4r7pleI6NWgq1GfOFjEFfZWwj/5RI6Xl1WRYaA/9fbp8jMuoqVPKKgwYGzfQv01bgwOC
	 nFipKXJ7dt2ymZqhgEKQAgxyhDr+PcKq84DV8nIkYYZ/rV3mWPjxZfQysUpJKwIIm5PIM
	 KjqN1C6D2ijtt50zvvQdkCHGUqFwH9Pw/WU093CkZ1SKApflZbyJF952+kOrKug+l/sY1
	 K072+UexlhtUdGdC99YmhVs2gk9L27qfIB3CaxIhARjcN9V3S3UU3QXhF54MJfyWYJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938988;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ml7KDYqtwo3kkAXwh7Yb37PT+M7VJ6pBs9QJcFJB/w4=;
	b=CmY/b46oDAS5AZoKtsgUc+6znIwNbIH/4fBUGvgLfZIBA7X3VqEzRmt5ud3hXo1dcXl/
	 UwW/GXPXhAxMYTWivD30l0HjogVyWHP21yMb7E7QJQASZYAwV6XD6RwVPXUYMasOdAfi4
	 zIYmfICICs8bu8+UQSeCBU084KE8HXBxQoyehqriZaYrWO0TPd0nV/QghkfI4G2KRlnz+
	 GGTK4Zi50NR/3mBkyMQES228SENMo/JDjj/MjOanYDH2abNghb9El8VKHdmF7M9Z+SOXC
	 UX0WKpvH/gHUZKTqiuHqF6Q/U/eHmeEMG5FwIUi/7jQcfEQu/xOcSBnC/noVPZJGQHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=manuel-herrmann.de;
	spf=pass smtp.mailfrom=manuel-herrmann.de;
	dkim=pass header.d=manuel-herrmann.de header.i=@manuel-herrmann.de header.a=rsa-sha256 header.s=s20260706 header.b="HyYn3r/2";
	arc=none smtp.remote-ip=176.9.219.86
Received: from mail.0x17.de (mail.0x17.de [176.9.219.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD2A606A31B;
	Sun, 25 Oct 2026 14:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD2A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manuel-herrmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manuel-herrmann.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=manuel-herrmann.de header.i=@manuel-herrmann.de header.a=rsa-sha256 header.s=s20260706 header.b=HyYn3r/2
Received: from itw.netbird.selfhosted (i5C74DFF6.versanet.de [92.116.223.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mh)
	by mail.0x17.de (Postfix) with ESMTPSA id 555158001B;
	Sun, 25 Oct 2026 14:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manuel-herrmann.de;
	s=s20260706; t=1792938977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ml7KDYqtwo3kkAXwh7Yb37PT+M7VJ6pBs9QJcFJB/w4=;
	b=HyYn3r/2W0X9bU9qt2mgMIloK8YCHiwyVYAAKFi0BvLxStulfxjUoLDgeVThfPZazVInsw
	X+PnzpMamoeVit2iGBmBeWgRMUJ5F5FVfnoLey0PRBB22+AhI1WErbacRzmXbYCZ1z1Jzb
	a9CQbQlmwowCXdbZpqN74ssuqe/k1khj/XxoMoRb/WJ5GaaKRGiu7EjFkw++iZztzbojbF
	mkMMHu7/TfKKfkFmV+yy1cww12eYXOiRIjIRJixKbKmYb+k37c7mfUKUPpdK6jlERSfjfu
	PXu8+Z2JLVoZ2a1C4EYNHBRl5xGmzAce8RAvWATgyGLAQqi8wI/ao9bQMURcGg==
From: Manuel Herrmann <m@manuel-herrmann.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manuel Herrmann <m@manuel-herrmann.de>
Subject: [PATCH] media: uvcvideo: Add support for NV21 pixel format
Date: Sun, 25 Oct 2026 15:35:22 +0100
Message-ID: <20261025143522.327365-1-m@manuel-herrmann.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the NV21 (Y/VU 4:2:0) pixel format to the uvcvideo
driver. This format is exposed by the color camera of the Creality Pika
3D scanner (2bc5:0c0b), next to YUYV and MJPEG. Without it, the driver
skips the format as unknown.

NV21 only differs from NV12 in the order of the chroma samples, so
bytesperline is wWidth, as for NV12.

Signed-off-by: Manuel Herrmann <m@manuel-herrmann.de>
---
Tested on media next (d7e7bca71698) in a QEMU guest with the scanner passed
through. Before the patch, the driver logs

  uvcvideo 2-1:1.3: Unknown video format 3132564e-0000-0010-8000-00aa00389b71

and the color node only offers YUYV and MJPG. With the patch, NV21 is
listed, G_FMT reports a bytesperline of 1280 for 1280x960, and v4l2-ctl
streams it at 30 fps. A frame captured in the guest has the right
colors decoded as NV21, and red and blue swapped decoded as NV12.

 drivers/media/common/uvc.c       | 4 ++++
 drivers/media/usb/uvc/uvc_v4l2.c | 1 +
 include/linux/usb/uvc.h          | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index 0107cedd0..7d918ba0e 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -24,6 +24,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_NV12,
 		.fcc		= V4L2_PIX_FMT_NV12,
 	},
+	{
+		.guid		= UVC_GUID_FORMAT_NV21,
+		.fcc		= V4L2_PIX_FMT_NV21,
+	},
 	{
 		.guid		= UVC_GUID_FORMAT_MJPEG,
 		.fcc		= V4L2_PIX_FMT_MJPEG,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 644c2f1cd..60732f5ac 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -232,6 +232,7 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
 {
 	switch (format->fcc) {
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_YVU420:
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_M420:
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 99b070ab8..48419a862 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -85,6 +85,9 @@
 #define UVC_GUID_FORMAT_NV12 \
 	{ 'N',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_NV21 \
+	{ 'N',  'V',  '2',  '1', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 #define UVC_GUID_FORMAT_YV12 \
 	{ 'Y',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.55.0

