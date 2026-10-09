Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35063CF022
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567878; cv=none; b=jrVdV78FFikw4+fjh9dV+4mwXqoK//AlYrHhFqbdDrzpq97/7l/+DytNXOFj77F6CJUitMLbyeljMVRTF0ty+h5w3KcUsY0toNPvSYLXhQzoqqJuYEZH0xEmX6f6P7dS+I+TR7gUHW1O2NQKC19bnwLMmtzPA3om5eUYiNVOjmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567878; c=relaxed/simple;
	bh=r2YA53IFdz9R8dAyufsM4O4b1qL3eupzQscx+pvgrq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MVQpJN/l5bgsm6iMGJHGTVBPZ42xa4JmXuyAwy4bpCJI3Lngz6BNUeHX6DnLR/g6PIgTBkW8wVFrtKGwd0eTUN1zBYoy6FNTMur/54bDZb2DIkoP7mJ2PqdsegiQd8Xdl+lG5Ps2VqAO81VSxmgE8v2SNMCmvCN7ZvLdCUu2A+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTgeXarX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTgeXarX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69CB4C2BCFC;
	Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791567878;
	bh=r2YA53IFdz9R8dAyufsM4O4b1qL3eupzQscx+pvgrq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tTgeXarXEXVhLJBDeAuSMuboeaaNYVSEn8V7azgFXhewdKb3SIFFdq35re1mt2p8E
	 zK5THZfN8d5pKgtt8znTDMowVC0tYukB+5c6MCEeYRO4dD+U9kFasmEbIZp1Vv7duY
	 1FxQKlxZ7iUKWFFT9TkDlSchkdqcN4N8WPC1fKM2fBjpmoRc/m1tOAzRH9WZX2SDFK
	 187OL1CpV3I4fDXIjQ8g89wuygUvlS/olt2R7dLsjC3Ti61e4UVyUTyAfiQEC5+vNp
	 FjKRuVPdnsYGCs2u3225fVNwg0VUoxgHCLIBjAptjxXW369wXti3pymnYjAvcAQ7Ih
	 e4w6az2vJL5Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C57CA601E;
	Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 09 Oct 2026 11:44:25 -0600
Subject: [PATCH v2 2/3] nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791567877; l=2357;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=vxvOz2WI++74W2VmC+Sffut//FMTgYJwzgeJbmMeTys=;
 b=wcZjN7UcC+Gi/K96Qthxe1uoGWMeymDS7Onwsnnsj1th58miyJ58+jRDBgvQBprpXr+D6fVje
 9nvusXT0nXjCn42Cbpjj1QdvqXDPrS1TzEeoOtA5TMd2RgPyB2tkKaj
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

Reviewed-by: Lyude Paul <lyude@redhat.com>
Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 3f130cd4fbcd..c7ddc54a3c4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -358,7 +358,7 @@ nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
 	struct nvkm_gr *gr = nvxx_gr(drm);
 	struct drm_nouveau_get_zcull_info *out = data;
 
-	if (gr->has_zcull_info) {
+	if (gr && gr->has_zcull_info) {
 		const struct nvkm_gr_zcull_info *i = &gr->zcull_info;
 
 		out->width_align_pixels = i->width_align_pixels;

-- 
2.56.0


