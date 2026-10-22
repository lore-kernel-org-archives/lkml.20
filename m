Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677208;
	b=Xj5bPyM372YzQmiZ4fec3AIaldMv9/r7W+0fBs7wHvtvoslKZoKoEheNfpWnRT38I3y/
	 YjAB+5ARRmfinMaB0zslU/OKni8xf9osG995k2VKNbItm2oJWWA8aCnIy+81OMs3jP2Pn
	 jUD1l1SmHdA0FF7DrCjcPCRuKn7eJMKRxT+rXptNddGUeIs97C87AM8O1Z2yyFr6ZmKQk
	 4y6VEDiZgZpn7Se79v+xLpkNLCc2tnwdvr3f8GxjaE+oUBJBP1JPdR8dOq+40BJUnnUte
	 bKKAlkewfB7yLGGpSyCRPQaYFgVtkKeD/BgkeZKLmn3eAU5/lZcL29N0gl8zvhSm65Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677208;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hYIZ0Nxu3e4yHwGzd5Edo5K+65SxK/KdsxGn3Zo1Zf8=;
	b=mXVLzoi4+sIb7yzH2fXupdhak5VR46ZYTId9+MKsrLqtPH58DsPZqxDxHTQVmoBx3MLu
	 mA7FojzWfgprGTqPCzmAZdwBeX2r61KQoiSOgDP5DYCGcmNBx4loouD2EBF6vW3Yr0M8e
	 dVT+/ANNePySkQn92rD1FNZKNsS013Dt7cAPcGhUQj5S5tn1h1jTgcBBk80ZbzacQqhQ+
	 fyfzoNZXkZwdmJz0DoogUEAIIZPMbC1DSgmurw5RPU90pVUnF28T2S9pAc62D3IIoaOzr
	 wTwWWFKSE9fDYa0Cis8KNWiPcBdokqheKxehfl5p7/AzYcirzJGTVkBggp24dCGGN4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnP99f0U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A760A261F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnP99f0U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95911F000C6;
	Thu, 22 Oct 2026 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677208;
	bh=hYIZ0Nxu3e4yHwGzd5Edo5K+65SxK/KdsxGn3Zo1Zf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gnP99f0UG5i2qAIDP7IaXh4NV6xWE5Q2wNOk2dAjbtVulLopXxrwi4r21Zjic4IQh
	 BX8AGtP+svrHtmkpv8kMLhwQcoA9atwQC3M/gDTPlEWqUwbxl0BqoMNnsAOJDj/mI2
	 +yCna/X3iaII5OlJ2diGuYAhEV8QxiYDwEK13r9itAjnwMlJaUVPdoI1x4WTr1wlyu
	 5b7iy/mIYyQNSRnJwIlqNnbnSmghX+O9o7x7SlrEb4K0rwm/gpW8Fje/XRxEEHGYK+
	 5bZn2S8dJIySkVBb1nakvLyJ5pnK/DH80r5WK1fCjzT1CbO0MUaORkv3/0vDY4ullF
	 fZ5lzXy5rC0bg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:04 +0200
Subject: [PATCH v6 03/15] drm/atomic: Use __GFP_ZERO instead of explicit
 memset in drm_atomic_get_private_obj_state()
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
Message-Id: <20261022-drm-reset-state-flag-v6-3-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481; i=mripard@kernel.org;
 h=from:subject:message-id; bh=/y0t9kvV8Kz+g1uKURCfaTtHcrjM3f6qXQBsVU8JRDM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RF08NhbulUy/c7xJRPto+f2zwr/tt07d8Tz8yiIlf
 euNl/T+dkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJXFZnbHj/6Z1AuAm71uuY
 9ZO0ZJunaOq47PmWkaMoHfs47rqcz5G2O3ZTHq1Lsn3389vmiBvaTIz1eSntFhxa07d/ljw09aX
 zHlW9NzlrNtUefXT+6aRZjSlLt1yffeKZxORHvkzT4jWWW87uAwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_private_obj_state() function allocates a new entry in
the private_objs array using krealloc_array(), then zeroes the new entry
with a separate memset() call.

However, since krealloc_array() already supports the __GFP_ZERO flag to
zero newly allocated memory, the explicit memset() is redundant.

Pass __GFP_ZERO to krealloc_array() and drop the manual memset().

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index aa47c647df31..43b58e9b25e4 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1096,5 +1096,5 @@ drm_atomic_get_private_obj_state(struct drm_atomic_commit *state,
 	num_objs = state->num_private_objs + 1;
 	arr = krealloc_array(state->private_objs, num_objs,
-			     sizeof(*state->private_objs), GFP_KERNEL);
+			     sizeof(*state->private_objs), GFP_KERNEL | __GFP_ZERO);
 	if (!arr)
 		return ERR_PTR(-ENOMEM);
@@ -1102,5 +1102,4 @@ drm_atomic_get_private_obj_state(struct drm_atomic_commit *state,
 	state->private_objs = arr;
 	index = state->num_private_objs;
-	memset(&state->private_objs[index], 0, sizeof(*state->private_objs));
 
 	obj_state = obj->funcs->atomic_duplicate_state(obj);

-- 
2.55.0

