Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6BF3F54D9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027221; cv=none; b=mtvtnd2Fg3yeViDUrI+mxYhQbVLwaKj0HhjNGfy6HWpp8hMDefv77OSWcY5FtNqI2WOjODnhlwARGOcTtz5Y2PY4XT2g101CEswP8TfsTVKMmcek5WIRzY7Er0tg5j7PWpYjAdmSC9CXG1UU1x/vp8UZAwY7yH1G+TxgQxCTLKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027221; c=relaxed/simple;
	bh=CsaZsrfm5mEJMViBizDHKCaz9p2JmxXAzX40r6ofayo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RNHWQU3dH/WPVeYsOeM8xEN3JiDNwpg4VD1hRYRqYFRispIuOWsNRkr6Rt1UEGS/Oj+/TUE0ZgNY85kNE78WxrJMA1sMx8RpTu1Vvn981ZRRMCQQf46r9Zh3HQFPTf+R2b8lLSWT6phLD3ZdYwcZSgmV2OLlFrVZLCLm67GQxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuOJwkwt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuOJwkwt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A731F000FF;
	Thu, 10 Sep 2026 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789027220;
	bh=hdqZMf+Q3fCD1KfNYFni9UVbypZbZ+uQ54oqG5U6q0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZuOJwkwtd0qQW5pYo/dNkTIcXlgqCpRDYdc53tWdkiDOvRVSrJv9y4h6I4x2SXLRR
	 NXosFSngbQEtSzPY9M8u7L1thsIBucnGPkdCsGW/pjGaSvD/M7LX1tsGp/Icwbn3T+
	 nDwb1ra877GdvjlxIRM2mzG9w5GX1YdctgodwyL5FQM4Vjl2sq7poF4lTFsqLEDdfF
	 shbGov40PL3byTTjLXvoGI0/5TmOWuaNf5uOP7Uc/4UXkWneIgbfvhhmpUXR1PdVbx
	 RewTVhvoxlejjVueYr5jstxpNgGc+JNGLKpo5Fq+2UX9YHANGXhkDsWOAELOVpjuKT
	 Ort/MA8mc1qOA==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/sched: Lock spsc_queue_pop() in drm_sched_entity_pop_job()
Date: Thu, 10 Sep 2026 09:59:42 +0200
Message-ID: <20260910075942.2000338-4-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910075942.2000338-2-phasta@kernel.org>
References: <20260910075942.2000338-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a preparational step to lock the access of entity->last_scheduled, it
is necessary to lock the call to spsc_queue_pop() in
drm_sched_entity_pop_job(). The reason is that later the existing lock
needs to be moved upward and the relative order between spsc_queue_pop()
and drm_sched_rq_pop_entity() needs to be preserved.

Guard spsc_queue_pop() with the existing spinlock.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 274d7a702298..e168f445f2ab 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -563,9 +563,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 */
 	smp_wmb();
 
-	spsc_queue_pop(&entity->job_queue);
-
 	spin_lock(&entity->lock);
+	spsc_queue_pop(&entity->job_queue);
 	drm_sched_rq_pop_entity(entity);
 	spin_unlock(&entity->lock);
 
-- 
2.55.0

