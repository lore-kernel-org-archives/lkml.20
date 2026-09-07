Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D1478E38
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781963; cv=none; b=fAaUWQ3c/RbDmhZMcJJRROQuMGWXG89nprkxlK1GD3g3ioZQWvdIh08Rl7gGHjvWawpVCPFSiQ+/e+eKvC4wru9wQLLWu71vF0z05mEFIqPI4G78BiXY7NNGofdMw0dMWzQi0pLrH9pLFcpC5f9x32MH0toeCNnFQLpDs1Wn0Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781963; c=relaxed/simple;
	bh=qTroyC/eouHh6FV6jHO0fBzSC5cZJgKW04iNQGXGDys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMLuJePQIFsO42eyfeyTZtPXEbbFFjk3s78hECu0pNr2SZ0Zaj69xT7KiBllaojauDuTKGzMiUxGXssm/J/fh9WZVE3BPAz6BpsXfOsjK+wSvnegl1PoT8GdlIodUwavf1PEt0Yzl30s3SHROxas8xYRVJv0n34gm5t97AtOtYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOZ3+MrF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOZ3+MrF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482ea739de2so2319608f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781960; x=1789386760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKFJorjn7zfsDROh07dztN5ti3ZHf/iVGFIzCs+Axs0=;
        b=AOZ3+MrFOBjYEEJpmKmf3AUpZSDuM2NKTjJRIElU3Z5EF9GeBIl4m7o8AOj14fw2Uq
         8N1cWOYgEvIvt4X3B2DDqmJUn/qjzLUleiSUqe2vFarPzrdefg36AgYFtDnqonQQxMjT
         yRZlf33qwp5gNYg9VUVi/FpXs5E/2EHXJ7ZICjBVn4daBH81du1TkWw5J1wjNf9bOXlP
         QWdIYc8u5gs2J5hYvCJUFN7LUZF/L07NR01Mbvdd1qYqoJ028AcZfE1g43YVnTCGk+YH
         Vwwjar/OyjxNcDXv16S9gszRWRZ7iVEdl9xkCsCHMpHYl14cl63WZiLSC4y9oxVURViR
         a58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781960; x=1789386760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKFJorjn7zfsDROh07dztN5ti3ZHf/iVGFIzCs+Axs0=;
        b=b/G2sZ+nN9yZcjw2uKFh4OZm3/oT569vm6cyYOL22jWR6oJPPveDRnFNBANqMqiUNC
         ClSh1zlZCBtJLmF2tpShUzM3+FbfUXiaanb+8pVgmO2qzzZYnP/g6plUA0uZTeOz2/UG
         W+tWvqiUeVavz3Qd6ouD8DRP8NTCPV1MxKwhxsa/qX0wS0e83l7SgNuyexJE4p77V2XG
         3gtiQcpLjJnRLCy4qJ4nlKONPoPNrLB4ion0+7O2rqg3Wpxa2HpNrMnkb1aorxYWguhv
         JN0qg9kYS5qub167eixIzANsR7To/VY7yTQyMi4ZCRHzu+azxLT+9tfFyequCHGYmVIf
         LsSA==
X-Forwarded-Encrypted: i=1; AKwUvByFZSlqX1hpihdS4mUIL2BSEyzKNEWA+BvpLYKsdIJDTUnd2ed+CwtQM2Mi37MWY75y/7MCTE9IwxUd9ww=@vger.kernel.org
X-Gm-Message-State: AFuF++lLRtG/ftp17i7fyNvolZgbxmObfKSUCRDGyJMNGHH28BHFDWD9
	Buk1GyBMIbihJTK4XBy0occzUw+ejRTxkJzAyq7iRq2UuTdQnxHUZLHX
X-Gm-Gg: AYBFou0s/Uf95/LgCRdQnAfU/ibhmRd/v+eR0qiu2ZfNajRsaDlZrAygi55UYEJJNtK
	GG8Ct7WfimnWvua42pQKJOtcALiljFcqwVga1ZtsphMr7dlQPXzr3J77TAbwEK4mL03CwkyLije
	mNsF8dSROs8SxrXugM4ajojy6vlF7NR/WcGzc419YUNpIYmp75ZEaEXv/avaPEDUlmKJI+f0VwV
	qJGyGwDbFo97OvYGMJaGiojIEL01PXpKQ/QP7EMBCe+1D9aTidxNGVlZW0g5dQSDcBV20e8HECM
	Qk4ZepdripgTCX2ACxml5W4KA/8Qc1Si99kSmNTVdIPi/GpByZZxhAM6w/8mFncNFmRiwlS/G99
	yRPEHxS0aksJ/x26zvpSORl/ktscjV0BaxAPbeLutEX8qfJZOntvMG0GSOoHcVP4zGClbjeqW5Z
	n1gVoZYdvytH/zbJyPbgBkCUTYmz2AbHPw3rqKaMe3wQlQXj6wcUfZRCNcHE5xQ05a
X-Received: by 2002:a05:6000:220f:b0:485:8c16:a350 with SMTP id ffacd0b85a97d-4858c16a62emr20292762f8f.40.1788781960074;
        Mon, 07 Sep 2026 04:52:40 -0700 (PDT)
Received: from Empers0n ([193.23.219.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26830718f8f.3.2026.09.07.04.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:52:39 -0700 (PDT)
From: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
To: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: jesszhan0024@gmail.com,
	conor+dt@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Samsung AMS662ZS01
Date: Mon,  7 Sep 2026 18:51:29 +0700
Message-ID: <20260907115130.95394-2-sevanevorotov29@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907115130.95394-1-sevanevorotov29@gmail.com>
References: <20260907115130.95394-1-sevanevorotov29@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding documentation for the Samsung AMS662ZS01
FHD+ AMOLED DSI panel found in the OnePlus 9RT smartphone.

Signed-off-by: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
---
 .../display/panel/samsung,ams662zs01.yaml     | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml
new file mode 100644
index 00000000000..b2697d140ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams662zs01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS662ZS01 DSI Display Panel
+
+maintainers:
+  - Vsevolod Nevorotov <sevanevorotov29@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ams662zs01
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vout-gpios:
+    maxItems: 1
+    description: Panel VOUT enable GPIO line
+
+  vddio-supply:
+    description: 1.8V I/O power supply
+
+  vdd-supply:
+    description: 3.0V core power supply
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - vdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,ams662zs01";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+            vout-gpios = <&tlmm 25 GPIO_ACTIVE_HIGH>;
+
+            vddio-supply = <&vreg_l12c_1p8>;
+            vdd-supply = <&vreg_l13c_3p0>;
+
+            pinctrl-names = "default", "sleep";
+            pinctrl-0 = <&mdp_vsync_active>;
+            pinctrl-1 = <&mdp_vsync_active>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
-- 
2.55.0

