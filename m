Received: from mail-yx2-f8.google.com (mail-yx2-f8.google.com [74.125.224.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4F3090CD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981262; cv=none; b=rpatbNFXy40STUmAKRp8ACpFbvfQY+SLmZZAQU+i40Ih4JCYnioo2kQXIyG1O57mnKwODFDYL4U9Z6BxQbqPxwVtAANUmzkXmAjMT/ej+PZje9W011uijcjhIJ4do8ynfrL/S4hMaCJhy781Q3Aj8Oansb8+l/6728VcDwz7hPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981262; c=relaxed/simple;
	bh=EDwUvwYj52uRaI2dCh0tF4qDlZkgWRI/RU1+vIfQfts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KUvaq0ZzvkXJhjHEUOyYR/kEbiwKMq0bmd1yr4hr/qvj0Bdyd/oBjcfMmYMBKUptJld6y+A0QBfyKnT0acHZVueURPx/Ao1bcSy5b3mbi1/WK5v43EiTM3EvntldK0oDXJKj8CXRe5QZRiUKMZcyvc18JrydprTr9eJqrv/55Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCrMDV4y; arc=none smtp.client-ip=74.125.224.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCrMDV4y"
Received: by mail-yx2-f8.google.com with SMTP id 00721157ae682-854f090ff98so33095907b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981260; x=1789586060; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yzknjs/dgM6cXy8bMP6XtAn4j86y5MQftpHsbTjU4JM=;
        b=nCrMDV4y7AG9ZxxEvNPmvF4s9vnPDCZ4Rp4KmWvM/2AiTrtphisahkjkSmeTSDLHqN
         W5JI6jmRA4zqTsiVvV4Pd1C89H5tbSmj9FXfUoyxkn4UHBGKwQdzFyV8kpa06GJmGalM
         JQKrHKHiNlTn7KQ8AQjzKslh5mWywpWc8FdUH7d9NVnt18G+psF6/yAUPEd5RsvsZrXH
         x3XX7SMVSKZTCpZHxLf7zuth0RTxce7ovw6TJdl6KPP3B4Gwz0Jgc3kQvT4m7HZeRSQS
         bqpj6B7JlscJSyucILktwTr+Oe+OawCGtq8z1qHd4WUvfN3vp7/gE+ScEoZb738Wc+ym
         mX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981260; x=1789586060;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yzknjs/dgM6cXy8bMP6XtAn4j86y5MQftpHsbTjU4JM=;
        b=nfHS10+aUReXr7oZyVI/Y4wQ40YnYhNsUbWTP4OQXkJcnEL/2mCUU1YSjdEu0vrO58
         t3LI8sPhtVUdGF5xUat0DLALma5V2P0i21l6fF2Q8nPpFTrkLITlXCntBIL01UBx4JkH
         +0SJZbWmam+YISFL6lYjdjAjUNupqCNJqrO3xIuBs0mASg4cvYteI1exdIgC6PSNjJ92
         F5O9DID3/WJSRwh4P9/o5kjNCSHirdPD3kdXCt9kBavao7Cxrv2sN7uARwXw4eZGtD75
         eEjPNMQsM2ZZZnCUG+42g/hH37Rn4f3BBifGf15KoC1XJgLUUsYmbHzh4FTtVsoe0OsC
         Nn/A==
X-Forwarded-Encrypted: i=1; AKwUvBwgARYL7WnQqrITKIAT72Vp5LBwwwm40zHNeqyJV73CiDKxKM9d3rEwbFuVYqhw+Dk+AL+9Dqeleeit7e8=@vger.kernel.org
X-Gm-Message-State: AFuF++lYgg3ZC6NcjMNI+taGFggnH7hVBOusrv6XeVTfJ9BNW9HxeONC
	OeBnVl4ITg/6QFgo9kvj+opZdMd3sA79yNFxOkIePXx3tOg44U9shds2
X-Gm-Gg: AYBFou3Re4Td8Dr3idbi6akJweeGeE1bik46jMgTYF0I9pBmbumhHqOVjxunILHhGRQ
	zCdF0kzQJa8zum27dK5mU7X8jKuSA8HB5WzM1qiOsLHlLHFbAhJuDTklWYyOc0iYkBizfjXbkqG
	chnap6OKGIX1jLXiqNAB0o53qQ0n45SRvapsKsmTzvE4v/xvskKjmPpFHDiYBuPoUuFuB3KE4uJ
	KbZlWx0KcrbgttCD3e7DxtcX9JIOTtAgyzpjXVIqnYepOMIVwVCP7nCLjqDpm9FsmVEYmx9DBhC
	Zd2bM2MZX5nN6mDF/rXVuC1VrPXYjuFJHGjXde0/s90mIObKCcFIhYbO2lkVAtt64ihHyI/P3Cn
	tCKVzWoFISvzzQ25WKH5l3f2f9JBYWjALiUwdOEksg5sSTPfoLAXF3sKADl+5NI1DN4yQppt069
	i21+ylHq4lzChZcJK2lEQ9YTgjS1BEMJkAaTIknFUBasO3kJUib0Z2tJd5n3ojmZyJbkfFubRxI
	2FWcpqJMxalz8VrgiALXEShug+/sa8N2R9JNpR+PTGNq5dluAld8ddkBnYohrblzvMRVSpMc2Ne
X-Received: by 2002:a05:690c:e0d5:10b0:857:f33:6f1d with SMTP id 00721157ae682-87122396144mr109553227b3.6.1788981259894;
        Wed, 09 Sep 2026 12:14:19 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040664be1sm150361316d6.18.2026.09.09.12.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:14:19 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 09 Sep 2026 14:14:16 -0500
Subject: [PATCH] drm/imagination: suspend the GPU for system sleep, not
 just runtime PM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v1-1-f45847bc951b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMBCE4Vche3aTykGCr2I8UDrUGqnNbktQw
 rtb9fjNYf6NFBKgdG42EixBwzNWHA8NjbchenBw1dSa9mR607NYKWAteHNJmgXDHKLntEgdNSE
 69qmwvjRjZn0Aie1keze5zpjOUn1Ogimsv+rl+rcWe8eYvyna9w8NeRyNlwAAAA==
X-Change-ID: 20260909-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-bfb9dfd7007b
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Donald Robson <donald.robson@imgtec.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788981258; l=2911;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=EDwUvwYj52uRaI2dCh0tF4qDlZkgWRI/RU1+vIfQfts=;
 b=e3Tfw3yuJqdLfhsvfVAyjk7rHzRK6ioMgcmTgeGmoRNT6onFbW6CVKFXi6ZGv4BUSX/EeoMII
 yVSbVc+K6VSA70/wRm0GEMx1VTHB/o73vstNk/nEBUf+3usP2Lttss8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

pvr_pm_ops has only RUNTIME_PM_OPS, so the GPU gets no callback for system
suspend at all. That is fine only while the GPU happens to be
runtime-suspended when the system suspends -- then its own runtime PM has
already disabled the firmware and powered the domain off. If it is
runtime-ACTIVE, genpd powers the domain down during the system suspend
without the driver ever being told, so on resume the driver still believes
its firmware is running. The first firmware operation then never completes:

  pvr_mmu_flush_exec -> timeout -> pvr_power_reset -> drm_dev_unplug

and pvr_power_reset() deadlocks, because drm_dev_unplug() waits in
synchronize_srcu() for every drm_dev_enter() section to exit while being
called from inside a DRM ioctl that holds one. The result is an unkillable
D-state process and a GPU that stays dead until reboot.

On mt8173 (amazon-suez) this is deterministic:

  echo on > /sys/devices/platform/soc/13000000.gpu/power/control
  echo mem > /sys/power/state          # wakes on an RTC alarm
  vulkaninfo --summary                 # hangs in D state, every time

and with an autosuspend delay of 50 ms it is also what makes the failure
look intermittent in normal use -- it depends purely on whether the GPU was
idle at the instant of suspend.

pvr_power_device_suspend() already disables the firmware and calls the
platform power_off, and pvr_power_device_resume() is its exact inverse, so
force them for system sleep. The vendor driver arrives at the same rule by
a different route: it holds a wakelock while the MFG domain is powered
("prevent suspend when gpu active") so the system can never suspend with
the GPU on.

The reset-path deadlock itself (drm_dev_unplug() waiting on an SRCU section
held by the ioctl that called pvr_power_reset()) is a separate problem and
is not addressed here; this change only stops the system-sleep path from
triggering it.

Fixes: 727538a4bbff ("drm/imagination: Implement power management")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 5c965ef0274f..23d353141589 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1517,6 +1517,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
 
 static const struct dev_pm_ops pvr_pm_ops = {
 	RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume, pvr_power_device_idle)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver pvr_driver = {

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260909-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-bfb9dfd7007b

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

