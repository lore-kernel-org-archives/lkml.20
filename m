Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851543;
	b=pG98uKxJz7D0ZRZGDJEntRE7OdISK2AEKU4fYEKsmYPDd0HAhEUzxXq8vXcCz+XFmlfz
	 8TAOjZrplPA9n/mUKEcDluea7+oIKY0I/SY1x4sQgPXquHHP2VaOybHPqjnxWZdijU6aR
	 IKoFuo/hYbrKu6s4XO2BnF5fH+fDZA15jUJJdQGjHOzrZt9arjuyegCWdHS8aF1RW4gXC
	 A+kOAz+W7d44A+QMGI0FZF7VxrOnYh2yRp5YZK/4nxQi22N6H7pK0nJDcNTIiWe3u39lB
	 YbFIuNCYk3XBILCESZe2Wgte3xdjqlsl8coj4pXvSw6mAzcPQYKoVsw0gzs+NafI+7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mLXA5MYZQzhnIjUN4es5XUBRMGwezqL22aWBvXkcOLc=;
	b=dZRWPIeFBUDEH+wUsjAbvPDaXa8+qJHD1nO04RMxB3BwWTATgi9k3xphlCUFsNSvcsYO
	 LtpnZAPq96hL18B8IlGGF6hA4A/nTZmuBUaN4jV+DMCAQS5FSEhmoQPERNreESx6KrBl6
	 m8siUexEGpcF/Ekm0W/UW/+RLguCKP5skovc0sqSEQZSlXUAlQ1bO6+RfItw+MAW4WZTO
	 aN2gv8odZ+BI2Smu29Mf8ZFuMFoclnCypEwHdOvcRuOECQ7sygqa/CYeKx0hQTBHaqBEj
	 MvMvuVVxIF+962oES81nxVGNnGrtiCSekjN7Y7soCPByBPYxqDFrsbTrW9+kCD6mw6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Clfk5jH8;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24F0606A8A2
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C24F0606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Clfk5jH8
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae25c846edso30888261fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851535; x=1795456335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLXA5MYZQzhnIjUN4es5XUBRMGwezqL22aWBvXkcOLc=;
        b=Clfk5jH8durmCpYxgXWONWZnvGvbgI3g7xEo51hDcgnjL8gE+wlgNoDySxVR+CfOqB
         v5e3U21vbHUsh7d31kO+GQBco2jwfY0vpjNUm3GppwvpIVEZajTOpAbK7mHZ9qn9k9Pw
         EGBcuFmTnL/f5KUsdfrD5IYVeS2r0/U6VmBnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851535; x=1795456335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLXA5MYZQzhnIjUN4es5XUBRMGwezqL22aWBvXkcOLc=;
        b=UkvHcmCIVxNJKy64CQ18w6y5i9E6lpNW2F5I2yCj4H5zHNwoa5d/hoZIEXek/cx1Na
         jJ3yvn2I5FpRNpDzWrJ6cPvSsj78VlH7m8StQtVjJAnt1ecGvXGKDPe6aMmNXaMSNsp8
         F/norwwenAHGJQgpKMLpA7GlnTYMH8/FfMmPabOcrBE+VtxOJ9shS4ZtRRyZmfAwlufo
         U8K1QJLA2WksWlz4pJ6EGPDhtT1U+D1B04aZRXNBhelSW+jAhLSkFrQRpDrZK0fkgao6
         TjHApBHfm85iEvkch+CYotj9cL+7jmeGrZp5WpiGIo8dFglBWi9uR6v6RIIDsPS6zd1/
         5sdA==
X-Forwarded-Encrypted: i=1; AL+hErGJxswixbdDJNxbOjtcM6UBOlhVC+Sg3OG7GYIpV4XxsgwumL/ocTjk2msu2nzfW4dOUNLTrKIi3Qu0Y7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x1Kk6MytdVeSpgRhe7vL7geT1se2VaZCqptidg+ZkZxTZFYiu
	skAgK3ppyZJ0YpUcRXh5IeK8/SnbyYHROoTNc9U8NYP8G6KOPJcn5NzpjISRDGU8RQ==
X-Gm-Gg: AYBFou1IcwR1KVeKW8NK9Ku26UamWztq2VJpRoW+wWhm3roPZM7i1ye4fp9mtdnuoN3
	cK0l/BVNGBTZdBMaMsY92kzEio3DSfca9QAGLlmt8zzutBAUCGIFL1iJfUlBKzcIpVAe9iOfvdy
	KKYsu25wmAnevZtYy0BJPI4ZtpFmExjuBAzPftXntsMp07NkFHPwmjtEnRwXXFYmqCyRHVTx3OG
	qds7YA+WyD6lT2QKGwmQdoog83xWdBGTx9sBaraNKJbwFTIRk+bTQKT6az18OusQBo+okNREBnI
	oarXoGzQd9u0qWtcuo+LU4b+crwEdGU928gvuYJOfB1lT6el7/kSEVdKLBGyK1xg5n8SgCswDt4
	XTHgwZEiquUIEOYgV6wg3kCtTIeVMuBOJzmZbrYh8D4ARNi5S3PyuC0pkcwdHu+b87EEFJGC689
	LYOZCOUHzs3ooCzhIALSbm8mD09Fwqq40ycT4e8TH9AqkI9fchcPUyfSU9SmcHjc64DkGUmfa9j
	R1f8ibrIFLCCZFgtu4SnvDq9EaZeRvTy4Qif1ns+BuKA1mnhEsRF0mbe72VaPNOHXJqHFyHBrct
	rQU9fjIQypwVFSKDvxT6qHRT/VU2EsiuDj8nTe5S3LV/hIu9CauZ+8pOaeF3JP9C7upDrB5o3MW
	WM7vfoq6REA==
X-Received: by 2002:a05:6512:131c:b0:5bf:ddd7:8896 with SMTP id 2adb3069b0e04-5c1706062aemr3775316e87.7.1794851534902;
        Mon, 16 Nov 2026 09:52:14 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:14 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:08 +0000
Subject: [PATCH v2 1/6] media: uvcvideo: Reject payloads with a short
 header
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-uvc-shortmeta-v2-1-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Sinan Turunc <enscrpt@pm.me>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

The UVC header starts with a byte containing the length of the header
itself, and then a byte indicating which optional fields are present in
the header.

Currently, uvc_video_stats_decode() checks that the header is big enough
to contain the optional fields, uvc_video_clock_decode() only checks the
packet size (allowing payload data to be read as timestamps), and
uvc_video_decode_meta() fails to check it altogether (leading to
out-of-bounds reads).

Instead of adding the same check again and again, check the header
earlier in uvc_video_decode_start(), dropping non-compliant packets with
a warning.

Note that this changes the behaviour for non-compliant devices: until
now, the payload data of such packets was still copied into the video
buffer, now it is dropped together with the header. On bulk endpoints,
the rest of the payload is skipped as well.

Reported-by: Sinan Turunc <enscrpt@pm.me>
Closes: https://lore.kernel.org/linux-media/20261115121701.189-1-enscrpt@pm.me/
Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 24 +++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab714..e801874e272e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -553,6 +553,18 @@ static inline u16 sof_diff(u16 a, u16 b)
 	return (a - b) & 2047;
 }
 
+static unsigned int uvc_video_min_header_len(u8 header_info)
+{
+	unsigned int min_header_len = 2;
+
+	if (header_info & UVC_STREAM_PTS)
+		min_header_len += 4;
+	if (header_info & UVC_STREAM_SCR)
+		min_header_len += 6;
+
+	return min_header_len;
+}
+
 static void
 uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 		       const u8 *data, int len)
@@ -1192,7 +1204,9 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	 * Sanity checks:
 	 * - packet must be at least 2 bytes long
 	 * - bHeaderLength value must be at least 2 bytes (see above)
-	 * - bHeaderLength value can't be larger than the packet size.
+	 * - bHeaderLength value can't be larger than the packet size
+	 * - bHeaderLength value must be large enough to contain the PTS and
+	 *   SCR fields signalled in bmHeaderInfo.
 	 */
 	if (len < 2 || data[0] < 2 || data[0] > len) {
 		stream->stats.frame.nb_invalid++;
@@ -1200,6 +1214,14 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	}
 
 	header_len = data[0];
+	if (header_len < uvc_video_min_header_len(data[1])) {
+		uvc_warn_once(stream->dev, UVC_WARN_SHORT_HEADER,
+			      "UVC non compliance: payload header length %u is shorter than expected (flags 0x%02x), dropping packet.\n",
+			      header_len, data[1]);
+		stream->stats.frame.nb_invalid++;
+		return -EINVAL;
+	}
+
 	fid = data[1] & UVC_STREAM_FID;
 
 	/*
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94ffff..278c7b0e535c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -661,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
 #define UVC_WARN_QUERY_CTRL	3
+#define UVC_WARN_SHORT_HEADER	4
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;

-- 
2.56.0.679.gc527c65306-goog

