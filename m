Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356100;
	b=ZMgi0ifZyBDAmsU+Jn/EbaY2Utc05i4QJR9OiMOyH8fGfex8yOoviexbRRd0O7tK/wDP
	 lpAcNjK5ZbHlUF/3NKP1BdaxLIBmUsueNl8aN2P+YsfXXAke4oiIiss7yD/XcLhWxykMo
	 mjlgmCfGJPOu7/X3Rrukt76LM4iPHA7Tbx2SAm9gdLyUWPjYfJzvWmAQVfaK3gVHbG+17
	 Ze8/kjDrDqhg7MMYGRGlukk8siSWzOeuopmTBpUIdeDEMSpr29liMDPa8tnJ1DdNSseox
	 lc8i18KOkx+j2GaOiMCHSZmuudT0V2q+IZEurSucIfRFLxEhAeHzC2gHwpoOfPdF1Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356100;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MnMXvzusoeoF9/Av5Lg+FeAyi2kBZMpvF5JpP2g3l24=;
	b=EZCsHJpM6cZTJ4uOExSfBxXncveQN0OEF614l9oJwJXz3pA+AEAs1UrJiaUBkR0EBiho
	 FptOHlFzzo57xEbv9C1WOL/vZSi+0Yrwqgd5bQCl4WnVlagEa3RIA2VaQNpl2j9G5Trou
	 E3Di7ZXmTZzkJO0wSVAP2I74rU9PlYEVYq1CCfqEQJpdL8I83lftDSqY0Muj7voKsyKP5
	 jrCvk+ywvJzDHR7FYKj/tHLhfawZN1xoAAy/tOmzzdJ8fZhtCv+PKEJf32ASH0uCYhhD+
	 t2HCUaqj6FfNABZVOqKYnZbiYFwN1oDVF8Pn5Gxz7ampiAzEQSG0uIacV4jkiq0Gkyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTzTBEZC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613E0606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTzTBEZC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7C21F000C1;
	Fri, 30 Oct 2026 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356100;
	bh=MnMXvzusoeoF9/Av5Lg+FeAyi2kBZMpvF5JpP2g3l24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kTzTBEZCEv36HGCT4HObpLXZYR1Zh0/M19mvMG+imYTzLxAaiysFhbSQhFQRI1uSQ
	 MI/AjEEpQppTAA7P89FaYTjm6ow35W4OFEQ9K3eIArU9xcho5MhpqpPmxI9yyqA/tc
	 nUR2QEuZiHIY4xuSWpJu7qkRiVjIgBwLp9itADdIhW4Qb7y8FQT7ABBVHL/eMlmGcT
	 nqM3T9U+BOSjxHAtQiNjeUR3MnNdSPsmMwaPSgYMmZ/TFGdvsWMiYc1scNlnYzy21J
	 po9+TZa7fXeAylXewLUbzN1ynIo/YOgMHkzeGH0RizsEdRHxac94Jkc8xOFOwy5peb
	 Hn6Yqeg61owzg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:41 +0100
Subject: [PATCH v7 09/16] drm/atomic: Create function to insert private obj
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
Message-Id: <20261030-drm-reset-state-flag-v7-9-4e55eaeae683@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3320; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bz8WgYdyyKFKUw0Z8N3MeqXXAFbvhUkQzTihY9/0wRE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCqVPPmypuHI9KHXa/Ifq6zQ+1yzRnna//fLvvnvlN
 6av0r79o2MqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBM5OlNxoYXHtrXxWc8T5kw
 39W4/uw3cetw9X0Zf2Xv313zY9e3knlhci/TJ9srrq6R4W+z+j8peB9jfcEJ/qBlzX82Zl5O93L
 +ynf/5txdj+4feT5lN5+w5Rr7ffY/osuU4lOOSYuUT7jC13fsLwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_get_private_obj_state() allocates a new private object
state by duplicating the current one and inserts it into the atomic
commit as a single operation.

However, a later change will need to insert a private object state
into a commit without going through the full allocation and
duplication path in drm_atomic_get_private_obj_state().

Extract the state insertion logic, including the array reallocation,
into a new static drm_atomic_commit_set_private_obj_state() helper,
and convert drm_atomic_get_private_obj_state() to use it.

Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 53 +++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 807b575ecc54..513e91ad2fdc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1096,4 +1096,33 @@ drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 EXPORT_SYMBOL(drm_atomic_private_obj_fini);
 
+static int drm_atomic_commit_set_private_obj_state(struct drm_atomic_commit *commit,
+						   struct drm_private_obj *obj,
+						   struct drm_private_state *obj_state)
+{
+	struct __drm_private_objs_state *arr;
+	int index, num_objs;
+
+	drm_modeset_lock_assert_held(&obj->lock);
+
+	num_objs = commit->num_private_objs + 1;
+	arr = krealloc_array(commit->private_objs, num_objs,
+			     sizeof(*commit->private_objs), GFP_KERNEL | __GFP_ZERO);
+	if (!arr)
+		return -ENOMEM;
+
+	commit->private_objs = arr;
+	index = commit->num_private_objs;
+
+	commit->private_objs[index].state_to_destroy = obj_state;
+	commit->private_objs[index].old_state = obj->state;
+	commit->private_objs[index].new_state = obj_state;
+	commit->private_objs[index].ptr = obj;
+	obj_state->state = commit;
+
+	commit->num_private_objs = num_objs;
+
+	return 0;
+}
+
 /**
  * drm_atomic_get_private_obj_state - get private object state
@@ -1112,6 +1141,5 @@ drm_atomic_get_private_obj_state(struct drm_atomic_commit *state,
 				 struct drm_private_obj *obj)
 {
-	int index, num_objs, ret;
-	struct __drm_private_objs_state *arr;
+	int ret;
 	struct drm_private_state *obj_state;
 
@@ -1127,24 +1155,13 @@ drm_atomic_get_private_obj_state(struct drm_atomic_commit *state,
 		return ERR_PTR(ret);
 
-	num_objs = state->num_private_objs + 1;
-	arr = krealloc_array(state->private_objs, num_objs,
-			     sizeof(*state->private_objs), GFP_KERNEL | __GFP_ZERO);
-	if (!arr)
-		return ERR_PTR(-ENOMEM);
-
-	state->private_objs = arr;
-	index = state->num_private_objs;
-
 	obj_state = obj->funcs->atomic_duplicate_state(obj);
 	if (!obj_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->private_objs[index].state_to_destroy = obj_state;
-	state->private_objs[index].old_state = obj->state;
-	state->private_objs[index].new_state = obj_state;
-	state->private_objs[index].ptr = obj;
-	obj_state->state = state;
-
-	state->num_private_objs = num_objs;
+	ret = drm_atomic_commit_set_private_obj_state(state, obj, obj_state);
+	if (ret) {
+		obj->funcs->atomic_destroy_state(obj, obj_state);
+		return ERR_PTR(ret);
+	}
 
 	drm_dbg_atomic(state->dev,

-- 
2.55.0

