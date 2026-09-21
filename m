Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515739D6E5;
	Mon, 21 Sep 2026 23:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033238; cv=none; b=JsO3CpsNL90Kl9+cGp6AnR0T7SqhqkVZU0u47XDwEJa1Vb1wNhapLscEoFFfW4RtAdJm59/4c4qIIdyfHprOYMSGkPW7gDCIP4ZGIzDRiF8kvhV6PJSitTK5qbywMh+o6WQ2+s4JC/uj/4EDhWo3I7uxzki8rVJ3psnu392mpOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033238; c=relaxed/simple;
	bh=Ao357iwZSA3eUXiCfHYj01nU93jGSa6IpSAQ/lvIjH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3TYD/5eXqNQEOfrHmiHbloxq2ex0FAcw/DJUZEwqH+Df52Uuih1Tvw3ZqnJGIlhnrUWucawpfpqmzDPkHGh0ucgCCYZgLngRuNlS661lFXAWx9AdoyZo/DD3jh7mb9X9TuwGsET3X3QtkXeNLSVXy68ycL80P8jLSNVSac5svw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QF0U6e5U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QF0U6e5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D8E1F00893;
	Mon, 21 Sep 2026 23:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033225;
	bh=kWMUlyFZDu5I4TJse0Xdw6ZZGOr5Zeuzgrz0NVyny6s=;
	h=From:To:Cc:Subject:Date;
	b=QF0U6e5UMUQmn70x5QvQwDdf8QBnhhnrccAiyGBGj5QAYMyTzrg6V0jQeNHoNyQ6Z
	 /bXYrD792nkvXIl88wePsep83P8ZXr216J4E33UNQ5VdK3V5U2QuiiW1cxVco8BLyd
	 JaRAOR+NghpC6IJ+9LwH0hFwuMrsw8+HXxYOepQeOncXGJZGlsvHRHZ0OGfZSyjGyc
	 5xUKvnbd8vYjmWhaTH+1YJ2Nsvzz0y+MH3MCLweRPJ+pIEwPAN6PxDkUeiYWAC+5xF
	 jslkhZmh7H7fK2olUFhWuvfQgdGjrbdBClGLdmcbJHNx0sPcls5nJgacVpMhJEkD3u
	 f9z/Gh5nzvazw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: mfd: Allow MT6360 interrupt flags
Date: Mon, 21 Sep 2026 18:27:00 -0500
Message-ID: <20260921232701.3133291-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT6360 interrupt controllers use either one interrupt cell or two
cells, with the optional second cell carrying trigger flags. Allow both
forms.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
index fb65abf30d57..828ed7f558f6 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
@@ -33,9 +33,10 @@ properties:
   interrupt-controller: true
 
   "#interrupt-cells":
-    const: 1
+    enum: [1, 2]
     description:
-      The first cell is the IRQ number.
+      The first cell is the IRQ number. The optional second cell is the IRQ
+      trigger type.
 
   regulators:
     $ref: /schemas/regulator/mt6360-regulator.yaml#
-- 
2.53.0

