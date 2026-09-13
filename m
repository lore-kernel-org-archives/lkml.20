Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C73AFAE4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338134; cv=none; b=i0i0E1/PsmMCNNLM/plIP54Lm3vJiyezxUqKJRrn3sh4ZfAtq3LqsjY2zDJ2VFA+OYAbvPpX0yGpsIT1lQN+7TjWBbtpzW+XFgJOjAEzxzRav5PZZ7eY42OC7dabNguXpnmrhH5wiEy9QA0Xkj8uuvfM/VumAoUE5C4um14UWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338134; c=relaxed/simple;
	bh=gRRgJNT3RswhEBDOGHgnNt+Nd5RI5Fdd2oiLcy/OEUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Chwa4T/xYzcFPVJzwx0vL8XlssFLmBN5CApWeLBN0hVA2pC3t2Z1ldM7ak4xbpXsp495AmLe3G+0nTgfQCKOhc7WXaXp91t69mG6XqTtuFRNMesnm0tjiqoIs9eHgRcMbcPfA5Lvwa6VMYCed4sk34SgvKpoJwgeCLxSTHHsucA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcMBOYW9; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcMBOYW9"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939ca12ab70so204564785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338129; x=1789942929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4As30AnVCPBZbgyBnVugtueaVrIX9a2Icgy2bIVOu0Q=;
        b=jcMBOYW93HqHO74wB/SlB0ADF6P4JfOy1SCxVigSF1HNWoGF7+PqnEMzgxn8mpwFLD
         RmQNBKnBR4hpiOulxEKGNKBC2BTloCB17zSRdyLpOll84X8uM97a7VgqbxKWL6pJa6vr
         KcjLz+/YKWqpv9BhxCTbaA6ubqy31rXMb0u7bEzbBUEqxP5XNqjj5Ace+Jjw2moK53hz
         YHIh22V6u1OcKYDl7FtdbmH+2HLGQqKcrs/AW7aef0GnjLw6qI7ApOlpWKehTz+Uw0xj
         2UFpMCmzdwSrba2f+NwReyDJYtVl2qiq9/Tsndd6KE3gP1KucQKXt/Pr5O+PWLdhdq9W
         aivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338129; x=1789942929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4As30AnVCPBZbgyBnVugtueaVrIX9a2Icgy2bIVOu0Q=;
        b=prjd+9S4kwaWLHeuCRXAHIlNq7pP23ZK694Jgpv8W19raqoVsMC+/x3MvVYZPV2OTm
         d0XrgJb+uoGAXk5nlzv7pI0vye9go5P9d3y843rgJQlkO6dY9kbWRAffZLYkGxt1Hjxa
         kN9L3qf92gEhtZ/LtXpUPWlLuo/ywA+MzWEUqslPMvIGmGaB0ysxQThzZOH7oyt+uK/4
         S4XiYi06aYW27qzRgFegD1UAq/Qi3qVror4Kx9r+wesRspfo//B0fRHtcGK0bQ3QOY+G
         YyoTFULI1wP7wLCwmQwUkPYDDQ5hPPKKBr4J1aHjbrr/nzkFzZf2ObRMwg8gJr85Zg5a
         DF9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgTv3Fy3A+MqfRoE42nv1yqVr+BrteDPcFy5OHuHJ6dcN0Ob8o9ETz2QmwhgbCWC3v5gUwCzUy9YdSQxg=@vger.kernel.org
X-Gm-Message-State: AFuF++nUlifQVUJO6E6UO0eaE17qV+/KIrChJTADf0QFXBo8WkguRl9a
	itBuAZFovvaJKfjAa1KUjxXVi9/syU158SfXJsTM21dM6GtEdEXYQLc=
X-Gm-Gg: AYBFou1DP1c3YT8jGn0Wx47CH8tFeOEz3ZlT7+y2yUHy5sWljDP3FYU8QEdYZQAAwWB
	QEgr5XoaTbgYUzeF4qj09dn+7zZL9iuQQj9o98clvzhMiwyKQtBR1F6lJKUdJxlNtQFgsAPiBHg
	ikyyMdoEiQIixMRStgzb3OfnKt6QsI2V9nh8ZuEuevhKVbasRkRRc5RRNjReSFw+jinllHyqLHg
	4A44h7WcdmyNUOg5NX2dgFQw6vOW7Ft+FkAfs+CiFahoCVAyjFTXWvO9TMJ+kxg8Czh2wG3kWt0
	kPW+j2Hjc4L/kKiBePnkfzilGZaERvrxjhBuLMuzmNzh22rbLM4DCsPAeOCsMA81IdncR/4im1S
	Rxo4fCfr7jx9HgQCjjJC7Vhc7GTgYxHpm5K+ivxiHJEjCZScslCZ9BBC6+dmVxYsqzomdQXRXpD
	MJjYZqP4Jy8czqr+aeveW6MkU4AQHxfXGf6c5d00+fBmDwCvwzhPmuRmcrfxFW4Mzl2+WzouTKb
	zYVMa3mTJMr1+6OFuFRuP0viIsNtXeWmOCXLnfejOmfzZlFy1neC8P1sPprzMDkUY2DfQXyzM8G
	qcWkLs1fdCwEx9EW3PSMYwlbNl9vVoi5oxI=
X-Received: by 2002:a05:620a:17a5:b0:939:761d:f948 with SMTP id af79cd13be357-93a29a13a93mr13504685a.34.1789338128728;
        Sun, 13 Sep 2026 15:22:08 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939fd0ebaf6sm592293185a.35.2026.09.13.15.22.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:22:07 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Torsten Duwe <duwe@suse.de>,
	Icenowy Zheng <icenowy@aosc.io>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/bridge: anx6345: Power off the bridge on removal
Date: Sun, 13 Sep 2026 18:22:00 -0400
Message-ID: <20260913222200.86645-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe callback powers on the bridge to read its chip ID and leaves it
powered on when the ID check succeeds. This enables both regulators and
prepares the optional panel. If the device is removed before the bridge
disable callback runs, these resources remain active after removal.

Power off the bridge in the remove callback before unregistering its I2C
dummy clients. Check the powered flag first to avoid disabling regulators
again when the bridge disable callback has already powered it off.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime or active-display unbind testing was performed.

 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 407834a03b638991a5a7a4c64dbe3263bfd0d8a9..43c02f312a46593bfe4a0c46f06940006ee566b6 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -775,6 +775,9 @@ static void anx6345_i2c_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&anx6345->bridge);
 
+	if (anx6345->powered)
+		anx6345_poweroff(anx6345);
+
 	unregister_i2c_dummy_clients(anx6345);
 
 	drm_edid_free(anx6345->drm_edid);
