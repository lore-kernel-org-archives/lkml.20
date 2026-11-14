Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644434;
	b=y/quUikIey1zQkZtOAj4PCu2hoPdsnPfCOJgjeTNHjh2Pq0e7r6RYEQO/XbKMXwFq/xX
	 jYmOR3ikeaWhvBto2c0OqGvZURtlHUUXqF8w+3BisVBswG738iHliMbcphURuwAXs/2FE
	 W7vNpHUSCVDMXzxipcJqYDBFDYlogKpQv0aY7v0qQ9rj7vnTFpVKEZbaIby/HFFqG/uiI
	 1e8FeJRXONm+FMWtqIavBFR3tWDLipeVr5t2lvIOxaGdrBgFXsc1Tdcs95e/G45QJZqlY
	 s7dr0VxRowY1eLGChA8CnVqwdQHEX0C3WyxV3LkZ0y5KcPZBIDT2ixFZwmkMD0+rp8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hp5f15bouPR2UtUnvKHkGzva3ieusdxkwfWzQA5rd1U=;
	b=VoNWBNNevFES2o40B1AMG3RCOSHcEhpY05Ez6E0WZPIEL2rLd9hlKjF+TDX/rQTN5ZHo
	 hyrKPPRgdphbRNyvScruU7xpJkWxVbWg2SMoGu+38VO5FgkEwXIxqBpLGyuIj20On9BMX
	 msu05vqpwplLHmT/DXOgvMYxTIEMKnoQyuZaeoWkFZYyvFtvdAvyTIDZljvWduRkZwEo8
	 9fKXSjkDkUw4RoABwI5a3unPYX+at+5Xx536BJn7t2niApiNKzMox1PxWvcSAeG8NZz+Z
	 vRHmZhgdZoLladw2w3k4uKYyZLo4lw2Jilh61xaPzJn9RIAgC8KZjGCFq3fEietS1Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ogL5Jhi/";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECBC606A337
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ECBC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ogL5Jhi/
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37123334649so194372eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644433; x=1795249233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hp5f15bouPR2UtUnvKHkGzva3ieusdxkwfWzQA5rd1U=;
        b=ogL5Jhi/GfHkxdTKHNOnIFtC6kkoCGd8driSM8hIkOSUwjby9siaUklWren0mcBsKf
         K+c6YEAkVLEKe829qoTWj71ZVZnBERVjC4GOSk0vVvP5A489MTRiLfLFGAdccHuzERnk
         7/pXEAhEg/48zrsAfTG333OGixsBNJJOwQ9pr73jt6SmwtKKLO7ukh65eFU+WjYvkDc3
         97G+7pwCJCE9wM5FJU3iwkOR7o8k6+07nMiMypmKzcJyMwmUMZgcZ5WTmsmmv4QRPuN3
         u0DfU4j8Dg0++ZN+7Gh21EV/jzSlv8CtjFI9tvytUjoqhqS+xfsuFWjc6eqYl/Dq/k52
         PX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644433; x=1795249233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hp5f15bouPR2UtUnvKHkGzva3ieusdxkwfWzQA5rd1U=;
        b=rxUM5keEz5UDPJLFx5mK+RVEsSCJ3RHzIiiZ6VVv2/gs2OBI4DjQby1uxaAqnwFGFu
         LsdNQc77s2xuiPh+HOuGg5WFzG3fqUgnJrnlthSywz/neCLBAbNzdx9NSKZLOEfF7tOS
         TC/etsVG06sreQ/AILlh+u6fXIc1CL7f6YSipIAs4lbwqZuvyJzQhZRHA0YUSc3TnCOF
         jQZ3jrBj8X54/BHMaEWZHVZ6kRcZO3+j2DaSH4VGWiaPCqKjQ5cYcgBNtpq92wA+tBMf
         0HkWJWZnM1c7ItRXXD0Q6gLOx8+k7KsLdYvInD7XAMVrie4eaTmtjmHwxECM7NL1jKs+
         7fZQ==
X-Forwarded-Encrypted: i=1; AL+hErE55a0RJ25KzqANcsfjWqd8ghY/TMkyXUst02zStkeF7Mex9+XabzsEWe0j0iHp56nInuplbQq5jmNkmbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v5zvEcvJBBQ/IzBD/DlpQvss2EnmrFPewD6dSs3S8A29CSB7o
	oDBflbv51fmOX/LOjlmBfgXmFo8MX828m3dEgukh374cLGpzckOp6zei
X-Gm-Gg: AYBFou1C7H+QORctXec7KF9n4iS+ABEXi0DRDS0sIk/s8ltY2WV6IGEHRaw25dkbwCB
	fnwo0d7kt/SDsWvxH4kb5r65zd191QhFhhm0rlzu/zQaKtJqic0Tme9mK7ysDid9GOGSCvH+Lxa
	/wUTYnqGObHp14cWVcUnqWSPMy8w5V89dc/lxLaQmGOHi0C6DUGsmdgwggx9Rlrosxs53osf0t2
	wj5IPPAtcWLe8Kluk066Eea06IOuyEYoYeZzkkvyrGJ110b430H6X5EQk69y6N6SKIEBb1+DynI
	eXTG/WUdUVGn/zD5OrmdICoEMX4AnVOCkNjCy9cUNccET8NhdQrRXXvA3RgM1zHuXGxr1YhqlT3
	pSAtbaVcZGSbK49atbHYxWlHzxmfFPKaVmg2rZtmuSdb/4SInzYKD/flasQqEYuUHaIKFXOT5s9
	x4ooQUf+fsh60S57h+4Q/qaJ61DZQgQrenfxeFWdaQbuECvxeneyVp7UlBFNSjzU2gsIAWhpU1q
	CyJjZv0q/yTjlmvYZd4W34KlXaWLp10C8CbsWsrk6/j3bx92IyPtvDF3B+NcHIymj2Whn1X/UHb
	f/8T8BK7O9yBaFEainJ3gJav68KPefsj+5ImpHR3vcPKsKwAVmaKX/Lh4USkP1FWEoHcKNDXLYc
	0QCY=
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr8108167eec.1.1794644432522;
        Sat, 14 Nov 2026 00:20:32 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm19524043c88.9.2026.11.14.00.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:20:31 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] drm/panfrost: Find the jobs of a destroyed JM context by their context
Date: Sat, 14 Nov 2026 17:20:14 +0900
Message-ID: <20261114082016.2454-3-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114082016.2454-1-arpe1618@gmail.com>
References: <20261114082016.2454-1-arpe1618@gmail.com>
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

panfrost_jm_ctx_destroy(), which runs on JM_CTX_DESTROY and when the
file is closed, looks for the jobs of the context in pfdev->jobs[] by
comparing job->base.entity with the entities of the context. Since
commit 96c7c2f4d5bd ("drm/scheduler: set entity to NULL in
drm_sched_entity_pop_job()"), the scheduler clears job->base.entity
when it pops a job, before it calls run_job(), so the entity of every
job in pfdev->jobs[] is NULL and the comparison never matches.

The jobs of a destroyed context are therefore neither stopped nor
detached from the file: they keep running after the file is closed,
and with profiling enabled, panfrost_dequeue_job() writes their
engine_usage to the panfrost_file_priv that panfrost_postclose() has
freed. The same comparison was used in panfrost_job_close() before
commit 6aa8bc58ac88 ("drm/panfrost: Introduce JM contexts for manging
job resources").

Match the jobs by job->ctx instead, which a job holds a reference to
until it is cleaned up.

The patch and its changelog were drafted with an AI coding assistant.
The issue has not been reproduced, and the change has only been
compile-tested.

Fixes: 96c7c2f4d5bd ("drm/scheduler: set entity to NULL in drm_sched_entity_pop_job()")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-214229@kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
Trees from before commit 6aa8bc58ac88 ("drm/panfrost: Introduce JM
contexts for manging job resources") have the same comparison in
panfrost_job_close() and need a separate backport; there, the jobs of
the file can be matched by job->mmu instead.

 drivers/gpu/drm/panfrost/panfrost_job.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 7022b1b2e020..7a3137dacb9d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -1105,13 +1105,15 @@ int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle)
 	/* Kill in-flight jobs */
 	spin_lock(&pfdev->js->job_lock);
 	for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slot_entity); i++) {
-		struct drm_sched_entity *entity = &jm_ctx->slot_entity[i];
-
 		for (int j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
 			struct panfrost_job *job = pfdev->jobs[i][j];
 			u32 cmd;
 
-			if (!job || job->base.entity != entity)
+			/*
+			 * The scheduler clears job->base.entity when it pops the
+			 * job, so match the job by its context.
+			 */
+			if (!job || job->ctx != jm_ctx)
 				continue;
 
 			if (j == 1) {
-- 
2.43.0

