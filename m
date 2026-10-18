Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F34638A733
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363842; cv=none; b=e+L1xV6fZBQygZxyEiU3GpDTBhWSmVwWZTcojucODwik/163noOkkm8QEyVzWGRad8h4ZX6Hpxyvw+cigkyX9jrIa/ZUFVVd/jG8O81p0nbA+OzaPfaEyZvCMB7/sSJ/H5gbtR4GEW9MnKlOOqdPKbDJ8P+ONY3Z/GR8Zy0JJdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363842; c=relaxed/simple;
	bh=wAG2+e16F6Drh50ImHPYim5t7pZPFhul0mbSJvIZy5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X/Bqu3wx0bPnbMbbhfT/fINUL/TceMx/Q7Lm8bpQ3Uu+mUR8t1XuHkZ8c7H/9Y91wtIWwjT3rWC+G8KXGeZ83oZC4pKkj7I+c8cgvYzcck0pHesB5WDTdkvzj2GueszPr1XClO4W/L0cxBTJGn40/Oli9b1HcQla0cK9wwQLrpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRX9CDkz; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRX9CDkz"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so1045922a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363840; x=1792968640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOHY44T025Rp3YvAKICl0lUZnjuWiXfYQ2c5mIeVaxk=;
        b=rRX9CDkzxaQvtzriaMQ/MdPXkVRB6ZKDrmLR/bNGckpNK0lopdXqo989+trnkbv5Wa
         x51KXMTdXIjVNHe+snIx7gUDmHh5ZKd68qnIzpN3eKoFULLwgxKNwmGxvdDVB0Srs19J
         sXEG789+1AgLclZr5wNRkQrcVB2zYXE3SCnTyiYXksNiaYZGLvdUw2LBXUSzI3BgJAaB
         z6uFqGgcG38bGWGE9t/PcDyB/hTRl12ysCTANd1jGbkNq81qrxEGnPdXLBsvV2zVjrx+
         3k8LhjjiCISEEnsa77Gy4vVmLpZMpkyegtgt3EGaTWY6mjrKZeFt50UclMtbLZUe8RyG
         QkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363840; x=1792968640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOHY44T025Rp3YvAKICl0lUZnjuWiXfYQ2c5mIeVaxk=;
        b=jjgedZvAn1x6rvOFTo9Hn9RfJzoNzanQkqAOSCKEVx6FFg7ygH6E2mVR4zWzYPpiQv
         htRt0xhVVVsqdaoufc6nQRpa3TNDCkQ5VU5uTV0gB1RzoIrQkBBf3mhQlr5dQye2Do1M
         0RIp5lq48Ex/BHDB1pRp06+Fs0grOh9flJntunuXoAUJu8bf9mEbRbwc5i24tMkf+JsA
         1TYPsdvtFZzPR70YnNmfTZvaomDvEQQWMMjWB85jZ4dbd10kMks2z9IJdG0H6dW+D99k
         RvNiiLDEUj3Q7qM5MTQo/RUPIxvojK6i/7YLjSiSkAIl1+fdQlMVKmfrhnPuyOzijlV2
         zewQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTq1PGtIu8NdH+XhX52o3xhlu6+sFs0o8dSdTKqbzfiI0RPZLYe2JrqeciT1fW+Z/9o9+UG9DkGwzYBtc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3Ji9mkDG+5DCAS91kP7nLRE6thyYTy9YkCkr3wbmLmF3IocfZ
	zUQtXVhTSqZRr6A5v5mpwyg2oSdYR4iAYDzo9HXjls0oCoXNQGdForGR
X-Gm-Gg: AYBFou2/T4C4sotflKPRJVbk6rwPzl8qMUiFgMn6RzlsZkCY/A+uYase1GGuJXt2Hvx
	OPFspTxv/9IVEw0894Wo/MZiG2xrFZGXJKJz4IUkPJWzY7dUFwYwkZI6ZbKuoBB/snRjpMQAWeK
	ph4tRc5FzMIqSPEoYPeLp6qCeFSqsRpIrhNTKR8tvxZL5fVT0NIJ0sggyMh+Cz5iBx5wfZs4CI/
	Qn0u1eexF6B3W8v15Y5dmOX+BbeOLFxmR09CGFRbogGMcnp2+kUJ6iVn1PS9hC3Mh4i3Mk2L5FG
	mFf8EEUw+HvBNu6UkrZXq8RRw3lW4ezcg+3/uKEUUlWCjD89WU5AIEUCZADFcsS8EBHM8y1wXf/
	d2mqILUhc2kiNaw4SfiQ/87o/I7+ULMPT08/fd9a9V9ENfign6Wt/75wqi0NFdRylOwLa3Y4zKA
	QsZvAQb8L3WNJ20k7cY/OcNQ+e1iMqQm0/6AnWFGV4BZQSuo1gJ0sGVNR8RjvKkBDOF+B60nrmV
	D1rg7Wd9GpxM0CmDxpPekXCFU5vsg6r+SfbBPvneqED2Ks8FSzD001Sy8GIFvcbparMKI/VKH0e
	FJUXzh05Rb/HZH6cDjkutzU2v3CquVxn+grUFyFzXiSuKLxU
X-Received: by 2002:a05:6a20:eec7:10b0:3e2:2d44:fc65 with SMTP id adf61e73a8af0-3e22d4507c2mr2334656637.37.1792363839696;
        Sun, 18 Oct 2026 15:50:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57268ff1sm3187688b3a.22.2026.10.18.15.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:50:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] leds: is31fl32xx: Fix NULL pointer dereference when binding via I2C ID table
Date: Sun, 18 Oct 2026 15:50:36 -0700
Message-ID: <20261018225036.12000-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device binds via the I2C ID table (e.g. sysfs new_device, a
software node, or a firmware node without a matching compatible),
device_get_match_data() in is31fl32xx_probe() returns NULL, since only
the OF match table carries the chip definition. is31fl32xx_parse_dt()
then dereferences cdef->output_frequency_setting_reg and
is31fl32xx_parse_child_dt() dereferences cdef->channels, causing a
kernel oops.

Populate .driver_data in is31fl32xx_id with the same chip definitions
as the OF table and use i2c_get_match_data(), which falls back to the
I2C ID table when no firmware match data is available. Every entry
now carries match data, so cdef can no longer be NULL.

Drop the comment above the ID table, as the table is now used for
matching data as well.

Fixes: 2779f4724b2f ("leds: various: use device_get_match_data")
Cc: stable@vger.kernel.org
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use named initializers
 v2: use i2c_get_match_data()
 drivers/leds/leds-is31fl32xx.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 285085d27453..1c5169cc72c5 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -574,7 +574,7 @@ static int is31fl32xx_probe(struct i2c_client *client)
 	int count;
 	int ret = 0;
 
-	cdef = device_get_match_data(dev);
+	cdef = i2c_get_match_data(client);
 
 	count = device_get_child_node_count(dev);
 	if (!count)
@@ -611,19 +611,15 @@ static void is31fl32xx_remove(struct i2c_client *client)
 			ERR_PTR(ret));
 }
 
-/*
- * i2c-core (and modalias) requires that id_table be properly filled,
- * even though it is not used for DeviceTree based instantiation.
- */
 static const struct i2c_device_id is31fl32xx_id[] = {
-	{ .name = "is31fl3293" },
-	{ .name = "is31fl3236" },
-	{ .name = "is31fl3236a" },
-	{ .name = "is31fl3235" },
-	{ .name = "is31fl3218" },
-	{ .name = "sn3218" },
-	{ .name = "is31fl3216" },
-	{ .name = "sn3216" },
+	{ .name = "is31fl3293", .driver_data = (kernel_ulong_t)&is31fl3293_cdef },
+	{ .name = "is31fl3236", .driver_data = (kernel_ulong_t)&is31fl3236_cdef },
+	{ .name = "is31fl3236a", .driver_data = (kernel_ulong_t)&is31fl3236a_cdef },
+	{ .name = "is31fl3235", .driver_data = (kernel_ulong_t)&is31fl3235_cdef },
+	{ .name = "is31fl3218", .driver_data = (kernel_ulong_t)&is31fl3218_cdef },
+	{ .name = "sn3218", .driver_data = (kernel_ulong_t)&is31fl3218_cdef },
+	{ .name = "is31fl3216", .driver_data = (kernel_ulong_t)&is31fl3216_cdef },
+	{ .name = "sn3216", .driver_data = (kernel_ulong_t)&is31fl3216_cdef },
 	{ }
 };
 
-- 
2.56.0

