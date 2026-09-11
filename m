Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34566468C1F;
	Fri, 11 Sep 2026 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141105; cv=none; b=jJjM1XSZCqVXMNWgEZzhWdkzhb2No0hKRo+tQP+lbNeT1bQSbh8yWJ9ydjcRw2Bma27FbEjAaILq+k0kswlPgxk9DbboCOECButIsxIhw+ZCviUX8NOnjTDuV2BFvYUHKHWnaJRSe7ahPBDCKyxeLc476N9rkK0RPkY4bqlX0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141105; c=relaxed/simple;
	bh=zD9oZKRsCcU0BIHbOPpViTHvx1OPAy7to3vbd/4GBpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTFIi0SU3EharOsidJM7G1izzVKiGXCLpP5c/MzeUPJgnKjaIbol/ZSBb5/bAKsZCu79ZbBQpAhVcdS9/DrWeOBat9ZnTx8/6ig2EiVQ9xFGjrDHgUDn+nmGxT1ePXMr46cTKZ6AZhcyaTGDxw1wGiCas/BeYhMRR3k24r1xiwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IOHCtGCN; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=li5Mh+gd; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IOHCtGCN";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="li5Mh+gd"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789141092; bh=OATDRvWIhuV2v8n55fSDver
	iCL2HGH/4EkvtPirdd0Y=; b=IOHCtGCN+KlJSb54os7YnP45u/Dp/cP5CWFnHX5aiYg70wYXHx
	rP1Dpt7ubQQ+Zj0MG05OKJUV27knnd8/PDuQV6kD+9oghFQ/W9ZPvRkeVAsERDq0VmvIogZFpen
	2tJywxL3Fhi9cA0v11/2MtotWeajBzRsbqCoELROC/TEd7zvLzO+eNtQZvuxEWJHWYh+KyJpAPg
	p2hN8NnJ/wkC4uGwjfkL7XzdvZW88FUZ6IK/30/yoF4g9mKiv+P5uHgD1Sd9LvJLjO8COarV8w3
	ejekYajVH1byeO9oc0kb3gQbeIcyB9OmIroboQOnlriX8la87rvtik7aSvtrzjP37Ug==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789141092; bh=OATDRvWIhuV2v8n55fSDver
	iCL2HGH/4EkvtPirdd0Y=; b=li5Mh+gdWMlKtzKoU5EGysAl02u1UFlyw/0WzDUk2584Tl2Krc
	ZValRyQbOejivMmuZfq+VY4VkV/GWDVG+yBw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Fri, 11 Sep 2026 18:38:02 +0300
Subject: [PATCH v2 3/3] MAINTAINERS: Add myself as a maintainer of NT51021
 panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-qcom-novatek-nt51021-panels-v2-3-135e3190a7fb@mainlining.org>
References: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
In-Reply-To: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ryanbrue.dev@gmail.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141089; l=772;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=zD9oZKRsCcU0BIHbOPpViTHvx1OPAy7to3vbd/4GBpA=;
 b=8gI9KLvHBhtUk5K3U2ubweplEguh9EA5WUqcstLUkTLId5aiDDPOMMWY9cjsgOp9BMHhWrEWI
 S0kIq39cIJkAGhw+sVowTm4MbYnBX4qbceiI8IQuMgZN4CjnfuZaK8y
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7291238bc09f..3e2e6b94e6ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8354,6 +8354,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
 
+DRM DRIVER FOR NOVATEK NT51021 PANELS
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

