Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356092;
	b=nzCbG/o+tsOCeq7Nn3ue/a1twmdoPFyNDW0pWbKSHMzRhgTIkO007QEUOQazt0d2BQbS
	 gvOuFbh636MccqMeR1BYPyjgki1UGS6qvISZww8DZt1GuOYDhQuQj4udoXPe4odnWtLA1
	 UbGTkYW3BGA4KhzIaW9m+ezV2p7oF8iuxKjiKj87DzfF0ASQbD8mlg0gyzB0s29b8oZVm
	 CupXoG4D0Sgb+huEU10Cz5LHp1dLbS/xMNXvg2F1TcldqP/TZMDEampjTUHsr5CYfmHyL
	 JVRmZaa0jbEdDeUnPG7/Gt657hP/GjoVhsx45ZoMycdT58HoMzimakLqUByTgK2M5uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356092;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mTDmY50binhv4KAhOwDjYuuuzxrs3fracWCulNAzN7A=;
	b=uLrRbktCrgBZYRT4vBIsyVZZ+8h8KMBSO3vGqGayjRNxBW9OeKoSa6LXgovVYSCsB28A
	 jAYxy2FWufZz6fLhUvOATpmr3WEOcNr/627FuL3oB/ipeZuVj4C8jeRBIUasTD5gv4UPd
	 jKRmDuGJkLZIsm9jKugKJcmMaEDKLi3cOz2Kmrh0h+eiMAqIdl9d7xn7dKVcPuPNwmqtt
	 fnB4BXXm2EGuDDWS9mFsPI30aOy6j6YD7GYvUBxZw6Bj11N2PlMO4EGdPGQjcwMQHw6gK
	 kW5riw5PnM1eV2XrhDuj5N4zwSR9ZE1sLfzVbN/DDKcn3zlp65MUxB0IdLWtmcmq4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZrrihNS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3060A260D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZrrihNS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDF71F00A20;
	Fri, 30 Oct 2026 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356092;
	bh=mTDmY50binhv4KAhOwDjYuuuzxrs3fracWCulNAzN7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jZrrihNS5rJSOHMVZzhZWQCont/txa8b1oNAyPa8oDoHrILr2BWRe/C95c7EQZVZz
	 EbbfmFcz33zTr5WMDfHc6tdIWR90BH8aTd7/toOLCaEfu+NCWlwtA+b3hZXMepMjnC
	 tzatEncFzwu39zB2VwjgKcs1cM2JjhncvJrLcU05CDTrYoY7v3qCbt8tRkGhhS1GrT
	 4Rxjt59mW3b/vbg/P2Iud20IPI+8w3W22sdqBLgHcxbZI9zVOvSsaX0ihDJD15jI/X
	 xYcNlIYGcS2w4A02rUzJkDF3NsSXH/qcnzbjM1GCSby4wop/lygYztBdfc7MNmXlSs
	 gvTv1yiyLVFRQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:39 +0100
Subject: [PATCH v7 07/16] drm/atomic: Create function to insert plane state
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
Message-Id: <20261030-drm-reset-state-flag-v7-7-4e55eaeae683@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304; i=mripard@kernel.org;
 h=from:subject:message-id; bh=41LUGhYJAROn0oZPZrkQUy7D8c62RSMKcGFPg+lAdDc=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGrkcRqhto4saHp4LHYweBWsntZMNL5pKcZn+kJsb6P78UwD2
 IiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmrkcRoACgkQJ1/OGaI9vnYMqQF+MNjL
 kunAj9V7rgT/byFtwP+edZzuSsQVgocFU5qlVmBiygiRXnSAGMjYHpuNCQ5cAYCroUDcPu4Z0hv
 zyVQnzesdQOK95xaV6+WxP2978HAJlEGqMk43qBu/oBD0WAJIDC8=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_get_plane_state() allocates a new plane state by
duplicating the current one and inserts it into the atomic commit as
a single operation.

However, a later change will need to insert a plane state into a
commit without going through the full allocation and duplication path
in drm_atomic_get_plane_state().

Extract the state insertion logic into a new static
drm_atomic_commit_set_plane_state() helper, and convert
drm_atomic_get_plane_state() to use it.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 178eca95d0e3..b26458ee98d8 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -631,4 +631,19 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 }
 
+static void drm_atomic_commit_set_plane_state(struct drm_atomic_commit *commit,
+					      struct drm_plane *plane,
+					      struct drm_plane_state *plane_state)
+{
+	int index = drm_plane_index(plane);
+
+	drm_modeset_lock_assert_held(&plane->mutex);
+
+	commit->planes[index].state_to_destroy = plane_state;
+	commit->planes[index].old_state = plane->state;
+	commit->planes[index].new_state = plane_state;
+	commit->planes[index].ptr = plane;
+	plane_state->state = commit;
+}
+
 /**
  * drm_atomic_get_plane_state - get plane state
@@ -649,5 +664,5 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 			  struct drm_plane *plane)
 {
-	int ret, index = drm_plane_index(plane);
+	int ret;
 	struct drm_plane_state *plane_state;
 
@@ -672,9 +687,5 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 		return ERR_PTR(-ENOMEM);
 
-	state->planes[index].state_to_destroy = plane_state;
-	state->planes[index].ptr = plane;
-	state->planes[index].old_state = plane->state;
-	state->planes[index].new_state = plane_state;
-	plane_state->state = state;
+	drm_atomic_commit_set_plane_state(state, plane, plane_state);
 
 	drm_dbg_atomic(plane->dev, "Added [PLANE:%d:%s] %p state to %p\n",

-- 
2.55.0

