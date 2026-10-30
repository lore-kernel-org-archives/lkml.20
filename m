Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356073;
	b=OXi0Wu7v7bPyv0j/5Vg3KDTcGGZW00+is7lsW0QSLb8IsBYpmaodrslSBqEsQ2v4PZ/8
	 Np061zxqZDtbsZ81F9l8A8xz0AUTiS0XkSShRab9Q3Hu5VTCxVNPfwRHEfQYgjctX4Cea
	 z3ttbHpc6amuMcXoM/LuZS72293UiYnzC6BN/Xu/yLdy5vFTfutv3vH4NURTN041nnzZB
	 JMYxO8sgZzwczYdThEuonR/tb2KeXSroz/Z7YKmFA9fTGy74jjDZa4l2uYUCLpfX3qn4u
	 WsGu5qy8YiVbbcKXih5v+XmDkU+7C5+Imp4Yaza56+VwJ7oEdp1zgu0KeV5Bq0Gpfwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356073;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ALFcEyRPTf7cvwVXvg60ATQfpRyrOoNNv4QnFFUcE8o=;
	b=hJYoZfBSQJFsIimaeXKm4iFFlvEW9VFRDyj6VvWSq3VEsjxUEaXBkYbLGmwCm4sd1cbI
	 R54OqdIPN5lTKHNI4UMwVoRSipcUMgLMdGZwWQxB3BTTYALHx7dkuk++nS4ONIKn0uKjF
	 lcO72FFvPFsBT7+Kv/r99cSVZfwyxwJJBMblPvVRv8wHu7cDNo0SE6Ea+NxidKMXKhmWz
	 3gp2ZoHgYOPT04H+TpBzZW7Z52gS7K5sXnzHzPTbztbL6s8RXXdYAnDnnQIUFNTYYURLN
	 8iVVVXBuuhwylPI0fr9FB5DAWTySj7rBn10/P/8kNo/tz4fTSPZvFsr8Hx5lufqXfwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SMy0oZJk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SMy0oZJk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52A51F0093A;
	Fri, 30 Oct 2026 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356073;
	bh=ALFcEyRPTf7cvwVXvg60ATQfpRyrOoNNv4QnFFUcE8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SMy0oZJkcjs3u9GJ67ePHkfBXiPrywvIq5Uyx6RmQ2T0HhgFGzzvBqZIykCjWdTEm
	 lgxEyp/5bnafxzVq1tpbXSuR96370Sk4bkoKoR8wuqUbFMTkhk9hCwA52gSPWLgkjI
	 scctUeG2GEo8/yWVHgbaecFducPjI7hXwZsz5NaYWyA6QnxfcWOdKIs/SplT7lP4B9
	 FKIfjJVl6qockMjeWLkRBd1Y+ds2h5aUNynC35RVKFdh+5pY/LL2ai0sliNr11TIdL
	 Q7Y6XzFhAPIcJrfak5ad7VnWSvGnKOhyS29ENo2UWxk04+R8KiDAUGz8A2uZyZr07L
	 fKJkT+vnsMw6A==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:34 +0100
Subject: [PATCH v7 02/16] drm/solomon: ssd130x: Drop the init-only
 assumption in ssd130x_crtc_create_state()
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
Message-Id: <20261030-drm-reset-state-flag-v7-2-4e55eaeae683@kernel.org>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=mripard@kernel.org;
 h=from:subject:message-id; bh=OxfYEuitawviViOrDlDI8bSVA28qVxksy6YOiUTMG/Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCiVaJWz23/lxbkbZM77e5ANORk0Hak3X8T5V4uBUq
 DvzrbWtYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkz0bGhtsqGoedZuoU5wtP
 Yy4MTr/6xlnR964U93HW3o1uB9qXcPUcYjweJZj935/v8JatMbKBjHVaU6pE0j4dtHD3reuZlLa
 kP4a/Rsmh6+iFq9fUYuMEWGcbFt2YXHV6/uZ535Qq9hmeXAUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ssd130x_crtc_create_state() implementation warns when the CRTC
already has a state, assuming that atomic_create_state would only ever
be called at initialization time to allocate the initial state.

However, atomic_create_state is documented to have no side effect and
can be called at runtime, so that assumption doesn't hold and the WARN
is a side effect in itself.

Let's drop the WARN, along with the comment documenting that
assumption.

Fixes: 1345de7fe9114 ("drm/solomon: ssd130x: Convert to atomic_create_state")
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

To: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 4901a1835f44..a6dbefb37b2c 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1755,11 +1755,8 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 }
 
-/* Called during init to allocate the CRTC's atomic state. */
 static struct drm_crtc_state *ssd130x_crtc_create_state(struct drm_crtc *crtc)
 {
 	struct ssd130x_crtc_state *ssd130x_state;
 
-	drm_WARN_ON_ONCE(crtc->dev, crtc->state);
-
 	ssd130x_state = kzalloc_obj(*ssd130x_state);
 	if (!ssd130x_state)

-- 
2.55.0

