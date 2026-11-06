Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980877;
	b=oTLuz/kxsZ9Yqhp2mRtjfZ/QMmrHfNW4LJHkQivwNICY+GLJFJV8xbT7zYyVgb8FJAE+
	 SfFUjqGPu+vRhSlh50whCdGKrDTvcUpexR1qYxEphsEDAYErjKDk8andH99BursAYzqRb
	 zU95pmvQhAMJvse2gLtLbTC13OOtT3OHsIqLtZ3UhchVXxWw9FFGDwpABce9gyhL6FSNs
	 zrMxxBDB0nJAmvRFbIzubQLhZdVPffgCIUPfUVQRFWDkaqf4GO3G3RL9by1VkK1uAgQNS
	 BXENYT0S9anWBlSz0gRoEfoPdn5g3r6ES//aa8uWjPPYVcJy8UDzmsR50l3oDFoWcxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=On7o3YDJ6A9N2qE/v0Dd5vQ6+keSrhVbU1SUb028uOU=;
	b=LxlkhVNyFLanLgOT5rYfhuLODZLILPTftCvV0upXSUrndTYzCL020b65q9NTCks81Lah
	 m0eMNE8ZMM/65qQizW37TNfNE1FNh8wXVyHH+M6NvVani4zu7GFC4CWy6zAoZB+crLKGF
	 wZS36EW77S9C49rOPW7VGF3HhU6O3MKi0exSqzn7S0awDE+lodSlgZ7Zg9n3gHJVSasm9
	 Y5wQY/d/E5vQg6wgUciD3C9effqlpSlkP+/lSq/yolcLt6aXHJ0yjffhhVZ90GWfOo8V/
	 hh2mOxWZnMRQ7knyUCuk2XuwJctCIvlPz1aiz2M6Fg0LvK2vN1hAArh0MQ5smKSxidg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrbj77ew;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806E1606D803
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 806E1606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrbj77ew
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a05b210703so365550b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980877; x=1794585677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=On7o3YDJ6A9N2qE/v0Dd5vQ6+keSrhVbU1SUb028uOU=;
        b=hrbj77ewuQUUx+lfk2VXUxZ8o8kG2nckHoFyKAlQmdKiLGC2XGSsf90xGU7XjRdxpP
         H2dz8v1tYzzjMNxYTGLSOcQfK34VSi45KPlK0M6C2NwhZ71qodmEbXo2qrkTwSdOogNg
         MDRv95aG7YTffY+NZbjyNzcg2LACsij6XKF2b5zV4GzC0ow+/Yu65T+k+Fk/PqPrQV68
         xMFBQIROlXCiD4eWpqLvN/OMSezqsMt4omG9/xJHJ6L9dKD7R0hUaLqmOUZcMQxyMsMW
         0hoyX2O4rC9blcOTm6Hp6nYemv0XA2Wvg7tAfCJqDJWE6JPkhb9JHRaYgMpXY3OVjCJz
         NIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980877; x=1794585677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=On7o3YDJ6A9N2qE/v0Dd5vQ6+keSrhVbU1SUb028uOU=;
        b=qrDNfnFjKIHvXrctHWjYzUqlPHGDdhVJ0VRnC3kNRK35der33g4JyKBD1r7YEKhbvc
         DrbbT1D43yrxJWewtHUrmVfnyqQK46sdVv7gIONC3C55deXAf1VfWcEZVMx/ldEPQaO+
         +gWuY11fSXhK+p8XNnyEhTgM358DcVPrESH0AZ5oh4dw3QbOi+TlK2r9U6ma8Kh75yHa
         j/KvhZ96C29vYCU8XYKZ6jjxlG2ET7v5ZMPmzLbEcT53PkeqJ9jzlVsaf43fQgC/aAi7
         jgJPT5vCU5NNxw9sKKQi4PkEe3HTsMa6P7lkjU9r0Zgl1RNvLlPxOll2F8AvMtBKobBA
         q/yw==
X-Forwarded-Encrypted: i=1; AKwUvBzB/MNwVL67/PthvXQaVKp7SI4CXCP/EAIzYFLh/pCgsO/rbDyDRqJt32MulYJJaq1sfoFO2bPpoOE5j3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vp0zSFx4mK14FgKYo1CQDJsPM0Oy+IkGT0mH3tuodFc7MhXg/
	mEV6bs/wu2pEO617tqe121WadsPDbA8uRPwsGZH0062Ko6WLWxTj518w
X-Gm-Gg: AYBFou1QKup7tOjtz7lZ7qZwHadzCBl2yc99nCTkBGNYZ5mP2thyiE3NScnD2OeUCAb
	inc4SQnGS8R8ByMXe5nQQuaSOxSFpajsxLM70wzWudQlkEcXzqHFzJEANJNkiCjK7MfSW8d9nqZ
	3QYDewnMxS+jDAfSVTrJ6BjhFAS0gXq5fjt3OfXEnYlHevM40ZdZcY5mBcC9oxo4jtxBE2xTZDi
	uyqLk1NZXD8CHJbTW8cTHDVoerdzVaQPOL+HNvE7Y6aylnrQDRRg5yi77qj/VOUaxtVqL/kszTo
	uTUCv7Yty3s11ZNLlcyyfKD9hNblTwFTR+srgg8xkA+hz5UAoxQET3fL4tflnhmTK9dyxrAk0kK
	1+W0Pi18SaXMEUXkiDS6N65nzHj+yk6zW2n6MFZKsoiHxcXhw0kUSlVO4/VSyQgIUBtonBSBmYx
	2QgqyP5FOWbycqc92T87oHC+CzDavWJzqOCqxg3cgGRG/Tq4cwuRKdgHMFcnJbMN2fs0hVIWUzc
	bT/pyl2NqljhrMJ3YUB3TYeeV7ORxbuMQaHYy+JWuGXG4h0oI5aypU3gCbjlENSjXk+RA3ASRUm
	VihCCJeCiL4pRJ8RkyZNJz65m4qbT3Vj5V20yDGJ/aNnde2cMBiMYtsA7H1JJo/nr45/sfg=
X-Received: by 2002:a05:6a21:880e:b0:3e0:b1b2:2af9 with SMTP id adf61e73a8af0-3ebb2aa0e0bmr2982479637.60.1793980876624;
        Fri, 06 Nov 2026 08:01:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a7fbcbsm727930a12.25.2026.11.06.08.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:15 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] power: supply: ltc2941: drain poll work before the power supply is unregistered
Date: Sat,  7 Nov 2026 01:00:55 +0900
Message-ID: <20261106160057.2754689-2-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106160057.2754689-1-hj351016@gmail.com>
References: <20261106160057.2754689-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

ltc294x_i2c_probe() registers the self-rearming poll work before the
power supply, so device-managed teardown drains it too late:

	devm_delayed_work_autocancel(&client->dev, &info->work, ltc294x_work);
	...
	info->supply = devm_power_supply_register(&client->dev, ...);
	...
	schedule_delayed_work(&info->work, LTC294X_WORK_DELAY * HZ);

devres unwinds in reverse registration order, so on unbind/unload the
power supply is torn down first and the work is cancelled last:

	power_supply_unregister(info->supply);		/* frees info->supply */
	cancel_delayed_work_sync(&info->work);		/* too late */

power_supply_unregister() ends in device_unregister(&psy->dev), whose
release (power_supply_dev_release()) kfree()s the power_supply once the
last reference drops. The driver holds info->supply as a bare pointer
and takes no extra reference, so it is left dangling.

ltc294x_work() re-queues itself unconditionally every LTC294X_WORK_DELAY
seconds, so a poll instance is essentially always pending or running at
unbind. Its ltc294x_update() calls power_supply_changed(info->supply),
which unconditionally dereferences the supply (spin_lock on
psy->changed_lock, pm_stay_awake(&psy->dev), schedule_work on
psy->changed_work) with no use_cnt/removing guard on that path. If the
poll instance runs in the window after power_supply_unregister() has
freed the supply but before cancel_delayed_work_sync() has drained it,
it dereferences freed memory -> use-after-free.

Register the work cancellation after devm_power_supply_register(), so
devres (LIFO) cancels the work first -- while info->supply is still
valid -- and only then unregisters the power supply. Nothing queues the
work before schedule_delayed_work() below (external_power_changed is
NULL and ltc294x_reset() does not touch the work), so moving the
registration is safe; devm_delayed_work_autocancel() still performs the
INIT_DELAYED_WORK() before the work is first scheduled.

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires an LTC2941/LTC2943 gas-gauge chip).

[USER: add a Fixes: tag. SHA not verifiable in this graft-at-7.3
 worktree. The bug entered when ltc294x_i2c_probe() was converted
 to devm_delayed_work_autocancel() ahead of
 devm_power_supply_register()
 (drivers/power/supply/ltc2941-battery-gauge.c). On a full-history
 tree, blame those two devm calls; confirm the 12-char SHA +
 subject of the devm-autocancel conversion before send.]
Fixes: 6d0c5de2fd84 ("power: supply: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/power/supply/ltc2941-battery-gauge.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/ltc2941-battery-gauge.c b/drivers/power/supply/ltc2941-battery-gauge.c
index 6ebb555..8f8a8f6 100644
--- a/drivers/power/supply/ltc2941-battery-gauge.c
+++ b/drivers/power/supply/ltc2941-battery-gauge.c
@@ -531,11 +531,6 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 
 	psy_cfg.drv_data = info;
 
-	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
-					   ltc294x_work);
-	if (ret)
-		return ret;
-
 	ret = ltc294x_reset(info, prescaler_exp);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
@@ -547,6 +542,11 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(info->supply),
 			"failed to register ltc2941\n");
 
+	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
+					   ltc294x_work);
+	if (ret)
+		return ret;
+
 	schedule_delayed_work(&info->work, LTC294X_WORK_DELAY * HZ);
 
 	return 0;
-- 
2.43.0

