Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4155052844E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687230; cv=none; b=Q+/H/Qef1ggAU7cGNigvTTQkdC5RI/1p4wEE0c5IqyTQ03hLsfrlQ67J2zHxBgvqXAAiWeUH2Ohwcgr1iCfPjQGJzso74oIFwipD0Hl9CA4PUmpDwBWVkgNmIwgxzdj7gwwNwHg4qJm169oDO0uLIlW+FYFb/lAr3C+P32POswk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687230; c=relaxed/simple;
	bh=ASXER380HuydGntV9TKMpzoCoXiDl3Xb+EkYtaawg2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YhuzUUiJrGrHa4msT7VSSgeh7TzotDk1kIaCuTbCHs70hAzTyKem2Px6M6+JYy5ddnlzLEmyuEXkC+9kGq04/XmmEfvwLSk465wNS86wzKF4LHil4SOUDseKEM5Btq5+NsRa0E4vaC/yjHMi8PBgxtJ//d0K2yp3QtFtaK8rLDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lrRhecRm; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lrRhecRm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=VrXefL6gnsCtvTeyrRria384e5dDUjC4pOM6H2E0mPk=; b=lrRhecRmKUg7Z4VcOxCIlOQ7Ex
	1rAEP1V9G3R1CynfOVmJd2aAzoJgxuS4xvlPXVmDbsO5CZm9/VTPjy80K5eQlxfgyNHPu1QdBpJbL
	81Kpluv1IefXgI5xdebYM0EUQUYO1oMzi93NpryVgVhMApzP7eMLZTETZlHjX1mWEG58PQq936Xg6
	3ZS30dDcgeFF98v9oNHTeJmLMTABR1D/nvOrx8OF2tdMR8yI3Uv/F3wTV6WAE5v0MF3IzrR/1eSbt
	vR4Lf+M9DIm/fh2ITzBfSxKB3cx7X4dlYtkfvJCVtvt7TzDAK10ot8AlADA8DGRwtXBrtfbZMe8NE
	mf6tuWGw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xBXY0-0004BT-0U;
	Tue, 29 Sep 2026 15:07:04 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xBXY0-000Ju9-0S;
	Tue, 29 Sep 2026 15:07:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] drm/bridge: tc358767: register DP aux bus even in DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Date: Tue, 29 Sep 2026 15:07:00 +0200
Message-ID: <20260929130701.1029644-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28138/Tue Sep 29 08:26:15 2026)

Even if DRM_BRIDGE_ATTACH_NO_CONNECTOR is set the DP aux bus has to be
registered. Move the flags check after registration.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Drop other patches. With commit b6829ee511c77 ("drm/bridge: tc358767: don't
  create a panel_bridge") in linux-next the other patches are no longer
  necessary.

 drivers/gpu/drm/bridge/tc358767.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 51f4baa62a53e..9b8d3d3ceb8c8 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1831,14 +1831,14 @@ static int tc_edp_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return 0;
-
 	tc->aux.drm_dev = drm;
 	ret = drm_dp_aux_register(&tc->aux);
 	if (ret < 0)
 		return ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	/* Create DP/eDP connector */
 	drm_connector_helper_add(&tc->connector, &tc_connector_helper_funcs);
 	ret = drm_connector_init(drm, &tc->connector, &tc_connector_funcs, tc->bridge.type);
-- 
2.55.0

