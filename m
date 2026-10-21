Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571377;
	b=Atos1Z1TTAEXnB4jvha+AVd9KizUqpVAZJ49EuFUUgm8ds5/PpNqEbCtqZ3FXt2zPgKJ
	 5actbq0yXAgTdAjTNBuvEVnw/DglC4lKJh7NjofEMZzW2TJluYqUqER4naQY9ARTdWhUZ
	 d85UbepIy6+guoMjt6Rjju54fJmJIowckR7td43hRwiighLmgvjKDgj39ajenR1sVsW5J
	 +lE+DY+p2JzlU1GV6H/bFCMFL20YLzbP4TAXq68t/xfIYccQAKjP9KYxd3i3U9OJvb8zW
	 n+jiPg6W7J+wgtzhBZgxTIOq9U/d33+rjDt+UQ0ZY6iAbdZsPaylMZF6LXcRvCpX0qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DFD1bkt16ejdNLLmjMu8b88ZfYjN6Jbfkg0hGxrurxE=;
	b=5Sa1tAmwnZTxvpy3q3f40oSCKN7zJdPL+PFyKaSP7Eem1EGHfiy0/tZG6Q1wZpmcXcHQ
	 bdrai0lMKjupx6V7OPSg+NFOEcIA5rA/LvMkAVXJLReAqy8MoflZi1baRFj40xB3i7v2I
	 socP6UKi6JcY1GookcLNhlI9XtJKcCYJHFVQ37PX8zLWM+gru3VFnxz7Y+ZRq/hE/SEgC
	 PthqJNLGrbWTOVpKVGZVNUE2wJS7J2yPzKX1OzT79p0Eaj1VOPCebd7bwD9o5ZGZEY1xb
	 7zxeDgs6bFvifb4TBAPS+ypaeleaAS/4QrGdpLWOcPCmzN9Am9CIhIbefqETnnJE/fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IhTH5n1B;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB80606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB80606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IhTH5n1B
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36681e85e87so900844eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571376; x=1793176176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFD1bkt16ejdNLLmjMu8b88ZfYjN6Jbfkg0hGxrurxE=;
        b=IhTH5n1BAEzIcU1+4ct2ARRUmuXvLa5lwoTLDfPTw5a070TYCjva88wL3iNauAgScb
         2BzyCmw2TtVHPscNk70iPI9UjZkqDdG3wzb72Ztfw4WQoqfApfZmWrKNNofbLyFwpkMW
         /Mi4MnYZa5qbsgIVWDenoSVtFYg44GxGJ7AJnVMCcGubl+lpF+DQYS86hLPgDuapXuyc
         TMOvnAHNA6nYg4On6YOGzuKx3hc+59x/PKcMmd3720X4/66rYiyJwRECINg1hzGI6+yK
         6EMwIEm4wEncI3PtNXIDD8oeKhsDins/AOFGVtfx7vk6TioFrFlFPYBH0hl6Amty6JU1
         h89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571376; x=1793176176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFD1bkt16ejdNLLmjMu8b88ZfYjN6Jbfkg0hGxrurxE=;
        b=CHUmJYW9IqR24lECUPJlaP+XjPjKpQFnHwSGRoLQTjeVLWZ6BFZxKJaoDMAg7mc6mV
         Pd2h3FwctBKWALrNQQEdRZ9Z5PqWFVsn7metlcT19VYACk9fgfidGnq9rl9e5d/fL3R6
         XtsvcaHZQIoKuH/nW0vu0OdgtdUr852jvtrqIFrq/qc09KEy3F4jrhhgJ6abrpVTDr67
         SqqBw1wBKoPIuylnGrHyB7ymUre4r9V/J4sOTyN4RAOHp8x2FLTI8r8bniV+zaBesCKD
         6sYDnt8rTfBOxt5o40sVK4NG5dw32CP3t0c3t3PYj8YTSHM2VfzHK+WfpLy2PWBDmj1g
         Zk2g==
X-Forwarded-Encrypted: i=1; AKwUvBxtinjc0eWGENX7tgaOJ2YeTVXbbWTR2zHqmPK5rWFEPaozyx2XaoNA2778MuRQmneaDUV84RiWoLzcMFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtlxwgMEExrRVb90dBQ3bWvnAYpy7QLSApQ3mgJ+Qm2xed56An
	YuzUsmdAqiboCs57q9rPi31j7s1FPyIyyyDqpDDI5dS+BcpVuDzqeJ3V
X-Gm-Gg: AYBFou1wagehuIgD97bIRKRd4iW07aelWApPxD9FR/lDdpj3tw1yBRNl9WOwSuX1WP8
	3VQ4HCL+rMZXb7odMPhuEmAxQ0qESfZHiLfL+ZtJ5VFX+N6xSqjUEYWZObF6394vYUME1fpFtRi
	bN8H35/IXK21KUqa7Ud+66K8aFUmImuUhkW2IuI9NiCQqdk9NaAbIcKfe+bQFMs75B3/lGb7nX9
	8NkJ/pmb+f7m1HEgsCwzZGtqMNnJlV9+VsuffxvtED7fVlTbVZgvxfGWITfB2hhjuYKqPq7Nr6A
	ur1ji+HlUTS4ZuQ6gwPbsxseERTCcvCXHgwEJtSSj/r5/bqjieRG7EKxLXhn5ZaCc//hn6dpZep
	hWgS+1seOgPl8X0z3KTa0zUtawxABgZ92flPknq22bixZZlFnoaHaJ67wUUksnWaa3k9b0uXcMH
	pu5PSZjUF2l7f+pl4MvGA0m+gxn+wTKqqxmoNzDFhK8IU7hSOtNXzFudAhFmOXWMiybBRwFlFw0
	EEs/y5ZepyxI1orhXpl26VH6fqUxymBPqahBowNY5wHJJzg0rBZfz20intcISmtnVvJfN+b5Wm9
	5WLAuoxBaKP5C33DeMAwT8QRC8nmsrnlfh/9j5Ci1Lx6kQ==
X-Received: by 2002:a05:7301:3896:b0:366:2893:7421 with SMTP id 5a478bee46e88-3674d84ddb2mr2458844eec.10.1792571376399;
        Wed, 21 Oct 2026 01:29:36 -0700 (PDT)
Received: from localhost.localdomain ([113.161.48.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405edd7bsm5199132eec.6.2026.10.21.01.29.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 01:29:35 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: power: supply: Add Qualcomm SMB1351 charger
Date: Wed, 21 Oct 2026 15:28:40 +0700
Message-ID: <20261021082841.79147-2-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021082841.79147-1-thenguyen1024@gmail.com>
References: <20261021082841.79147-1-thenguyen1024@gmail.com>
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

Assisted-by: LLM
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adrian Nguyen <thenguyen1024@gmail.com>
---

Notes:
    Changes in v2:
    - Drop monitored-battery from properties, power-supply.yaml brings it
      (Krzysztof)

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

