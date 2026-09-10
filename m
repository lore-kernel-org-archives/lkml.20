Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A553CB542
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027214; cv=none; b=Gbp9cKxry8ht+00elMV751qO0aN64avIEd81p7eEI+F1lDGh2S1nOgZgro/1ZmpvAKzqqt4SHIpA5isenKRt30RognrcwbZgy1ljQOFQg4N2cFNgUVGg0Y6I3p7FECmACo0TjQqxTUguN2BWlQ4zYRBqfJX7M3+yfdgQsVBPzRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027214; c=relaxed/simple;
	bh=TlKz46yDXivg9Sb3Ge7pKqK4kdEUM6WKRl6SokIpkT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAelIvKn3mEHtQEvQ/tkarc5WrvM0jWbNOjuwas0TlpTccmJb0nvYEcHMzaSXDqLFpt6mzoaCRByAp8m4neh0ozedo1b3mMxvobxYr0SsWp7lMPrrk6bmIaRR0ynoin1fYIr7SISozGCEXXpZe79rkQH6a6Ran3JoHQDIa7mTdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkstefJ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkstefJ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA01F1F000FF;
	Thu, 10 Sep 2026 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789027213;
	bh=baqzOEa39blnTKps4s0V+tnU2yLnDHylSJ/jJm1nfgc=;
	h=From:To:Cc:Subject:Date;
	b=jkstefJ/M6iHY40YmyEXjIWOTFz+r1hdvYUj+lnff5ZLmFtloVWE74hOYKYDREHEl
	 rcAQ6EIhiP5RIVUJC7ks4IIb1tGRJCs86/AqMHBhqTKbdcYEL8Y/b8sUtsaU51dQne
	 fseTJ81gOBeds85Trk+sdo44MCQKs0wS38C0nYopjzpUC628ocAAplbe5Fcr4ofHvF
	 OubohARgKHFD+c/tGU2er9si6gc1rcmo9ogvgyVgJvReD/qQ+em7zUTPWusmhLxkrZ
	 d7n3nZQMdrxnkany8Igj0JsBqeNzsDgoNJUYKU0US4iED19Smab1wr297t3ugAG5st
	 qvAgNrYbGpfpA==
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
Subject: [PATCH v3 0/3] drm/sched: Introduce more locking to entity
Date: Thu, 10 Sep 2026 09:59:40 +0200
Message-ID: <20260910075942.2000338-2-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:
  - Fix ordering bug between spsc_queue_pop() and
    drm_sched_rq_pop_entity().

Changes since v1:
  - Remove a bunch of patches; make this series only about locking
    entity->last_scheduled. The rest shall be done in separate patches
    and series. Consequently, also do not lock spsc_queue, yet.
  - Move lock-cycle patch to first position. (Tvrtko)


Both Tvrtko [1] and I [2] have recently proposed some improvals for
drm_sched.

While taking Tvrtko's feedback into account for my patch, I realized
that both his and my patch can be fully replaced with a bigger and far
more beautiful series.

If I am not mistaken, it turns out that the entire entity->entity_idle
completion is also nothing but a workaround around the grave mistake of
not using the greatest helper with parallel programming that exists in
computer science: Locking.

This series adds locking to the last_scheduled field and all checks
related to detect the idleness of the entity. As before, the
job_scheduled event queue causes the periodic checks.

This way, we can get rid of memory barriers, RCU, a few lines of code,
make things more readable, understandable...

Greetings,
Philipp

[1] https://lore.kernel.org/dri-devel/20260611123423.39819-1-tvrtko.ursulin@igalia.com/
[2] https://lore.kernel.org/dri-devel/20260626081942.2122144-2-phasta@kernel.org/

Philipp Stanner (3):
  drm/sched: Lock drm_sched_rq_pop_entity() externally
  drm/sched: Lock spsc_queue_pop() in drm_sched_entity_pop_job()
  drm/sched: Protect entity->last_scheduled with spinlock

 drivers/gpu/drm/scheduler/sched_entity.c | 53 ++++++++++--------------
 drivers/gpu/drm/scheduler/sched_rq.c     |  4 +-
 include/drm/gpu_scheduler.h              | 10 ++---
 3 files changed, 28 insertions(+), 39 deletions(-)

-- 
2.55.0

