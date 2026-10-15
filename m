Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992DD3DDDCB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033145; cv=none; b=D+ee5b18EdYHCvsJuJHW6PlHxBLyzEVGkYaBlobOcfSCnTx1kGW/g6XQrJrRBvTSbQDy3kLczXSR4nQZfxO+oH9eSKG5Bo4yoOu3g/G2DGYIp8bquHOi3kmrS4iYm7sjTZ9jzDMzLxja6lJusDhtEpsCDCGk++tpdbimpnT1Hxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033145; c=relaxed/simple;
	bh=w9Sx0hMDZcZMhMKDr8/srNZjFfM1ZeiffAxPG99aG84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tzs0sMdpN7IW3x+ytOUwDz0EFYTi0VMirWEaPebRrLCOfxwhHOcYxOl5Z+xj7ErlZhDQhLUayLi9zjEpK6gWc2FB4aLR7+QdV/YVFhjWbz7zcc7Bm5oYAQJggH2JsZN/drJCkBRZCFOb9uC4guuBFJmKDOvipWZyUuEP7fJSuqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7HcQxqK; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7HcQxqK"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-872024e2b4eso1996312b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792033143; x=1792637943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDJNF+I2Vbw9nB1BN+Iq5g2wGAwV9CAQyrrJS3fYQj4=;
        b=Q7HcQxqK9J3QFpJWw6WzxUVmWPzbWDRA3gaUIjplsDX9G4UOMuxOLHRHyKU4eLyuFX
         icJbvTS1gbBUe/lLLKUmXAvM6dDjhb8mqlJlVfpNmZvFIj/f1XjGnQt6yvJbLf/Jyt72
         7R6JcM6w7RIGU64aO7armJ8VeglT7dkZqg1WJVWfhL9BaF5GKb3Bv/aVQDPyHlpzVxUL
         aO1bSXWTCgSoN4JLjeh3Hfe2HfNUavD4k2hdrjJ0CzW3D+Eg8diN5m63XPBg3BhfMqub
         0dt0O2v5Rg/9FfayWRAVpmUNL21R2QK4gJrxGLJgTeot8fSDm5ok8sf5d3S10zkMicTa
         vBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792033143; x=1792637943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDJNF+I2Vbw9nB1BN+Iq5g2wGAwV9CAQyrrJS3fYQj4=;
        b=kaPre/9eTZBDgMRNk6Rco4QrhO6tLJVeM5PbneVSusy6ZmYSlt+Dsf/BkW8chf+4/c
         KfEoWluYhjEXeqN4jC/qtjb5YwgWP8zpUQXdBDoC1JcsKwozsDCQPLr0bau695e2/zq4
         a4/GLWQ5wgbnyz2g+0OeQN4f2vb0CPnbZQJ3GxHAmQTmC6/b5DkBbTO+vj8TxpF8i34N
         RavAla8EdwDlWDmqhNxcCRJvOVBqHLG8WOayihplLJE70CqflSL9JQTUjrdbatUtthEE
         L446ugWZf6I0u+HlZMmiLvfed9En+gCjoEG1GeBSXav7XoS2IIgqkp1+Ay83golNZKlg
         sNJw==
X-Forwarded-Encrypted: i=1; AKwUvBzZNW7psFgHt5Zd2qfMqjP2sLHcPP1kVeYmO+Xooxsx7AFZnUPEMBn9J/DB1AoFQ20b1cSWRiGbXsEVdN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh+Q5uciw75VVfCDX/N8mTwq0nSkQgxkqDgOKTbWXf6hczxkQA
	QxA2bp0VXjviTZPUZ8B4vFZjF7ySRneoMES8bMXJldJw9MS3o2raLIih
X-Gm-Gg: AYBFou18abEfAF9hZFNJMspW+8+brpeE+lcnKhJG7l2pR36KCzX3ErhtD5OjvW/30gc
	Uq6CsFZV7uH6H23byYkuLbA+jv8D3Q13bTucgb2pdDP3pl3KTB85uZfiQJa4NqdKp0tz77D2l+4
	OSIw0Vc7kaOYwQrLk4SOCbZwlRE7GcSNLsnfRAiYrmArhL3MdG+BASzVGfbtmXIxs7GV01eTlOO
	dWCTM93tXtwuqgA9iLR0zltRaU8s74o5nZ2Zy7qF67BZw7P+00ropHfYbfuPZVqm9DhbUfr/1aX
	Vv6tYwP+of+xn46GL+cs0lnKTHn/IAnOwa8tiw8VEUx/P1oAqAmbroh5O3f1RQe5ITjcFtLjHvW
	9Jnyc5EfMClQgIhlFHdRY4TXZmuhNSJ+uAlKb/60+GovpTaUhXwU/oh6b5hMx7hIxlvP8Z205qu
	zKdOycK1f7M6mnTwaB2ZZ2kjVgEM/9IO3uYIhQXaqL1v3N+1CePTYvdSY0+rGRmWbcLS1jbrS9t
	dglHBnFFO5xz8Z3Bd2+SePfINs0ALI=
X-Received: by 2002:a05:6a00:3cca:b0:892:66a1:a175 with SMTP id d2e1a72fcca58-897c7fbecc9mr13948652b3a.52.1792033142737;
        Wed, 14 Oct 2026 19:59:02 -0700 (PDT)
Received: from rigel.home.arpa (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89e45dcb382sm409747b3a.15.2026.10.14.19.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:59:02 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: brgl@kernel.org,
	linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ukleinek@kernel.org,
	aambrozewicz@nvidia.com,
	Kent Gibson <warthog618@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] gpiolib: fix memory leak in gpiod_set_array_value_complex() on error paths
Date: Thu, 15 Oct 2026 10:57:49 +0800
Message-ID: <20261015025749.47039-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A drive-by review by Sashiko reports that, after a failed call to
gpiochip_set_multiple(), gpiod_set_array_value() returns abruptly,
bypassing the freeing of possibly alloced bitmaps, potentially leaking
memory. It is an unlikely error path, but is possible.

Defer the return code check until after the bitmap_free() block.

Fixes: 9b407312755f ("gpiolib: rework the wrapper around gpio_chip::set_multiple()")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/linux-gpio/sashiko-outbox-168233@kernel.org/
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0586fc1f9564..921e411314cd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3968,16 +3968,17 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		} while ((i < array_size) &&
 			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
 		/* push collected bits to outputs */
-		if (count != 0) {
+		ret = 0;
+		if (count != 0)
 			ret = gpiochip_set_multiple(guard.gc, mask, bits);
-			if (ret)
-				return ret;
-		}
 
 		if (mask != fastpath_mask)
 			bitmap_free(mask);
 		if (bits != fastpath_bits)
 			bitmap_free(bits);
+
+		if (ret)
+			return ret;
 	}
 	return 0;
 }
-- 
2.56.0

