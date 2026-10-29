Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283523;
	b=ADPM8AGU8HTkd9SxDbI+bt/NfHEAwu7jeSvd2tQPeWeqnVI5TbFC8eCfCP0n8xwtQ5go
	 Qr+G4Y4QgIF+sMqGws3EB59MXvc6eoCJ2BBhKVVboxobJFYwl1KjpK5Hb4e2PFSUTgS1K
	 4xbmwUu9UyxopSpjPevaU8hzCvohXNJ3QXnB6N2x3zw6QPVvZ8Wj5vktDZm3NhB/F7Bvg
	 N/CSR3eH2m/iqsMsh0cFbOxdPaPIk0JBPV0SrWWbj0gk4z75kmliv1Hze7qDJZnqLer/X
	 0c5yGm1W3obZKZGypJDo8Rrrv/l9OfWXyo/o1nlY2sBqGz8TzjoSvgAmqjB3AVB3JzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
	b=T4+ccrwp2cOuZdVltKEIFmedBebh0M6BtqIoO/O8G0mYI7hD+h8NSGBhNbGl19FH9nJI
	 AbY02abTn/IaKMQZlXgvKlfjEZLLgXhNZ1Nd1ZiqQwVweJePJzB9OyC0PW7Xhb7X6dowo
	 qNOA+of/RtmYRCHt3jGrC/ohJJquF/jTRQm1kqmY+o5HHL1Qnq3Cw1kxL5LRqpfLbcObn
	 xZrml/FpOu5VByHQDbmdr2uBGPSQvxAoMHqkAuWltY4unH/AoDrngetHmlI0u9Xu+ktTu
	 BZFj3fcv2YWnU1T2LN1xEH6VCQeHpQgHryLWAhB+jK/+gXoeGN7DfbG0BeQ9MKFPNtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=fuxRwIQv;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6932D606A329
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6932D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=fuxRwIQv
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17406595e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283521; x=1793888321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=fuxRwIQvb3e976FiXVMdg6SHXixOXVRaowr68nVfAqH8eD5NAp5N9yZfae163nCeAK
         3VirG4pkwprxkCJreXcIvis41yC6wxi7VWOkv+APQpjpUzAM0N++7QQJcsXzvb5y6Ozl
         EjCL2Xg6QcxRyFG8voCKTvgHx6FBsfIwMNHinOlbHx1tFFBtavnBVBB/dWcoXh20jHnp
         o/pH6f7lcEE6v/5O21q+fdCZietQeyCAo7Fm5DglMPsFgNAeI7k8J44sh7SWip7dCaPW
         /29H05Tz0/gRPDACaQVTwMyLLejGxTm7UcbHWs31e3QN8nqz+zvl1F0U6MomISgO9s0E
         ykKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283521; x=1793888321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Q9s7RMNeWpcW6ZkkIYUa+Y/Qr4kaBiQvLPfc53Zu8=;
        b=ADYyBB08DjedqOoaVtcfgTeXimCNzKjzC5dqjhae4aSAAokMOMG6BtvTxLxJc2lOwj
         35PMJEG/Oc+mLK/U5Gfa4A3MIdrJ3s3+tKmkj537iczrin9bEtSXNsJkTu8yDNa4akCO
         lWhN1XFGEvGO7FgRsigsNxWnddTMr7wiLeqeSZJC6flC5o98/vie5IjnXBm+kSvsYKXt
         hRD30vwL+nsffBEXMXseGq+wfHkSFWb/53a1aEmnpy9Jqk8Uc++8FuD7e2x3kHSq5jTo
         h4L0V4d/57WxdgcwQLg+bIRuPMbKd0Rpu/su/iLmtu9aFOsk69wVF0FKtCdcpFYgDZaJ
         IDnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8ZziBzbPuaNcu70UGm40+N+1ll3wA1HohYBQWIYphpg9ffEQWtxR2C9G+VpcZuXPtWkVTcHbQOi0Nc/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHbq0HTQoDkSF4GET4GMmrZuyYAec0PrQC3LG0wkyaKIVzbv7z
	/pnleYuS5RMLtyifm1BFTt3vm2+kyrLInd85jTeadfLtZc70LCUo9Fn3aII7Hf8VJ+sVDMw2SjI
	mT4tDUK8=
X-Gm-Gg: AYBFou2m9DD8dtM3U48vVBKsWNOYgqzgtaVlzyzbYXpHOJAmY0+EiMHOJ8hMHBVQ1EK
	di16n3QMHARdpZ+OAEB2xlwxuxsIC3oAn/vKHc3sWd0J0qOMiSVs349Xhm2ZfgQYjFbByV+AgjQ
	niRP4LawbXxmJES9w4qoOyW2Q0+N34FhRGLxNmt/t7nUaNov9U2dr+S8xKLLCwYHGETXmRFGh5h
	SGPNKgVuITnWeTWCeI5PZ3Om5Ie3/FElEd44G7nA/hbEdOBXcoP3ryOUlhWhgHFKCPoFqUJu8eN
	2Az2PSc9gH8mR2MDlXpJOFVF4RbIAiHG9zmL9jFQFp4+ixNdIhWiIAzTKf4QrKiDk79EKBV0t2J
	YOm3BRvgwlbObUZfY40ArPjnb/cGT+7DxjkhAElw4374ZLCXuGqrjY1TQACHrM9Ze+3ZIVbr3UX
	VY17Tn3HfG0A2mahKTuwMtrfJNIe+bBsR0gw6dPOGs9u6EezYK9/3RDOJA+Cvz1Xw2LVSCz0vu+
	XHXkKr2KMVgdrs0uYvVfMNnPxuO+FPZ5eEyRaTfhNJrExDMr7bb7H0++Y2TQe4QkDd6OKdlvjyW
	SKFWIMiwYIELj51SF+Zp7uDEX9kXnt2FVlDlbD0hTmO1xo61S65JsxXe9hrOzEzQe0wylp499RW
	XEm9N
X-Received: by 2002:a05:600c:354a:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a9662a0c02mr123628385e9.9.1793283520731;
        Thu, 29 Oct 2026 07:18:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:23 +0000
Subject: [PATCH v7 02/18] media: sony-starvis2: Reorder link frequencies to
 remove lookup
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
Message-Id: <20261029-media-starvis2-v7-2-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

link_freqs_reg_value is table that just reverses the order of the
link frequency enum.

Reverse the order of the link frequencies so that the table is
redundant, and remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index e62cde583324..134fececac5c 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -187,25 +187,14 @@ enum starvis2_lanemode {
 
 /* Link frequency setup (DDR: lane rate = 2 x link freq) */
 enum {
-	STARVIS2_LINK_FREQ_297MHZ,
-	STARVIS2_LINK_FREQ_360MHZ,
-	STARVIS2_LINK_FREQ_445MHZ,
-	STARVIS2_LINK_FREQ_594MHZ,
-	STARVIS2_LINK_FREQ_720MHZ,
-	STARVIS2_LINK_FREQ_891MHZ,
-	STARVIS2_LINK_FREQ_1039MHZ,
-	STARVIS2_LINK_FREQ_1188MHZ,
-};
-
-static const u8 link_freqs_reg_value[] = {
-	[STARVIS2_LINK_FREQ_297MHZ]  = 0x07,
-	[STARVIS2_LINK_FREQ_360MHZ]  = 0x06,
-	[STARVIS2_LINK_FREQ_445MHZ]  = 0x05,
-	[STARVIS2_LINK_FREQ_594MHZ]  = 0x04,
-	[STARVIS2_LINK_FREQ_720MHZ]  = 0x03,
-	[STARVIS2_LINK_FREQ_891MHZ]  = 0x02,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 0x01,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 0x00,
+	STARVIS2_LINK_FREQ_1188MHZ = 0x00,
+	STARVIS2_LINK_FREQ_1039MHZ = 0x01,
+	STARVIS2_LINK_FREQ_891MHZ = 0x02,
+	STARVIS2_LINK_FREQ_720MHZ = 0x03,
+	STARVIS2_LINK_FREQ_594MHZ = 0x04,
+	STARVIS2_LINK_FREQ_445MHZ = 0x05,
+	STARVIS2_LINK_FREQ_360MHZ = 0x06,
+	STARVIS2_LINK_FREQ_297MHZ = 0x07,
 };
 
 static const u64 link_freqs[] = {
@@ -914,7 +903,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1177,7 +1166,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__ffs(starvis2->link_freq_bitmap)];
+			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);

-- 
2.34.1

