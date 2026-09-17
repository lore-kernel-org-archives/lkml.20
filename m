Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC621254B;
	Thu, 17 Sep 2026 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649516; cv=none; b=qAVxInZaD3bi+5S0pQxo+aG0Xi3aHEZEg+JsyPG9RiZtZFrOZEed2plq/TNSl1IfnPy//HTstR/usP0tREJwWGNn7eJoYQnQr/Ml5ict2OcerFmFry/FPz5+mwpwehAbXnFVs1QJReMBUFze+XjyXkK3NFSPyL5ULTKNgUO38wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649516; c=relaxed/simple;
	bh=mrTB1LmsmAc8ZgfJPlblJeFyOy7amRAcdDErDv0bjPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3DjPbnakx3/+5edFmfBEXi1VWsXVvwWeOQm7m9KQqQNSsrFMbRmBcUAk0WXNjUf1h+WDcZ+ZabS58lgMBIjII87Dqa27rcHTVxVFnOXaOQ/J03/JOENXbZE6TyCKBtqfR4Xe5HC/NF1Z6taoRtm25vmWXCl6bjRiBn7bM/Q+Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bjCNbwJ6; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=S1sj6Hzk; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bjCNbwJ6";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="S1sj6Hzk"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789649490; bh=HQqFrcyVByninqC2k5tKSdW
	i1Wj8ZnUSQzwicAMA28E=; b=bjCNbwJ68P1t+wrpBz7rE/ynQxy3zCKHWQAcRVdEJVuD9nL7Il
	M3YcnBKm9xGZM78gwEzaI4oMEHZ8hICYqhMRRHnLmleX2/HRBgF4t5aZpDfCAxpvLH53cdIIwk8
	/6+3hX4c87cbdXL8eZOCPvN1Ma5hTt3XMgYiMdlP2PozmMGrbM1FFdBSLa1p3R2I7UCe7exGbpS
	Qug0gjem9pCgJ8nqKkszESWcnkA10Sfj/jFaJL/R6g5asJMNlRMF9hIQ97s8RX8GCf2Mn6bdGn1
	fYW4Smdi3vAOinMtejBNuUNKDwMVBM6ah21W7YpnNY1t+0hNOCfn33/O+388rac5yHw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789649490; bh=HQqFrcyVByninqC2k5tKSdW
	i1Wj8ZnUSQzwicAMA28E=; b=S1sj6HzkqNHx6mL7S9CTJ4ti0fFKxEZ6vA/8LEB/QK+9jhr5W5
	LfxLVGf2FF3zt3FD79I6pMT3YPDBF4zeGOBw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Thu, 17 Sep 2026 15:51:22 +0300
Subject: [PATCH v4 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
References: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
In-Reply-To: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789649485; l=813;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=mrTB1LmsmAc8ZgfJPlblJeFyOy7amRAcdDErDv0bjPo=;
 b=XJG5fwDNqb3oqRKq80kWerbR148kMKw/HbkR21vvC8jsWTY/JWaFlUZ5FygjPSCUqnEb4O/Du
 koy2gKp20YhDifBBC16lxETOzC2qSEGDdQ3V2yVAoHOOuOvI0YdYhee
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7291238bc09f..743c785b4558 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8354,6 +8354,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
 
+DRM DRIVER FOR NOVATEK NT51021 PANELS
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+M:	Nickolay Goppen <setotau@mainlining.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
+F:	drivers/gpu/drm/panel/panel-novatek-nt51021.c
+
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Lyude Paul <lyude@redhat.com>
 M:	Danilo Krummrich <dakr@kernel.org>

-- 
2.55.0

