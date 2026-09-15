Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F3C359A70
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506043; cv=none; b=T8ktOK0ou7sox6A4BKLtQVF1Dc1JA6bKbe7i8Cl9OA0n4CsDTZ96AqU4dhVMHWCw/ySA7tQcNNpBIEEwLh6SrjmH5u2XvVAgxHgMWPXD5aXNwdOvVtNhq22uR1aeiRi7Pz2hkGYcZ4QbHfYi8iETnQi/6cJXNPV5p9+RXYX/hAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506043; c=relaxed/simple;
	bh=3NlwmlgeR9UStztzEJOa5XxE0OKSg9rGXxb09yHnIZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aogsxzzoLlfzWXolBYH//dHQfME5KPiyBOLCux3OIWc+NVHq1bfbuPuto8vFGz5URUSoh+tEj2ijzF210hVxssJvMnhKYRARV7OSyyGnx4l7QwWk8cl4f17h4k/SG8zpXKn79eFnSZ0L2yqDzL4AC8UwUHEeT6ynLE9nJzTY7Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIMvNrJX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIMvNrJX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dec5de01eso29307a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506039; x=1790110839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnvNRJTUsdTr1CADcV3hYsbAspY/4YujciextqHo7XU=;
        b=OIMvNrJXZTiWrkry1QwhcUj3CbDaE2vZUvx7LmScDOlSaexeFtFd007VOergZTEC7l
         OSEfLRXo66pbbmwIJylTCksYSuAvh7TBQJaUdx1J33tSLE2+c1ikSqWJbxI1A5BMkXoQ
         P5iTifbtP/kazNhc/NwVxP/Do/j1lMQtcG4yLKwKFDL3yKe0SMx4R9mrWOf0CDaPFyCX
         7lcmS7kPX/XT6VqcJfsWKXyFVI5S7Lw2b3MfWB1dqnx1bBkV8xyXOz44lHlLea/ywiqq
         g0VAh4sx0RDTPh48aXlhNXsFxwDWvwXcOZ/d5STDyoEeuQTX7R+io+/MUiPgDVv2Rybn
         74nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506039; x=1790110839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnvNRJTUsdTr1CADcV3hYsbAspY/4YujciextqHo7XU=;
        b=XnZPSGQIp7U+ylnPj1QN61PFVaHBWVimBhAaelIlkyejk0eLzmYkpMgEUFnw7HNbhQ
         vNGi24y5vCz66beFcG5EYa9NrFlQAr8JhecbuLSK+/S2Le/gNUywJ3GUmzlSPVnZggnt
         rjgrB4Ugv8QkAOlBDjZ1VS/YydEK6S4g+jfd86B7zol+jRnR8yq9Xxz1oA9aarpA34Pn
         NDU3xBBglPWq1XdqBBUOwyd6n2/cyv3tt6peieL44n+XB7wKjfAL52FqxhWfJXrjx64S
         GT9Lnr2vbKaoiIQdxTPqcoAE0T2OtVZUu8fBMwtFN6Gb2mq95SonvocGVN9JKNWVCfCY
         NnJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRHpra3iv2ASR5+GiYI8Y0OO9daxDFz7BGk4KWZJYNQDrmYWA6V6yc660JJVqy8DD8ZIKEyOTF93NuC0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mRT75RxroFSylFUVLHMTjNiTSOhrW0DVVLTeMGdD6FoaFD+/XT
	DvYxEKAd1VLNiEVvYHoqIvdgAoasPKRqu8AoIFV4/42HdUt2D1Yx6eLR
X-Gm-Gg: AYBFou1rKqx2GTke3LyNAc97MFkm9JPPa/I0lFunT95IjplhDVAFZhsLtw3LF375g0I
	NLZVJwVmPkVCoDiHfOw9i+eCMfkZ3MngJ/NbxnPTLeMcqn8p/eNaqllIa0SYVQR2uLZ97M2hTIc
	aZ7Vinr3LGtDysQ+yLdErO6MhHxnY81NUdVUxpzRnDx5m4ttsWiI1Oph4h6V1z1EQ3+TWctWtGE
	GvHNVJK+Ixqvx4d8ojksE/UBqheYvzQ5I82LQfUKEEpG6wiKap2VPhPjrJ1fBnyLlRMmdepjVfs
	RegXfOVJMsBD3mG0gCgv6OjTvq9UYiOCQDCLPS/ZLJYGIoLgt5kn6+2GT5qxDAItlDeAemRWpT8
	aqmf+kO2wP1AtWkuUG48g5toaaiylwPaoyZ7xlTDgnP99WWMdoKw3BmW4j20xWSXCzjoXSzFzyg
	uyGJ++bKgQIw3xiW4+3dP8Ks/zPKDVxeragA9pbcBToYh6Wj2kkTmOfJorWxIsL5t8qCqnKA89d
	YqHhbSkP7k=
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr118300a91.5.1789506039587;
        Tue, 15 Sep 2026 14:00:39 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1483sm465432a12.26.2026.09.15.14.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:00:39 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 02:29:40 +0530
Subject: [PATCH v2 3/4] dt-bindings: crypto: ti,omap-sham: Add OMAP3
 compatible and deprecate ti,hwmods
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-dra7-omap-sham-fix-v2-3-4eadb60081e5@gmail.com>
References: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
In-Reply-To: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789505986; l=1381;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=3NlwmlgeR9UStztzEJOa5XxE0OKSg9rGXxb09yHnIZY=;
 b=ZXwjniFsJyTCSkhGvIbLpRhULkdgCB1/C4/QtgW1ponKnqrQv+R+rEN+sSL8c9Q+PWN93nCPH
 5czedkWgtzcDcn6Jf6cbKfzpFYJPQpyBOOEkwg929QDKmLqi8guHMLK
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The OMAP SHAM driver supports OMAP3 SoCs, and "ti,omap3-sham" is
actively used in existing dts. However, it was previously missing from
binding. Add "ti,omap3-sham" to the list of valid compatibles.

The legacy "ti,hwmods" property is no longer needed as TI OMAP mirgrated
to "ti-sysc". Mark it as deprecated and remove it from the required
properties.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
index d69b50228009..3ef05890e13a 100644
--- a/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
+++ b/Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - ti,omap2-sham
+      - ti,omap3-sham
       - ti,omap4-sham
       - ti,omap5-sham
 
@@ -32,6 +33,7 @@ properties:
     description: Name of the hwmod associated with the SHAM module
     $ref: /schemas/types.yaml#/definitions/string
     enum: [sham]
+    deprecated: true
 
 dependencies:
   dmas: [dma-names]
@@ -40,7 +42,6 @@ additionalProperties: false
 
 required:
   - compatible
-  - ti,hwmods
   - reg
   - interrupts
 

-- 
2.55.0

