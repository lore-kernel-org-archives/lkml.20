Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711757;
	b=kKyFnj0fv6QvZVh70Ak88M3LFr3P3e3xKs4ESQ7zGwgyZ0tbTCEVH2yBSqYaBVgs/Zvd
	 8CDr+mwC9rEa224BWUtQPjSA+vvZbYo0ArqL7r41pmX2VlbqxS7hOATpzSYehcK38f1yx
	 51A9Imy2SuQ0DHdH7/nDkQoOKqE8y/XnFISeeWn0+XpuvXjFgCbM6v0rQumPIKhoWw2p2
	 vY9oug3LQFhxYoFAFV5HuhB2pyvC3ctF9jALQ4cOx7bdnZwVjsrv6OOA7+M4oBdQc4AVb
	 tQ2brhCfbT253UJfZITbZRBwJ/QPJoF9FWn35chRTlBs8+KUXC4HFgFwXEO2CMW1Dcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=BWdEPnHy9dZO7NwE6/7/FedykeHo/CmP2F0AQ+vkyQM=;
	b=lcYvnIy3pzgGl6ULlMmq8KzyktAsrLerLfOT/sPCh1v3xSPckN5vwRlBuMLaRWhjtO0B
	 n8GbnV241/P0vORKs4QyROYgDoXAFUA6u6guqDnrC93HQj8lfRpDmv7TDcy/WuVPnsl7v
	 qRRfzxqE2EmckcTbdXbJ2XXJKSuawQZTG+aQehSEAEY3grmjiVrJUfz4IxLtV+BzQQmrB
	 +GmhYpxTb2FgmwRAIsLio1y/LykWnjY8kf2mHUPTZfRHVXYEnC/RjZ4eauwnEhV3usjIG
	 5uWW2PBLdgr3cZNODxmVOkXid7dAozAKHD25mKWpWQ2NLyBJK7Z47yYLq1yb4nTmldg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JD9hI6Ri;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170EE606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170EE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JD9hI6Ri
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7001925e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793711754; x=1794316554; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BWdEPnHy9dZO7NwE6/7/FedykeHo/CmP2F0AQ+vkyQM=;
        b=JD9hI6Ripgap8df4Cb4NutOcdUOHIUxZNM2vazmqOK6QRD5I3L/w837qoapEHlPOie
         ky3hg4x2B4E89YYKBhU953cRSWPfHcXjfv4yc/K1O/hzMhBdtlarm762p5PA8tu/jCVN
         qHzsnJW/yjPVbCBKVFZ2nUTdg9rVzXQ9pYFWrnk6naJ3fMqCZlmaEpJhsHL8rZBYCteh
         PGpGAZ3yU8ndQcfVcnecxUydScdX9Ts5EaZfD/u98iRnviFnczKAVVJ9Ts/LDUBkms9T
         wV9lOpgMdpdMffbD3j1zS5Wh3Q3/NWgMm2DOqNYreOzsXZvSn5lguOy81FuJqEzwMa3l
         XePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711754; x=1794316554;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BWdEPnHy9dZO7NwE6/7/FedykeHo/CmP2F0AQ+vkyQM=;
        b=taWgp2TL9wiJEPztQ4kEjdklR2nbvPZFz3sbKe4PrJH1tErxOrZlYz6BCwZnX0nVxU
         2YSTeK7Vq7goD4Luq7T/Fl5jLPQTp/iylrz5v9qACAvMPSVsswmzJr5r7cCol34fuwBc
         rGg3yERKsel9HXmpCaUEieRX1pXDll3OlYNS0hmI1xsfsjohfjXCC6Tq7jFmWou3MwEa
         ZUJ3dHaCTvX/GmGHHxYtkAULqSsAvAyddktoFLF2t2/u1P0e/XEGeIQ7dZ+iJQpQeAbJ
         UlYiccsAjB0pwdWr+DV4JBY2G9R6e/OzFY6+2JmxuCCwvY5Io0ueYoo24Q+OCB0A15E0
         8X/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwUVsdCZQlC0zfR5H1CxtsWqqMwOAtXZQyBaUsiPX/EPRlxYpXAoqdoK8YOnUxSiJC8fKfBjeqM89qwz7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Fne6IxDs7axnzJuWakcHiLl6VpEhm5S9yXrdHhrRdsxYhe3uI
	OBms+xCij9DD0fcVf/JfiYCuuVAN5BL8yRr5e+ZyeZV3arrXSk5pogKl+KyIVfi0MEgLk9wbnMY
	luf/6
X-Gm-Gg: AYBFou3hcrbglVWEF+nutCtQhKOIH1yROC48DZB69/5AuOIOvTlltHF41W1LAizysqM
	xmeNANyn+yk+rM2qaQAkc0RpOYc+wo977UvDfBM8EoLwZ8Y6ZUsn+VXmYSfkEa0q0igOMyF03jr
	Jv+8VfGZHIhAt325YRQUgzLpBIOlCl/jhwm5IyuvO3XI6+sCA7xIRfhHKpf7zi/4jeA6z5E9gjO
	PEqVtgBayZiUWGzkIN/5AFxPLj4Orx3Rth17vJk8EU9n7bXWT7zTMPC9YQrHORA4w7rGURFmVQA
	Ht2U46gdBuNWhUBlIqtOXS7iNfUKY/JVeot8eF0pIah3cAnuLDtWXisLv7RJ/AXVFGaNL5H3G30
	f+zC52lT2gFGIpxc1XTqZkuYHYD80XGAU41DED9NyZD4F6RizbvAtMCdAG2qGX/5a/vvEjEZN7g
	Qn6h4+UWeQ9jOgpB887yS8w0Mxl7tlLf5n7JATOn/iAolLamuWhjIgG8llFmvRog1J1z2oZvfgb
	lOOun+X0TEP1iNgEXPMlJ2rONH8wgA+gDB6X2C4vTxs1y8XhfKtzzDV1tKE0iSMx/Gmv+Pn1DkT
	QXELZ19TUUSBSuaEc6BUvzQX+Q==
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr300804355e9.14.1793711754256;
        Tue, 03 Nov 2026 05:15:54 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7700c3bsm302570825e9.0.2026.11.03.05.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:15:53 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Nov 2026 14:15:33 +0100
Subject: [PATCH] drm/tilcdc: Fix suspend/resume drvdata
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
Message-Id: <20261103-v7-4-topic-am335lpm-tilcdc-v1-1-b7f91f9c9a05@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAHTe6WoC/yXMSw6CMBAA0KuQWTtJhwokXMW4aIdRhvBp2kpMC
 He36vJt3gFJokqCvjogyq5Jt7WALhXw6NanoA7FUJu6JTIW9w6vmLegjG6xtpnDgllnHhgtGSf
 cNcaThxKEKA99//Lb/e/08pNw/o5wnh/uGgtCfgAAAA==
X-Change-ID: 20261103-v7-4-topic-am335lpm-tilcdc-310aec750b1b
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, stable@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=msp@baylibre.com;
 h=from:subject:message-id; bh=83Ua03s8JK3zkD/3szPivy67tq5SBAM04PktMYX0mbY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyX9xqFJ7iX3VgVUBV8RdD3RAGDhS5/5rsnW2t//K2za
 Q8N063uKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgIlYbmP4H/GoRuDCwnfbfqx/
 qN1ovHxFEM+kH94x39Jtfef67WDat5jhf9D5o9odOyWnav9+navh7sz4MelE8d/K6Zq3qlrvVtn
 EMAMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

drvdata contains a pointer to a struct tilcdc_drm_private and not a
pointer to a struct drm_device anymore.

Note that this breaks suspend/resume at the moment, it hangs on
acquiring a mutex.

Interpret drvdata correctly as struct tilcdc_drm_private as is done in
the rest of the driver.

Fixes: 3301302060da ("drm/tilcdc: Modernize driver initialization and cleanup paths")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 1d6c9a423a41..e82cb2686c5f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -235,7 +235,8 @@ static const struct drm_driver tilcdc_driver = {
 
 static int tilcdc_pm_suspend(struct device *dev)
 {
-	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct tilcdc_drm_private *priv = dev_get_drvdata(dev);
+	struct drm_device *ddev = &priv->ddev;
 	int ret = 0;
 
 	ret = drm_mode_config_helper_suspend(ddev);
@@ -248,7 +249,8 @@ static int tilcdc_pm_suspend(struct device *dev)
 
 static int tilcdc_pm_resume(struct device *dev)
 {
-	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct tilcdc_drm_private *priv = dev_get_drvdata(dev);
+	struct drm_device *ddev = &priv->ddev;
 
 	/* Select default pin state */
 	pinctrl_pm_select_default_state(dev);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-v7-4-topic-am335lpm-tilcdc-310aec750b1b

Best regards,
--  
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

