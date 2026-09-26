Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00E7331EBA
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790462034; cv=none; b=XneTI5VrPyKlp5tGdzMQmJxVOxBik2yjLVWnxgrX1D0Ex98S02zNWZ0lKZ824adVanZfxlGrx9Wm1ZF51pvItXVO+zLFpNIePvfZ0YEyR068onsztfhmiMkh+MBipyhFw9ReTGckxRvON1rwFh/+lor4YP40jzHag5bO9DwASMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790462034; c=relaxed/simple;
	bh=5EjlbXzfNhhj2rFbPScAbyukxVXncWxCqZbBtLgd2Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZviTUTlvZeSRgiia4rM5doDevS8RzvTbx6Bck24Q5QjWJMghkrzDsF0RIJVeRmXxNCp0QC7x31XrNHbDCoU48BXDpFeqpZbF4pXidHTueb7C0ZuxA1Z6/kBAXvKw1pudQZxg5Q6YaSc/UNUJJ2pREeJxvrn4nUyYg1zPch+jFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LskNpArg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LskNpArg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C0B4C2BCC7;
	Sat, 26 Sep 2026 22:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790462034;
	bh=5EjlbXzfNhhj2rFbPScAbyukxVXncWxCqZbBtLgd2Gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LskNpArgBG/fYyfbkpDz2jDlqGHlCqQJ3QyIitRdBdxlgFIU46X+bw6Yx5YKf3bQE
	 UEv348aKBPLKLiZpISVoqJeIwoTRNIAQ4XK4hyTlfGaheV1/M9ewui4UDuQS6i6h97
	 t841JEaxFuJ4g8oDIzg6awRPCT5Yx3ZuWE63LT6zAjY3Wr18WCuH/gBR8uYoj0LvPh
	 /2WKdgz/B7yNqoOgfRQceM6GD5FQHMEJE/PIIhNC6nMUV0SYPW7NGywVdLE4AxrUZJ
	 sypKQhP9urJsFQmmRBz66QqbTnjHTl1cLLa3T6pZ8RYgTJwCXTY5HP/sfbK8RGchlu
	 bBgi2EJv8Huyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C439C9832A;
	Sat, 26 Sep 2026 22:33:54 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Sat, 26 Sep 2026 16:33:32 -0600
Subject: [PATCH 1/2] drm/print: Mark __drm_debug as __read_mostly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-rd-mostly-v1-1-28b7d714ed2c@gmail.com>
References: <20260926-rd-mostly-v1-0-28b7d714ed2c@gmail.com>
In-Reply-To: <20260926-rd-mostly-v1-0-28b7d714ed2c@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790462033; l=1186;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=NHYPZMcwo+bZTlMUWxR3C+eUOnJQOrGzS6sFjK6QR7o=;
 b=SCaWekTeF5fI3x8YyVSdoR1Ax7xSj1vUuUes5O/Lc6T011ZE8poxxwKWNHG6UFxmCcbVFIVLu
 XmfS+0EWTuNCmaFvvUO6vSgKQVVUBQmiYxmh1hytdPG4sKn4VpuvFIR
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com

From: Jim Cromie <jim.cromie@gmail.com>

Under a multi-client workload of 12 concurrent vkcubes on AMD iGPU,
__drm_debug is read at ~83.3 kHz across multiple cores during atomic
and vblank checks.

__drm_debug is written only when userspace does:
  echo 0xff > /sys/module/drm/parameters/debug

Currently the linker packs __drm_debug into .bss adjacent to hot
structures: drm_lease_idr_object, drm_class, and drm_global_mutex,
causing unnecessary cacheline invalidations.

Mark __drm_debug as __read_mostly to relocate it to .data..read_mostly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 86cef1a37678..50cdeb1b15e2 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -40,7 +40,7 @@
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned long __drm_debug;
+unsigned long __drm_debug __read_mostly;
 EXPORT_SYMBOL(__drm_debug);
 
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"

-- 
2.55.0


