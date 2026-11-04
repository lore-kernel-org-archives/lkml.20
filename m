Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816479;
	b=vrNd951jD7A6Ql2pBrOlk/GAvuJVQ0qUvJNnZRQWWi0jkk5U5x7s75UN92+eK6fTO/7B
	 OdfheJzs95aZzFek9+TfE2npWJPwNSdYKlWMMh7EX7+3kgV909XJrrg6RRFNEKchtaDdF
	 /MliJ+UNgvuB6goF5tGJx++S3GHHBDw1+o0UVRWyKM655IMep3chncbjV297kZFVMUwTZ
	 bu9eRgy2aYKkTDSgpM3nKSQfmiNO2uO/KiQtArMVvP9Dexh/iHLjShd+7iVarczRgffyV
	 /vyZlF7t1pEO/o8392bKKvizXBUhet/0dFu98w8ZUDuUn3V30nEWk2F8vtn0CB9v/dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xFvESBDRc03vw3r4G764xn86wJOmVghZmhz8uSPjRmw=;
	b=gbfMx/p+LxZhbHm2CzmVD/On7dJWRUP/cpxqx9WatEQVXwYdjJq/tIgXiZvnVjD+brNo
	 rR5GLQGQruX/UuV2ZDFeSY8fyWiOLCIbuLOQTAqQaX/pXwatrLlq3fknEXdNiSswZ982v
	 0aE3p/OI4626IEx73mzDROxAAGx61y+rcNuExvcEx31HPq/HPlA/c7xkf0uqFvE7eDcUO
	 9JRKI2mvGG7TNwtc4bnW/tLWktMP4PUA/edbxHaWEXwkP2qeDJFwi5MHSCNn99qZAOJrZ
	 1JSBsiP1IeKfl4tcDL2sEsfq+Clzpykon6eTDI1pmFOusj4o/tO+M7VZeRPwm6A3O/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mc2YvxkD;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97BB6082BD7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97BB6082BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mc2YvxkD
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so934091f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816477; x=1794421277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFvESBDRc03vw3r4G764xn86wJOmVghZmhz8uSPjRmw=;
        b=mc2YvxkDKEeg2lcrOssOXv0I+WaqYQYrqleUksf2y8thSRC/rHemThvT7wQcFheOf4
         osQJ6NhXScf07S4avWAH2B43pAlG1y0GWM41g5kRwBOvatoiSl1gOLxuPaNxXFU/eHsC
         RxwLTYH/fGt+0xvlHbcZxw6iJyGvI1KJ71nr5rGwn5wew0ztYNmDZkVrmrFawweApqdc
         qFD15KvSU6EKoKCRxvTxIWfeYFuhZLXYRj6MTY85hk29aqVH4zH2WLFyMMCE/v9Ehc+g
         xpdzZ0MZgcfZ7seqORjj266fQ1l2huUXps5oqIRJUW61KFvrTaPcnw1Vj1YzMDIRvLSg
         TulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816477; x=1794421277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFvESBDRc03vw3r4G764xn86wJOmVghZmhz8uSPjRmw=;
        b=RieZ8Dm0+86gxHsLTxILhFejH1NaJs5yX/46nQYQ7Li2o7Pg//+kXXdeHf9yyAJXkZ
         6fAcPM6LEn6fIcfgh2uUhRnDZnZ2h1UaTBiPyFADHpWcYixrBM1HSnpPplrHAsHs/9je
         W8uLl6zLMcDl+ivnlXKWj/T/eYBoMC1HxHGWwCHKKFnt2vha645CS131iWaes2fUNetj
         TYa59Xqv3GcAe5f/87ZjnfHOIDEHNFpOv972fzBEsED0bm7Yf7QR3ZMHP9bpeZH96gUh
         8pIfSBJurt9ivPDX/os0O8Ku2UsvWacOl/3PdzuLGYaay6nCeckDBZErhEPJBRLzkruA
         U0XA==
X-Forwarded-Encrypted: i=1; AKwUvBxpBN+g81dgvm2V1r6p4QAPLRt+DkqeYejCf324G3NcvarqqnNrFGjwg27x5/EztOxlU3lQVOgtrSd1XyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eoZ0MMk4lRKIX6tnxc7vcTH2rfBgGxA1sbJLR13ObN1WEb7iC
	2AQshg7Sk3nw9+HcSPxg9tFrm5PjVc3OvyKjJUvq+Zr3xSF3SydyXzdu
X-Gm-Gg: AYBFou372VDBc0HACHos3IZII2LjIXvFMHsUs5P82ooyaK07OS8dJ+Zs+J4GOQt478w
	YGCwq5tbReKGHIfsVysAG7GBZCj5DhAyifGACilkqeeV2Juxm2yjmuAo+PsJs315o5dGokNQip3
	821Mw/hSp6pD3oNbUaDU09lZJZqrNI3Kr+0TLRpiseoEwNjFnwO2+0YMAoczaq6ItBfzS+5EsjC
	73k7iIWlN082fGa+b8lHMvyACntcCOgm2U2p3Dg+6Asug4u4VTEuNKqB1TpiixqnNN0dfSh6iZT
	UnPd+ftbuVMpBQRhk7a9zZxNPJQIdEGkShRwQ5oZwpE18O3vI23ouVzwJ+UH1QSd4wxmDGEVc82
	bjAaxhu8FEIuz7b+knsH6oH69lEP9sfOfVqCBEWmoZXc7qh59VBJCX3NtjXEgOi/B7H3RKo+ybq
	XWdhADM5b014Xh1T5C4qKgwDkPDmy0jIbZUBNDGZpdvYtpzrvwdE9+b95Gb2B+f/gC5+bfJ34WO
	jmvFZ0eXF74fap+voLGhvUa25Ec4v54swGtnK5HbyNZN32CRy7Xpt17isF6Z6bOWREQRVCUibjW
	7ApsGbDcixZYI+NipYuVxO3oNxpFtQaIi+afccTEMDvy2jTPbvR1Mzv7BKDUc2/vCg2/ydNa5iQ
	h4SOga+ixRDbuNvw2xeCR2lgIqCFcKZYlmMF1qQ==
X-Received: by 2002:a05:6000:290d:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e6e2dba63mr36517267f8f.7.1793816477063;
        Wed, 04 Nov 2026 10:21:17 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:16 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 05/14] dt-bindings: net: dsa: renesas,rzn1-a5psw: Disallow ports beyond port@4
Date: Wed,  4 Nov 2026 18:20:53 +0000
Message-ID: <20261104182105.1102555-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Restrict the A5PSW ethernet-ports node to ports 0 through 4, matching the
hardware configuration of four external ports and one CPU/management port.

Although the schema pattern limits port nodes to port@0 through port@4,
additionalProperties: true allows other port nodes to pass validation.
Set additionalProperties to false and explicitly allow #address-cells
and #size-cells so that ports beyond port@4 are rejected.

Existing in-tree device trees describe only port@0 through port@4 and
are unaffected by this change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Added reg items validation for ethernet ports

v2->v3:
- New patch
---
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml         | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 9c477ceb170b..250c59e58439 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -63,12 +63,22 @@ properties:
 
   ethernet-ports:
     type: object
-    additionalProperties: true
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
     patternProperties:
       "^(ethernet-)?port@[0-4]$":
         type: object
         additionalProperties: true
         properties:
+          reg:
+            items:
+              - maximum: 4
           pcs-handle:
             maxItems: 1
             description:
-- 
2.56.0

