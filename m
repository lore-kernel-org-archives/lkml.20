Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48550560AAA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959899; cv=none; b=IogrZgGYXsA2uWhnXp0lZb9PD7i9f0P1zRcusJCYl2f+0hqn5N4UEPMkmzTU1/uPoAFCgkbeTJHN/WmE/5LL8GSR0mpuxYxTAnAjV7ssVBSmFRbfAutzcAQVdBpqEykccBzWPHJQc6/FoAxray9lp5nOZA75rRQynKVnPoxpzmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959899; c=relaxed/simple;
	bh=HjhyWeti4B7SjB5mFN2MgrH84EFyP8tUxwMVLieObRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DcJyl44xRz2GC20bRqpekPOEuZu0vkiGvqrtZxbi3ElWjqh44IMQu0EScLVMWNGNErB8QzhfxxdgUhqpUOojX60w6WzYGE6irIq205Q0ionVui2vHmmNVbLWJ2D+xKLjYZMv+29i1waGPm8kc26XBANBKfNVu6XAfDnVfgVNb+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s81fORa3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s81fORa3"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so24377975e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959893; x=1789564693; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+AiVzdutjGcRUDNFx0/iYhbxY4PM+Gwrdgc6/3SbWR4=;
        b=s81fORa3lG8EIptUrqDFicuckA965VIOO7drbmwJjPIfdsY5R2+8J4ZMIreVvye+0n
         AE+6hX+EogbuSWySLPlojxqEfV7ieASa36yuLdQ7ys5QzBgMPdQxCaY25zpfQqCugM+K
         ygMgYElghYPu7Pc5Qc4ej6W9bogFQGMiIv+DpaXo5Bo1Pm4bUsjnYAoPAny4pioOim/4
         lhs3JiibXuivcYStSroRESmVIpm5IWZmyQqPpwf6ZyoC7X68uCTDrASO44NSagbnEs15
         FXrXk8kZgr04kPza+iX/ey4nQMk3jC/inF2Rrs3ZaVeascps/CT4xoSILQyx3oHqcZS5
         f0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959893; x=1789564693;
        h=content-transfer-encoding:reply-to:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AiVzdutjGcRUDNFx0/iYhbxY4PM+Gwrdgc6/3SbWR4=;
        b=d/fYUiYKCYsQw2vK5v3Q4uF+OjMeP1hlEtz97luX4PmxgengC+xQePZPyvd5EPdngG
         2WteVJc1rct3il8g1c6KUdllxR2HIaT9xCm79/XXiMi4PaBWMALm51NKMnTN7T5Sct53
         lOhCAifWMNI8Or1dlj8oYzMkT4fJx9OXEdUF0690IWI/XI4r7iWSPTilmA5WgFW5N8yG
         0iiPN2pvSmqZve2/tRe3XhxY8sKkvwSTfIGZ5s3HHZMdRVoNG4wlutKqmiqyww/11sEi
         pBKsYwzOw6OZ/b1lzb4B5eYA6InQvY2Xq2qBcUuBQZjz94mn6qpXNr/mY1/OQPaphILL
         +2nQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF46A3ItqDB4JYHoPyF2qVfe4zyYxECBVetmZbYuLcsdf2D0REpuiIP1tB4tx3nSWSHNJxzI3ZbkgD/cs=@vger.kernel.org
X-Gm-Message-State: AFuF++neEMsAsHVEbDZGy5SlQTQggXJJtd9VJ0SN60L+NqBbC0xerV77
	fTWgBRM2qBCNCzbDAsbSvCh0rWgI27rmvip0xhUt4ZNEULlMaQvy5HZt
X-Gm-Gg: AYBFou0M7sysmMiLnpfo07THSu9RA/TgwJwyim6AgqnA8B8sAn1dTRXmLWxmddR5G+P
	5RWZjGIcHg2tgK14+D/UQzDjfVpMTogHSnHwHiGSp2TmIDQf2yDN9Ry4vEypJ0ciQNKB1ULiv5p
	PhU8qAgz9xsWrIhawaRGiUJEtW5e6gD++mqf1Djm+IdA9K/7TfZNTz5dgSwY3/G7I7xyvQ5dDtU
	9N0w7gvsh/Jbu0vEqzTe+kl9h893T7aYyvgD0pbrsZfGlv6L4VKnjTuPr7AIF0LCXU4zFmGO3HF
	IIes7RyO9eJOy/CdsqxSZ+kypDob8m0yL6rZG5179akAYXzfeep8sHwt9mbitAHSc1XzvS1wFy9
	7rvuqe59kAX3t7y2ATBfaACtNBOyT5tGuDl30ieDzZcQB7ff+C5RrmZ3gGOf4JseASIB57WOlxC
	6YbSXfYbZ3FuJnQ6NlecKQSN6RIvuu7NY2ALhw51cAKhbsJ1NQOI0V+Oue2ZPzJLQmhAPEpThK0
	E6FnfNz5pA0
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cf825a75dmr368157315e9.15.1788959892792;
        Wed, 09 Sep 2026 06:18:12 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1568:cb00:7389:2b93:7e4e:44c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm555457755e9.15.2026.09.09.06.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:18:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@mailbox.org,
	malhyuk97@gmail.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com
Subject: [PATCH 2/2] drm/sched: document the RCU dependency
Date: Wed,  9 Sep 2026 15:14:24 +0200
Message-ID: <20260909131808.2201-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909131808.2201-1-christian.koenig@amd.com>
References: <20260909131808.2201-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit

Tvrkos patches added RCU protection to the returned strings from
get_timeline_name()/get_driver_name() callbacks of the dma_fence
backends.

This fixed use after free problems for a couple of drivers, but we never
documented the consequences for the drm_sched_fence.

Add a few words on the function documentation to note that we need an
RCU grace period between signaling the last scheduler fence and
scheduler teardown.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6cb6f9546493..22103cb07782 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1203,6 +1203,10 @@ static void drm_sched_cancel_remaining_jobs(struct drm_gpu_scheduler *sched)
  * is implemented, all jobs will be canceled through it and afterwards cleaned
  * up through &struct drm_sched_backend_ops.free_job. If cancel_job is not
  * implemented, memory could leak.
+ *
+ * The scheduler fences timeline name is returned protected by the signaled
+ * status and RCU, so an RCU grace period is necessary between signaling the
+ * last scheduler fence and tearing down the scheduler who originated it.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
-- 
2.43.0

