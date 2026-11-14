Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637608;
	b=iCbEsWUt+62LxL8RO40Vib3wZ3fJOHT9MdXXy2I57m9eCR1Ztnut2ZRHz1fbLWl/2wfu
	 W4Eofip5u9+GRNDLSy8VQG0Z+rlmp+yR8ZZwnf0tc6+XUQlT9XCaKHKoJdGI6dBa+Fu1g
	 dCuIruEsIujAdFFWwcda1KgU2buH95HegiT2tmb6EidXPmlG8bQz9n7mm+J/oATOZ5uv0
	 FUg4k841V1dc+JTkO2ElJunt2G9BbKYKr+pKAsJDPlCwznAfBjxNUuFIftpQ7I/BPnyM5
	 V9LCZHeAZ9aw4WRpBki1STBceAPdgYipWmBqV9jBs5ebPRh9nMhv/oJUDVDgUrsNCmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/2KQ4epDEV2h9oQK2IfA2VbZzNQVtXN1l25yFvOTJmg=;
	b=XDOyJDE4nIWTtH17ereiooci43Kd0c8j+Z9X2mkXNAx80+UxJPRrCOnFNP8PsiCisdMx
	 kjWyjQNg4vkmJfYjqznp2gYWD9zrDi4AEBMUcO5Wzqo5rpVN/CjNwegJ2v8PKsKm5wMQg
	 MuUbCaPU02kYe34k0S2e2dk6dVOkkgG8o3b+JD8PIcgWGIuojFtEUw7llmsMm/WjFgUF+
	 vIRPr7Hkrlt6NJTXy2AJfI3Is5cZjiuBha1RDVdEHUKdIR15yh62/CfICvo4O3/j92d8H
	 zH0cikIZFQ5FCtR22Css8zuOY5c6fhUe6anG7nqVF02vqJ9F/PuAcaV1tSEqwyY3tAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQBK2BiX;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FFA606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FFA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQBK2BiX
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-372cba0ecf9so190032eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637607; x=1795242407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2KQ4epDEV2h9oQK2IfA2VbZzNQVtXN1l25yFvOTJmg=;
        b=lQBK2BiXEUdAfkK6mwG0Xu/B4bQPBO7FS/DVFaxaz+4qFqHJNX3eOTur1M4Cp+6JKW
         I5hIZHXgabOzrNCevgLs6PN7xZW+PwqX5zKlixdKQcYR5+gaUZUa8AWN+rmwwNHzZu7E
         Xn4pV3oZmqnHpRjJGdUENznL5rNNAKNQxzTzPkbyNSAH26OBCIp56YHlEKpj8GRDmjMV
         NuZGAbPPmG9QqUmdB5PgkRpFv30kvgN3oHI6uSi5MseyAKmVX/0NZcOtnmfSpXRWLvDY
         6Mm66zCrGiQJmv7SEgdVJxqbqOLyqSjU6+kLlsoOVVz0HA5f0UKj3mXzLrg2IFutCJBw
         oEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637607; x=1795242407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2KQ4epDEV2h9oQK2IfA2VbZzNQVtXN1l25yFvOTJmg=;
        b=W2xPh3jVSngb0ULMSqQZC3qA5tU18l9ibxagfXQnCXXxdc0d0dIY5Lw13F+dJ8djXM
         O2o7nTrjpGDP2jWiwjx2oUrJ2JeiDTpPvGKVm+r8tfiJZWYQYRe4TlRubE06X6mHhaut
         P2oVlOK0NxLSbKMYub7CuBpATNuWbLZO8SgRC5oD1iQlI4sWjUp1ZvOWRfAZQOZwNfbz
         r1S+JW8cOX05PJs8jwpxUr+ZnhmYdZHiwaHNDMx5hOLAy0gsvObSTiAX78VyDJ3bDJF3
         rJZhz8omtDfzzg+q7ecgpdK18HMTwopNDTmjd5Fj2q+AHL9TEU2cu6gJHbFcSOtbUqVG
         u+7Q==
X-Forwarded-Encrypted: i=1; AL+hErEbe5EYWWrrRJfcgb5JiBCouXavNsY5VHd2eEcJYbvEvZZ26jvlhL++nU+1MX8bxA9WLkV42nrirWqL6kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lXPm3BLvISNS7XuHC1ion707KareqtA0tCDvNufrzO6dPEtU2
	b3JOnFSgFTqXGlydP2VU57oW8Xx/N+srYKADgWpQy/aOiO0SPoLpxeyl
X-Gm-Gg: AYBFou2n9Gu0hmAK8wvBg2lIC0K9J+CZxhQmCcTio2sdG8uhkeTyQ6Hs+ztu+H5a97t
	wzoFpbdwqpg5xWZfghf+b5Hcd4JWbswGVM4Ce8C8IZSbC/BhwEWsjEjWBCrfdystr5QaKn1RdeE
	bJ0GX49L9W4QNalNeFzgzeu9HyG7N7CVu6jciqI7TXyQWZNTq/LGfqHtKmzQoD6DzJvZ3EiRJ5G
	93VZrQfTcNybW6tRUam1bfqmUhmx7Tw9tQAbEjlBMfklNrnm0yv5PLkO2rM4xikTkUBtCqLsSa8
	2ono4l0EMg4GN8hiS/Bf7EDCfD7giYJK1zYH1fwHPUmE96F7U/n9Fk9RDBwuZwRxFH8hJ5i/gl3
	htP5go7H5GF7AULCCGH7k/rmy6lYhhEnY+6AIJdvJmyEMASN7xBl7KQ0qwP+LdCtyPt/cZgALf+
	uXLD7YvpJC6Ys3DcFRw/s/RYgImSUgUXHgSPkKT8L5Hz6tPCEJccsQ712iBgx/g4vwH4OTwhS2s
	N+20uKQ8jdG2ZMsd1c8FIg1PCvOpXsqoKKzYkJrIZwgzYRM/0f2ibGRJlGtHrFkrAHEYfZwZfWY
	XXmPAD1JAWMEBYKZDprbjfrdutZnw82vyYk3lR/3tXqy3HRm7VmYQobDHApGjXsGQ0Ej8oKzw9d
	/U9o=
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3796057b529mr6474936eec.0.1794637607266;
        Fri, 13 Nov 2026 22:26:47 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm19762863eec.18.2026.11.13.22.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:26:45 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] drm/panfrost: Hold a reference to the MMU context of a job
Date: Sat, 14 Nov 2026 15:26:36 +0900
Message-ID: <20261114062637.2447-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
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

A job stores the MMU context of its file in job->mmu without taking a
reference to it. Once the file is closed, the context is only kept
alive by the BO mappings that still reference it, and a job may be
submitted with no BOs at all.

When the file is closed while such a job is still running,
panfrost_jm_close() only hard-stops the job without waiting for it, and
panfrost_postclose() then drops the file's reference to the context,
which frees it unless BO mappings of other jobs still hold it. The job
interrupt handling that follows calls panfrost_mmu_as_put() on the
freed job->mmu, and panfrost_core_dump() also reads job->mmu if the job
times out.

Take a reference to the MMU context when the job is created and drop
it when the job is cleaned up.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: 6e516faf0431 ("drm/panfrost: Job should reference MMU not file_priv")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
1/2 and 2/2 fix separate lifetime problems and do not depend on each
other.

 drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7c348a0bf1ee..afda794e2aeb 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -331,7 +331,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	job->jc = args->jc;
 	job->requirements = args->requirements;
 	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
-	job->mmu = file_priv->mmu;
+	job->mmu = panfrost_mmu_ctx_get(file_priv->mmu);
 	job->ctx = panfrost_jm_ctx_get(jm_ctx);
 	job->engine_usage = &file_priv->engine_usage;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 4ddf4b722ddf..7022b1b2e020 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -377,6 +377,7 @@ static void panfrost_job_cleanup(struct kref *ref)
 		kvfree(job->bos);
 	}
 
+	panfrost_mmu_ctx_put(job->mmu);
 	panfrost_jm_ctx_put(job->ctx);
 	kfree(job);
 }

base-commit: d48ea86919434695da12d280dccab72b094397e1
-- 
2.43.0

