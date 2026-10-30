Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356078;
	b=uXhJwuiH04YRTMMdLLh5o3qPfcKO9a34X0dqrVobFy8QtlkiRrGQ3djCa4+Dr2VW1Ocs
	 RukYwNpw/hVyXNZoCko6GcKeu3SzgxZc3zoOYWWN+WkkFFvKZdiTnce1safba30/F+B5W
	 m1Rvc2zoGaed2K8t7GiSz1p6UpGYHuZQwTk6YQVKf48F7qePaG/3SEUXxj6KE34OGI1FZ
	 FxOuVlSRCq7YMq+z8+IuFYx4Cjcy613/p8e2P4DXIo8Y5jqghqfNgOM7874YtEn32J7mZ
	 nMwZJJWYsaphXdV+9WsoMOroIixvVtIX/KYaens/UaTBCP1ynojNBks+vac1PpsZ+Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356078;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bp8Sv56uWGNu5dzO8hoWLI+wBl8bSINfQ15wCZlMHhg=;
	b=qaEqQElbf/dfcFqNtaqyOz6J4UrHdEFJwW5axFWt0y319ceqkH6Y9RslOJGNhcb+foSh
	 kZ1KD9HS7mrDuMajygSa9EO9IXlZLNdpxdn8WGRr1cGHfomaKIrLMKzSQhME3+tk43LEy
	 ysJxjKCoCfPhhi/lyDHREVB0xr4ydEuYSHV6VXoRxp4TYnrBXi7/hEe36ltT49OhqILm0
	 c9jnt9GiLwcJoHQ+FFby9ERqcgH77ZaWQM08Wn4gTUDCF5xvKsWhsSglnezEJ4HozAMmq
	 4zrB+QYyf44VWGNN7SHAIgvCmm44mtBvU6h2EOCwEgTtq3i2S9QicJtQ7NGijVXpmcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jn5BsOwB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B96F606A336
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jn5BsOwB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B066D1F00A02;
	Fri, 30 Oct 2026 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356077;
	bh=bp8Sv56uWGNu5dzO8hoWLI+wBl8bSINfQ15wCZlMHhg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Jn5BsOwBaa7ZGUBOzwVlDte10ZHifykzg9wPsWl+gcAvDYa2XjovQ9wk4SHgaEn0t
	 N2eUajxt4ySosFNKDLZdSVEVVlC60QiZ6QfHYOW8gEcF/4Nolo5d7EHzBBiEih4czQ
	 Ko4mYZdB+UC0CjB4hDLkESorlcx7Y3I3E3qai3u9ZWpqPKEZ7aaCy3fgMWnd3njCbj
	 IwC3aY3yeOyGv69vLIzMOoujxIargMAxRX4chmK1dxGPSJEARGTPNLeeK6qNCOjkIV
	 aFUQDTaHlQc+5QccjYhqSVscgtTImb2cyQ12jcu/4BcelhPBfuwwnZLjnjP8R51qc1
	 /K1+odhRlXh8w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:35 +0100
Subject: [PATCH v7 03/16] drm/atomic: Switch to krealloc_array() in
 drm_atomic_get_private_obj_state()
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
Message-Id: <20261030-drm-reset-state-flag-v7-3-4e55eaeae683@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391; i=mripard@kernel.org;
 h=from:subject:message-id; bh=BzbEMPPA4chwGhrAev6Iwlnw4dYruoi/b+S/QBBvOnk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCiVM2uJ2r1vnICXVkFd+MYp505X6+d/L568yKkibG
 BR8ZMK7jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARY37Gep94z7z/5avVFzDU
 ZNmdY8xeE7i/1pf11oJDG67M4wpan317R0eCr9imfDlulshf/cdWMdZK597X6+4+dmB74a2ni5k
 TJ000qba4GqfD/uLA1Xfz80QFpj15yvjfcJpNwvPZPC+ir58BAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_private_obj_state() function manually computes the
allocation size by multiplying the element count by the element size
before passing it to krealloc().

krealloc_array() handles this multiplication internally and includes
overflow checking. Switch to it and drop the now-unused size variable.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9bb761eda59f..aa47c647df31 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1080,5 +1080,4 @@ drm_atomic_get_private_obj_state(struct drm_atomic_commit *state,
 {
 	int index, num_objs, ret;
-	size_t size;
 	struct __drm_private_objs_state *arr;
 	struct drm_private_state *obj_state;
@@ -1096,6 +1095,6 @@ drm_atomic_get_private_obj_state(struct drm_atomic_commit *state,
 
 	num_objs = state->num_private_objs + 1;
-	size = sizeof(*state->private_objs) * num_objs;
-	arr = krealloc(state->private_objs, size, GFP_KERNEL);
+	arr = krealloc_array(state->private_objs, num_objs,
+			     sizeof(*state->private_objs), GFP_KERNEL);
 	if (!arr)
 		return ERR_PTR(-ENOMEM);

-- 
2.55.0

