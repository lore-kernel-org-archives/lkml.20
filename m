Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503539;
	b=DgomC9DpnsL5vQjlkkGuffFTYOxtQowWdfnhE59KHJwssbMEvvZawHUS+GE5jDbBZvF2
	 S4hDo6XS9Ro9tZeCB81LYLTA0rSywpnB9m9QggbgeO+MUHOQ6dVEbnpymzKK++2ewMyOA
	 KYv2xGl3xgTsfW4SpJ00smXyQurgc2taDBXyzN15cglUzqk8QFkeYld0ZGJgjtzOwTML3
	 40nBZlvt706nExIY725wSYBDdbpBJ5srgp2GFl8TIshV7aGS35O1+4irI9jNRVt3W7Igt
	 gjyVkLyXJ4+phH0Pq3PpbCwT9ft3N28w7KtDiyyYYpSg/sv3Kffv2LAfNZeWvYG/XQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7qKiaMfPXurmREX1W524fvP1dWjjQw0qkmJh5bTsW7M=;
	b=UjXGalvwBZaQ09VHGeUKSVhJPlQku6SG8lc+J+NI2iifGYXBt9GGxY/1ctgoTRXQISvB
	 WxtXgA++mCElGRWfA3A/7FdzBlBsynfe73vmrHn2vJwKDbqJY1hUuT0uxvFstRNGqgsxi
	 OGpLSzfmt1otrbbloGDUyLnZo4k65iwwYM+qtTkQR7KArjPDFN5EJk7r0G/lv4kr8nryw
	 xEQSNO4LnZNe7OhAQfo+q4ixoq6DJYmnq7TsZ5xP+IBdUPCf7RY16kTZTNQWSVorwgPfx
	 mQTWbGrNWCwYgY+wks0bXxerDjxY+CAbKuOVLs+AhJ8CJV8kRWEM0BuButbPBVAkK5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b="OG/3gwiS";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E67606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E67606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=OG/3gwiS
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso46729a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794503538; x=1795108338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qKiaMfPXurmREX1W524fvP1dWjjQw0qkmJh5bTsW7M=;
        b=OG/3gwiSbVbrZvWorPjSmTb0Y5E3jANFERzLMRUD+F7lbXwHBe2WxAPOzv0WLit3lk
         VxkgysCKt+ob9g+UvhYqtNFNOcOsJVcPVKsfhJZ+F9aR+8ttM3+sr9D+j0jsXn9RnK1D
         wqhAVUI3/Kk+hRPUENc2OZJmy0XLff6P58fgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503538; x=1795108338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7qKiaMfPXurmREX1W524fvP1dWjjQw0qkmJh5bTsW7M=;
        b=rbpRXFBq/PG8M3D0SjWv36CDxZoY7pPCCz1gOGhSOibCLLr8b0sdS14KR2ipaqWNeG
         8lZVXVBKFALDMFdAqO445SJNDFj96aobTSLX9k8f/DSuXOfhugDkRQbvrlHPjQI60gaz
         hqFnbbpyzmiQ5mkUoT4rFSO2UJ9Hk57FoDiAWfwbuMaI5DkzQ8vHegFeSc8KzEqHfwj1
         CdEZIv7mxdvcghyKOkYLrDsqvfgzUYtmVfp/UT4efNnVJX+qbAZukuWbDNpChemaqfQw
         LH5XyITRYlpit1ShBzq0dLKSz9TLriFCVRbLCTY7604hIdzcnEiLwYe8NCndNSyFmXqK
         tamg==
X-Forwarded-Encrypted: i=1; AL+hErETiakTxGhr+LF6AxcefA55h+sBUTAeQjdxNaiEmg+BYZsN1sedjpt281rdHuGmzhTx4dCMIVt7w1xbwuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sXsxfqw2IsPGHxvJXBzHI0Vfs6Occq14SKscirJXV1d0sUpjP
	s7bpC1iQtAsyYoS40rq5sLfAgUIgFexDFAbANO7DJhrPzd8GgygxVqyS4P1M2EiZS0Y=
X-Gm-Gg: AYBFou3ntF5yBS4S7YuQMjPwP60ASSmFZTAHibhZp4BV3wqcu+QRaGXe5psE3b8VX2N
	8M+gfWASw0Bh/S1PGs+PsX1M54Qh7n5jaJSF/xhJQIbuT+iPdfUUotEBoNl/krU5dhK0wuGsCuU
	Oaa/nX4MNsYR/mi6Ws+S6YMJToKnlMZZM/5VNi8ig3CYSGWoDixwZdZdCFgUwWZ2OmP3W9vFdlS
	b7kVl/EXJZmyUti6LVM5c400WD//YtSz4N5gJYRpGe6Vwi7bxBZACMuUHhfeMn4lhOH9WxTdCxF
	CBvJC4J5dyaOVZdkYUtJLyrBJ3JUQcwOYRfVfEEcXZaWJM3Yl1Q6PC8ZwIIBOOH0ipDJZLivoYd
	c6rtzAfaHc1TzeE17nG9mZB7LheSo660ATfLt71CoWM6ENB6m//63vsjs1zikxhm+PBNQUlEATd
	RBweQBx/JLxwQ6trS7L+iEOaZXyBN2GLsml0SA42OALCNnClQsML5e+OIQxbM6QGxsolWk6P/m8
	cMIvoxEPa9yubfrM93u2oUx0e1/8DsTC+ktAe/gnvGrV0EXuSD0z366hLayJkGGGV2t5zs1oFVK
	z7LRFMGUp4bocVcV+rwOpTlB+K1UObfesCK0kJkAhpml5oDY8oVoI3EEnYaHj2zdF+oQDdKpPr1
	R1NtFVnrPwD912sAzKPq+12vjKOLopWxWOw==
X-Received: by 2002:a17:90b:2fd0:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3b182f6607amr6241433a91.15.1794503538590;
        Thu, 12 Nov 2026 09:12:18 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm263682a91.1.2026.11.12.09.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:12:18 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	mcanal@igalia.com,
	Heiko Stuebner <heiko@sntech.de>,
	Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v5 1/2] drm/sched: Add drm_sched_entity_get_runtime()
Date: Fri, 13 Nov 2026 02:11:43 +0900
Message-ID: <20261112171144.3151554-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
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

The scheduler accumulates the time each entity's jobs spend on the
hardware for the fair policy, but drivers cannot read it. Export it so
drivers can report per-client engine time through fdinfo without
keeping their own counter.

The stats object is refcounted and held by the entity and its jobs, so
unlike commit df622729ddbf ("drm/scheduler: track GPU active time per
entity"), which was reverted, accounting a job does not touch the
entity.

Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 03e68b4102d5..ac040f95876a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -238,6 +238,31 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
 }
 EXPORT_SYMBOL(drm_sched_entity_error);
 
+/**
+ * drm_sched_entity_get_runtime - Get the time an entity's jobs have run
+ * @entity: scheduler entity
+ *
+ * Returns the time the jobs of @entity have spent on the hardware, measured
+ * from the scheduled to the finished fence of each job. A job is accounted
+ * when the scheduler frees it.
+ *
+ * The caller must ensure @entity has not been finalized.
+ *
+ * Return: Accumulated runtime in nanoseconds.
+ */
+u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity)
+{
+	struct drm_sched_entity_stats *stats = entity->stats;
+	ktime_t runtime;
+
+	spin_lock(&stats->lock);
+	runtime = stats->runtime;
+	spin_unlock(&stats->lock);
+
+	return ktime_to_ns(runtime);
+}
+EXPORT_SYMBOL(drm_sched_entity_get_runtime);
+
 static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 					  struct dma_fence_cb *cb);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 3b0978fa8cf0..96a3401d4c88 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -730,6 +730,7 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
+u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity);
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
-- 
2.53.0

