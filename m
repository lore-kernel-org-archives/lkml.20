Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816478;
	b=kN65/77EVyf/yuHb63xmrBpXxeJytjppV1AZmaavf4EMGQHYUXkk35pRGOOONnjXSxjF
	 XROhReGVUKRyDxfeldIcMI+1vrwumAEapSgAHOc9fMyiTNPcSvkX/CAkBMDtrdmGEFlsI
	 BRoxOBUYaKFTQvEYikfJLQ8q4YxzlxBC1A9+5LlW1udrOaOJe9qpHN3GMwTr6tPMKxyYj
	 yoD3hJW6jgvn8Mcdbd/Zk2oKBZuw7/gub9a0yw4SIvep5IrV/6htD8zxBrcSk9NfbhH1X
	 gqOE5ijhhIotSdkJcNDIAGa/MF5XdD+7B/NW5eds3IO3ITozXMknV7prPd5ZKyxjDEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Q+kakf3+bGYR/XpLFDDkxjLybCV6XrtHH6WOIPQu1A0=;
	b=4VrI7BhAFXHhAoPTPnKxyV5zIiVfofdVOOw9jfFLCqRbkgK1caf25xPzE6efcy2m7T1d
	 eLoOjOIE0wVmqBl/7c80XJxYUlON9g3Gp2MM/ahrgTsQ878OmLgs1FpOTzAN919mbXq3m
	 AYO00yXf/KePD/yHJyNnL0wpjbCTWeGegD6HMNP7fMOZzLkpGdOwRMgsvdpz/+uiigNBp
	 jA3QiZj89cvC3d3QAfqzbR4wPP4ISfjhYzJDKOH2wohYa47lvqrC1jyOxcrnkwrBdCvDP
	 JcFIq6K9wqn2ksodQ6v0W1HUH3dNgbYX6KQwOokvta1KhqZOY2c2mTCM8RCib+Y9u0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAJJNu23;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6D6082BC7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D6D6082BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAJJNu23
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd2c386so734962f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816476; x=1794421276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+kakf3+bGYR/XpLFDDkxjLybCV6XrtHH6WOIPQu1A0=;
        b=iAJJNu23CPWLdbMHHLohwld1D5Iq0H3WizJY08Cj5VAeuOddC9clsyvI7rB66WUt98
         dy6pTFjIawIbQIbhudn5TDxpFBV/fjcvwhGzl6Ee+3T4pAkxhVBxVbcAd1S/vOg9Bhln
         PzanBZjK7SGNdSpnWfovET65qjh9FQIPy3xlCNZ1L8qUKcx1KvQCkeuwd0RTojXoaAtV
         ookjBWFVN8Hxo3LQsWXifYUYHasJar2ogNLEvjtUkghFlDVL1vv1Ya5FiU6cJI//V1yH
         ICnj5RnICtljg8BmGifR2hHlT80ahfbRROT6t2qE+Cihd70iIlsd6eVmkHYQykUDJ5YT
         racA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816476; x=1794421276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+kakf3+bGYR/XpLFDDkxjLybCV6XrtHH6WOIPQu1A0=;
        b=reji+A1LU3cDpXMss+I2CIbglKETsQTlZZnGcaHwM3wqxDwCe83AY9pVyLLyW4iLN9
         Egva0NSWtwvQkCAtkYzxNXzrpNt/KfNtYPpwu5JEMTPTr/TOya67D4RQYkBioN0OzHI+
         u2wOaUCrK9ThnnI6PCWfCRWNXRcThgLSBQzKmVUBng8hvxnvFQZlXbp0FXj93+/fJknL
         DfzNTf8BdUxnqOv6csQDOR1hml4DZhbOY5Aa4mpdHSr1OpDFgRIFitF2XhkKjqzGjXd0
         eEORFvheHhR8bNNW+3r+sYhVT0TZQLXCY4x/1DVcC5ijRWB0fS5xgEMtltO5/FHopvja
         JtnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbj8rUrOEm9KM7s5vlnc7zmvAtGZpuDCfaSswIIT1BgqAFUwydZ9km+znKca7Hpoo7U6YbmEMYTNxwKKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z901B5pRgMRr95sL55AJSWSXV44SImpg49sD5Rw3pr+MW0azY11
	h24SOiNaieMKtRlYR2xvEoXjMwGVtEXf3+4dniQgNtNXbMCq5YgsIhdT
X-Gm-Gg: AYBFou391c/2qfZeiCV/G8ubrtu4go5eIHEc0kWkcI/8E10RN85MfLEWKVaNCdZzZ2o
	A8fYlH0WM4he6XyjFkSKhAj4UCtgqztwDCutRhdBwSFt5OlQpnhFEW7YNdJEGUMhE5Wrm+tnwO8
	3HgxEbMbA6jJAoB8PAyyrXQAOaww2L0KSWxocDJ972dnpdhPD73JXf0sENVNWtfDRkm5iMjszEL
	RpCCOuH4wFRobklgtbXKUqsSBFhxUYi0mno2iI3jw3Hv2H3O2bCSyGH9ns5ZJ0huhukrqeZ0ECf
	ZyIFnTNRhnYQt29AAT3WQKYEt06tUe7YfmSbkt7LrAGPFaJwfBgtQ+/70DgIJm2h1W7aNEbeDzq
	Yaa6pCIvNgr3AHx799Hkxzbg6UggtOSwYWX8hfT35QQXksYfZe6vpj7ZBWm1wQ+kHeWNNzH3PwU
	WRpcwMzQipuHDK6PsIO3JxmM68gxZMG7slUYh6FdzjLZXtTCKLrKBKbiaWKwdw3qNHXkIZAnmTV
	TzkQ8b/fnAjOCQsc+zoma509FWm30QPMZKqZo8juB62E4GqoikKnL9fIZ/xivolV0DVlM+H1376
	ygDif+iunxJuZlkpe6RSgwXGURAKDbc4z/I+0z+k1lZbWWXeccQEEXvKUJIU2Irtihl4RygcP9s
	e7rgLhh7Y9fMqYkZwobYKY11JZA8UFGsGfH0lM18ogVE2CFdCBY6tGvu0ckA=
X-Received: by 2002:a05:6000:40cc:b0:48e:5ea7:b1b9 with SMTP id ffacd0b85a97d-48e6e30543fmr40091601f8f.31.1793816476315;
        Wed, 04 Nov 2026 10:21:16 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.15
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
Subject: [PATCH net-next v4 04/14] dt-bindings: net: dsa: renesas,rzn1-a5psw: Reject the "ports" node
Date: Wed,  4 Nov 2026 18:20:52 +0000
Message-ID: <20261104182105.1102555-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

dsa.yaml accepts either a "ports" or an "ethernet-ports" property. A
devicetree using "ports" therefore passes validation.

Replace the top-level unevaluatedProperties with additionalProperties
to reject the unsupported "ports". Also explicitly declare dsa,member
to keep existing devicetrees validating.

Also Add ethernet-ports to the required list.

Existing in-tree device trees use ethernet-ports, so they are unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- New patch
---
 .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index fab6aa6237e9..9c477ceb170b 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -45,6 +45,8 @@ properties:
   power-domains:
     maxItems: 1
 
+  dsa,member: true
+
   mdio:
     $ref: /schemas/net/mdio.yaml#
     unevaluatedProperties: false
@@ -73,7 +75,7 @@ properties:
               phandle pointing to a PCS sub-node compatible with
               renesas,rzn1-miic.yaml#
 
-unevaluatedProperties: false
+additionalProperties: false
 
 required:
   - compatible
@@ -81,6 +83,7 @@ required:
   - clocks
   - clock-names
   - power-domains
+  - ethernet-ports
 
 examples:
   - |
-- 
2.56.0

