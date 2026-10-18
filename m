Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E4498E0A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326727; cv=none; b=byP3vSed1gX64rOgv/oQHJQ7NTEIgeopI3TqKy2D92v4oJwoGeB26wTzhN+cxrCB/ILsyyh5r3PdJ2rNFSMWX2K8/6AcouEjMPZSQ3fM7om60kBVD7+9JOZPzkFLyoJr1YBzqy8ZluOodhJz0gMghiIsPM7aJzPf+MNOMLyUZoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326727; c=relaxed/simple;
	bh=sTvwfobd69grKzlHxq4/6OKAk3Hsa2Jl+SuKHFRpz2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U/6eoF1XSX/se+ZmWkNMC6aUwDhZq+QkqEDvz3HDhdMZri84tFDktQuFmfS2rpEKNQdZLtNkoiFqn+C5l/+S6Aa3VVIt0gmZd2Ky8AHRx+t4aj1MoD+12jflzzlSDwM7RBy4rOl7zLDb1hENsq7yH967bGFvru+nIXUQz/uBIkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b=BnRZr8sx; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b="BnRZr8sx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1792326705; x=1792931505; i=jan.claussen10@web.de;
	bh=G4nmuM+bqcOQtIPOY3msxgjT9MI21X16wTT14DXaYjs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BnRZr8sxUEqoEvOkhXciZUb4dN74vwEuThhuo9vR9ufTGwGJU1rWS06zWcUYX6qZ
	 OhYqmaFYQb5Q6mdpM/EUraV7Empul1QGcImR3LjqLhhyVICx7U0grRhMM5fVnEkND
	 vbXQGt8z3tk9uReWnCd8bvHlXsCJCIIIXa32+29beiKiNqTTo2RraPD5xMGn4hYl7
	 D9LmivkuY2eRj7b4ZSnaErlzO9v/p8dHp/NmgebtYc1P1Vs/Axd5AumO6BV6gUhc2
	 wMLS47mheCD55umbZlwMsIRblJIQgXk+5+JObNL/ZAYfx13xkOvURyEWsMNKPOHMQ
	 nd3yUW/qrPxcBKDCIQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVJNd-1x9NVm2EHX-00SRZ7; Sun, 18
 Oct 2026 14:31:45 +0200
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
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
Cc: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] drm/bridge-connector: Pass supported colorspaces to the HDMI helpers
Date: Sun, 18 Oct 2026 14:30:14 +0200
Message-ID: <20261018123037.19560-5-jan.claussen10@web.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018123037.19560-1-jan.claussen10@web.de>
References: <20261018123037.19560-1-jan.claussen10@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rRMv3jNi4cbhj7PNEOZaWkHW8+2/NOX1/hB1Umtd8n6WDF01+uu
 jwWXTDgatj+kj66DvKjgUxUBtkSFlSdMmeyiu34zZARYtdxNHROagUVsWAnajriV0YV9ysi
 anBlwFxhxukZRd+kKRZ7+W7t5z7Rh57+NSCDJ6z7kxlKKYc7BDBny8gkLfhJJnd8p5r2mUD
 k6f+wjDfNUI1DUd/EH1sQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zXk4fQw8MzI=;arYtG5aSSGwUxPbrBLiLDN5rn9X
 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

Add a supported_colorspaces field to struct drm_bridge so HDMI bridges
can declare the colorimetries they support, and pass it on to
drmm_connector_hdmi_init() so the colorspace property gets created.

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 ++++
 include/drm/drm_bridge.h                       | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/=
drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..40f50304c46f 100644
=2D-- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1042,6 +1042,10 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
 			bridge_connector->hdmi_funcs.supported_formats =3D
 				bridge_connector->bridge_hdmi->supported_formats;
=20
+		if (bridge_connector->bridge_hdmi->supported_colorspaces)
+			bridge_connector->hdmi_funcs.supported_colorspaces =3D
+				bridge_connector->bridge_hdmi->supported_colorspaces;
+
 		if (!connector->ycbcr_420_allowed)
 			bridge_connector->hdmi_funcs.supported_formats &=3D
 				~BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..b46d34040024 100644
=2D-- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1129,6 +1129,13 @@ struct drm_bridge {
 	 */
 	unsigned int supported_formats;
=20
+	/**
+	 * @supported_colorspaces: Bitmask of &enum drm_colorspace listing
+	 * supported color spaces. This is only relevant if @DRM_BRIDGE_OP_HDMI
+	 * is set.
+	 */
+	unsigned int supported_colorspaces;
+
 	/**
 	 * @max_tmds_char_rate: Maximum TMDS character rate, in Hz, the HDMI
 	 * bridge supports. A value of 0 means the core should use the default
=2D-=20
2.56.0

