Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687149;
	b=DdYzE770aYD3dAJGumt4dzPs+lpWX9ItUW8QMvrqUliUBwR1cI5vWyGQw3wdmfDs/cEt
	 yXb5IATvLaDSWGmJopTY0Z6oHcN4y7Ot7XztgSZ69aLY/cdZvEmKjLTHjRMm8UudVGbNg
	 RmK3CLNjzDjYlrq25Arc5JRphnLw9fNBjwMXWrJVzbBTtVn5SxTbXNDiF0O+zJuuXWBTH
	 dLb2ruhKcyFJ8XFyXmp3DAufDpgum3OHQ1CckoRnbX6x1sOp3gDLBpwCpkOVCjD04PN58
	 MZnyc2bFa+zXhOWHNvvDJ/wbA75qRNeST8PywVq2/2+AlGOy4O7B195QAEcX6qm6/eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687149;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=txjk6h2eBJ7yoCPY4RxTRfMgnDBsm+i10abL0Ow5+a4=;
	b=gRhzOCHik75IEx96qHZqPGDbBmn57df6OebRSX4M4z43ecYDLIDCpmSgg/vBcTetzGie
	 C+hcssDq/xp+JGLlsjTX4gzAmEMHSSF69J4Q92AgeFcdKHnyfh9VILDn4qUqCHdBCQZo1
	 rexbkii3An/pQErpzbYigu59XTp9vt6MulY3CQbygDfMUVwZfe8dYqu2Plr6VQkSpn0IM
	 yELxPqgrdP5A0Eubr9ss3flBYI8+JMVKfFDsiajbnky4hVDgGSMC1nQHonnrRzyEVmxxa
	 L9tkpUZ6s6gjmQQ8Nr197xGlBo4WM5GpPbICquGtWbt6uLBxEONXp69epKDMeEy0BwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PuvjdE57;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6B6606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6B6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PuvjdE57
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 324211A12C9;
	Thu, 22 Oct 2026 16:39:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F193A60763;
	Thu, 22 Oct 2026 16:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9869610328F2E;
	Thu, 22 Oct 2026 18:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792687140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=txjk6h2eBJ7yoCPY4RxTRfMgnDBsm+i10abL0Ow5+a4=;
	b=PuvjdE574Jn40NcGL4mcOP9E2mmxzxfbJv6nhPRPLfRgEzQs2d/lD8gN80C5RXeMCiFGkj
	nEXMVkh1UnMTGCitUiQfAC9fEjrpKbXYXnLWpirvuD43BpSTY2Tz7A4iKZK+1yAGVVmBjo
	OAgd9dMlptVhoi1vIg3EOD95UjMxPq/XdIoSmzPo+HvnmXLSUXGApBXA+SKdakOwBu+wpr
	zGevowIvQOanSW0/bhdqBz0ne2GNind09DQlJ7xEjdtBKeBDbL5wa3wby0M9ml7pmDDjYU
	7HtGALciOLdBKD0gVqj6dYJTLboBasXc7SiNMlJCo0X2yiWAVeF1Km+VADhqzQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 22 Oct 2026 18:38:00 +0200
Subject: [PATCH v4 4/8] drm/i915/display/dp: Read DPCD DSC capabilities in
 any case
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-feat_link_cap-v4-4-a4f3f6e8cad9@bootlin.com>
References: <20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com>
In-Reply-To: <20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com>
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
index 89d4b3d348fa8..bbd76c0ff04b6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4473,12 +4473,7 @@ static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *
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

