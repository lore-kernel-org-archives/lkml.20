Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D31470421
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915277; cv=none; b=EFX2LbOaxVjjXhgFg0Ox9K/CHBy5lVRhU6lEKgwBJjcfK5lnaf0YKjhVChyJRttOpwAv5ZMscZqsoVeoTMxGz7KSc9zAG6b2h1DtKzsACMmEnIOGaKFdL3yvZ+ouEz311VO/rQpNVYYuC4wdAOEQB2B2xNvSGLz/YGxaBcpDr8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915277; c=relaxed/simple;
	bh=tZGpSaw5LQjlo6oG4+EbFboTisPZkzxLFq3DS1Ghqt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfLu8BMQmdxONf9g3ED3s/8MHweisA4kaDznwnbGjgNfJu/Eod6r9aVuoYHjCByNdGuo4VpfgEx0w0DslHfK9CXiXTFqbwXJ98ln+LYMva1/xsbF/ZgmMczf/mxIHR8OdhrWd0RagqPFMj1b/ZNQDOwsaWjmBSndulWgkMDKRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJ7yBhtI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJ7yBhtI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so1693765e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915273; x=1792520073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqyKIia1XbYDE+B3uqaKQd6nF2XRYDNbOxAZAiXhdrM=;
        b=SJ7yBhtINInJ6QDgkdn40Adz/ZiXPFNVdy/erhgMX7QE8sbHQQwO9+dyzC2mL5XnaK
         7BS1bDCscfVxLHHW4rWF5uRgVrQhCVouirpEdP51VTho6xETlDOo/oj5yrAbaF8puSju
         hI2mcVr5x0PyyW92Eju+1rl4VpGQAmA7W7ciUZ7ngLTKlahlfYCPeytDFm9qpWwyHghC
         AaKWMi9u5LqYWI9Grjg/AeqHSgwy4f7qPYCX2Cgr5/u8bONNJsi1qGNjPGQ3sApQW753
         uBKGVpveUC1JGkrTYRkoGS6HEl+Reene01KmTZASbOtKfVS4a+NZKpdiHmDajvGgXaAf
         VVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915273; x=1792520073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqyKIia1XbYDE+B3uqaKQd6nF2XRYDNbOxAZAiXhdrM=;
        b=PMLLKywtEEjs5/MkWAUA9MsQyet7LNT/SfJmfanpWYRQatxi/YszcXsUvDrJ5s7hgg
         BLD3GW9WqaZ8zFGXqChNsm8r45heiVYuO1pYivWvLhAgfGA/BxmLhJU5hwHk96bzShFT
         kcPcX8Y4oFps0ZaAZmnCyh+8+2RxtBGTK2xjcPN8AggvMQ+QoCVpQfgkyXpSJtYzMwfO
         3oCcTRKLNkls8cj+jOJPzK8AVduEPIacslBbhhnvp8cNMQxU7NBavSOc5r3re6iSAlQz
         gX/PO1Ec2fCpy4sSI4UoOCEyiTqlPQ5In0dHKlD33gDbAvxUP1KlHDCWwQUZQ/CIE6Ln
         jHgA==
X-Gm-Message-State: AFq9FYIxEYfEHiaKHEV7cj7Ax5a/LiKLbtLFplxhtLGU+Fsu5Mmn7cYn
	FWyWQUOoBnztXgkifdm1RF0UaBRw1jE106JcxARayjQOMOqJNUPoXXAZ
X-Gm-Gg: AYBFou10tlWo7s9RqO7PDpoHgcQv/Y0EO6/6Za+fAYjHYEMXinvplDYhtQoxXIqvohK
	BSSMCUPHooXk1Ggto8T3WKwOoUXSPrSEELsccv7IZjtGhcfeKsQW2dvsoCgzXY6Ix1zbWTgH6wm
	96sYOl6wb26HvHszae5IE2VF12CjF0LyYgOvOGm1/qeCOu5tNk/nTR9/a1ky2ACHTrNUSCIbVrJ
	SoRQU/V8dRNdW6ejkJKePquUUm5u4tGHVgH5U+lOmY821PrWxnsN1VrGe8LoGrHwx/oKPbzo4yG
	3puUbyN7hYH/cwSqZOfAMTf6YbgmkYj9Ik1BYCkj2hU0oKwdcR7UEGjct93U2k1xqmnLkTUxcdX
	rv/Uqq7d5wKt0pdNdEH8+3Q4idUgPK/jFoOaKdF00DudPa/N6NCyJxfCFpmcUiJo3hsHR7VmQBa
	dwo7eT+tBvuLDy0cZqMasCAGmM7KliUWJWNIliWinYS3AQbnCNUSRjwTrJF7fesze9uZ2wraFaD
	GkboY4Xm49MLjkuVTQC6B7bznrVbQ==
X-Received: by 2002:a05:600d:82e4:b0:4a1:a49e:a925 with SMTP id 5b1f17b1804b1-4a1a49ea94bmr115642465e9.35.1791915272737;
        Tue, 13 Oct 2026 11:14:32 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm383933345e9.4.2026.10.13.11.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:14:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Milo Kim <milo.kim@ti.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] regulator: dt-bindings: ti,lp872x: Document input supplies
Date: Tue, 13 Oct 2026 21:14:12 +0300
Message-ID: <20261013181417.492252-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181417.492252-1-clamor95@gmail.com>
References: <20261013181417.492252-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document input supplies of TI LP8720 and LP8725.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/ti,lp872x.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml b/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
index 8216f1e3125d4..df25102fdac34 100644
--- a/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
@@ -81,6 +81,16 @@ properties:
       Single BUCK regulator for LP8720.
 
 patternProperties:
+  "^(vbatt|vin([1-3]|b|lilo[1-2]))-supply$":
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      vbatt - input supply for ldo1 and all internal circuitry (lp8720 only).
+      vin1 - input supply for ldo2 - ldo3 (lp8720) or ldo1 (lp8725).
+      vin2 - input supply for ldo4 - ldo5 (lp8720) or ldo2 - ldo3 (lp8725).
+      vin3 - input supply for ldo4 - ldo5 (lp8725).
+      vinb - input supply for buck.
+      vinlilo1 and vinlilo2 - input supply for lilo1 and lilo2.
+
   "^(buck[1-2]?|ldo[1-5]|lilo[1-2])$":
     type: object
     $ref: regulator.yaml#
@@ -101,6 +111,7 @@ allOf:
         reg:
           const: 0x7d
       patternProperties:
+        "^(vin(3|lilo[1-2]))-supply$": false
         "^(buck[1-2]|lilo[1-2])$": false
 
   - if:
@@ -112,6 +123,7 @@ allOf:
       properties:
         reg:
           const: 0x7a
+        vbatt-supply: false
         buck: false
 
 additionalProperties: false
-- 
2.53.0

