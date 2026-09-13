Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556272DCF4C;
	Sun, 13 Sep 2026 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311036; cv=none; b=eYTbJniDCSvtKwhgC7Zy91bRf2CUtXimii5+gWsOmFwgvbctmOHyD/VX5xya+ONAQ2AK8gdCya8jzCpXMV+78V0pDjIktsPWas5nGWpo2kjzDUkbT5NROwXPsrDjyLQeGUVnm1x0W9ha/KJhijQ3aoivEP8RlSVtFFJVdxHWlgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311036; c=relaxed/simple;
	bh=mrTB1LmsmAc8ZgfJPlblJeFyOy7amRAcdDErDv0bjPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q3156jEnURCYFXl1RvY1LizNa9EgY+aJ/vm/3cq2Rz+hCZpaLQ9gJpt1mY5cXMcLU9mQunlu6MExp6KlVmIcxX/WHcySK7O1VSlIeJBP8+tSiZkcFIIeYcZT6DJqhntZKlI94uw4xzDkOzE4SKYiSd1jr8Jnp050QlO/P4uU5Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=O+FZEiYo; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dv5BBfjy; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="O+FZEiYo";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dv5BBfjy"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789311027; bh=HQqFrcyVByninqC2k5tKSdW
	i1Wj8ZnUSQzwicAMA28E=; b=O+FZEiYo6o84bsowlf50bBFTdLkYhUmmkZM9a4P5FrI730n75l
	PU4MW4R60djUwbYNuYnxLrrSbt7KG/LuW7hPg/GCmVukoSzIETTGjzAwVaZff2ny78Q+sSjOSaB
	4RYzApURYPvUjGb+xImShUC9TgWHSKlL4m4hrsNJCWE7SUqI1D/Wg24n9SXjABHPcjvI1zzTgse
	Oac6q5g4A9J4fFhXgN8L8EqPe5Ibaqy/GF7rIhmHAUfwyUloobUXJVmRWfj59adca2E/dzOXO8O
	IM1EG386pjr5ZqYmipFe6jOqPqDtfM+0OoDwA+ULV2eTn0esWIM57pn1Y0igP3sp7IA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789311027; bh=HQqFrcyVByninqC2k5tKSdW
	i1Wj8ZnUSQzwicAMA28E=; b=dv5BBfjyZMVLn7mb4NhHdwLDVyx7U4w4jFXGmKjn7C9+W7saWE
	Q0et3zYYnHRxgLAnTowD74gwJLPt1FCvE7AA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 13 Sep 2026 17:50:18 +0300
Subject: [PATCH v3 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-qcom-novatek-nt51021-panels-v3-3-266bc5d7e8c9@mainlining.org>
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789311023; l=813;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=mrTB1LmsmAc8ZgfJPlblJeFyOy7amRAcdDErDv0bjPo=;
 b=Thm3nLKxaN3Lkv/4kaVZwyhRIE6D1dEUxQA2bq0Rpw07QEri6giJJgPVzwPfLD7wp/SbBcH8a
 Ubte3KahszUAoizgCzIZky0Kx2WZLRQZM8jzZNtZeRZJuAlURsl4WxJ
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

