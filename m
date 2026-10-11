Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20238342C9E
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736802; cv=none; b=RK4lTkwMuRN2XsSrzOR433pCV3uMhgGJhGhzwRnpVxKA7WUUhpXGJK7GrsGXWFc3fy+OuFy8Xcp+yoxy2HSSypiPUObuCMqKtq7ykgzDj9K9NUk2UagcegW5wU+7CndoSKEj25Xkn2aOOwrAeqIV2ctqZTNCh/BJ70EapbzCBPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736802; c=relaxed/simple;
	bh=EhMBg/s6MnYlerlCrlEH8yhUL0K+RB5H1t9NeJh8E90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s55L8WzCdRX+B7o12gX6rW1RCOOXA7MfkFUCR+coiwnSl30DXseznE33GLn7ZnxS76o7XWvn1sLpJswAvi60s6LyIbioRlkvnwL0J4PDCh0Osy6f06Vf5kY1I1wF5BjirBjSwECygV2Jg74rCIN1RiscycXiVkE/G1nXnIIHlrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzkgIWtD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzkgIWtD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so9285365e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791736799; x=1792341599; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cjm6k42dOyLFIbxGk3oDRyKuVo/hFB0pF5yZpJn1l/s=;
        b=fzkgIWtDzSJHcoAEsOgTFoG3s6RmIXgu8OzOsEezkawmiSN//BheWRm1ofTHRtWP8J
         lPOsBuqvcRYxVRydIz+sxfsbchs00e4XjyODgipbazgZo5HRCEI7Qw/StaZyGW2NDfgW
         PlxqlS40e6FIXTaRNxUYToU04D5HECwup44LArHlQCXcAWVdyNxrOMkkO8hXqJxn8erK
         p4/8/wWyiYzlDXUU5aPHta9rKGcGgL55V24RH6fgV0ZlRVxbfCqrmF9RhSs5+1a8kLrA
         5kcza9HAk3PSWMWV1uD9W62YSgs6FkfiVY1ZNCnfNddB4E1wFrkXliMT1jUpuVZ4tgWd
         nWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736799; x=1792341599;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Cjm6k42dOyLFIbxGk3oDRyKuVo/hFB0pF5yZpJn1l/s=;
        b=Qg3o97POd3219gKTwMAlmjGhiK9kzA1OZmUQ0ykdx2/HLqo8Yw+80lMSFwPbm/hOOv
         7xKedpNk69ilk28bQGCTt6ik684EpDe4zUENAP5FE4+bBi9VbPpfP55zbyMy3b928I8V
         o6qEgytC4v11llaSilXk1u0T8QnG30kxaaFIZeJsusoRH+DEL1ko7aIZ5/aD610O5Rt2
         RPPotMOIQYFOtN9cDaHYxUmiKktrCdQwAhz3+8hvuQpdukggl5XjoqyR4cpMyjQopZOM
         J3VC2BvFDUjoA4+2fhQibs5IZYydPj2Mi8OP+kTRiuuvMmyiam/t27HKpd4TGTAw7LVo
         kgrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsdmrwKssTAJwLKUjLAAHOegq97SaMoJyMuXTdI6RlalU8BXBno90SYdBqXhDrv4OFuWSJ2UIixPTPdsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsh02SNN0a4j6qolzpr+GDEAvROkAZtSPyoRBPBP8HCKePjviT
	nKeu523TMl6bUZvPXBd5x3uGfodY69ZBokp1fn+/6TkHL4gESlE0lqNq
X-Gm-Gg: AYBFou2wAOHl1oBC49XC2eZsS148TUDYiMrmaVGLA6lUXLMKeCig+yzzH6fTZUXk6PK
	/qiLd5NDO9L6r0O/SWZXw/9nJEPScvVTQUZd4kFl46srP4h03/kjGaysEhlW4VBVjMvsIXUncgW
	wMgPrReg5ay/2ZMOomnJgWlPaa1CQvSXfOdjzuxpoTogYjf/9C7U7FFjspQBR2bARiu1Dc+lAq6
	C4UYWv3IdaDjBa3ymW6xFN5tnJzOYwysX9vDYYp7u1S8VSICFiSwS/XQKL9OF9aKKeOrWm6TC1U
	xuXRIA2wNZ+0UE4ZQCjv4vzKpfFX56f+lRig77nALBrMIghdNnmCr6h9Ec70zvH5h6OlTlWjlCN
	U5lzmDXoLMe2baU5xidySORFMAsB7kfpdyB4HprgJ+PDwDejp1fjUeOYX7fwKZ9Pp3u7cqnVifK
	SMLn++KmJK/9E5tFpYoTGYv2ERkQH/YMFAO/wl8jj09FpTeXx/fQwK2CbJ1+BQC1W9d2JxT7Ht4
	vVtQx4pRI6gXX9hSwT5qQw8AhAbyGOKO36KnLysoQ3TLMS+/v1rfFZvKhTSp49JyUgzm64BtwwA
	sMTvFHFn4rJ67v8Tk0fhLjVu8wauaepbzh4XPOkhbohkMlQuCT5Dtx7V2ovW6W2ZRxHNy9bcAZo
	4bxsNewcR7TLU8e5jNtAhHmwPssUYXsl073lBNvgxAclie7M=
X-Received: by 2002:a05:600c:8b70:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a18e4a01acmr138567585e9.9.1791736799033;
        Sun, 11 Oct 2026 09:39:59 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm307874315e9.6.2026.10.11.09.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:39:58 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 11 Oct 2026 17:53:01 +0200
Subject: [PATCH] iio: gyro: mpu3050: add missing trigger cleanup on remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-mpu3050-fix-v1-1-f55b0d138be4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0ND3dyCUmMDUwPdtMwKXUMT00Rz8xRTIyPLJCWgjoKiVKAw2LTo2Np
 aAMP5/C9dAAAA
X-Change-ID: 20261011-mpu3050-fix-145a77d5229b
To: Linus Walleij <linusw@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dingisoul <dingiso.kernel@gmail.com>, stable@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791736798; l=1616;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=EhMBg/s6MnYlerlCrlEH8yhUL0K+RB5H1t9NeJh8E90=;
 b=hOSERUJHDV8gdQDBWCvJ8tQg2SVgtaw/Z8hNODJJld+FchhkOoytB/lOhmQWQj+bQDJHG/Mew
 WJkl/KqFv+5Bht20X9dkEFZ8DBHbM0TKYF8XsX4i2YG9ct2Sr0WsOr7
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The mpu3050_trigger_probe() function registers a trigger but
mpu3050_common_remove() and error paths in mpu3050_common_probe() forget
to clean it up, causing a use-after-free bug.

Add the missing iio_trigger_unregister() function.

Reported-by: Dingisoul <dingiso.kernel@gmail.com>
Closes: https://lore.kernel.org/all/20261010203601.1686148-1-dingiso.kernel@gmail.com/
Fixes: 3904b28efb2c ("iio: gyro: Add driver for the MPU-3050 gyroscope")
Cc: stable@vger.kernel.org
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/gyro/mpu3050-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050-core.c
index 07c0f9011c63..096fd0dc608e 100644
--- a/drivers/iio/gyro/mpu3050-core.c
+++ b/drivers/iio/gyro/mpu3050-core.c
@@ -1260,6 +1260,8 @@ int mpu3050_common_probe(struct device *dev,
 	pm_runtime_get_sync(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	if (mpu3050->trig)
+		iio_trigger_unregister(mpu3050->trig);
 	if (irq)
 		free_irq(mpu3050->irq, mpu3050->trig);
 	iio_triggered_buffer_cleanup(indio_dev);
@@ -1278,6 +1280,8 @@ void mpu3050_common_remove(struct device *dev)
 	pm_runtime_get_sync(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	if (mpu3050->trig)
+		iio_trigger_unregister(mpu3050->trig);
 	if (mpu3050->irq)
 		free_irq(mpu3050->irq, mpu3050->trig);
 	iio_triggered_buffer_cleanup(indio_dev);

---
base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
change-id: 20261011-mpu3050-fix-145a77d5229b

Best regards,
-- 
Joshua Crofts

