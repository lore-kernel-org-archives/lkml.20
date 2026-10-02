Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40DE3A6B66
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964560; cv=none; b=Cq91+eWWuyf3QNHqDEddG2ibGwILfl0EmcfpNe+cAhNyD8+jKZVBTPU6dYyeH51QjgHvTXObei935Xv9A4VfQaemIpdN2GYSs1UjRkpbyxA2ULXW7qE3k01zjBSsR6aCCpUi6yw4IkIHx/rYMOMGj2vX4UNuc/gZTYX7eg8KDL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964560; c=relaxed/simple;
	bh=Zxi8ngAQE4N498c9vJY+1kq/fCnMAbsmZCNLE2Mkets=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AggGraoFgdDKAP1DLkYWJduEfdE4kum4mcJaAVhfzKM/rBMvKv304xwTjaaubKQ4lXs0P/LWlPfdOeGSymBvMBLG8VipcF8+6qOUYnBVtftkRKa/+ZsQWgoJsrV92Q2ixVmsUblUUONnW47/BS/gdPoIoGDDhBH8/9z639elpRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JW1KR6lw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JW1KR6lw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76D8FC4AF14;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790964560;
	bh=Zxi8ngAQE4N498c9vJY+1kq/fCnMAbsmZCNLE2Mkets=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JW1KR6lw8U30fdg7lnerzmKHzWDaPSvAsrfrrKgnswlIoJvw+7mgUMrpOa5CIWiqz
	 z6LCUsc9dh34/H1HJ9pEH7CdWUFFcBjAvM1Uy7VH0eomE/F121+GkTK9z3lSJ2qqzJ
	 Nv30gkDJNz4nxYkHi0efrxA6aM0vXIKQ3akeFajBarOOj1swj3SWmaabirEvXiic08
	 5UIyIIXCeCUH/ct435upHaJWK+dKBCm0Q/Mf4QcN4rkxL74IJIDpF4GWDyNPbPA1Lk
	 DVt8pbBPoN4lsy/RNpH5oL9tb4Z3HZ00VLxeqnN+N1izL8jtc5lqwvykbfTEuNWgom
	 5zYdoTcgAq3lQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592A5CA5FE2;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 12:09:13 -0600
Subject: [PATCH 2/3] drm/nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-my-fixups-v1-2-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
In-Reply-To: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790964559; l=2253;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=L2BiCR5h7zbMn466+3toqqoccEcp+N08ZHOKB4ykJHg=;
 b=4trrWqnFSWvbtlBEh0oeA1WGLJkQkvPLNvZc26k6fM08kA0otSAlnbpbG5LmUZQ7LKRjpMoKS
 yTaR7AD+jH5AmyNRrVZet8zuAASC1MLXOz6wePMPQG8dMyAhbdGHRK5
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com

From: Jim Cromie <jim.cromie@gmail.com>

When graphics engine firmware fails to load or initialization aborts
early, nvxx_gr(drm) returns NULL. Calling DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
causes nouveau_abi16_ioctl_get_zcull_info() to dereference gr at offset
0xf0 without checking for NULL, triggering a kernel page fault.

Validate that gr is non-NULL before inspecting gr->has_zcull_info.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Aug 14 09:21:52 frodo kernel: BUG: kernel NULL pointer dereference, address: 00000000000000f0
Aug 14 09:21:52 frodo kernel: #PF: error_code(0x0000) - not-present page
Aug 14 09:21:52 frodo kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Aug 14 09:21:52 frodo kernel: RIP: 0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
Aug 14 09:21:52 frodo kernel: Code: 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 40 48 8b 00 48 8b 80 70 02 00 00 <80> b8 f0 00 00 00 00 74 72 8b 90 c0 00 00 00 89 16 8b 90 c4 00 00
Aug 14 09:21:52 frodo kernel: Call Trace:
Aug 14 09:21:52 frodo kernel:  <TASK>
Aug 14 09:21:52 frodo kernel:  drm_ioctl_kernel+0xae/0x100
Aug 14 09:21:52 frodo kernel:  drm_ioctl+0x2e0/0x560
Aug 14 09:21:52 frodo kernel:  ? __pfx_nouveau_abi16_ioctl_get_zcull_info+0x10/0x10 [nouveau]
Aug 14 09:21:52 frodo kernel:  nouveau_drm_ioctl+0x58/0xc0 [nouveau]
Aug 14 09:21:52 frodo kernel:  __x64_sys_ioctl+0xb9/0x100
Aug 14 09:21:52 frodo kernel:  do_syscall_64+0xe2/0x560
Aug 14 09:21:52 frodo kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Aug 14 09:21:52 frodo kernel:  </TASK>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index cb1810dee8e5..0871ac025ace 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -357,7 +357,7 @@ nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
 	struct nvkm_gr *gr = nvxx_gr(drm);
 	struct drm_nouveau_get_zcull_info *out = data;
 
-	if (gr->has_zcull_info) {
+	if (gr && gr->has_zcull_info) {
 		const struct nvkm_gr_zcull_info *i = &gr->zcull_info;
 
 		out->width_align_pixels = i->width_align_pixels;

-- 
2.55.0


