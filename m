Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851539;
	b=gkGGBPWWpKrI8Ag5mUlaHZWWQ2ZuZOiIbv8XWtV0QnFq/5uMHtm1/TJOF8pFdd/boDGz
	 3r/8wz5S3JK12pNSTjZDpfZVaRppTk4nYm2/dX5AxdSV1ri7N/n/884BrpVDKriFDuegI
	 +bvNp3i2gawuc9FW3h6ZeEHNkZh513dCQvajPQ4XUUOEh3uuHSgoj6AUBjX7vlAAPTI21
	 KEhT4lIgIyHHbqyy7BQuRapDDewCFAtYczLHlVfbB4AJKsRTxdlakMS77ckHNclCVWPrk
	 YRRkPZmLoKLSTeONeeZ2Rj1LsWDNyyyqXCcYDTJaQVhonUyf9FP9NuEftKAJBtFR2sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Mybi2FfPRDyfDeC5velKUxV2mvI+QkF0VK4ji6bNsAQ=;
	b=f442RNJNx5xLNA6BcXCsxT5lUfbcZ0V9FxZT1pZ93k007uvno+wRSOGDLndiY9o+iLKf
	 lxABO550oWSOrciC6WkLSXWQd77jl2gMI1QEBmUR8mJkWiqFoVUTew5JEOWcfAryYv4BG
	 k6VTyCaQjyPysHEB6qy6kGplLG6d/A4B47Yij2PIrGR55qLHsXbTQ7iKg8qeNUoc5YK5x
	 51iSRT86LNf2Ejpba9OV6Il5LaKFC+OLByR5WuYrqLyt0CxNNwiObi1wT5eLurYVncjmZ
	 BwlCPUhYE7jaKi6lZwvlbWXfLsnSB3jYsmH9CdDzTKdkJeK2JwrWYB0CvoknVBTifkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Cw2Q5Gvc;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422B606A8AE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7422B606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Cw2Q5Gvc
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14a204305so3387443e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851536; x=1795456336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mybi2FfPRDyfDeC5velKUxV2mvI+QkF0VK4ji6bNsAQ=;
        b=Cw2Q5GvcXZUXyFxbX6kvaiwwK598oEfKRBEXZdMVZC0iMeCjklHqbLQPD3+pMYTQS6
         Hh2Ggh7R5gORayLRumN3cY7exJhza/VEiwSlhV94RgzqRibrpAgxYNXigvif9NOrqJih
         AVNFxlvvgqv3wzcmG7RHAmKjPgMzR58vwx60E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851536; x=1795456336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mybi2FfPRDyfDeC5velKUxV2mvI+QkF0VK4ji6bNsAQ=;
        b=kFeFGlu36lcbF+2Wk2XFnICsGYz3RF/Mj0RTegMR4tWFxM30otIrZoDJzoLm2rsbcR
         mANVGKJo4+l8JJF+CcDs4qoNif2pMm10Uz9j83ki4mA7Wpimr13hpqRygD0pVz41DPdJ
         0qF6SYaIvozYLZdm11dwu2T8h38cVaftcxsT8hEKs0V4/du8l6dy1V3lprUe9M+PaKR0
         g9jcyMo96DkKDjVi/dhciwh3BTi5zFl0EbnpGA3cxE961LcqrcUfguUEZ/uKIF4E2P8n
         y115Yt4+ppbtxazD5z/Bz/OTMA9onUolfJLQY2HzkK1Don87ndzm7QMFJVwMgJZeJtre
         9DCw==
X-Forwarded-Encrypted: i=1; AL+hErFtCxUUJzZnrUpfZbneMepGjUZNfHR9GpC8OFNbs9LeC1R0RsMunPE3IkKi2e+5w/Hv3G42ESq0n7JMBPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uvgBHZR/Y5khIQcVe7t/uVcCxDqtI+uwdg9RJmxMw9VNQWPXi
	OUMk59vxcvaKrI0yQ7twhPQa7LxER9QEUonP05aoS93MJsp9+785YShJTbM9We45+A==
X-Gm-Gg: AYBFou3Pw+8Ek889YS6sXMV6NLeDflR+z/BDh5Bki0LF3yUu464I8FLkIA8opxwKw1Q
	a3BZ5rHVBV4Ip3vpANUOCRnvJuO1Fh6IPuop75s8p6InjTkkBkrSxVVOEdRGPZrZB0y33kG3Axp
	xlqy92Dflh9E7AY/NQufOb7MZu96+K/1BiMjQt5gHtdPLQfQ2yGVMc8xPA6jvGpDryfC0nGmmxI
	mLhQOem2ncxNZHff/5XfqqFMwKQJzbRFoR/+xHkmDO1WAK1P8BOmRGrqLtHQtWT2aI3gEXAQeVz
	nI9JXcYCatxWew/lKJFinx9cyiqJNQvChhE8ghtbA6XLZvul+yjO/17W3uVq27vn0UAIC8pL8IY
	CgZIwK3v3fgk0kedCvMv1wdf6fechrunm5kZZnNb2WHW+COtPX4ox4ucMPfMCGPKU62cVKkLgvN
	/whqNcXkgd88d0vGveXBZr04+oTzp3yh9q7n6vzTdLCSSirNvL/jqUKm70t5qMcV6ugBfUwxbdp
	2fyX9dlXnWjrnLxwJKM6YCQJJakoAJowRMfRaupURyCv41YYq+HQ5IQ+hdLCsOTiDYXJjppyfF5
	xVJSDgFhQD79d81Ce9NN5FirGOdflNJCyYvA2B4rWMwUaUWCYY+iVF0OWUgvOHX/oT2SobpbSC8
	gfuXawc4b7g==
X-Received: by 2002:a05:6512:3345:b0:5bf:b603:365d with SMTP id 2adb3069b0e04-5c1709d6b21mr4184157e87.10.1794851535707;
        Mon, 16 Nov 2026 09:52:15 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:09 +0000
Subject: [PATCH v2 2/6] media: uvcvideo: Fix unaligned and OOB access in
 uvc_video_decode_meta()
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
Message-Id: <20261116-uvc-shortmeta-v2-2-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

meta->buf and scr point to packed metadata and USB packet memory that do
not need to be aligned to anything, and store little-endian values.

Also, scr + 4 is a 16-bit field, so reading it as a u32 could
potentially read 2 bytes beyond the packet.

Last but not least, the old code printed wrong values on big-endian
arches.

Fix this.

Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e801874e272e..8bae91af03ba 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1542,9 +1542,9 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
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

