Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794625446;
	b=jysHxWE4BsuwZWiByOGjsJT+iEdG50NXTnlaPpqMq1leqAKNk+7WY1245B1h1FLhVIF6
	 kDIVuJ3LySsMR/05CIwuXR8iti9sXA+PXyUjYyfhT8uD/D1DmT934yd9GGQn7lnTaIU2S
	 AG1w03C850ZCp6vKNsJOrv6zI9uhjmiktFDIyEXO3lff/7i/5025GEuE8UCYw4m27YQMb
	 ABxr+B8HeUAy6Y8vuKtUuzkS5vAtll9WsE4iT8DNjIdxJvMKsUolUnwaEPNl2c9iFNHWU
	 XUJLWc3x+uLtZkXnk/8V3f4p7nMyXmBYZM7W4+Nh0S+ZcE8D6DoTVuEucQgu9LJ+uTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625446;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YCrmrXbHaLXAbFp8zW5OanBYom7XxNsqQqM5dsBG/Fo=;
	b=Fu4Yr4mp6cngQxN5NNliCRUw19Z6NFoXMjOYuqQJEXYTRfZoFjTN0HW31MuVbuA8sVA0
	 hpmnqFhC5BmgP2HzFZWMEAYOeB5+ivLukY01f4R7I2VCYmFxuxvb5jPMwq05dimvcNmeX
	 hp0EjFx3sVwg0pfal4IgpaqjXFkNQnNoWiEGX96SsxFIdcQ5SAByLjiFpTUVOOKfgdswc
	 21zTFyhTnhCIC+XPc8TXM7fLV5+3/16VT6QGa8JWH29zw88e/dbFY5ZgqcUNqMRoA+FXd
	 WNX8/7wjJPHtJqhidiniDtMPyTOX4D1mnAgKQA8URHTOuwfnFC2RYLm08UUfBREVZhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ge7jIXFj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F55606A8AA
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ge7jIXFj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794625446;
	b=f66sSTrTB1qTQY9oJdgvA+pT1qa/LweAJhcMw4lAYoP6dL0BSCaNzxy7QJ0sm69dJ7nj
	 PD8//am9JhhMv+x5mK5Snmr8+bVvI1F5qHJ1z57FwPRKyoGyLnya9FB98zr8oIpbhX3Z5
	 JYDA/btGKRoTzrZLrdqpd0Qv3y0/5RJFeU5H6FGeX3TJpnlEpEvNe815yMPJAzbB6tE+F
	 MH3MEecHK3zjuMaApdpVokMF7BWMRZpLNnIBMReR48jBXhTYP/QxPt/zQPpB+R6vN/t9A
	 IluApnp9VssbWstP7eVyKMV+KCCqone1YZmE8/6I5q1MdXSIY3NlN5c2+We+o6ZLs2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794625446;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YCrmrXbHaLXAbFp8zW5OanBYom7XxNsqQqM5dsBG/Fo=;
	b=aCAOEtoek4XwPgRKJVOMiv2MHkd3oeKbEMmTIlgV1aJRR+r0mVwujRKH1gPK5/l0PNfF
	 em9OwpHoesYjI3w79Pn8ZDsV747/np2XQ+VUypz32yr56C6wAI2lvAyxss6ozFf5Go3zS
	 0dRfkPKWQ9PVbTg1mLhdSGTRpnsfHgCHgB0RnYUwUhv18r+ToE8tYF/T15ptvxAStqTMk
	 KvXljrXILoN12Fq2vU3HPElJ6SyoYxJdP4rFy8NjPkIPdUwMtpcV3Eh2PbH+DtI1yVsBP
	 cIh98dJZPHl81NCL9lV7LHifZV8xWDseHKws/2T+BGgnoEd+FFCd/i1aYNzQlsUBzYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 627211F000CB;
	Sat, 14 Nov 2026 03:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794625446;
	bh=YCrmrXbHaLXAbFp8zW5OanBYom7XxNsqQqM5dsBG/Fo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ge7jIXFjGUvDF5GpsfeaYLi3GYU2K+pMXuGk9xpLp2JNE+OKTLrKBhJdBRPp2iF6o
	 TuTVoIYTIgF7iJSkn0bXkwdg0Rd+NT8Zh7xiWHujcZ3HVDz8gHOuuotjVgz+72vSaN
	 AiUUPhBwoFwCPdk5qbRLp7njG7AvjwmXtBj5rLHPxgrpbHLBhW8gKSjjjBTCtVM7CW
	 I8A6SYiLOaOWNhkAraF4KNxkfUFORt2eqIWLTxegQqT2p4r/UEqmy7li2cSKsTsuLe
	 pLNTB2aRONheGEC+yqZGhDjOsDDhL8mvmxf5A4uwtHJs3GejOebqkAt+oMhW3DDrJV
	 Ln4AbJnTG9Sag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 07E9349C61;
	Sat, 14 Nov 2026 03:04:03 +0000 (UTC)
From: Joshua Horne via B4 Relay <devnull+hornejd.etsu.edu@kernel.org>
Date: Fri, 13 Nov 2026 22:03:25 -0500
Subject: [PATCH 5/5] drm/amd/pm: stop disabling overdrive on Carrizo and
 Stoney
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
Message-Id: <20261113-smu8-overdrive-v1-5-763f07bdfca9@etsu.edu>
References: <20261113-smu8-overdrive-v1-0-763f07bdfca9@etsu.edu>
In-Reply-To: <20261113-smu8-overdrive-v1-0-763f07bdfca9@etsu.edu>
To: Alex Deucher <alexander.deucher@amd.com>, 
 Kenneth Feng <kenneth.feng@amd.com>
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Joshua Horne <hornejd@etsu.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625442; l=2145;
 i=hornejd@etsu.edu; s=20261109; h=from:subject:message-id;
 bh=VKahiMDOwea9yzvvuGDSewIcoDKB3SmzTv8wZiIV9IQ=;
 b=KErygZMEC8XajtvxXESCTHrx0CU9sOSsqn8cFaSxKmFHw9mnLjjBDAuxxWM8OZAAi0L2f6qMJ
 beK8j/3QEDkAsxbdGhsLSXiBnsQ725mYhH8xNG2f32mAI1jFVHXWtWu
X-Developer-Key: i=hornejd@etsu.edu; a=ed25519;
 pk=HNOtiwerBbrJhfhzLHLxj3GDsUH9udRXflqnaI8sQmQ=
X-Endpoint-Received: by B4 Relay for hornejd@etsu.edu/20261109 with
 auth_id=1469
X-Original-From: Joshua Horne <hornejd@etsu.edu>
Reply-To: hornejd@etsu.edu
Content-Transfer-Encoding: 7bit

From: Joshua Horne <hornejd@etsu.edu>

Commit b7e919b9403f ("drm/amd/pp: Disable OD feature on APU/Iceland")
disabled overdrive on these APUs, which the smu8 backend did not
implement then. Now that it does, let the PP_OVERDRIVE_MASK bit of
amdgpu.ppfeaturemask decide, as on Tonga and newer dGPUs. The bit is
clear by default and taints the kernel when set.

Raven, disabled by the same commit, gained overdrive support with
commit 12a6727dee5d ("drm/amd/powerplay: add one sysfs file to support
the feature to modify gfx clock on Raven/Raven2/Picasso APU.").

Document the pp_od_clk_voltage format for Carrizo and Stoney.

Signed-off-by: Joshua Horne <hornejd@etsu.edu>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c             | 6 ++++++
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 48c52ac0fc77..aeee31cc08c9 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -705,6 +705,12 @@ static ssize_t amdgpu_set_pp_table(struct device *dev,
  * "c" (commit) to the file to commit your changes.  If you want to reset to the
  * default power levels, write "r" (reset) to the file to reset them.
  *
+ * < For Carrizo and Stoney APUs >
+ *
+ * As for Vega10 and previous ASICs, without OD_MCLK. The voltages are
+ * those of the graphics (VDDGFX) rail. A level switches to its new clock
+ * and voltage the next time the GPU enters that level.
+ *
  *
  * < For Vega20 and newer ASICs >
  *
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
index 4d553be56396..1567b8fa2a6b 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
@@ -120,7 +120,6 @@ int hwmgr_early_init(struct pp_hwmgr *hwmgr)
 		break;
 	case AMDGPU_FAMILY_CZ:
 		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
-		hwmgr->od_enabled = false;
 		hwmgr->smumgr_funcs = &smu8_smu_funcs;
 		hwmgr->feature_mask &= ~PP_GFXOFF_MASK;
 		smu8_init_function_pointers(hwmgr);

-- 
2.56.0


