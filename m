Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2E4E01E5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887452; cv=none; b=ARSC0wlu3pXZ5xhTXFEektbspaEIhEIgwAjfkkVXe4U8i2gdh69HtYhSN0GA89kB/YN2x5m8YjNqcrKAC+rWFJuoU6ahKdam92RJPU4/mZTyJxMuCOZ7zC5s/qGHXfiu2hgKgUoyS7SmUnX6Ph0/qKNY+hCVz4oLKpkJc5bChvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887452; c=relaxed/simple;
	bh=OFgV7Q+Q9m5bPZHtkc0vgB4UyPytyI7XAZBQBoWSxfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tabTqE2mPDRxT60OwkwfSg+8WlEYudblMjbFduHvrrVqWlDXWjzL3/dto+goLbTyCaTGf7LIDGIHjfZ4pBFuqge1CLGXwkyNdZtWr8uoymtuAPvM9ox9DYC3yymgUj3YxNHWFjwLB0Rz02RHZybDdrX2tQYzZN8oVVlA9p1RyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hudshSSb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hudshSSb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso25518405e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887448; x=1792492248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6TD2JBSDx2Af9KVVYuH1Qa1LkplFUH+G2vte2t2dJ0=;
        b=hudshSSbzyeMT04LStOk1D1MuK1AwmJV2UzjkLCFZ6cIPzWbGkLhppaQZQmraS2hkd
         JamDSC6l4lDyEx10CvG2t7pH8wg4bm2aj39cxYg8fbRN3K4VOdvilUCJPnE133J25Y2T
         S8+L/+XlxukfdHB4MhQ/tciygNI/SYxuUVfCDMJZV56/q9kuAksUkMEN66e3+FXfiLgy
         evMibTL9HF4DhJOYxRtho9KP2kXmusZlxFPNdAtookxQKrXxxJPdHngJHLh++Qei5T5/
         gCW8h2FPElZ+Ozy+24kJU5Uq6MHQIRsHXW26CjxpEb+T6njPDGYLm0GIsu4ZNov1/AAx
         Bi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887448; x=1792492248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6TD2JBSDx2Af9KVVYuH1Qa1LkplFUH+G2vte2t2dJ0=;
        b=peyUu2f4DY7DGRtLzQOwwYjhOcVCZBRxyVTrhTHpRiqTTwanY4/HK69I/qMo8ITck9
         6+C8TBmAnDmRK7rv2yWoZUMM3DBBm90ShcZ1qPmQDctN940a0pqay5DS4wyaaJJV6UEb
         cPf99u7WodFZ+g2V8515Y9rbgvcG0pzDr62tktbHLNDYovPqNAHT4sKNtq+KSQos1JMi
         012G5SchCLUPddmI+5sGYYxKLdO8JHMMaanD75R654SAD0IQ3+f5fkau3Mnc0kovoH6o
         ukdWM8iV9gbezbD4h3F2sU8CpPBI0WOu6NR1uNDl0hjOL4D9hKAizWaTw+62RmaMVJyu
         xIhA==
X-Gm-Message-State: AFq9FYJw6HN6hnWf924XoV17pUzhzntLSxV8Z7DyTPzLNDapSR0K2aX6
	ajtJSQ9U5RExUoVVUkOUu6uYAHq1+OYuP/BQtKhvI6wGMbNM3XD8qdk0
X-Gm-Gg: AYBFou18Kpqitz2UC+OniyJCCGa4yxjawMjDnxv5gd/CBfBB8nSzd6ENg3GilmBBH02
	lNXtPeSjwGrxCiwa3XOB1DZQdRtfH8DADbeF9FqtEGWQck5SukEiL/zpTm8/x+FQubrK7P2QE0G
	APSBUjqY/MhEKD2qoD0Ev7SIXYpRkbJmcOobCKFD8OPysb+oKdRjo1co4fgQEIOGbIoqSp+pA6F
	5EiKUOc6LdeHI1chWsieKphfp8/T3p+ttCO93MBySUdShfa64e29y0ZkjWHC/OjD9ignwZxJ3G2
	jZCt0zwC4600OnQWiuiKZCObz1NnjIaUi2GwEe2dIrBAxHzAeg+ZQqqV/2avK2C7iBUW7Qhkocp
	H1EX+Wg3ep1qZ8iSsdr2t11QdPI3XLBnS/vAQrvX5zXyFLhmRpn+VXBzNv9IpMSInbkw9nCV5Cm
	QmneX7tnudyrPGgf+WUppkkjJl6CAsY1XEwTOZBxjOZ/ULt6rD7iXRmNV6uLrmFdRwcg9cD3Ptd
	NgorMY+hPL5KWEnxtKAIur9nMs05DrpcjgZA0sBtiANU30Z33cxF7frGXj+KbUw6m+LwR4x5OD4
	zVVV4iywA0KajDFzdxeWi6yzeIsmJ56eiOHfysh8
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr243082755e9.19.1791887448077;
        Tue, 13 Oct 2026 03:30:48 -0700 (PDT)
Received: from my-vps.. (ip212-227-39-93.pbiaas.com. [212.227.39.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ae0c9fadsm49810175e9.4.2026.10.13.03.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:47 -0700 (PDT)
From: Louis Clinckx <clinckx.louis@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Louis Clinckx <clinckx.louis@gmail.com>
Subject: [PATCH v2] media: uvcvideo: reject bulk output payloads too small for the header
Date: Tue, 13 Oct 2026 10:30:41 +0000
Message-Id: <20261013103041.145445-1-clinckx.louis@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <LE-MESSAGE-ID-REEL-DE-TON-v1>
References: <LE-MESSAGE-ID-REEL-DE-TON-v1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bulk video output stream prefixes each payload with a fixed 2-byte
header written by uvc_video_encode_header(). The per-URB length counter
in uvc_video_encode_bulk() is a signed int initialised to the URB size:

	int len = stream->urb_size;
	...
	len -= uvc_video_encode_header(...);	/* returns 2 */

An output device can describe a bulk endpoint with wMaxPacketSize 1 and
negotiate dwMaxPayloadTransferSize 1, leaving stream->urb_size == 1. len
then becomes -1, and uvc_video_encode_data() casts it to unsigned
(nbytes = min((unsigned int)len, ...)), so (unsigned)-1 defeats the
clamp and the following memcpy() copies the whole frame past the
one-byte URB buffer.

Rather than guard the encode path, reject the invalid configuration when
the stream is started: the negotiated maximum payload transfer size must
be able to hold the 2-byte payload header. Requiring size >= 2 also
guarantees urb_size = psize * npackets >= 2, so the encode path can no
longer underflow.

Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
---
v1 -> v2: per review (Ricardo Ribalda, Laurent Pinchart), reject the bad
          configuration at stream start in uvc_init_video_bulk() instead
          of adding a guard to the encode path. Can move the check to
          probe/commit (uvc_fixup_video_ctrl) if preferred.

 drivers/media/usb/uvc/uvc_video.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1942,6 +1942,16 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
 	size = stream->ctrl.dwMaxPayloadTransferSize;
 	stream->bulk.max_payload_size = size;

+	/*
+	 * Output payloads start with a 2-byte header (see
+	 * uvc_video_encode_header()), so a device negotiating a maximum
+	 * payload transfer size smaller than that would make the encode
+	 * path underflow its signed length counter. Reject it here.
+	 */
+	if (stream->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+	    stream->bulk.max_payload_size < 2)
+		return -EINVAL;
+
 	npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
 	if (npackets == 0)
 		return -ENOMEM;
