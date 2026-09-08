Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6756F548552
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878176; cv=none; b=IKzEBXSIz65A68Z1ReAE9bRQbAFqMZVJQt18WfLO3tXdfUNCko4ekqxS0tPAuQwO75hhVmR+s68fLXgwdu53TZMKAXapafpU4e+81tksxb+gt1aIMCg++qUx25lpZuOwEe+Lw1de3jvCG9BBWqIJ2nM3/neIvR/XPwlsDnKbiNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878176; c=relaxed/simple;
	bh=T0/yZbif8qvMhUYbKQ5OZSohlQVc+4QmXLfUx6lhP6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X45uymWtA5rKkIwv5fP8b7/5ZSDTSBoWOUo/0c6B3sgfLFCALA5ZozlnbHFn/U/GTeBJeEpvG7y66WbX8Lg7vrj0PISx9U2ZZmgcTtmFWL4gbIVvhSLT3ghMC/lP0lMTOKPktlor51v7geuH9pHh/R+8c/6m+nMKRK/WKPfybWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQTo86ut; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQTo86ut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAE41F00A3D;
	Tue,  8 Sep 2026 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788878159;
	bh=WrDnBXEUES0WR7P2lhOYTykVEKJTOaUBbf8pmdHPY8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YQTo86uttUuej6wyqqArJ3CYc0uDeSMFp/a5qkibb7fPRf5M6xc28Gs/Bp8rawv3P
	 0VWSNs4c5rm/SEjEF/m2CRu+kHn+EeaNrmpsBRZrht85WnlyEfLnLzCfo0YOC0D1Dp
	 7HuEdeF8C19gVgpYS+XzNPn+X7PR5TAAfCADprzU5iHzHEe+I9gFP1nkN3CuyE/OgV
	 OocdfikL8wzCMbfT7JQeD1CxQt3T4Mwc7a7mbmONzX+Xx70v24DGtjVLwxqjtR00s9
	 ck3dp+su78kZFrg2YJoSfxvSV3u0eOHcUnLTy7tiuCD+zoa/ob1TqHSO0L3IBCx4Oy
	 RlfoFdqd6jzjQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Sep 2026 16:35:11 +0200
Subject: [PATCH v3 10/11] drm/vkms: Switch container_of helpers to
 container_of_const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-reset-state-flag-v3-10-905570f387a4@kernel.org>
References: <20260908-drm-reset-state-flag-v3-0-905570f387a4@kernel.org>
In-Reply-To: <20260908-drm-reset-state-flag-v3-0-905570f387a4@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T0/yZbif8qvMhUYbKQ5OZSohlQVc+4QmXLfUx6lhP6s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkLZOWP7ZpwiOfxzckvD/6sfH3mvX1iRceslvTPqnluK
 2reXH22tmMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBMxHoyY51Gxp/H4ocac9kl
 p5mdPMt2mGtZnn+8r2pL9F/eZsNJvz0/VT79mRl+aau3zLkaRjnnp4wNlzW1TNmvxs8smDf7AeN
 Wc/Mt4sqvLshr6rCWcttcqvJcJ/X66WO/6Xr7WlbztZ9y0z8EAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The vkms container_of helpers use container_of() which discards the
const qualifier from the input pointer. This prevents passing a const
state pointer to to_vkms_plane_state() without a cast, for instance
in atomic_get_property which receives a const drm_plane_state.

Switch all four helpers to container_of_const() so the const qualifier
is properly propagated to the result type.

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

