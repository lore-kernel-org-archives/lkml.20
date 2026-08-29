Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8D03F106C;
	Sat, 29 Aug 2026 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034165; cv=none; b=SfRT0myZDa/lIjLBk6AehzxQQoPYaWOCFtr5j+5gQnC8XVL7ovcl0XwmNNu0N+VM4/13maNpcr7gppd7iVXRSpTQPllHfhpbF2uWTnI6Vz8Jm9tVDB2EAv/EKByzjhdjedG1z6JzetsgpHjmzr7JhUXjH1P9pB4kwSPA2K8YPHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034165; c=relaxed/simple;
	bh=5kmSpgALd9GTo3pAxZGgQ31AVpAy1mkPvNU6vZn+7pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cSTRfjRFIboaxK4zDTaUHdjiKyMETPomcE9ZtNBW+ZnQMQbV/9IH/5lf/uirH73HqBVtD/q83ZHF+pHeFkgwLitjnGJMEqJYv0rxObHP+4YzCq/1A4O+xUAKLmvxGGcqRsyNdTW+7A9+VUlq1aIvI7xRLc948+Z8MyXOZDbWQ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mEtp9emI; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=aTMLP/LQ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mEtp9emI";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="aTMLP/LQ"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1788034159; bh=D1D5yRftzRyJg0Ypyl8P/j6
	WTdLdYr1mjt3rnU2v1tM=; b=mEtp9emIimkvUSHzeMF1s711bfFFu7Sc1MJi7O8tc5SeEWjSUf
	qsQ7ynZ9JRlHrA+6Rr6omcu+e6r4JG9+d/9a+YqKUa9DMEutj8121+YDUHL+4o6BpYzTy+R89fe
	H0co+DfeWvVcpatpjCbePXtRwupI0YMBxhT8n7aaA6ZumuctxKmyVjKh2vKRCwOO07NpJOlr8Z2
	CmdvjnEND9iCJ0JjjbmcJtpR1mhNaLcK/A6G6C7PbIh3xPc7B0H8zd0FdbmEVnk7Sz/5EO/aeoF
	hCucnvzLAhNTtNRkQFwpVDbeOvp9rIjpFCHHao8EKbyW0U5iOK9vo5DxsgDpYmN/t2w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1788034159; bh=D1D5yRftzRyJg0Ypyl8P/j6
	WTdLdYr1mjt3rnU2v1tM=; b=aTMLP/LQvhMu/kQv+5jAZo+vB/HZ4n13sXgy8uYcLmIiCzovTN
	yNEKkyrs6WOuQzj+rjMkQEOE3Bq+yNqsXLCA==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH RFC 0/2] Novatek NT51021 DSI panel IC driver
Date: Sat, 29 Aug 2026 23:09:12 +0300
Message-Id: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQrCMBBA4auUWTuQBFobt4IH6FZcpOlUx5+kZ
 mIRSu9u1OV7i28BocQksKsWSDSzcAwl9KYCf3HhTMhDaTDKNKo1Fp8+PjDE2WW6Yci1Vkbj5AL
 dBcmMdujb2tlmC0WYEo38/ulH6A57OP2nvPor+fx1YV0/UD967oQAAAA=
X-Change-ID: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788034158; l=1077;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=5kmSpgALd9GTo3pAxZGgQ31AVpAy1mkPvNU6vZn+7pk=;
 b=kC1ufeMgGc2m9ghrxnRsQs/IbG541xgXBRRFrYDz03UGoqgoWFrFHI4BvPdYbvfpQ+xFE+2yu
 Ii1s0RaaEAoB/Qis/wAGred42z6a9nmhiSLm/Gi7uq5Je6w6mGlEqKP
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series adds support for Novatek NT51021-based panels 
for upcoming xiaomi-clover submission

Although according to datasheet, the IС has three power rails 
in the use case of xiaomi-clover, all of them are wired to one 
fixed regulator

Maybe I should create a dt option for enabling CABC for panel

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Nickolay Goppen (2):
      dt-bindings: display: panel: Add bindings for Novatek NT51021
      drivers: gpu: drm: panel: Add BOE NT51021 driver

 .../bindings/display/panel/novatek,nt51021.yaml    |  93 +++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 804 +++++++++++++++++++++
 5 files changed, 913 insertions(+)
---
base-commit: 99cc957e3ef3cccd72d2119c8eacbab39af0d1d6
change-id: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>

