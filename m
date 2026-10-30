Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356123;
	b=xLbqFWtcs+3Fq7CrKc/KAdciUCFCZR14gsjG6ZFFuZcli+waP76qdzprYkrKIMo2eBMx
	 LpIxB+Zcm8cUMAVpc+IQQLUBK1LpMXgtrtoyvZAsfRIlE50FlaZQBvr2xvnpb4wFRFucF
	 KGN4XVasJ1f2rvAy/V13Ox0YuYyOtEyt0/p7rAvJYqMjOjO5MV4ebbEEE06QeXUdbfQ/B
	 IL5EsBZqSH6CrDJoCXLcTCzht0gI06dQIPnh2uZX3D0gieEZvvTvolOarkcWysfz5naUP
	 VQIldjQI1TyEFSUNIETVTxlZ/ZTCw+lLDkUvCJcD3byGkKNVOF0GIMK2FAvTlHzOwNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356123;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=luG8PmeuahdulGWPX7qVjLy6cKvtxIl5j6p+GIrFYDQ=;
	b=FuYKVPiODbwvvB9YgvFi1t4I6kAwUn3N/r6hfOCEQg9gZgf+D0mfb2IiK4JlHq5Z4BE2
	 /QfuS6VCn644UOy/GiN24rfao8ocTBveTVa4eQ1gzxxQV3tDSNXyKQIgTP/6Erl0gcxb5
	 Ufqp9dSR+EG7YNYs7zjM+m0SWKo6iauxspThaMu81+oy/7ZNElNkgKBF754EWVs/pJqYa
	 7F3IUI6QfPIAWquOmaOTelIQ+/ACo8Pf+OzX50mc8Ur8sdqlWAwkMCgyeRsENGgxVf+1D
	 hEIoD/FDg7EVxLdNXQ8hKSI05MzbmDoU3A6UDTi4OUoZJ6oQOM5rN7NKhECDywVJxwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7nGV9ht;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DAF606A336
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7nGV9ht
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77631F00A16;
	Fri, 30 Oct 2026 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356122;
	bh=luG8PmeuahdulGWPX7qVjLy6cKvtxIl5j6p+GIrFYDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=W7nGV9ht36kf80cdNQflsTejaOFBFEW+UQIvQ7tpFXH9n1tJ2jN9phIIYStX+GEPm
	 wOQ5JlGlXH6ZbbRT4V3zWVTNCkcBXWWYMbEYye5KQDq7O4YR9gVSweF4XXsAf4naCI
	 TO3+XHrW66lkwDig9nLVHjaNpOtq0v4rPOlKe5P61W+5E7lVrTQy6ht4Zyg3XlmtbO
	 EBJXSdMQ7URnOJXfA7tYky6qB+iOoFWEQZ0PLocj+SSvK1TOmfCIRT7+tFeFxjjaAw
	 A7B+73s0A4D9g/U6ybAmIP6c8F6gClZ1nIBX4kDShyg7hGeMzDoprSi+tGgkBBt2A5
	 jM1Rswzf0fVKA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:47 +0100
Subject: [PATCH v7 15/16] drm/vkms: Switch container_of helpers to
 container_of_const
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
Message-Id: <20261030-drm-reset-state-flag-v7-15-4e55eaeae683@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9KymKSyh2DSpKBjfqlW7NyoJFWIhRkdHFylYcuG4zks=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCmXnVc7vaGlhiQzTj5Xcc99njQDzI/5Gf/UTytuue
 1/91Lq5YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExESpOxTpnXvXJN38+eva//
 PvFseRrdW7fv37/Q+ZN3LpOYF5FpVcz8eH/+pA7uNkN2vpDZDE4mjA3LHoY6yNRq8m1peMr/Rot
 r/iJzfu7fG11zpl389zRx55k3OkxKM0ISJrBOXKjGOGPjLQcA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The vkms container_of helpers use container_of() which discards the
const qualifier from the input pointer. This prevents passing a const
state pointer to to_vkms_plane_state() without a cast, for instance
in atomic_get_property which receives a const drm_plane_state.

Switch all four helpers to container_of_const() so the const qualifier
is properly propagated to the result type.

Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 381483aa4fb0..dea6cad3f1b9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -251,14 +251,14 @@ struct vkms_device {
 
 #define drm_crtc_to_vkms_output(target) \
-	container_of(target, struct vkms_output, crtc)
+	container_of_const(target, struct vkms_output, crtc)
 
 #define drm_device_to_vkms_device(target) \
-	container_of(target, struct vkms_device, drm)
+	container_of_const(target, struct vkms_device, drm)
 
 #define to_vkms_crtc_state(target)\
-	container_of(target, struct vkms_crtc_state, base)
+	container_of_const(target, struct vkms_crtc_state, base)
 
 #define to_vkms_plane_state(target)\
-	container_of(target, struct vkms_plane_state, base.base)
+	container_of_const(target, struct vkms_plane_state, base.base)
 
 /**

-- 
2.55.0

