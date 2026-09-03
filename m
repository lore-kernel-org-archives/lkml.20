Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA346C4A3;
	Thu,  3 Sep 2026 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426403; cv=none; b=JAf3EXED7u8R/jNYgtk4t5VmPnXSaAbfmxRzDyJzKrS76FAAXZbgAitiOA9Ltx0ZseLdV4j6nPembSHiSPs/rHLWj3bjRQ4aWY0YRte0BKJZCOx0wmgTiN1In/frXinQ0JO2RGbJlKBi3AHH5XF/G9k+fcLz0Eqsn7bRaHCnMYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426403; c=relaxed/simple;
	bh=Q+55AniAlsI3ipWtLCDY3rhuhBHz7r/Jp7FtBdo39TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enBN+EA8kFgXVrOwZVymT6Ik5lKmAKrPJAuIqQX+sOcloCJPe9crK4ubHsOAaFxTj2nmQGmgOKNv5ytI4vrvcSRYLo0XzPbet3J+MYWVbYvqsPeMR2dNiXysdyGukpZ2X4ELF9Hj74XydrRmm/tpuqQIi2JW7nFT3/5ODa/9+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A0A1F000E9;
	Thu,  3 Sep 2026 09:06:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] dt-bindings: interrupt-controller: chrp,open-pic: Fix dangling reference
Date: Thu,  3 Sep 2026 11:06:30 +0200
Message-ID: <86dd3544f7286fc117dc7ad0f6d799761283ec54.1788426169.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788426169.git.geert+renesas@glider.be>
References: <cover.1788426169.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The target of "[1]" was lost during the conversion to json-schema.
Replace it by an inline reference.

Fixes: a241f1a1b338b714 ("dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/interrupt-controller/chrp,open-pic.yaml         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
index 5363f4c6ffbcfe4c..294af57a7c372145 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
@@ -12,8 +12,9 @@ maintainers:
 description:
   This binding specifies what properties must be available in the device tree
   representation of an Open PIC compliant interrupt controller.  This binding is
-  based on the binding defined for Open PIC in [1] and is a superset of that
-  binding.
+  based on the binding defined for Open PIC in the Devicetree Specification
+  (available from https://www.devicetree.org/specifications/) and is a superset
+  of that binding.
 
 properties:
   compatible:
-- 
2.43.0

