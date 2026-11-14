Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655347;
	b=fSpb8wh5RmoUf9lV+IigMX0gnBlaRx0lBbuGHdS/ZPxBFqZLwRkKn1cE2iCCJpf1+fQR
	 P2ytvqHgyZvMteFNEuidOYI7fzYZgwfFpBKaWcs4Hv4UylwWMwu8b+C7Ijs9DMMk63iqE
	 6B6M4aEIz9Ebp0Mr34rYam9VWzWHt6oISpEx1yX5gKZDizKpdOjpyWds11kRSMN0a7rcu
	 af6gdto9AwGGoRA1TCg2aHpw4vMDHF1zPEQ2R4qD2OOjmiItzkXpFRTH846alveF1hPpi
	 iK+S8xOSwOj84GEEun5AkZvtW1PcfSaUVHWlmKmJW3FDSjAwxoftVa8RAYb0ou2AyDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3PPbwIXTSfL5INVkpoXipMr1LonhcpwjQNS0NDqz+/s=;
	b=FgqkZA5xDnRup23CCdkTkNq8SzggaTSDAGNtTQ7Jyyq04FqL+V2X8PLY2/znKeMmPBkL
	 sWIb4jc+Xwak2TX6qT40maPrE3QAjeeU/KZrBypgkyx+g3jtjRSDqg3tppSwex0PsO97Q
	 dAWcTfcteAF6MrDxZc1mwQ3kV2kPWlEs78sqort82ZbZ3/cweJroaBq7ZtXYU/sszx/ho
	 WzW2+oBvLRu5YmKSL1SUmfNuRRNaPFjfvVMnV9/xdSqnvVdhsnxuUXlUb4KrSH53Z4cIz
	 8yqRfHHFObYWmCY3fpLPUJENsBjY57hLLG4mEb+Bt5VrOOc8t0cmyl0RDZ/R/cnSvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X/QRd9tY";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EBB606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93EBB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X/QRd9tY
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so952899b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794655346; x=1795260146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PPbwIXTSfL5INVkpoXipMr1LonhcpwjQNS0NDqz+/s=;
        b=X/QRd9tYzMUrGM9ds4MFgmgnjgzlmMZQUvIuQQBK2gHq2xohb8KhWkuTSwbaJ74Zud
         UO9hYbk3WsKBa/AlLsZ5050aLkPgC1SNwvlVCpqzMuq6n2k84iJqmjp5Rm1UCcT3op+y
         RNQWzpZYbLmhwfEu6LcRUSg9ZERYaxvr7r5pPGBbHl8Gtpeq5uVVksUcIfOHDZWPslku
         7nYUyJ6/UWupvH5mxF7aOntC4A5NmIYdcmBI/AjUtwOM+2P0z9QrWqvVSMTn30+8LVEL
         sHtHLcNvup3KATG570d3LQ5Moy3R5T6+D2vBEJuTvAUlpEOp5EYSqHZ7DwipYOPn/5mL
         4MTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655346; x=1795260146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PPbwIXTSfL5INVkpoXipMr1LonhcpwjQNS0NDqz+/s=;
        b=1LwxUdl03mY8uut4zC7LUh3TTFHxZdDP2E3TZ3LXlMwqdkditKBcBYEY0qgV2ILy6N
         ia9fvDc0yor4Ea2WffQnUWb9U4IfmWPKGFPKxwvX9dc5S8+8mmEfbauB+Rq5tsYDanbl
         A1Q/jWtDwoW7Pjo0Eijdy91Df5xqb/gnKD5A5h+evWEPDkcWnubJGZAZ9AD3Cr/wTYoq
         +cpl4UHWqFXq5I92I4piIN6NIBD3yVk3o/2quYNHP3xX7p4zZCJzoC+7caKEZuc3cXQn
         ZLCjRfTom01cq2CDIQn2Z5Uu4zRobQTGF1/zcfK1Sh0rTxt282vYlMzjyFTxw1xWLm9K
         AuKQ==
X-Forwarded-Encrypted: i=1; AL+hErFtSLKfmj1+SAD1Jm1pTKCHaGv0tUFjACCNFESCP2W8sz/s5Al9uedW+Qxu+q2yiqWetSbhDqAOEyxbMWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8/80gDKKMfwxXWgoloBNGcEn1GV7XSaDzh9O/Y9UOJ38a+su+
	/NdFOmQ968pusw0JyMfljzcmL98yQ2CBgrMIuAHV/H1x3M6PLzIjFsN1
X-Gm-Gg: AYBFou0E6b7M8RTX/Kb3E7VecojcqhjhbWGPvjBWYYou9V1KdJUXDynaIuLPLJSpesw
	9+wmrMDU2jAgq8RHBTKzbknqiFSAhlEEpQDngTpiwlrwSrc15Jc3wFJ1dDpytoWIyDcZwFoTPbN
	3YsZqfAopCsLp9qUTJjd4VkIDezUoZP//Xhwuh3i0tqLvrVk/lBlNzx+VoyHfyk8s3T1+Yp5II0
	OSx/6kkICQM/5U6D60JKEtSS7vtcRKiasSkKKb/ZTqyjNlXm3O+yUwCLluB2t7Rg/RzRTQR27Su
	+QKoVorwA46sdR2KY09iU97hSnC3xzfuHc6ntnYPwZ3ZFwcAADRyqVYLUVQAOrVlZOqjRCzNCp/
	N6hsQdMlY+MIm9fcgo314elmP3S8yH+wdDJ2C3g8h5UTGsntBe0miREoiPhian0o7ivxTtu/LAV
	B2RHEnCqxxsy2WiiH1GB+G57Zne2ViRhYS/DAp/qHHxKr4RVoLL2H7Dq89VVlPkCfmVrkIoLwS+
	Y3Nvek6Vu04A1nsBBmvrq/Jid9SBf3cIQdf1AFShk0vmJY8pICFpTgVXdFHGj2MtOrimLTd2zq1
	TyxVcHlKPO3E9Ed5Kp5aOCrGUJXqn6wqhOSvl9RncF71rVDYF4i1UGDdVNHlFifioGF88yLe+fl
	YKZIxqj2pjR2Ft6Nw/leGa2RU0LN1OLIb1+K7VnB758qa9LGilr0lyRGVRGRlKf869Ja4SQ==
X-Received: by 2002:a17:90b:3146:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b1b0a4513emr4900156a91.34.1794655345714;
        Sat, 14 Nov 2026 03:22:25 -0800 (PST)
Received: from localhost.localdomain ([118.68.25.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm3981142a91.3.2026.11.14.03.22.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 03:22:25 -0800 (PST)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Casey Connolly <casey.connolly@linaro.org>,
	Adrian Nguyen <thenguyen1024@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: power: supply: Add Qualcomm SMB1351 charger
Date: Sat, 14 Nov 2026 18:21:54 +0700
Message-ID: <20261114112155.85068-2-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114112155.85068-1-thenguyen1024@gmail.com>
References: <20261114112155.85068-1-thenguyen1024@gmail.com>
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

The Qualcomm SMB1351 is a switch-mode battery charger with an I2C
interface. Some phones use it as a parallel charger next to the charger
in their PMIC: both take power from the same USB input and charge the
same battery. On the Vsmart Active 1 (SDM660, PM660) the SMB1351 is
powered from that input alone, so it does not respond on I2C while the
input is absent.

The SMB1350 has the same programming interface, and the two can be told
apart by their version register, so the SMB1350 gets its own compatible
with qcom,smb1351 as the fallback. The version register of the chip on
the Vsmart Active 1 identifies it as an SMB1350.

Document the chip with the battery it charges and its STAT output,
which it can drive as an interrupt line. On a parallel charger,
power-supplies refers to the PMIC charger whose USB input also powers
the SMB1351. The SMB1351 can also be the only charger of a board, with
no PMIC charger to refer to, so that property is optional.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adrian Nguyen <thenguyen1024@gmail.com>
---

Notes:
    Changes in v3:
    - Drop the Assisted-by tag: since commit 1e035297ffda ("docs: remove
      Assisted-by references") the cover letter carries that information.

 .../bindings/power/supply/qcom,smb1351.yaml   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
new file mode 100644
index 000000000000..468899c15fa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,smb1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMB1351 battery charger
+
+maintainers:
+  - Adrian Nguyen <thenguyen1024@gmail.com>
+
+description:
+  The Qualcomm SMB1351 is a switch-mode single-cell battery charger with an
+  I2C interface. Some boards use it as a parallel charger next to the
+  charger in a PMIC, taking power from the same USB input and charging the
+  same battery. On some of them it is powered from that input only, so it
+  does not respond on I2C and loses its configuration while the input is
+  absent. The SMB1350 has the same programming interface, and the two can be
+  told apart by their version register.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,smb1351
+      - items:
+          - const: qcom,smb1350
+          - const: qcom,smb1351
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      The STAT output, which the chip can drive as an interrupt line.
+    maxItems: 1
+
+  power-supplies:
+    description:
+      The PMIC charger whose USB input (VBUS) also powers this charger, on
+      boards that use it as a parallel charger.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - monitored-battery
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        charger@1d {
+            compatible = "qcom,smb1350", "qcom,smb1351";
+            reg = <0x1d>;
+            interrupts = <61 IRQ_TYPE_LEVEL_LOW>;
+
+            monitored-battery = <&battery>;
+            power-supplies = <&pm660_charger>;
+        };
+    };
-- 
2.43.0

