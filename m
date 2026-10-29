Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269155;
	b=RsINXk1Fc34usHAO4i54VwngfzL0ALaDpHXidI7Az+Q25cRut9j30kdEx50x3JQfiffO
	 RVkbmAZ755VkcNEAAmGLjr5EQPh4J4ilVzoanyrvrBp0iBSi5Pg08MjhGAu5/Xs/XZ1h7
	 DbMKNCv1/vyt6FxumhwWYKa0qWABkfn2T5v7gZJLednSwvLv5V2WwFoRidoOf5I9HHlPg
	 t2ewTBZvaV7DC8cC7Wssi+dax7bDdxvfiB0XyRiHIYHW1CYyQhmPxUU209uy20IfpK/LB
	 hmOye6VgJJ2JlfvxZklUPnb26kktj5pGhn0ZS6t3PXE70yIsZcSQbNHL2+ixjZGwR2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269155;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wi22ZUlQhK6uLRjmKgHQVyO5nztOuEF+4DU2hP7IztM=;
	b=KcOpRM6Bo2NyIJHz5VZM242b+O0ZfbR7tUFAI3Wu6n5OVLYW8EMin1BWybj4ae7RblHD
	 u4Cy4+gxpsuBe2tm/1hCUfs65T70QtI7mC/FFvE0syP8e9RRVMCQ+BusmHe7652fVaGMx
	 7/d1WPWCDj5tH1sy5vL54+O0p00MAOx9WT9XlWz66DxZfSYmOsG65JLGV9Uk2ecqD5Jdm
	 3djy93Cd4xtN6G4XaFDaEzGuBU6J30X4dwXw8hLiPGKNw6i5NNvbhcmYQ5S887quoYqxF
	 0rcJHUEv4fQ02t0yV/2SuT5dwRR7J+qoMq8vQ9tfCI9qsbcY0hYJXbNwvqKub9ksDHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PjBK1IWl;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B29606A32C;
	Thu, 29 Oct 2026 10:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B29606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PjBK1IWl
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3C83929;
	Thu, 29 Oct 2026 11:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269018;
	bh=YhUarWvkFmo5BAU7y6W2c0/rlDRAPf7YwZkgeidtnY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PjBK1IWlqxPl565SY8k/Fk6uWiGjuOHjYOxbz8dQNajdIJy1qOQMghOyvrSP1SjD8
	 aH6MWMdQlwcL+HXuH7fv38pwh6uQkPDvwgQAgwh/JSOUcWzOGjJqYa5hhwO46qywVT
	 XMZd9J5TYRAXaQWiA2Hmigxn3ZF5LYUzjVc0kxo0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:49 +0200
Subject: [PATCH v4 03/14] drm/tidss: Stop using vp_bus_type for directly
 connected panels
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
Message-Id: <20261029-beagley-ai-display-v4-3-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=YhUarWvkFmo5BAU7y6W2c0/rlDRAPf7YwZkgeidtnY0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2WAngQ2+yyxc+nNGt0VaMvb+tX9kwxHQ4m7
 6QU5zeNBdmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdlgAKCRD6PaqMvJYe
 9ZUbEACczkH4P+K0PGpZmASXOjmy5o8O68zj7a6M5err0YVTSGPXA+tq8V2B25nnliuigC4Dn1E
 u8Zfez5MdSd9wJg8T46y0uTaMz6M8+M4RtCBIZDDAxOSEIaE96KUkUEH+UBjsGCv4+HEtEZSXUO
 qlppx04cTv0FOVNzf6+sFrJKbDCaGrNtKYUJDy5R8tlMBhUcQfiFyhEP78WZ1E/IOwwKApEGw9e
 oD++x9/CD46C4qS4sbwWZE9jxPTAkjXeUHIBRZkVeFkS70sfJWJmUroRHTYSTyZiiZPRmPpFheH
 nhQXt34mv8RuR3/8E2r70IoFhVgOxHgtM+4fenTa/+a0U1qgNyGaroH/dZkYVF6C9BfWPuHCN0C
 WACYj53lAyvUY3nYqRiO5xhy1FjiYNsUgE9wg1mJ6MpKEeudbpNiA42ezr7keh1cZvJfZ9/XsSa
 QwUtPGTTZsbZErs/4xQ30tDh5sWUfVv7kxAcg16AWncKu9ZuGnKBQK6TsUQ9u1Qxyh9qPn+amM3
 lGFlEPgQX9mGWAv3I00EtU3lqfQt7VQk8EvEu5BptpkUJsgRYXApLSGhZIw97P4DJisNYIy6RQF
 Z6GXvyqLbF/mDrl0judW/UF6x7ZrtzIVzrsySFJ0D/raPKpfvb6g5aFKe46Fpj2nNQF97u/QJ5y
 ASrP7p7hHOKEfRQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When a panel is connected directly to a video port,
tidss_dispc_modeset_init() sets the encoder and connector types using
the 'vp_bus_type' feat. DISPC_VP_DPI selects DPI and DISPC_VP_OLDI_AM65X
selects LVDS. Any other type triggers a WARN and fails the probe.

vp_bus_type is problematic and is going to be removed. Change
tidss_dispc_modeset_init() to use dispc_vp_is_am65x_oldi() for detecting
the OLDI case, and default to DPI.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index e55e7532e2f7..8b9c5fa96e47 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -232,19 +232,12 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 			dev_dbg(dev, "Setting up panel for port %d\n", i);
 
-			switch (feat->vp_bus_type[i]) {
-			case DISPC_VP_OLDI_AM65X:
+			if (dispc_vp_is_am65x_oldi(feat, i)) {
 				enc_type = DRM_MODE_ENCODER_LVDS;
 				conn_type = DRM_MODE_CONNECTOR_LVDS;
-				break;
-			case DISPC_VP_DPI:
+			} else {
 				enc_type = DRM_MODE_ENCODER_DPI;
 				conn_type = DRM_MODE_CONNECTOR_DPI;
-				break;
-			default:
-				WARN_ON(1);
-				ret = -EINVAL;
-				goto put_panel;
 			}
 
 			if (panel->connector_type != conn_type) {

-- 
2.43.0

