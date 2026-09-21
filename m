Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D4448988B;
	Mon, 21 Sep 2026 23:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033313; cv=none; b=tquDK7BSGGC6zLfa27oxV1ZIrdjAygs9XoOSkNbc/C9KEcTj3JaC+HX3r5e4Kd1yHMo+2iw9hMmpvMG//9aGg54ra0rmoSv+pLacATcgSbnxjTK1vOEoUoW+uT4nNSZDB3zdOhUlbAKTRostMBJ3e7rhYFOUzmnar4FTV9UGHZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033313; c=relaxed/simple;
	bh=ng5+diCyg8PNAA5LOmAaEul+3zb+gC5v3dRe2xnBQMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OK0gwDoI4tpJakal5xfZ25/YYF4MjdeA7ny5uBwbosiJ9SYnW8Knd3lPrzjRHRMQZ9mnrsBpIZ9bM58D75BE+IgHvssollXnu2+yx+3qt6VnRRH3pETLMhX7CLHbAIKCpasczBnvuEFOwrIjGXyEumH/RrTaErdmC/QR+u2BgoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbZIen5t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbZIen5t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26FD1F000FF;
	Mon, 21 Sep 2026 23:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033303;
	bh=QrsjZJ1TM+xQCAvXHKD26PYxlrRKofHOjYGm45CcmYw=;
	h=From:To:Cc:Subject:Date;
	b=lbZIen5tt1hGAOqFoQ8gbT3A3tDJFe8wY/s5i+YLS9qwhb2nd9Fo2QaQmPZWPSq2F
	 XCP+xCOvDdO4BZQz7Iz45Qhci3dq/DOnj5FoI6SPMwgIdDaDbrwtusq3+IXWe7bp8g
	 hzqWYiGO56z1/KoWKZrdY8Hwy4oAUM5kONe8TpldMfHW+S6iorAXJdqlIgg3jERwqS
	 459KtU5mAdbq8yifyGb+7gFlUTXd9nlB6K2x/dEHQXPOnWnZ83mUHFCBEiH0w4aU/K
	 /x1rbqO+RAQefJTbSX2zdh+vF8zJhp/CtSnzVy2DItscFHcLCGGZyH8zxojyxjOV/l
	 83OKRIrtHiUVQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eugen Hristev <ehristev@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: arm: mediatek: Fix MT6779 audsys compatible
Date: Mon, 21 Sep 2026 18:28:18 -0500
Message-ID: <20260921232819.3137721-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The correct name for the MediaTek MT6779 audsys compatible is
"mediatek,mt6779-audio", not "mediatek,mt6779-audsys". The original .txt
binding was correct.

Fixes: e97c618234d9 ("dt-bindings: arm: mediatek: convert audsys and mt2701-afe-pcm to yaml")
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,audsys.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
index 9aa39b002361..5ede7d277488 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
@@ -19,7 +19,7 @@ properties:
           - enum:
               - mediatek,mt2701-audsys
               - mediatek,mt6765-audsys
-              - mediatek,mt6779-audsys
+              - mediatek,mt6779-audio
               - mediatek,mt7622-audsys
               - mediatek,mt8167-audsys
               - mediatek,mt8173-audsys
-- 
2.53.0

