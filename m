Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD2149A3A4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817923; cv=none; b=Ho0ocxy0RHL/qT1KVDR75g1aG0PDrCIRfhRQdGlCtearnTsGWSMnVni+/+pBNVBLJvY+TIeg9sj8O5ztbGZjHKXlaTclBkJUmcDMLR8GvudA02YqlkMutd0pPbHFBrJg0KpJddrbquME0hiaBWQFO5mILJRBaGkqw9DcHduaPVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817923; c=relaxed/simple;
	bh=orTo4aPhrV2VlttQaIrN5BhJMkj/kirIF/wgFa9bbN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwEq25IKUl8BMetSKLgwwwlVlohoNlR9H73dwsC9+13jcqqSms7RE9o4UP8ZHQjjt4J6sLGLCwUzDAotM91NwqlmjFrHLqSfFCcDtIeqQ9Bu3ZIqy2eLLpIoZ1967afluk5pCYrD8UkszHViTnhr5ARySHlrMEqNtzAy6xbYy1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G5ut7oNH; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G5ut7oNH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 96AB64E411FB;
	Mon, 12 Oct 2026 15:12:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C191601A6;
	Mon, 12 Oct 2026 15:12:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF73911D70C32;
	Mon, 12 Oct 2026 17:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791817917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WqTRuxy4JCbeUVmltZ7TumMmhfcU2SDhW7r+G3YaiPw=;
	b=G5ut7oNHjVKVIx50wI9DjoIKDf7EaY9AeJjHYHX0+KaBnubMvRVbjCIPJ8BuPVcKd85Ywr
	IakX/TO8DcCGyoVbrugimLOGUmJcZkx1xrxqaVbTr2F+fACcS9BCrDbkMKHDDPO4TghOyM
	rsnzbI528489igc5MNAC1DNLs3ylb/jzUvdifqWpqFgcO3dTZtej5lTKFRxgCawRmA0Y/S
	ji/K/pY2N7T++W/0koUKS68wV0m7mTifJPnefQn5DstO2JEFaOUABTmdvAP9TZadTDepIq
	cSHtd3plN3poUO/yX3y6FQW6WOq+ZBTUWuFGrX5HgY9CqMmB6B5/a0TcGnH4hQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 12 Oct 2026 17:10:59 +0200
Subject: [PATCH RFC v3 4/8] drm/i915/display/dp: Read DPCD DSC capabilities
 in any case
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-feat_link_cap-v3-4-7517f4aba0f3@bootlin.com>
References: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
In-Reply-To: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

In preparation for the support of reporting the sink capabilities we
need to read the DSC sink capabilities even if the source does not
support it.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Change in v3:
- New patch
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 830fe6eda17d7..b769723a1c0fd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4521,12 +4521,7 @@ static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *
 static void
 intel_dp_detect_dsc_caps(struct intel_dp *intel_dp, struct intel_connector *connector)
 {
-	struct intel_display *display = to_intel_display(intel_dp);
-
 	/* Read DP Sink DSC Cap DPCD regs for DP v1.4 */
-	if (!HAS_DSC(display))
-		return;
-
 	if (intel_dp_is_edp(intel_dp))
 		intel_edp_get_dsc_sink_cap(intel_dp->edp_dpcd[0],
 					   connector);

-- 
2.43.0

