Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C54D4FE2E1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741128; cv=none; b=swpzduTsVeZsTc3cSE1xZgf/z2xl3jJZgnJsdStpiENzbe+tdKAp/IR45xXao5FU7jvQDs7lUd0k24eH/sQBazUz7hDFhi3iXDHR70z5q0ot1NIWjy1EzfxvlsWESpi3Sn3VRisdN5j6jULEgTa68j4RP0bRSCfpm9YswqPAMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741128; c=relaxed/simple;
	bh=T0/yZbif8qvMhUYbKQ5OZSohlQVc+4QmXLfUx6lhP6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QBluJnhfwB2YrStpWWesBTKq6hr6VbTFTYUX4tPskE5VqEac7uxkvghBbkeqDYx81f7ZL8nCGPktX+rYRSnAGeAQYxay7SWB9YjcuzrYmiheM6TM46n7EN3pSh/9Lirf4fncLgrSADH2C7pibUUVUE1U0fZaErydWmYb5r2j58Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kg03Xg9/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg03Xg9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD931F00898;
	Fri, 18 Sep 2026 14:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741127;
	bh=WrDnBXEUES0WR7P2lhOYTykVEKJTOaUBbf8pmdHPY8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kg03Xg9/UH09L0FZmK58QNBMKkuOUJYfHkkLDCTA4OVxT5Vmnyz/a+rHtVWzZ7B1q
	 1xsmCbtbFlJzXI/dMKI9xq1YlLsHnJFnDv+PrmqkmFaWbaQmBxmEQWCIepMgvBcU9J
	 gw9bU6ys0aM2AX0vzvJgpBJJwUo7O5XJGW/rgo73GMR+DmGkCJeBcYQiWaJEohxytZ
	 GcRjH67IT0Q1KjEW/JJSyIoi23V1OIR3BEYQ1cRlvZ6Nsdaab1mdcuAUcaR9/kHcSL
	 tn3JdcIARLUcLA26pQ05bvrGrOxCc0vjVJTA/E1NTbFjFM/iguhmoKhfgEHeQvpB7f
	 LRMFYY0D5tQkw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 18 Sep 2026 16:18:01 +0200
Subject: [PATCH v4 12/13] drm/vkms: Switch container_of helpers to
 container_of_const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-drm-reset-state-flag-v4-12-5ad106370f05@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T0/yZbif8qvMhUYbKQ5OZSohlQVc+4QmXLfUx6lhP6s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlrPUREFCSXLm76OPOa5hdNsTWLLVYE13YrheR1fb0/1
 ajBkO1Zx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIUzxjQ/eMvRdit14Vvvun
 k+fIwt7GltOnmvl85ywq6e7P+H1s71+JFyZn2ERPvZu2JjX9yAWjJMY6y6NyX05eWu3yoO3d/yh
 dMZZqzr9aASZlf0ItzvevXRcXWMf1OHjCH9u1//dNNVvF/aYaAA==
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

