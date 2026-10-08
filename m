Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C368348F84B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452868; cv=none; b=VvcGZZtC1Zvh/8df0s9nVmQYW5jnQ+OjfI6A7NsHXPBPHU6l9s/ry2LSw1oBK12LBbNc45mR+kWvxC0WQrfW0aU+f2ZXwP1boyYINp92ChbvvYSD/NeUSg2J0Wi1y1jAoC5EML1GTwMcJqGfljyjlQFtheUJy+E3nxiUJaOh3xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452868; c=relaxed/simple;
	bh=VhuQUAy0iYkePnS9UnYMTw7EAA57ina5Fp9L6S42UwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smEOhg/koOt3S4/giDUKZsO0+Vlw705wa3YL1BZ8Y3xROYmsvMdktB2NR5MhLd5LYFseiIp5S5ewmLQru+cWAnXgfCI1ECcbLaxlYcvP1OsK86LJhAML/+PP+lGrXS4lkKNRYB89hK+YFXO7xkEzNpkj0xUdYS4ZvXda4pChaqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDRKXZfa; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDRKXZfa"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1794947eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791452867; x=1792057667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LM3g9cT1oIurdiGa40P9tLY9uI4+IIZ6GuNMPxEMRss=;
        b=tDRKXZfau/iq6J5xxgtznCTSHjJcFyBfpTo+LA4RrbXjSM4TP89N3uS0XnjWHKS49N
         8nIqQtWYl5A4ixElqm3M4aU1XpQ279AWiu0AroJk0oX+4w1iB9pidMNDXyn9mIci8QIV
         +IEsDJx7jzv4pdyk47+6Qfo8d8gUTnWDLUguqCf6I7bKshNRwUJhgUL9ab2T790qX2Qe
         90CZk/CVd1nKzXtivtCwJQjxHRLqNpUp/YD2Uw7HiL5mWFkY+nm+zwagKRxAEhdgLg9g
         UVE4IAfkS5wrztpBIz5w9CA9Jt+tQwHILZ0VsYzOhiz42GfRNq1+iwfi2vzdvIlz9uSa
         d3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452867; x=1792057667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LM3g9cT1oIurdiGa40P9tLY9uI4+IIZ6GuNMPxEMRss=;
        b=Lv77V3B6BW0dZ/LnF6IiXI7LddLhV4X+EmCxS/Ri7vKBk5ylWZRruUa6x8g86ZaK1t
         uQFCB9jnefYjwaY/csybv7Y2B7pQwHilZ7mVirNmgt5KDICEPJ8AKUnkv1dk2Y+fcCpX
         lovWM6G9/vK+WG3Kkru3HQuQ/WkkgnkZWGysSGnHi89/HWCCEm9p+qM34L4yd8vIaGo0
         XcAb9Cyavsq+JkBNlMx6Xb02S2kfH8VG6rT8OlFxkjTw+NwZEfDiMJAl5mIpN4N+SL+W
         AEyXkZvToJKe7vbkNlqTMMYZQhFOCTOs8pL2Vo7ZkMZj54nSWkSD42X3ujpkjRN4kA0x
         yZmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9LmXLPCJ16LvjOnOvfxt66J0lWOP82d+JMZhh6oYspTQZBe8FyZgAyaj8Pxq+A53aCCf2+c2C9cqeszY=@vger.kernel.org
X-Gm-Message-State: AFuF++lzUilqtpoYzprrQpdj0N0OxOv/WmhdVlmXdEyS39b2WLwJjHng
	0UIZNZHKUE7WB7K3rhLYPoIOLqUW/GImisMTc+8HRYZW6DP7XenEaGJ9
X-Gm-Gg: AYBFou3wKBHIbM4MQltBbDZj3glEgm0gju/Nh4eAZgZbkfO3Cmakv3ayf1pjYNL75hU
	dhfdkQYjVUZ+85F1zFS68cQEKQkd2EBHbLBJGu4x7qaA40faEMpi6GX85azR5eFjXyPRLvIV1MW
	iLg7vNjoG/HpnIHrsomYiO7xL8CseZqrrBPHbSebsY5vu1qvP9rceRn/EoudvP/M1ZVKcuEoZKe
	2HdVPWEyNP8Z6mQqR8U7adCvfwzFfIFbkS7QmT+ylRmxpLEbL3ecnqKAf0ejxvhZNsqxgfzD0A+
	+pJOHE1DTOFr1FiGvvO6TKCE9DQqQDN/CNUKtXEbi+152hsTj8UEBvAovnCiUmS0hBhbjV0u2S6
	4Pve2e+3z5O1sAUZNZNKUQWlLkw8SZDCh+/cc/GBFVtjlSn7u0ChaIDIveOiIjXqrJVzQtjqGTJ
	9xcQ6vmv7PzvusThAjhJ9CB5gKiBJke7j2Rj70sP1ym0doHMDZu+7MkqpWeu9yq2HfLKkWKyYiR
	+rDB73mZlx3NgoqBskjWmyl7jPoDmrC48cQtGCwWTp1psjPbB4DsQi3Ii+Iz/s=
X-Received: by 2002:a05:7300:3a9d:b0:34c:aa3e:316b with SMTP id 5a478bee46e88-3515de80febmr5607238eec.11.1791452866714;
        Thu, 08 Oct 2026 02:47:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c00sm14994424eec.8.2026.10.08.02.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:47:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Support Opensource <support.opensource@diasemi.com>,
	Roy Im <roy.im.opensource@diasemi.com>,
	Dan Murphy <dmurphy@ti.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Input: tps6507x-ts - fix input device parent assignment
Date: Thu,  8 Oct 2026 02:47:34 -0700
Message-ID: <20261008094736.918137-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261008094736.918137-1-dmitry.torokhov@gmail.com>
References: <20261008094736.918137-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assigning the MFD parent device (tsc->dev) instead of the platform
device (&pdev->dev) as the parent device after
devm_input_allocate_device(&pdev->dev) splits devres management across
two devices. As a result, input_register_device() attaches the devm
unregistration action to the MFD parent device rather than the platform
device, leaving the input device registered when the platform driver
unbinds.

devm_input_allocate_device(&pdev->dev) already sets
input_dev->dev.parent to &pdev->dev. Drop the redundant and erroneous
assignment.

Fixes: 2e2a0db8c88d ("Input: tps6507x-ts - update to devm_* API")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tps6507x-ts.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/tps6507x-ts.c b/drivers/input/touchscreen/tps6507x-ts.c
index f48871767763..e84dc3ea1fcb 100644
--- a/drivers/input/touchscreen/tps6507x-ts.c
+++ b/drivers/input/touchscreen/tps6507x-ts.c
@@ -251,7 +251,6 @@ static int tps6507x_ts_probe(struct platform_device *pdev)
 
 	input_dev->name = "TPS6507x Touchscreen";
 	input_dev->phys = tsc->phys;
-	input_dev->dev.parent = tsc->dev;
 	input_dev->id.bustype = BUS_I2C;
 	if (init_data) {
 		input_dev->id.vendor = init_data->vendor;
-- 
2.56.0.385.gd3acb90ef8-goog

