Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1025563FAC;
	Wed, 23 Sep 2026 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190934; cv=none; b=kzjGnO2sm0anv0QSXvod9xHnbNW4J5xRH9qrE+ac5CmsRS6pzeFRuncQk/USHzKWB3SZ5Q3AefCWTGOb/Sb/D1/2LxDs49/Zq1c71C/iAg9ItBpa3Ufg+T6Tz8XAsQ826jy0HHQJPDbcvR1zi706ZFobiw1vW+FZfIjuQF0iYL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190934; c=relaxed/simple;
	bh=oeijPDW7ZlETWylfvc26Sz9VFOx+BKzExJbzEehppEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PXNOUH+MXy728uDB8xk5uEFvad0C44uCsJHnKLASbTKYDJyv+IOjKhvKF3uPF7AZPfcq9k5CIDL2EWRtuhqpXQAH29EgGyFt++NMVa7kU77gkHtCA/Y5xz71ELnX3J35GvVXtNI0KkHB5cuRklFkL7oYoTv+6kBB7X2bxldOYuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYCZQfKE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYCZQfKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1891F000FF;
	Wed, 23 Sep 2026 19:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790190932;
	bh=cehW5GrwsD7yes8LLEkGEJCjhaf1Rwv10rPDDDJmHHk=;
	h=From:To:Cc:Subject:Date;
	b=EYCZQfKErM7wrbO4DOc/1WzS+I3eLDYId4bApcPhXPHvv1l3nka5NBUWGg9NDEHrp
	 slOQ8AYzgZwo9uG9L8PqTp7YUqhdjlLHU2akyRKBUlxwETrTCi+4sao/NrnSZys6VN
	 lGhK0Hp5uiijyxjGSMx7lgoewsp4ls/ufXUw6GKzDwW+q3tttuE4NsmXVfJ0GXxMSz
	 xxJoO9hYT10/vtmbTWg4nxcgwQsuKJ8KcLsQRozoqdF6X5ikaCNT1MSVjVlmvU4EvT
	 C3bb2TCtLSpNpuyyipU+RS4O9KhcSPWlkG3nvvF6KS8TyBdJoYDF4ATkkIRdgytB/h
	 ERWKOGygFIJiQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
Date: Wed, 23 Sep 2026 14:15:25 -0500
Message-ID: <20260923191526.2206628-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
and matched by the Hi6421 SPMI PMIC driver.

Assisted-by: LLM
Fixes: dee8a4e807dc ("dt-bindings: mfd: Convert hisilicon,hi6421-pmic to DT schema")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Drop "gpios" addition.
---
 .../devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index 6a824351834e..0dd37c40eeff 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -24,7 +24,7 @@ properties:
     pattern: "pmic@[0-9a-f]"
 
   compatible:
-    const: hisilicon,hi6421v600-spmi
+    const: hisilicon,hi6421-spmi
 
   reg:
     maxItems: 1
@@ -66,7 +66,7 @@ examples:
         #size-cells = <0>;
 
         pmic@0 {
-            compatible = "hisilicon,hi6421v600-spmi";
+            compatible = "hisilicon,hi6421-spmi";
             reg = <0 SPMI_USID>;
 
             #interrupt-cells = <2>;
-- 
2.53.0

