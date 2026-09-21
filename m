Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6475D47F3AC;
	Mon, 21 Sep 2026 23:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033217; cv=none; b=JQE6jUBukOMgC19PAo3DWIMN4l8EjqrwMoJoipXLg+NRKSvf3B0+MMl7t1SyR8cR4abCfBdVbYx2n4DooVQPhtmSJ9To6aZ7hOrNP6QD+zZ9Mjqh8UNMB65+8Kf1vJ+tr+1AoQEF1Pe/EkciLJuzCQjNEpRbKuEvR77e4OjJosE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033217; c=relaxed/simple;
	bh=qUu1tixUJ+nzZLxZJ5m3xuMM0uK7ea+9POwgqAbiad0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHYf30dBwwJJ0olWeSg7zc00xW52IWGIK43oH6e7VAHixRylIaX1AIL5M0AHG72s2lYZeL2gMGGEZmTgMoSMbbKem903d88pcsLt4hoYfrsFIuZ6P1VVttTkG2EmXn4vvLK2dANNbvQtv3vcaYE+B6h7fK1SiL+QG/lcmbDQ2Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZUnQsMH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZUnQsMH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D521F00893;
	Mon, 21 Sep 2026 23:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033204;
	bh=d5HPZjUise0qlSGegrOQwgvpW+DXll4Xp09lf+BrsqQ=;
	h=From:To:Cc:Subject:Date;
	b=FZUnQsMHj7+woUMN7iJUI0utWMr85BXZtrAycQ4/QJEh/6O1A6UHrUHwUhv9ES57z
	 s3ZBm/VvdXq/g4YRMvmFW6zsrZrWhn/MifRMwnAvhPUt0IhmBedIIS2O8rGpDuAAaz
	 5W1xgs+Coeo5eFmdmr7xc95gXEsCIuNagUh0lCAdt0SiIIaP6Cbc+Waydh8QNk/cS9
	 HwD/QYWkiAvR/cr4n25HDHBfkGQTztLCT4zkPU4EeWQssRmtb49e1lpwaalmn30K11
	 iHI8w/PgG3V5z7gMu1G1yIGilflWfaFKvo/XeaRUWlyvbhRFAf3RkJUtbOHIfUdCZw
	 ZWjAhKokwDQ1Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Renner Berthing <kernel@esmil.dk>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: ti,tps65086: Make regulators optional
Date: Mon, 21 Sep 2026 18:26:38 -0500
Message-ID: <20260921232639.3132083-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS65086 MFD driver adds the regulator child device
unconditionally, and the regulator driver registers the regulators
from the parent node even when there is no regulators child node
containing init data.

Do not require the regulators container in the binding. Existing
ZynqMP boards that only describe the PMIC core and GPIO function are
valid without regulator init data.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/ti,tps65086.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65086.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65086.yaml
index a8eed9065d96..64f02d1e1e4d 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65086.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65086.yaml
@@ -90,7 +90,6 @@ required:
   - reg
   - gpio-controller
   - '#gpio-cells'
-  - regulators
 
 examples:
   - |
-- 
2.53.0

