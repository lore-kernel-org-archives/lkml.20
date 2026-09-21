Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250272DB794
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989334; cv=none; b=i3DOmUoUGfdxBXVqSPQVex6wyuQPSx1214f3yLTibW+U+g0Rb62xOV4Td/oXxatHa8KlXo2B0QaVHgeEOgs1Tng9vI9t6ma2T4mZWMPcQEn6cZM6Ka5Fdo/6iRzyN2lvWuamZ9m3EGkd3NXFtpT07tvRqU2poU3LN5wsdMfESc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989334; c=relaxed/simple;
	bh=Fl8LEDF2+G92eNmZm/5BuP9dhnVEgbjMk0wmGrfEco4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pEBWJ0qWBzRqXipVDDTBZFdk8OfuqBcnZ7pP6xSeidCRBYnVWDcWjsTkVTTwgU/kYloy6WTpB7OzJUfT0Rt824jJm4qUoTcPzaMH/c2vo1/zT50vJEmDfzQDZbrhtOfz/SlUWbaVdbwuIY45nm89d7/OEnYK8fR/6s0jIiqmcSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0YUCI8S; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0YUCI8S"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso19976235ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989331; x=1790594131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cuLvycUbpxuZeCkGbkO7ppnyiQyHbP7lOQEyxsj8o4=;
        b=F0YUCI8StMnUyYR67BI160cX1VVC2t0GEglDaVhngyql125HkeEGhlkx8LNlIhPmsU
         DDPnKg01wEURUjE8U2s7FJqOHmZx65QFdqrsZRLM1RUfrnu4PCYyX8omBvdEJpClI0Qg
         Q3PDnz6Q/bnxESAMOn+9vsEmScfDy4QRdPEaTw/zQAyW+rxclC7iWcz+G2Wrp9oRJ6pm
         HITa9txXeqgNr+n6C8ayfltwtNFLkhZMzLbHr4ZCEcJ/ik/rUVSE6jPVs9mSaSjcvOlS
         sLfewJa4RXQwUXEsrxCGLhXP7+ua6jePGK4cXsNBfTbUfaNhMOtjRH90V2VnXWETcjt9
         cMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989331; x=1790594131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cuLvycUbpxuZeCkGbkO7ppnyiQyHbP7lOQEyxsj8o4=;
        b=FYTRYgF45TqZKxb4zWKkVoWmAagq0By6zMZtHG35Aj+TCqa17djKJT1jRxhsLae0JD
         RkuLBckVrtAVGt8ArWGznShySw1Dr1ujoa2XmomhvQ8T9GZigMknlhkYXBEpGdjW+Qd2
         +sPfaxiI/YLwiou6tZjgbJx9g7BS290Wj8dIcP46y8qYCW8onLQwq+oluhQ0M6yhcn32
         Fuklwg0upjgc76JNaZOoCI+QFzy1UQTnpMzP85WJL5cP2Rro3TXqAijaT1xqwSdIiISK
         XISfNRFWHP/Xm2ngCiRh871qaZq+xEzmiBwe05tCi/UuKCLFSSvIMGzaeJo+4PpD2PY1
         tQNg==
X-Forwarded-Encrypted: i=1; AKwUvBxxQAmI1Ebb2AFS7ZLalAHxfcDuAi8Zd5cgi5RBtwAmOqDCDeGRECPAUFbNn7UPDK6o05zlCls0YKgH9B0=@vger.kernel.org
X-Gm-Message-State: AFuF++mVv1VgVWGRKbaVyjSCa3KzG88E1vfBEo2/nEhzTv0MWmq/sJih
	qYet2hbiw7a2Vy+hC/qPmfoZ4sG7cyq3dwM54Aarmu5/FRdWfmPwqnC5
X-Gm-Gg: AYBFou2csBqQxQzGGtEmqv4kWM5nbZpN3AG1K/bbL5tc0zoyBxzlxvEw1CNygc60Gv0
	w2mNyyiHuh3k4/4YI5VquAvJ79lHnd1ZsA2KoHexePXk0N/rM0OiXsu09ndkYGMTVr1h0uXaBRb
	ntSwbafEikl63/iXRlWAi8NOwn741FBxyXZEXoHAAjJjZF5Cj9olHE7F7o8PJ+YbV4HlZ4EewCM
	RoU6a7JkV5n8/YrcMxCV/etqPfkRwy7oMjKnQ1inMqrxFXyLEbomRdMI12oEVY0pAoBd+FHa5wP
	WRchL6sq/VLa9ShiYknCexOOxwGsFKkDgcGf/ArojLzJRmPRAZfbU/Bhn1mE7sy8Ru7+o/ZTeW+
	nAeW/rVbRAZn+aVs3IjyUGL+KVY2IqWnRbAgrHEVD+AeLAOUgALebwqFWZzDSt291Qxi0Qcndj8
	zvBoXP6EPTSM8bG8UcEujjp5SCrjY3J7YPcSvv/HijIqT4/EVdb99TWHFGd72SjxPpD4Ik7BnSr
	gX7j18=
X-Received: by 2002:a17:903:2c47:b0:2dd:c168:c4e0 with SMTP id d9443c01a7336-2ddc168c512mr84966165ad.0.1789989327719;
        Mon, 21 Sep 2026 04:15:27 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df378440f4sm26419465ad.59.2026.09.21.04.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:15:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	Ludovic Barre <ludovic.barre@stericsson.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Julien Delacou <julien.delacou@stericsson.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: ab8500: fix child device leaks on probe failure
Date: Mon, 21 Sep 2026 19:09:09 +0800
Message-ID: <20260921110909.370945-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ab8500_probe() registers MFD child devices before completing the
remaining device initialization.

On AB8540, the main MFD device batch may be registered successfully
before registration of the cut-specific batch fails. In that case,
the probe returns without removing the child devices registered by
the earlier mfd_add_devices() call.

The same issue occurs when sysfs group creation fails after the MFD
children have been registered. Since the probe returns an error, there
is no later teardown path to unregister those devices.

Call mfd_remove_devices() on these error paths so that MFD child
devices successfully registered earlier in the probe are properly
unregistered and released.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index f0bc0b5a6f4a..e675223b6023 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
 		ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
 				ARRAY_SIZE(ab8500_devs), NULL,
 				0, ab8500->domain);
-	if (ret)
+	if (ret) {
+		mfd_remove_devices(ab8500->dev);
 		return ret;
+	}
 
 	/* Add battery management devices */
 	ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
@@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
 		ret = sysfs_create_group(&ab8500->dev->kobj,
 					 &ab8505_attr_group);
 
-	if (ret)
+	if (ret) {
 		dev_err(ab8500->dev, "error creating sysfs entries\n");
+		mfd_remove_devices(ab8500->dev);
+	}
 
 	return ret;
 }
-- 
2.43.0

