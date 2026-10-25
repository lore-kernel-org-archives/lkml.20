Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955018;
	b=ciLJZ2AGu6KGT1hAc1fRulQq6r2tof8996lfV0bQs7UUEJjnFxoYYKutXKtCSNjpGQI2
	 I3lhvDHlDGiPH25FgSoSvJi9St5sNeNHJUPGQGuDTJEppqEqO6/rEfxny44+ct1AqAyB0
	 g0hmynrbRv4QCDEIQf3eFhmguqWInyvPAhfcyGLCeHHlHeaJUlW7zSCI8lI9M1UwCzF+O
	 EF2vz/MhM2Fcm/FgPOnk6JQptzSfCFMXClRNfxikH9zQpKbCF4wr9BV0GdX4lCcolvk9F
	 3+HJKFdka+e162d8VyHh8RtZoYjQH+TuUybTQAXarZCNIh7DP8g2177nroSALJ+KKFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c2nQBlsttnFwE+wFd1Y7XAl/9ctYoHY3LHuYcwEyhS4=;
	b=O9tbN7GwcP9Os2wr5DyXFoH+2UMBCln+7muZQPJ71IQn/NxDKFHZTpkytighFQ4Tg36C
	 YCrLRlcYlib6PJHOvdCHOhagHuNOoLqv0qn8zg07rvlulYu04NAF3WHUGtqXuMCY2m+Hc
	 WthrHBXMDJSfvgkZst3BGW1AxrUwJzov646MABHDmjfmFxuYL5XAoJ3K79uSA+cqroWeZ
	 Xfn1BUrsN3hPGKiP4Cj8qeCn6bPVPBJS0VD2huyOD2rEDqSVljGfxtzMhYdrKq6l2ldTI
	 f1SHGMWj8E9x18QoGG6k7zNkl+yDVSU88H1HnQxt4aAhi/ozy7h1kLG909VLmrLg04w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q8Tu0KLC;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD37606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD37606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q8Tu0KLC
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4677aad67bso249258566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955015; x=1793559815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2nQBlsttnFwE+wFd1Y7XAl/9ctYoHY3LHuYcwEyhS4=;
        b=q8Tu0KLCDLousqREOj6hP3kA8Y8qVrt/ds1YYbgmEUDRVzV3kcVwZ+XPvgdCISoYy4
         LnJ9AAQJ/DxIUfJlDm+3z8O/KGKa2YMshGLr/rLYp3p2tpnRRJZTwaS4F6FT6wjOv4ur
         M8UG7yMurkGOh1clcaMCKqqMawp61QLRPY9WDixfMR4WST8fMMM2tFXNRdNlBhoAoXJd
         RProvqoieAJg6SY8HbwKDtXDsa1+9LjZY0YRdFAn3njBZfMAHSvKuvHIBVcbDetbrf+x
         fXLDhrWx8KP5JnpCL5/XrVKfTFToEV/ZoFiNE7mmq307ZJN4AIJ6M2+J29QIcYGQGQwb
         JnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955015; x=1793559815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2nQBlsttnFwE+wFd1Y7XAl/9ctYoHY3LHuYcwEyhS4=;
        b=OI5z9H6YAVaNBNkbHQdKWK1u9EpDono1nnjtQ4it/+jfcdjUkbvJv2b3BfldNjx9TN
         OlbscrfVqIjXqhY3zUTC+lTOoosobKEb9yAB8XMjQSrv5ZioyibqrTC8bOxG+cF9HMpd
         BhII7PMtJNfCbBEdman1di+IXmhd/BKB6cIiGVPA6y5lw6LRP11aiR7akrO4o304M91f
         1azX2hd505hqrOZPCZQnm74Xl1XkX3u1c+jXdfTxiaGUaM9YG/DAQO7zRe4QsAaezNVR
         MZ/a1ZHI6VjVDswaU6OvQQSq+dO2l6h0f320hWaHQPKTjHZI55iZtRR5W+XKP2rVm7UR
         Z4Sw==
X-Forwarded-Encrypted: i=1; AKwUvBy1QgwwzWsK+QVUNPc9vngGtQB+1TolMcKGMMDVx9RB/iI54ferU7kVpWHBQx3M64dTGNcKFDksxoM4uEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuoDTFBfxpJntXrk+gCr/Bwl/W9AvrglZhJykxQx4ZVRUrpbHd
	FUOQ9Piwk5pst15Bsm+rxAdB3zXq7/lehniXlOh+8Khc+jF/nTAnANfg
X-Gm-Gg: AYBFou2zM+AA5zq40D7uU17qk1n+afelZJlax157KQwmwadPTnEQQZtkbLX3Usz5RCU
	76YBkmTIngPNf9XAkY74/rVyzG3r9yB6MTshf4NzFdH8Lnm2mR3rOIvUxBGwktLPgLtGyMJdyDc
	q06RmOnSS9MNHQVRRXFZrqvmlsT1MOKfVn53vLHHliAzAPLNu7km/WRzObdGatDTu2uhZKsZCR2
	xrFCrqdWFT5CaauyDAlsJJbUjWqTsPQilmoUAZ72+yHWifoye0JgrWyDMT1GV8ppVI9EJcfypLo
	SvGnIQw31cFuP95Zuokm/1+wvgJtHVr0SYsyhw1hDkHZ3rPfIWt7oTdMDQsniOZmIda3lsan6yv
	uQqph8BGcl+sQFMNToJYuuPCsaaf2c5y3WNpaSUvtaJaicTmNbQ84lUbBHMxmEZJ0N0wkzdMvh9
	3ZXQamA/SoWW6Fj6zeBV8ZuiPsi0V4VwRX3vg3SCHpwplpe2VA8OcH+SL4L+cbNd+3MIhR9HLtW
	ayRm+cEZaCaBzMj2qyVGwmiBGItqdiLcJibP7GcvX9ZpyruQN01Zzk+LFMZztXb5OopeU0ZO6xW
	rzGLB5mRgthph4HYcAW8PpY7+5tS/JAovSzBPxVyHVjNPZFhQv3mG4eEkqc1qdWNXjX941F5LhE
	DYnbDG23ogfiXDg7a3z0cn/41RFKaJGlTc9dVbFN/LTWf
X-Received: by 2002:a17:907:94ca:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c46bde7eaf0mr746614366b.35.1792955015229;
        Sun, 25 Oct 2026 12:03:35 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa1asm232324266b.62.2026.10.25.12.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:03:35 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] leds: lp50xx, max77705: use fwnode_for_each_child_node_scoped() to fix fwnode leaks
Date: Sun, 25 Oct 2026 21:03:31 +0200
Message-ID: <20261025190331.449462-1-mashikiselby@gmail.com>
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

In lp50xx_probe_dt(), the inner fwnode_for_each_child_node(child,
led_node) loop returns -EINVAL on two error paths (when reading "reg"
fails or multi_index is out of bounds) without calling
fwnode_handle_put(led_node), leaking the child reference.

Similarly, in max77705_add_led(), fwnode_for_each_child_node(np, child)
returns early when max77705_parse_subled() fails without calling
fwnode_handle_put(child).

Switch both loops to fwnode_for_each_child_node_scoped() and drop the
manual fwnode_handle_put() and loop cursor declarations so references
are automatically released on all exit paths.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
Fixes: aebb5fc9a0d8 ("leds: max77705: Add LEDs support")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/leds/leds-lp50xx.c   | 4 +---
 drivers/leds/leds-max77705.c | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 20bfb315b..d542eedd4 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -458,7 +458,6 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 
 static int lp50xx_probe_dt(struct lp50xx *priv)
 {
-	struct fwnode_handle *led_node = NULL;
 	struct led_init_data init_data = {};
 	struct led_classdev *led_cdev;
 	struct mc_subled *mc_led_info;
@@ -505,12 +504,11 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		if (!mc_led_info)
 			return -ENOMEM;
 
-		fwnode_for_each_child_node(child, led_node) {
+		fwnode_for_each_child_node_scoped(child, led_node) {
 			int multi_index;
 			ret = fwnode_property_read_u32(led_node, "color",
 						       &color_id);
 			if (ret) {
-				fwnode_handle_put(led_node);
 				dev_err(priv->dev, "Cannot read color\n");
 				return ret;
 			}
diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
index 1e2054c1b..4fd803c95 100644
--- a/drivers/leds/leds-max77705.c
+++ b/drivers/leds/leds-max77705.c
@@ -160,7 +160,6 @@ static int max77705_add_led(struct device *dev, struct regmap *regmap, struct fw
 	struct max77705_led *led;
 	struct led_classdev *cdev;
 	struct mc_subled *info;
-	struct fwnode_handle *child;
 	struct led_init_data init_data = {};
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
@@ -191,7 +190,7 @@ static int max77705_add_led(struct device *dev, struct regmap *regmap, struct fw
 		cdev->brightness_set_blocking = max77705_led_brightness_set_multi;
 		cdev->blink_set = max77705_rgb_blink;
 
-		fwnode_for_each_child_node(np, child) {
+		fwnode_for_each_child_node_scoped(np, child) {
 			ret = max77705_parse_subled(dev, child, &info[i]);
 			if (ret < 0)
 				return ret;
-- 
2.56.0

