Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356089;
	b=5sKbc1stawga7WII7/+SAZCQGE4FsDw93/eeGpaYQoNga8LfiWuA/j73nDubo24F1t++
	 vXKZsqL0Esqm2S1F8nn8xbl7S6gB3xasok77FwsOcQLppXRqZreaKksBOyPSWu+v2tz78
	 mFqQ2lpNODs1qjh7CvGaqOfPPCFJw+iDTOjlfRMXt2GIKjBDF5z82ICTzVMunmMfeS640
	 8GljAoATeSylvGn/qCPYNtLPjLsLxynqus6re1heblTL185Hd5A9M0v9vUzTuivMxZAYg
	 JcC1LUa++wPi97x3uxkdvMptnB7hVgTNitqOmz7ih6t9B4z369dbmFmk64bB6GbK7Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356089;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CzmNkiMv5ZgXclvYn2qzX3vsC5a+5Aneg6GuHpphg5U=;
	b=MqSfCYVYe/qFn9cXCyG4zL7tfrydmbNHPfFpLIkNDSpTbC20cqRBvOXEPO01CEy9w+TI
	 0uOAJORtmK4aq+8i+TsobvJHqwgMlXjbb4nOLfoOjaotYdCo8Pw2e1UaRdnwEEGsMSjN+
	 YtqpZLD9pzCjx/L2W7PBQYZEbbvUf2EQ857ugleo7Y09MMnPyb1M0zNPaumFfmwTr0dSE
	 yiyXyPO49aGW6nOV1CgwyLYRKzygcO9nIryIQAT+A/UhFDWtkD7hezhQfLTP56TBHqkUF
	 0uD3BRxRyhqM//oY7VORzykApPq/8fYBkSw5GmJWRnJUH/hMykwXeu/M1rfHYunPPeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGvFjSsV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF1B60A2622
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGvFjSsV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335771F00A15;
	Fri, 30 Oct 2026 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356088;
	bh=CzmNkiMv5ZgXclvYn2qzX3vsC5a+5Aneg6GuHpphg5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SGvFjSsVTxcOnggFYhXY9Ota4vCPX++EVnsmvquD2grgoNJgyQu3xAJva4SsVALEM
	 8VuGNfAVE2vq36TeDrjOsHxsY96nhVEVoOZeqhEh13Uk8uUqkHuh+wQHhmCnJWlvIG
	 2cxu0VYcZPmFl3DdJ178RTgOJYnk8VxaqqWMGHeGp2okFPYSd9GxP3ge2+gFU2ZJQ9
	 RVsOwndt61E031rBPoBbk2nuZmP5Z5BgvVRFtfE5RVv/1bNpQ/39XOQoaQNZeYZiQv
	 v3Ac+JHR8JYLm2pQRAfTN59hvZ6ET/+LQr/1hZH0ziNioot4QAGdI8QnBqaA3XEDj7
	 hEOaBLx3BkJag==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:38 +0100
Subject: [PATCH v7 06/16] drm/atomic: Create function to insert CRTC state
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
Message-Id: <20261030-drm-reset-state-flag-v7-6-4e55eaeae683@kernel.org>
References: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
In-Reply-To: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCiWnt6Xmfe//0SsgsPvp8vX9PMHsCZMXLWA7IVZVe
 VE4U2Rlx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiInRpjw0xW8fxm85r1u/80
 We2JsHJaIVZiLmi302H2zfKX6g/CjEyl9ctlHmY7CnpElJ3b83giY8Opji/HNrVFC0X/b5EIdd4
 VYxffIKv9Y4KYMJv/x/vf5i/+VrJrb0Zv/faMA9u7xKdsegIA
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

