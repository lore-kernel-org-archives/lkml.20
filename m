Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0FE49F136;
	Thu, 24 Sep 2026 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262534; cv=none; b=k1NPUVjCJfQf6a6eh4Wx6/1WjHjisUhy+u6/y5mBDZCL72HLjN84JyfnzllGVzUQZY4nc2fobjBTkj3xfEPJ/gI/47OfrsH+BxLO4CR349Ho0iPgwu/ZwyL+ExjAi/EzpniIlQYPTE0PvKgmCiGw4JIY67H4WkFrg9TJYDCLvZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262534; c=relaxed/simple;
	bh=UvbOARMK6GY1e3ow6mOk9/yihgwenDxOFpT75WOc224=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eb3Thy56/GmLx4bPvVAnugmA+0pPbjJfImrywCt0iHXZ52n0dqqjKAM2/M+uGo8E3elNHmj6eiuoxtl9aYRy5PugoUt83PB9wuxabWUoXPT13atlsmVjkD11gNSEVkaq0R2fzNz9YKd546EnokLPaVKDtsiLrYAswEkYjgQTJuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=i/jgABKo; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZMzq40Ac; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="i/jgABKo";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZMzq40Ac"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1790262504; bh=IT5wIL01ABwmRZNqLeIlIor
	XyVzxqkoz0C2MbyXhFoE=; b=i/jgABKoJEzbGRbTcMlJ37el+yFeAl2lLAwfH3/AY9VWWZXbsP
	CQqcHXScEuYcPDnRMPkJcFweHWNvxStZZq9ZYDuz6G/uF1vz7bZcocr0rtMJIiiucEF2ZnrYpWD
	aeNsfCnGPhITZqUiX7Ik2xFSaX0wnFjdc0ITIt2rm/LuHC4B9/D6z3ftzsAlelNIHz+26rhov2E
	H94u9L0BVTPpn7A516qxUO0oBw9u0bySQiMQuhevdolVn4MwPCCxHC4XKisK2DDDqGvSN74ZsKb
	v/j7gSua3IEw1ZkMi8npmuhPLkLhKURTvOCRYr0Q7cp0/jJVqTNXiJNvJXMZthr+0dA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1790262504; bh=IT5wIL01ABwmRZNqLeIlIor
	XyVzxqkoz0C2MbyXhFoE=; b=ZMzq40Ac7/CyFWVYoM7d8y/7o0EyL4Km/qyAy3friFH94uhVq9
	LtRR3nxNXEpZwlmtHNICj9m4P1LRI1TqpVCw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v5 0/3] Novatek NT51021 DSI panel IC driver
Date: Thu, 24 Sep 2026 18:08:13 +0300
Message-Id: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQW7DIBCF4atErEvFQIxNVr1HlAWMxw5tAim4q
 FXkuxeni0ZqZHX5S0/fu7JMyVNmu82VJSo++xhqNE8bhkcbRuK+r82kkFp00vB3jGceYrETvfE
 wNSAk8IsNdMqc5GB61zXW6JZV4ZJo8J83fX/46fzhXgmnhVwWR5+nmL5u9wWW3f+eCnDBEQGtB
 tdLDS9n68PJBx/G55hGttwV+QsagHVQVhBUQwqMsO3gHoLqHlTroKqg1Nph07fUoXkIbu/Bdh3
 cVlAJOzhUlRT4B5zn+Ru0B2U00AEAAA==
X-Change-ID: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790262503; l=3057;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=UvbOARMK6GY1e3ow6mOk9/yihgwenDxOFpT75WOc224=;
 b=Zy0TihR1b9K1C++TJWJNN42mrbvGokfVKR5j1+bvjn8aZ4/jwFrW7KLvgfYU1UefkMYUKJdgX
 y53x2s/xJPIDMGLgRo20gs9shHB8wJD5ArO2dcIILGmV5AIcj5onbeN
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series adds support for Novatek NT51021-based panels 
for upcoming xiaomi-clover submission.

Although according to datasheet, the IС has three power rails 
in the use case of xiaomi-clover, all of them are wired to one 
fixed regulator.

Maybe I should create a dt option for enabling CABC for panel.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Changes in v5:
- Added R-b's.
- Added a commit message for MAINTAINERS change.
- Link to v4: https://patch.msgid.link/20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org

Changes in v4:
- Fixed bindings (Krzysztof).
- Added R-b and T-b.
- Added an off function without touching CABC (Sashiko)
- Link to v3: https://patch.msgid.link/20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org

Changes in v3:
- Fixed bindings (Krzysztof)
- Fixed probe function (Sashiko)
- Added BOE-TV101WUM-NM0 support (Ryan)
- Link to v2: https://patch.msgid.link/20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org

Changes in v2:
- Use devm_functions and renamed structs and functions (Neil)
- Added delay before deasserting reset for stable initialization (Sashiko and Ryan)
- Fixed dt-bindings (Sashiko and Neil)
- Added a comment about set_display_on command
- Link to v1: https://patch.msgid.link/20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org

To: Nickolay Goppen <setotau@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Nickolay Goppen (3):
      dt-bindings: display: panel: Add Novatek NT51021
      drivers: gpu: drm: panel: Add BOE NT51021 driver
      MAINTAINERS: Add myself and Ryan Brue as maintainers of NT51021 panel driver

 .../bindings/display/panel/novatek,nt51021.yaml    |  87 ++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 875 +++++++++++++++++++++
 5 files changed, 979 insertions(+)
---
base-commit: 99cc957e3ef3cccd72d2119c8eacbab39af0d1d6
change-id: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>

