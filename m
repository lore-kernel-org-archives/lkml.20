Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAEF3ACA77
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564790; cv=none; b=KYlgTbUsm4wiht9PJpI+rzSmlG+pVhbpb0wT7DgT5G/BEKiwWNRfx9ktA6WuvQx/0QkL99fsdcUvcxDxwhLFM1tvwtefM/btyy0dW68I7hzGjG6ufY50JBRwIrRs3PZOLXmlqwH+Lp3qTdgue75qnOesmROA8UHyulj+zOf7EOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564790; c=relaxed/simple;
	bh=QBL0TY8X6rW1meEWbVMRvokKL0iKFyYwpS2d3APzTEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTFXZa/09MifTqtmdvGYZK6DbPoDTP5wZdysM619XIRpQ9jT3aeEl27Ve1REqBOtg7yAxkMmvg9CtKKHUEtcaz4LHwmlaTsRmtrm0g7r2jJJ0VQ3T+v+7FrYM8iO6DKyAlESx/QMeAZX835lAyqKaA7zbMJkceEmHZNf3Zr0Ud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwIZ+4pe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwIZ+4pe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ff680331aso485145e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791564785; x=1792169585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFXJJInvw5I6uRMUagtc3BrGnLk84OWcEEWnPfiITzY=;
        b=TwIZ+4pelWF+DIuWpm9HiXuwZ+v5xcpeXf5Sp7pUgFIBYvMRs0Dg7fEYijZIKLYzPK
         usy6kqGjxNMPdvNbat0PBWXesi4eMYA4oIzaFthvEyc940Dr3hnST3YVfJrLnWX5V4j4
         JEc3qX4nRN+7CnhRF430UYIfcSow7J2HMKvZm1exYrdw6/lA6xLenECTzmpbODCls52w
         /qCtvTqqVQLJdODYXPbL8T/BVn0PFuQC0iigMpJNtaFSBBzrkaBtc2P6lzldn3LOldt3
         gHX3OmFhHhCGoucPTkwEaz1CJcsZVHzJozqbo/R9j5QJWlbUyuWIaNwe4UXZ2wyGA6yA
         R7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564785; x=1792169585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFXJJInvw5I6uRMUagtc3BrGnLk84OWcEEWnPfiITzY=;
        b=nELZDxZrcjjNfbFWElBk2rnNzJD6mFFugJn04EFk7Qjvm4FiELlZy/0hZL4xE3oZ1V
         37u4J1wooO38Knz0hvqEgphsTq1Imguz6g6eF05+/2IOqLfZE8iTpEuWrtwj7y/LLWQU
         leahr1Y+TE2y0GQO0ck7ppCkQQ1QMrdnNtgBL6uAr7+hFwTBfO1u9Hm17SsnJakXQe8g
         GbjNVM4Ax5LfwMsNwSr9JUlbyoMq18l5Sy8clChbGAaN23qdYMreE3YBhuTNS6M+BCbn
         N0zqOgdcmhvf/bxMwlz6so0eJ7XqiLu7eTfuvIe2dr5OkJZCVcuedPvD+q8aUUE2wq1C
         fOaw==
X-Forwarded-Encrypted: i=1; AKwUvBzcW16Ljp4KZsYM0dmrSHFtod3Lj3gjeY6/B60SwPIxzT/JDX0SpoLQzRTd10ZdmLIYQNBOijoZmIKnNLc=@vger.kernel.org
X-Gm-Message-State: AFuF++mL4gNSYeBQFSJPbgwLEOi0Aeb5AQrB9uxu5UXKNRb0vmwO+o+F
	ZaDN+hsEk9yroWbhg9oDcCW2ddVIgAnqlaFlW/2Bm1yYm8SduLBLMJLS
X-Gm-Gg: AYBFou2Ovp5tIqE3dan2w/FR0+WaiWWWBd3r1bH70T42Hf+NTzggBvCn7TVHX2GVGGi
	kDjM7bENVRorjxqZ3GvC+QECE75bvm1UfvFMbQCJJ+W13x/u+RPZuRgRY/QkLBkdGzb47jQADC5
	kPIbmuo0k8yEOpulPhTu0O8T7aqFApM2xQB4/Btj5R4O3LC/D+sg7SUsxneW5Zd6AqD1I3RaFPK
	Ck2h70sBqP7sd5W6rm8aypJHjT74HUHwiyDWu/AOoUISjaGRhP448Y29X4hJMs4RCcvR5S5CEK6
	wkZ2MpytPpzFj4D6no7/CSvIywrWKznhxbWHyG66infYS2/HeHFyL4S3VDfpH4Lu0gGtF/EvGTj
	K/NHWQztBTJW81RMhDKkS1h3KAKOeRC1yzHqZk2kbNiVRpjJL3yW5Cnpu05/10Vww+9qDykssx+
	n/ZA3IPWY53ifUSw9rPQQCeDYiY//vcFNJRS1wvXgbGwYZTx9y8USkBaGg64zOkQo=
X-Received: by 2002:a05:600c:524c:b0:4a1:825a:5726 with SMTP id 5b1f17b1804b1-4a18e4aeaffmr50919865e9.31.1791564785375;
        Fri, 09 Oct 2026 09:53:05 -0700 (PDT)
Received: from fedora ([39.51.119.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ee9bd19sm44880755e9.1.2026.10.09.09.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:53:04 -0700 (PDT)
From: Muhammad Waleed Badar <walid.badar@gmail.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Muhammad Waleed Badar <walid.badar@gmail.com>
Subject: [PATCH] media: uvcvideo: Handle payloads starting in the middle of a bulk URB
Date: Fri,  9 Oct 2026 21:52:48 +0500
Message-ID: <20261009165248.56440-1-walid.badar@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bulk decoder assumes that every payload starts at the beginning of
a URB. It detects the end of a payload either by a short URB or by the
accumulated payload size reaching dwMaxPayloadTransferSize, and then
decodes the start of the next URB as a new payload header.

Some devices, such as the Realtek USB Camera (0bda:579f) integrated in
Razer Blade laptops, send payloads of dwMaxPayloadTransferSize bytes
back to back without aligning them to URB boundaries. When a frame
spans more than one payload, the next payload header lands in the
middle of a URB. The driver then copies that header and the data that
follows into the current frame, and parses frame data at the start of
the next URB as a header. This shows up as "Marking buffer as bad
(error bit set)" and "Dropping payload (out of sync)" trace messages,
and most frames larger than one payload are returned empty or
truncated. On this camera every MJPEG mode above 1280x720 is affected.

Fix it by splitting URBs at payload boundaries and decoding each part
separately, so that a payload ending in the middle of a URB is
completed and the remainder of the URB is decoded as a new payload.
Devices whose payloads end on URB boundaries are unaffected, as the
whole URB is then processed in a single iteration.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=207045
Assisted-by: LLM
Signed-off-by: Muhammad Waleed Badar <walid.badar@gmail.com>
---

Notes:
    Tested on a Razer Blade with the integrated Realtek 0bda:579f camera
    (bulk endpoint, wMaxPacketSize 512), on Fedora kernel 7.1.10 with the
    patch applied to the matching uvcvideo sources. 150 MJPEG frames were
    captured per mode with ffmpeg and checked for a valid JPEG EOI marker:
    
      mode        before          after
      1920x1080   25-36 valid     150 valid
      1280x1024   37 valid        150 valid
      1280x800    38 valid        148 valid
      1280x720    150 valid       150 valid
      640x480     150 valid       150 valid
    
    GNOME Snapshot (PipeWire) no longer reports JPEG decode errors at
    1920x1080. The patch also builds against 7.2.8. It has not been tested
    on other bulk-mode UVC cameras.
    
    The root cause analysis and the patch were produced with an AI coding
    assistant (Claude Code) and reviewed by me.

 drivers/media/usb/uvc/uvc_video.c | 70 ++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc3536a43..fe1714ccc 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1612,27 +1612,20 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
 	}
 }
 
-static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
-			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+static void uvc_video_decode_bulk_chunk(struct uvc_urb *uvc_urb,
+					struct uvc_buffer **bufp,
+					struct uvc_buffer **meta_bufp,
+					u8 *mem, int len, bool short_urb)
 {
-	struct urb *urb = uvc_urb->urb;
 	struct uvc_streaming *stream = uvc_urb->stream;
-	u8 *mem;
-	int len, ret;
-
-	/*
-	 * Ignore ZLPs if they're not part of a frame, otherwise process them
-	 * to trigger the end of payload detection.
-	 */
-	if (urb->actual_length == 0 && stream->bulk.header_size == 0)
-		return;
+	struct uvc_buffer *buf = *bufp;
+	struct uvc_buffer *meta_buf = *meta_bufp;
+	int ret;
 
-	mem = urb->transfer_buffer;
-	len = urb->actual_length;
 	stream->bulk.payload_size += len;
 
 	/*
-	 * If the URB is the first of its payload, decode and save the
+	 * If the chunk is the first of its payload, decode and save the
 	 * header.
 	 */
 	if (stream->bulk.header_size == 0 && !stream->bulk.skip_payload) {
@@ -1671,7 +1664,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 	 * Detect the payload end by a URB smaller than the maximum size (or
 	 * a payload size equal to the maximum) and process the header again.
 	 */
-	if (urb->actual_length < urb->transfer_buffer_length ||
+	if (short_urb ||
 	    stream->bulk.payload_size >= stream->bulk.max_payload_size) {
 		if (!stream->bulk.skip_payload && buf != NULL) {
 			uvc_video_decode_end(stream, buf, stream->bulk.header,
@@ -1684,6 +1677,51 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 		stream->bulk.skip_payload = 0;
 		stream->bulk.payload_size = 0;
 	}
+
+	*bufp = buf;
+	*meta_bufp = meta_buf;
+}
+
+static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
+			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+{
+	struct urb *urb = uvc_urb->urb;
+	struct uvc_streaming *stream = uvc_urb->stream;
+	bool short_urb = urb->actual_length < urb->transfer_buffer_length;
+	u8 *mem;
+	int len;
+
+	/*
+	 * Ignore ZLPs if they're not part of a frame, otherwise process them
+	 * to trigger the end of payload detection.
+	 */
+	if (urb->actual_length == 0 && stream->bulk.header_size == 0)
+		return;
+
+	mem = urb->transfer_buffer;
+	len = urb->actual_length;
+
+	/*
+	 * Some devices (such as the Realtek 0bda:579f) start the next payload
+	 * immediately after the previous one instead of in a new URB, so a
+	 * payload boundary can fall in the middle of a URB. Split the URB at
+	 * payload boundaries and decode each piece separately.
+	 */
+	do {
+		int chunk = len;
+
+		if (stream->bulk.payload_size + chunk >
+		    stream->bulk.max_payload_size)
+			chunk = stream->bulk.max_payload_size -
+				stream->bulk.payload_size;
+		if (chunk <= 0)
+			chunk = len;
+
+		uvc_video_decode_bulk_chunk(uvc_urb, &buf, &meta_buf, mem,
+					    chunk, short_urb && chunk == len);
+		mem += chunk;
+		len -= chunk;
+	} while (len > 0);
 }
 
 static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
-- 
2.55.0

