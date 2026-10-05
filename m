Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068DE4C7525;
	Mon,  5 Oct 2026 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215067; cv=none; b=DH6/5CtH9d27Qw7i4mVIoVYuvzzU7lXFwC6zkWyCdGGt/SNKHl4ViRfYnR2taDE50DVD8AtuQLhslGaRqiHp5gRA34HH/Rej+DdsVtZjt8PaEFO2EO1hA5iIfs5mEIVlDt6Pm0o1ql37VTk/Ldc3aY4SL8Ih/6IiOF1m85qWNHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215067; c=relaxed/simple;
	bh=+FHpiIUFAqiJKCGXpW2AO2dbf8RVqRuK7LrmLPoezYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuPBzR2gQfRJIG1fi271vXG6MMhwqKI/kT8pW7OEC1+U4rzep1Bzppo3eCwd4+DBVPqkxkD58gh/xPCnWWP1ng7Bo4/ZLwgY7sMqKCFUFOLa5l67zuL22buWnf3AeNiQrk6zhLDYM35KRpq9RuiYB4i8wHF3f+P/vkP6fpsdDWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKsy63/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKsy63/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1147F1F00893;
	Mon,  5 Oct 2026 15:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215064;
	bh=DqDJogYpgQ3jah0rAOAnF+gLRYHGFjmYGPMIhElTFIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YKsy63/aDAey26QsfWa2amcXZhztspcU8MlsPcUvQ+jDf7xbzRxwODv440s7CJqSz
	 6v6FBABURMTxBZPtrmyAc6dgzznxyRMFMraMu1G5LWtLfV+t4dgOU/9AVEu7i5WsjL
	 L/xzdgBxtRPQrAIPVLiL4xvdEgb6M+3WfaUTjpbZv+Gz9E8pR2zL/KmpetFGlZjulr
	 tIniM6C7IOXZPFOgyH0kCRhB1pbm8LPiBVHHuu9TJ/kZEAzInRzMf3zdLYEX5rKMRr
	 GevrWdEb/gVfFaIulUb81yiCqNF4Sha/LmXmFPAAc0aJE/q6Nd5RB7IILH+29KQEgT
	 jLQ2jcFDOkDuA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: i3c: dw: support up to two reset lines
Date: Mon,  5 Oct 2026 23:24:23 +0800
Message-ID: <20261005152425.25319-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261005152425.25319-1-jszhang@kernel.org>
References: <20261005152425.25319-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synopsys DesignWare I3C master controller can have multiple reset
lines, such as core reset, apb reset, and dma reset.

Update the DT binding documentation to increase maxItems for the resets
property to 2.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml  | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index dc7ee38001d6..6da7d90caa3e 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -12,6 +12,16 @@ maintainers:
 allOf:
   - $ref: i3c.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: altr,agilex5-dw-i3c-master
+    then:
+      properties:
+        resets:
+          maxItems: 1
+
 properties:
   compatible:
     oneOf:
@@ -39,7 +49,7 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
-- 
2.53.0

