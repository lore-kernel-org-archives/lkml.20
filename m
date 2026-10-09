Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E1E4C650B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545122; cv=none; b=LJAoBcMHinJzkExrFqVZ/VruXsfs14GcJHGJeeElt2GD/S/DFM0ajy7rASnD5DNt45McCxZ2FHLqHT+Wl1oqd/qp+uYA+0QRAnnkh9KnLty6l9xp1dujElXy/ITgkVKcYrtf+gBbvYk5tZdP1vRyCnzezgmzF6kiIjT+uCUpM40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545122; c=relaxed/simple;
	bh=ZXP6OkY2DxkiTYSnHO0CLOwn5hC6SXDi4hWyiPvZAl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPf+UPEQckDxIupE52FpBO7MNhAwhsy9BMKpPMAv2tShpqjkW1izcaVirdx9zSXvHPvnQcoq5LZ6wmSlGrdFyB6Ss5HRchDj2mCV/Az46MT9oFwnntDV5iqz3u+r/WXpv3MDCWcjRH4ndEe1QTq/gocIZixTvDYIehW0eVevzHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0C4JTQyS; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0C4JTQyS"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6afe29c08ccso5294021a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545107; x=1792149907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qgqhj3Epuh5RclDvybJ2oNFa673B4IjvzwU5Ux/nnZ0=;
        b=0C4JTQySJ4riCwDj2WkYktX7WkJJRzsyS1lYm+754aFCn1sO1IY9tNFl6EHP8c85Mt
         fTezYQ55rKxDjHvAZTVAqNJIQhGSer/bTvVs6oksd4Du4xP/LHKvQhGSDT4HHLNyvSzW
         /Qh0adv3GKsaPQbJojb5l0OwrMOb4aEqhdg88Yf7RLr+3ie8PIT5cXDgDMrbdLyiB5F3
         N4HRCfw6DgbDhREQihxNcvKZQxARmhDaAqi23KFgJPYNj8Q1xk6S3eUom/duGlqdk6sU
         0Un08M2mzP6YYwjXcTALrAySZDnRYd3qNU8o7714nxxWMgwfUSW87VDaKz+svH0XjCUM
         h5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545107; x=1792149907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qgqhj3Epuh5RclDvybJ2oNFa673B4IjvzwU5Ux/nnZ0=;
        b=Ta1vROMq0lblg/rdxsPQ8ESLKAjEQ9BRw6OzpdUKYAHVYprs1E/ethQeG7D1cDXGGK
         n2Nay3hUKUeIkYNdKEzdAfqmVdvK/41Mx1cebUqnxAQQr7/5AqSWjj109lEj3Pnx7Qd6
         o1T/u6V3h/PVvf6Kvh+dqTNP7MdzeDFXOgmH0PEuTFYIPI1Um1EhoZrzJl3pl8ey8QVV
         Z+QCcTIObkKhsMmfkJCrqvPcuMxaGxDGW6lFsXkT5cf3B2P/6Y3W9VxE9xkau+VnZDnz
         GhMZJu2fU5paxqM/1Ql/7qE9aK0QfdHZOTZkPjS7dGxuLFJYHSFe7oTbZ4tvsS3Ac24q
         QUUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdTL6fP94WYaab25yDAln8CoijKoT7aj1CbC/ZFLOtaHQgXdVsac54fqMgVKXjiPzoObcNqaJicbZ12uY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbXxfnX664D2rS1ORAnVnVF5Y09/AYMD7G1wcAKgHMURH+OAu0
	7eaj7jX/7VBU4QYL39G3D/Qwvl3W/1QYGY9wIM4qFmqVZlYgBQJD285uypNyfG8GTw8=
X-Gm-Gg: AYBFou2a7Voq+2aHl2doycOENHqtakONbV0htTZl/qvIQIm9aGOGSxolOdwcfMiK0v5
	uU28tAWskfG1mM2yYeRCOO15aAfUsw/YZxkVHaol66wQAXF7OtHQJClqHSQtrxGDcEF2i/BIw35
	vB/6TxJXY8tc4ivcMBzyMwTEsQ1Jya/fQnb/QaBdTGTW8RgtL5ROU094aSxPKl8Tr0+mU4geH8U
	kHdh9l15JNct4GpyV6DqYh1tbe2B6Nd0vNJN2wKIXVsdvfsCJ9mWnHvJnW761qdiaPlqmmFKZS+
	FPWWDmFy2kvTsSpnDxqYf5fXQkqo1wOaR7r1XQrk5WWEefx6obrX9Ji6OT3HDIUbmBWgLwFb+ks
	kdRSIaeIxxLheEeSao/ddXPcmxZq40c7c9UxHM/jmeoLewdJ8tjCw45M33DUnwBnOp/vXmS7KhU
	abcRNuBT/nfqVcSBAG9xvHqkwPWSAjvVQJNlYqSozvedGuqbuGcQpLRDORgS+FsIUeGwcYoZONZ
	ZskRAdV2thPwfIAfSZxAAcY4bokw9x/euNn/g==
X-Received: by 2002:a05:6402:46c5:b0:6aa:9fd4:35fb with SMTP id 4fb4d7f45d1cf-6b17c2a3a96mr1071864a12.8.1791545107423;
        Fri, 09 Oct 2026 04:25:07 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Oct 2026 13:25:00 +0200
Subject: [PATCH v4 1/4] dt-bindings: display: panel: Add Novatek NT37705
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fp6-panel-v4-1-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=2354;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZXP6OkY2DxkiTYSnHO0CLOwn5hC6SXDi4hWyiPvZAl8=;
 b=C+M4NZ57qJgderrEKqwE1gICaP8nnZl/AfQkRQF9zw8yx5PfCq072o6iLhRO4Gg79d2Ci7KPe
 Wg1nfHk6yJXCzznwRDm1eNVnS3IC+4sMqtW8RAqWHzth9V7ZH1s9DQc
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.

Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
from BOE) using it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/81a3c207-4d8f-490f-8e2a-6f3f4c2acd35@kernel.org/
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/panel/novatek,nt37705.yaml    | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
new file mode 100644
index 000000000000..850d91e25af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37705-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,bj631jhm-t71-d900
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - dvdd-supply
+  - vci-supply
+  - port
+
+unevaluatedProperties: false
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
+            compatible = "boe,bj631jhm-t71-d900";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&vreg_l19b>;
+            vddio-supply = <&vreg_l9b>;
+            dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.56.0

