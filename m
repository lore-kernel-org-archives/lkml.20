Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817EA33DEDF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773001; cv=none; b=om44la30FWhUJMM0OErL+jvsGB2mFe932btp/RA4+KVHbybEX0PAnbA8MHfObU+DmwJ3elTLkgQDYmgYlsCDNKTkRfPjOltLiUsPYmo4uz2QtZm84kViTusKdsxEjhcHCI+UMwMkdKsGydYMYsG8UgyZsGH/z2qxfs1asg3Q59s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773001; c=relaxed/simple;
	bh=8CjJuQ06+60YZzQD/T1tCIdngsp/BywGU7RmY/egKRA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=t7H9czLjyKPazzOqTTlloi/YgxS/YpmM2szzE2wXKHRm7vzN9br8N6e17Ee4hJOAWfQm+SHzILOlToFDqnMjdiNlgkUX3us4zUL8McKZM9vvPoB+0jELYyQFdxtwwGumsvyPs51ugZXq+oWxuZZjffHbMFRixx2KDAoU96Qghio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkU94luw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkU94luw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so3138976f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790772994; x=1791377794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VY+X5tJHlWDJqPcaN2ImTpGqbW514tD+lvMI3ALHW7g=;
        b=YkU94luwiTmK5o6evfn74nIM+ytVEN9JTK+n/z2RY3FyHo39Mf0Zy5NTUkzzOdG1as
         lpGnVYgXScnjLEINResw1ky4R5YKGxLfCmvWM2VtEnXlvJUoBUNFnhdr8xyqWsPc3psX
         sTMrnKi6oEUJpw5wT9JrcofCZJ5YhbxVQ74hAhpWDagTaQvpcyF/9H2c7MtXhs0C6Vmg
         n14g/5MHbUf8QBLZkp2T9LYFOSZHB+j35feDHeYxKusllGHG1IJt7hmMWZ24wR1ENuFo
         OyjU31tAi/qoH/VR0Z396iSxkdLP9rS8JFlBrRlG+KTbN0G3cRNzS8LgeMCMxTqNeBNA
         FeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772994; x=1791377794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VY+X5tJHlWDJqPcaN2ImTpGqbW514tD+lvMI3ALHW7g=;
        b=fsQYER1Vps+MeL+wwuX7MdsdKL8xPL2A6dtBRopRrW0txG+xocOWuaLpT0IQBb+CVX
         sX7w1muXpp+9rpLvX0vkF5NuDgTL6x/yDY1LvL9thoZMd/Yt/R22eBa6nrNkuP2lJSPl
         3tmOwK+PjRxFETZ3WBZPDqVecsjfRZUkInYqEbDBz2Ux00ICIHj1kBH6oN8cufEKSahh
         ucjVMMMpLdOpCyperR9Y67lVZz+08YiTUd5brGY2W2bCdDbAtBlYuQvcX6XBMKOx/M6/
         39879oGOTh0UtetrAgTnumIoTnFiWaS7mkZco3k9cmVtfNUjnHfMjAa846dZ44d+OOW0
         K6lw==
X-Forwarded-Encrypted: i=1; AKwUvBzW5Ia6xEYotuSPfikCxOwI8qC74g0BUbu864xchv2JBwecCtbVK/a1ts2ND7gvYst83F1ofoVGN85C8Wk=@vger.kernel.org
X-Gm-Message-State: AFuF++mckRGBH/vT00De1+K93TjeFyvCmPcE/N12K56W20Io2c2hWBUw
	mELJAq973rBsabIxwggIGmB8m4D78nI0CFMaYjikUSGvDabTPmI5zNCe
X-Gm-Gg: AYBFou2oRkVtma1STFXVG2apOdcyGQeppPsLGG+63PBUhu5hdP/Fb3WmWAhr4EnSPKU
	jIBV6Lf4hDmXO71f8tBCSirFBY7yy0uiXG7i0b2GDMG8eg8i75yioj4i2XlyhuYkDAAqJN1grvR
	fab41ejVKhpQNk3c6bcWYYX67aycgjUW6hDS0QBSZQ+0jbWn2WmHPCut7J5mFjs7X1OLNu9MA+/
	Fi9gSb50R5rT7wBrHPG/wQ0nqmc10u+ViCrcWOmxL21RGMFFFj0Dd1v25KjUw0s3wWXoV/UcPir
	+uomZ3qT85K6yTz7nNzj145VHk0WhwpDV/2dWV8UDooG3dSwWfv1Xt/BUuKQTiZzqlJQlp1AFYj
	xF7eyEF19h+g67ZyQcpFMKmOr+YeDq+wGzbHDmfqMcKtQ3yFtk56pBY0y2PmhiVK+Ewio6njxx8
	2jrrq+GPqUMGEF/glnLZ7SmRtl1jbU2Ga8BAkB30QdLWwa84sXAPUdl8VVT+J4HckCHunYEAr6u
	P75fekmnladeA==
X-Received: by 2002:a05:600c:800e:b0:49f:ff6b:bc82 with SMTP id 5b1f17b1804b1-4a01b00d9a1mr22489405e9.20.1790772994331;
        Wed, 30 Sep 2026 05:56:34 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01771b0e8sm62084555e9.12.2026.09.30.05.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:56:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <daniel@ffwll.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: reset the Amlogic GXM GPU on runtime resume
Date: Wed, 30 Sep 2026 12:56:29 +0000
Message-ID: <20260930125629.2691968-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After its first runtime suspend, every power-off of the Mali-T820 in
Amlogic GXM SoCs times out and floods the log with shader, tiler and L2
power transition timeouts. Following a soft reset the cores report not
ready but PWRTRANS never clears, however long the driver waits.

The transitions complete normally when the GPU comes out of a hardware
reset, as it does at probe. Use runtime PM with reset and clock control
for GXM so the GPU is reset on every resume.

Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 36cc2e67a308..df8a41a9a70f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1092,6 +1092,13 @@ static const struct panfrost_compatible amlogic_data = {
 	.vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
+static const struct panfrost_compatible amlogic_gxm_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
+	.vendor_quirk = panfrost_gpu_amlogic_quirk,
+	.pm_features = BIT(GPU_PM_RT),
+};
+
 static const char * const mediatek_pm_domains[] = { "core0", "core1", "core2",
 						    "core3", "core4" };
 /*
@@ -1156,7 +1163,7 @@ static const struct panfrost_compatible mediatek_mt8370_data = {
 static const struct of_device_id dt_match[] = {
 	/* Set first to probe before the generic compatibles */
 	{ .compatible = "amlogic,meson-gxm-mali",
-	  .data = &amlogic_data, },
+	  .data = &amlogic_gxm_data, },
 	{ .compatible = "amlogic,meson-g12a-mali",
 	  .data = &amlogic_data, },
 	{ .compatible = "renesas,r9a08g046-mali", .data = &default_pm_rt_data },
-- 
2.43.0

