Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACD94E4302
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892725; cv=none; b=ROyT6/eRlzP6iYcPY3h6a7YONNNB3TRHYqARezv2E3mhuYwgC2kin82a9v0OWTdq7Yw0iQmDI5a7laVlrkxQHfRG552JLJGVkNIkM2MCFQz0Y888gXT0eXprG8Z6euYwkoJuStco45r+hgMv+AOp8XHLLbwfllP9CqrT1vSi4dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892725; c=relaxed/simple;
	bh=FMk6nmYE8//ZlncdjePunFwhXKADEtkS5BFhT5MPsos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKroKdXOovkAEDG89m15SmrPENcDOACei3hV3Hjdxkp6n8ScQh3DNOfk2gUmRm7gpnxKZAOrJ3vVAPI6pFxzZuHKRrk7ORUbK+9Cr9Wm1U19/MiQF4aXEeYgxnAB9HdkAW46d8z7nIZBVcyfXsGRbWNzOeMMFl4wkUZMsXUdFJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JTxSlrvR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JTxSlrvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791892723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FzL07gJuf7PFvexAZWGO9lr3zsHL6njv/XSwM6aFQXo=;
	b=JTxSlrvRDjgVH6Lj7m6OVRTsCTCQqtIvMmkttLInuSlEE9y6ZjtkJ8J3aTR3v5PPHHbM6+
	oTrEiwlvnDAKF3MHLTnfAo83ocgLy5WQ0mc1tRYfbj9ljN0akAI2lgsUHC8XKRLr0R3ZYr
	iBWoE0EWCLkTnkjPYWvwNbbNCOM2nOo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-PgKeI_z9M9mF3NJh0x3Psg-1; Tue,
 13 Oct 2026 11:58:39 +0000
X-MC-Unique: PgKeI_z9M9mF3NJh0x3Psg-1
X-Mimecast-MFC-AGG-ID: PgKeI_z9M9mF3NJh0x3Psg_1791892718
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1EAB18345AC;
	Tue, 13 Oct 2026 11:58:37 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC8BC195608C;
	Tue, 13 Oct 2026 11:58:33 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 13 Oct 2026 13:58:15 +0200
Subject: [PATCH v2 3/3] drm/amd/display: drop INLINE_IFN_KUNIT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-visibility-unification-v2-3-3ce8d458bddf@redhat.com>
References: <20261013-visibility-unification-v2-0-3ce8d458bddf@redhat.com>
In-Reply-To: <20261013-visibility-unification-v2-0-3ce8d458bddf@redhat.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Albert Esteve <aesteve@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791892699; l=2429;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=FMk6nmYE8//ZlncdjePunFwhXKADEtkS5BFhT5MPsos=;
 b=txNrMO5UMmG71mo0DBOXq5qjzE5grUxSM3wXS7O6MeWNXOXhL7wZ1MqREt5U6z7WBCwP8392A
 zHiS4j+2XScCucXkpShtxzquQYoxCT1CTqDEmCXNaxKiZmCVDdrCXID
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This helper was originally static inline. INLINE_IFN_KUNIT only added
inline for KUnit builds, which dropped that hint from production.

There is no equivalent in kunit/visibility.h, and tests do not need
one: they call the exported symbol from another translation unit.
Use an unconditional inline with VISIBLE_IF_KUNIT instead so
production stays static inline.

kernel-doc already strips inline, so the dedicated xform can go too.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h             | 7 -------
 tools/lib/python/kdoc/xforms_lists.py                   | 1 -
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index e3f4ee6e8380..eea7e7dcfa30 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -173,7 +173,7 @@ void amdgpu_dm_init_color_mod(void)
 }
 EXPORT_SYMBOL_IF_KUNIT(amdgpu_dm_init_color_mod);
 
-VISIBLE_IF_KUNIT INLINE_IFN_KUNIT
+VISIBLE_IF_KUNIT inline
 struct fixed31_32 amdgpu_dm_fixpt_from_s3132(__u64 x)
 {
 	struct fixed31_32 val;
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 6d7cdab1006f..cabcbc2599e6 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -194,13 +194,6 @@ void dm_helpers_mccs_vcp_set(
 		struct dc_link *link,
 		struct dc_sink *sink);
 
-#if IS_ENABLED(CONFIG_DRM_AMD_DC_KUNIT_TEST)
-#define INLINE_IFN_KUNIT inline
-
-#else
-#define INLINE_IFN_KUNIT
-#endif
-
 bool dm_helpers_submit_i2c_over_aux(
 	struct ddc_service *ddc,
 	uint32_t address,
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index b49b81da74d9..cab4a49e4fc4 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -105,7 +105,6 @@ class CTransforms:
         (CMatch("__attribute_const__"), ""),
         (CMatch("__attribute__"), ""),
         (CMatch("VISIBLE_IF_KUNIT"), ""),
-        (CMatch("INLINE_IFN_KUNIT"), ""),
 
         #
         # HACK: this is similar to process_export() hack. It is meant to

-- 
2.55.0

