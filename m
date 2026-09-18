Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CDE3AD52D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741087; cv=none; b=G+EPkr38Dj5IddmiJaV1XBf/D72F/UInesjEwxOec+/UpHlkLwjHr3gIY9IY2USvRtew78TwKJcDyoh1QEwe0wQKhKs7a3KVYcNy3/KA9PKRQI0o30Zb8DrW9KX3hZe52SBh+si6Zi4UiHp+XQ1tQksTqTMpyOPLc/AtTokm/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741087; c=relaxed/simple;
	bh=sx1UwW3xDFuaLzMdKnc77CcZQnHJXWxl0xTfnmk86HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4bIWWTpKNpDylEzwtrs2T8TUfqy9gLiLYTK34mXQ9BOoDSaJDAAynizAyni+8oLoJOGblPkV8xnVHaluDIAC1LVDEaNW2Z9crIuMwtJ9uZ78J12P6Lku2pPYSZhlM5Z7eIC/Nm2hQ++FWkGfRf1hRaoKqJwYeG611QZRdgdJjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJ83R+sn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ83R+sn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0898F1F000FF;
	Fri, 18 Sep 2026 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741085;
	bh=F4UcFgN5ms+bbUQcU8tcSIW9gIecezr/8JMKx3gOffg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JJ83R+sn88/JyA2gROVKjZ8kC7WSOIarK1qoaSgxjUL/0lrPLeEzOykFzCNr1PqhC
	 PDYtTOVCIQtAOwD/yXD/LkOat0oRn/1GwgnGqoKvA5k7eziFAFRxKupt0PmaiaiJUC
	 Ak6tWqDWi3GMQAj3eLSkau0lCOmj3MD5nrcgzwsQd5WQzZMblkL/363c2DMXIcGP+J
	 3ZMSTPFPcrrjC2eAvCmvP3YJmgUZBOTeCPXQtunFMhtJzYVeRGC20s7jMAEr8UcIrY
	 wDYm56iMc7IHoD6uomWTQXomYev1zl6QW6KznfTTdNSgzpy80CcRA4KYUED2rNN1Ca
	 zkxu6orVEs/TA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 18 Sep 2026 16:17:50 +0200
Subject: [PATCH v4 01/13] drm/atomic: Switch to krealloc_array() in
 drm_atomic_get_private_obj_state()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-drm-reset-state-flag-v4-1-5ad106370f05@kernel.org>
References: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
In-Reply-To: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sx1UwW3xDFuaLzMdKnc77CcZQnHJXWxl0xTfnmk86HM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlrPfg1+G6+il6lxe27/4LG+mStN70hbhxG5zK88uuc4
 l+16O/rmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABOJsGZseG//d21frafz+wtf
 /oq8EVt5VmtFovP9i5MdtjQXvVnsc2SmwL0us5NRSgnNhkzOJ0POM9YnhpR+Y2/UM3xoHp966EO
 oWobZ5+nWHuH/UpcZVeqaSZ5q/mW5tmtC3d6cS7+EBZ/3GAMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_private_obj_state() function manually computes the
allocation size by multiplying the element count by the element size
before passing it to krealloc().

krealloc_array() handles this multiplication internally and includes
overflow checking. Switch to it and drop the now-unused size variable.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9bb761eda59f..aa47c647df31 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1077,11 +1077,10 @@ EXPORT_SYMBOL(drm_atomic_private_obj_fini);
 struct drm_private_state *
 drm_atomic_get_private_obj_state(struct drm_atomic_commit *state,
 				 struct drm_private_obj *obj)
 {
 	int index, num_objs, ret;
-	size_t size;
 	struct __drm_private_objs_state *arr;
 	struct drm_private_state *obj_state;
 
 	WARN_ON(!state->acquire_ctx);
 	drm_WARN_ON(state->dev, state->checked);
@@ -1093,12 +1092,12 @@ drm_atomic_get_private_obj_state(struct drm_atomic_commit *state,
 	ret = drm_modeset_lock(&obj->lock, state->acquire_ctx);
 	if (ret)
 		return ERR_PTR(ret);
 
 	num_objs = state->num_private_objs + 1;
-	size = sizeof(*state->private_objs) * num_objs;
-	arr = krealloc(state->private_objs, size, GFP_KERNEL);
+	arr = krealloc_array(state->private_objs, num_objs,
+			     sizeof(*state->private_objs), GFP_KERNEL);
 	if (!arr)
 		return ERR_PTR(-ENOMEM);
 
 	state->private_objs = arr;
 	index = state->num_private_objs;

-- 
2.55.0

