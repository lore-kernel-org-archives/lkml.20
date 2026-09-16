Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D81386C2A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528108; cv=none; b=LD0/4+xbRC8+lVx0XZW4Tu3bPMFeZPdgQ1npOLlKicEKSP8r8tJY6Ys/P5OVhA8eSCkDFrjxAh28KkH0m1sWvEvBgZ5dF9jUy9kBiMMKmkRQTFqhtR8RMwHpU2FeSObgsGZW7zQPnOU61VLgiPO7lDvoPcr82f25u8u6Ai1kBiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528108; c=relaxed/simple;
	bh=DpWiD8Cfu4Ku/u5pgdm/NldUMARvs9TawVNZAjHM2lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vwthzvl8Hxic7TCDgKNuK7c+vk3byI/1o4FlKB6shxrlV/rQsltTFGCcl49cSRh0uBcBzZzPOjbM4x8LcHMo13j2x38ioe7fdHiCMNtjXsJ46wl6bbxg6U2Nti7I3NqSFJdpR7EN0r4t3RRcCqCVtZjilAt26NufTR8h3V7iiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPx/I4V1; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPx/I4V1"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-80199394f52so273603a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528105; x=1790132905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acNZzyf/OWXjg5U+vhwU7dGtHUd/8SQbsA8hrhEspe8=;
        b=BPx/I4V1fOeK0Je5cP9owUZpA5r5+7ckCt3Isx7EELUqIIvyhOgHTyEjaZ/gjxnOyN
         9AZpAV4KvhEJezuEPlDfB8V/nHECUJlZJAQRx2urHbIgFgoJ1TsXh/P3YGBWxxwvF5e0
         gCLVenfD7pu/AL6DXsa9RfWOa2L7yJUYlhrELzU/rE64OO2+tfee6RWqvXjwC4nBFslM
         WbEiejiGw1nukTZClXEzTkNX0uMZoY4Zn6oS0cTVEGiEGIhtZqRpiZxo8eLUMhn7r0Ir
         oG1QWMcOZ3flPrCbWRqWpdF5gsbUfdEPQ64PeA5KdFExNXHRbPE/kWlpMZjQYIVK7aaa
         bpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528105; x=1790132905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acNZzyf/OWXjg5U+vhwU7dGtHUd/8SQbsA8hrhEspe8=;
        b=qYB3zA2ZlDWdbchnBo8ByYhVYLz0U+M2ANTADU44Jx0uDKnY15lY+P5+dM+eQsZlZu
         chtIxzpvEMXHBDHEyARVGylfgFCTubjKhR5TlP+LXjL4FB0/gFFQpfvSxdUdb1D737rk
         rvyJpoZ/oBP5S07Owa/zNW6EWJScArq20WMCg2OgrRHfQEh+TWwTMIAn8DLlVx5OLkAf
         rKvMpyanFBws2iFbN/qu0YlHLcLkE9spqi8pbXyAlLjlFg5rMqRXulAu5q9UguBs1mLs
         Nun+1LWdb8Gmm/EuThhJMeod4RfiV1TpmfOU7A2FtoYWR/3+q2MRlawGc/eujsRrfZZO
         UT9w==
X-Forwarded-Encrypted: i=1; AKwUvBwcX/yw6oaOfnz7vRxqwC6YqBJXAMB9Tq/ysYM8dvI+QLL+Fukc69xWYInNWkENsl/eWJofyfFNOo4t7WI=@vger.kernel.org
X-Gm-Message-State: AFuF++n7JvzidFL8xIUGiWBKiRUNkYOJAAcRPbD+dksew+dHbMONQ2mO
	bowQ9gvAOXwB9v6iiNxYCmW7ueYZ9dED7EuXa5vvqXtsPnc9ix6URV6IMba6NpvE
X-Gm-Gg: AYBFou2QHNyhyA4g+raDqW53Nj+0bdMPJYWzg/Mxop6QNxNJsLuSOWSLesil+QwTJlU
	rlse3Xmn5HmhnDyXs1sYLubaFM8GzYr/hRT4+vdWL13ZtcIOG8MC4Xu4k6gw0n03E3KOH1J5Ybe
	2wd+qmvDByJ1fV4W2rZ9G1tdGZYOZA3GyKE7GGyOY0HKhETGXqrdGFao0SC8C8Draml83vwoJnQ
	BMbJRv5eOxGa20KKMnCF4jer/jzm0a2f0IzXt5frQDT3nc9kaF8ZAclDJ2MQO5AP/h8DbykiHek
	ZDwOyfWDKX/edxOeczbCbzfjnIgkn3fdcT/GLqL7oDzlYsqPJpwLIHBDqIwG8o0/I1NxZ/z5Lop
	kZXUGRjS+qzCLHK6oxnCsg9D1tvJGvf+isjMptC7vSFq+hMD9J+97GUrdPNLx/MLJP7WBpCzU+G
	ZfpxlX2bmxI7nntKkc7ddq+/JQf0Agf/muTzZlc55YRR9YrF+klei8ns1Bh0ahiU3onOG31UDq1
	Fj4Cczsd37Iwa80VjCVaeV448bKJt4Uwg8NeVAgGYNg5kNdntZxjzH7KN2BIQ3BqlRAV+TiROT8
	cAfQHLKhPQc0EXMbacMItgzQ7Nj7QWcOOuAeGOXMTjfcox4YgHfcdXEdOZUqdu5wLQvQLwc61Mn
	VsIBzclZJ55yjzJWKGHlDqpo=
X-Received: by 2002:a05:6820:188e:b0:6b3:f4b8:bb86 with SMTP id 006d021491bc7-6c7d1bc852cmr1139016eaf.22.1789528105201;
        Tue, 15 Sep 2026 20:08:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1718078eaf.6.2026.09.15.20.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:08:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:07:40 -0600
Subject: [PATCH net-next v2 1/2] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v2-1-322b32e40eb9@gmail.com>
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
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
index 2ed4564ae99d..b20149c3e850 100644
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

