Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738838;
	b=zBpQtI6CgrFvHgDSKL96tzydn9f4Vgv/rDWXZ2kW7yH3EK3fbCPbmPQYUQcEIK4VcwPP
	 vmLfTjW31LOkyL9uf76plehw7X8bNrCIy4hi/sF6fumW/8hKUE9it3loQJ+Pb/oc7lJuG
	 7d0+YbGTYGwXvT2S1Evt3WE0U/ShcBE3eQjbhmfIqVJOFN6pkKiClnVKr1j/JeFFwsqAU
	 /61BydZ07rjYqvvLNhw2xAiPJk1Et6zR2IKOZj5ejS9ygiOHGBWuwm5Y0VoWuqpkBYbrL
	 tuNmJHZfkX74aVrb1cWUVMojHQrynQFFx7jIj8XaoOppYQ+5KjWCSMWTFNN4ydcZ27g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fiW5hM0LTMUxH6fsk06/qcEbiBGXuvdygHyz52E4fRI=;
	b=eZI5dLN8QqQP2coiSmGvILRztUcEi+vjV31W7JWgwBi/ZmwkjYO4t5Iu/wXppdnA177v
	 EkW79Aekp9B3NJR1096lxBGudrgfjL5CyNQM1OMnq4KBoK6ybzb3bQGI4YZIVsXcTeQFK
	 6nZ4qYe/N1X6fDD4DIl+xEyQGPzam8tyw1XYRtiGpTz5wed6vw3/xciHgnbPH8MUqR+kA
	 IXVK2NfpCY4iXjFWrA9o086GkZ7grylt9SYRreI+cYX7EmwDW/kYfBgggqRUVQaX8uw6V
	 s/YGd8Q71QVJ2tRakCEQwkYpIh7WOm561t49aMwrzJEST5XKc6DIf4jpxM1X948QqFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MeEUbDBw;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ADC606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76ADC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MeEUbDBw
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ead4026fe6so1890776e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738837; x=1794343637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiW5hM0LTMUxH6fsk06/qcEbiBGXuvdygHyz52E4fRI=;
        b=MeEUbDBw73qk+7P/DHENmSJCRIqYuX4QfwzLg09hVzj9mhTygw0J8VunnoDipkZmen
         3cbO8NsXv2lJTM56j0PvKSGUDQpfCsOAbhz5NvhrnVbKN1yA4OfKeF8XElJyX1Xs+LQ0
         ss1CYxst0TXbnuiEJVIEAMGhgRtOzynimVocY7w6a/y/NtNHAZZaDwZAzapIcVJwUwUI
         WiAAf/DmaSJRPVUMj0t25iZXAkDvbwcVtUFaUkHMlzA4oB4Hv1Hfi0jEthD8orHGVNiu
         udZwrlr7XhO578z7njDaJ+0PylA3yQ4li/ITVtJskx0ZDmwEwjp2uVdoZNvjWNG2s69A
         +iDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738837; x=1794343637;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiW5hM0LTMUxH6fsk06/qcEbiBGXuvdygHyz52E4fRI=;
        b=uiLHE1BqqcbRVYSpsN3ZWyRpFqYZW9K84T6yiBD0NvvyCWamMb+a8N5XB6MJtXWMW6
         envU8qW2t03BWO5/tOwaZPZUUmUgaUbUrLZjUfmZNHxyhEWy+n9YWReyijETbfA7heky
         +O6H0UYItxZRnoj7FIz6UQyqaHGKEQNZld7jLGia664svNAVJFYrXa565TXqx+QMx1Fs
         +/0kPBttoTuC7L37RBjb7P2EKRrLJE9OgCxv+DNf3J1k7A4GTtfWo1bwVuVsm9zZydIK
         CSRqx2aJK668UJSO6XKGFxe07DXgYu3HIotDQHiTOPknqX308fKYYMOCQ9o4N9lDOKcW
         U9Hg==
X-Forwarded-Encrypted: i=1; AKwUvBzHxrAePdhTTvOP6OIc2NBcFhsAS6+QOk5Hj1WakmWqm6WVwoY0ZtwrGtermaPW3LVvwRwS3se5P4P4L0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dnI/ack25SEoP/sLocafchZuIaLxo7hIijp+sQh7IVBTn4fzT
	rUq6XijpHjDE8UTmmhllZl4VdVp7kh6K1d3BoVWewuGJFQD3WeR29zE=
X-Gm-Gg: AYBFou1ifHfUQpZ+q6rR8n7GaUF1fF564tA3Tf4E3fpwq4VLXWjTJj+hCBy6Es9oBta
	+i46P9ei45/rqalHuIccIPYlBXET4xQ9bgwOgA++yqCO1gpZ5mKH+R4w3RwjwWNHjaAOEA6lULS
	WpdFU6o83A3gBn75/0Ru7V/CQwVcVhCGLWBzGGD/7zd4gMjA5Rd1PT0U5bpVOMRixL3IJsMRaDv
	W4nbQtVeMrqfL93ISI5N3S2zDKAT6UzoUxU7iWwuqVdmEnRLatXrBxQugg37bldOtA0B1ZxZSDu
	OjN1Xnj+8p8vFf3p9tBkeJE8VU0+ofr+HKQi8z5MjK1KFbZmOpGa/WGRhS0ORzAOjI6cRkP/oDK
	z0mKS4+iMooCuNz+6zE+tzj8gLAWecPH9Z+jWG66x8fAHM14q5TqjWYxCuWo2BhDE0rGSI3949B
	OR5tJg7cSvl4rRrYfg9rsriwGjdiEXmsxY5VRWTfJuOman7UInNthH5NRetxZ+fSqak6/7g06JF
	W13GNPOhYaYYGkJJiftLlPKF+NwuyA62yat0YokZ8L2htEuOzdCnDT9OT+Vtx9vd5Xl8wwPCLRo
	wNdNwTcVBKEDVDdS8G4VLLerSmp2+VDxYl1jd39M5Gx7gpnk01s+WagmU9547CgNGCqzVbqmN5g
	CRRfM
X-Received: by 2002:a05:6122:210a:b0:5ea:f399:7820 with SMTP id 71dfb90a1353d-5ec6883a5a5mr5727843e0c.10.1793738833755;
        Tue, 03 Nov 2026 12:47:13 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:13 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Tue,  3 Nov 2026 17:46:51 -0300
Message-ID: <eafb1a147cc8e3c8c8a1f863fb47d8f6c52655d8.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793735996.git.nico.antinori.7@gmail.com>
References: <cover.1793735996.git.nico.antinori.7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Carried "Reviewed-by: Krzysztof Kozlowski <...>" from v3 since the only
change was the removal of adding Chipwealth to vendor-prefixes.yml. This
was added in commit 058ee00216a1 ("dt-bindings: vendor-prefixes: Add
Chip Wealth Technology").

 .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..6b037c40242e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/chipwealth,ch1115.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipwealth CH1115 Display Controller
+
+maintainers:
+  - Nicolás Antinori <nico.antinori.7@gmail.com>
+
+description:
+  Chipwealth CH1115 is a controller for monochrome dot matrix OLED
+  panels.
+
+  https://datasheet4u.com/download/1576606/CH1115.html
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: chipwealth,ch1115
+
+  reg:
+    maxItems: 1
+
+  chipwealth,inverted:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  chipwealth,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0
+    description:
+      Display start line offset. Specifies the vertical alignment and row shift
+      along the Y-coordinate.
+
+  width-mm: true
+  height-mm: true
+  flip-horizontal: true
+  flip-vertical: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3c {
+            compatible = "chipwealth,ch1115";
+            reg = <0x3c>;
+            width-mm = <12>;
+            height-mm = <8>;
+            chipwealth,offset = <8>;
+            panel-timing {
+                clock-frequency = <0>;
+                hactive = <88>;
+                vactive = <48>;
+                hfront-porch = <0>;
+                hback-porch = <0>;
+                hsync-len = <0>;
+                vsync-len = <0>;
+                vfront-porch = <0>;
+                vback-porch = <0>;
+            };
+        };
+    };
--
2.47.3

