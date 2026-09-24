Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A394825B0;
	Thu, 24 Sep 2026 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262533; cv=none; b=fzir3/itF1oH9dx42IW/VUHFYNICnMtrxQQC6XAYUP40JL80Z1A7k7hYC9y1EOjLH60XJp6vh/87Eu+ZoWDvF7z1MLcix7kH90xYamxZZqimAPNbsHTkstryG2uBJjgSLegBgobiAp389I/aqrMreR5jSU7QX3rWE9ky/hNHa9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262533; c=relaxed/simple;
	bh=Yo9jegclnSbgqe3YozDB9gCwq0NzikrfUngvQp1Exac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkNFl7uDwfOaPOgNy8BPrrdPVG2ELaWMAL9WzYvueE5qKt4T8g3w6OnKY1BD8otPbqy1iLqxKMJhGKcedfwgOlsmLcuP4rXxcHLWi535OGBBw9MAfJaIMEwoh17KKtDLcEUw3nLQYReqwOsiYdAVVX/sh3v29vaQ+Dc6EjNg22o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OBP1ZeXC; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DgLZLJQw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OBP1ZeXC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DgLZLJQw"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790262508; bh=ukLUOMhti9Eo0MeSXTNN0Wt
	zSkR87ftxGnpm0vvhebA=; b=OBP1ZeXCB8FPYPg2BRoJ2gxKOGfjgm+8Mpuch4ndYsNVn95dVG
	5c7T5nC2/HURJvTmXzxc+iHVnxeMI3X7neObLM6Vxiu/84Xz2834IL6YbbS5JL/ZpXNUoYKx++0
	eu4YxANHuUuSA5F9WI5TA1nd4FOykpygrQLCOgxL3fyx0mIWftPM3bKMeA3gb4v+UqcGiKB9ewH
	kPT4i+DhOe8vTvVsxWRDGh78k+eAz7MRvG5y4//i6Fbl06ktve3801PHIlZFZ845+IaCQA0lqAg
	L3wudqBFE6j0uMFv/juWUdQAvMqNm6r1g6xHA14JwJA2E3M+Z474IiRmcRWYQm0VeFw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790262508; bh=ukLUOMhti9Eo0MeSXTNN0Wt
	zSkR87ftxGnpm0vvhebA=; b=DgLZLJQw4JYEsHt2HyaanMAIleHbgJNO6a2dC6+MTbR0O9Qe29
	ArZjRUVhY+rnN7pQTugsPJ8RNiki2owRP0Ag==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Thu, 24 Sep 2026 18:08:16 +0300
Subject: [PATCH v5 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-novatek-nt51021-panels-v5-3-f5eaf5685c9c@mainlining.org>
References: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
In-Reply-To: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790262503; l=872;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=Yo9jegclnSbgqe3YozDB9gCwq0NzikrfUngvQp1Exac=;
 b=mGK3jae8HvyV10Y5/WpnzKWUjvR2ywJsqQNIaai5hv3mOUIqdUftNvK0kou5cKwy2TpQqyrX2
 tMn/GuXs1VNBjDGJOL0dPWbgSgOm9pJo0HgtJftH37mgDZN6FlPFn9v
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add a maintainer entry for the new NT51021 panel driver

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

