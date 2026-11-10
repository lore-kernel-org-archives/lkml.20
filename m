Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311185;
	b=3zbGPr8rljO5zMaiYQxNtHiBJ9xWDwvrBKvcDKleY+fbMlbVxW3lIzORx3MMCJZuOUUi
	 n/M/UaVcs8qiBmZMXMCTj0CjQbEYWM6gHSgGMixOPKbs2bgf8EOQpLEEzN2xC3XVAYXeD
	 cy1OA0DedO9xqllm1srdkwgJ2WNjrSUXABQu4M+reNRH6giLXu738yQ93EeShE2mFMGfO
	 bzrw+6rJiefmh9vqJro4to//BaAXeGri51kjFECQLJc2Jwx9lN/+XTLFGWAirLyTh0c9i
	 OWm1GxiWa0u3HBYzVwrbQClyw9J0D1ZDauM0csB3QNV0sYuB1xg1yMM8Ay1A/BW7YOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=650xNz5E2WQUY3KnP5K1WhKYhZweVEKGeHri1CxDolk=;
	b=hKqNb2/dnJ1mPSHC5T08EjsF3n4X1Yb9vUc6fPaBAZkrxGWknaWa64eeNZhVk2u1VQ3p
	 ohblSZjI70j9hbkXR8ozFIgiPTiv32/eWe7R/G/9c1Vwm0pa+BH6j6XeqHQA8GEw3JzGS
	 D3QRfWnzAJx5Liz4RezK59OxUBXTsdoYjW12NwCWzXB7hMWP8DdpNVVYXNyVwFcZWsVsB
	 9LNoqVv6wTQ/gNPcLTy4GJomYd6t7l0bY5FQygfQ8ezrJ2ACWzEpeLdpsZeuxFNwM/9AR
	 xvE/jIEpxyT7KS67qT0b++ukLQjWENxsVurRhEv5AYi+X2Zyxx5d2zC9eW24oTT+kYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMdukxGq;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71075606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71075606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMdukxGq
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12972025e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311184; x=1794915984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=650xNz5E2WQUY3KnP5K1WhKYhZweVEKGeHri1CxDolk=;
        b=cMdukxGqQnrH9dDFcIPgXAIsRHF2a8OVK1qWD5fensk3s/F4SGBEuCb4YTo9bIiCaN
         WzqRS/Icm24TWSBcX4t9S5673j40ZZXVmSSPqf2+ztWwXe2biSK40xgktNVfoJplYcQ9
         dUNBL9p39Ij/wuzJR2/4Xu1X06oEUUcka9A3gby4XJhqQr23dNhc/z3G04VLNkxND7b4
         fesUor9CPnEbYebKht7IE4mmh4BFO7/EZSTj1KsdQZoBFtM38CZIJmNFxcnRDttk/Npk
         8oc+P50OxIRhjcsx9coE/eDU6Ll+pt7McfMi+jVqZH1yXUfK8THlZ2K13970ZEj6yHm1
         KpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311184; x=1794915984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=650xNz5E2WQUY3KnP5K1WhKYhZweVEKGeHri1CxDolk=;
        b=Db/SO4UnuDPYQ0LgO8hTp3i5n2FKajUls3AGlSc7nfc8SUZ5ACMlGxXKf397sDVROk
         6Qo5EFxkTwdQs3o9miufZNGxXma6pCkZcc4RpJPydW6gKTyle0ByLF1qAZ8x5xjuniHh
         tXgYnOtgXvAmJLP8tIy7e1WwppafLDxFXVQ0E3TYb90wTmb5QDWZJgQ0t0cZnrZsBoMj
         299BEIzj4HMY20L/z4yNkMibOUNaevN2R50jCnz8hPl7NtWs470E79OEZ/EjPVpv8Mx/
         05YCGLwTZnM4hvqlPn6tl3mp1NdBeeAON7B+RE0upMOF10kiHQNe3LsQwnplrdbSlRg2
         5A3Q==
X-Forwarded-Encrypted: i=1; AL+hErEYjLBS/qZ/uSUV09ngRnZ1X0zHumZ/JtGsPDfRrUP8WAPkA2JeW44IWbH+lpMrqbHB1KCJ7uTwGjNHZ5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r9p0xb9CubVykNbDmfBkkV3k2KFdqyqrfrH8+9gNMaDP6kUUG
	gHIFGG4gZf8HjMNNQ73HfUwXug0O1RhFXJFpWlKrD5pb9X2UsyIs58hV
X-Gm-Gg: AYBFou1X4YfCgrAgMVzWFZL5fbjWBNg8wjhKGi6/Np3W9rP9V8XMzW50M8opREa9hfn
	g7kEiWPRk0RXafAZ8AFYu7pBQuy9DLYeEMEbtjOsQVm5kHgMx8HQ7dTf+I4PLpQldS5yOVP+DYK
	QyDcIFhrZW2tphGUufcsaKXCAB8T3dripzsgwYgn8WtsnxUntPHvKInjVPttKarEzeMfdHAt8pR
	mL+QhxrIsW4UjsLSY7ZdD3863jw02ezS4kMZynTbYuE1Y17P2OSNzNBlmmluBqlYN+Wo8aAsGZ9
	Qc3EJYTJQhPtxaui8RxoCvVyZdgvF3IL0mrvM4hVZnX2J3jHmuJv5Xe5BmRnRSXJBbtHohMygCe
	OwuhdlP+K9h5d6Cpm2o2d94xO+0yL3cHcuot+5OaCPG5LVfvYEeALqfhzv1tky1fs7h+ewrAxFp
	XASIGSka/rkkNkRMpMrN51+ecgcLnhVIpPrEQrnOVar2a4YtpuDi5AEzb2Z3kvJA7d1MnSbARUn
	qqYhBkvdbKYoHEWJRWa5pSdsOmi7rR5xqo3gHX3a1nwk65/VPC0tvFF8Vt1yw833okvo0tmfgPQ
	Y5ASdiirYO95TjgU/T6IdNgu10iwoH5w6GguBatAzpx5DMoLVIGWDKmNUXrOcelN1l/NITyTPIF
	xwmRCdQDgw91x7w0aBTWVnhOB7p2VtTSbe8qNF4MrqoEjXB4KjZ1MpgBBd5cMx36MMbI5BMmzfZ
	AUmG5NSBmrhA==
X-Received: by 2002:a05:600c:4f86:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4ba0234575cmr38552685e9.14.1794311183540;
        Tue, 10 Nov 2026 03:46:23 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:a442:471f:496d:2047])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a763sm59915765e9.4.2026.11.10.03.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:46:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] drm: renesas: rz-du: mipi-dsi: Drop duplicate platform_set_drvdata() call
Date: Tue, 10 Nov 2026 11:46:22 +0000
Message-ID: <20261110114622.229608-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
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

From: John Madieu <john.madieu.xa@bp.renesas.com>

The platform driver data is already set earlier in
rzg2l_mipi_dsi_probe(). The subsequent platform_set_drvdata() call
uses the same arguments and is therefore redundant.

Remove the duplicate call.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5b257f5adf06..985d6e02203c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1576,8 +1576,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (!dsi->dcs_buf_virt)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, dsi);
-
 	ret = rzg2l_mipi_dsi_pwrrdy_init(dsi);
 	if (ret)
 		return ret;
-- 
2.56.0

