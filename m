Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC40B4EBADB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567878; cv=none; b=j0GtesJpGS8qk5bmsY2Ohff5mdmr7hjhC+ZcrCrc/7hTxkaKshvYq/AJuS3QjYu/uuHd6bpLbxc7MacAAUS9DYpjLE0nFz5oXwwYLBlpdLgwoi4pPsEnEevwJR9ySucNbewx9sZtV0bnTzdbxO7Ce2r9el03RIdfJ3x7F9VLny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567878; c=relaxed/simple;
	bh=/fFdp633uSwnogK4eY0RGM25kPYtyLeTmwanN+nMgeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QhKtLItINNIaisJRrVpShN6R4+mOVbIrqgY739Zmvm2V5dYxaxqkLnYEwBSviKmx0mJMz135s8L5tEZB1AqE3nskorZ1aomT33ZVYJEYuNNqZqvdcuTRJeEIAqFZl9SZshofUkvjfIDhHrlJxE71CmlKdQQQ+dD4gV/RFXuld2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oG6UMmUk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oG6UMmUk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77C44C4AF09;
	Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791567878;
	bh=/fFdp633uSwnogK4eY0RGM25kPYtyLeTmwanN+nMgeg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oG6UMmUkpSGyKapC9SXro0755cq9dMXbujPMbdWiZWsLIvtCdBdzF3850cx/eNkPK
	 RyfQgzh4GXxXNpKt9FPG+dRIPxhIjZXTpS2V/zvftDM0fImLgliA1e0CtjlsPSWT3K
	 07ubF2UdMDYoVADELBaV3jFGweRi0ioZTE1Jbw5CeOgUSgqQy5XwxzLF0PR1pBxUkM
	 LdY3AYWw3J92Tqg9vL8ojttsdwHNySwVQVhcPG3S7vpN7kRJLAl3yv3AToYnSYZ8e7
	 hO3vZxVXnOdv0JvafqZzJNPgxynp2Bofe/mA9YqY/78rIMTCZeNflHY1vnOG0VMy38
	 VEhCBpMfUZ3rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DB8CA9EC1;
	Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 09 Oct 2026 11:44:26 -0600
Subject: [PATCH v2 3/3] nouveau: Fix NULL dereference in
 nvkm_gsp_gcx_ready()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-my-fixups-v2-3-839e2bbe514d@gmail.com>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
In-Reply-To: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791567877; l=3425;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=YyKLmo0bEj/hJpRUlDlZOCssFCXNnz2YynMbMOOeOi4=;
 b=UOPAMqmtzEXw0svG2xoRhLf7pa0/9gTca19f8JoK3eLaMt8FPyB6oNGnlVSyxtXKPSpi3IYhZ
 IiR/juE41x5CH1MMejtk/VLRyAgubmV7cjNA/+0qHI5/NXBvF8OzuRL
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com

From: Jim Cromie <jim.cromie@gmail.com>

Commit cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
INTERNAL_GCX_ENTRY_PREREQUISITE") hooked nvif_device_gcx_ready() into
nouveau_pmops_runtime_suspend() to consult GSP before runtime suspend.

On GPUs running without GSP-RM (e.g. Volta GV100, NvGspRm=0, or missing
GSP firmware blobs), device->gsp is instantiated but gsp->rm remains
NULL. nvkm_udevice_gcx_ready() checked "!gsp" instead of verifying
nvkm_gsp_rm(gsp), allowing non-RM instances to invoke
nvkm_gsp_gcx_ready(). nvkm_gsp_gcx_ready() then unconditionally
dereferenced gsp->rm->api, causing a kernel oops:

  RIP: 0010:nvkm_gsp_gcx_ready+0x10/0x30 [nouveau]
  Code: ... 48 8b 87 70 0e 00 00 <48> 8b 40 18 ...
  RAX: 0000000000000000 RDI: ffff8c9555fca000
  Call Trace:
   nvkm_udevice_mthd+0xa5/0x150 [nouveau]
   nvkm_ioctl+0xcc/0x1d0 [nouveau]
   nvif_object_mthd+0x110/0x1e0 [nouveau]
   nvif_device_gcx_ready+0x36/0x60 [nouveau]
   nouveau_pmops_runtime_suspend+0x39/0x140 [nouveau]

Instruction decode shows `mov rax, [rdi+0xe70]` loads gsp->rm (0x0),
and `<48> 8b 40 18` (`mov rax, [rax+0x18]`) faults accessing rm->api.

Fix by:
0. Checking !nvkm_gsp_rm(gsp) in nvkm_udevice_gcx_ready() so non-RM
   devices report GC6/GcOff ready and bypass the GSP call entirely.
1. Guarding gsp and gsp->rm in nvkm_gsp_gcx_ready() before inspecting
   gsp->rm->api->gsp->gcx_ready.

Fixes: cb4c7603678c ("drm/nouveau/gsp/r570: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index ed5c6e0e68d3..933f13ed2a50 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -274,7 +274,7 @@ struct nvkm_gsp {
 static inline bool
 nvkm_gsp_rm(struct nvkm_gsp *gsp)
 {
-	return gsp && (gsp->fws.rm || gsp->fw.img);
+	return gsp && gsp->rm && (gsp->fws.rm || gsp->fw.img);
 }
 
 #include <rm/rm.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index f78e6b9b4292..d469437eb991 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -201,7 +201,7 @@ nvkm_udevice_gcx_ready(struct nvkm_udevice *udev, void *data, u32 size)
 	} *args = data;
 	int ret = -ENOSYS;
 
-	if (!gsp) {
+	if (!nvkm_gsp_rm(gsp)) {
 		args->v0.ready = NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_READY;
 		return 0;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index e475d0e8fa7b..ea895f04293a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -51,7 +51,7 @@ nvkm_gsp_intr_stall(struct nvkm_gsp *gsp, enum nvkm_subdev_type type, int inst)
 int
 nvkm_gsp_gcx_ready(struct nvkm_gsp *gsp)
 {
-	if (!gsp->rm->api->gsp->gcx_ready)
+	if (!nvkm_gsp_rm(gsp) || !gsp->rm->api->gsp->gcx_ready)
 		return NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_READY;
 
 	return gsp->rm->api->gsp->gcx_ready(gsp);

-- 
2.56.0


