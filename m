Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818778;
	b=XIigXzBBH+Py0cr4mm1DDune3gcG73Ftf+kO07TPO+UJwfjKVw1UqzhWGZ8Bqcg9nvIX
	 anxvNpopg0G76rGeIXtwF171mtRPJ473nG8y6SPPxBHtzMOs8YwefKVI16S5CWaZcyOku
	 sOIe6ZJ3zftyDek1OC+Tvqk31a4/JGsUwiK0GXxakKux9u6tbjkQzE0gpBJ1eXfzFWxap
	 bsfSu/f0uUmmf0ImI49mEb5dhGVPECDPVlO7nJy5NMBJX40YWbmpmksaTO4uGeiE8Ha4O
	 gAYwVArCwIp81ArmTSul0w27IUfzffQD4yNUHy2Q9toI2czPrTq6ngiFNgrS/NwKaqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
	b=x1cSWssll/SQzziNirEWBsR0Uw063IOxXyVb41cCabYAYrqNEnpXDQs4L+GyNGbmib49
	 VDx4/VUmJgHv5+I06l9KHhmhUBnRngxB9lMkwYX1Hxp5bwHba5LLmd8yX6XxRPDzljkug
	 E4ozAird7hEkoWOUdc5Ujnu4u0+lzoEtQtCS1HhKyG+p/bYlXizMHXlcXf0ldKChGT07d
	 C1ZuFIYN/g60fZ4m2JIYPvPdMtJLBofbntzhh0mBZ6EqrYVPMAKIHXqHbfqYU2g87mTMN
	 EqLwTpBKCX6SkStOON2BOBHQItL29f+JesAoH4p0dbySINMlexWBJECU3IECG5oje3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lr/ELXGO";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E2A606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E2A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr/ELXGO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so6949705e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818776; x=1794423576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
        b=lr/ELXGOAjrtNQ2piNiebm448JLxZFs3NW41gkD+9o25m/qDzbazqA1e33FD+d4Bdo
         Hzf/vDuocch2IoFrUfuWpYmoju7yM4HntqnzQ2h7WurL8TVUqMIdRk+tLS1ctQW9YpB3
         qq8MbaH9dOos9MNq76/4mBI+XJ0f7xCSjfa4UG/k+9szR09e3FoSYHeOdnnxA8MhcZew
         x0x5JoM/OYIDsk3+pluU+HmDAL+PJNqKi5t6UFuWN0yBLoK6GBEaYPMEHrZYnyyPVd0q
         MEYBzjn4JBA38t6KzASwMV2Uv5VQR7+/PV1HIMOVdTCdoMZtDXrNNdd1xtAWWMV+qjbJ
         8Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818776; x=1794423576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
        b=kjdlDJmzhSXUUk6ved9/vICOg90aE+MHQg+/d0wQ2RYXUTannIiCPBIpPA7pmsHz5b
         xo8Z5+raAjJiTxmjovkYCtAyGjf9LcyiTFKrU/Hoxkvk35Ew1zgy1emoThGWiVXEu6Om
         9XQNMpWY/S/CAGmJ6BGQItbGlXvYdcx3BaPK7JOGruBaMj2l+s07grwx0vlUW4q8fzF3
         HkQFymZEikcXGd+4Az3weG5o3HDuZUJr9pkyZtDKCLPBFgbZ73VicIhzbRLCUbkCufCy
         M1ir9RDVSARh6pyypeimOdojcua5eG5cXD7K6G90qipWMbFun79k7stEr+qeV0wKn4nh
         36zw==
X-Forwarded-Encrypted: i=1; AKwUvByCgitoB0GfYdDZASSWsB+itNURowtKCNuRTMJ7PcFi0k5AX2Hqxbnuyb5wjiEptxUK1rBkndAfdL4ostw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9taB1jNtji9PX8xzETjNsoZ6RbqM3yMubJpAYOYe+5oJx1zj59
	z6eTL+oJFpIT/AZOauMc2Fjotx0gC1fYt4/UWCphslCZosdKt9AKtVau
X-Gm-Gg: AYBFou3MbAw5ysIwFcEqtgem0AGhkbmFXsJvhFRfGR7tje2gu+2iG8KS+2Xzee5ehEE
	hwdRXozlrSr9FgeIdr3TBOMSc7w30yn8ojlFmSCURxNPtJMlJZPHYkAJQclujEdx/Dkvf+6vGDi
	Rqk3ztCysvEDjzO4MzgCXrIVVYJMGGQs8DMoG9H5LEJAe6o1U+WnJX8v4+F5tOZzRdAdIBf9kh7
	U8wG/N9ru8WxpOdFhIgDD80GpHeq2KCAXg7NMF2NNldNY7LMbOnyvs1eHJOT8XFjOi+lIhGpY+H
	EbepaLiNQ9gd5+yEKrXr9bnKKmiFudJX0yRBDfFmoLeeyrAeWjmFmCB2jzuXJGw9+Dt1aBnGJvv
	Km9Hz0kRN/U+DEE6lqsaJMPz36aFiZmkRJMxgpVBfoH0qpywoIn+5GH6KNNrLRFQ15RWzr6bMz/
	vsXqzqRMI36i6mEqjSWzkru6x2UdKQkZww3lat/ERq4JK5Kzdy4f5z4fP/U2JpKij3zrt+7eaYG
	v8Je/A9K9/flpyJDbRJKAE6JrJCwLNIuqHRt7rndqEX/J6xEHP2WijcCdg5RG8EmEpD4fXQcOIX
	BYtUAfuNndqta3VKY7BD33UnMvoCzz6s9Dnzbj0rCRlwUPc1ny/cb//h4+Pg1pefwb7CQBlUr3L
	B+C7qKXiYT+ZrJYNtBX3q8J+JQyrRO3tMSY7dD9dJBMWejTk10fYgzmSwKkYTUr0gyAi3xKBDSM
	B5KrSSRibsX1sxsj2ah3/od/dc3qiaZXdPNZ2HfCZniZmXgJBofVZTl4nga13WMU+W2ta39aCEX
	EPsNCl7YRbNjRT17RUVsPwsjaaPgHAIev91EIXrCHHx
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr383629925e9.22.1793818776367;
        Wed, 04 Nov 2026 10:59:36 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm3598795e9.10.2026.11.04.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:59:35 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: sun8i-di: Don't sleep while waiting for coefficient access
Date: Wed,  4 Nov 2026 19:59:30 +0100
Message-ID: <20261104185930.885203-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

deinterlace_irq() calls deinterlace_device_run() to start processing
the second field, so it runs in hard interrupt context. However,
deinterlace_device_run() waits for coefficient access with
readl_poll_timeout(), which may sleep.

Use readl_poll_timeout_atomic() instead.

Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 65bc426e5aac..bb90e0efa4d1 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -163,8 +163,8 @@ static void deinterlace_device_run(void *priv)
 	/* neutral filter coefficients */
 	deinterlace_set_bits(dev, DEINTERLACE_FRM_CTRL,
 			     DEINTERLACE_FRM_CTRL_COEF_ACCESS);
-	readl_poll_timeout(dev->base + DEINTERLACE_STATUS, val,
-			   val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
+	readl_poll_timeout_atomic(dev->base + DEINTERLACE_STATUS, val,
+				  val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
 
 	for (i = 0; i < 32; i++) {
 		deinterlace_write(dev, DEINTERLACE_CH0_HORZ_COEF0 + i * 4,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

