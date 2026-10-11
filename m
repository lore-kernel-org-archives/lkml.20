Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BB81A683D
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791724854; cv=none; b=AuJ8xJyVmynurnsy0kOiOMntoni7sk5ALcOwkPo+q1EA3DDe9h7K1MmpVA1mOXtSspXFY3sysIGGs01n0OXc/DqegvEVI4jmLeaCdWWo+NEKCPHSISfblzkFqou8hVU5PQiLijuVQcH1k2M/UGGL0AUa4Pru0cHZaQNBfLvW66s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791724854; c=relaxed/simple;
	bh=YNitzeI0r0UhkdNka2zV1oObkBNn8NQLuHmKLZkolh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jGd9BQEB+z31W79ydui4rqohjLcgSFiOdDFVtBBzzsb6UVx7i+ZHjMsRZ5SNamQG+KULP7GP9+tc5UknUz+f3lFno+0ZpzZZ516Qc/2/USwJwa9d1ayUAKBrZsYQw1IxWjRPLt8Kk/G5SpFm3lylrpyUqazRZ7iWtIWtMyHCb18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b=R0xcj0JY; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b="R0xcj0JY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1791724837; x=1792329637; i=jan.claussen10@web.de;
	bh=OsfRzlfLd2pab3xVhjWOrZ//msUrGzfPbFTml90VrYQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=R0xcj0JYLCW/yx7ma0fRiX56sQXdTPElTyeNDnwnEeJsjj1Bw4cOdB7fUS/fOu30
	 3OeLqqKV03VHbyd06vz/YveFFSnZlRNV6zxKiAG83JfY5EKIzr5aChiZi5KyroMhE
	 wAUfsI637HpjEGVS7xX4V0PJKKEqwjAPOmsiXP8xO/nOCSFqJZ1WLRRwPtj7A6D/p
	 CnzNjCqwr14CB3N5MSeWo42GiI9ZEeNY5e9xLtasfBpwm91/2XBgvOvNFonO3l+6W
	 JdB7sfvBI1B2x50vq9mz5u89eMvpSH10dDaezHJb9/sGUs4IgBmUn9kn/di9W4AdY
	 ZwpPTUa5KQrHoZWCzg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MSIJA-1x4zOP1XC4-00VDHC; Sun, 11
 Oct 2026 15:20:37 +0200
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
Subject: [PATCH RFC] drm/bridge: connector: Support the colorspace property for HDMI
Date: Sun, 11 Oct 2026 13:20:22 +0000
Message-ID: <20261011132024.2833-1-jan.claussen10@web.de>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qgBdaHqb99/+JiPkKvAXfwVsuVg8XSM1syfn6gD4yKQYAtX3itW
 FiftAzPPVPsPlkPLgloKUS3IFRW3b+6u7yaeBsFSj7GBO+1cZCv0+cxx7OxJGpgEpJBQMQQ
 VG0AwUwuvY0lxs96c1jBCXEp6v54zFvD8Ex6XKPoRciHho8Cm0fADVCoW15CooLFbY+o0TI
 OJcQeeiG21LIhaoRlK7gw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FpTI/JbWTKc=;i2JT9QTJObIHjPDsGfaADH+K5Kf
 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

Bridge connectors for HDMI do not expose the colorspace property,
so userspace cannot signal the colorimetry e.g. BT.2020 for HDR.
KWin requires the property before it offers the HDR toggle.

Attach the property for HDMI bridge connectors, next to the other HDMI
properties set up by drmm_connector_hdmi_init().

Force a modeset when the property changes so the new colorimetry
reaches the sink, as vc4 does in its connector atomic_check.

After toggling HDR on, modetest shows that the correct BT.2020 color
space is loaded. After toggling it off, it loads the default color space
again.

Tested in Plasma 6.7.5 on a Radxa Rock 5B (RK3588) with an LG OLED55B87LC.

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 .../gpu/drm/display/drm_bridge_connector.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/=
drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..0639fe094b10 100644
=2D-- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -412,6 +412,20 @@ drm_bridge_connector_mode_valid(struct drm_connector =
*connector,
 static int drm_bridge_connector_atomic_check(struct drm_connector *connec=
tor,
 					     struct drm_atomic_commit *state)
 {
+	struct drm_connector_state *old_state =3D
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_state =3D
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc_state *crtc_state;
+
+	if (old_state->colorspace !=3D new_state->colorspace) {
+		crtc_state =3D drm_atomic_get_crtc_state(state, new_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		crtc_state->mode_changed =3D true;
+	}
+
 	struct drm_bridge_connector *bridge_connector =3D
 		to_drm_bridge_connector(connector);
=20
@@ -1079,6 +1093,12 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
 					       connector_type, ddc);
 		if (ret)
 			return ERR_PTR(ret);
+
+		ret =3D drm_mode_create_hdmi_colorspace_property(connector, 0);
+		if (ret)
+			return ERR_PTR(ret);
+
+		drm_connector_attach_colorspace_property(connector);
 	} else {
 		ret =3D drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
=2D-=20

Hi,

after testing the patch in the link below,

https://patchew.org/linux/20260805153416.8459-1-royalnet026@gmail.com/

which attaches the bridge connector inside the bind function of the
Rockchip QP driver glue code, I realized that the colors looked washed out=
,
when the HDR mode was enabled in KDE Plasma. I found a supposed solution,
which was comparing the old and new colorspace enums of the connector stat=
e
in the drm_atomic_helper_connector_hdmi_check().

Before hastily sending the patch, I consulted maintainers in the #dri-deve=
l
channel and Javier pointed out that the attachment of the colorspace shoul=
d
not be done in the glue code of the Rockchip driver since it merely uses t=
he
DRM bridge framework. Furthermore he said the modeset force should not be =
done
drm_atomic_helper_connector_hdmi_check(), since it was meant to only check
conn_state->hdmi, which the colorspace doesn't belong to. He suggested to
rather implement them in the drm_bridge_connector_atomic_check() and
drm_bridge_connector_init() respectively. This is what patch does.

This is my first patch to the upstream kernel, so I am sending it as RFC.
I found the solution with the assistance of AI tools, but I do have a basi=
c
understanding of the kernel's driver model and API. While I made sure to
carefully read the rules on how to do this correctly, I probably still
haven't done everything right. I am happy to make further changes if neces=
sary.=20

If this is however done correctly, it should probably supersede the patch
mentioned above.

Best regards,
Jan

2.56.0

