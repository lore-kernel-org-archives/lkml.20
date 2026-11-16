Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831114;
	b=Kk63fxCGALNtNyjjVHDhQsdT+QyPkUzsKXvXbDyosjzgDzaCTQIoLjpyPPgtJlAKBFB5
	 25/qumigFcgXQ5tGQDVnOliHIheutD+UQG81J+eA0B8Ud1uZGjh6K5ZLb9ImjPCyoOzg5
	 10yLPO7/3+W3TIyMYFz/aefcyt59aN3AuBEG6aMyWN4sXv9OVSk651KM+2OztC6BtO4wQ
	 Qub2GaOs+AZM7fW0C/hcB4tbJ1ASRRIvkzibMlqZc8EfZLzreKk6T73YjERzrBXfoVpk4
	 ann65Di2o7iru7pMUZL7JdS6CtZ/tQQ3FAq9dQX2fIMp7IZE1Qh8t25vBBwd8L2Fi1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
	b=VJjujA1u1wzWdo3Gi9zLcvisLb9D22aWZ2NLCAIsK8dAr5MQHW5Ji7Kzg5ZX/DAiRrJl
	 QpTyQPQYgGOnurW9r7w6GKZF1Qv4veCwsI0fVjEW7IXmGyNgYXVEwnAIgn++4XOJl84Ad
	 46sCJhmzhDmmJvQfuwzu5WYMmD6vNM2ZYra8PRZQBDrpHYJYdBWx6onrMbGfwSlPVpYld
	 c9Lo1EtdplKZ42zLuMbWyB+d1NppahlHciHP8AsFQpEe/GjJRIMbyQRYFYbddhXIuL46V
	 4K+7Xnz1xLVFT/Zh4cA6YiYxOplduHidi8x9jybjHs/0Q8qFicL6KhrO09kOPYIDR4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q40GqGxB;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5B7606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5B7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q40GqGxB
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so41792345e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831113; x=1795435913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
        b=q40GqGxBY91fwja9SiTLKYD6GacL3GB3R7Jr4Hf1bn3XzfYIdPsNtJFtKfupT5VB46
         5fIXJZhYDxGpiWH3uLJkpzwjhembeQLZKpAYiq/ubhBS7pMXR+BJ3OcOACJEPE6i4Lzc
         CMPwvar1HAP7itOVoc/8REnDxrLkGsCWmlHtf2MrFbxcwzrlBurjsJWrZXT1miDQTx6w
         e99T3hRQDQwdQu6zzh2fgnLFhstPVma8QtRkk9hseXI3edbZ2RRxauCkVeYbSl7O4Tcf
         u8DFLa8nos+MfwxEIkIwo2QAJxxyLBF+8aRYXxkJ9Or4T+p+adBv4iqaC68DSHyqgOgI
         knrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831113; x=1795435913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mh+ToPltBb8mnDHqsdQlNCdlhh90EXZrqETmJQ+oo/w=;
        b=AyCqfoSpr106XFwHfP5Ye+cPoEMjOCmIwE4j5F30SVbiRDZQVTnRuTy4jK3VrkvZVQ
         g4gKhEiJgXLWuJ2cLA95wtThwb8mEZM9r3cV/SDml831FoYsuDsua6HuG/KP/IH08JT8
         mZbO03qFtfMae6bfLq/1i/Xo7ILuLVZHf+An/wWvK+RsnZL4RkoBWFX4zsEsgTfGr25e
         ZFQidaMtP+fwN7nxpU+mKt67hxyHJbDD/E6OXyswiR1iIxfoPNYwTjLH/mQJrtI2ZCKR
         xoxuZGUsyz5PuEC4R8VhhLIJmWv/2xFkwlQvdcB0ivYtCTAhqFRCg8NLAD1Zjn5ElcDN
         mcqw==
X-Forwarded-Encrypted: i=1; AL+hErEKkwX6W0gqQ0oGaqNWZokqlAgh9LynYWxbGh5T2aNa8Dx9ZpqqrkPtTXpZVGaIdeD/qsvwllGkqXmj5CY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z8JQLEi0KgK883CVmW/QyAJ0HtvPCw0kraARdlWY02W6Yz6wR
	4hLbSKiW1KrAhPVHpz5FNIZ144rAGO5mu63F2G74ONo4LUtuF4j9q30j
X-Gm-Gg: AYBFou0XYDkkqGGJW8XmN55Fp46KLSd2hNF5ZqYFlIEP/36ZrhPMwhBHkZzVVEnUcEB
	NN5S9wi/FHsOmqtqpQE4J2RcUH7qjfrMxPbruz+HCFiTgziHxoGKexWxs+KwDsPx5M2bKfqF1mL
	APOp6sYZuOYCmInRRLvbxOpHY0YGlFYWGl/kkrgnshpDVHQUXTCAX4uB5lz4aWL7n0KMCFsWFrO
	TDaJze8nLhvPwHGJ05KNMxZOl4eQyRrcdplkAsUaxssG8LTGPMQN7U2APWWs9nBak7OOZDo2DEV
	c5FGog/SjJ3t/+P6bk65uQkEX/OjuvaqYAooDN0MIYWY6ZmE3yhrNYSOgpRCVa1eCG3GR5+npOr
	T+7cj1OUP3UcKpRPc346dlENNlBQA3ZxrCDOAmbERCikiltsS/ETrwE8zf6nyu6kNBCm0G++gtf
	NORJRBu4AiuMNRZmMXWU1XYshLDeqf2cG2sV2Ycga44pmFpOUKTahjLPE4fSHXQL+YeoKf3KdAJ
	xE/NeiDO9io6JZbBecFYm7kGkwwFp9GCyDo1EB4fUmhlutUM0mxIbGHiaIzl47ZJZaJZL3QOyYr
	2jgwXmjfi+cCiGskuWCQx61kOMPlXW4YW/7YAj1kY3aGHkg/OKnd+4ggvCRiCoFru6VtmSKXu0G
	frtyBSAXhzM7b5JFSfprMWgqhTj1Sl+0sIzJgEkGtpya2gGUFdSqs4vgl7l/ZLYcfJKPMCz3+
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb69b2d82fmr91695095e9.25.1794831112818;
        Mon, 16 Nov 2026 04:11:52 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:52 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 16 Nov 2026 13:11:48 +0100
Subject: [PATCH 1/2] drm/panel-edp: Fix Innolux N125HCE-GN1 mode
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
Message-Id: <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

The mode has a pixel clock of 162 MHz, which is 70 Hz. The EDID of the
panel only has 60 Hz and 40 Hz. Output of edid-decode:

  DTD 1:  1920x1080   60.001038 Hz  16:9     66.721 kHz    138.780000 MHz
               Hfront   46 Hsync  30 Hback   84 Hpol P
               Vfront    2 Vsync   4 Vback   26 Vpol N
  DTD 2:  1920x1080   40.000692 Hz  16:9     44.481 kHz     92.520000 MHz
               Hfront   46 Hsync  30 Hback   84 Hpol P
               Vfront    2 Vsync   4 Vback   26 Vpol N

On the MNT Reform 2 with i.MX8MQ the picture flickers at 70 Hz. Use the
60 Hz timing from the EDID.

Fixes: a14c6b0eef77 ("panel-simple: add Innolux N125HCE-GN1")
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f7add22ccf69..0ebd756d14d0 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1364,15 +1364,16 @@ static const struct panel_desc innolux_n116bge = {
 };
 
 static const struct drm_display_mode innolux_n125hce_gn1_mode = {
-	.clock = 162000,
+	.clock = 138780,
 	.hdisplay = 1920,
-	.hsync_start = 1920 + 40,
-	.hsync_end = 1920 + 40 + 40,
-	.htotal = 1920 + 40 + 40 + 80,
+	.hsync_start = 1920 + 46,
+	.hsync_end = 1920 + 46 + 30,
+	.htotal = 1920 + 46 + 30 + 84,
 	.vdisplay = 1080,
-	.vsync_start = 1080 + 4,
-	.vsync_end = 1080 + 4 + 4,
-	.vtotal = 1080 + 4 + 4 + 24,
+	.vsync_start = 1080 + 2,
+	.vsync_end = 1080 + 2 + 4,
+	.vtotal = 1080 + 2 + 4 + 26,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
 static const struct panel_desc innolux_n125hce_gn1 = {

-- 
2.56.0

