Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D29A445AE7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135973; cv=none; b=nEcgIV8zDc7ieGAaqEjm7jzEa3cgt4MHqMrVhs21Ub8UudwwiYF5v0WUnGUptEp1t+BrCGAAic7xH+nxzpPDYGV5gS4KdUEJy7y8Q/xvgK+vC9D639VBFXhj8Ka6kEpYPVoczjiiLC7ToBYSjCMTQbl8JglZHBGPglYBz00SU8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135973; c=relaxed/simple;
	bh=IJ+5u7srEk6nIaU0cmJ8MAIsRra4lgyOsCM5Ol4qCpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=buYbcuveuaeOpFf/+siOlZneXQrh93gKe8T4FLoLp01vkb75WIlT8V3dYyyKjRYvoy86umtRbebUTmo555R+O+QiTHu4lkTJWyYUYIIVd3qWlSRUgSj5/s5NaC3f/rNCEGwQ3lxhQei1ETusynIyUe6QF39cXxX3uvBDNTquiec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WG7ptaQx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WG7ptaQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B911F000C4;
	Fri, 16 Oct 2026 07:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792135969;
	bh=1v2ntwu8Em8B5OdazZkfPG61sIQaYLlgT9DtGFP4HNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WG7ptaQxvhJShJBNpdEZTV8T4Ff3H3ud960vZ4LjnauWUvtqu6ls16RowkTLeZFBg
	 8vz0cNeme2i3hJHugTe5ydbgYAE+fv+egfJJBGhXXU/+UsX+jYvWmTgXRmsDorSri+
	 Ub+iWD8o1+CQ1rKUVk2Ku7D8ITf2dTP4XvA8vUrjlQcsKVfs9uNYY7vsM6jucFMsVC
	 Z5NZQiS7fiEsor3IT1PddNF98eLessuxoEdqEj6y6mwwrGLlnzFPYVhyEJA3TMo0y1
	 hrNjKK9vCtmIRmmaUDMJSFPUVlcBQP0OJLrsN4LvQZolaWoY5C+roUAGIBTDBhuMEH
	 4T9fxEwCpoTTw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 16 Oct 2026 09:31:45 +0200
Subject: [PATCH v5 13/14] drm/vkms: Switch container_of helpers to
 container_of_const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-drm-reset-state-flag-v5-13-dad2d64b693b@kernel.org>
References: <20261016-drm-reset-state-flag-v5-0-dad2d64b693b@kernel.org>
In-Reply-To: <20261016-drm-reset-state-flag-v5-0-dad2d64b693b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IJ+5u7srEk6nIaU0cmJ8MAIsRra4lgyOsCM5Ol4qCpg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkXLz3reHdzo94V5s6Qr9FvjXY/OWURfe2/Vf/CuTukL
 q2qXuHI0zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAm8uQEY50124dF+7cL2rPs
 XFLA8yuFyarlVE/kfeszzSs2RIpO+H/pwKG8tZE7bmvzHTv0Kbk/KIuxTrX0fuC86d4aTGpra62
 feaUaz7vkw6MrOW2T/tGny7RfnYhYeZ371MbrDltkD73TmMbXCAA=
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
@@ -248,20 +248,20 @@ struct vkms_device {
 /*
  * The following helpers are used to convert a member of a struct into its parent.
  */
 
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
  * vkms_create() - Create a device from a configuration
  * @config: Config used to configure the new device
  *

-- 
2.55.0

