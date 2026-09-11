Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8453BADA3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166496; cv=none; b=Yowh6zymou8pDcLLVqb3hDbAK6HWJW7nA6vuOsMPCjFpQF6LHTk3ZY8J+RXSVRASKGI8217s3QSntBxfXBOOdHbkeBguZXe/xRrvbjWRsuoZDK8n5FqXeTzHZkrcV7zanb4esqYwpS8eqAoKI+UYNiVzzFmSKQMafe9GeXCEwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166496; c=relaxed/simple;
	bh=MhLJ5BvVjWRN8oLtBAd2Xlvavj+XwtyxmKBO8k6WGAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fLcKUwEaRPJScBwYs54e3ywD4NLPvpf3/bpIS0NJ+wkk8EAtaswwQLMpeq8tzOT/ArHhvx9cg+o0TSl29SxCNSUmBe8Znramy0ANo4EhoXFr9MfcEPyziDRnlQNb1xhDUenyiuUu5riIZlnqOpEYKDUdWsilhXAITUUcVwpRIeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETtNeXYo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETtNeXYo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so2987845e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789166493; x=1789771293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YyeJ0s48GLoI7gQyBPAOVK15je9obJPZW7Mi5shyPSI=;
        b=ETtNeXYo9B8GmfQ2WUv0qHO6juNtSGhadadtw5QGxYvMnQdrHW3HiioxkaISqlyNy/
         DIpMKaTYkq7KXGxHbddMOUmYu7L9r0wxHaeUEQkP09EhTuTvMyQ95uDo902xkrvESWMz
         1CZgIGygpXBFPq/9cHTum4IQRTgDRd6u4jjAeovdcaSQ4MqabOH/Y5Oro1rZ7KO6chhS
         I7E+o3UF2kWAUmjfhGyhktkp3homUtRHt5QGRDb5FSbAY9rvc5Iw6RWns6V3Q2QVxUGx
         MN8PTokg4V+nH/2L8bzu45DvslgfNCUY9wUMb2crLdxsGqHge/U4DG4zkQ90x7V27Xv5
         UH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166493; x=1789771293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YyeJ0s48GLoI7gQyBPAOVK15je9obJPZW7Mi5shyPSI=;
        b=hXX7Bm2aiadMgozyvbOA6qK8XYFPrT2gRq1g6PewynSVxd3tjwTyKr2QIlziHI1LDQ
         Ual9b7XDIXA7srstrjPuJOQY6vNTYXDrP/Av1gsfjUHkaoKlh/61DL5LaWfy9xQPRaNp
         LmJAIWIlxA4DjLh2jRyti3Ru8FAvlP23ge3svrY02TOfDabAbb6vcfugC+jSq03gvQZv
         fFx0Zx/c8kYvxhKnAj4WW63DiIRRjpHfGHeZI1a8EDSkuiSzwDYjOTCu7kcYFms2/wun
         DYnGj5xLrTNw+xsWHbtQron1e/8YsQYLWkm617i+nQd5wnA7bnyUBYKtir3IPQDX+c88
         tFAA==
X-Forwarded-Encrypted: i=1; AKwUvBw45x3hW7k0DmXzFJdTjW+V3H+wdwHx8X/26o1TS9w7qqc959Svl+Bz8Bf9b2o9B0xwwnxdyEDLtVRgA3A=@vger.kernel.org
X-Gm-Message-State: AFuF++k9XEbmL/Qqqlo9SI1S+k+11dllfVubmOxFJmLIheor3mH1OGZ1
	1rqugjn3BZdrhx5vlO/X0mW4zuQS1Bcil4iS9L1p5b5QdeJilwZUlA8F
X-Gm-Gg: AYBFou3gWSgukrxLBXBkhGkrS6vTVTGHma5teAR+GxAZidRjE51U2jkzR8z0JvL9qdc
	Cdlao9tIvxVISqQVFROZAqkBvg1Md3DJaBUBjivPU/GNxKvUBZSoHudKYH8U/sssgDyEMULqLuU
	3TAWilmAU1h3Ms3JP43CVtBzvutI3G6cl5ztIXdSoq4/0zDY4gX3tSsOutGIzTGL1eFH/hPTTzt
	BUWLPnpIX1gw4mmQjY1k1Nho9WfTOoTMM7XDsHnMsleTAeRp1SS34uVoqzLjTw1/24m4X4ogsI8
	y67Zxp6Gt2yVQ3W9UpSQmHOuxuELkpOjnOKX7iHcc4n5BLNe7L8vIBfiwOOjkDSCmwDYCh/icCT
	n8ZZ+f97i9UMvagO5IqoSXo02l6vvt/d/25UDoiLhw3C2c5vz+38glxPQzFSAzTLUxGKvktCa7L
	0aUfNkddY8Av8TuweTaHzAFHgmEz9yoVD0850iZCTR7jzpRWtlL+bGIRIZJYRmo9Roll4hzs0EB
	GNj2zNBpYVRI+l2QZfLVz5nOTbu7XhktW1blkH3g5ABlDn88enYzZ4miyUIDFMAvIVL/KaBGEJF
	MxEpMNlTVcrtFj+6CwtYQ/1V75t6y3nvp8sX
X-Received: by 2002:a05:600c:c4aa:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49e619c051amr71747235e9.18.1789166492619;
        Fri, 11 Sep 2026 15:41:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm145664735e9.4.2026.09.11.15.41.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:41:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kent Gibson <warthog618@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: uapi: Fix gpio_v2_line_info_changed reference in kernel-doc
Date: Sat, 12 Sep 2026 00:40:10 +0200
Message-Id: <20260911224010.10393-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio_v2_line_changed_type comment names the containing struct as
gpio_v2_line_changed. This was a typo in the original GPIO uAPI v2
documentation; the struct containing event_type is named
gpio_v2_line_info_changed.

Use the correct struct name.

Fixes: b53911aa872d ("gpio: uapi: define uAPI v2")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index f7cb8ae87df72cc3f35b0619f3c3c95798009c5a..7e77bb6bfaeddb72d33e98a0171925f1cae686f4 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -232,7 +232,7 @@ struct gpio_v2_line_info {
 };
 
 /**
- * enum gpio_v2_line_changed_type - &struct gpio_v2_line_changed.event_type
+ * enum gpio_v2_line_changed_type - &struct gpio_v2_line_info_changed.event_type
  * values
  * @GPIO_V2_LINE_CHANGED_REQUESTED: line has been requested
  * @GPIO_V2_LINE_CHANGED_RELEASED: line has been released
-- 
2.39.5 (Apple Git-154)

