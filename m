Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677215;
	b=ev3i1zujdFzumKBJ2CImcxDR2+1mXZEvPMhjOUoR1rT3A8Ghfc9BDDEffl7nEshvFnUj
	 9MdgtfCtLmTH1MzpBnXD6KPPxW/UY+95lutPrr1Euc62a/n2xnPcDtYeDYZrUEtCnpzOj
	 cxrYRr+b1azn+/zrqz/8DhOw1MhwXCyFv+GrFQBfkiyxN+2qM0phElJaOrN9DRzZDVgIj
	 2q9TEohYjT8ZHvV52mZogfh8N9as1odYsVtuIUUpIT9xEpbnJ/J5C7NhWWROgEG9J8L34
	 mNdbVZVwPgMva7EFVgXgC+B+QY+HTilOnyDzmxPKwgBAcXYpT00mJ9n3zV0pvCouPoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677215;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CzmNkiMv5ZgXclvYn2qzX3vsC5a+5Aneg6GuHpphg5U=;
	b=oNH71yoa60MAgS0zvQOauRgPH+82saWC0Uze9iY77pKYL+LC8YLhsbWrgg4YBsQWgYtT
	 e+fBMRJkHSTlXiocDgxMRD+Wfz3yz3BdJ0035a//CUtDhDU+9nKnROhByiltLX4Bb7KZQ
	 BI0ovvKhPG4uNrKfNPQMceYyhUq3gm6qFQhhEKUfRIGc6IUFBp/shyPV5VdsBljihMaIp
	 sLqW5NrGDM6JBdjrj09LF9LlqtWMHIwOBMFhQu/HwEbEuaTAP2QYjoJXGhQxMY6P+GM32
	 hIa2O/k5vWnyBQL2HXxc7XUQyE/Es/J9ZjjdIl71zO3qE6OFT86iCGp4A6AmXsbnPuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtJSdTrt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AB360A262E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtJSdTrt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27651F000C3;
	Thu, 22 Oct 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677215;
	bh=CzmNkiMv5ZgXclvYn2qzX3vsC5a+5Aneg6GuHpphg5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EtJSdTrtUtpc8GIFb8KKjWN8/2FyRDb7wjf6YBX6QWZutEaAe3H3V07YVmJatvz0O
	 8xRvPErOLaFCShgZJ0aFk0kMbSteOptlgY6KVj7v/PJ89ev9CAyQtAorkCkLqWRmIT
	 PgEkKpd8X/fPxjL66e9CMnTJWVVcZ58ejgRJVnpQhF4Il46eJ8hWB0IenFx2513FlF
	 TmrzxFoQ4CWw53mCDdoanT3G9j8fpSmPcSNoyeEyj6KhjRhL/O4mRgOcAO9EobV176
	 ic2hKs4+gmGeLMqu4aHhXbdO+H6yON+s+037I/B7WRNyfFBTNha6nW5p/GntLbNHaT
	 ghGZBafsfElOA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:06 +0200
Subject: [PATCH v6 05/15] drm/atomic: Create function to insert CRTC state
 into a commit
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
Message-Id: <20261022-drm-reset-state-flag-v6-5-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xfMzixrk5y7ZgO75udLR6cvkHU3Ewzag0kKdSZQHgRU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RF2XCDXKKZUwNJx08PXU+c3mmvVT/sSGDt5jId7rb
 S49crrfMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACay8C5jrbi/5OFmF7MwtzKe
 tIZMlcnbG0wtLAwdpmqezvh01uu2asr8rFTxyNnckR96frU9uJzHWF8ZwdC4P4e5dlf8qc1iqWd
 1LBrYXG5fmnJqap7YlvYs78h1Sb7/tY/WGD90ZlJ+4ZEdDwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_get_crtc_state() allocates a new CRTC state by duplicating
the current one and inserts it into the atomic commit as a single
operation.

However, a later change will need to insert a CRTC state into a
commit without going through the full allocation and duplication path
in drm_atomic_get_crtc_state().

Extract the state insertion logic into a new static
drm_atomic_commit_set_crtc_state() helper, and convert
drm_atomic_get_crtc_state() to use it.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 80436adcfb7f..178eca95d0e3 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -434,4 +434,19 @@ void __drm_atomic_commit_free(struct kref *ref)
 EXPORT_SYMBOL(__drm_atomic_commit_free);
 
+static void drm_atomic_commit_set_crtc_state(struct drm_atomic_commit *commit,
+					     struct drm_crtc *crtc,
+					     struct drm_crtc_state *crtc_state)
+{
+	int index = drm_crtc_index(crtc);
+
+	drm_modeset_lock_assert_held(&crtc->mutex);
+
+	commit->crtcs[index].state_to_destroy = crtc_state;
+	commit->crtcs[index].old_state = crtc->state;
+	commit->crtcs[index].new_state = crtc_state;
+	commit->crtcs[index].ptr = crtc;
+	crtc_state->state = commit;
+}
+
 /**
  * drm_atomic_get_crtc_state - get CRTC state
@@ -456,5 +471,5 @@ drm_atomic_get_crtc_state(struct drm_atomic_commit *state,
 			  struct drm_crtc *crtc)
 {
-	int ret, index = drm_crtc_index(crtc);
+	int ret;
 	struct drm_crtc_state *crtc_state;
 
@@ -474,9 +489,5 @@ drm_atomic_get_crtc_state(struct drm_atomic_commit *state,
 		return ERR_PTR(-ENOMEM);
 
-	state->crtcs[index].state_to_destroy = crtc_state;
-	state->crtcs[index].old_state = crtc->state;
-	state->crtcs[index].new_state = crtc_state;
-	state->crtcs[index].ptr = crtc;
-	crtc_state->state = state;
+	drm_atomic_commit_set_crtc_state(state, crtc, crtc_state);
 
 	drm_dbg_atomic(state->dev, "Added [CRTC:%d:%s] %p state to %p\n",

-- 
2.55.0

