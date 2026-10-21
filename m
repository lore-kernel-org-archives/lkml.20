Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582749;
	b=3veHg8+rRIj/lUaShpsGi1e1m9i209IhWmLuCQ4cuukx671lGAOhp05Y4PQL0a9tlDqC
	 PAZYfBQbD+CnnxKEMEnIg5Nw22GG09GiNz5P7on0+94kKcJTab5colODGC2fF6WNXM8ms
	 nByjdRmsh4dX9we0ZSO6gsrByP7u5pWjeUe9ZfCoOlFJxm8H9uEiswf67dRRydXGjlOLG
	 cAyWkcHZsoJSeIETzR7MS3Y0MgvzYnIF+fy7iBeOrakIOTOFlJF1iZ7zDzCjFa42983+4
	 cRvPvIi1uNIs98rmGqfro5JwJtSDX4CB6QRyaefm5BKsgKIzj55+jtAYhGvFhYEEL/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TgKeJIVrgmoBWpLM7/N2L+4iRLrEXSCOV8xYhwdq8Q=;
	b=xlkNwBz9rU+xXaAJgcVxWQWHqalSebcNcG/anRJTEHe3ZkXBBh/msIY0qPNbZLywZHYM
	 xgLONlsxaRoSM4pkpUEcInQG6FBBaLkK9k1I2qckbUbO9YFZIMyA2dcjA9JVOvZRYdFIk
	 x3fKO+3Tj7zbc/AL6vkYOZxSZuovlufl83aWuHKSqi1c3v/LafEiLjKvOMGx2ToVFOUZz
	 GIOtsbWm/jNgHFrVO5k5EBrMOADt68Zc0cN9wYRMBDT+XetrYNm06ef/f2NcDresfyy4y
	 53GIDP1ML8ZDsoUufu32pCcPSNd9pJ5aOD+yXmCQSmOP/dYOQQekudA5Otz/pYoB3Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=EMUkFKJE;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0398B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0398B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=EMUkFKJE
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5378b281aso2954785ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1792582748; x=1793187548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TgKeJIVrgmoBWpLM7/N2L+4iRLrEXSCOV8xYhwdq8Q=;
        b=EMUkFKJELK9e+Ph8uXhE6bVUfMeigaZm2ro+5e+vZRivRzlgUer29fwM+4gSuaAIno
         +QqzbvRKqUCI6d7lMec9lRv11IC8FstkmFStA9wcBEdyp0PKI4j2Ul5TlFTsgo/ctahc
         PmUoAwemeUBjq5huwp3bxN/OnoMBvXB6QqoW5oa5BdFf9YO7GFwNUP2Z2nbkmMG36r35
         aIgX0dYhOvYWVPK/Tpw8yWXdPVPYf0IplE1+K3YIgzy7Q0xINLv0nItWFFNctPVtxZrt
         AB/p7SMXrEwm+RaROp7MYOU0uR4wW0Uwzo575YTX4hj1Cgfh63/XU0GW/EAElyhkFsww
         K3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582748; x=1793187548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TgKeJIVrgmoBWpLM7/N2L+4iRLrEXSCOV8xYhwdq8Q=;
        b=E+hY+f4br1CukPGNczMGCVOuJ9WXlKbQt1JKtZ3lXaXOV2sUwG/bdjQyLOISmrZ/2d
         OCV23ImBUBMEhbIT9p+1ch5QKI/9PMnPiFpcpkfCtcJ/YrIjN5WEA+kaY6vWycgPK3AF
         0dFVV6rh80OUv77B0wFfxH9uGHcuMnybgVH9c3chWxhIvuzOPA+hikXaMktc5ZRhSH8y
         uzos0T/YlxM6lDwrIJZ2WipEhwsR9OlvZvJtT3Xe6PU9gsXqK+EETiaaBFuzNKTjR5G2
         YLjMeSHvSVn91oPaEsOXfTUEraQUoUjP3Bn+Gsh7O1ZJmaccABgAyRc9h2roJUfSsg6x
         yEPg==
X-Forwarded-Encrypted: i=1; AKwUvBwgNhxpcOQd43o6XBfcljBtaNVYrDdGooyLUeCbJXa2EBZ8mve0FmFnROGaPU+eqRK72W/ypANTmerM89g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF3CyeCWCidPRMhhCzgkXE2bMkiC1lhPluj63vZAIRfUbzBwBB
	D8JDyjtMInPzwndYILrynEwPsJDJ2sNSru4EIrk/uF4jQt/yv/rfzat+l+/9tJDrGw==
X-Gm-Gg: AYBFou0KinNgaCDLS00HJNFK6k6SKPR2yQD/q8ilqCtvc5H0aig/bLLS0lppwK/ETvu
	P5bEShkA9hUunGuOJhV2THZeyMK4I1nCnigBIUTP6zZnsh0DkB3cTNISZtGR9BMTfUbtobijxiN
	6TOkz4mhyi48sZ8dKQ8Md70jse3F38nWocWVZJV+7QtIanGCQqvo29QEI/GmngV7O9lxMdtzet9
	phxB4EHTN+usn2qJ3zDupRaMzzbEOwsTpG2WDXN3NF3NkZfU+2aO4t9yH2StEOxb1f2SIwTkLTc
	/XKUGuUficOu5kvEWkZQiQZCdNzrT/c92efk9ROgllA9nqKy2ZKWuqevtbb28tghiW03SEpT8XY
	HUf2nR5anF7cxdfgLw1rvn7UWDVngg0kxJaihTYHrlSsACoRyJHbkKLuD0QdYIO1ofpam9u32/O
	e+oEli7fdu07EMpBukQr0oAUq0egRjH1tfWeiO68gnvEcl4eiR3C20baTXg8ahxwJ/YLDu76mDY
	gvbrNybqxLH3r4UBIuecTxYjXOpPcPZXu8VMjsoFp4X3o0u0rE3LxOunkZKxB3CcJE=
X-Received: by 2002:a17:90b:3842:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3ad86ccddb2mr1720079a91.14.1792582748342;
        Wed, 21 Oct 2026 04:39:08 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4023732a91.15.2026.10.21.04.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:39:06 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 21 Oct 2026 17:07:53 +0530
Subject: [PATCH v4 5/6] dt-bindings: beagle: Add BeagleConnect Freedom
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-gb-uart-transport-v4-5-c308ce821d45@beagleboard.org>
References: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
In-Reply-To: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=ctwlQBerNS3g/Yt080ihEXWMF7uGR3U1I4sIyvz57mc=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq2KQUx3Tjbnw8aHEMOSLbwpCfncwRXfss6GPzW
 ss6STrE3sCJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCatikFAAKCRAFzvXHieVa
 dPrtEAC8rpBYY99n8B1SPnRD6vb/svkhZ2781GupdkpVFTDNR+TFD7DsgWBYEk1nJipaeycb7Kb
 yptg3OkqDZTpJ2KxvRghWwTczgvCb334PZhogBq0YxGYJ22wc8+dbtwvMTDaWiVNh4eIaECAf3o
 E8HKgWMzcg88EYPKV4lQZIKZT0iCR1qjoHBpbFb+4S2EPO8kQZr+bzDvHgFHHicbJ6EtnPU5gyN
 3wl5CvwRgKogJxcq8e+MSYlJmIRwIS+KHOGc8pbxf2W5AnHdg2jQVCudFVHV3PyzPkPVTmwCfxp
 SxzoRr4kkv7To3elnBWQhyupyBhhBkQXTcya25Xz/45hENAM5SjCrICQbLliCH/tkESRmwR9JkR
 iPzaJoSnNpIT5Ae89D7Q+rX/XnvPecC+AYvNieurWO95XUFRPsTdew/g12W0BM2/C5mKjMzuhQN
 v8dZn1vxFZFwfpA2ZK8L5Lo9VjD7QiEiD+8SjPRsFVAeaVs2o94fDR5OMuvZCb1KZJxrAJejBTo
 CQKi2cWGY5rFZ06pB0oC0HXVq1ZMWv7oob+/ngsma4TgdW3BBkO3E/F1+AQRYDwmGf31bf6Nuql
 cAIMQtneAEbM+qFoUR4JR19O+z240uSMw5tlMIQ22qClVt4NbULu8RVvgi9ea6rzRV1WFzLMMjC
 QC64vUUjU83QduA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add devicetree bindings for the BeagleBoard.org BeagleConnect Freedom,
a wireless-enabled board based on the TI CC1352P7. The board exposes an
MCU that can be attached to a host over USB, UART, SPI or I2C, and is
described as a child node of the corresponding bus.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 .../beagle/beagle,beagleconnect-freedom.yaml       | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
new file mode 100644
index 000000000000..81dfdace33e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/beagle/beagle,beagleconnect-freedom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BeagleBoard.org BeagleConnect Freedom
+
+description:
+  The BeagleBoard.org BeagleConnect Freedom board connected over USB, UART, SPI or I2C.
+
+maintainers:
+  - Ayush Singh <ayush@beagleboard.org>
+
+properties:
+  compatible:
+    const: beagle,beagleconnect-freedom
+
+  reg:
+    maxItems: 1
+
+  vbat-supply: true
+
+required:
+  - compatible
+
+allOf:
+  - if:
+      required:
+        - reg
+    then:
+      $ref: /schemas/spi/spi-peripheral-props.yaml#
+    else:
+      $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+      properties:
+        current-speed:
+          default: 115200
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+      mcu {
+        compatible = "beagle,beagleconnect-freedom";
+        vbat-supply = <&vbat>;
+      };
+    };
+
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mcu@0 {
+        compatible = "beagle,beagleconnect-freedom";
+        reg = <0>;
+        spi-max-frequency = <1000000>;
+        vbat-supply = <&vbat>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c9126dc205db..521bc6c67979 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11522,6 +11522,12 @@ L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/greybus/gb_softsvc.rs
 
+GREYBUS UART NODE DRIVERS
+M:	Ayush Singh <ayush@beagleboard.org>
+L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
+
 GREYBUS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
 M:	Alex Elder <elder@kernel.org>

-- 
2.56.0

