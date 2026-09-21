Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFE747CA90;
	Mon, 21 Sep 2026 23:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033138; cv=none; b=tHFrlDTN0/07rPkqMKdwY1aXFm10K3Udoz3+oe22TviKv7VgwdWaFBGLQKULGdO+Kjil/McyYJsFw/0OlJR2lQ613dOz1CeODIwUdm8ryTioo6NGhNeT/Jk64YuBOF+lZjPUh8P+hXtCopvQQiWF/n0hANdSspPYy20hkG9SIkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033138; c=relaxed/simple;
	bh=B+L4oXR7h803QZApDavNhOgbBDI8UT+OOIjVDrYbs8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/0iXm1O6uIypceIxKIhFKBX0WWpSruWcN5apCGoL6H8rlehVCdKLYucfNGo8S1E85yD/QBhGvRgyfqz17j9lVQGXkkrnLBkKErg+xwbo1Q+g8Vr706CAhk+Cz1l3iRnTv67UE10xNBQLjTptwZStO1rgThFfWzrKTCOhS55M9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TthKSZEu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TthKSZEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B941F00898;
	Mon, 21 Sep 2026 23:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033130;
	bh=ubTLm44ATjRdGaaOewajLt92Nruc3KcRR6dVN/XSnfY=;
	h=From:To:Cc:Subject:Date;
	b=TthKSZEupVZgXPFzhqsbG9+b0c3xFYy1kyHb0aTTY8UQh0lQOV0lu+hQKip3t119q
	 xQka+GQkFHdWFSPHjJDiRW0yrfphPyhp7nCA/GEmv5m1aLXlKxNcy3WuZD7ZtXxmc9
	 7dBsLOLdGPP+mpx/ZO7ncWcIADkpARQ07nrN3KheFp0DyHg4oo2D3NMuItdC5TnwRy
	 iS40ZhEAZ/afYcC21GGvIem+oxJ2u1r1HyLAo+tqotfpWzbsATDrDFq6hSJ2aQnV3H
	 rpZf1eoQIQ2WlahJHIifi6BNkw/p9957Yc3gGlr19Gq0MrbuP7hUz55wg9OCJkPjAJ
	 qYMY2koIn7VAA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: soc: mediatek: Allow pwrap regs
Date: Mon, 21 Sep 2026 18:25:26 -0500
Message-ID: <20260921232527.3127894-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT7622 PMIC wrapper has a regulators child node. Add the child
schema reference so regulator subnodes are evaluated by the MT6380
regulator binding instead of being rejected.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..79b755858bad 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -105,6 +105,9 @@ properties:
   pmic:
     type: object
 
+  regulators:
+    $ref: /schemas/regulator/mediatek,mt6380-regulator.yaml#
+
 required:
   - compatible
   - reg
-- 
2.53.0

