Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619702;
	b=A6LMz9Tt5oDVUjWpLTAnQmcThQy84QvReMQq5XnCLTrxxz17lirQgCkWJBXUstFjZhqf
	 Zf6rROcZtPZpv1EqwI5kQsHEalFxdg1+SJIqwse2M3L7dI2pCp19ckXii3FXB+CfYh39B
	 MZnR54BMYxmFAeSykAIr0ObG0lzWJAZUuS7JYCJZypcvS7te5sEqXIAcGmA4E9lKm58Z5
	 alU11y5mmvgIwbhdmxQGKJf8xXGJjUgEdSboIpqgvc8pJlrlrTYQ9nljeRIykQ4vk4BXh
	 iyznOe6Ys2ICR1OFHgzI6e71X/KCbumroPFbfVQkyiLxcyBxGMY7wrVU4EQCJyTn91A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5rqHvwjECQWToFtKKOyTtpPoZY/7s6Eyj9/c7r3hJ48=;
	b=U8PCLMD4T2LRTGthup7rs27J/FbCfJJ2tQBVVYTkVEbF0JjB5DcSdYlO0GrCN0UxeilV
	 UQXhZTNbRT0cP4ZWcfGeDYziiop1SnsOksbRIPq9QH0jU3WkZi9ibVhLdIDHF4tBdUDcL
	 30nN1/5NHAGpLD/z0L6rt74TI9DrtoM3ctSnqlO/IOKMCKjvheCu8ermtJAp/HJ4UBAnN
	 I4vUpyeMBXANT/1RAqGISGjjosEBqCC11qQqe4G3RlBoMJ5aXvT+iyiqgqtoCCzaEGKk9
	 EopgZISVqRWwYB64KpOPSc9g5IG7mOoNRh8Mn7pUeLDZqR6BUUxUIXWthn5NNDyDmOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f26lkpmY;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB6606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AB6606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f26lkpmY
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso28461155e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793619701; x=1794224501; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5rqHvwjECQWToFtKKOyTtpPoZY/7s6Eyj9/c7r3hJ48=;
        b=f26lkpmY0bcRZByb9+jmyOVykROupuOBO7lLJc6spGn8gTo8j5ah844BYtC64zvq0V
         e+ZJB1J5DGNp0BhgOZrtfdzJCbfqe1yTsdy6/VXXh00eQTKkqlwSiMgYieJAwicKM/11
         rzgqRUCeGb9eKsBqybZiSeEejZWmyIYkUh+EzNeGiJoIruVaAzO58y/WIIkj0EnIuquc
         uIICp8C+O+oaMylBbgdLuJt+IX0hFZdQP9aEHbFxOClRloGDcSnw553W6csnprfSvjuz
         MMdQf3BcaGSU2x2qxxLRV9RDIk5IVRDOWs5q+A4mUbNjjW3vbPuBQBmACYJsHJs+JXSi
         jwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619701; x=1794224501;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5rqHvwjECQWToFtKKOyTtpPoZY/7s6Eyj9/c7r3hJ48=;
        b=LQfAl34AMImwCQ9Nx5iokX+hA2CEJYgRP4KcXi+fFvy7OMFAqS72jjHDbE9z6KyWhm
         HGsW5gjF+6Ffy5c2B1/B95ZysOHcBWLK+bMlU699DSznvYDaFz+UqKbboIGIK04Y/jow
         +YXm/w5xKwH/Ppc2EZj0HVfNNdWSAGxGqRAFHGmw7cnYKPKcjXT1meb60QdeTlKgpyRf
         kn5LePO9XFepLDHs3m3X/V3nhgnO7a/wnqrwNiDdKSY100G37j104y9Tgn9g/MtahEdf
         llA4AEzzJOPmsxwztxB/xkAdT99AdsuEsZMHcHG/OrEV2/Hkjihir1MyKPPIxUb9dwSn
         ZHgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxR9ezNwsV0IH7oVnfIOXfpJeX7CNE4e0a41yciqyfOiE64PqIknfoGSOnMD0zebm+uU2xPVuo71+FEy6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5Jhv2QLBQWTPjpdXjUC+oXXmWVUqVAyrfA98Guj5i03DAeKnO
	J5YyWgLanLDnJn/w1KL0kJNwPYiS4xp6aJWhHYvgdJoFSonHwXxa2WnY3sigWucPxkY=
X-Gm-Gg: AYBFou2yGi9AjB6jPjxc6OLuuA/kIbcq1kuNWDmUgJMlA1wr1xDytUOIDRR+kXpm804
	Otwk2wmV/wQyzUuXXEmj1kLPJZmtYy2JTMaNVlhIaFtKqTHO5E8hGjVZk2wEWOZLARSkqexCvP8
	9C/p/7cwzKb4oFfcXiZQ3qc9qWtJmznrZS+XaX62FVbmPaCt2SaurUyO/XKtm8EMoP/NcdL0enf
	UOIl9ePMG/lc7yMWS66am8OqUxIITn1AZKFv9BPSCZjB16oUhdOTa0w9s+DdZFH4oNYWY7Roiqq
	p5vac3pDb/DctZY9sGBWTz61/Rl2Rb5DZ/ZpfRrWP6ySkNAS3XVxZYZNL74C2KN+TKq3xmfKb75
	Nzk6Oe7pVSXhEtI6uflnTtwxuCB51S7RySoLKtApJZqxdQVwbMbvBgxJy1T/PPsikOjamEEjfna
	iM1tzx4N92+mG49NM1kHfjQjNRdLZ9/NjqBtcTnF+GL+iEJbQUTYDJ9PAypjkQfb9MOjQJ/tJsE
	iDhktgUqU6cKWAkuZ15RMKDkukqL4K+niAXRtIPsqlBvzdn4V7VeFnFoS5T/P0eD7yIPutLCQOm
	mgK2zUI70L85VNVbPKImuofE0ZiyUBPooJUZi4OjSjHT9xJ8hXdyrbyI4Q7FnRFCtYyJaKidwzu
	zjp6VP/GFH7ORlMc8UZLuJjCOlbwf1deCSuda19mfTojidYSjFcA=
X-Received: by 2002:a05:600c:6215:b0:4aa:1527:659 with SMTP id 5b1f17b1804b1-4ac17a366c0mr231375965e9.17.1793619700722;
        Mon, 02 Nov 2026 03:41:40 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm21715781f8f.4.2026.11.02.03.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:41:40 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 02 Nov 2026 12:41:33 +0100
Subject: [PATCH] drm/etnaviv: Keep busy jobs alive in the hangcheck
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-etnaviv-compute-hangcheck-v1-1-1f81dd1806a2@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDMBAFf0X23AWTQxR/pfSQri+6SKMkNgjiv
 5v2ODAzJ2UkRaahOSmhaNY1VjCPhmT2cQLrWJlsa50xrWXs0RctLOtn++7gnyQzZGF596NB54P
 rA9V+Swh6/N/P13Xd8WktyGsAAAA=
X-Change-ID: 20261102-etnaviv-compute-hangcheck-cb8d1e7af68f
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

A compute dispatch consists of a single FE command. The FE DMA address
does not change while the kernel is running, so the hangcheck kills any
dispatch that takes longer than about one second. Long-running OpenCL
kernels never finish.

Read VIVS_HI_IDLE_STATE at each timeout tick. If any unit other than FE
and MC is busy, the job is still executing, so give it more time.
If all units are idle for two consecutive ticks, the FE is waiting for
something that will never come, and the job is killed as before.

A job that stays busy without FE progress for longer than the new
hang_max_ms module parameter (default 30 seconds) is killed anyway.
This also catches kernels that loop forever. Setting it to 0 restores
the old behaviour.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h   |  3 +++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 39 ++++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index e89d591d7404..f871ab7899fd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -147,6 +147,9 @@ struct etnaviv_gpu {
 	u32 hangcheck_dma_addr;
 	u32 hangcheck_primid;
 	u32 hangcheck_fence;
+	bool hangcheck_idle;
+	bool hangcheck_busy;
+	unsigned long hangcheck_busy_since;
 
 	void __iomem *mmio;
 	int irq;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 3cc50d697c89..cef1ed33ff91 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -17,6 +17,9 @@ static int etnaviv_job_hang_limit = 0;
 module_param_named(job_hang_limit, etnaviv_job_hang_limit, int , 0444);
 static int etnaviv_hw_jobs_limit = 4;
 module_param_named(hw_job_limit, etnaviv_hw_jobs_limit, int , 0444);
+static unsigned int etnaviv_hang_max_ms = 30000;
+module_param_named(hang_max_ms, etnaviv_hang_max_ms, uint, 0644);
+MODULE_PARM_DESC(hang_max_ms, "Time a busy job may run without front-end progress (ms, 0 = no extension)");
 
 static struct dma_fence *etnaviv_sched_run_job(struct drm_sched_job *sched_job)
 {
@@ -36,7 +39,8 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 {
 	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
 	struct etnaviv_gpu *gpu = submit->gpu;
-	u32 dma_addr, primid = 0;
+	u32 dma_addr, primid = 0, mask;
+	bool idle, was_idle;
 	int change;
 
 	/*
@@ -62,6 +66,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 		primid = gpu_read(gpu, VIVS_MC_PROFILE_FE_READ);
 		mutex_unlock(&gpu->lock);
 	}
+
+	mask = gpu->idle_mask & ~(VIVS_HI_IDLE_STATE_FE | VIVS_HI_IDLE_STATE_MC);
+	idle = (gpu_read(gpu, VIVS_HI_IDLE_STATE) & mask) == mask;
+	was_idle = gpu->hangcheck_idle;
+	gpu->hangcheck_idle = idle;
+
 	if (gpu->state == ETNA_GPU_STATE_RUNNING &&
 	    (gpu->completed_fence != gpu->hangcheck_fence ||
 	     change < 0 || change > 16 ||
@@ -70,9 +80,36 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 		gpu->hangcheck_dma_addr = dma_addr;
 		gpu->hangcheck_primid = primid;
 		gpu->hangcheck_fence = gpu->completed_fence;
+		gpu->hangcheck_busy = false;
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
+	/*
+	 * A compute dispatch is a single FE command, so the FE does not move
+	 * while a long kernel runs. Keep the job alive as long as some unit
+	 * other than FE and MC is busy, up to hang_max_ms. All of them idle at
+	 * two ticks in a row means the FE waits for something that never
+	 * comes.
+	 */
+	if (gpu->state == ETNA_GPU_STATE_RUNNING && !(idle && was_idle)) {
+		unsigned long max = msecs_to_jiffies(READ_ONCE(etnaviv_hang_max_ms));
+
+		if (!gpu->hangcheck_busy) {
+			gpu->hangcheck_busy = true;
+			gpu->hangcheck_busy_since = jiffies;
+		}
+
+		if (time_before(jiffies, gpu->hangcheck_busy_since + max))
+			return DRM_GPU_SCHED_STAT_NO_HANG;
+
+		if (max)
+			dev_err(gpu->dev, "job busy for more than %u ms without FE progress\n",
+				jiffies_to_msecs(max));
+	}
+
+	gpu->hangcheck_idle = false;
+	gpu->hangcheck_busy = false;
+
 	/* block scheduler */
 	drm_sched_stop(&gpu->sched, sched_job);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-etnaviv-compute-hangcheck-cb8d1e7af68f

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

