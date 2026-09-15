Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57471370D71;
	Tue, 15 Sep 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461723; cv=none; b=CtFkVZYmP9CuNPr0LiQQAg98bU/WjrWVzNVJDstx8vUXeDXAhqeGI8tARrU3JwkzY9r18P3Iojcbv2moS9Cxtw3bkGqwKe62I73/8sgWDZOrlsuwAJaA+/56M7IGmrCnDHuRrxoklWXBGbhjayQDO2bKVay218K49ZB/EXc8hP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461723; c=relaxed/simple;
	bh=mvbGJKU7g8urQTzwwQuSXtCvZqjpvJmauyF4amfDJEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTRskXpc6tPyA2FAOvzZKS+bUQDWle4hR9QEiGug2h9Fsungco1DNKj8d7IN1tplZqcP04YBqYUaSa27AnO88hhNgqsadaioxLig5LtxZ/dOslu/WHA21e47KL9QBvCCbkrsdd9PBxCP0b9VKa79caGzrPO0zq0qiNn8/aHFBrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HoZaf1qw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HoZaf1qw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461719;
	bh=mvbGJKU7g8urQTzwwQuSXtCvZqjpvJmauyF4amfDJEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HoZaf1qwQrMpmVncFwrCnPtV5S3mIecl+tpw051P6gbMK9m6rLVgtGQSo6KeSMeae
	 KmgrjF2x2dfxCfRVw4o8ioa1nw+cjXbiDkxcHbLUKDFG9uCaX7jFwWeFYy/d7pHNEB
	 O5HHvRVVyLAvDJnRkSdCjQIdpCfs+it6vhIEnb/l6x2r1L0YY1tXhjm4XmRQLs1H7T
	 5rIFGazTWDEjgoCwd9V/T5EOIHJ3457qB+MfpTRmCvg6rKpOjJy3yQlKoUNhCoSImw
	 Ggrm+wYrKrY1uUGBLzLCwJ0ZlcDqtKm5HXNWx/DVAfoCFvuM2xWtAhzWG6C2xVgQMq
	 90JOYvjiH5WQA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A11B417E0CFC;
	Tue, 15 Sep 2026 10:41:57 +0200 (CEST)
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
Subject: [PATCH v8 01/13] dt-bindings: display: mediatek: dsc: Add MT8196 compatible
Date: Tue, 15 Sep 2026 10:41:36 +0200
Message-ID: <20260915084148.11385-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
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

