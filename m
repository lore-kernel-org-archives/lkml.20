Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002861FF7C7
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788116047; cv=none; b=JdHrQ4R3mMKtA/RABlrWHLTuitV16CWNTy8CFDUt+FlpmDTGSXhs6SV+BSUw5uXF1N23nCGiy8CQFqPX1S9q7J692uei9TOdUd71+kDHGFNO1F/kfXabmsg1bnQGJTAmjvksuGneUnkH0Ur2k+WhQ1g1H3cxf7TBKRvT3x+heO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788116047; c=relaxed/simple;
	bh=G9R9x1h3gOGXHwUQ7Jm3JXDD+c+UzZ2B8yR3B763DB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h8YbX3MOzXUWRODy1KR3wPpM9+9x88k+K1l4b47EWrc9fw7FAuAHJ2HkBYVFfPhVb8SwgyZvvUOWvOEc4eqllKTCIp/L7Wj8XgyOCqpL6+nhEn6htmRQQc7SUuq598SI9BqxSh1t6m31BJTZvwYmKql8MTJKR6V7eWWaEL3/A34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjnd7Q+a; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjnd7Q+a"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2160803a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788116044; x=1788720844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7cyfTkCtPn7AmqDEgml00QrDyZ+ySqvSEbLoL9i0Ys0=;
        b=Yjnd7Q+alUPmzEQ/ckHpHxn8p2icg/iH+V3YXgJlXv7K3CF8DCY7Z5xxZ9sHBpsC8s
         h0y4ZgLcwZUHX2F1EmREFpmJgo5vDyfaCwOc+jCBAroZo6ea4GGEj+HH4BZMhElTJcGC
         QK2UR2KtVa2v2ANmD65z0ZafA3Vla7hcJghZqQqGB61EQpmHZeR6OR71VJzw9GF3chkE
         Yn+Sw2egbkIhZo8vlJuJiDYrEnKpm8CjwVmugWKGfBpJnFhqYrvYhYXYFETtQZasWjho
         nQfGRN5k4Hc3XQIwV9AdMOY+ja8w7O4FVjm6Iy4eHqXahuxEoPU2hNxffvMSOXdxIlcH
         Myvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788116044; x=1788720844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cyfTkCtPn7AmqDEgml00QrDyZ+ySqvSEbLoL9i0Ys0=;
        b=kQyQfYiPiV2NJeJCN4sjW8imRwUSo4ugXjgvPlBOU4hgu5YWl2atXH94cphA/GG7W4
         jpZ/kF0WaT7bULnQsDQYdKKzxRtost1/HIqXolt2DfwNGOgYH5505EwV5yLSYZ7vnT6p
         oiPuWrCu/kMgiw6g77zp2NQNyPngmzZePZIGWUcLokp/aVWQDjiDWmI8ADVTGUewLV1V
         ZOr7BU8rTRfx+tQyP4AWE/6QHMF3tMs2wazun1GLdW+4cs74SAQ+A/lYp9GhzPr/3mls
         GwYD3nn5kZWkftGqrgn7VpHDFJxe2JrQV0m9bBeHfgTdfeLkM2sKNrLn+hWh3I/lbHwg
         8UKw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4gytklCt0Qw1n/eIWGZWE5bRlrt+jwVYnmGb7JY71AGKbt8gvfXFg8s+rjBZvL80J9XDfWMrgz0I47oQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kuLo+ycEcW7F7iYe4Al5TVmoM+T5480sCZTLHk/7jgC6c4A/AH
	Wde0TFOwh3ScSoYZL/jc0KV9Yd71T9YkHvyE+pGvCfc8t+BsN7J3dag=
X-Gm-Gg: AR+sD11998YbL+TcRRga3CmMLtFR7evG10yxF83XQYg9j3h18TNWXVUtlYFsXzZ0M/1
	MXC3bpTxr4mBDO+5lPnl/QIxpGLEvVVZ2HO6jyOOLeQWH3fsUb8vas/AImg1t5TDYL0lrkXrcTp
	jgfiLH6wtFhWOPZpRTiB9cDJ97W/cQ5Wuc3+C7grL3Pwrvg8wnsltrIaHjeTXuFWu8hnzWraLCL
	rnlpD7WPNfnTtYiEZ76XwkWLxgfXVz7KRnzG+sq/DNefXAxgvOg6VU+0CeDY9s2Z1JSMi+ATjvU
	ipJGV7Zpg1Yc6GsrheTefbOJbPGzg73hQ0trKYomLmy3Ptp8BTgkWJAvVz6TNmh0wIIk1SE1msJ
	bNCrpaoNK6IkfxWqaNemBWbNz5t9KBDr7BrGRFyonmBKNiauusTfMl/wtr6ZzgtvXj/LIthN7/M
	VAmHgEesK4WWXNKJdJ7dvmpOZjzTI/9bzuzQ78ZpbfEhQbuV/apr4qx3p3kjAXuGna8/RdBZowM
	Q==
X-Received: by 2002:a05:6a21:7a9c:b0:3d3:ae0f:5269 with SMTP id adf61e73a8af0-3d3ae0f5ee0mr20393866637.21.1788116044242;
        Sun, 30 Aug 2026 11:54:04 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6496:3266:4625:ebf0:e422:3504])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36e8ee6sm3030170a12.26.2026.08.30.11.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:54:03 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH v2] iio: light: vcnl4000: use sysfs_emit() for near_level
Date: Mon, 31 Aug 2026 03:53:45 +0900
Message-ID: <20260830185345.2209268-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sysfs_emit() instead of sprintf() for writing to the sysfs
output buffer. sysfs_emit() is aware of the buffer's PAGE_SIZE
limit and is the preferred helper for sysfs callbacks.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
v1 -> v2: Add #include <linux/sysfs.h> for sysfs_emit() instead of
relying on transitive includes. (Suggested by Joshua Crofts)

v1: https://lore.kernel.org/linux-iio/20260830054237.2147950-1-donggeunyoo.kernel@gmail.com/

 drivers/iio/light/vcnl4000.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 336468d59ea7..911f8d1c74d4 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/sysfs.h>
 #include <linux/units.h>
 
 #include <linux/iio/buffer.h>
@@ -1504,7 +1505,7 @@ static ssize_t vcnl4000_read_near_level(struct iio_dev *indio_dev,
 {
 	struct vcnl4000_data *data = iio_priv(indio_dev);
 
-	return sprintf(buf, "%u\n", data->near_level);
+	return sysfs_emit(buf, "%u\n", data->near_level);
 }
 
 static irqreturn_t vcnl4010_irq_thread(int irq, void *p)

base-commit: 350d1fb9204b13c5f95e511e98b8bcb47574d425
-- 
2.53.0

