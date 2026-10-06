Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313530D40E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258402; cv=none; b=cZHey15AsJ8suWK6j7lytkDdhua9jhOHGZGyYA29rLepWsSmclhiOGOz1KlfHQz6gmYuDNlyN39aXJL7UN///LcpAVHBOkYaP0l62ymRroeRQ0dzKQB//0vdepPtIF+n9ua7gdxCbNcZrG/VlgMDVz38yScTLFlgH7Ycx66zxqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258402; c=relaxed/simple;
	bh=eBFvmjq21pmA2pGC6Wcw1W+08+3/1nTUKpyDzkHMWHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ku/ZU+V7wnAOcslIvVLdRbDgoYN1TBeOl6PieKy86zbqp41/z1bUPmmS/sQ0tgRYArAOHsYLW5dDGqgi1gdlBWJigAt37rj5/itdrK4NjgrgGiS0dTUhza8XJVCaUHgjCKkhZnel4lrOr1D0xgbgnW9pFxgdfhabI85k7/bEUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=CEaITgNP; arc=none smtp.client-ip=95.215.58.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="CEaITgNP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eBFvmjq21pmA2pGC6Wcw1W+08+3/1nTUKpyDzkHMWHI=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791258395; v=1; x=1791863195;
 b=CEaITgNPYgF0NEnWNPboynblaSqXN2aCboKzl3/XxosNK7aStKPhv7JrFA+9jaUKdjA4YbFv
 u10vBbGXkhrBWs0dc9KtGaqdQi2mdyBaIQjHvYqYlupcCAx3HhXqIZD352BnEgr9QgBbooKgBvw
 cmuKSHVPuk3eDOHBdOd6Qsm9sV9oEwP/WkkGzFyyjunuIcmQ61cr3lQT5ZcreREKhn5PmE7W5ov
 k860Rhoj/ce+2DzMPlFYhWj6ztSbH7fc7AHCTcflUAVodov+CA/V+WSUofp6B0Eggq0BvM4TFso
 lU7DlxFJHssfyyaZtbWpTbDMriPqGFGjewpvVk48gOxSQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d11f96695dc40c1;
	Tue, 06 Oct 2026 03:46:35 +0000
X-Mizu-Trace-ID: 0d11f96695dc40c1
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 05 Oct 2026 20:46:07 -0700
Subject: [PATCH v2 6/7] leds: aw2013: Prevent writes to unpowered chip
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-aw2013-aw20xx-rename-v2-6-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791258374; l=1218;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=eBFvmjq21pmA2pGC6Wcw1W+08+3/1nTUKpyDzkHMWHI=;
 b=8jZszc7/ZHqgIMU+o/0gkP5amC/tB9rW0RWSbqbKfkCgE55tFnfP8ilzLJ9qt9WaW8wlAvuOI
 89nEi7Yc67YCwnFU3rrrvdDl9DhLYEk+eoAfkuGwnxAehAOv0cCAsBL
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Replace chip_in_use check with chip->enabled boolean in
aw20xx_brightness_set

During teardown, probe, or unregistration, the LED core initializes
cdev->brightness to 0 and queues a work to set the brightness to 0.
This canalso be triggered by unprivileged user space via sysfs by
writing 0 to the brightness file when already 0.

When this occurs, aw2013_chip_in_use() evaluates to false and skips
enabling the regulators:

Because aw2013_chip_enable() is skipped, the driver then unconditionally
calls regmap_write() and regmap_update_bits(), which perform I2C
transactions to the unpowered chip.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 5d242e2bab60..2a133657d9b6 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -257,7 +257,7 @@ static int aw20xx_brightness_set(struct led_classdev *cdev,
 
 	mutex_lock(&led->chip->mutex);
 
-	if (aw20xx_chip_in_use(led->chip)) {
+	if (!led->chip->enabled) {
 		ret = aw20xx_chip_enable(led->chip);
 		if (ret)
 			goto error;

-- 
2.55.0

