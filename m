Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468586;
	b=cEgJkZxHoq7XD/X7vEuK++voOMHds1LsD8EbqcpEvpm8TCY3eV+n63QnGsz9cNPyKiNi
	 hwYbAfpWzuO0ouDJWbG/f4jZyvhmTeTVPdRZ8oAY6w0Z0kzFuW5Vc384koPyQzVPkh1SQ
	 flJcGLbRAMle17nkmbScmAwu13B4Ubi2t9j6be3JGEnAIH+g0jWnTX70V6lRCusKQuwk1
	 n8XvYrOgqH1D40J8T/WOdbxBXh9v41AXMCet+0bPe6S46dQgL06/wRTjsVAutsii/YOtk
	 2BGE4AvbR1EqetDVUq2T9zVMyjaRocYdyLgLrfAGclriUVYVgCEZQu/GJo8/E4rJWqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EeCGyqkm0JqSOK4vQP3xUOcJ8X0Mgwj1dqLLK6KYn3E=;
	b=fxiURPBXhX0Fw5JN9iROBj+S79UxaQM/ecprtZ1Im8xzA/vfigS6oJMW117g0UrIQMtH
	 vITvCrHeTJgEyC0y755MzoBQ4cXNcR7LORnJiGfY2hkYoHw2ZarReNXcYQu6EwpvgY7r2
	 FQo5ztAkn8PJowHG6uuiznitgaAkdYmRo596kMaEh00zT7x1dFQ22PUoWSArHUmHSdqu2
	 aetaW6/dyJv410a91ii3Icz7pM5vSdyyYhmeaMxWufxMBmWswfcwwTjeAVWeeIj/aaOu5
	 wIin6BP+RcAOufn3uSFE/5sBt2GL2OWPoEWYgw1vrBEU1g96CQ8YfuN8SDVyN4MOEdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOmxHypx;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3AC606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3AC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOmxHypx
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so339153b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468585; x=1795073385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeCGyqkm0JqSOK4vQP3xUOcJ8X0Mgwj1dqLLK6KYn3E=;
        b=gOmxHypxd4O4PUIV8u4WBmDa9ZbYNZauWX/5z3f7n4qIiWsDVvKE5ksPpqLRja/Fx7
         syfnGKTMQKsemE9DYKzof9wMvwuaztIhowiACaT0TZDl2pOO81i/quJBa3z/LYcLeLFb
         LHLT3TGVFFu9puCuj5J7I9JfcDHOGL64+8CR7MaaFPNUfRBXnXAQC57Tm8yTM6qXapGi
         ShbuZ7OSvxHpcu/7LR3pJtuh50Q+rJ69QRVvanQmFu5dygF7+yJcjuuClLFJIrfc8bqC
         l1LgjEVXtzdnU0e25i2m6CSiRhIjPPcTq2p9iM6NWTrI8vjlOl6RkQIiXUNbYY7i20HI
         l0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468585; x=1795073385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeCGyqkm0JqSOK4vQP3xUOcJ8X0Mgwj1dqLLK6KYn3E=;
        b=0rM5csvieTRQeHw2YNWFsW1X4UMwLCEJ8EX7qazFxAtwWW5xCdPpy7IUSBYF7XGSGC
         yYurQjkVSfh7ORxqw/TJjkLqxEM3B9EIUG8+8RJ4YzTVciCPJGZ9S/fGQQ/KKL9eSyZf
         zUoFU8fEyPxdEN+O/ZfUk+s6V6ufk099ApHdMCUGYyhcaFFo/85uJNLDICPywPJ8jKXH
         9+rYa0k7MfM6qWAEDCPbX0Ae7VhjbXuNNJoeLOexJCrmL1xKdZDwe7XwHBGxIrDgsaY4
         xCvCNx/4uKs+gAwW9elM9ukkLMBFh628rkEqeBs7QqwkLSww6Yh8d3Zl8xWXMody5Tr+
         M/AQ==
X-Forwarded-Encrypted: i=1; AL+hErF0ZTC+82hsOx/G0celJ5nqBFjL6SXtDIKx8regFQf/2TGPHQD+Ab1sEq2O8qOmoO3Dlsd+rANm4ynN3PE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ggs9COL81hkhZzEgg/FMQTUy5Dm/I1lka6unMfUA2XeYu+fhm
	wtA0Lm+RpXFITAxy4XtBfnWgmlu1faVC1IYWgbKy29RwSYZkdiwCyC+p
X-Gm-Gg: AYBFou1xlacV/25RllgWu04NZoSXo3LU5dmdY7m9FoaHtDyvoH9GmTMRv0oy/mjyA52
	usgA4ekQLImY3RWIvKtQxFfviu566jszTt0kYp6E2EOMl0Bk+8W+nR+7cjmAvaOmKPu72jBEqEY
	CRO6ljsMuEyIOszUp+Jr7RGc5EVJEiw0wEB+edBl0w2lYewK4SXl7axOPow41vz8aezo9pbElrc
	BsLgHHnWRn7HYxDLEA8SIj/AQQhZn2Xcal4bJAuGDezWoPZB6d9jN7VmoDkpAWmpV/ZOc/iaW2s
	aBQNxZaOVOG5L4/Pdd6Pk7OAVvhEQVmOZSxpWtbpFBGS8VWzHEJJI/KUoOR1/ypNDHQuDU1HmnJ
	DojvUBX65OQUnxB9SIWRQFGDwlgM0BBo6sXCVZMCv483Z7rgB7CAcymhGMEWSknn1NEluSieeah
	78OFr2jPyUcWmpf2pmnTr33HDc/7dOCSc4SixAmxnCGxmz0NntyVlLX//abS6T9pLsvCWM0lwmy
	WlF2wcI+lBg1LB15MFhQ6ITtGeNXfrRxWG8Z7MjyzkcHYFnaUPGWzB68xNFWEpyE2YlbuqQ9cLj
	VA0XSbAT7WeHDOJhNif4oDgC+L/1iTaVWglZ6Z2E9IjUDbmiN8dScsy3AtAa
X-Received: by 2002:a05:6a00:451a:b0:8a9:b07c:7709 with SMTP id d2e1a72fcca58-8bd5cd78ad6mr1206200b3a.19.1794468585366;
        Wed, 11 Nov 2026 23:29:45 -0800 (PST)
Received: from shaunak ([43.242.208.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dd5b4sm2980797b3a.53.2026.11.11.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:44 -0800 (PST)
From: Shaunak Datar <shaunakkdatar@gmail.com>
To: rafael@kernel.org
Cc: daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaunak Datar <shaunakkdatar@gmail.com>
Subject: [PATCH] dt-bindings: thermal: kirkwood-thermal: Convert to DT Schema
Date: Thu, 12 Nov 2026 12:59:25 +0530
Message-ID: <20261112072925.22075-1-shaunakkdatar@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Kirkwood thermal binding from the legacy text format to YAML
schema to enable validation with dtbs_check.

Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
---
 .../bindings/thermal/kirkwood-thermal.txt     | 15 ---------
 .../bindings/thermal/kirkwood-thermal.yaml    | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt b/Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
deleted file mode 100644
index 8c0f5eb86da7..000000000000
--- a/Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* Kirkwood Thermal
-
-This version is for Kirkwood 88F8262 & 88F6283 SoCs. Other kirkwoods
-don't contain a thermal sensor.
-
-Required properties:
-- compatible : "marvell,kirkwood-thermal"
-- reg : Address range of the thermal registers
-
-Example:
-
-	thermal@10078 {
-		compatible = "marvell,kirkwood-thermal";
-		reg = <0x10078 0x4>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml b/Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml
new file mode 100644
index 000000000000..1f9b97bdd48f
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/kirkwood-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kirkwood Thermal
+
+maintainers: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+description:
+  Thermal sensor present in the Marvell Kirkwood 88F8262 and 88F6283 SoCs.
+
+properties:
+  compatible:
+    const: marvell,kirkwood-thermal
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal@10078 {
+        compatible = "marvell,kirkwood-thermal";
+        reg = <0x10078 0x4>;
+    };
\ No newline at end of file
-- 
2.53.0

