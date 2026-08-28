Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538DE29E10B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942882; cv=none; b=N1yEBR/0tjsN8XeXn4KcxGuYmqt0IM6yu9fWKtSV6+5WQEfbY7eSCmGWbVq60+WHhIR4zAa/1mR1nD/q1lq2qN2ODL0xaTVNKYhlocilBodfme0irkgqLLuxAyVvCgjKHrML41c04uppq6YiTeO/Dd8CisqDALyzn8nCy7xzhdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942882; c=relaxed/simple;
	bh=FJssaBPUUtHSGxV/Li0h1qDDnJZUduHFE7IP3Ary8bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NP/YM7PakBN12Thl0H38ciQKAajUBb+MmS+6J1gWCvoHN3vBViW9eoymdUalN5lCayantSFJZRZPYJ4hmQV4W7viZtYm1aGX1G/9Kjf9HPuwcOlmGfx6jdpwEHbmzlZRl+js0rZdLJN0Kw+BcVyWMIKHGntuMq7533FcuxrWRp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bwpbw8TY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bwpbw8TY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482ea739de2so914117f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787942878; x=1788547678; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IyfAwGBWmAJQs9JWXcgS2bJMcS0nHE+nBg/gtGA7eV4=;
        b=bwpbw8TYrTXWJ862NqCdLcAPr9FcnhybGPkCP6OyzL9LpAKF9B6bUCjigCtS9OH8Dd
         V3Z/CnbagdfZhoGDXtlswW/OnccBt9H9OE8+IDx0+su0+fHbTYrMxqfts3c0V2gzaQRP
         bb3lPjELIkJLPL3PHuco1oyzIUkhbxb6uHJ+AAltLk7yjDDzu3eY3Z69CcXrITkQlxuk
         M4xGfx3fFo6kJhMRQm+xFV2rTOmkeJebyBXEb5DPfqK73HSTtPOYdFYj7EcOEmLGif64
         qAFLTKkRUE0f27j3YpiKX2zHmlAQPiqae++0eqbll3h8JTejr5CfmSMdsEsscHbtde4W
         ASTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942878; x=1788547678;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IyfAwGBWmAJQs9JWXcgS2bJMcS0nHE+nBg/gtGA7eV4=;
        b=YrvbljhkGe2a5utTYvUDqDvKU4jsb1aSbFa5cpjugZeRyAhlw9ul/3/B065znEvHdt
         DulLqVkbRpSRSby1Bf/KbGmZR2e1p/9nhbbMRgczJ+4neNGTcZHm2GSIvHXkD4GwgKYK
         iB+ZRBPLTXaryKZHFHIJK09eknn51s6QKlflfgFOHretwErWcsydPVIkrnmMhlifA/3d
         4EToPnHSXgIVNRw8jZcFS/gk3nLKiN6NFBP8jf5dk57Ksxd0rQJ481/FkkzteWke8F1e
         2hnQ6cfpmoil5xNpzXviiWlIewZkG2OeKYnAVbuZNfiInHtIUsua0jZQui531Q9ssgia
         5EFg==
X-Forwarded-Encrypted: i=1; AHgh+RoPgE6gtf+s/ThMA0wgHMHVBnIUqsX7dVQi/xw+sgwEYcJ4mADPzO1xqymhXicC1er7HoZd7IWfaoZVZeU=@vger.kernel.org
X-Gm-Message-State: AFuF++mS1hagGlxX3APevTo3gLMoUbjd65JddddszZTWRDnoWHml52kB
	8ZQV6UVhsNSkyWzH+xgSKFdh7qT4fIKXXZkN9erWMBstF/btHcQoCs+HQYTWNy0wnjA=
X-Gm-Gg: AR+sD10mu0GVrFf1mVHysjgIaNSmaVFTo+xtz/F3Mezwa/ZosoDJFRr91AAcOl2oKQq
	bZRjg7v73K6wiaa/H+ZdOdqawBfw02MAA4PPZtmpSr9oOIQoxTE5LOEJKpvOPcBImtxtXWT69CS
	NJtT4lCdBtUJq4SoYxgz0ekIKjlniit91BRsvlQ1ZMJEsb6smbH0XebmUoNSn3aoI7enziKkjvg
	i8CiidlRUA39NIhkIB8s/IjdgmfIea5kp+/1U2MP7aso8k+/xjn14gihQkL1IPljeZLUTXlohXe
	gTpksVX2es4JKNXLWNHUzXrn1VEcXKCSjvs89zD/fruPiHDd210DtiJTT1eVUWQM1V0568mJG1l
	UBWQjtfHMqs+jd80Q8LfCa/Cef3Qe6ZVgZD5XLLF6TMWOx3m5/2LhBSlwvOX8884EL2tXq/WYU9
	IlI8ztoX9vBOtCrgGn4jN8PKiI+Bkn5hKlpsqjQU0TqBHkDemJAvYUQBZ5Yw==
X-Received: by 2002:a05:6000:40dc:b0:482:fbb0:a258 with SMTP id ffacd0b85a97d-482fbb0a3e0mr10035676f8f.14.1787942878673;
        Fri, 28 Aug 2026 11:47:58 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm9005731f8f.7.2026.08.28.11.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:47:58 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 28 Aug 2026 20:47:45 +0200
Subject: [PATCH] clocksource/drivers/timer-ti-dm: Register
 clocksource/event only for am654
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIANDXkWoC/yWNyw6CMBBFf4XM2kloFWj8FeMChkFH7SNtISSEf
 7docjfnLs7ZIHEUTnCtNoi8SBLvCqhTBfTs3YNRxsKga93WRhtcOjyj4zVj9kEIs5RZjjhapI+
 nd/JzJEZv+4CTrHhRpjPtpFQzEBRtiFzuX/J2/3OahxdTPjqw71+9NhN9lAAAAA==
X-Change-ID: 20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-418786f115bc
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, 
 Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2808; i=msp@baylibre.com;
 h=from:subject:message-id; bh=FJssaBPUUtHSGxV/Li0h1qDDnJZUduHFE7IP3Ary8bs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyJ1284JDlq+qkoqWwo6Jw+42PqvT1P/lyojjBfojm/w
 iPIeMOMjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIs6+MDGe81xhnZ22w5dOY
 9jtg2cInnyTLW2r0LkYl751myz094zrD/8CdjOzFHdd3T1Jd0VsU6J3gn7f58P0qZuXU/HvrmH+
 9YAUA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Registering clocksource/clockevent for the older platforms breaks
booting them. The older platforms have their own implementation in early
boot that is used to register clocksource/clockevent in
timer-ti-dm-systimer.c.

With am654, the timer is much more complex with more dependencies so
doing this in early boot with the other driver is very difficult and
gets ugly. Instead it is implemented in the platform driver for am654.
However the old platforms may not register clocksource/clockevent in
this driver as that would break the boot.

Add a system_timer_capable flag that is only set for am654-timer that
gates the clocksource/clockevent registration.

Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Closes: https://lore.kernel.org/r/2013A99A-0502-4128-ACFA-B04886224393@goldelico.com
Fixes: b8eeeca55456 ("clocksource/drivers/timer-ti-dm: Add clocksource support")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/clocksource/timer-ti-dm.c          | 4 +++-
 include/linux/platform_data/dmtimer-omap.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index 6787acac9a43..ae8777d03215 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -1475,7 +1475,8 @@ static int omap_dm_timer_probe(struct platform_device *pdev)
 
 	timer->pdev = pdev;
 
-	if (timer->capability & OMAP_TIMER_ALWON && !IS_ERR_OR_NULL(timer->fclk)) {
+	if (pdata->system_timer_capable &&
+	    timer->capability & OMAP_TIMER_ALWON && !IS_ERR_OR_NULL(timer->fclk)) {
 		if (!omap_dm_timer_sched_clock_counter) {
 			ret = omap_dm_timer_setup_clocksource(timer);
 			if (ret)
@@ -1585,6 +1586,7 @@ static const struct dmtimer_platform_data omap3plus_pdata = {
 
 static const struct dmtimer_platform_data am6_pdata = {
 	.timer_ops = &dmtimer_ops,
+	.system_timer_capable = true,
 };
 
 static const struct of_device_id omap_timer_match[] = {
diff --git a/include/linux/platform_data/dmtimer-omap.h b/include/linux/platform_data/dmtimer-omap.h
index 726d89143842..b78ee4676b98 100644
--- a/include/linux/platform_data/dmtimer-omap.h
+++ b/include/linux/platform_data/dmtimer-omap.h
@@ -57,6 +57,8 @@ struct dmtimer_platform_data {
 	u32 timer_errata;
 	int (*get_context_loss_count)(struct device *);
 	const struct omap_dm_timer_ops *timer_ops;
+	/* always-on timers can be used for clocksource/clockevent */
+	bool system_timer_capable;
 };
 
 #endif /* __PLATFORM_DATA_DMTIMER_OMAP_H__ */

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-418786f115bc

Best regards,
--  
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

