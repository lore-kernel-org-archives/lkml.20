Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830207;
	b=ZcmZjnveSOPfb3qZw3vtGvJP7DhtG2KsWeC/d+NyKr291bkJW8a5rriIz4hS3CQvmJbH
	 jEWI2mQxE6eJ3yPfQDPdS3plAtp81E/8CB/3+J/iRodCaGjdh2XV7FU9m7ydJZduS4mKO
	 /+dNf1KnDm49yKRtamSc5Qc1x2MHFFuAB5qAxpbVHGMN1C25bOVg7KZnYPC0cqR43jk/9
	 daEo4aPRpby8tQ6XWEV7Lpq+UVp0p9yqtisxVeJED4rcezgvXiFROWmoacjDWkrt1Sh0O
	 xy4StsbrAA1rXF7W06ZMMneGQwWOcLpEjFU3Ualsu5VVcu6TQ0gthj0pXLcKGZkbvyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4YzOvjpkX5tgwdPOk/JXkyZ8MEMVph3AxHjayVExlFU=;
	b=h76Ty/vaAjiKu7sa1gpAhnOW/T2IsACQaw4eoqmQZ7AK02FPz18EaCJOy4pmub1F96c5
	 qG3fxOeMphuOsQY/WGpCksXOYlxoQctC5FPSs4iMbaGrpIJ6OuZ41nskNknAVoLggljUK
	 oT6jxjKt2uz16G98I1joUJfAICrn9E/AfLKHph5ViDCaDzJc0FcCqnfXVcAgRT7hDUVJY
	 myVQ6sznE1Jvhmz77ftO6DhSlqaKBs+27883jrD2QMK7D8vW8ceISrZAStl2DdHtG9YMA
	 vzIHJUMlEWYwPnAtgeta59vxsY2TlaiV/DoGAQOkD5w1xoRc5lLHkE5wuMa3SMZcnhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhx8kUcA;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71564606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71564606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhx8kUcA
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14f7768acso2666614e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794830206; x=1795435006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YzOvjpkX5tgwdPOk/JXkyZ8MEMVph3AxHjayVExlFU=;
        b=mhx8kUcArckpbQKbKy5DJXbBYFGN7uTiyMJU/GlkpCFH81bsNLyG7jVx4Y0NRhvtUI
         J7OvcuNMvbS6gKfgL4MVJNaIcczH4gmZb5lkmQaK7ph4gzplS8QBRO66hsGz0qdvEOoO
         lXA8Oj2whWfc1UJGWH/U+x1O9hMDp2P2AC3eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830206; x=1795435006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YzOvjpkX5tgwdPOk/JXkyZ8MEMVph3AxHjayVExlFU=;
        b=JkboALg2h2oHXEBZFLFIAXx9sVMI8Ha8pkGN+tpz8vS8tXthluTe/S7YKFrHmvnevD
         hnQ9o2JStuiareBobgZ4uuX1XJU0VZGI50a7C04mspy47lUVLfLLeLFOdKdm1So3XTpW
         M2OuOWx/1sSdRjMplxNeK5i+ROCJbzILdTN5J95epmPNusRpT4S6HkFXevnwjYMX2m4s
         KdaGYqsuCvSlhzYgU+Lgt/aI9KYU8ozHNXmeDYKYEAy2qR8KsnIb4CZwLn7W10jXAAX/
         2A5eH0Zj0L6NkGCmW8SNHC6l8SvTr1LsvC+qtbXpEi14aNAWy8KdVjVKhNkfoV9oXc6l
         fR2Q==
X-Forwarded-Encrypted: i=1; AL+hErFj2wT/Cia76TlKwisY1vfhAy0ZlGIym7Nl8TCMrcT4PzkwJ2kSNJ1qzp8pa7+MxpGDDUSYMYksbuz7seQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JT1ZCx76nnK0RmpqHH6UTISUVnoEP0h65h6PuqU13CxTgUzax
	bcvxpZd5U7bEIxnIrVkvDOYrgeHOS9nGo+EH7WrVwgWZDXjWeeg0VAnfA8oulxyXAA==
X-Gm-Gg: AYBFou1lOW85i9f8kHUwbTGLqmej++//R7jISj8vigqNoijKmQ2X5b5dFrGpzxdfbyz
	rhkv3rtBR3sZynVo0g5MpI3/2FSduBjZo08iOEmK7pQlE0Pm+m+YCztVxdHR5tJdhJRygngj0wJ
	R49w1fb92Z6bobbAgmYENfQtWFhPvOcXnLIkq+YZeG8ttqs7hEqXcDGTg3GlsvfBS+jEtq0jDWF
	b5KFtF5QAbEK6HSpvZu/4wBDfklXqHCYXbwOy9L1oAV+vYj+77KILKBkW6BW0pWxiSLZpURiSbl
	BgWvT38pXJxdcI2kv32G2alGxbozB+pKbmC6Q3Y8HSlT9kGuXrhTx38mZImqEfp1ot+VofQF2JW
	d0tWnynHrJnKUEkkKoGJ8fBpLQ0ZiqlJJsGetzPFpaAdNMJ+YDwiEG0bMcf4bq4rXPR5ZX5p1N3
	p5Voms9PEqTKqSQ9CT+Tr7b0HY2ZIfjjTWzN/td4YnMSyQSF98msfwXfFmvWU2JQ4SU0YUzyDcs
	Av1w2vxUB4mK0QINNh2V04xV1/ehnu28BnCZzf6jT8/uCt/+uUqkE0wGj4ejPS4oQF0qMF30mL5
	n/5zlwkRC/CGYxw4do/MVTo3nGku0xhIM8heIxFCFrbYDAU4Kpm1NDP9/u8OeEFcMCd9wQtfHkv
	Q+cXRxsmKa6MYoeaftbCIwC3Fzyh7+eo=
X-Received: by 2002:a05:6512:108e:b0:5bf:d072:fa3f with SMTP id 2adb3069b0e04-5c1709fa4f2mr3628890e87.54.1794830205715;
        Mon, 16 Nov 2026 03:56:45 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad7dsm3183754e87.9.2026.11.16.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:45 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 11:56:39 +0000
Subject: [PATCH 3/3] media: uvcvideo: Fix unaligned and OOB access
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
Message-Id: <20261116-uvc-shortmeta-v1-3-487cfe42fa89@chromium.org>
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

meta->buf and scr point to packed metadata and USB packet memory that do
not need to be aligned to anything. Also, scr + 4 is a 16-bit field, so
reading it as a u32 reads 2 bytes out of bounds.

We use *_unaligned() in the rest of uvc_video_decode_meta(), but not in
the debug print.

Fix this.

Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e9be0a627033..3e3296ec5c65 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1532,9 +1532,9 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 		"%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
 		__func__, ktime_to_ns(time), meta->sof, meta->length,
 		meta->flags,
-		has_pts ? *(u32 *)meta->buf : 0,
-		has_scr ? *(u32 *)scr : 0,
-		has_scr ? *(u32 *)(scr + 4) & 0x7ff : 0);
+		has_pts ? get_unaligned_le32(meta->buf) : 0,
+		has_scr ? get_unaligned_le32(scr) : 0,
+		has_scr ? get_unaligned_le16(scr + 4) & 0x7ff : 0);
 }
 
 /* ------------------------------------------------------------------------

-- 
2.56.0.679.gc527c65306-goog

