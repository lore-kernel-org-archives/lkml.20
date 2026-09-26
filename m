Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00753115A2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790462034; cv=none; b=hGfD3lIjys0oB6PBgV43JI3FnOvN/oMHpyaNwFMluRUEa9HDdP3sfmDPmUaOs+f+a91bvG/LpWmWsgvpFkm9l/5vlmzQCxccBqMr0nUBs0OjtJBmzgQ+OmooBiuCQVuEN5TmTJ+uYmnHSLOWc5m65ekxi8rbTcgMWdySTaYpHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790462034; c=relaxed/simple;
	bh=fxP3TXfyWT+sUcAC6cZncp/t39Htd3ktm9W/nEZb5KI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WVdRYuweLKC6Fcl3nMQKjEbHHi9hBwzNW62prdyVWpEIP7TQQrrzEFvZujmRkgp2QRoQIoAcPtdUakKcyEF+8av27Ie6KZeTkiHZpvbQP7Xm5Cxd1jD+WupnQ//fa/nkrB5WtONqIjEGdQrXMy5vm/22Y9cEc6wUdoS2lKWzQzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tS+E/4Mg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tS+E/4Mg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31A15C2BCB8;
	Sat, 26 Sep 2026 22:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790462034;
	bh=fxP3TXfyWT+sUcAC6cZncp/t39Htd3ktm9W/nEZb5KI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tS+E/4MgmQdLBxg9iNBbiLTjbapFyxLlw1yBVGEcsIVdGSkYiw4lzxfmIzC3dlB1K
	 n46UsXhmESOpk9sENyg9V3gNMDG8ZE4rclqZTRlB2MtAdACNYUipxUmkRJrppgrdaq
	 Z0Lw1DWzIDRg31mOMSMjIiY9+hcQa8Tpj85ztC/vupcb77bKJhL0Vl02UdeSK0W8UY
	 B9HviXQ8BXzejb7DKGc7clBdMjx0135sFl4EkPKwNBOymXXFmZniUqIPVGV4t6337H
	 eB0GGn0+KTenyEEa75scunovKqmtX0bkwOK9MaSWSTdiPsH7ncXy14ePYt99+73px+
	 r/veRH+lYIAFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06685C98328;
	Sat, 26 Sep 2026 22:33:54 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Subject: [PATCH 0/2] drm: 2 quick fixes
Date: Sat, 26 Sep 2026 16:33:31 -0600
Message-Id: <20260926-rd-mostly-v1-0-28b7d714ed2c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNT3aIU3dz84pKcSl2zRKO0ZIPkFLO0FDMloPqCotS0zAqwWdGxtbU
 AYiYBmlsAAAA=
X-Change-ID: 20260925-rd-mostly-6a2fc0cd6fd6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790462033; l=709;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=fxP3TXfyWT+sUcAC6cZncp/t39Htd3ktm9W/nEZb5KI=;
 b=xI/zic2+jXuvDHLxNq3q1EcjouHL9BjNcN17ZvWX1RuNF1A2eXefwQR4deGxsM57UhhK+Bzhh
 hVVzbpo9zd2AZ6JVNT66RtiRSsJNKPNwsyoMFAzwlBAfvfgC0WXKzmE
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com

1. make __drm_debug __read_mostly
   it is rarely written, and read at up to 80khz
   
2. fix CFLAGS -> ccflags mis-spelling
   this fails to add -DDYNAMIC_DEBUG_MODULE to ccflags
   currently masked by DRM_USE_DYNAMIC_DEBUG=n

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Jim Cromie (2):
      drm/print: Mark __drm_debug as __read_mostly
      drm: Fix incorrect ccflags-y spelling inside Makefile

 drivers/gpu/drm/Makefile    | 3 ++-
 drivers/gpu/drm/drm_print.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260925-rd-mostly-6a2fc0cd6fd6

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>


