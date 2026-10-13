Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8975013B0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892946; cv=none; b=Frx97DEr+U1ACAm0gbIR9/DXwmeBVcV0dvzW9r9MZTMygJOuDzvlvWIH/nJ+aNftlOJvO+jyuYYcU68H19yRxqbZ86kiACtsaqC8qI3+kR6BRNqo9ZpbXYRHt70u3P/+cdyibB8MP/COJMAk53Ka1+RwyoLGoiDR5zMBtWkGYIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892946; c=relaxed/simple;
	bh=0R5ddN7n89dg+x7544FOxMDxwDP8wBf6/r5AsNc+Bh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGKeWRYvArgyEK68VlZSRXa8LHEBQzFd5iuQ2Hs7NYOcwu3oULsnTDtQual7nk+Y3QPs2PMXwC+Q+agUO3YQxCAUrpZD9yTIUVEeAXPRxk9NAUylsKyydNG4VVkyMdfYILCx/LmrlIl8W4fgf1Os+NFdPpHWtL3OFAgb2SYoojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=cfiEFcf6; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="cfiEFcf6"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso1177239a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1791892944; x=1792497744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55nPjM0xedSIf0as5eFt+yzcpnY6wzuMrDbZRxbRXZE=;
        b=cfiEFcf6pWwBcVbKPSiACsvoD1k8PX+9f3mPcaGkGi2dsWz+OPbbhmU2Qds9P0r43F
         ACAv5Fio9KHSq14F7H4PSRSzmQ1MZT14dSrcVzPu3QuFFtQwfa8NGHfNJ90BBiAkoqiJ
         wOe7KshMsUkOeg384H5Ujtf4QmvZ9If9EO4dVFxMqdeE8Jfof3j8c87qtL+hM6w1Uib/
         KrV63aNrOIaZr/tsZQ7ukulXOwQpWTZ846O0FTYAb5tuAGdXr2RjF5K3ujzKy0GpQg9h
         mO2K/sFekAkaK43VRQkBcwpOxrXEcrpvkXZyOVoxoCAzPGekFucLbpQs54pri+cD+gG6
         fWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892944; x=1792497744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55nPjM0xedSIf0as5eFt+yzcpnY6wzuMrDbZRxbRXZE=;
        b=Yr3l9X/VlLXSLP3o2ByuiYAphtWyJG5aOBAw/9cqij6CGPTlyZucFVN4PhiM0r27SW
         EQ36qBRfy8WBCcK84cKHIFE5r32rx5wD8TYU//n7ggbvMcnix0vboPOFAJQL8B+6Xw5e
         fZ0ELMNeUp8qaiaNXa7+Gl8jfwa32bmfk7CFMrE4Sz48f+RojtXYQQOsCskheJSMozyV
         ZkZHCnoa4d/6shTGK8eS5GBIYRYlaacyjFgcoOYnBNWOOiiCZYC7Gefql40pdsTs6RBt
         N4psgPQEw+0/KuLol+SXV22GcowVWAh9BoHfiuFB7zVYLRjjA6W8tqRTBFG+C0sMstRY
         iqXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK+OB7AP60GYDpVWzxxfCdHQmKpzJiPXGT6nHvtFXRitUB2p1GdGa7bbqkOj80lpleXojZMPoVzGKXyxA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJs1FXZIxuNI5M0Quhs9m+SB7rl3W6ei43ijHBmeaPppT1ziJv
	J7oJivLlPhGk+6p9X1Q6Ey0Np9SXK4pUFiICrwJOkzI0L/GkdswWwASA7FTWQLKD4g==
X-Gm-Gg: AYBFou2Z2FoQciwPhm14QEU0G1KZ/2EGLNhF8WJNByRgdRz+YmKtTYgljHLcjl5KC0w
	7ladS7a3C3dA3/hWVR5Gwv52yPxToJqPYZHQKoJmJtzeKaUp8G6C45UPqneALo8JYCNyXgDOQVA
	aM2rv1n8m1DJqNUItHCMZHtPHh8ssksZ1akCbFr4GJpavWfWFdDnhZcMCNXnAetlkEK2gBnaqXb
	TexJiO4NC5lgMAinAScxF6Zh+haZcTrZAnn07gjSGUH3qfn/bB8rY+kvr6WDfxJSTNaoYnH+Z8A
	VORlPcuV8nRcJEx4n9DAbvM3+sr+OHhPJi2ZCFXGpG8KbcKJMunv8Z5w0OCpr1bxvzN5Qmaw4SQ
	E9zMqGOWM4V6KH7CrNl3xMZQw1QUWvGsyyKtOu6AJb0pEHXYC2KbmNcYTt6RBJ/z0A9qvRenN/Q
	BO5z3PSr7OzZi+akX6lEAObQFA1ZaA2bItIwyqHBFpfocmDcHOWcydrydwGPuOrggEygRMpuCGk
	Atjs+Zglg==
X-Received: by 2002:a17:90b:2886:b0:3a6:fec5:c186 with SMTP id 98e67ed59e1d1-3ab3acf7535mr9662465a91.46.1791892943778;
        Tue, 13 Oct 2026 05:02:23 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab8a393666sm16566838a91.15.2026.10.13.05.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:02:23 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 13 Oct 2026 17:30:44 +0530
Subject: [PATCH v3 6/7] dt-bindings: beagle: Add BeagleConnect Freedom
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gb-uart-transport-v3-6-81d0a8a1acf7@beagleboard.org>
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
In-Reply-To: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=0R5ddN7n89dg+x7544FOxMDxwDP8wBf6/r5AsNc+Bh4=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqzh2Dk6xAgtSxbJpDjv3D0q/CQXD5o1Esk05eh
 BVo16HhniKJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCas4dgwAKCRAFzvXHieVa
 dLoMD/90n0CCg1jZqkxrjllITaAZOI7rNrqMcz2qCqadXECPD9zTnlRM48F1lrJvy4dX5olnRwo
 oSoyFUi58/hRdg7rLCpvsuoJqo0xGznr57AKQYPzmDK8vlqhF6cKoucsP7Z4BWe/PGLDlWniJPr
 bkRuLCyhbtSXXtPcDToQUmqkcTD+KGbqs8s16UH8iSXm13FKwZxUADePTTcgqvL6aOtUUPw84Yb
 GdLsrlbPNX5UcU/+n4KtMfobvfUhRkY1lTn4U6BYQhqqaesrUlTrshukQO4CEh+WPgLoq+Qg+ep
 9JDekS4GPeNFygOyQG7VewZtl2PxYaH3WfSrv0ZtupuvVzPYxV93CtiTFMAGihRSKNmCl2JlgNM
 yH/RUPM8jM9StKC+CllRfVbA5LwQaIZ+ctRRq5sfuzQ9KKrwTML0vkiVQAUeXLKENliGNfXE+78
 VtCkyGdS2HGoJPQavRS0qLYv2LkcexIO7vKwqyj/An7UZuWgGrFXRgO1G7C2fXXZj5PV8haFfua
 qpL2t1tCQPsShHl1+5jXlmGoGlYmiMUx8PqJ0ernna4Zd9mTnYJxx2CtJ57G4OfMJU5JMkCd/DZ
 bNkIokG88JRrDD5l09JElJvlUVpbFciYTNk8yggpIspanh2OEfx79yAaVRVdL3Cctw+YVaSzmHH
 qAT6t/pZUOE+BRg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add devicetree bindings for the BeagleBoard.org BeagleConnect Freedom,
a wireless-enabled board based on the TI CC1352P7. The board exposes an
MCU that can be attached to a host over USB, UART, SPI or I2C, and is
described as a child node of the corresponding bus.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 .../beagle/beagle,beagleconnect-freedom.yaml       | 39 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++++
 2 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
new file mode 100644
index 000000000000..be051a39acdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
@@ -0,0 +1,39 @@
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
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
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

