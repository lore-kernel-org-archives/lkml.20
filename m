Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA96C333439
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790556901; cv=none; b=mjGnDw1czYy0HYtJF8cM5rVB6wzBA7HLENdU+/z0vkzNCplGq/j1GAMQ/seznnuWt4el497fKSVAPv/wORCafSK1oJ879G0lwZk3yn/goi1j9vdyXkVe1Z7PxeuMvw5vPQbR7h6cOnGmk9I2K0J3LMiP76fzrYahwsyrIU0Aj+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790556901; c=relaxed/simple;
	bh=wxN6JVPj4Nsv6C9he8Lk2kbidp4nlxVPRfoSZVUcz6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AztD4hJq6dyaMACzTvj4dGsZIcjbmvpRqvI/48rtDE63oPVC6PUgtIgnH5jsSCLBdgc7UzGg9APmZJlxUiz8fDRLB/nS5PLPBTaOuaXIqb+Xw3ocvBU/5KY71t648KVVDpx4b4tflUx34DTU6Mtl7f5+VgUUtnFXVs/rVpw8VXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=x30xCUB/; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="x30xCUB/"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.112.40.71])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 83B38121114;
	Sun, 27 Sep 2026 21:54:46 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1790556888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2ZJeyHj2hMUdTyP8McbMGBxqp5b+zG+SJIKnSqTY1Gk=;
	b=x30xCUB/TsAVSWbJkrUN+02MViAp1wgNvpOgh33HR41QX8K3QOhVTuSKcrFo96TDW3oJbZ
	up/yyMYre1/hA14fcAwYVE+YKs5KsDm1gDRi9Fekd2yQDxWVVndjjihvzAU+fUELLRQReQ
	OHcnKmtah/inWfrXrcsQYh/M5u8mTtuFbXIXwXjTI5geYVCuUODHwk2lsVt2D0lHE1N1Ro
	1hGTazjnWuAl52Krh1GvE1QMeXopLwmu18qPBUCwmpXTpuuw5uVEojN0nvqM6ED16u6LQo
	geyx8wgGN4SpoPcQWluHPq0pvgmHS2Dd4m2juxBqhc/u22+nE4bDX/IZml5X1w==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Subject: [PATCH 0/5] drm/vkms: support more formats and fix RGB565 regression
Date: Sun, 27 Sep 2026 21:52:56 -0300
Message-ID: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds support for RGB332, BGR233 and BGR565 writeback. This
is done with new helpers added to make conversion easier. It also fixes
a regression in the RGB565 write conversion.

The argb_u16_to_RGB565() code currently truncates the resulting
channels. This behavior was originally fixed by commit
ab87f558dcfb ("drm/vkms: Fix RGB565 pixel conversion"),
but the fix was lost during a refactor in commit
cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions").
The rounding behavior has been restored using the new 
argb_u16_to_channels() helper.

Matheus Alves de Almeida (5):
  drm/vkms: make argb_u16_to_RGB565 round resulting values
  drm/vkms: support BGR565 writeback
  drm/vkms: add a helper for channel to argb_u16 conversion
  drm/vkms: add support for RGB332
  drm/vkms: add support for BGR233

 drivers/gpu/drm/vkms/vkms_formats.c   | 136 ++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_plane.c     |   2 +
 drivers/gpu/drm/vkms/vkms_writeback.c |   5 +-
 3 files changed, 112 insertions(+), 31 deletions(-)

-- 
2.43.0

