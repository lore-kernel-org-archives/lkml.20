Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFDB2C2360
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790462034; cv=none; b=PKPMtWiL5DaVsKGvZan/mfac9sMMaa4t5ldUlaEzy5m8q1uB3HvhhIDPrfptJX9E2pKKOeW5EhE34/Q1sRd1f18lxljkODTHP5Odmui/zuh0wUqpgmlnxGI8kxRxLU3JYQo4mcp8didINh3Eq9R02553lYIYLinRzttQ+jEHQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790462034; c=relaxed/simple;
	bh=VZulDtDxqhPLQ6+5jwWRkBXlKH0j6U1wO7eceuEiZCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHqD8ZPiRzqWiPFEaYQJ7V7JyqX4W1iLGIyp8wOIFQHXhlsY5z5Hfln1stqWPr0iLZKfeiPMOBh7zZylb2v5vxpAafGieTWxRRl0UuLfFVgs5ob3KxC/Irx0UurfvPJUz4ACGQz3cN14JNdRvt7moLyJ0zNpeh2iROpRzDCn1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdLtRGZe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdLtRGZe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BEF1C2BCFA;
	Sat, 26 Sep 2026 22:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790462034;
	bh=VZulDtDxqhPLQ6+5jwWRkBXlKH0j6U1wO7eceuEiZCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kdLtRGZe73fngpDVokxQIaocmTf+0BVw/oXF53nTYc5ynV16AxQURzPyoMgxsb5DS
	 DG3uIsbI3C8fWXkWQEEWOENTMOv89uTr400YAeQd7/5Xve3W9uwoRo/bNkuP8eAMXi
	 7GMyxfazDKeuIPeMtRYPBC2traeKLlQWo3MZaAQlZS/tkUGy7mT0oXOGI4xQRuNgOH
	 +LI6wVz5PE7ygu67Al8rWA8okPlAyeJ09/F14q7Nx+w6pQlimNCZZbdT2E52ghYY6M
	 bNIS2+C/l65JwmmvUBRgUIujePnBG6w3K6y3nZeTGd2cXw+3uXfjP/gFd9UzNZR9zr
	 fDJNs1DMwRmDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D92FC9833E;
	Sat, 26 Sep 2026 22:33:54 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Sat, 26 Sep 2026 16:33:33 -0600
Subject: [PATCH 2/2] drm: Fix incorrect ccflags-y spelling inside Makefile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-rd-mostly-v1-2-28b7d714ed2c@gmail.com>
References: <20260926-rd-mostly-v1-0-28b7d714ed2c@gmail.com>
In-Reply-To: <20260926-rd-mostly-v1-0-28b7d714ed2c@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790462033; l=1146;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=k/p3/mF4PjoGAd1p0WbIzbzTATt0GlWd9hAVgx/C8sg=;
 b=bsI2eblwopjRAJO9Q6o7zYYZ/Kl0joBNGfqKkrxAZc//Sxa+h9iENDsnV5jfIDaqARyTd1QOv
 U97OkhBUfhbA0PXGax8ZzT7KTdN6cBxedw9fm2RbrswYs2s/1ZVNYAa
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com

From: Jim Cromie <jim.cromie@gmail.com>

Fix a longstanding spelling error in the DRM Makefile by changing
'CFLAGS-y' to 'ccflags-y'. This fixes CONFIG_DRM_USE_DYNAMIC_DEBUG=y
dependent addition of -DDYNAMIC_DEBUG_MODULE, which is needed to
enable dyndbg-under-drm-debug when only CONFIG_DYNAMIC_DEBUG_CORE is
enabled (and not CONFIG_DYNAMIC_DEBUG itself).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e635fcffd379..c42884d84ad1 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.warn

-- 
2.55.0


