Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013043;
	b=MbO9P5cf/XWodhnFFgKYvVHlfC4o8IdOxb+lA/izGiDdYNvWczPkxuX5B9rcxoLtwJw4
	 s/y6Q3k4LL9OQLc0UfI5YTidBy9T2BVwgFUMgyH46DPsFYfh/JFGIW9Hh8e692zVimEha
	 5llg4Whrb3marmpOU+KpVKbeiJwrif1nHXXcjCQXxa9ipd9uSfwhSvw5meHtaHKgfxPC4
	 vsUQ0824fOE06rnYqxqoFyVOy+wZa0XkWTqJSI1qBgJ5JeTbKHnzA8Iyy+PsZXqsApLKb
	 2R7eiMtPdRcDcIsXxKKjoRdBKUceNfLpPE3yauwbLt+okHCXv44gyjlI1RRff2YEF8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3skT80xn6avHnOifeNCjAY8wDgJalatgrsaykd9zQa8=;
	b=tz7t3Ym02XdqgDfL1a7nw97grCSaCbRGZq28fFwvxe5ZpclmB9L7nAFjxEyBbOjlECvb
	 NwM9S7bWy7KSymXp+l9yBUzx1GqhbGPUdLLymeXRxkbVnhK9U07Ueacc+y1X2kFo29S17
	 HKWq/K1B/fQHX93hw0WDjZkXdFq1ccX7i9ZvmU6M2Qau7oH/hCvs1KbWiPevfU2ZMV/qO
	 wVAI09n6+Iv32zxe5VpWcn458jF+u5h5dPiANmHWxDCBWOA6PiccKZPuVp/89lXH+HDsQ
	 AO67EeNdgqFfWdxuTbHlVokqbaGNTxqL4goxrk2e49stdM4GZDau0fC+0A+Xg4J3fQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=joSZ1tRi;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C960A6F54
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F35C960A6F54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=joSZ1tRi
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a6d800781cso283481a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013042; x=1793617842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3skT80xn6avHnOifeNCjAY8wDgJalatgrsaykd9zQa8=;
        b=joSZ1tRizUp8DRq6YgfdH7JbuA96xkUqa5EhhOTrX79uFoMSZfbkUIOGjxlqdP2tR/
         PgjQEXOxtHrVprFB8/GrGpZMI0hX8BP+ghvr5c4aJ8dnle+Kmn3JDhkpBswpQ6333a8o
         QaJO5SuID+ZqtcSX07Fe2sLLYIFPnXzsUb6M/YdAv+bqS7feqsdfbVGUQdaBhlJArkkG
         WnTvRJ5GcHiUnx5gTCCDjB0kdMNzUCKiCKRWlvIkNO1R2dtHt6xZ9zBzbSkfYFv+ufGR
         4kWjIWu4bRuSSWJhCyCe6c9SYd9FLyxvDihiKfhj0WFl9ObCe5In5pqX0XYkHZ6vq5fz
         4N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013042; x=1793617842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3skT80xn6avHnOifeNCjAY8wDgJalatgrsaykd9zQa8=;
        b=ovPJ/a4y7+VfAaATrS8K0PorRfq1H8lQVBH8M3yk+p838wVERY6yydW50tnPr6hz5/
         G8hqCcE/ZVnGJpMYV+pZCCVzJbeWlTpcLZ4s82OiQaV1jRcFNpEjQD4346WcYGsmt8nT
         qmWYx3KUPN/5M7hGqsr3hgxPuIMEw+zNpmfBF6RD3oN/lOjkG7Teyaf5Gt1S1TrBFZhs
         R7VhwlZOZIwy1GGFgjl0b1U49RqmTL9gE5wQ3rbfFsVZ6n2d42q5J2SQesc1ZM/38WSI
         UvGzq/1CLEUiZbmVdnfF9q6CWwa7cXtqb1ta97c4N/yGPXeNDSUERO+DtJiXB+UJ96LY
         tVsA==
X-Forwarded-Encrypted: i=1; AKwUvBxz+NmGR0bR9ZEePhy/7z1UQvnUTyOMJz7TRhIrVypHP+M341FMIUsi277FvPJoaQV4FyEXeaMleST/YHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzJE0nCjR0NzVG/6QYT42NbL75iK5vT9XU/dvo7zpW2iKFvI4V
	k2oUtQ1TjYUdvo/83djFpM5HYdmQKdLQZL/JAbqsLaGpvPlIA0gKcQZ8
X-Gm-Gg: AYBFou07tnTSPnND28xp1KZBaYpPtydIIWgztGxsF5YkpXUByGKQlm9UAj0bOecANEp
	vsnk8helzYQkZWl4kzcmz+zgOBM/3tAynvrAe3TX/eg4uynjeJUXMojVxyAi56tAfSfSl6B3i6H
	uTMR5YeX04wTJ2z4Ww7DLbChbEQn1zB33TV02Oi3tIUDTJIU3nSZvKYVwyDldaBAA0zUbjYlmOc
	95dWjYM/TUzjBrzix0H/KrAkrrBSYXd3P4wautyNwOp/Swgk1n2x/4cd2p3tckFBBpnHlwwd78f
	h6fRz1pX7qFmpNzm+xnZSP2B6XyVsCFgLQvxLLEE13Ola69nPIn7DWvBm/TRlXWcU1ASdSy4xZ6
	IFiqNIouqh4jMu5a3hZjDMT2Gdp5HaorFkWjR8PMlIAFw7OEuZzU32vnvq+8uxaWDWK5X1nKqLK
	e/Qr5R6rDo4Hty4Ciwh/ubmFebkFQ7h+QFAac1AMamlcxpw7yzrAukgLE+mQRx3NwyZeb5nIqgD
	m3eVVk+VCbUjp4Zjja2PAyND+cbegOxvG2muGsRxBR1/aMDdmR2Y3py/lrRwBfl14t7po1i5CC3
	UUcCa1KofZc+jUvE0wpU211zJZl7zYS1HGjxMDbcTsm/iKcv8KZRH36Dqa9nV+AdRjnmKcb98mx
	Sbf/oZT8IY59qL2UiQ0Ncr/SWXi3dQNkfu1LY3Nf7AGVDPg==
X-Received: by 2002:a17:90b:52cd:b0:3ac:9e76:aa96 with SMTP id 98e67ed59e1d1-3adead00d90mr8351812a91.3.1793013042309;
        Mon, 26 Oct 2026 04:10:42 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/7] media: i2c: ov7251: Reset vblank when the frame interval changes
Date: Mon, 26 Oct 2026 20:10:27 +0900
Message-ID: <20261026111032.88355-3-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

Setting a 60 or 90 fps frame interval is accepted and read back, but
the sensor keeps streaming at 30 fps.

The three modes differ only in their frame length (VTS: 1724, 860 and
572 lines), which each mode's register table writes to 0x380e/0x380f.
Since the V4L2_CID_VBLANK control was added, s_stream() applies the
controls with __v4l2_ctrl_handler_setup() after the mode table, so the
VBLANK control rewrites VTS. ov7251_set_frame_interval() switches
current_mode but never updates the VBLANK control, which keeps the 30
fps value (1244, VTS 1724) and overrides the 60 or 90 fps VTS at every
stream start.

ov7251_set_format() has the same issue in the other direction: it
updates the VBLANK range and default for the new mode, but
__v4l2_ctrl_modify_range() keeps the current value when it is still
in range, so after a 60 fps frame interval a format change would go
back to the 30 fps mode with a 60 fps VTS.

Update the VBLANK range and default in ov7251_set_frame_interval() too,
and set VBLANK to the mode's default in both places, as is already
done for exposure and gain. The VBLANK handler then also restores the
exposure range for the new frame length.

Tested on a Microsoft Surface Book 2 (IPU3 CIO2): after
v4l2-ctl --set-subdev-fps pad=0,fps=60 (90), v4l2-ctl measures 60.15
(90.45) fps instead of 30.01, with vblank 380 (92).

Fixes: 1b598f413c7a ("media: i2c: Add vblank control to ov7251 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 1413f1856e..8dad747f77 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1261,6 +1261,10 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 		if (ret < 0)
 			goto exit;
 
+		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
+		if (ret < 0)
+			goto exit;
+
 		ov7251->current_mode = new_mode;
 	}
 
@@ -1414,6 +1418,7 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 	const struct ov7251_mode_info *new_mode;
+	int vblank_def;
 	int ret = 0;
 
 	/*
@@ -1442,6 +1447,19 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 		if (ret < 0)
 			goto exit;
 
+		vblank_def = new_mode->vts - new_mode->height;
+		ret = __v4l2_ctrl_modify_range(ov7251->vblank,
+					       OV7251_TIMING_MIN_VTS,
+					       OV7251_TIMING_MAX_VTS -
+					       new_mode->height,
+					       1, vblank_def);
+		if (ret < 0)
+			goto exit;
+
+		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
+		if (ret < 0)
+			goto exit;
+
 		ov7251->current_mode = new_mode;
 	}
 
-- 
2.53.0

