Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792935497;
	b=2llrFVokAji3gVVx18oiJNKlHH7G3BPAKJNlHklCWcZ80tWYgnkoBTCVvG4Bwf8AxYnw
	 YlB4vmN1lCySHaOjzhHe11s/Bdjftl8Hnlr9Jrbbovo/2nnCpMB7tTVqXDaO3dfaSaCxR
	 PtPkYiLsmu44Rt/w5GkyiqOzo/uNPqEHwMlgVWnt6NOdbQ7WyksYv9yW1RP6sWOgwy43a
	 rSwFN7EhHRiyMhlqzHgSmQ5ctMHpe3WlQpwaffOPJXDnS+9FYkFDJWmyEmXQWum9qx98k
	 v8N6U9MSiTxriZgQcvr52tnbP7rKEWUxZOG4pPjnOlvJ26mRcqQOtgjtRJl5Jfa7+aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792935497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oThZuqK7w1i+OXOYJkEjXQGANLykMD/PqGXxTtL3rmE=;
	b=PyT7iubtxRiFAJ8pEasKUTLCj2XndIIuqvy02cpTj52Nqvi48FUQ3rHUZQNkr+u6lTia
	 WFYA3fSVUSBd+9UlKrgaKj97EP43EphPHGFaGisDaYrNmg1wM3p2PHajeVvCuzpwVt3RX
	 IcVRB+QIfToKT2GD6EZF39MjxKy4SdbJ182AmNONfMnWI0dl4Q+6G42iIWe2/5drijAe9
	 RFupoyuqzxgZDz0qppqhZguQ8A1+d3rqurTxLW2hxSQyNNus9YNT7yEQzNnj7F/c+nRB1
	 Tme4W34uM397aLufvBBJsDdVBzdfpRbnyIl6BgYR/hNGOfDmZ5IbRqHNqjX9ROo8ntg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFo2ijfE;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A184606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A184606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFo2ijfE
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c34bff61551so305801366b.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792935495; x=1793540295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oThZuqK7w1i+OXOYJkEjXQGANLykMD/PqGXxTtL3rmE=;
        b=nFo2ijfEJDY4S3kbiuq9FlOMhEd6THCfm/TDWDnPJcLnbX6Mv+WDov+G8E5GmSYiln
         JA8T6MxhMgHtZXZ41ZXN5YvralZTz23NKqT1o5GNbz8xgJBm0mxAcotyMk2+F92IULLr
         7mRlbSXU16s2iPwtQBRWLgc3yqH+eXGMWmCEZXqsig3uu8jc8f0bUN/t3agCD1iwvSPO
         2OVU6oTTLlUsPUQHYO51pIJnJPOJt2ZuRcAjATLwhmks1ulRzb6jx75/Vou8ZEFkppTS
         G4p+gq3dFdGGk3jbuWcg4p9aEMjmAHl+N74rxyGsVUqeznEC5y7uT221nZwOfIzEJuaH
         /EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792935495; x=1793540295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oThZuqK7w1i+OXOYJkEjXQGANLykMD/PqGXxTtL3rmE=;
        b=D3Yd5djM88rEfIwUhNxoIJaUb+OgwvEQ2/nycFHdFu941vYLQijt7L/S5Y0XdxS753
         JOD7JTMQlh5mBh/Tbqdc1kWWJY0JWJnj7XNUP3Fxs3KzZ9DUx1xUaEdahY2lwPgXRXY1
         L2ll+nPgjG6iF9MPtLtlA6RCoBKOTlVNantAk7wsk4Lp37N3aMFT+F7z0PtdU3khj109
         k1LfqoKkn//vcdLwBq+GgKZPXZ+xe9aieS6lTtiKb4YmV6EMkIoa07lb9LlEVgOGZb4I
         x3eitET8aeF/N72DSxYm8eH714zRfl6Opuh6jS/CVILhZGXPFt884U1gzi4vCFNt1RZp
         WLSw==
X-Forwarded-Encrypted: i=1; AKwUvBzvKbIXeFlq4Rp071kZq6BAqISMmp7s9YTx9T1neCgHhISu+kCirzKCviVGgA/Egb7ueUXB3bzD0jl5oZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdYKsRwTH2PsIk4zB0Cdcu5+dcTRdhRrGgCiwE+OWZ726YFfVu
	DnqSke3nq1oRafPlDQfKguRbQpE2ITHw0ynKAhw45E66+wH0/d4KYf3w
X-Gm-Gg: AYBFou3zsv3+iP2MsOwhCJ97fC/HNcl8NUhY1JtUfkIL2bToYoxrP2ug59A0wA/jjhN
	lbOHnmHRm+k2WMH32/Et7hAlENidUvimW/3saWhL3BPzMWcZzp/yG45EHHTtH3tpD+a03vlKyHi
	vohTuDAxxvzRcHf8U3pVTHGXme5ckZKp3hejys4hCTswfn34WU7cdxfM58DrFFueMVDPwAf6GJ3
	J+PUfyvyrf+3B4YT1TNnVBb0fytNtg8/WoUFzzOscpfCymebsthCIg/Rn3E5vno531Vj20h7pCe
	6mW/cXR+1kM/RptljWMq9eP3MLj7hbiSJWrVFBhENH5jzepFkyDtgf8hLU2q9e1J4Y8rIXPZU9E
	L7x+xi/NOC9KxiTgd8ZoeWlN3xuYMq+njfrWMIyqehBhQRt2Oo3p0E+AzwUJujDwhjgDW1GzEIp
	rLTCXhgu58qKbc8ZRHeiQNxqZMbDRXDUIDb4X03ZtFWzI54+A/LAeFwyJptbfQAjk2ulN9q0Lr/
	oqTdOIOQLS7/7Y2zzUIir/pxJjJkm5HbNeNZZ/ezvP87osVaLJ6o7FczzGNfvamPhyHEHR5YNEC
X-Received: by 2002:a17:907:9c05:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c46bdaf8c9bmr502296666b.4.1792935495107;
        Sun, 25 Oct 2026 06:38:15 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f874sm208114466b.9.2026.10.25.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:38:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
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
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/bridge: ssd2825: Fix panel enable sequence
Date: Sun, 25 Oct 2026 15:36:36 +0200
Message-ID: <20261025133636.253505-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, in the case of a single bridge and a single panel, the DRM
framework calls panel prepare() > bridge pre_enable() > bridge enable() >
panel enable(). While this is fine for most cases, the SSD2825 requires
the last two steps to be swapped. There is no meaningful way to achieve
this using standard bridge chain configuration, so the bridge previously
called panel_enable() directly at the end of its pre_enable() hook to
gain fine-grained control over the sequence.

Commit 554d36acf5e0 ("drm/bridge: ssd2825: don't create a panel_bridge")
removed this call, resulting in a regression where display output is
missing because the panel enable function is now called after the bridge
completes its configuration.

Since panels are now automatically wrapped into the bridge framework,
invoke the next bridge's atomic enable directly, similar to how panel
enabling was handled previously.

This restores panel support on the LG Optimus 4X HD (P880) and
Optimus Vu (P895).

Fixes: 554d36acf5e0 ("drm/bridge: ssd2825: don't create a panel_bridge")
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/bridge/ssd2825.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ssd2825.c b/drivers/gpu/drm/bridge/ssd2825.c
index 71877699dfab6..9216cee09115f 100644
--- a/drivers/gpu/drm/bridge/ssd2825.c
+++ b/drivers/gpu/drm/bridge/ssd2825.c
@@ -475,6 +475,7 @@ static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					     struct drm_atomic_commit *state)
 {
 	struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
+	struct drm_bridge *next_bridge = priv->output.bridge;
 	struct mipi_dsi_device *dsi_dev = priv->output.dev;
 	const struct drm_crtc_state *crtc_state;
 	const struct drm_display_mode *mode;
@@ -569,6 +570,14 @@ static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Initial DSI configuration register set */
 	ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
 	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
+
+	/*
+	 * The SSD2825 requires that the next bridge be enabled first;
+	 * otherwise, the SSD2825 cannot complete its configuration and
+	 * there will be no output.
+	 */
+	if (next_bridge->funcs && next_bridge->funcs->atomic_enable)
+		next_bridge->funcs->atomic_enable(next_bridge, state);
 }
 
 static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,
-- 
2.53.0

