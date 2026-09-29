Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BB438CFEF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647886; cv=none; b=hvgy2eSfryoYgEtwEV4gOGT/30wT9EIQ57pnTtyUALCwOocYVm7RETC45aEf9MC+UeswLhdnJAXnOCjosbvyDAoSmjmsy5PCpfZ8jqPxyipdCdZ1tDjB1x4NbBBwjMUX7aOG/t0IR11BdRoQn1sOtIJVUN16oC3jP/KzPwZtjwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647886; c=relaxed/simple;
	bh=Wm8hL13n6Fq3R7PbRhjO0X0HGPS8cWmATmdQMe47vmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=diwaFDVdeLg09IKJ7JCa+nR6O2ZHq+lQVMjJTphMkfjI3tvagwkXBuoEFAECofAxC+XcXIGyFo+lMykrUEW/RcVpXDSSEZZbM0/5RbiYHcK1XblYUtmePtD7hVN7DpfUn2k8JaMBireaRoB5Q9wYVwS7+OsZSbObAqur7vMALQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XFPkHobn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XFPkHobn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so28387465e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790647883; x=1791252683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYCpFKJoZ1Z2HVBfiR3DfPWcC9vuA+AY89a6xRFHhws=;
        b=XFPkHobnNRzBBWv9owWcLsgGT6Rx4VWDwWzPf1JtYoEc/4Vdw0eKi+Y5NRTABr1xHA
         k1L/Ll+ocdbkMBIhQxuk41Tk9TC61mt2eKUC12ujl31doVO1tHOvi/f8rVm1+6yCp32d
         2vYv4sFwQxCMzkJuzi6gat4UxbgWnhieH/cqqiHnE2P8ftfiHWN91HAJlR/00UPPql7H
         k6D88dEZfP/HVJnp7rUuJiazfM/M4fvidqeaxnnoyPcpYs2Xp0avJEqZ5AMo6ecgQNsq
         ACrz8PU6hhGwrEFxcEhVGGHCrQHHCDcaYLXgR3nLDj15aY/Nm6tCK8BIoOsXYXbDcZe9
         rqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647883; x=1791252683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYCpFKJoZ1Z2HVBfiR3DfPWcC9vuA+AY89a6xRFHhws=;
        b=x2Yjkyqx+slmyd1q9Otm3wrapvhy7Esmg3RiMwRP6Za9WXsWEBRqqVna9t2f8QgiWt
         j77Ya5WdCVqt8S039ZvEqk4F+5kuPAdE6WTFfs2ATc/ExLw2fbjkmE6T2oKwuiFFhXVr
         MqwD3DfquDFxyksL1MmgkyxLwZhUJObANQLExnxG7EeOxRgT7uVidtueWhvufrene/sy
         l1pVZaSuGedTWmiNhnvg+2+lVe3LUuv8wlA9E+RFzqRoGYJMYAnIvl+SJa72dISLShY3
         hK8lDCi8S8tqt22SgQc2VCtPuWe8Yee33eSHM+vzmm++JDsb/mShVvoPL+dQ+5n7zTd+
         XUdA==
X-Forwarded-Encrypted: i=1; AKwUvBxirJsP9zr786qdz7ORbQKKdMSfTrKMgjNF8iuW7A193FiyNBAwycssBkZ4Ws8Y6YHw1+U2ufeva/MDcSI=@vger.kernel.org
X-Gm-Message-State: AFuF++nxdy0LLH2QUJeP+23vY9MeOkWqmGeJ2RTN6OzG0pPA3rFXoEKU
	PLNBO8QzCFIWbmnf+uke0SfVsK1QNHYRClbHNG8BCWUxITVTrroNjODs1/kAJ2Cv5yU=
X-Gm-Gg: AYBFou3JOdFE4b8sEZTOE0w80fEu6IQgOO2SeUruMbLzBHaaj9pqVca25TCAl28145+
	LS2pvRyxIfvDEQcpVFETzPYavz9wdq7bFk0PK6ei8da80NmXdj27OD14EkaNU9Kke94WDVu31oP
	fPZbM9ubewssYBpHhhdkcOqnXQu4Q5hRFYuOjPaDQbBKBSkHpSkY8SFs2m2Qbko8ql05gm8Q3Pi
	J0LlVJm4OcGJbY4xjmCyBsbAzRo6w0Gd5a41c87FBHyb0dxSN/VEls9Lej5uSHhvePa8iBZSOXW
	KtYLmjIMnnv4p+X0BpFxIOvue4ZLBjQmW6isvUpIV/bC6/YgJzeEAjobLE9khSEzhzyCeWBCoHI
	i2gsOtgbR0O2971Ji+bLo5VvjjQtPlLeL2c9gUCPH2kzWY+02u1KEOrgf5GrCTQmwa2xeX9+2t7
	oJrZTIh3Io75x7O1SBprSQKafr0O7e1uEPbRNcWY+mqgSC6S4/kPVCb2yNL/RNc595KqZjWH8nN
	gjaO07IAmDlvJPmtMIN37+CrlzVDt/Tm9QJU6MIM2DLaZkJEQ4BheiwpuJ4UA==
X-Received: by 2002:a05:600c:540e:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-49fe66ca828mr272930495e9.10.1790647882919;
        Mon, 28 Sep 2026 19:11:22 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm42070145e9.14.2026.09.28.19.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:11:22 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 03:11:16 +0100
Subject: [PATCH v3 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC incorporates an APM co-processor. Communication with this
hardware block is done using the ACPM protocol, which handles IPC messages
for clocks, power, thermal management and PMIC control. In this
architecture, the ACPM firmware running on the APM acts as the central
supervisor or arbiter for shared system resources, handling requests from
clients or agents such as an OSPM. In this design, the OSPM is one of
several clients or agents communicating with APM.

Dedicated compatible string is required for the Exynos850 because
its firmware utilizes a different initialisation data base offset
(0x7000) compared to the existing GS101 implementation (0xa000).

Additionally, the ACPM firmware implementation on Exynos850 does not cover
all clock management operations (such as clock rate reads over ACPM IPC).
To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
called domains, add 'clocks' and 'clock-names' properties to reference the
underlying physical clocks.

Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines for
Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
specific PMIC child nodes for Exynos850.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 +++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index e68f9c3ca5e2..0eaa9c881f6f 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -22,7 +22,9 @@ description: |
 
 properties:
   compatible:
-    const: google,gs101-acpm-ipc
+    enum:
+      - google,gs101-acpm-ipc
+      - samsung,exynos850-acpm-ipc
 
   "#clock-cells":
     const: 1
@@ -33,6 +35,20 @@ properties:
       appropriately with the clock scaling. The argument is the ID of the
       clock contained by the firmware messages.
 
+  clocks:
+    minItems: 1
+    maxItems: 9
+    description:
+      List of the underlying clocks associated with each ACPM clock domain.
+      This property relates to ACPM firmware variants where not all clock
+      operations are implemented.
+
+  clock-names:
+    minItems: 1
+    maxItems: 9
+    description:
+      Names of the ACPM clock domains corresponding to entries in 'clocks'.
+
   mboxes:
     maxItems: 1
 
@@ -77,6 +93,44 @@ required:
   - mboxes
   - shmem
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-acpm-ipc
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-acpm-ipc
+    then:
+      properties:
+        clock-names:
+          items:
+            enum:
+              - mif
+              - int
+              - cpucl0
+              - cpucl1
+              - g3d
+              - aud
+              - cam
+              - disp
+              - cp
+          uniqueItems: true
+        pmic: false
+        pmic-1: false
+        pmic-2: false
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include/dt-bindings/clock/samsung,exynos850-acpm.h
new file mode 100644
index 000000000000..87fc6ccc1d99
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Device Tree binding constants for Exynos850 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
+
+#define EXYNOS850_CLK_ACPM_DVFS_MIF			0
+#define EXYNOS850_CLK_ACPM_DVFS_INT			1
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0			2
+#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1			3
+#define EXYNOS850_CLK_ACPM_DVFS_G3D			4
+#define EXYNOS850_CLK_ACPM_DVFS_AUD			5
+#define EXYNOS850_CLK_ACPM_DVFS_CAM			6
+#define EXYNOS850_CLK_ACPM_DVFS_DISP			7
+#define EXYNOS850_CLK_ACPM_DVFS_CP			8
+
+#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */

-- 
2.51.0

