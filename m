Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390B53AA4F6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210835; cv=none; b=TUtq3eo9fPZRYTLcdZvqs1sx1Lcwlv2qW4Q/BDt3YxkUg3j/FJkbPbn36YKJYssb7rI2wuLS7UXpcnRY9JP94sZ6WSSyxQb35t1q+t1vY+BeDLGJWWOJWrW5rBi6soLlOaezebIA06Q3gDGP2zUiCrrhc/f0kQT72dhrHaTGpwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210835; c=relaxed/simple;
	bh=zlCbSMvrlfeCqiNJjQxZkS1vJbSrxoS9NwpBsjGk91A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7Zh45Fs1LG+O6dp2IFR7Tzy5X4ZwYOYrBYJvmskUW8zdMR08X2hPt4ekc6b08PW0697A3jF2R6EwLcfAsaCnudgqUzAKnIbdm/si0edSIzzxC+16y5azpoWc1pxhMoXL5zgxuKmiePCNBbimaT2ORlgFI+vnYqsBmH46mb7CIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YChxMGwu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YChxMGwu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4957eefd361so1421875e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210831; x=1788815631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZoIiBSeFcsiK0IdQaOjt017+Ix1aMSbciAf6wb0bRI=;
        b=YChxMGwu1GrTaT4pmemXyK1RMCf5IvJuWbjNmMVjKSVY0hTnto8eHOITfY0A9s+w8l
         uCSaLW1AeXyOnT+SmQO8IeKQyVBs4trYWJRAXHHY+2Uj6FaJevLoZlEgmNblJpWVH/dJ
         9XpYBTSVz6jWv2zCOx3wJFLuBmznlmB8ndweiHiePzayv/xRONlZpzyvL+pO0XvCJAIb
         +0D0rMZsWgfwu79sqvGpVjaB4SbMQo0i13Wswx4OMXvZyhpbHBhiwQfqfw473UudbL66
         oalg3nLihYIowRVQLgH/P/pUXzVdn+05fIQUV5kS/j7rT1Z8qXyR1W7xHTl7G7uLRdkX
         /juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210831; x=1788815631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZoIiBSeFcsiK0IdQaOjt017+Ix1aMSbciAf6wb0bRI=;
        b=mC82YmALWCwKs7wnG1d+Qbee/cTkuKUd2yvDlY9Yz1ViRPiqM2cA9/ka5KQSkHp8cz
         hWrzGCUqyadQOEUc3f8tvnBe8hvW7UVSVAqBhNP4qh/kR0EcmMJntqu0uRL2OjIIh+ok
         eUE0AI2dMAs1CPi6l+uaVasuAh8wIBKd0/RoUEyf1CaGAn6QYFC2EOzarAkPSpPphvFZ
         gwjnKPN4C+it2VI6EyeCBhOzJy6JsBYrI5DdqVmGhlGyLx2uJJe8DCoDCKXaq/GUMRMd
         Hz0/x6YeCeM0+xwnFfHK97/F/VnIWH8LFkUNBJNR46Bt6Mq93QiVazw35PD/ChxlrkSk
         8T5w==
X-Forwarded-Encrypted: i=1; AHgh+Rql6tZcVIsfis4Ne/Othq3qmktAhm8qYpjn2DmkKqQtzN/pYO+By1TSGPQuuUB8QMLf6ZSfhOZYGAvWBzc=@vger.kernel.org
X-Gm-Message-State: AFuF++k27BdjYJ8CBDx/GxA5NNjPoCbxjyKslzTO0O7ZAa6BkA39qefX
	/xEpAlBHE1MQa5cPiPBoD/JTdlgNolQRYGEdfJOTg2P07bHzVIGmwXrU
X-Gm-Gg: AR+sD132KM8vQdo/lyk+fCmzPsPNNW4E3s0ZA0DD0y4dqJ2SrEenb3vH3BBDsP42JGW
	X/xPNS+viPzE/yb8hPq1w2ld4CMdXy0Om0AXbaAeZSTRWZ+rC/7g0n9ZexmVVr7AELEPhvWz9s/
	fte9xQklMSo/eeEL43IJ7JwpLwMyk04Eex+wv4732Ykrm91w8Sqz+zy2Qx6vYecW0cT9lskS5pO
	3rL5pv58ukF5aSG5nIvW6SkMKR5vB4BrEnk0uFBRWdf53KR7lqAE4IJWDapba63EbOoNQ1SCRjk
	dkXPMuaaSDk8qJVOwP4Z9WSXtm7MZOO+wpM8l2T6lTQHVNv7MdOh2vbIF5J/+iNLsTIZ6YihmIs
	cIMWar91Hdnh8mqH9IUUNxbZYylMf67Wft8p37uBUbT87na6myulMDU3SJNWAPVPpzHF4kiCk24
	YfwVlYTySyfS8FMDKi7DeujJ4WwKb5r+Ppnr9rqtVIO/+9SQDR+HxBd01ZCHTWgMz+uG3OmTSyn
	wiwMMs4/vNjhFyVQ5/z9zHo7Ibp11xiJx3y6OMbKmIV1mLTeZfh/fIHPXVJcsOme9DKSv7Vn8K4
	mthIHisMCcVMHOXXC+sFLxOuJZY8KhW67BpkQswXfczqpwKHWHaDGSepoR20IKRy0YsY9xpq3+8
	/c3qe6JvIU0uLUjs30pVtQRE7
X-Received: by 2002:a05:600c:8b42:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-49b91c57d64mr469951045e9.15.1788210831303;
        Mon, 31 Aug 2026 14:13:51 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1754csm17695925e9.10.2026.08.31.14.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:13:50 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 31 Aug 2026 23:13:39 +0200
Subject: [PATCH v2 09/11] iio: temperature: tsys01: make headers conform to
 IWYU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-kernel-header-removal-v2-9-b92b580ef5eb@gmail.com>
References: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
In-Reply-To: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788210819; l=1547;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=zlCbSMvrlfeCqiNJjQxZkS1vJbSrxoS9NwpBsjGk91A=;
 b=oTABnNaL1RNH5TgvGZY7KHvLgvYQ0l5Qw182/IOVyeYvlMg1T3sj50D5/+XwHBXL9+op2YLK9
 1fqt9Lkj46OB2X25o2HezW37n2wCmgK4Owfz7u2UgpnbC6A7n/SPTKE
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Remove the catch-all kernel.h header, add missing headers and remove
unused headers.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Header changes explained:
Added:
- <linux/array_size.h>: for ARRAY_SIZE()
- <linux/bits.h>: for BIT()
- <linux/device.h>: for struct device
- <linux/i2c.h>: for i2c_client and i2c_device_id
- <linux/math64.h>: for div64 functions
- <linux/sprintf.h>: for sprintf functions
- <linux/types.h>: for fixed-width integer types (u8, u16, etc.)
Removed:
- <linux/init.h>: not directly used in this driver
- <linux/kernel.h>: catch-all header no longer needed
- <linux/property.h>: not directly used in this driver
- <linux/stat.h>: not directly used in this driver
---
 drivers/iio/temperature/tsys01.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/tsys01.c b/drivers/iio/temperature/tsys01.c
index 14de67ee8be7..b19b4a3ef038 100644
--- a/drivers/iio/temperature/tsys01.c
+++ b/drivers/iio/temperature/tsys01.c
@@ -8,12 +8,15 @@
  *  http://www.meas-spec.com/downloads/TSYS01_Digital_Temperature_Sensor.pdf
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/device.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
+#include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/stat.h>
+#include <linux/sprintf.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>

-- 
2.55.0

