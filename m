Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556343;
	b=QJc79OSTJRiO0xv/XIEq/oC+NPEhAwuuqwKlyN4PYyyaMP9tPnhAL4A/WXg88M09L0+h
	 h4YcUQrHQ8cTdj7SCvNibP84xOCWYkGszbdiMYZ7nCjpg8BvYLJpi+Imb9FhSr1cR3JOr
	 IC9auZmszEsimkKhzIecMuyyGVzXm63xv1vg6L33uQJv/w4x9+VYPfn55MiTLHsXmKpWl
	 /1RLmnO4tDZ13ZqcLdk5dwxD4O2PO5t8HO12cSAAMXmtgt2S0oB+VCZaaRi39llZoVPW4
	 Jacgn4u8oHfgsupbhVcbnCiwUND1KJB0ZKNbMpLtGzzlyE1LxjifcnZovFlsM1N5Taw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xkS6xbmE+ewGMYaLKZHzgOXG3y/RT/Y6ukuGmQk4oP0=;
	b=CcfDxF/K31TvwJltodelRwiWilNPumQbbme7QlGUqnbrKP2qZJuPHMy5jcn+GIP8DFXr
	 WkBApSToTkAyJCampbmBbHGke0S4OY47epwSPSz7XQ3+uvI2pABsLbmqWYbl0rMojvqA+
	 V6l4/oXcEpmNaZjJBPal3D4dKHY4Yb0m48VwdJ6TNyywehmR39qL3yhKYhe/YRj4h3Oly
	 eirNYr9zCx3UP1396UKY2K31izlu8W0kgXkrZULI5VG6fZ1sgNMME1smb1pTll4bFG0QP
	 pjtEiAYQgu53IZrI32EM99j6IDw/DvYlWskX4AgS2PYQlCoqdazuUTL9g1bHi/4PV9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bidSSP03;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBFA606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BBFA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bidSSP03
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so1548120b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793556343; x=1794161143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkS6xbmE+ewGMYaLKZHzgOXG3y/RT/Y6ukuGmQk4oP0=;
        b=bidSSP03obNuDoC07GZcasZYOz1qc2TFNIOGi8OCFFs6elFzrTRBTNpDPm3/wlcwq+
         ZjhG83xHea7YSiCuBjODLd0bFgDHwRsmYj1fkQgM9Rkzfn9oKrJFQchAECzLAVZmO3dn
         KCUo1b8GanmcWIQoccM8tD1WYT0iXhJ+MpKeCLlXkgQ6JBs32SahI4R7EHDMvyWTFWZx
         jFWaLW/OMpUFRZxlwl/EnS7p6Xzydd7ps2lXQsdC9X5vIMYXSF1AjyKlmsknBykm/2Cn
         3ieR0TfANAnWHIiHG/2vjKF/r/oKwa0XR4W69fPhi8t9nC0/1NhLc4ZjFlKXh6ZDC0gR
         V7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793556343; x=1794161143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkS6xbmE+ewGMYaLKZHzgOXG3y/RT/Y6ukuGmQk4oP0=;
        b=Q8ths7KAj8LaNFmzjljCgZwY4Uk8BFm+CABOriVXDCTLUq+qUGhjFyBATOW5Cwq45+
         a4t9uk/hxTud+ntdw2MK7hdX2bYgoLyjegqqrNnWqSeLm4Pz1ZSJgwjX4vG/OmKONDcj
         xC5EEH3w7qVBnFA1e0WkRO99alLRQzlywl74q4TW6hG0qiSRj7CjIAOvDJwdQQ8XKovN
         3wKOxf6EMKl6lrxlXNPKa4ikv8udh9PlKLqBRcnRGpxIejuJWjtbOe9Kuw5bUUTCnXm1
         ARy261CyH7O8U93B+7gViP8pcMhXCfny0xm7VVQlpt85ViZ6pDqbGmfwAX/zec+u3Xvt
         4iuA==
X-Forwarded-Encrypted: i=1; AKwUvBxFfZQ0HD5gVDedsGb/XrgMlIoX/d6UA7Y85yBKMJWB0QWU1NFs6aILswi1JuvEmLuxRHs2G4repSklj1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqr5kWT6Bb4EhKUX/C6Slyexn5LgfiWcCdiXEmRviMAAtVBXID
	RmTkXOSQr4P/v8QPEt6PgUeIq2vZBBHmPfEBAvGjvIEY2QY1Q3dvXcJU
X-Gm-Gg: AYBFou1P4gUtqpWR2c9ML0UEoKrV1c/W6RGiNQYWfJhbNapPMKUJCdZFcQR8FaWvbA0
	Cm2EQ7K00iBjyC1SUy0lVwXDkrjW2/+n7ehyuWiGvRbN1wZG34yCmoyTFK6Ij/A7GiXze8r4rc+
	F6WjES2ky9eQlBkqU4ELjPhdKIG7PiaBZZXInGWEvP5kL6kS4wejuVOUR0PmZNtX/hY8/IH/Kvv
	P3TVz0+JNh92CjA36R6RPPT6IC+aweQZwAGuUAwNDfqJFFP/3qoCriJ+N/ChUs8AUaZ4HxbAHBD
	NHisx/xNO/zlm7UKyfjA/YsMlGPuEFKczxVG0AALe+nh/L+kZoKfisG3heVgtXhJuKntpPBkfef
	PWDJbWrv1uwsaYTtE1oyI/P0T1f2Jx411CSv5AUZCYH1YBs1B61O6TetP5wQSdFkh1woXIi/Qr1
	q9paaX1vtoyuWBhkmpA42h0u+bFn9+S1GVLOc9oWmdLkfI5Z1TvlIgTtt5iIuZdGqJXqoc39dp3
	rI5qyfAb6p6okYsJYjcMIvUx/CViUynvLiHlbLYtcPm65cOFbItQvU+4jRI1nVzIaWFzyvOjZvJ
	Gdqxt7gc/xzdln8+0fBwjwU=
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr6450461b3a.30.1793556342787;
        Sun, 01 Nov 2026 10:05:42 -0800 (PST)
Received: from tabby-boi ([2a09:bac5:4fad:e6::17:370])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8ac269b8805sm446544b3a.44.2026.11.01.10.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:05:42 -0800 (PST)
From: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Connor Abbott <cwabbott0@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] drm/msm: serialize devcoredump reads of the crash state
Date: Mon,  2 Nov 2026 02:05:08 +0800
Message-ID: <20261101180508.66598-2-nicoangelodelacruz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101175553.53746-1-nicoangelodelacruz@gmail.com>
References: <20261101175553.53746-1-nicoangelodelacruz@gmail.com>
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

adreno_show_object() converts each captured buffer to ascii85 the
first time the crash state is shown, in place: it checks *encoded,
replaces *ptr with the encoded copy and kvfree()s the raw buffer.
msm_gpu_devcoredump_read() only takes gpu->lock around the reference
get, and every read() of the devcoredump renders the whole state
again, so two processes reading the same devcoredump at once can both
see *encoded == false and both free the same buffer, or print a
buffer the other one just freed:

  WARNING: mm/slub.c:6733 at free_large_kmalloc+0xb0/0xf8
   kvfree+0x44/0x60
   adreno_show_object+0x190/0x240
   adreno_show+0x1d0/0x438
   a6xx_show+0x68/0xbd0
   msm_gpu_devcoredump_read+0x144/0x1f8
   devcd_data_read+0x34/0x48
  page dumped because: Not a kmalloc allocation

The dump also changes length between reads, so a reader can get a
short copy that ends at a page boundary.

Seen on an Adreno 830 with IGT's msm_recovery reading the devcoredump
while a udev helper copied it out: 16 such warnings in one boot, none
with this patch.

Add a mutex to struct msm_gpu and hold it while the state is
rendered. Only one crash state exists at a time, so a per-GPU lock is
enough. gpu->lock isn't used because a devcoredump reader would then
hold up recovery and fault capture for as long as it takes to render
the dump. The new lock is taken after msm_gpu_crashstate_get() and
dropped before msm_gpu_crashstate_put(), so it never nests with
gpu->lock, and it is taken interruptibly so a reader waiting behind
a slow render can be killed.

Fixes: 1df4289d5b23 ("drm/msm: Optimize adreno_show_object()")
Cc: stable@vger.kernel.org
Signed-off-by: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.h |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fded78fdb..428dc9666 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -191,11 +191,18 @@ static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_print_iterator iter;
 	struct drm_printer p;
 	struct msm_gpu_state *state;
+	int ret;
 
 	state = msm_gpu_crashstate_get(gpu);
 	if (!state)
 		return 0;
 
+	ret = mutex_lock_interruptible(&gpu->crashstate_show_lock);
+	if (ret) {
+		msm_gpu_crashstate_put(gpu);
+		return ret;
+	}
+
 	iter.data = buffer;
 	iter.offset = 0;
 	iter.start = offset;
@@ -214,6 +221,8 @@ static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 
 	gpu->funcs->show(gpu, state, &p);
 
+	mutex_unlock(&gpu->crashstate_show_lock);
+
 	msm_gpu_crashstate_put(gpu);
 
 	return count - iter.remain;
@@ -914,6 +923,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->funcs = funcs;
 	gpu->name = name;
 	INIT_WORK(&gpu->crashstate_free_work, msm_gpu_crashstate_free_worker);
+	mutex_init(&gpu->crashstate_show_lock);
 
 	gpu->worker = kthread_run_worker(0, "gpu-worker");
 	if (IS_ERR(gpu->worker)) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index db9e11e7f..9b683973b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -264,6 +264,14 @@ struct msm_gpu {
 	 */
 	struct work_struct crashstate_free_work;
 
+	/**
+	 * @crashstate_show_lock: serializes rendering of @crashstate for the
+	 * devcoredump.  The show functions convert captured buffers to ascii85
+	 * in place on first use (see adreno_show_object()), so concurrent
+	 * readers of the same dump must not render it at the same time.
+	 */
+	struct mutex crashstate_show_lock;
+
 	/**
 	 * @recovery_in_progress: true while recover_worker() holds @lock, so
 	 * that fault capture and GMU waits don't wait on a fault devcoredump
-- 
2.53.0

