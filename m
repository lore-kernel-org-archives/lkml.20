Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE945A0ABC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069534; cv=none; b=bpJ4wtVPIvj3oSHpmtmA0yRSjTq3y/5LK70NYztLDhRLsBxdrAap0/DhMXLK51rejA9jxSKumbctlvaai5sbBbtR93sQD7n3AEr/we6fTcjESgCrzzCZxEFmzw/mi6ZyMJQC6MDh/TwnjDWl/O1ZWYjBMjmuQXa0jAnrvyczaxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069534; c=relaxed/simple;
	bh=QhX+SC0aYPRnajzGgZCAyqZcT5ZumThFwIdRLkM4lt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FSw4cAW4yjL8RgVhTiF4xNWl/XyU1IG3Hu8GDvwWydnA8h0ZtAvPoCO4uIv5uWvntQs3tK6R3yDp0s7OSe76JLmwvhFS8pyMJQv4Wr/3jFrpsRCHaVs6Rm/E6ywjIdTTrD37MSMT231gnCUny/L2WAufDPTUEY55aKnqddqkJdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQ0uh9fu; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQ0uh9fu"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91034716d1dso814376d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069530; x=1789674330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/3ZGdaWGihAcbh8PThygY3ZNQwZqvA2jilmZZCQz4o=;
        b=eQ0uh9fuf2gq46Jh/5Ao8dtwSXCVkVWM/yBJdwzLyvp2bTmGEEvIjYh3Pn5Qh40nYl
         hZ9jHtsgpNA0gZyYeQMUGfdWINb88JnIpTanKK6hNdXKcIdlv46qtNrLU5J+xD4t0vCz
         MqlDPXr49SttkxfiDsUsQ8uFLfWuliDO5PUfgLDN6TjlKgkK2TWTnVZZXHdQgG2g34ud
         KAI6m/TKMgXrlcNKkZqWFzJK02IqDE39VqENuAM48stJED54wVgZ5M9pvZJ84MDNGhQf
         rLsKbbtFOebezTcmITgtXF4RG6npZcQKZcpg85wfhpnXY5mmwfjf7nUtrvPTKE6rhaYO
         LPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069530; x=1789674330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/3ZGdaWGihAcbh8PThygY3ZNQwZqvA2jilmZZCQz4o=;
        b=a+swpph8atxCIXzqoSsohOttDcBZ2xTySgvKWWaAVGxqCbYG14BJyuPiuUtJXjQUEt
         ppPCh9/JE0SIwnTXGkzSD3OF2uCAeaYK8Z2IMIhk9oSLBSvfHPTIPEePJHOXsfCRJN5l
         xKuHBJp95qQY6K/fXGELD51S2By1aNOGA/Qo25gxDOA2R2RUboWHE2ADndPZYid0ofc0
         X4zkrBm8zxmeZBC+t7LURqM1Nyf7d+yJCYzLaC7P2neCm4o0yhMt8gRjD8YhSjWusU6c
         6l6l+eZI93Hgcn4Wnv78DJoed3SkqynQHWLeKFbD+CO7tBeEpjXHjvR5rA5CsIwTCB4F
         2NdA==
X-Forwarded-Encrypted: i=1; AKwUvBwDll5sZPqT3O1zwTeD5LCuAMNhLNMk/cQV9g/5DBdqmRr5qew6IntP5rHgVif94tdhZeehEYDTjn/BYdw=@vger.kernel.org
X-Gm-Message-State: AFuF++lTJBLiAOkz531LaMeu4M30+PGzdOdQCfG1J7mpNhQSaZ/6Dg7b
	pY9xwTmiT7fzka3nqEh8GJrPvW2Mq0T84grfJDxwhMVF9a3CvWDpinE=
X-Gm-Gg: AYBFou0eAxvDh5f8ssilDCx1Gncy4dCbZGzX7vPSs9rLGhq0wCkLOgTLn7HJF+yu70U
	z76KyWErZ4XPSa5XuGhEpuTEvJ2fXpYfnRcs/ju7aZh/6UvbUXfq0n5Ga8lcuvvXgGJLIu4tf0O
	s+fspDp20DJh16dGpyIH/to9jNnDsk3z3QCq3shenrJx+1bYnJUUa/hryNd/YxDtRs7v7QLUNOt
	LZvCxXeUi8hT30LDMoPVu5yWhTAmCxGPqdyCz2DAS76SLLkCsPqS38ghv76SL6yDQTnatcY0A+R
	QG4YS0CAQdju0ikB8V8Z/+X4ElMu+EYKm13WkkPpU43qmenNJcu5bLE2DHkKKH8lKFefC9NVPH1
	jM85rmUv950fXIdnjHs09cRrbpPVwWZZcHe4pwcdIFGJIWuIlySSOLmksfGL3M7E8FRAVYmUVdS
	/sfV6MaRHw74mYPRUATkusBaBzmC3APN0hk3ZMvIVBqQqpx95Q9yLkgIG6DDx4Qj2i5LtHGC+kb
	RjPlOC+iIeWgTE2YqbZmtJjS9KVmCeeRpfptf/0CkevJWmBllVvK3IHUj73hSq+b4CJNi5OHv4f
	xBajB97/6WLG8SZXVv3/lUqIuLTzGRSGsA==
X-Received: by 2002:a05:6214:3218:b0:910:42f7:a111 with SMTP id 6a1803df08f44-9121208900emr5796326d6.15.1789069530089;
        Thu, 10 Sep 2026 12:45:30 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d89f9sm3530526d6.47.2026.09.10.12.45.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 12:45:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] leds: ktd2692: Pass context to regulator cleanup
Date: Thu, 10 Sep 2026 15:45:25 -0400
Message-ID: <20260910194525.99654-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

regulator_disable_action() retrieves the driver context from device
driver data.  However, ktd2692_parse_dt() registers the action before
ktd2692_probe() stores the context with platform_set_drvdata().

If devm_add_action_or_reset() cannot allocate the action, it invokes the
callback immediately.  A later probe failure also invokes it during
managed-resource unwinding.  Both paths dereference a NULL context.

Pass the already allocated context directly to the action and retain the
device pointer in it for error reporting.  The context is allocated before
the action is registered, so reverse-order devres unwinding keeps it alive
through the callback.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: ee78b9360e14 ("leds: ktd2692: Fix an error handling path")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/leds/flash/leds-ktd2692.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 22fbfccd4873549baf390127d2f7e9aeb9c45465..43d4d55503ab50c6e31b8e83eed430cc33e014e3 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -69,6 +69,8 @@ static const struct expresswire_timing ktd2692_timing = {
 };
 
 struct ktd2692_context {
+	struct device *dev;
+
 	/* Common ExpressWire properties (ctrl GPIO and timing) */
 	struct expresswire_common_props props;
 
@@ -196,13 +198,12 @@ static void ktd2692_setup(struct ktd2692_context *led)
 
 static void regulator_disable_action(void *_data)
 {
-	struct device *dev = _data;
-	struct ktd2692_context *led = dev_get_drvdata(dev);
+	struct ktd2692_context *led = _data;
 	int ret;
 
 	ret = regulator_disable(led->regulator);
 	if (ret)
-		dev_err(dev, "Failed to disable supply: %d\n", ret);
+		dev_err(led->dev, "Failed to disable supply: %d\n", ret);
 }
 
 static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
@@ -233,7 +234,7 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 			dev_err(dev, "Failed to enable supply: %d\n", ret);
 		} else {
 			ret = devm_add_action_or_reset(dev,
-						regulator_disable_action, dev);
+						regulator_disable_action, led);
 			if (ret)
 				return ret;
 		}
@@ -290,6 +291,7 @@ static int ktd2692_probe(struct platform_device *pdev)
 	if (!led)
 		return -ENOMEM;
 
+	led->dev = &pdev->dev;
 	fled_cdev = &led->fled_cdev;
 	led_cdev = &fled_cdev->led_cdev;
 	led->props.timing = ktd2692_timing;
-- 
2.50.1
