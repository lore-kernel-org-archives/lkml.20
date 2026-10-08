Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12A48E0DF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452866; cv=none; b=D0NAGVj7GbEYjeel7HTOMIRDBi9iD5CYYuQ6PwM3BGpNMkUUxx/fWgMlsKFRo+BojnFYQg4Zqlt8Xqbb7/WSeRpz4/ODjRtpY9BlPPWEdbW1PfitUjJN/5tHsUpvCZaCbHvk0hr/PbfnLEyDu1CDOLtKTwrdhGMNBZqL0K2Gd3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452866; c=relaxed/simple;
	bh=ipo+QoYim+E7JPIpTXWB+a1L1mWdKwNskDFvsmmr6KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hB3ls/dBB4Il1Ufi9eZJ6EHr9bqBZ8R+qFarPCW8OJkOoHrxE8L6QV3sSyhMVJRTs7x3EvJP7T4ilDZRXhlL47F0VLM1Sbp4OSzGTZEJSeCDwPXYVbe7EERSHTg080xouZEQYm4WDzzajVyjy4gRuK/2G1buKDVOI13ORZIk9Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sASoNHE2; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sASoNHE2"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3115c4451c8so4211337eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791452865; x=1792057665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUQRlvg9AsM862GlCoL4Kg1tB8eW4uEtlo087+kXFRQ=;
        b=sASoNHE2vJbtTuQosk6WZu8ZoPuY0itiiRIBpKNgH8c0XmK/hO2h66sySvkSEKerKt
         qPDa1kVjfvAhkDOPr09Oo9n2aGqa0+yedUMfBuq9OAiPVFbNeOFIYSRS69wUZ92/324M
         LnWwqZ/PpcaxS5GMJP0sQlueK9QU1ljwTEQY1riI+fCGlk9aT15FLx7ehfInqCII60uj
         WIZbSHtNVVnk5sbf4Xi+7+mlGaoTT1la+47dJU6XeD5M/FuBajr54jF0KwzB9QNf5X6h
         zampvnmIQQqgXArucvy0mZlV8dxj9BYLZT4HtowvSA0jpPPjlxcPPPqBcrV5OOGqb9eh
         qFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452865; x=1792057665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FUQRlvg9AsM862GlCoL4Kg1tB8eW4uEtlo087+kXFRQ=;
        b=GWxUhrD7JcuyZH+tyv4flhvneADwD2VDH+Ee1Cr/pFWknOY/tP9+u6ZJnNMz2I5iG3
         z1qLw5lzwwLWOi00n56YcvDcIIRqJutbskVL9PbOWaVQrUHqp7OXsFu2PYUZgGjWaCVC
         emNQr/lquP0ZUEzpW13RQuM2vWJpp3lihZsBbh6W0jejaAJv0dAZnUTeKgeOVIDwpomi
         lxenBpF1lF4ukuvwLckJC6IsZf4XGj3sgjB+ykNcC4K/EAkJZi8bcI6NdrDe+QMVHRfV
         PJs+kOL+XDoE4oPjGm4FyhDIYlcrfdgP9vX8nGrBwmqaRkvB43S6hpXsePbXPpmLzFdr
         noUA==
X-Forwarded-Encrypted: i=1; AKwUvBzDhL2nHtxfFBa0d7oIUy0O0Q2Xj57eolTJXVfJ6zpwoS1ejFHXbK7M3+K0Lio26658WUG9fMV1HEU0DrE=@vger.kernel.org
X-Gm-Message-State: AFuF++msdv6SFcfulbDJepgz4WSrdUZyzfH1Wz3oPXJ5T3AHKbP3j9JU
	UZwzzRYNBReIyLm24IxSVkGYMwRaFJ80w0bcWk4T6IUv87ECkmu8STpc
X-Gm-Gg: AYBFou1/sEbel1kMP15DEt431quKu6au4EaAEkNwm5v3UsiO2iJdHfgi8kYUJtW2fJy
	+dt+XfcdY8Xu53HFAbzuKFppOGXBBG7YfberssS2hCdXPqUoi3PYdadK+7mX+0CqbYYmoJ4gSK9
	PFzeg0rLEoQt4UDakQQx5hxvMRmLkxeEt1a//l5IsHMQ4gVkSKd5L4+G0PTx81oY4iZt7ogLo7u
	y0rHP8zQDElFWdLUQZeCoe89BsqyNdRTPGOpLn2Ua70j3BqEr0ZfoeBB3rGPxEdraZE8w/Qcux/
	D+wb75i1SM4Dqn5RxZGf0IjL1jF4qRsMUEixgX3W4unoA88EXTiZ3IOYulQ82LC+fhloueB0GhP
	Z6vd62IaFGqeJ1G68bHeBO7Ydz4ojBIArQCClm6wsuQ0/cXuzKeMjlcyWgiFPvAu5eNgzt5n25K
	KvGpeOpWwV7uciBwXSYAK6nfYrBkRYMHcirW4syo2igicE2UeOsNJpnuEEOgY4lWrUZwE/VVZxu
	D1F9I0EK98apIXqqfbccZdqRSnNYOOZwlRQCCmCiyGVfz5sG+NHkArbE3RfCmA=
X-Received: by 2002:a05:7301:7b81:b0:351:606f:2832 with SMTP id 5a478bee46e88-35177179563mr2721847eec.3.1791452864794;
        Thu, 08 Oct 2026 02:47:44 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c00sm14994424eec.8.2026.10.08.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:47:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Support Opensource <support.opensource@diasemi.com>,
	Roy Im <roy.im.opensource@diasemi.com>,
	Dan Murphy <dmurphy@ti.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] Input: drv2667 - fix input device parent assignment
Date: Thu,  8 Oct 2026 02:47:33 -0700
Message-ID: <20261008094736.918137-3-dmitry.torokhov@gmail.com>
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

Assigning the I2C bus controller (client->dev.parent) instead of the
I2C client (&client->dev) as the parent device after
devm_input_allocate_device() causes input_register_device() to attach
the devm unregistration action to the parent controller device rather
than the client device. This leaves the input device registered on
driver unbind, leading to use-after-free.

devm_input_allocate_device() already sets input_dev->dev.parent to
&client->dev. Drop the redundant and erroneous assignment.

Fixes: 1c24622572d6 ("Input: add support for the DRV2667 haptic driver")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/drv2667.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/drv2667.c b/drivers/input/misc/drv2667.c
index 97309984fa7c..bbda7b4cbdcb 100644
--- a/drivers/input/misc/drv2667.c
+++ b/drivers/input/misc/drv2667.c
@@ -357,7 +357,6 @@ static int drv2667_probe(struct i2c_client *client)
 	}
 
 	haptics->input_dev->name = "drv2667:haptics";
-	haptics->input_dev->dev.parent = client->dev.parent;
 	haptics->input_dev->close = drv2667_close;
 	input_set_drvdata(haptics->input_dev, haptics);
 	input_set_capability(haptics->input_dev, EV_FF, FF_RUMBLE);
-- 
2.56.0.385.gd3acb90ef8-goog

