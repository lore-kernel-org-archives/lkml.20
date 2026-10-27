Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097245;
	b=B3iCbJfiIiCfiSHzsg5bXt0U9CTeJkULAG2Vgrm756kdpkViY1reN0ao77uD6dx9Wzxx
	 ejOs5RYz38lIah0655m/V9d4g2+mirfrLFDwNlDEmPBVEVO/q8vj1kuVCXuM57SGYt4qA
	 fOltGask+mN8nbwulU0wcdZi2cz7+K9+3WiCtXnaJiuvVE5ad7XEQ1uWBEUxOjj2Um8aD
	 ZL8wMfyj8IL09wHrq/GdIya4g92cCs87LuElaeOrzv/u2XMsDUBgh8Ft374aoq5wYpABE
	 v4NXwCayC+Y5DtsvA5UZY6mlJ2mG0S6YmSsqbqOciIhYgUrT2LX1RVrNFZf3SZcbEgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097245;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/sVy401gR2AeEzGop8THwUPTGkzUpgq7Tv+MYP33ejY=;
	b=FjdgiVggIdIdMOkSQk33+shBVHDFsoP15smAcFipnvutnWDet13l4kUg1FlQRTUTtfAa
	 wI7jVBJ36Cw4qKnUYOg7lxgH20cJUkpYsH0k5HyPpoFBLyBgXnCX2dr+7x4FZeD8NYTLV
	 Oq0KcVajLh2CMCWX0e0xDtmRPQv4xn+ysIdDa4tYeAseIRG/gEZJlgRwtS+zKZuNqifhg
	 l245cl3iCcfqaXpQSfSDf+7q8Hvc2nKY7sJAY4jAs68ZW+Qgn82apZZCJxRcxsMsZk25O
	 ZexC6PF1xx0BGfjy1iLhZVZ8msdE/ZTwOI7gGIaH1DKgSGF600ULY+bhd08rOiUdJXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=geanix.com;
	spf=pass smtp.mailfrom=geanix.com;
	dkim=pass header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=protonmail header.b=ccphCd2b;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2157C606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2157C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=protonmail header.b=ccphCd2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793097242; x=1793356442;
	bh=/sVy401gR2AeEzGop8THwUPTGkzUpgq7Tv+MYP33ejY=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ccphCd2bFbwuXaYq8iH1YhXtQ20TEAxITPlm7Up0peJw1tjrBudAeMsmU98rV5TBq
	 iOUHZvT0CcOpcU2JT+5UG5/3EQAgwGOeNxxMrUK/j/naz+RLXlxQperInK70bgZbtc
	 dgeRNM5cjObA9gl6uTiILuCTOfa0ka3fwD+Wu5VyxpBPEvO6Alb+njx1Afk6GZdc7J
	 JJGtbfyhWtUDn/Bo1W/PRtCAp+Oc904lKniis6ZU/d5rEoicq7sfJq/JdPcnmSP21N
	 Y+OkEL3qXzPWW6epwjyRcz6G75y8Bpl6tlUwPSncWO1QGFxU6X0UvEiOrVL49E7fiL
	 6beMk1B/NLPsA==
X-Pm-Submission-Id: 4jDRgB1x3vz1DDWq
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v5 0/4] drm/bridge: nwl-dsi: Various fixes
Date: Tue, 27 Oct 2026 11:33:48 +0100
Message-Id: <20261027-nwl-dsi-fixes-v5-0-b6d1d3d2d356@geanix.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQW7CMBAF0Ksgr+tqZpw4dlfcA7GY2AO4apMqh
 pQK5e51YAEl6vJr/vtzUVmGJFm9rS5qkDHl1Hcl1C8rFQ7c7UWnWLIiIAsNgu6+P3TMSe/SWbI
 OWLkWOLbW1aqYr0Guh0I221vOp/ZdwnEemRuHlI/98HN9OOLc+297RA3aUxM9OnaW43ov3KXza
 +g/1Tw+0p07MM+cCkcHnoFDVZvdgpsHvvxuCqfaRvbRNiS44NUDN/jMq8ItE2NoyXiEP3yapl+
 r4ut8egEAAA==
X-Change-ID: 20260710-nwl-dsi-fixes-c148b0adb685
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Fabio Estevam <festevam@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Sam Ravnborg <sam@ravnborg.org>, imx@lists.linux.dev
Cc: Esben Haabendal <esben@geanix.com>, Frank.Li@kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 "Oliver F. Brown" <oliver.brown@oss.nxp.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793097237; l=3107;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=m0BPHe2DqHEKhL89dJjDFmUw11rDNI6REaVlOvyHss8=;
 b=aRY/BQFfU0aZSQufqd1D0E2EWNHAJ0nioO/HoN49yU6Elm6cH60p3M2nXElEqY5H7NumOh5bg
 IK5Rao5amWUBVEwWJASKJIjq0PnQ2W0Yh1Q7pyGzFq+4uKKqPhRlAYx
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

This series brings a few patches fixing horizontal sync timing, EOTP packet
behavior and hsync/vsync polarity selection when using DCSS endpoint, as
well as a small fix to properly handle if/when nwl_dsi_mode_set() fails.

The 3rd commit ("Correct auto-insert EOTP behavior") is taken directly from
NXP vendor tree, so I have kept Author unchanged, although I have modified
the commit message. Let me know if I should change Author for that.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Changes in v5:
- Add fixes tag.
- Sort header files alphabetically.
- Fixed speling mistake.
- Link to v4: https://patch.msgid.link/20260831-nwl-dsi-fixes-v4-0-6a2a1cb23910@geanix.com

Changes in v4:
- Change calculation of hfp/hbp/hsa to use the raw clock rates directly to
  eliminate intermediate rounding errors.
- Drop patch 4 (will be included in follow-up patch series, together with
  a patch addressing the unblanced resource teardown and PM runtime
  underflow problems in the error path).
- Link to v3: https://patch.msgid.link/20260810-nwl-dsi-fixes-v3-0-256da9d672e1@geanix.com

Changes in v3:
- Added Fixes and Cc: stable tags.
- Split patch 1 into two, with change of endpoint mux control in a separate
  patch.
- Fixed mux_control_try_select() state argument.
- Link to v2: https://patch.msgid.link/20260803-nwl-dsi-fixes-v2-0-1809a0ac453f@geanix.com

Changes in v2:
- Added safeguard against small horizontal sync timings, protecting against
  division by zero and integer underflow.
- Added error handling of nwl_dsi_mode_set() call.
- Link to v1: https://patch.msgid.link/20260710-nwl-dsi-fixes-v1-0-927d918a86ad@geanix.com

To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Guido Günther <agx@sigxcpu.org>
To: Fabio Estevam <festevam@gmail.com>
To: Robert Chiras <robert.chiras@nxp.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: imx@lists.linux.dev
Cc: Frank.Li@kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

---
Esben Haabendal (3):
      drm/bridge: nwl-dsi: Cleanup endpoint mux control selection
      drm/bridge: nwl-dsi: Limit LCDIF specific sync override
      drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing

Robert Chiras (1):
      drm/bridge: nwl-dsi: Correct auto-insert EOTP behavior

 drivers/gpu/drm/bridge/nwl-dsi.c | 87 ++++++++++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 13 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260710-nwl-dsi-fixes-c148b0adb685

Best regards,
--  
Esben Haabendal <esben@geanix.com>

