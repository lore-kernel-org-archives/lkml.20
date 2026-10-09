Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B359E3D1A82
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567878; cv=none; b=ZE49A1BUX70ica/iQcUQqt00QFum3JDc70mft263shO0CfSvPb6ezqJSXMuKPUCT7NqA32XkF00oU2320qejQoka8F7ES+Ib10iS4qHJuXTnbI4nEqvK+hpWULkhE2AwzdhcDy/VZuNleSrnQip3+t8ePMVlv4YtJAtaSN0OgUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567878; c=relaxed/simple;
	bh=qFnpKLgFzGpj26HbsAUuI94pp4dsklj2mWHgmwxeK3k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zzb3eStfPfErQjdEOaqHeT2cJv1NuKZRWEXw/dMQQf+UnzRT4rNXK8zMKxaMyinV/XUlmqerXII9Neq9BnTMCyH/B+vnRJ6EihJisNGUv7cqVb6FXaRMLEw+u+OIjGnlcKG6FbTq7lKsuK7S7rbgZwjfHATrUjdVrCNjn97gvR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAi1R6Vw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAi1R6Vw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53A29C2BCF4;
	Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791567878;
	bh=qFnpKLgFzGpj26HbsAUuI94pp4dsklj2mWHgmwxeK3k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HAi1R6VwFdZdDgMNDXY+jSa0hE1elP1TgR7VzarpmVmEXeAFBypu1FwYet+90mDd5
	 3+FefKoxS6JB4hEK7RSshTde+5nW0vQttoNP46DBO7RhQyJYLfLwmI1gjvnNrFzBb7
	 V7Xp4tSpDfJYBz012J/Lag952oYQ/NevKCvIE16v5trgtE1N1AJnyKkiTluuaV7jRs
	 Itd+rEBSOZSa865E6sdFe4RsppkRyqoOKXNpTcjcEiBw/kV5QnURZCI8mQb2xAzoR+
	 RJwil+Kyxsgk3Bc722vZ0WnU1ydFagTQvwYIWQB0A19G1Ni+yDINEEVr3Vu1fg59DX
	 1ve5iyQxFlVQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266FFCA601F;
	Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] nouveau: fix 3 null-ptr derefs
Date: Fri, 09 Oct 2026 11:44:23 -0600
Message-Id: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQ7CIBBFr9LM2jEwWKOueg/TBRZoJ5HSgBKbh
 ruLXbt8/7+8DZKNbBPcmg2izZw4zBXo0MAw6Xm0yKYykKCzFILQr+j4814SKjoZap16GNFC9Zd
 o67O37n3lidMrxHVPZ/lb/1WyRIH6ogwJdzXK2W70mp/HIXjoSylfYs7o76IAAAA=
X-Change-ID: 20261002-my-fixups-324d25f3bd05
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791567877; l=1161;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=qFnpKLgFzGpj26HbsAUuI94pp4dsklj2mWHgmwxeK3k=;
 b=OEhSJHp9zZcm8RTWFCmeE4sI2nqpOYo7auJz0s/ut5P7fLlcljs0MFsuz4wx0f1iMm/Qc967C
 +pW26iIYTamDg4NGjTSfFeMqshwHenCkouxE1zMqrcvqJEBI16Q8Zlo
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com

These 3 patches fix NULL ptr derefs I hit while booting kernels with
unrelated work (dynamic-debug) on a 2019 amdgpu+noueau laptop.  One of
them is possibly hard to reproduce, the others are "dependable".

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v2:
- added check of gsp->rm into nvkm_gsp_rm(gsp)
- change if-then-else to if-early-fail, fallthru
- Link to v1: https://lore.kernel.org/r/20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com

---
Jim Cromie (3):
      nouveau: Fix NULL pointer dereferences in GETPARAM ioctl
      nouveau: Fix NULL pointer dereference in GET_ZCULL_INFO ioctl
      nouveau: Fix NULL dereference in nvkm_gsp_gcx_ready()

 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c           | 24 ++++++++++++++++++++---
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |  2 +-
 4 files changed, 24 insertions(+), 6 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261002-my-fixups-324d25f3bd05

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>


