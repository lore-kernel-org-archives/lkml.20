Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CD14519A6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872276; cv=none; b=B7FFWyN09xqvsyU8Y90KOGLGuCshpv2eXJfOW+UeuJMDZE4PllSBdzwfkUNBNgh1JHvq9zNdKqx8RnNkAY79jM0nUN8C6pB9SgssFZT3HWW2bqyYGgxQKNVR/0hUk4eqKscFulJeDZpDOQhvC3HhnWNSt9lVZ1UU0EEuHjNLP10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872276; c=relaxed/simple;
	bh=8Gx2IejKiSItovpAsvdS2iliqF3/TXaQvVVSmKwrLKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XstMgBd3arROQnRAQDvR6gjEWD+LSnaxwSEljzI0dcAow1JLs32FT3TTVNWHEEJi2jRHb7Gl78kky2hSmFB4bAOtWj1ZH6Fo87u5MSifWzNDNeEkvF8y/7bcGb9RXC2/8p2K4dfv+CLn5AgI3gZ/OudL6ooTGQ53/iykHlVGQ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gowebcq+; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gowebcq+"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-34e0b5014e8so638468eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872274; x=1791477074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWggAU8+PC/wTcVJIK/vivRWl2rgbBRA+Bk0A2t4p2k=;
        b=gowebcq+BIbx9l6D+qVa+QeazYak2TMj0I9rI4SKJnIs9IuOJDPQOAQX0GKyD91iWA
         7ancSqqcFJODYpjh0D2dTelB1wwPXkWnn6rhyEQJe3HNRypfcEQdEIATULniqmhLTB0f
         rOBsm/MOStXWue6W0bp6gFA+wAKyAD9KswOrYa9k9lMmSM7VBrXebjql1MNay4RvL21T
         ROQ1T5A/2k2wjbeknk4Din/m9PyDN5lc9f64QsVSjzQaRj3KRTYcEw9kNYTt2EctCC3h
         HoT0O8KIIBy1b2KbbN1T8n8Rck/M6xP5JWKmpL7G8iBEaYEAQHIkB7cg1j3XANfCNyGL
         VxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872274; x=1791477074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWggAU8+PC/wTcVJIK/vivRWl2rgbBRA+Bk0A2t4p2k=;
        b=Y/feMo3pvPmPLJvyyS+CyiFydk6ST8yKn9m5KnbtSWGby1/G1eQy7VcvgZLFHbNzTC
         uHOSUuhXp1evfuk6wsyJAO8IUMN+68m/S/5KISehOaAT1pCOpNp526v8LnsLzVV4MXq4
         S+O9A/dJM8vQKtipapkMv8pyS2NGjfbEqh4nlERYs6rErmghnwNExVZwBgArCLZF0sPB
         IR7TuORhN7HcPgtP39yJ7hYHFlgHGyTYMOKfSHei1kb0Uokf9S3pnw74LH3BHuruoHkX
         OmWGEh2R6DyVxnhVXSHu1gXRLa7d2zu5cI6UH3GorZpPe/9mFnMFkgl/l0wglGtJL3sD
         vLBA==
X-Forwarded-Encrypted: i=1; AKwUvBwSdvfkobGCvM9XwWfsD1vR1ubuQ8speXlYMkvmuv9njHxMod2sHqFSKIUN/BDXowd27AjEqUp7F8NYETI=@vger.kernel.org
X-Gm-Message-State: AFuF++mlkUCtXlNNqWmo6hwvBnA6MWybx7BcmNxqxyqmlX77IMueKpXk
	Pg/Zi2bM+eiUB5Qlli4Iq7u9UZ/dEVx9kr3SarMI7Ty7GiEz/CcRagxc
X-Gm-Gg: AYBFou3gKHKPT9kaIBSCDEJlLeglaIz2gk4cxNRehDWRUUtR+ImkKfAIJFVNs5KLr9a
	n7tTRYlyFhiPbWlkGo1K+lFNBhoXHnz9ioFbYX8NaW8UuOTC3SIPq/fk5gAqaRDs+K12SsQTobr
	HhHj0Wx8UQsVnUCHdHyoA3u6ZosSUhZbmrVFa8eh+d+f804gxU1+2C4Iw1wyzyagVxFVh69i6e9
	ZZrWD+bA85lXJN1HHn5ET2k6NPCJP3VneoraTqJpKN6wyLcAouBOP9NMqF6bDG0d+isBG2CuksE
	ge9MfsGSctUQHaZmf27daAQgl3LjkmMzqyi9cjKCReR62JkZrSF/d4jvd7ZuZ6pHa/X4tAyCXh/
	lRixauvuTzKtIKbSs5Jd17E6aAgfOH8uQwD/J2bW58tiuZBxm7Nm9hx/n/gIRMQufL+qFJJue8g
	pgHvjk6CZsWC/xcDFpK13ccChAaVYyW/Xhz8+Oe0Tuhsy4pUCJgTARC2TnL9WggHBqclpTEdGgf
	lPgw3VGcwULuBLvTGHYSa19c14E5ntWdZ8GbsfQPXCIOs2Vz3qB0pdXzgH/gMEUC6DK8bRY
X-Received: by 2002:a05:7301:550a:b0:34b:6f6c:2274 with SMTP id 5a478bee46e88-34db3a44f9bmr2819377eec.5.1790872273852;
        Thu, 01 Oct 2026 09:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:a4cd:e25d:fdef:4a3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34ef8de87casm21949eec.8.2026.10.01.09.31.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 09:31:13 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] drm/verisilicon: use ERR_CAST instead of ERR_PTR(PTR_ERR())
Date: Thu,  1 Oct 2026 22:00:53 +0530
Message-ID: <20261001163104.51165-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ERR_CAST says the same thing without the round trip through an error
code.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_bridge.c | 2 +-
 drivers/gpu/drm/verisilicon/vs_crtc.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index dc7c85b07..32f9984d8 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.c
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
@@ -322,7 +322,7 @@ struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
 	bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
 				       bridge_funcs);
 	if (IS_ERR(bridge))
-		return ERR_PTR(PTR_ERR(bridge));
+		return ERR_CAST(bridge);
 
 	bridge->crtc = crtc;
 	bridge->intf = intf;
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
index 0b8a35d09..af8e33c96 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc.c
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
@@ -172,7 +172,7 @@ struct vs_crtc *vs_crtc_init(struct drm_device *drm_dev, struct vs_dc *dc,
 	primary = vs_primary_plane_init(drm_dev, dc);
 	if (IS_ERR(primary)) {
 		drm_err(drm_dev, "Couldn't create the primary plane\n");
-		return ERR_PTR(PTR_ERR(primary));
+		return ERR_CAST(primary);
 	}
 
 	/* Create our cursor plane */
-- 
2.46.0

