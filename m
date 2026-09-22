Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D0134EF15
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037934; cv=none; b=s4Y2EYX+Hzhz53S0IWNW+tiwDATCMAc9i7pGPZsgktvUoY8gPvT+VFdSSFBJRSbV922Y1CLoxAzelcSuISItn6JbUejTVfcagtnjjkEGySSuMCblIpjb8ZzLeuVAlmGJ+V/6t8uDMeEUfObcrQ2y8cM1/1K7VpPJXjM6wUWpOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037934; c=relaxed/simple;
	bh=Gj+LzOejuhn4QUWRd2BeQZ06xMLgJHxeiRX4lCDRZzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFHOna3HZUVbv1J8BvfY/jHqSxcZVN6jeOOO21R2SzQ0GC8IoWDjCvYPDFtuCHu4Y/TYb/0Y/X9Qr+a47In8f2vJiGYtcoz8irSFcoPdOIGxrYRhTTmo7HpRgS9zK3TM9KK5neG2u6DdjWULygYbGbVPtqLwzqDTXWEn3pNMPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7inqSqQ; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7inqSqQ"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bb359e6878so1340045b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037930; x=1790642730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=A7inqSqQ4WJ1W9QuTjZA5aBS3Q6LjJYOSgolETL1tkZbq1TRo7JFlWOmid9LnUub1+
         nnjlhjs01OsTjSGGtHJRK92xca3bsPWQjPTBGjhHNmkqgTjq56yehc+1THpWSz2CDYtt
         OKF7AHbTssWe3fnWHdH/CWoW0L6WheFUTY6PfVamnTGZQBizhEMFmY093qbdsGTsxOoE
         phO2hOtUs2TqdKEWOl0ZuWZob/lXOP0E4sJOxvZ0i8xUOkYo4/Pnpyvybu9qhxg11h/L
         R3y9DMtaoZZuW3GCBkrapvTOnzmZ6NAlHOhZmwZPDx35+eVb2WotdMoSIyjasmanHMEh
         xBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037930; x=1790642730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLXSL+1npHD8gI1D6ujrAzi7XeKmrbhfqQT3WXutYPk=;
        b=IqgiNSU55ut7OVE2H7NKFBMO3lMVhIY9gRjKrNthta6p3Kkb4G7jF+vUYwu0P4//Qk
         c9QtI2Jh9Xc/4DE1AQeZsQkguX0aTo0pzx4nHXHjuNAx3/F++l0U7BVhAOLT2cXjP9Zs
         o3QlrxhOCNCjLM2u6s1IiwSo5lmHh8b7p9piJL5u0O7KThXK1XXj+AAOi5X+vHPf+KHV
         dahSctUlGj7w//gsc4wF3LgrwlRIUsXtZOEv+6l8pnTzCvSNUZO8LcMimbtbnSGdtUMS
         WFIXTncgDazBGRcLIl3v5Ub+Ds5v46TCb0g98fVy7ujAmAvAwvIefyUvFjg/+MviEHDa
         zkiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRHoQzIhiVs9r8vU1whsiH3Qa/in6sGaEAjEkQooKAxN6A05Qzg3RhBU4XeGWhjDcma0ka50SDWhrA+P8=@vger.kernel.org
X-Gm-Message-State: AFuF++lrBtLjybqdkNJFANzZtcbDERrjZDwGiBfF6S22m1HRx66E3Mqa
	ng/n2Rohp7gVQoDtuAycVDLrEnpXtz3Iy9pg4BRqR3KpU1apR1SDTHkh
X-Gm-Gg: AYBFou06WlobuZVrA1Otv95V8twX8HTXrS2Tlej/1Za53sa4wfoitSiQvL0zu7X26NU
	r0ZIXNgzYfz7WSGISMTftq/hUPEDh3a4MUgONQIgld2r96MM/Q/bdSIkT5thVY6kd4WFTobw/RR
	9QNzbf09rlVC2CCOoN/87yhtUQJpc1WqWtMIlZb2aEYJMYcRy4KB5C+c2+IG1aFWgVN/zt7A5Lr
	DQPc151s4+QebcZ/VWTY//SH1QytXUx0G0vDMfRBWqtEkuZfi7vnK0pVGlZWixb1NMMr1zKcoOA
	Rbte+zmMbLC/XkAK2isOZf7xNM1ezZIIKimhUtplh7vtgO88fBnYPOwefmHm9up/uRoGFAE3ngp
	3PXZW3HW79p3cTxs1RzfahthAE3cQ/E1I/YGZE9m8+SJ/Wt8Q7qLObWDjHaQUe0b4vEadOi0iL2
	lBxVQaDEL6CH6F8o6McW6xQiH0U33pNFSnD/OdEDntZ4qu4pn13c7fFg6cC9GeotLmeuGsATFWn
	d6FO/nrIk9zsWjiSMh9r8Th/oFjujwbJxQJ2cmXE8059sfx8ED63eKnLETFeuRHczYSfRPj47SY
	DZWfmjM7FvvZL9G5/rueQRehNCV1Rrj1aBNl9NEGdlHB9VZROqqgSs+CeekgW9TDqXHvzR2sXTM
	lQKI/vdkMDa7k59LG3ROXlA==
X-Received: by 2002:a05:6808:1526:b0:4b3:7aeb:1b73 with SMTP id 5614622812f47-4ccf59c8345mr10592065b6e.2.1790037930082;
        Mon, 21 Sep 2026 17:45:30 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:45:25 -0600
Subject: [PATCH net-next v5 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-h616-emac1-v1-v5-2-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..2cae0133b3cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ff9e3284a06..3fa6e17c3d12 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -623,6 +624,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

