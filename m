Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2A63B4EA9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470376; cv=none; b=n+oMoAIs5r+xCC+pMYz6sGoMca79JzzdLIdPPgbmx/bbsg/LwsbLZU69jUQZLipZ0VyYg4zQvvr39pSpIVjFoRacuibpZgc6SzCzlEaXFW+1QvVyKd+dUvCVo/ZuiLE87qHEFK1CKJhT+2jTQFnXprWfM2yFBwormwRX4bUxYEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470376; c=relaxed/simple;
	bh=U8QJTmdnLaqYVlpKHH/UnFiG45Vt1+yL/5DpLYVKBUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O87F7u/cGh5erDLMDh12wGemjCUX5cVy/OzARDPE6cvCwESMNQaxgKxODJqyqFwgIWU8jxEAoKqZ+AMvSIPgkPZ0Fao5yXIVz2umRNHXFem7M6+QzF8LWsImHpiGRbBQ+rdCRb/KUBHzNT7TloY4rTbc40NDqsL6jnTg24UnndI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i9q93nM0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i9q93nM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788470369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oisNWoIp7gQlNLE50911kRCMJdf5POJVWw1vlhgc66I=;
	b=i9q93nM0/7Bfmko9c0WITkGjZcZif+c1oktxj0UZbp+zcoHeXuDiO9C7RJikrwco9yPO0j
	bJY1NwxBv4rozvN4ex5X2vDHhqJmiVW2jp7ijQblYofx775YEK4xbNg4vQILqfx/Mbl5c5
	y/kufDyahSkl6PBr9sAxtpsR/mdmsJs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-qxb0LdXEOjGu7NNr3YTmzg-1; Thu,
 03 Sep 2026 17:19:25 -0400
X-MC-Unique: qxb0LdXEOjGu7NNr3YTmzg-1
X-Mimecast-MFC-AGG-ID: qxb0LdXEOjGu7NNr3YTmzg_1788470364
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9DB1187E5CE;
	Thu,  3 Sep 2026 21:19:23 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB0291955F70;
	Thu,  3 Sep 2026 21:19:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@lists.freedesktop.org
Cc: Christian Hergert <christian@sourceandstack.com>,
	"Dmitry Osipenko" <dmitry.osipenko@collabora.com>,
	"David Airlie" <airlied@redhat.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	"Simona Vetter" <simona@ffwll.ch>,
	"Gerd Hoffmann" <kraxel@redhat.com>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH 2/2] drm/virtio: Recalculate ignore_damage_clips on every update
Date: Thu,  3 Sep 2026 17:15:52 -0400
Message-ID: <20260903211914.1109100-3-lyude@redhat.com>
In-Reply-To: <20260903211914.1109100-1-lyude@redhat.com>
References: <20260903211914.1109100-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: Christian Hergert <christian@sourceandstack.com>

Plane state duplication preserves ignore_damage_clips. Once fbdev sets
it for a dumb buffer, later updates using rendered resources continue to
ignore damage because the flag is never cleared.

Assign ignore_damage_clips on every atomic check so rendered resources
can use supplied damage after an earlier dumb-buffer update.

Signed-off-by: Christian Hergert <christian@sourceandstack.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index d9579a4b4714c..95ec688690d3a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -119,8 +119,8 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 	 * so preserve userspace's accumulated per-buffer damage for those.
 	 */
 	bo = gem_to_virtio_gpu_obj(new_plane_state->fb->obj[0]);
-	if (old_plane_state->fb != new_plane_state->fb && bo->dumb)
-		new_plane_state->ignore_damage_clips = true;
+	new_plane_state->ignore_damage_clips =
+		old_plane_state->fb != new_plane_state->fb && bo->dumb;
 
 	crtc_state = drm_atomic_get_crtc_state(state,
 					       new_plane_state->crtc);
-- 
2.55.0

