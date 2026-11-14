Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644441;
	b=2x0b9j4lrF1wmgVaQWVgyGc4Z7dkLXNVXKx7Z2qe/D2R+NGKnL1/BKeAPCaUHdZpLCc/
	 itEDsoW33ouf1RJUO4E3KLNQm/xK8TWjRbRopPuI92H3dlC1b2or2UEQMIpGteDuE9lMe
	 b4xlf5E1jABYLp63j5eTyIy2flD/YH/7BFfJFG6a5fOhYHXAiCKNo4d4x3jtVReUrmMEZ
	 25ixMUEymkNNuFq7wye+JHjR5mruEZVpSCoWb5fG0oECzafIVO4uoNhBh+1Rfvlf+ZLsp
	 AaX9hJgsxWMDQhalL+GEpfGfCeZVsvSied+pAAl9DV7187tkqzGTNrLl6EtpCWsw4ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1Kn39X2pYs+jW+52+qPxiOSR0mlkbzAfD+hyR5VjqrQ=;
	b=M1vBH7XqVrJVtRZjGSGddX71hAEdBibxAUrFP7QgV+dj0YlqAj2orjg2BJ2EwGp8ua9q
	 Ru0O+ebfmisNlBYOKoxCDzoty7xELyOB4skXS65KLpcffYn7gf+ZwJLwqdlAchVoqVut6
	 5g3y/jyhNzo68Trk7YzF94JCAZvYZcn5YE1ZS5KB4w6IDRO3QhO1gc1hF3p+DQzxnK5Of
	 oDDH4vPXnR03MeOL8ftK7O5gq6iYo/hfxVVUXkWz4VnxXaMzejcNw38UglOwW3OS8nE9j
	 2JmYqhM9FqxMQjDGtX3re4eLDrjYWdAxEyoR9Z3IBuNEHotH1sWw3jBiTMjBNnGcZmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcZeXF2y;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7786C606A88A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7786C606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcZeXF2y
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1397a4855beso51842c88.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644441; x=1795249241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Kn39X2pYs+jW+52+qPxiOSR0mlkbzAfD+hyR5VjqrQ=;
        b=GcZeXF2yTQkfTeNeSdjMqq7nJymfaMjUK4FDeZP9C6VYTcTuHuSrw4/XBY6W+ffgYO
         w4tX3RQTh/yf+gEp7Q4ov03++jE9ozJpnfy0JqqrUbN7HxwVWelN3L71GT//SMN+1Tpg
         ej2pArxkLnc8VX0APixyizvV32hWKiS6pxVCLIdy1QFQm7rUnpne/WC45pvcJc6h5CRW
         Oz2OqvkyZnosUX69bbVkbvuYhTF2+szsTzd1r0URUJBh9vgrKi7btYGG216tPISd2vzO
         1Y+H9PdzEHD2DHADcU9lh5Z2RGG6UH7L9SJRoIs92f4ivx8dDbknEHLnqKhIXrYcJlK1
         qp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644441; x=1795249241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Kn39X2pYs+jW+52+qPxiOSR0mlkbzAfD+hyR5VjqrQ=;
        b=FccjVdwQNWYid4OUPRwNtqhLcKkhvJIdKf01k/w6IJsv5X9VmR4w2VEGRbqe3H4ySt
         ruWRUJFbq42pMMcwxQL/lekzEA8G76IZnvu9L5LjN/FnxQJWzLiSfvMQl2E0keypQ+xl
         PsXrx2kCXpfo+pQyEs0ub0iUIK8rFm7MoXAzCM33rnVvpSU8A4K2DCWXWZXZfbVyaQdB
         50+jJC2Eh9WoSzhIRlWndG/8vDDDIvc9PguiCM5H5HM6BrcnzGUbx6ry2A0JGp0tT1HN
         2NL5vu96M8sP8WHgNCYaHGgaIAUAZWW18zeK6TYyEA364RvzuWN5PQFwiTIXNc0PzT10
         +IFw==
X-Forwarded-Encrypted: i=1; AL+hErFatvHQv/yiNPmXSfaFKqvu2PET3ghMQsZJd9qXAt31KM+8rEssc/DlSrv+sJjUw9kz/n2G3zXhEjrVa3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kwbxLc8brErQgJa6d/CIqd0z9AgiKzI76J0tt6kzlNsZYl8WZ
	z/r8m4B0mxagsbxxY06jrbFFWkMCY7yme1juOj4i4M8AyyXNXiEpA/YT
X-Gm-Gg: AYBFou1Idd0sEWsXxxuweQ80NJv6dI/2lHkQ7wVaagzpAOORZLM1LBRDGW2YNFjRL3q
	f581j2IM+Mj6IDLMFmhQY9Cwg/hBLNSMn126e6pBsNd30KOLgtX0RD+ji8d5YLM5WyMd2A3HTM1
	Y5auImwbl5SZnynX1+59xhaEGUv5GJjxnVnv2yau3NxUHE/ploEz7pJUm4rrXhSq6hnVS4j6Dfe
	mb1s6Giz9i3Lke9K3BgihfhacUv43Y1S9U2+JxH95vaNQ/AWvXwkdPei0uOU8QMkKohU4+Rsuv+
	y20LLMDP20/2zqLDXaur+JQyN3Q7XE3Bre/8wqRGnwdepLar6c6GyXbwV3N5uHSqMXnVgfJe1Ef
	472AKPNe/KBTu5IfpRiecIgA1gItKy3/wmEFiXlzmEnVq+ztA0KXd4EnXLKMYxgfJNsH4vvda6c
	/MEty4f8JNuV88m2MVWuZRVH0GFsuzD1JOiQnjm1nCvgmHZJTH+Y9q/hQtW+aSvO/Rc3j1vvWdQ
	nkDj0cA/Qm5pEGL6y8qjUkF2BGXN8rGL+unAxdjn5JswqCuKQvfFeGTugUHFwwxH29UNYSFuwiT
	FsvUEXtZau5r0h4wm9vXlEa7LvWv1Wy/Lp+nXfrAB+eZi9rmfv8Ohv3a6LQoxJ+gBq/YXu3eB31
	wm/A=
X-Received: by 2002:a05:701b:260b:b0:143:5c2a:e45f with SMTP id a92af1059eb24-1b502fe3f20mr7840573c88.0.1794644440684;
        Sat, 14 Nov 2026 00:20:40 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm19524043c88.9.2026.11.14.00.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:20:39 -0800 (PST)
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
Subject: [PATCH v2 4/4] drm/panfrost: Don't destroy uninitialized entities of a new JM context
Date: Sat, 14 Nov 2026 17:20:16 +0900
Message-ID: <20261114082016.2454-5-arpe1618@gmail.com>
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

When panfrost_jm_ctx_create() fails, it drops its reference to the new
context, and panfrost_jm_ctx_release() then calls
drm_sched_entity_destroy() on all the entities of the context. If the
requested priority is invalid or not allowed, or drm_sched_entity_init()
fails, some or all of these entities have never been initialized,
though. Since commit fd177135f0e6 ("drm/sched: Account entity GPU
time"), drm_sched_entity_fini() then dereferences the NULL entity->stats
of such an entity, and since commit 2df5efb45425 ("drm/sched: Remove
redundant entity->rq initialization and checks"),
drm_sched_entity_flush() already dereferences its NULL entity->rq.
Userspace can hit this with JM_CTX_CREATE and an invalid priority.

On these error paths, destroy only the entities that were initialized
and free the context directly. The context is only put once it is fully
set up.

The patch and its changelog were drafted with an AI coding assistant.
The issue has not been reproduced, and the change has only been
compile-tested.

Fixes: 6aa8bc58ac88 ("drm/panfrost: Introduce JM contexts for manging job resources")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-1f36c24e-a878-442e-991c-1b387017bee6
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 0dbed7a50910..95fd9521016d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -1097,6 +1097,7 @@ int panfrost_jm_ctx_create(struct drm_file *file,
 	struct panfrost_device *pfdev = priv->pfdev;
 	enum drm_sched_priority sched_prio;
 	struct panfrost_jm_ctx *jm_ctx;
+	u32 i;
 	int ret;
 
 	jm_ctx = kzalloc_obj(*jm_ctx);
@@ -1107,15 +1108,15 @@ int panfrost_jm_ctx_create(struct drm_file *file,
 
 	ret = jm_ctx_prio_to_drm_sched_prio(file, args->priority, &sched_prio);
 	if (ret)
-		goto err_put_jm_ctx;
+		goto err_free_jm_ctx;
 
-	for (u32 i = 0; i < NUM_JOB_SLOTS; i++) {
+	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
 
 		ret = drm_sched_entity_init(&jm_ctx->slot_entity[i], sched_prio,
 					    &sched, 1, NULL);
 		if (ret)
-			goto err_put_jm_ctx;
+			goto err_destroy_entities;
 	}
 
 	ret = xa_alloc(&priv->jm_ctxs, &args->handle, jm_ctx,
@@ -1129,6 +1130,13 @@ int panfrost_jm_ctx_create(struct drm_file *file,
 	jm_ctx->destroyed = true;
 	panfrost_jm_ctx_put(jm_ctx);
 	return ret;
+
+err_destroy_entities:
+	while (i--)
+		drm_sched_entity_destroy(&jm_ctx->slot_entity[i]);
+err_free_jm_ctx:
+	kfree(jm_ctx);
+	return ret;
 }
 
 int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle)
-- 
2.43.0

