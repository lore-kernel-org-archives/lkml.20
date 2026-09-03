Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8E39060A;
	Thu,  3 Sep 2026 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426401; cv=none; b=K8+HW0JaTy2K0Z/M7QeEf12JtEvlLZx+PS5gpnynT2UEGSU/9foBjXDJpsh+ECvFs3cYUaGKIuuM4aR3LRjrVx14/Z4NSFbwaDXNLLZJ9By29vbsN83ksXdSWu/0fG76NL8Sf+Ux/T5D6vgWrHz2X76hUvLYaUAktx0fNMx7kzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426401; c=relaxed/simple;
	bh=u4iGjar6bn8Lvh9PQHV7dttFtTzigdiCq4bcyI1D6u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXHmz6N0V+wZD85gNXEe49qDob2hr13ZtXKV+oPzygd7PdsamIAFbIfwir3idJ0Pd8vd8eacP6MAfq8L15h1B9AxCaSjv3lmJQb8H1jOUCip3dJX/lmfLw68KPQsr+PERSkwHkCMHLeQlMUtSIZMqeMGXnK7DB64qoLyAG5qlqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688061F00A3A;
	Thu,  3 Sep 2026 09:06:37 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: chrp,open-pic: Typo s/pci/pic/
Date: Thu,  3 Sep 2026 11:06:29 +0200
Message-ID: <f2cc11922b3e5dd73997ef8c673137951d3fe715.1788426169.git.geert+renesas@glider.be>
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

The device_type for an OpenPIC node is "open-pic", not "open-pci".

Fixes: a241f1a1b338b714 ("dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/interrupt-controller/chrp,open-pic.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
index 642738512f3ce1a9..5363f4c6ffbcfe4c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
@@ -24,7 +24,7 @@ properties:
       - const: chrp,open-pic
 
   device_type:
-    const: open-pci
+    const: open-pic
     deprecated: true
 
   reg:
-- 
2.43.0

