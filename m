Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677205;
	b=Osl5MRX8ZNC/AaUlT/QvwyU0AuCPBXVNZqT/C/on5yUtyMYGFREBajARNRFGFnwATM9q
	 iQMPVoMvMryZIJzc7fIy75lSHLczUa3FkFsiD7rgb0jCtXANpcJ0nI0M1py4Ro00//0Jv
	 euUhT4JtQy1ar5WcGsbHfpunncGM//hM7zjCHXk1b3sD6PtJgB6mkIZueq0x823yykxvX
	 oFgTHwto9zyMUrAjrY6FacnRy34iJ62hX0DxvLLQrT7OkQMABWNwQZ+Nq69L4mt9TQH9u
	 tIwchmJq6xnrSZV/MtkbGdycSMuc+7giTmA9bG/BmIAJKVgQWQliN8JeQwu36DsFVyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677205;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bp8Sv56uWGNu5dzO8hoWLI+wBl8bSINfQ15wCZlMHhg=;
	b=dXGKJzjB5HBBvlWLdZqUf0CF5bY2Iq6u0g2qUHlTt+lgqQYUJo2Jj9SbmapD5ax+FDXK
	 pwG6Y/DC9hmn29RDvocejahdMMn/guhvSVA2zIpKmFoDCRSktREC3sLzYVMRB7d6fpGtm
	 ZhQYawxRwNLOJDSpI8pTxv/YRAjAvG/RYDOfZ9LiJ3dtq6aU2ypgV+obUoPwQ70WZKDEk
	 3SD2pMIj4GYFe6a7icavn2PrKHjldnT8v1XXUayRz0XKE++/MwtBhAxronMsOkP0UuBwH
	 tR66PUryCXW779+UzFQHeD2onEvodwLQnpxvMymhEESnzFReqrPZWyky4N6tRLB2n6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdNbL7ii;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F114C606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdNbL7ii
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BAA1F000C2;
	Thu, 22 Oct 2026 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677204;
	bh=bp8Sv56uWGNu5dzO8hoWLI+wBl8bSINfQ15wCZlMHhg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VdNbL7iiFiqZk2DsxL87UDc7lFoy6Jq2+vVHB6I3vfKqQiWtc/K2wgVyCUJLPepZ3
	 LRpMGtl0mfHIw/lRJx0IixQTr/W5BQxcbe7nlAZjL39eKjHzdFPix3nrhivqNsQsfE
	 6egR9gqfjR5oPCUrREv6w4LR9Gj1FXI7cnnO2vi5xDMoHGoYq0mkv4H01pkR6T7xgx
	 kDamF9uZeJcb39UeWdmVF013g4c/cD5sGNh/Y2kQm8OF36Q5wNCpp9O0kd8nSB9i/R
	 1CnIfhlwXdAFnLlzPXeb+WQZHuU+w2xVxdiWz1i8l+2XQx0lo7qwdk47vtFrGcJkLs
	 E6dM2CdDSn+8w==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:03 +0200
Subject: [PATCH v6 02/15] drm/atomic: Switch to krealloc_array() in
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
Message-Id: <20261022-drm-reset-state-flag-v6-2-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391; i=mripard@kernel.org;
 h=from:subject:message-id; bh=BzbEMPPA4chwGhrAev6Iwlnw4dYruoi/b+S/QBBvOnk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RF2yNn6sawlbdMQm02LNmf3LL0/fL1F9eYnSfbmV7
 705tJO2dkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJaN5irC+f2GJoqx6+13Qr
 W2/KkSbf5D1cmrf3Cv7N3d2rcow3W+m278L6JQ8bdnsflkxXlZiuxtiwJ/rT/Yii4rtblDiz2ju
 utEyL4//osCTYverWAhOpDR/+nFjwY82/LamCVWxLHvH3BfEBAA==
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

