Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC3B3368B0
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792293619; cv=none; b=p4qfSWqFj+5GxGh4i8Rzk6xqgiIzZFEGkekJLRBvbzAwfthIDdURM5InUvhkd6O+R2hvXtsaHxGYrmqSI0ACBhNnMzextrLXe/hhbyJ88+QtLmlIHwzYn2+zeg3TRqOXziQPGOXm0Wlktplp/jo1yQPzf33E3iEcLvWbFeYUI60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792293619; c=relaxed/simple;
	bh=Va7lAw1wSvIjtYwVc3QAZwRj9uUpt9kS9frA9TRJRoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W18imE39wQBc+mYxN8kLS6nICYvEUpMvih23XgCGjZNFL0Gx0nGPf+E30db0wuMUKn0gxl7w3+DsMdTSXeZPv/B4OG/uYWpPyr8CmU8XogWMRdFILw/A2gJbqCVpYuIleAfE8bXek0eq8de3ne+mwdrD6LSrtcnUs30BQ5FHYww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGnS0Pc9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGnS0Pc9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso12060245e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792293616; x=1792898416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLQLjdJW3G4Tj7KDthqH3nXbpV2+UVQVNC1UrvvZv74=;
        b=HGnS0Pc9lR+73HPPrHTiImc9CrfuPpfcee9uKGlYCgEKWiHvUjF8QADlsadGwrUzoN
         7J103txtE0DNkv6stF9abJ17Hh+CUYWI9ZAR0xdyOOIJxizqax6OmTnXJyCJZKigX81l
         ABPdXkEzt6AS4WJ7aCf2TEYR6AfL9t8QYuAK8ddBxkrfbTCj94DuZt2QgNNMmTzSKaIk
         sBnOttE+fbJZjKzGZ/+0c1F4/uz33rgN7RyuvTnCTZ4d676uooTYVw4YdDI3uHYiAT9N
         tpeUM5AzE468fxH+SXEkMMkJraAgEQIMVt5rFYZiDZ4bV+qbb882UAZ29yQuMYBP8os0
         +n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792293616; x=1792898416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLQLjdJW3G4Tj7KDthqH3nXbpV2+UVQVNC1UrvvZv74=;
        b=m0L+OP7ctlJ9zIwrJUXkZziUsM5hlacnHv+Yp85OqMeZTKM4ADmtj9JZPNeFhKY1/I
         BSBrPnsWMRtxDLUYBn5FWBAVcDWbp+IlZqEF69lIB0pZWQvWV5a/Iol/+2GMzAWVCcJR
         iXG2UMmAmw7ELC0ngL3Zb9ASzmY+xwX2jnzd42F6Nk/yhUB5DSLhCfL1c9LDnyxlNqiT
         qPKxoJo+M8ipjG6jicmQS226uNZ9mOLMK4+2hVwdPs0iiis3u+CZ7F/UNugSvPxkxs61
         QkEqdzH20fES5MS6pW9i7z7qMPr1LTcKX+vCu/+WP7ewD7SpKuMmKP7EKV/s2i3Vb/Gr
         U1OA==
X-Forwarded-Encrypted: i=1; AKwUvBxlN9mUjK2VkVMui176N8x7s3EtvMTo5R548ocQOWofnUkNFkVsc/Z88ckYKc+E0SfSwFTzHHWdxjiy6V0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGE2BceP60d/odEnEH3ynAgXept4jPkMk+86ULLAp/6/EC/6nG
	ywsRfcOyC/xpTNfd571tSoU6YTlHW96OIvW5tI9LPyapFJ/5ii6jk6TE
X-Gm-Gg: AYBFou2dZx0/pv/irDh+JPXY7C0riTlI+8Q36QuWMA5dEGqzBxp2BjGqR3ow0YvHA9d
	+okuqP0YaR0LBtsNF3yZRQMepNzOkaQYcjAEeT9dsL7Z2aG8ISrNLbYLlTc3voJBzIoeP6sDpJh
	WIIEbYF7TJJQrcM2HhwaqHltA7j6/khukEizGAphdR3RThhRXDvBpu98AjVIYsMxqXtbeRuB4dB
	9xpu321j5vND8qLnazm1PUmoAmd4tuNBj74uOAQNRLRHSOOIn+15KDub7QWhVdLk2MUitJnVQ/4
	4xOlDsVj2QaQnsSFqUzZqACIQ6EPAAj05E7BlXwrFaHee/fPsvpw1j9XRK3S6y0sqGSZDzmqwJI
	tvzlo7CkTUfKvFLRfigr7LaoyXUcLbho5t3pKwG5jOA50F+wb4j6S6HKKRa2UDvC00Bq9Nb5CVI
	2f8kA8qHxQFBqDS8eabKklH2+natVJZV9wBjdlGZeu2YorbdNcLQ6iVzDRUGpEs4xoSzHiLYvLj
	jeZm5q/+ZFMFCptPGmS+/Hk7K7C22CgKDjoAfOWt+Joe04W9vQvRli+4WY=
X-Received: by 2002:a05:600c:1393:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d760e327mr80710125e9.24.1792293615541;
        Sat, 17 Oct 2026 20:20:15 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5008e7sm14202266f8f.43.2026.10.17.20.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:20:15 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: stm32: dcmipp: pixelproc: Round up the compose lower bound
Date: Sun, 18 Oct 2026 04:20:11 +0100
Message-ID: <20261018032011.207050-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The minimum compose size is crop / 64, rounded down. A 17 pixel compose
on an 1100 pixel crop then needs four decimation steps, which overflows
the 2-bit HDEC and VDEC fields in PxDCCR. Round the minimum up instead.

Fixes: 239cf9e5fda1 ("media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
index 7d8e5f0863bf..9055682481de 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
@@ -597,10 +597,10 @@ static int dcmipp_pixelproc_set_selection(struct v4l2_subdev *sd,
 		s->r.top = 0;
 		s->r.left = 0;
 		s->r.width = clamp_t(u32, s->r.width,
-				     crop->width / DCMIPP_MAX_DOWNSCALE_RATIO,
+				     DIV_ROUND_UP(crop->width, DCMIPP_MAX_DOWNSCALE_RATIO),
 				     crop->width);
 		s->r.height = clamp_t(u32, s->r.height,
-				      crop->height / DCMIPP_MAX_DOWNSCALE_RATIO,
+				      DIV_ROUND_UP(crop->height, DCMIPP_MAX_DOWNSCALE_RATIO),
 				      crop->height);
 		v4l2_rect_set_min_size(&s->r, &min_rect);
 		*compose = s->r;
-- 
2.55.0

