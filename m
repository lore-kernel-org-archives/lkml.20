Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095EC48988B;
	Mon, 21 Sep 2026 23:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033122; cv=none; b=LaBgzWSKHiQuqdeUNRct/j+5QyVYqhd7fFuKcYfUBYB/u9SXOxhKQCSi1et/lGd9PN0p10ofB+MbP4ydniNJSupuXR3S9R7E0SQa6t5s+7og3SMQWC+MN5DPwh5K2XJtHuKt3tjNO05wgsVD1Y+XBpoyOEdgVTlX35iVtDNHouM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033122; c=relaxed/simple;
	bh=YU8iaA+ixpRMQbVKH1kPE3/obTRgVglJHc+Z4BhJHQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMmk//ypBbtiC6ruemZ8Fu5tUsM9orr+cV58nGtOfCiUYJp0CTg/vFO3ciYjntY0T6nbr7813EHtwqc34i9Z4SUU6iZAR14hrv8K/RzNyJWIoKD4yeJq3evNayFogi8IUN79OYANmh6snvA8FZjhjiLSAJaSJXZo0XY5ocyaStM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtCBmMFr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtCBmMFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FB51F000FF;
	Mon, 21 Sep 2026 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033116;
	bh=/mwvJJ48KJ79alahAyG/O70Ja8d6mr3ftuTV3beVAvg=;
	h=From:To:Cc:Subject:Date;
	b=AtCBmMFrclopjlXd0UPY2nOEpxHmRGnJR36GDDl+ziKLOZ/3SY0l7XgjHtQL7gAMZ
	 azfDL78kA17Ac0n0KzD0HEh6INoVOpZcTDHlD//EWJguSZJeA1JDHwysMahvqsm6Sh
	 UtK62ODTCynYPDD6ROtdK9aFI0vc9bf36bgFpMebrUPOxEWXT44GOJkxHZMpC8xQA1
	 fNyEnhhV48M1XL+fi0LBLBdYzGeMiRWs9Xf/QUJfKUvQovBLY7HKN3NY/zRbqMH5av
	 LcknVuv7tEEMZhtbFR8vDkrKWWp9NEQtPtm4Sydz0FdIc4uwRHYo3IMg4w5uiplT4T
	 yBMtDiHuLXp8g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: nuvoton: Fix NPCM845 GCR compatibles
Date: Mon, 21 Sep 2026 18:25:08 -0500
Message-ID: <20260921232509.3126844-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton NPCM845 GCR doesn't have any child nodes and therefore isn't
a simple-mfd device, so drop the compatible for it. This matches the DTS
files.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml
index 23e7e4ea01ff..9f6f009ec991 100644
--- a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml
+++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml
@@ -17,13 +17,17 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - nuvoton,wpcm450-gcr
-          - nuvoton,npcm750-gcr
-          - nuvoton,npcm845-gcr
-      - const: syscon
-      - const: simple-mfd
+    oneOf:
+      - items:
+          - enum:
+              - nuvoton,npcm845-gcr
+          - const: syscon
+      - items:
+          - enum:
+              - nuvoton,wpcm450-gcr
+              - nuvoton,npcm750-gcr
+          - const: syscon
+          - const: simple-mfd
 
   reg:
     maxItems: 1
-- 
2.53.0

