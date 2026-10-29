Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309133;
	b=yJhoZ/TnFUap+iS1G4j6ImbgTLllZ6WGWB6qaLaC3HQW/B+hUCXRXuapg2nRbS1BIwEt
	 vpkN3AE/+zqcFKzxHcwoRhPv4xqa7418tO/HqFRm1eO5nhUcz37uYrqqQEMqzkz4Q0IxH
	 XyJs2ZqQwTd6kZ3onEgjCJ4giQA98cmAClFVA0oNSDm5Oui8J+Bczj6gq/zyZE9Nl5XfB
	 K6JvHRqftqD3/XlVRGEH8DaI85NSqa6S8/KDgbVyea7xoYGRRhWnoBL+QS+kmq+hNggHx
	 LL2VQgIiPktDRJw23FAJamX/E98ua2nVJPFT4AnBT9lL2LQNgXJzL6DkcIz8yp37pbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309133;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xItqMuf2hx/dI3+KyoiZy/IYYq4i2pAiSjeOl4VY+ro=;
	b=J/GdIZA6ozFv56CGLlHx9/VlAorcSR5sssZx9QW1+FY+7q7N8lNAphMUkK5p7/BY5Px7
	 hygaDIJhRy67vyscQDGF6r7dvks3rCxtrM2cDIuUngMx/iIKmFeVp6Pk0KEeiUsx6r72n
	 vg503jlftOWPAVO5tMy3rqdPDJ+jRnvYUBoss1xLIo4Mry8vGATy1pJsr/KCtDxLB+0hj
	 oJIEmOHu3hhwrswJjnQ6cYCjFi0UD89TTRTU3j2G0WZbDQpSujYKzJhPpe6vqt03Xx/By
	 W02WedFFTgQtA5qjVuYvDXpzLb36XCSp9o8hgoTFcKKOZMQ8lrP+S1pAQltc3u3GsTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OTmWrP1k;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D421606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D421606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OTmWrP1k
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so36889a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309132; x=1793913932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xItqMuf2hx/dI3+KyoiZy/IYYq4i2pAiSjeOl4VY+ro=;
        b=PoVT4UKqC2K9qBO5HM7/sr+Y3S1iqVzbtJGI+natFGlk2Ga1MRuTjN4zc7nhW6U0L7
         T4Z+3ie4QiYlOax9qAjQNRYK8lkmBuuQUEAEspc9beacpFDBZEtGccYEK4zyx2En1weV
         6zMVFkUkeUX9BQ9yZH4IFwY5vAgq3L/v9rB0aLmFfSDIBN60X8BCyERaGYJUciO8jeEh
         IM7zz+AOyTJYp+2sEF1aGuYnsbs5qvj0VDMpGd9QeE4hK2dfDdXyKjWg27NlaJJKqH8z
         ns67sq8SO8U7W70yS2Nra0iQOI56JFq+b4EVXEcIBuvKHBO55DaFmKKwA2Usf/r7ttk0
         a+6g==
X-Gm-Message-State: AFq9FYJdPyGLb5M806J3DQLS9Wpm9DRHkfVWfVWf2PPfhamlmMOWlCmG
	VkzwZfPcOsKvM5EjsocJYY9XhNGaFHIQ2CCKFQUFvchNNGy6nuRIa+GU0/1torf/491ioaFzj0v
	RUiboFGBjszsS//8Igv7p6Vzt67g+CcQ0gC7UrKhh2WQ9i2Oalt4vQKRonyMToVMU0wTq5I4jRg
	utf4NQfW8MM9UlvEZYMyIc0m3jQWGjSRjCQ50TOAqhlJJbT/83KQxGL/M8DEHj3zm2lIaJDiRlh
	IAcE2gowvxBGQyNYnklyeIN
X-Gm-Gg: AYBFou14k0ZtOUFQz6Rfu7+I4Hg78hh//7tDK/lNiw0tS9NzWVylgDMQP9Ndxqsft51
	ld7zlhlo+iI4st4IB4k/NU4wBwxwIeV32sRP2LMmYNTT7+MFaAOVnivib+UoQKa9NgvLJQWML7L
	LI+7FeuCFahXdWOqBXgtbQl3I+0vYeBe9hsXBmxV5NwkDzy1C6+61Q48fZRPu2Np7D0CHbydvrt
	MLgurAzoW8XlUH0V5Vv/lTXGATaUOMLTfkIKSv+7hvlhA15AanfamiNVuZpJcxMur4DfbrIXGdO
	DdB59+Q1j8KbMPgZ8yGCoDMh5pnEuNnCG2uJamcjSbRstrdiXrqWsR7H4lrxxDcnDWzRRpGPp/f
	Xig3Rm/VscEJclzJ1Uh7TxcJS+SSZHl4Y+1I1fEfmcioMrfyIV/wk9FdkGilyhPUMWmOhYO3zNQ
	9dQ1dzMu+qFtxpR9Ug+dZ8bUBOHl670p3/a8R/MW+Z
X-Received: by 2002:a17:90b:562d:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3ae898149d4mr165815a91.26.1793309132425;
        Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e8b50f9sm2916134a91.8.2026.10.29.14.25.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso428688685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309130; x=1793913930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xItqMuf2hx/dI3+KyoiZy/IYYq4i2pAiSjeOl4VY+ro=;
        b=OTmWrP1kjFm7yan0E7zpJBlaxh6277d6lG2JwP1CzTSOTp9K5HyT0238nwP4+7H9vv
         t7ClBnq2jOSJXstLYqyNXRKF57xxHVomWELO+8azNuZgSdgro2Lj0OQNl1YML+VD5Bor
         sklx1dFDgzRkQhJ7JrQLJG41kpF3xRySoCoeo=
X-Received: by 2002:a05:620a:404d:b0:93e:c691:a1c with SMTP id af79cd13be357-94421850adbmr65337385a.76.1793309130173;
        Thu, 29 Oct 2026 14:25:30 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:93e:c691:a1c with SMTP id af79cd13be357-94421850adbmr65332385a.76.1793309129450;
        Thu, 29 Oct 2026 14:25:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
Date: Thu, 29 Oct 2026 14:25:09 -0700
Message-ID: <20261029212513.4126083-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Northstar Plus uses the SATA IDM block to enable the interface clock and
deassert the core reset before accessing the controller registers.

Allow an optional third register region named "idm" for the NSP
controller. Keep other compatibles limited to their existing two
register regions and allow older NSP descriptions without the IDM.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/ata/brcm,sata-brcm.yaml          | 57 ++++++++++++-------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
index fe7f091e744f..9a48f7e36fcd 100644
--- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
+++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
@@ -13,9 +13,6 @@ description:
 maintainers:
   - Florian Fainelli <f.fainelli@gmail.com>
 
-allOf:
-  - $ref: ahci-common.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -30,32 +27,19 @@ properties:
           - const: brcm,bcm-nsp-ahci
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reg-names:
+    minItems: 2
     items:
       - const: ahci
       - const: top-ctrl
+      - const: idm
 
   interrupts:
     maxItems: 1
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - brcm,bcm7216-ahci
-          - brcm,bcm63138-ahci
-then:
-  properties:
-    resets:
-      maxItems: 1
-    reset-names:
-      enum:
-        - rescal
-        - ahci
-
 required:
   - compatible
   - reg
@@ -63,6 +47,39 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+allOf:
+  - $ref: ahci-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm-nsp-ahci
+    then:
+      properties:
+        reg:
+          description: AHCI, top control and optional IDM register regions
+    else:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm7216-ahci
+              - brcm,bcm63138-ahci
+    then:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          enum:
+            - rescal
+            - ahci
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

