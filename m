Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677247;
	b=X+NpMFc2QHRATyaNHs69DLfc1/QkQK3ReFfiZctj9ngKdhbpYpKychSwSWaHZ6qv15F2
	 Bm0KQtfPU0vH+GgPetJZ7ORioyCxUKsN0G3ulakc+xMUmiNI0gpgjXwwcetQ03IHueOC/
	 iOFrKxycs9e4+aWgA8H3Lp8UsHQ/Yfh7VibxgjnuJq93hM919xShyqn5ynM2+8r0puLl/
	 Buw4eucMuCmF/nnpULoxpyQIBtzm8OfbHbtXUxk2/ZjRjhtWQtEI5PcQXbfTDV76qV5QG
	 OJkflXYJ+TOsD9+aqRA3MakUfMN+UF139WqxrUhRuR7c+xgzAB2HOkPLCY1p310BWaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677247;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=luG8PmeuahdulGWPX7qVjLy6cKvtxIl5j6p+GIrFYDQ=;
	b=2BbDazjAwglcAGJ7Cp2Xi+wdaRMWR4lNJ5mhReKvfdM1qhhoDYbOb8LyAbO8Hc8CUndi
	 Jqzq3UXZ0UDuVnFRMJb6Fmu7cL2Tf/ETvKpvrXDm+jUpMCSyLoykaZIbvC0RsvQsUVAnW
	 LnRTh6P10YFsSNFfr34NGVMtFMm4az6Ekl8mg5geAdr2O9IssWspnklo/vsizyWU+d1Gt
	 rHk1FpRLrD143Qn2VFT6DpYyZOzi5Nw0Ug+ZGysO51thES3keHBE8RsmK3v9HRh/Hio9F
	 aJKNlWwv3hMtvA9z+XdAbwMFhkkQAxQCgAmCd7k6Tm0a4Bjbd7Yc2AyESG/VIO9O3DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGO0R98I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E187606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGO0R98I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7321F000C4;
	Thu, 22 Oct 2026 13:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677247;
	bh=luG8PmeuahdulGWPX7qVjLy6cKvtxIl5j6p+GIrFYDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oGO0R98ICV5dNLo5EknVb1VTxSuqn/EdWO5hO6OoUxxhHysNPrmWcUJRQqJLHe5Be
	 p7ohlZdV5ppI3tu0DXpllJuxYu/bIy0bj3O/gHeEkEjdvpii/RsxXq903HRdv07VZH
	 241udgfoTeJdOmxnD3gxLWZKKlaU4gDx9HuadxPXQuV5T9IaC5mTQtYGoAi4+l8wkf
	 1P35UO1ujfNa7EoYdNB+WshPsRXi9T9vdFYGeZUiYgvUJu0t8+LZI6EpW5dpir5KJF
	 oySm6KR6PmdtxK4IAj56hLgVzS5n1/krzsWuLxd7YY62IVUKQvHXwUJmFZQv8AbTh4
	 y7ptIUuW4WdnA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:15 +0200
Subject: [PATCH v6 14/15] drm/vkms: Switch container_of helpers to
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
Message-Id: <20261022-drm-reset-state-flag-v6-14-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9KymKSyh2DSpKBjfqlW7NyoJFWIhRkdHFylYcuG4zks=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RD13Gmpvm8UnMZNrjcLT7SVxX6+0P71zLud0cUekS
 coK7S8POqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE3h1mbJjYduJezVvPD7d2
 PLhcpRzRyWYTbuUvFyPl/mL93cv7HvkfVtC13VTDe7P+zcULq1doljI2nO6btPVV7vE//04maD4
 p0zLrXFbocLtIu1XQ5G6Tyu3MyfV2rTLR85yY1vPcN2Kw8bsPAA==
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

