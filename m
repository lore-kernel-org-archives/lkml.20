Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452265;
	b=ieZF6ePEfIcKeiteTvBfFlKEJQs+2HHb3y4cM5rNFBp0Tkw1iMEi53QXpbarxxhkeOUS
	 9XR7kd6w1y8mFdarNdnlp9+0w+rnggsOJqPQZHeGaInZAlo/myYuJ0Hes9jHDGCJ5UtL1
	 VGuELqDbEYUQafM6miV2/exJB91Iuf2ETrIRPbsl89rLBurWHAKn8XoLwx+z9NLjP3en4
	 pOplMqJAWB/RnQA6qr4vyBK78E4l7WifZijvH6bhABakKPEdMbctd60l3Wd5THdaVkBb5
	 k+T9fiIqkUAMw9EVxDXqTGi2wqusGaybit87N2yIfKf0jEdgGB00PYa4I+IXEsnC22w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
	b=NU/Ym+urVO4Fmc3g11ylHKqiZa1rMpiXQve29n8GEXM1VTGoxXQ0U2KCaWQwgUnswsDW
	 qGVOo1wbQMPrx1waM7oieF+HxU2aU796dIYqONBDbJyBL2sCSsqXBR61IAl2bCPpD+9Cv
	 1ZdQ8eDfuxanTmVthM1rRa9nc7bIQovhmhI8sY1ZeHSAkd7EPgo1AOB9a6xza7tdV4tNE
	 IyoaAoAjrHgoptT758DYLt+1Rn/98PSwfzUVLNGyUx++9cI98GPGtMjhuj3mGXTRjDe4g
	 irAvnuD5/1RbdxziTlkZiSQEW/ykVMQcpM34JhBMaO7GULmnHwf7Ie8Xl8UJCUyDeaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qlIWEzYZ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B676606A328
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B676606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qlIWEzYZ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so11776605e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792452263; x=1793057063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=qlIWEzYZWTpLVZ87fQOhoefZgH871KE0r26083GLDjuoH/SAIxZVs7eYsZjYy9sOXe
         AFiP7hq1HhBBm3mU2mA0DWk+XbxilAYbQL/TRSrZG9v9291VXlIvGLr+S4RLbkXgB9Z8
         jZ2jsX+M3IN+ahxLBrzONvjRmfLvP1lHuuokE4mo1xZQC1+BYiKFULyD1TcH/EB+D0kW
         1k9/7zqpRcgWiee4DFOKWpS+A5RIO3Yt7HxMfFK+uvLX6ikTXuLDC1U1cTnknkUytawk
         TdZ9rgtQ0uT1dJgd13knkx+MhFw21J5p1B7T4k0WhsOr4XO4a9cA52OoPaYGxyYKBU7b
         JEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452263; x=1793057063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=MAAlupA659cDSf1mKSMXkYjEDh6kCKbjaAn0nzP5Mmzeh+QxJ+MIMkRdUIqYS2iyoh
         8rGAy6CJKSsXua8TQgFHw5ITHqS+aDvsQdezxzIlMW4Uz3jzaejnhq+zgTtJ2pOO88Pv
         tj4e58sY6pxwn0OulqQK+QIFyCt6Q9vNSOm3eOiHa7zlLAlWvg4m6XNv7EeNAqqn8elI
         UbOIt4yxHAE/Ct1z7r2jGMz3c/Y7Da9chiVcLJOwxBdA3hqVI5obMi7f6N1PnQjTp4i8
         4X+8LY1bfjrtJUq/mm7fBSptZfx6rgVyPvyq8vGvt2xB+McD+3gJKo6OOSvN+pcvS2Ch
         phgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/r4IQ8icMuQkTZsmIiJDzNyg15kZKm3/MsUiVu540z6OM9CtVajZA0b+4G6EM+Xk+9z7tYQxyjRGCUi0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG32LiWlXCHZffx6HGgX9d3gnSUdj1jVQKn4RE+ozNDPlQNJDM
	nYjWdWtmGQ6hqAAWT8uWLcwyk94lh5UjUjJ18dW8aYMWbwqtdX+uO8dkMoTeRw==
X-Gm-Gg: AYBFou3RXn9FTTp+6b4VsV1WFiFrgIf5qki9vPdmkGM6Qf0cF4Fg7rZtrWauV5lWF8m
	2Ht6eD0Vge0FPiVR/ogVAzR4KnoRVyCZTacEYFy/g4vYQ9GON2EorkVnt7AaYYnDifRxxVwICvL
	LWgM67S3uqWIDtnTa6ulpKTVuFO6MYZ1IoBvy2wMTbT0RoA3Q8K9gIDIthU5hsC8beAN02iEMJm
	w0k6/R743VjnyaegVuZT1wQsysHYrkyR/hBuDigxzDHClFx3mDeZi/+JObd/aUY6L1IjwMxQ7X/
	Gi4YkzyoPJRtGDaRpdgbmpZ1C3tChOXeeo0CzzcF/ftXfikwEsqkDQ+GWw5cHXdzD+vD7zsG6qg
	uN1PcQUFRlOQ4pnyorTwKAXz2D6FIPJwUwziTGB+Yhf6Rzd0b89Mst5N7rHppKX/06Pc23mx6kq
	uwXzkoGlnnlkx9EhfRSYV95klmEJezCjsj86Nofq7+Lda65bREz7fA1a9v++FnN/LkOClsd6f0I
	QHagngMyCaA7mJ/qiS17zGDLAsPwjqhVPnsrPArEC+LHQjuvQVH4IFrIOCmb92vxrCx4sUPL23h
	0kk=
X-Received: by 2002:a05:600c:4fce:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a1d75ac25cmr214576945e9.1.1792452263000;
        Mon, 19 Oct 2026 16:24:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd348asm26244055e9.11.2026.10.19.16.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:24:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Tue, 20 Oct 2026 01:24:10 +0200
Message-ID: <20261019232412.516028-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019232412.516028-1-ansuelsmth@gmail.com>
References: <20261019232412.516028-1-ansuelsmth@gmail.com>
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

