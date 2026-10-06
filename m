Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764983BB695
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301489; cv=none; b=k9tOI8RVSs3S4DTC+57GS5WiQ+vG2Bjk7ApoY1PmNJxYCyW6EtXjFlhghXocGVG8LqGmAJEpaKki8bB3rmf4ascPArwbD/ghj2mFKLcurOPPImE5iTgzbV6WTOpgim1uq3nSiHD0JzkA8yTiPysQoZnKPsHDe4QuX3I4fgWVHls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301489; c=relaxed/simple;
	bh=Exo/s1u0j09lHAUyheQSe/ZnKqY+A7xHu6Hd/suScHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8+h9q4Ea1QkabvX1BmXnrRlkWn5Vza18rwaTQyf1VZPiiEF/iiU0ZfsMNBdPuYQpNo8MOXAfCW0EC5HoWnesozKfXYw6+RXbJI6vFmUjAD5pidWpBPMEDUH4MzaIl0JHZeNU2PKp/2un93jPHm8+/NY60o1a73J7L3kZDPef7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSTUVkL9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSTUVkL9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b03f23305so2691309f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301484; x=1791906284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl/FYJ5UQjzlCJK37GN8xaAE+N2Sim5hgtDs5GcqZ78=;
        b=cSTUVkL964rNoiMGwT+1UPehHgcNCxtR33Gab9+r6svmaa8OrKDDkh96U9WBHDO8cl
         hwtNhqhngOQDcGGnKLhLqWy3u4HI8z0F0bIVyetunk4MWzRLP3y2WyfB9NaztSkJ8vf0
         wDJQZ88N5iCpy28E3/dqVtx5S23WgAT8nX4F5x0sEMXEnR8+11NMPzKyfIlghM7R1NSS
         8dVrX0yqVOTpOV7CNpV5ASUIv8FoxamaWiTf+YxygBQBTmLhz1PcPUSuf3OrBI/YIKHJ
         pgkHe50xg+E4jy9UktyBsI2uLY/JROnR3TMI4fWVc3zzADqI5TRalNwv7yo6BfACGGiP
         o/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301484; x=1791906284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yl/FYJ5UQjzlCJK37GN8xaAE+N2Sim5hgtDs5GcqZ78=;
        b=c0RJzhI1ejCQF04+JnLVLYv3yq9hVfZUXrvOqGQP6fEa8cm4G1oAKdySXpbmPurYYj
         NL7+odnNS+ppaDk+vWobWRcxaCM+NN/cIxzaxxWlNLAflFJnPa/L9W99J7hOXzT0hLmq
         JyYkOs0lQw5CHBOAyl+Vvd7Z04PvkY4jWyFKEaAsBiQfDVrkzbPZTNExY1enkotY6D7f
         WtKpoPMBnjgfim7fsFIb68CFMAR1ldT9andlI7+oq7hzLmlx03zFcXDK+ADY4MKyKjhN
         0Rckgxo3SBla0iO/VC7ZfjlCc/JWKRdeqksRWcDcytkzgXQxHsuIc+2r0F6HqmenM8Rv
         HhTw==
X-Gm-Message-State: AFq9FYI8a9rL0m7L1I1pp/wpJlu167lsjtzVrTPlq2neK5n5ZtpS/HuL
	yfbd1bzNLJPYHYTnFzrdrDX5SkUGGducuIb+YjaaYy99R4Q6A7TTSbCC
X-Gm-Gg: AYBFou1cir9zSrl55X++R6IjGKRUrIkKZajB2h/A5vDc5V6RcR6u5OoNx6wgZ6cKZPE
	sigIs6XDt5+kC7Ew7wQywdiYPy+tnCiAKgscXWDFFeR/IaJF65OwZM3lyC/A39PeRh5oLkoazcV
	Pc79+JJW/HnHL2DoksatlGhdd1tY6hfPyEoXejdX5ty8nb3oU7x6lsU2vkSb/LZJ4LQXXduNe++
	V8/EyXeI15akE6vRkF9Qfx19gwuQUoa2W+rFXiFSV3S8vGjq9Pcy5E9JSQGvnMo3hM9WEg0x1AA
	ygl/tOXYdcokevnRbvSNKeDTw439n9nAyqENd2RU0shN/ip0wixc3qb0ssZQe8/V4Wj01rynemV
	J+jgpjEDaQYDHNju1SgbzVqG0b2mNG/hvsCjiL67zjEVi6ox9IEfbzcKvBqJWkxbp520nxIX0dl
	5T9ir8jNV6IDdxkNlpahONsn+6OJrv5mJnnHfu5eqTI1prk8FhViqvC1HTl3tFpHEshB76kdZz0
	/45aPWMJuSW8pWJIsE=
X-Received: by 2002:a5d:5f49:0:b0:488:7bdc:6032 with SMTP id ffacd0b85a97d-48c48019b3emr19090793f8f.43.1791301484206;
        Tue, 06 Oct 2026 08:44:44 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/7] regulator: dt-bindings: ti,lp872x: Document input supplies
Date: Tue,  6 Oct 2026 18:44:26 +0300
Message-ID: <20261006154431.318936-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006154431.318936-1-clamor95@gmail.com>
References: <20261006154431.318936-1-clamor95@gmail.com>
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
 .../devicetree/bindings/regulator/ti,lp8720.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml b/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml
index f2384749314f1..ce4a5a7fb59b2 100644
--- a/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,lp8720.yaml
@@ -74,6 +74,16 @@ properties:
     description: Initial DVS pin state. 0 = DVS_LOW, 1 = DVS_HIGH.
 
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
   "^(buck|buck[1-2]|ldo[1-5]|lilo[1-2])$":
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
@@ -86,6 +96,7 @@ allOf:
             const: ti,lp8720
     then:
       patternProperties:
+        "^(vin(3|lilo[1-2]))-supply$": false
         "^(buck[1-2]|lilo[1-2])$": false
 
   - if:
@@ -95,6 +106,7 @@ allOf:
             const: ti,lp8725
     then:
       properties:
+        vbatt-supply: false
         buck: false
 
 required:
-- 
2.53.0

