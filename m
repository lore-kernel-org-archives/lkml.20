Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADCA2DA75A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702234; cv=none; b=MoguU6I+5EXpOE3b6+5KbCVelE8CGh7MjcXn1wUsEyqm+6dhGR0TsZg0chSWD3vmgo6rymNQ3B/IMKeO8fh47yqVJqyfS/qrg9D31Xev0unoFG84ZnEXyWO+BKVzRFAvfScVYZaRXlD36KBDJYXVwO1M2QeLWZ1s1ckrXKeYHIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702234; c=relaxed/simple;
	bh=oL7iBYRGTXGLUYEI615o03nOb0m0bTLF3HdlXZTknbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rhjze0lDQgMJHShKUxyqyH+jvSTL46XDJXv1iWGokcxuF8uVukrDQB0gN68yGVxCpfe6teS1nObfphdkVsVn6fW9cka0IMAtAcWQd8gEsToF+AUvHepcOvBhxp6GpNfoNv9fRBIbbty/Kt3vorQvaSKAeSuoTdNksFGX0SZYUik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mhkmqi3n; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mhkmqi3n"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so245057a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702232; x=1790307032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsTXXf0bosmROP35BjT3pvO2TNvWL1hxMB3vfvtmPCY=;
        b=Mhkmqi3n/qPy4geBhcotXJHzyx2Es70VcFh2hL+VhOw/XMh+f+hDb5mxtWhGN0XO0s
         bQvMZG6gHxAEMcxBe/kjtedQ680T7cMj/xeYppEoWDZLDFdehcsyoIQeoC5qwll8ac+1
         716FO/PcB52SwuwUl3+u48UZIQbLJyPJtkjq3xVzFYH34m7q0YGVoXGQ5jN2w/C+qpq9
         CCAAbmPZos3NCYYd48Qn4AmVS8t5vjT/l1IEoNO1f8lRsd655QyoM0fJkV4soOlxeQkK
         YF01lYpwfVQA6BZI9oXZOnyqoDphQrBLAWFsMNQXe8Ek0T0Tot1ykXSdZzCl9xoS8yxb
         CkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702232; x=1790307032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsTXXf0bosmROP35BjT3pvO2TNvWL1hxMB3vfvtmPCY=;
        b=JcVijHp8Q1JxiLqdZ1/GAeGcZAs7Zg3DHv195bSmE28lUlv9Lo8izx/KmyHGxHeFGu
         gShivMtsS906MsUDAYvyeUkSNexVHouY5JxOR/oOJ/6iu8OMOMMpxt+fAkpvZ7Kwa8VK
         l0Jwr0L0CQbktOkZ78wVUiEnZD4Eyea82rwf0zdtzJ35SXnQE+EY6WyvKlhheRXidcWN
         /JrE2niyIXP0xtG7ZAjhCwVyzTjhw1Y29GbvlWFa44q6ui71V0z47nBBel6B36C9X1d+
         86h1JvC1v9bG5Q6ow5gzTao8ThusVWg5QZQcCkmpa6WHw8f5Enchb+HvNVbiX/MbrdjJ
         6k2g==
X-Forwarded-Encrypted: i=1; AKwUvBym8FZQT7qbzEp4j6Rk9TvwLBTH/qpGcpUzkEqyWb/geBAmO0YjFKsuMzB42uyGH6xxhTVl/VQqaBYNz7E=@vger.kernel.org
X-Gm-Message-State: AFuF++kAnj65Ztsq8k3mWu0tu/JbVmB2ISQcBUttF7jCCZ1ABqcunpFj
	zVVN2Jp/BFtd9OpV5359sgrqpdh5B+DvwedZSkC1gTezs2bTVgLvnKZ6QX7byA==
X-Gm-Gg: AYBFou0iYPfkl3UnpZp7QxdsDFVt9Etevqi2PayEUSg3spyHouLBsAMLnPhwA2phMrm
	5Ht+EXmSWq5zYhhtizS+m4QBxsVzeu4t9rDcCW8RUCAXTkMFsmgM+a4wyPulmo5c+JtJpW/1XOu
	dCJjb8fEjGjgyzGvu3G2pleKnUEQg10oKwM5zC2Zkrz3O0+cH4LqZk0OmqxzmMzKyNXOSa3q1gZ
	5WB8vQwzmbttvDRp/2FCcac5Fu5UxhAml8AlJFy/yOT0CKMSUPuYBMqoW2M/PrZnllGNS0+rcir
	EFrF8Ff6BIr9oK0c+X+SoJUqU5yD2vvXwCdRbb9aOsw1fnevNC5x0OA6Ius4Inn8xne/jDBgDyC
	uL3CHjdMQwdijxHImtxViqORbOPvoZLYa3YRBOOsllkaxp0ovLgVKfonT7euQMW407uxfri3KIb
	RMqRcdpgFkXwFgUAD9QkSQ9Lfptc+ktomxSCfc9DvqO7yqHIW1tK7sfg==
X-Received: by 2002:a17:90b:4acc:b0:39e:5ba1:ccee with SMTP id 98e67ed59e1d1-39e5ba1d12amr457366a91.24.1789702231551;
        Thu, 17 Sep 2026 20:30:31 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2874bb0csm613271eec.16.2026.09.17.20.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:30:31 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Ed Blake <ed.blake@sondrel.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pwm: img: stop using autosuspend on remove
Date: Fri, 18 Sep 2026 11:30:17 +0800
Message-ID: <20260918033017.3441183-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

img_pwm_probe() enables runtime PM autosuspend with
pm_runtime_use_autosuspend(). The probe failure path disables
autosuspend again, but the remove path only disables runtime PM.

As a result, the runtime PM autosuspend setting is left enabled after
the driver is unbound.

Call pm_runtime_dont_use_autosuspend() from img_pwm_remove() to undo
the setting established during probe, matching the probe error path
and the runtime PM API requirements.

This issue was found by manual code inspection.

Fixes: e690ae526216 ("pwm: img: Add runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/pwm/pwm-img.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pwm/pwm-img.c b/drivers/pwm/pwm-img.c
index 91e0b19f0c08..c0747f5e0020 100644
--- a/drivers/pwm/pwm-img.c
+++ b/drivers/pwm/pwm-img.c
@@ -339,6 +339,7 @@ static void img_pwm_remove(struct platform_device *pdev)
 	struct pwm_chip *chip = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_pwm_runtime_suspend(&pdev->dev);
 
-- 
2.43.0

