Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501829;
	b=hbXbjWClv27kUFnCtVSiD6b6VEUpBFa2lLZPbJQv4g5PExXwR88fwvblUTHOO6JIniVs
	 JijBjDB/S50Y7BtsnxydniylDnSUjG4Z/Xt6C3QmrFsMPOJItJIsQhbDbz3loxEA0uY/i
	 VhRgyPUAqnHdBQkiN+N3AI14cRYNtSRagN1kgS5LMo8zXuEYEU7Nxg4hyRi+ddKlnRz2O
	 +2Ui3gs+dTnp+Q74ayo5DfBpzArdc1GDuTVrwOoyhj+aSii8XRK+L72hUBOrFCur0xh+b
	 /5JT+KtxUGw4UopotS4jjZ4r20OEkdcilsGAwIpqKERAWDLfiLvYQcsLXvx7Ir8pZYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UMXtQLb7sV43jXsaXOJM86dQ9CSAx4ee+JilsAAN6V8=;
	b=OpSSXjIPa0+cvwV2iSUsimrX9/ST+2tCWJosMEecjZGr+px9DGZMVJRptb88UA+wGUVR
	 BbgWFm+vki18C3zFYunBdEowACD5/z+OW3hw7TzTTY2z8UqcZaACLHlt+ho+PGGOeDz1K
	 XmMcsTSZhzrwsA4KVcpni5xPtmXhfC9a510XDzCdE+Oj7E1SXllkHGwpcfDCfkfP5xU/K
	 Ftw+nuowjazHcsx88lm26nJquAlYmG7k+7NsrCrCq2LgNMWH3QXxAzZU6b5unxt6uDiw6
	 mscpl/H85rO4OByO/T6qgu1EHtLqs/RaPlGXUJoStgAmV2wR24NqHEX3cyxKsZrWH9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCZeVSVW;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE00760A2622
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE00760A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCZeVSVW
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso998062a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501828; x=1793106628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMXtQLb7sV43jXsaXOJM86dQ9CSAx4ee+JilsAAN6V8=;
        b=jCZeVSVWy6Yo/7XVtt/sUEblyWqkHqmvfXfy7ooW/vphOjTrtORGd8o9KjDduRAyhg
         VJCqqEp5ojGhVuqBFMF4McBe/VfyLPusySjqayYAuIHsnRqEBYu8tDYpGLWH4Sh3JiO2
         ckYF6AZTGjkkt1W2k9cL5p5GDAQYsZkSumEpcgBKRBZDKG+kq3mIk2/hEE5VGA3aY1VR
         OJE8ejk9AgNeYCosOChmElUf8i3iMbvTCJys8NL7nW6Lx2BOmk+g3vDZO0srunlZVCeF
         T1HERafpenE5QlliPwxhx5RhDt9Kb0M8rVPBkNQj56UGjMXmlmJbrLgIzHBrjxVel9Ma
         W5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501828; x=1793106628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMXtQLb7sV43jXsaXOJM86dQ9CSAx4ee+JilsAAN6V8=;
        b=Wd2zsNLyDlYhDa9zSgduJ9Jb9pjnLuWOcb7MUeR/kBFKmVM6Xg8DZSQNxQV12G3tm6
         EBCyNvWPEKPZK3prxd9l9PT9bAIT9/b6x2E10uuDCXee7dUMmazi+7OEyg6npsDyvLni
         ft09ER68BxeEUFdcOHrU4cDvUcEEhZUK9X7BwhAS+ZvsbULNgqk/GPl+C0X9iWTb596o
         HqKvNtRK590T/CowGJKawd4HPKJaj8AN+gr2Sj3cp2lvdXzifOjQ91Cki60q73T2Um30
         o9ZhSrUvFETeUCGhfqreJ5366GEYtyH7BB3XOz9gMQnY7QslllXbtzHbgNW9seo7DRBj
         Sjbw==
X-Forwarded-Encrypted: i=1; AKwUvBzH1YdFdQ/U1NjcYKLjIzRx5EhAuZBWnzB2FBIKbVkc3jRe94I2in6DItR08f/WvwO60nhpbWqql/g8aC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgzhrkprfZPpkQZCSwv72hD7A6rdrWaw4k2Pur/zhgZSYR4ltw
	lpvm7e0f0gyMs9aWBAB4HrerfaMbC6BawEKo71Dml+LRBmW9GcXRG02m
X-Gm-Gg: AYBFou2r8M6Xp01BWEK/zLVEE5yZgDWwT+z0iHAsHN1+oOjCJ2Rv1gBHBsAh3TUucfS
	bUXZlqMJjabWBziSe/gW5BDW6wZ9+zWjRrGtZDEPQM93RYvyNXKnnb+Qsh86RWoJqrtryuo2fx6
	NcGzQ77dGnCqSUeMBYIVlfZmUA/8qlVmOj/Vv2naZ1qzRtdM1LnFY3s+qD5rE8bXucVxddrKE5L
	/ffwD/PWjyCV0LmNw6FtFC1fK7ejwK7MC2AjVMwhoaKZNL/WMs+dBiy9gQTHBmW4G6i4IpXB/Hr
	FzUw8r88XK5XTxUNspjPZlatVj3pd0OWcaNSXY0Skkqj44P/RVxklV+rUtx5dfNIN5MnHq++S3H
	uAar6/KRKMjp2zKVre4RRXWSRfOrHxdwmfp7D1kaBujMloQKW+erlJN2Vns+iby9SaRNPhoCBBw
	eUPJJuYcmayI1Rjnm+61koRLN8WtqHVoSz08C3yjpdHTTKoaZwk9sDZU8=
X-Received: by 2002:a17:90a:d00b:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3acef29e6ccmr8123502a91.39.1792501827888;
        Tue, 20 Oct 2026 06:10:27 -0700 (PDT)
Received: from Linux-PC ([2a09:bac1:1980:20::1d3:a8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm10131496a91.4.2026.10.20.06.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:10:27 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/3] dt-bindings: display: panel: add Smartisan TD4362
Date: Tue, 20 Oct 2026 21:09:33 +0800
Message-ID: <20261020130934.2289011-3-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020130934.2289011-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261020130934.2289011-1-tianshi12127@gmail.com>
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

From: Lu Chen <tianshi12127@gmail.com>

Document the Smartisan TD4362, a 1080x2242 command mode panel
found in the Smartisan R1 (trident) smartphone.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 .../display/panel/smartisan,td4362.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
new file mode 100644
index 000000000000..d9a18cbe635a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/smartisan,td4362.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Smartisan TD4362 MIPI-DSI panel
+
+maintainers:
+  - Lu Chen <tianshi12127@gmail.com>
+
+description:
+  The Smartisan TD4362 is a 1080x2242 command mode panel found in the
+  Smartisan R1 (trident) smartphone.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: smartisan,td4362
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vsp-supply
+  - vsn-supply
+  - reset-gpios
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
+            compatible = "smartisan,td4362";
+            reg = <0>;
+            vddio-supply = <&vreg_l14a_1p88>;
+            vsp-supply = <&lab>;
+            vsn-supply = <&ibb>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.56.0

