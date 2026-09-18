Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C451739DBFA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741091; cv=none; b=WTDhtb2/JGtFRkGGrZt1JSPtr6sBgrqOwUBqM1DY4IbgUxxaYAJu5v0AUPL1nmFIA/7f/ieHccrXjhhXAFzQByUnJDECOa0z8UkmRwOW24i115Ajt5Byz6LfpdORYNS8KydNFOjX63byXz8rjuXkyKEjrAbH0cIklOIEqoZrz7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741091; c=relaxed/simple;
	bh=i2WrNw8zpdTRI6O4z1Zz2vaXFVByyUcTvN7F0qMG0cg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9rSNG2IiG1CFu5hVF8jyAnbbw9fI169DtsYjEgl233u1Vn4/vdlTkL4U8ZE9tMzPZqkcWqaQ+zhsBjic/cqNklNMMVzTFZBMkZrHUO8ZxruIJvHmTSYpChSM1hoxT729qifB5GOLt5mR+80ulnviv4VIY8ijy2c5ONKcS0byzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcI/DrBf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcI/DrBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072D91F000FF;
	Fri, 18 Sep 2026 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741089;
	bh=kqkLo5Oca9UYfgJKcAHvGrarQb/IzNFnksb0I0ZXGIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OcI/DrBfL1PXVFVO6VROiBOi+lpr09PMVynXjPFz/YoGFrz9aulepvIgP4s1L0zjd
	 0VmBdVy8zYxFuJymp+ndRA5Gm5cci+riXdluscEsKQQ08pLCtRLL9JNOO6d8LAdYfs
	 E2Ue9aaNgximay1Qj7bM3Dh34zwkPM9qy/Qi+5xiXE/ZxapTgh6gLBQTG3dR1WBT8l
	 2KsuMzdH0ck63Ik03VvtbNPQdd/dC6XbqNePp6YOvKeH9r5N77efJfb5ecm00KKmrj
	 JrOUgwm0dFQSMaK1sa8CJv34O6jjTIBUEcD0QnEmxK8g0WdpPQoRa6tHDwYOuwyoHL
	 +GTSUf8nlF6Ww==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 18 Sep 2026 16:17:51 +0200
Subject: [PATCH v4 02/13] drm/atomic: Use __GFP_ZERO instead of explicit
 memset in drm_atomic_get_private_obj_state()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-drm-reset-state-flag-v4-2-5ad106370f05@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437; i=mripard@kernel.org;
 h=from:subject:message-id; bh=i2WrNw8zpdTRI6O4z1Zz2vaXFVByyUcTvN7F0qMG0cg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlrPQSMnPctTRYN4T8c82Va0XbLLiHPrKzcqf9S33VOX
 q/UpRDTMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYiYMhYxZxhy9sccbb62uVl
 Tf0plwRlyl9VzmGT2ZCt8be1kl+Li5fHZvLBrj+f5l/d98TPfqcgYw1f97JkkX4POysX18wJG7T
 qSu4f9tFeWbV13zft3LMeM66aybpWaq5QkH8Q473t8rp7BwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_private_obj_state() function allocates a new entry in
the private_objs array using krealloc_array(), then zeroes the new entry
with a separate memset() call.

However, since krealloc_array() already supports the __GFP_ZERO flag to
zero newly allocated memory, the explicit memset() is redundant.

Pass __GFP_ZERO to krealloc_array() and drop the manual memset().

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index aa47c647df31..43b58e9b25e4 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1093,17 +1093,16 @@ drm_atomic_get_private_obj_state(struct drm_atomic_commit *state,
 	if (ret)
 		return ERR_PTR(ret);
 
 	num_objs = state->num_private_objs + 1;
 	arr = krealloc_array(state->private_objs, num_objs,
-			     sizeof(*state->private_objs), GFP_KERNEL);
+			     sizeof(*state->private_objs), GFP_KERNEL | __GFP_ZERO);
 	if (!arr)
 		return ERR_PTR(-ENOMEM);
 
 	state->private_objs = arr;
 	index = state->num_private_objs;
-	memset(&state->private_objs[index], 0, sizeof(*state->private_objs));
 
 	obj_state = obj->funcs->atomic_duplicate_state(obj);
 	if (!obj_state)
 		return ERR_PTR(-ENOMEM);
 

-- 
2.55.0

