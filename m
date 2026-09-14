Received: from mail-oa2-f11.google.com (mail-oa2-f11.google.com [74.125.231.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C283313E2C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351822; cv=none; b=iTn3bxqA25sbHddwxZx1kCldkfD6Y5F4xWJGPxg4KSDgZPpJV0NVO8ZFU5jxnIsibJYCywkUyU98eDqUXBiwuE9KD/eaAYvNtKgbSj1pm2/8lYvmujrPYnGQmgDhtbmlzSERo039bDHzxtjGONUr8eAsRQff0Lwws92eGghQ0UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351822; c=relaxed/simple;
	bh=bPg7ibmMjA3YZEMkxh8P9EgsDt2Ehcjuozj55lALu8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ldgvj/Vu88uxfhfjRDGzZ5OaSu8fbvwk8gCGw5uNHBceLlhi6atL8ihKyeQ3d3Y25BU+A1+sNddT2L7KPzdgWzqlMstgh4AAUF6TN4IwMaGRoao3ksokGC7Lcn7yPu7GeMpKz3OrCTBArbCOxrZlrBhTGVy2Ck4R1UJG8MQOnW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3D7XFKf; arc=none smtp.client-ip=74.125.231.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3D7XFKf"
Received: by mail-oa2-f11.google.com with SMTP id 586e51a60fabf-457e289483bso396103fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789351819; x=1789956619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwLjeaGopLfJY+d0f6yY+haKMKBWMqU5CkDwCqQQGFw=;
        b=b3D7XFKfHqsLVfQKG2TiPW+iYSKzigASyTdAkcdaMF3XMANEb9JnI46WHKcdKmz3MG
         LSUOcGfj8n2omjKwEesuQS4f6VGSfFs4ISrrHxUDh4iGXWR8q0zocORJvM3tvgtZs8Fq
         YNRaaoC1w0yN2QxVGHSWCfLynhRhyIGe3n5lmswRR7YYlErSHETPxhRFkHe3/oHqC7Ke
         ZyhcD15nC4ickp3eWKrE3g+xPkcDeHGCzRpU2fk+R0sYt3tEI6UpOldlGNv7rKGzMT/e
         tMI+C15lDe1mbL9NXJJfZrXQjC0q5ZyHIpfXFwcSZKFqsgfC3hICYYoZLNfkIt5FKZ8v
         Qieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789351819; x=1789956619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwLjeaGopLfJY+d0f6yY+haKMKBWMqU5CkDwCqQQGFw=;
        b=pL2JeltUvqDhpxM7bP8GPLvZBP8fXbtz7n/vvyTp0G3nSvbrby1VHzQPvJbxvwo5Nm
         xC7vDrCWtS2d4LurRCdp5rrZRtTtAgOS9TPLYdMTdSxtON8kSyGrMOcKWJ+vOUP0sC80
         z51YPtVlGQPXiZS6pHbqi2PofElfm453HatEtg0XZyY4mZjVKhAaf97DZ/zhKe2I4GtC
         qIWVGr4iBteIbjeE7aGru4WqjqjmqMgTSCtetEhXfyTCpexXlwVxfKOu/en9t3eGnR7A
         oGtGo+9xOoQbH32ZUVBPJkd0PO3Kdzq7HwMKT8CGF6R3zsYRf/nROVhHb64Sy/CVKtEp
         2WKw==
X-Forwarded-Encrypted: i=1; AKwUvBwKtbtg93vRLIVeAy2z3HU6CIFUeqz05UxZl3mSOmjCW3g1qqJfIJnBwGovexTHwp1pN5flmTVbnqc3gAM=@vger.kernel.org
X-Gm-Message-State: AFuF++lsiaCu0ghQPsBIr7yVjGkObh/PCmQ5AYRw0goWN49EmlYxrNYu
	Sae3nXs2XZKjWxQnkeXAG58nGp0pwweyuaDWC1on46wbewDl+3xpAHKG
X-Gm-Gg: AYBFou0FOiVZhAGRBY4/hf9ruBkufBxgPIWtju7ODmSoa1BOrChZSSrleyHpV3DriZj
	9slqrAbssvxvI7tqCi8jiXLc0sswL2AKBG/gLx5h1hmeQYpiT+AyBeHHgoMFTb/63mGBKaKMATk
	hEbuShmzfOeaqJ+5HMd5jjUhY/4yfNFHNgLyY8eYS5vbyblZkUlYw8ir1bspyt2YfPoDmekyJNS
	U1Mfpzj5ck1qojHirbLDxFVnC+kIoQSc5Rc+QKREEvPOsx2j39XIjAqxIFNjFh1RmTJWGmOQFmk
	MtV4d1P8NPyb08w6AkxjdueVnHjsijtOmousK0+zwh4UHW95DCk4tPubXg8mC5w26N9mv5Tc6R8
	R9nlPUuGurKQom52/Bk01LdiMDJNJjDcJwmGwugmBK4EMB3zxc7xYoyWSqyI4icMwQTpExXQGQr
	z9AklLlMHy8PZa6s6WDM/ncCm8sSaCIAHMK0OJ2kOJUTNXJvmyf+xqsbXPZpvC80yGKxg=
X-Received: by 2002:a05:6830:6f81:b0:7dc:e78b:158 with SMTP id 46e09a7af769-808846c49d6mr223406a34.4.1789351819296;
        Sun, 13 Sep 2026 19:10:19 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f5ffd82bsm9788713a34.11.2026.09.13.19.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:10:18 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 13 Sep 2026 21:09:55 -0500
Subject: [PATCH v3 4/4] drm/imagination: suspend the GPU for system sleep,
 not just runtime PM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-4-674b907d0652@gmail.com>
References: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-0-674b907d0652@gmail.com>
In-Reply-To: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-0-674b907d0652@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789351801; l=2092;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=bPg7ibmMjA3YZEMkxh8P9EgsDt2Ehcjuozj55lALu8k=;
 b=sogxAc49G5Crj4suR69BUpnafPaK3iEZJ21gP+/t5/X1rHiNPL/wGtJylh4kP0QilF0ofUwbs
 zFmkUpjGYCjBpyiOvH7tdGZx1THU442gXZOr+oZFMppu9B+n33ZMqen
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

pvr_pm_ops has only RUNTIME_PM_OPS, so the GPU gets no callback for
system suspend. That works only while it happens to be runtime-suspended
when the system goes down. If it is runtime-active, genpd counts it as
suspended anyway and turns the power domain off. After resume the driver
still believes its firmware is running, the first firmware operation
times out, and pvr_power_reset() is entered from inside an ioctl's
drm_dev_enter() section, where its drm_dev_unplug() waits for that very
section: the caller is left in an unkillable D state and the GPU is dead
until reboot. On mt8173 it is deterministic:

  echo on > /sys/devices/platform/soc/13000000.gpu/power/control
  echo mem > /sys/power/state          # wakes on an RTC alarm
  vulkaninfo --summary                 # hangs in D state, every time

With the default 50ms autosuspend delay the same bug is intermittent in
ordinary use, depending only on whether the GPU was idle at the instant
of suspend.

pvr_power_device_suspend() already disables the firmware and powers the
GPU off and pvr_power_device_resume() is its inverse, so drive both for
system sleep with the force helpers. The reset-path deadlock is a
separate bug; this only stops the system-sleep path from reaching it.

Fixes: 727538a4bbff ("drm/imagination: Implement power management")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 20b27a468327..b7931f75832f 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1527,6 +1527,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
 
 static const struct dev_pm_ops pvr_pm_ops = {
 	RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume, pvr_power_device_idle)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver pvr_driver = {

-- 
2.55.0

