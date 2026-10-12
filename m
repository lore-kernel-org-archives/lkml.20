Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF74BB80D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819984; cv=none; b=aOFwzs89ob8FS5CSBEGsrWwJFuZxB/Q+EBqVX5q4VKnVV1D1f6Rztf5PhI3J6/NVJp92NhHiJNEWThHUVYgCAvIid4x3HktT5LM5qRNWl+C3/pmlJX2ec5Kt9Y4iylZEmiJoytr6hwiSmEDcidLXfrGKd95p6qt06t4mOAHgMfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819984; c=relaxed/simple;
	bh=WsYQRqZVkYfAC0uocIQCG3hADVXXJg52uM4QwsZS/VM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOSb1OEIRJ0prP+vyxhWjNyMSQTnmut7ZG8OCD3nuZi1KedwAoSex2L5ELRH8//SGQ49sP5p+0p7/vL4N/Tp2L5qfObP3j0UgB2RwnmJnieIgvTkPl1xPmXBh1Gy5bmIQ6u0B/XGqgGFzMA9744tHetdkydloS+dawy/bGfjF5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJ9KvtdX; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJ9KvtdX"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1419d3416ceso2720413c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791819982; x=1792424782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAuVFfQbxwKnXcYGVkoP45E/v8P/ovYGz0j3wut9/Dk=;
        b=pJ9KvtdXW+l9rUsPrCdb6JKioO2Prixdx4MaCp5jAIuyBohZmCvXTgX2Z0Haz2Sgfw
         31NHqmiImhmH6W2byXMbbRYcIobhKGM28Alqoh3udIy9fDXR8snKpIEzGCWPctq4geNY
         1V1ChZznBgrMv+0ONzjoDRxxWT326BRWTJ+w5dnM1xivr/2ixMdWfZ7nkM8VlyBaLaqz
         m0CSrPNjP8M0eIpxkBHoWI/2fCExSlQ4pPwmnO5kVUfAsVtnhLzKQaRaAjl/SWmw9r3k
         och8Vr/IVrKls9MdH81qSvxGQygU4NAHbYsyf231+KbGpck9BaNsEKro+ICl2/GIvlM7
         lzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819982; x=1792424782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAuVFfQbxwKnXcYGVkoP45E/v8P/ovYGz0j3wut9/Dk=;
        b=Wu1cnlATx0I9S2wOfQ46ck5h6LDu5fx+vc1Zy6NcsS+53vHi9OZ2dyGFuYh5aAzHWD
         nhU8LL/pFg1ax3SklGJDYECe3QPe56URdbvCegrM3U1mrdYnIrE4rgJIkpzMS1j68Mwe
         rY2zuevjC1pwTZft2O+xYcnIxy9tEHMwrvpWybVDsOiIxjykVYUZd2b5MDHlw8QVelNJ
         fk5EhRlDC8uft5lBzqHBqdrHkBN+B17Az3WuA7kborV3WuRblBGu0TYFBSn09WaKibfd
         hOZQ4PMWloPJ6bH+bE2ia+9N4iBr/JbBlGsu0XnuCHNGsTwJJnURGGqydOqIlT2YMuEh
         +zNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaykRa082dlXNATAH38D5uGpFbjYkWqptVbulaRWd0aOrgwBPH0dGQRR8EeRnVkRe7YAgLpdKMlKin9Jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnwAmHaFgk0dNTVSA9Mg5hYniwba9sTvj49jkx2W/tSK1G1tfF
	iAsYnrtYdB8tbwvZsiLk7moHyox9cd7hLTH2xURrvUtOC8Y/QFEeEvWH
X-Gm-Gg: AYBFou1iTeD7Wqw7IH3vk8KLJF8gcK4bTGddxCdYHRtrOw6nJJp9am78ak/O4HqpWBz
	WfAeg9pnojL0Pcen9ugiR6XsGvMPTUJQTUEEeGrHd6gRTheRFLgh2TxiMBqF00xYSUX2wCCivV5
	K3/ld/qA8RAh+ZfNDBIh1bvIrvlqcr7erY10APXUnXUxirYg3d84xI3Ukb108YKk/K8pNoAm1uA
	H4my2RlQyn0TBkA7BqzJlsn7/1W79tOGKk7Xf9dz9DrwNoyC7RisuVWJOotBqTU6d0ufV/666IA
	SFtXlJgcK4l2ZHbzP65uEIsISNJykw5Ir4P/CE8YC71meMsb7+C7s/4eBcvXq1mxAixwSGMxmYE
	Vzor0NC+oP4oCLELVrUeehWSdqrt36Wpy6iMFpC6064SH+STQwX9JSTUKbMWMChB1YpixxTI+P5
	W01DcOyKbsXQT/R23a8g6+3R/NuGgsFDOiuRTQmc4DFjxRoCyIqFBjuFLhNXy7rda03XRw846ej
	uTSJw8g9Gu0Jzyf/EB5+Vhbka7dWTYUplZCiqKFiZMYMECKOXZilPL6X6GIPKbo+94cOJTM
X-Received: by 2002:a05:7022:ea8c:b0:149:1feb:6dae with SMTP id a92af1059eb24-16a62bcc7c8mr12280029c88.39.1791819982235;
        Mon, 12 Oct 2026 08:46:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:c1bb:8d21:6c07:8107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm33838996c88.5.2026.10.12.08.46.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 08:46:21 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] power: supply: sgm41542: Use secs_to_jiffies()
Date: Mon, 12 Oct 2026 21:16:12 +0530
Message-ID: <20261012154614.42203-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both watchdog kicks are a flat five seconds written the long way. Use
secs_to_jiffies() from the same header instead.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/power/supply/sgm41542_charger.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/sgm41542_charger.c b/drivers/power/supply/sgm41542_charger.c
index 888096252..118b4c700 100644
--- a/drivers/power/supply/sgm41542_charger.c
+++ b/drivers/power/supply/sgm41542_charger.c
@@ -468,7 +468,7 @@ static int sgm4154x_set_watchdog_timer(struct sgm4154x_device *sgm, u8 time)
 		if (!sgm->watchdog_enable)
 			queue_delayed_work(sgm->sgm_monitor_wq,
 					   &sgm->sgm_delay_work,
-					   msecs_to_jiffies(1000 * 5));
+					   secs_to_jiffies(5));
 		sgm->watchdog_enable = true;
 	} else {
 		sgm->watchdog_enable = false;
@@ -970,7 +970,7 @@ static void sgm_charger_work(struct work_struct *work)
 	if (sgm->watchdog_enable)
 		queue_delayed_work(sgm->sgm_monitor_wq,
 				   &sgm->sgm_delay_work,
-				   msecs_to_jiffies(1000 * 5));
+				   secs_to_jiffies(5));
 }
 
 static void sgm4154x_disable_irq_wake(void *data)
-- 
2.46.0

