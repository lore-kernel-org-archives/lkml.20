Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677222;
	b=FwVViJQpNmM7eqBuopIFSTjjy0tYqCOWtpJAAXUaB0KOnLVXdGA4cNoeyAyMOhrFkIWV
	 WZoZc3VfSxQRQDQNNKyUM5YfIElQ+NImS+efaXQZ5EmEHEKiQqmpVeQI1e3V+WWlyiawI
	 DDOJpm/aea7a+9k0bk1qn7JhWE/tZrQ48tTBfVZ5i+93A/47pnwxIOVPmKZV4d5Zo+2rQ
	 bZWBO9wruLOwllj+FyBFwcVcdUcCSHXmD4jWdYSIDu4zbNooCi0kgX1PqEtLsWb0kEplL
	 /4r3NBY5dSUh2WggKHsrnVgeOTW9Nt6zB+nzsYDv6JhTbKMjaZjuk1Ul44lMEjHgkyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677222;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ht4+C9dMEY772FpQRO+VRVQi2AMnCm63uPW871AMEho=;
	b=vfaNvIsxfWOdXvv5tEgboFiKwT7wrMdYAZvGf0+phjUBBLbBDAec6kN/ofdZpxlQn8PU
	 GN0M7/XzX3nwxrVtRVf0M0gDo71VxD4ypZRWJP03h7Pn6WeVXrOBqsP9aXIfV/SJT28Oi
	 PjO1hyokD/Ny5Sr2LEfFs/X2smSTCvk5VaPHYvMW6iCQU0X9RBYU1phXIU18FXJdDsZ4K
	 pr96zSvv5eBWdEydMLaR0ZTH5MhntbBwRxWGiWgk8g6/0McmSAfPnW4oeyILYxVOiCsEN
	 M2TN7GuDarHKTdeOk/eSaNZ9tEBAwozm73tLZVgrhlNYrO5N4jcViPRbx5rH9tZzlWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F/kUfP99";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A43360A2620
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F/kUfP99
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3A61F000C5;
	Thu, 22 Oct 2026 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677222;
	bh=Ht4+C9dMEY772FpQRO+VRVQi2AMnCm63uPW871AMEho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F/kUfP99FwGPGJjGPwiJ3SsAfxTBRsyWDC2YyUeOyECNuDrIAh7oLphrkMDjTYKx4
	 vO7bzZuEWjljwGdl0FAPxWr3FOt8dM5YUUn9P5K1QkvfH8ilRTX+AcuITsxEYT/rgu
	 L1VQFXFjjuILvrWO4FPCvdO5i1oukml6eSJFyRnNXyUKWwxrNWWFaOtKh1ofg/5cdT
	 a8dwZywZjZwvHMqB66iHZ/nracQ6plACOHc9DgYS96zU48TGf4PtrB5ZpS2wiBpKru
	 kMSHFhZ7m8/SxGY5Y5dLgm31uFS2GpR4SDyDNU8DNV8aUFLxefljHH8a/bRUW9uWjN
	 G+lscJSvO0JPg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:08 +0200
Subject: [PATCH v6 07/15] drm/atomic: Create function to insert colorop
 state into a commit
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
Message-Id: <20261022-drm-reset-state-flag-v6-7-f36d640b7e76@kernel.org>
References: <20261022-drm-reset-state-flag-v6-0-f36d640b7e76@kernel.org>
In-Reply-To: <20261022-drm-reset-state-flag-v6-0-f36d640b7e76@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 =?utf-8?q?Jonas_=C3=85dahl?= <jadahl@redhat.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Sebastian Wick <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>, 
 Victoria Brekenfeld <victoria@system76.com>, 
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=mripard@kernel.org;
 h=from:subject:message-id; bh=P0k8mj+gDqmFXtZ5SqhgfD1SldUjK4nLwH6NhSPh4sE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RN3efnwqO4/TK15g3Ylaf2Ov/Uwx2xiVOxZVi4vMT
 wt0263WMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyaT9jreyZmFlvC3Q3R89c
 f6LH4x1TzupjZiq/V9/jYFw/UaA7bFptDV9d3JNpDawBJhe86yNrGBuOi1TMmd7nWDL101r2iKD
 8zNLYq7b/Z1j6r37zW2GXf/IWB47yGDbZd0k5Qb8OhsfnnwIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_get_colorop_state() allocates a new colorop state by
duplicating the current one and inserts it into the atomic commit as
a single operation.

However, a later change will need to insert a colorop state into a
commit without going through the full allocation and duplication path
in drm_atomic_get_colorop_state().

Extract the state insertion logic into a new static
drm_atomic_commit_set_colorop_state() helper, and convert
drm_atomic_get_colorop_state() to use it.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b26458ee98d8..807b575ecc54 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -705,4 +705,19 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 EXPORT_SYMBOL(drm_atomic_get_plane_state);
 
+static void drm_atomic_commit_set_colorop_state(struct drm_atomic_commit *commit,
+						struct drm_colorop *colorop,
+						struct drm_colorop_state *colorop_state)
+{
+	int index = drm_colorop_index(colorop);
+
+	drm_modeset_lock_assert_held(&colorop->plane->mutex);
+
+	commit->colorops[index].state_to_destroy = colorop_state;
+	commit->colorops[index].old_state = colorop->state;
+	commit->colorops[index].new_state = colorop_state;
+	commit->colorops[index].ptr = colorop;
+	colorop_state->state = commit;
+}
+
 /**
  * drm_atomic_get_colorop_state - get colorop state
@@ -724,5 +739,5 @@ drm_atomic_get_colorop_state(struct drm_atomic_commit *state,
 			     struct drm_colorop *colorop)
 {
-	int ret, index = drm_colorop_index(colorop);
+	int ret;
 	struct drm_colorop_state *colorop_state;
 
@@ -741,9 +756,5 @@ drm_atomic_get_colorop_state(struct drm_atomic_commit *state,
 		return ERR_PTR(-ENOMEM);
 
-	state->colorops[index].state_to_destroy = colorop_state;
-	state->colorops[index].ptr = colorop;
-	state->colorops[index].old_state = colorop->state;
-	state->colorops[index].new_state = colorop_state;
-	colorop_state->state = state;
+	drm_atomic_commit_set_colorop_state(state, colorop, colorop_state);
 
 	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",

-- 
2.55.0

