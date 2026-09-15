Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D848C41F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462243; cv=none; b=JRkE9kQ2J0eV2sZxTN8ZkBMPiSvxr84UFESCEl3GxLaQNBWgRKi1EXHeGXyCkFE6ufMlo/PrnB+mcnJE4jFK60GWb9ajygmBT8g6jrn31pc+jczICVN48S05II6nGKUDJVZoByX+/eEzjQGhV2T/FZV/MMCsmfyhdmVPVgjWfiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462243; c=relaxed/simple;
	bh=aOycPQPzW1hoyp3VFb8uVa68Tk1zbSs3hp8DysdIXZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V0lBH/EUafcVWEMP+iENQzLulmyB1uqcY6+5ZVigvyojYwFjzLHug4lrpth+VnTsV1B693Qyc4ygLnqSrtKk8aqy6bfGTUutq92iaiY+Gvqu2lhlcLaobau1C2SuQoBgQ3qx+H86XuAj+NJNemrBBMa9xyOUWtTJu7KrROIu3qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akwQ9mg8; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akwQ9mg8"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc502d509c0so229725a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462241; x=1790067041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZwK4GxS0mTkcXMKP8dTYTElQEtFXQdtakQVWZWGWY8=;
        b=akwQ9mg89ZrMDBRUKanD+mVGTGgNbzRxMKlQScviLHR+k5NbO7kffI7WvuaaZsp8U1
         eqVWdTJhZ8zac9hWolYcpYW/ppph/8i9GVwd9WwhZWj02rf+scQyXw62AKheVW5UnDJA
         5jy4f2In7M/8YJthjEcVaX3ypism7aJnQG8mvqk0UiZhAo1vk4WSuyYrBJ46+Qv7jl6O
         qV9hGrFpY7CAm363jHF3B07QaiwfPg9jp/VSCaxZTkKIO2z9XPVwm2TjYgGlUK5iNl3V
         X/kCna+FJEKS/MDg90QIodyA4+27mnIYGc47RTugoH/6l04GbtFkNd0w10Uzv3HlRBbe
         FBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462241; x=1790067041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZwK4GxS0mTkcXMKP8dTYTElQEtFXQdtakQVWZWGWY8=;
        b=QkXlFDYQSgapJrdS8CkjlkAIzf+r5uV+XHzyMATS0mG85+jhly37tgLx4InVUsyZMF
         B6ItZJUzEjcw+5kMewWyMSwdpGpd+82F0RxPp+C+4HgJUIRhp5RdY50Pe6CA+tvwKyyp
         J223F9GyeoG76pJVqxciP21EEpnZsXdwrrYMqgU3pQc7lXOWNUpIK+cNcizO99Qzc/dQ
         P9mzQdTGR9LTE93hyHcGBz0DCQzDLAtDO1xkactBlcpFuNyptg9pvo1tgjvy0J2R1icu
         AnvipJ4WuIMuhPNifVFpYa5DZY961myOEl13tKMCmZsUp8L7WCTjh2JFJG+qp7lkOpLB
         iS8Q==
X-Forwarded-Encrypted: i=1; AKwUvByVnPwJvj1Tag0pKrcZQY0ZQRzwF7EyDNSxBrNGqXL13q1rHogEZCPAi8nqJkA1pCuaPSx2UXTL+glVgck=@vger.kernel.org
X-Gm-Message-State: AFuF++mMb9IYz9iMIGsoGOrTSYm4VswsidhJDfpJupmdNAv+vYrkV7oR
	sQWayz1oZZV71sAj7uKaoyTjeSOetBIxJ+VJUHjJn3ZusYQye2D+/CRC
X-Gm-Gg: AYBFou2dQmbraF3FBPWGGDfWZE5xXgnQkwKRzUlZn/RH9AZ+HFbIUvBz/57BvxK0kOn
	uX78S3K2JQy0w+1EW2jCueZ3wodx/F4H79OuZFsTbDLEwqh6iiXYbNQU4zmVyYJjf8VX7+iPov4
	/dzSoIJpGVwZkVTonB80O7e4UbfFy+8+XWLh6dmxUz0eZ9WxLOxFkHCGKQWShye6uVPHVlTTu9n
	QCVSONn3jTrpd5RUyY65Mg5IzMzbMcsOQlmWigYzXAzU/59Z9zwLsVQnlkSzmgsS4HXGy4/uad/
	CVtiPlXIoqfhn1zFkg284Jh2CNiiAyQ3QpU3H9YWOa3i80Sb+wH8kzjilGg0XdJL97xt+UFhvq5
	4mC8foeZY/59OuOw+meKad7MgFVkHsXUzHvnaTu82IWjnaMNN6sFHMxCBHKzjJcRjgKWICjaoPN
	sTRtwtNHboobd/KHC4viimfB0bA9IJac9XDOkv1IHzYBoAoGolXKQwMfG7gOdDp7pn
X-Received: by 2002:a17:90a:d88b:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39dec08fa53mr12246257a91.12.1789462240654;
        Tue, 15 Sep 2026 01:50:40 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm4003559a91.10.2026.09.15.01.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:50:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: ov2735: fix power cleanup on remove
Date: Tue, 15 Sep 2026 16:50:31 +0800
Message-ID: <20260915085031.2331315-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2735_probe() explicitly powers on the sensor before enabling runtime
PM. The probe failure paths call ov2735_power_off(), but the remove path
does not perform the corresponding power-off operation.

The managed runtime PM helpers only clean up the runtime PM state.
devm_pm_runtime_set_active_enabled() disables runtime PM and restores
the suspended state during device resource release, while
devm_pm_runtime_get_noresume() drops the runtime PM usage reference.
Neither helper invokes ov2735_power_off().

As a result, removing the driver after a successful probe can leave the
sensor clock and regulators enabled and the GPIOs in the powered state.

Call ov2735_power_off() from ov2735_remove() to match the successful
ov2735_power_on() performed during probe.

This issue was found by manual code inspection.

Fixes: fa9e6df636fb ("media: i2c: add ov2735 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/ov2735.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c
index dcb1add1fd9f..2defcaa8b795 100644
--- a/drivers/media/i2c/ov2735.c
+++ b/drivers/media/i2c/ov2735.c
@@ -1081,6 +1081,7 @@ static void ov2735_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(&ov2735->sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
+	ov2735_power_off(ov2735->dev);
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(ov2735_pm_ops,
-- 
2.43.0

