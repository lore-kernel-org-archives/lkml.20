Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185274E235D;
	Fri,  2 Oct 2026 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961260; cv=none; b=IarmBgfu+8xzSQNVqk6gVlR92szk9euUk8ErQSmuj113ZuoY/dvYebaUYCgreY7sgD08Jwv3Nq6+qOql90tpApBr3xNjpZos0dxomkVoQ2N+2xUPXp7tDD/k7dENwfLUE715mib4WjU5U4pkkz7pgL/RB/8O4hUciQLWKt16esY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961260; c=relaxed/simple;
	bh=DUDTDjT29LOReQXW/Xdwm7adJdGY6SXaRuzQEQGSa4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G6UReX2f4k3YZhJIJUWCAgWrOVmeP05ntiiMFeQJPY0CvxIxe0OA7/VszkvJ5yOhejFfKCdg9wO208Z8GPJmG3nUIfqsCHVTSJTMBR9844kiw9GpuX0GqDplIfhOpZ8al/vor2GlijineDEbEAjerrJ0McuLRudiWsQ4q7ZQZ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6BFdJYR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6BFdJYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567471F000FF;
	Fri,  2 Oct 2026 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790961258;
	bh=cAzsj1EhJdaSpgCSGTta8uyD5ssYKgRF2FnxxSAySmU=;
	h=From:To:Cc:Subject:Date;
	b=H6BFdJYRiHACkVcJo7Ki9EEl94P9hXt4OXUbc0Gpf1oFzXbzGZVIk2NS1BztqPQv+
	 /qxPDdIwXKqiCSHO3zKmjCruRdObQ8koQWBxsVNaeIYp5hLHZqwHxzojTN4Eu+suCQ
	 jOxFk03hJsARG/vCU4dHs2P/ku8p1ANEZjszcbNWpcSr3o3LGswJW+sGK9RuMqmSzs
	 B+orhj0y6cTB0gjtfQGsLC62H4JvaSc5CkRPNSLdm7ON/gHAvQrlw774FGihqlqt0M
	 ABd7qlgh0+XT6bEvlUTUrDRmv1Rov3Fx0xUEzNDVF1d2Eaxs7roEvhha7XqO4tTAr6
	 QimKtAtGNF9SQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: reset: Drop obsolete STM32(MP1) RCC bindings
Date: Fri,  2 Oct 2026 12:14:10 -0500
Message-ID: <20261002171412.2716314-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The STM32 RCC bindings are replaced with schemas already. Drop the
obsolete .txt bindings.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt    | 6 ------
 Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt | 6 ------
 2 files changed, 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt

diff --git a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
deleted file mode 100644
index 384035e8e60b..000000000000
--- a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-STMicroelectronics STM32 Peripheral Reset Controller
-====================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please see Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
diff --git a/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt b/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
deleted file mode 100644
index 2880d5dda95e..000000000000
--- a/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-STMicroelectronics STM32MP1 Peripheral Reset Controller
-=======================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please see Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
-- 
2.53.0

