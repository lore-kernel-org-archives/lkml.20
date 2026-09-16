Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9499D4B0CBA;
	Wed, 16 Sep 2026 11:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556922; cv=none; b=ZFnV/bUnIbfpVzqyS4F9Kl6J+Dwvp0l7vS3Lf6bU9hCpp+Gyeg9CeZHjk7OCmmUY7nnMsPD4mK9ezxW16iUiuNbzm5w7CYbsK+epgbb1RReDQRkApRBj5LyJ8CRxjMsD4m0i7VH+1pktNQXGYyknFiHIUH5Q3b4dtuQZa8zbrVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556922; c=relaxed/simple;
	bh=mvbGJKU7g8urQTzwwQuSXtCvZqjpvJmauyF4amfDJEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6HAmo7CI2gRbi4rmWWglKVIRS44iQzEflbZg7TJw2vPnb4fjBAyLu6l6zyscJUhYCX0SKyj54L6U8T6afOHaPMYcFEOuH8DrR3zCJqbkcn/fwDOahrUtF+u+RgRLAnMWLxEzspwa2N79XJCvWrm1ubRa/XzoiJW+5PX9cLrWRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GN6eTxhS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GN6eTxhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789556909;
	bh=mvbGJKU7g8urQTzwwQuSXtCvZqjpvJmauyF4amfDJEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GN6eTxhS/ALFNxkyrBHL9dWeqBtnw7EBL2VDx83iRjR+y0Ef793/Zmsb3hrPFLZyf
	 ybayf5bILV7z7l1m8AHR3zG8pUd6oxbvmMxoy9sLxHGPHAb0AdtsIKP5OYO7JKhMLc
	 5giPtPEtC/zD4F416dMqPlcO2ih4QfJUL4zW376C08ryvlofChQtLlkcG0nBxzZRgj
	 jYqsVRrVxqJDE1AhY2/+YMkBWotE2aOn7Qhk3FhgAuq1ObEWy7gWmB+e3RPGdVFAaA
	 UmUXiaD1BnBE4UbZ6/7TdEVdjMWn2uAOXIJhWR+NH7LYweZX7vRK1h+lrb3ev1XiBC
	 C6Rpr2RYQ3cHw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1789B17E091A;
	Wed, 16 Sep 2026 13:08:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v9 01/13] dt-bindings: display: mediatek: dsc: Add MT8196 compatible
Date: Wed, 16 Sep 2026 13:08:13 +0200
Message-ID: <20260916110825.102631-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for the Display Stream Compression (DSC) IP found
in the display controller of the MT8196 SoC.

This IP is compatible with the one found in MT8195.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index a5b88eb97e3b..c8b3e86943e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -23,7 +23,9 @@ properties:
       - enum:
           - mediatek,mt8195-disp-dsc
       - items:
-          - const: mediatek,mt8188-disp-dsc
+          - enum:
+              - mediatek,mt8188-disp-dsc
+              - mediatek,mt8196-disp-dsc
           - const: mediatek,mt8195-disp-dsc
 
   reg:
-- 
2.55.0

