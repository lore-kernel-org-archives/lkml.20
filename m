Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677212;
	b=y71YzsmOAvk/hq9fLBjmOKJT/j01KxlBw5Q9N/g6kwCbBm/a485q+YiZMKaSHKVS6aF5
	 h0O9PJV8L4jxr4w3bZDfp7erRrIUl4Kd5O/Cb9iNpdxPX+XlgyGaAr9k7U+7KNyljzUik
	 EOGP+aAhIuKR/S8UoQY0NGJlQaQGodIsbzfjCEOkhdUL/UrRdG6UvdH8jL8AkfBeTkq1E
	 /LCYMPlo7i0vjxKJCYKJzNVUykPZYqZqFPmxwzhMeXx2VGxsrSjaibwqjIiZDkCVY5Bs6
	 G2Tc04Lue/GUHr98/BOjrTdJ3gZ2JwBDK822DrXcjXz1Wbb/OV4qJioQJk709f3RlPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677212;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JWUMgHIC9UGBSIolOL6GZvlgSz5q9pcFRnOxAnmCYII=;
	b=ssb5MHbUBtBUiS6WnUdG2RxR5TTO8isswfuY1p1LJb7vUpbY5DZDDbwinjFSRBVCHo5S
	 obrB5L8EI4O5+K8z4FySx60dD2DekAiahtWKzkV15GVfsS7jot5koravXOWHyvVS2BHzE
	 v1nUt4OkNUz1AOw8d3om6ieHQ0c4XKWLcJTFNgYmN+FbRh6gy5043/Uzg7eUvYE8MuE+F
	 ZheIHf+AWJ74DOvDYlkThOzCILR9AUc/Zy4QPlCt1gHBSZ+feKytpvBJWe4dGVMFlxSSR
	 0TjRPZiibSPGsRbsqXvMjm35e0zvZLfoe3TvcDTU9eY1WoFkgw0BNy9/i5Fn89lh1Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOnTE4Po;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA6C60A262A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOnTE4Po
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343DC1F000C1;
	Thu, 22 Oct 2026 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677211;
	bh=JWUMgHIC9UGBSIolOL6GZvlgSz5q9pcFRnOxAnmCYII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VOnTE4Po4L6MynjjqxOAdzLNYT0Sb5B87WowVvuOqcYlMCTrJQZKQkz3rz7vfQsWh
	 ur/5k3If4PTNIWVTU1yjBgp5VNBwH5696tjOqlhNUK1mhB4Nrs540vgiv3yO/asbMP
	 wo+gAkNqdIP0R/wxnP/IE4np6uUIaixEY2MheexD/mWx6+/osmJpw+db3pWh1qBLtV
	 jRF+3LSYEpkLRn2a3lk/LvAbJzzkhIW4nntffFYCgoEZhBew3XwQ0Fo+zUThtbukRN
	 r3mA93ajQm7rMaOa91UsfEIgaj/TV5924VVbPhcZF5/0qA3sRODJlIVUhcr2/7S28s
	 HorOmuyG5rsDA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:05 +0200
Subject: [PATCH v6 04/15] drm/atomic: Use __GFP_ZERO instead of explicit
 memset in drm_atomic_get_connector_state()
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
Message-Id: <20261022-drm-reset-state-flag-v6-4-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LZbtPHVlMICiFBeZpJ8LPAkCVdWnWToVa7ZsZD+t1oo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RF0SnBlDbwVu/yZ4YkraoZt+pxrPylV/5zfu81jS8
 XHm3yslHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiYlaM9dlH1liEuOo0XLgd
 XBV269LEyW9s1/zZcjOs/+Crnj2bLkYLh3r+TVrmvZStRnjuhAO/FjHWGeoYcUz1ETafmP577sp
 FYtV7u7i5j3ks7t/AJ1cQVORwaXfJiXzXfuaIta3WspY6VpcB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_connector_state() function grows the connectors array
with krealloc_array() when the requested connector index exceeds the
current allocation, then zeroes the new entries with a separate memset()
call.

Since krealloc_array() supports the __GFP_ZERO flag to zero newly
allocated memory, the explicit memset() is unnecessary.

Pass __GFP_ZERO to krealloc_array() and drop the manual memset().

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 43b58e9b25e4..80436adcfb7f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1391,12 +1391,9 @@ drm_atomic_get_connector_state(struct drm_atomic_commit *state,
 
 		c = krealloc_array(state->connectors, alloc,
-				   sizeof(*state->connectors), GFP_KERNEL);
+				   sizeof(*state->connectors), GFP_KERNEL | __GFP_ZERO);
 		if (!c)
 			return ERR_PTR(-ENOMEM);
 
 		state->connectors = c;
-		memset(&state->connectors[state->num_connector], 0,
-		       sizeof(*state->connectors) * (alloc - state->num_connector));
-
 		state->num_connector = alloc;
 	}

-- 
2.55.0

