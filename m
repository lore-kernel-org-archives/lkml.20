Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877125;
	b=vUxdTEYeepOrkjg2ehdBr7AeQeM2zm1enfGi9rrAx0Qg8R9b8eAWqrU+NAMyaWPphuIq
	 tdem94YrHa/XCFRShhq3jfaXUs/MrX/0frOEYv+pc27jnHuyX2BPG15/GGC4/RvweSV0R
	 yGQ6015O5lr5RDdK/J2JE6autV0N3wHTm7lKV2Zt64nrFZGbhE5+Cu6lWzdXVXp5/cUiH
	 raUPOX4JHavDT+Zk6ZyL0eHU8+3DWtfMDCfiAszaaoqrNDaA9VXCKe/p/nkmNKbUnOmO+
	 STxA8z7HbmaCvSI760rbc+oVkxmMAGbNU+QNbOadkxpa3QwnLDUNouC0vxj9hz7N32A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FT/A/DgEc/1PdtmIuuiz9qA/j5kLnlOWpR51oppuUm0=;
	b=DRlURO7apCE/l8IJJeArQJYf+OI1huFjqIAfwFmNvinZYFz6v1op7dbZFLYdyHmPAjs/
	 dCjQWS9tMYELOgbQcg2SRO8WI4QdCNCKasGh61I+PQhg4lrR80TvUNQbOIwLMT7F8YcXJ
	 +kr1Daq1an4fMDb9GDd3dSHtUUEnPXkXZmdCxRzQArIaeT/hOk38EUnDKRy36ED90WLS9
	 CSy3Pw2tY8wqTHiyjbJKseiBgvpoPz8eZM+dDjh1WTd8eaoNOtAfD+jBBBYrNVu/0bD3d
	 jerrxb1g7VPMCdmQpk9Q5iZQcexE8ZF9aCxBWYkJbr2+6uwP89RgcENNfzVPdpiiwnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FFY9UXC4;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04898606A326
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04898606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FFY9UXC4
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6669255e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877123; x=1793481923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FT/A/DgEc/1PdtmIuuiz9qA/j5kLnlOWpR51oppuUm0=;
        b=FFY9UXC4nEgSwxaS/SuV8AKXzuWttgHbi8x3huR9cAIRIERXXxOiOL1H4056S67fKy
         YHJyipd0Zk8OCh4mygo/AW5Zq4wNUSa0/srwX9oh9WnuMfdpOQpCL7idhjBfQhy4pBGH
         by4wi+S8CG9zXPl8BkJXA9ZOB/bjoDoc9t7EjDySRlmH5FGqzzFnXZsiAdQFzD0biWxA
         gxQL2k2L/AkwbBVc/RT3vdzBLteAzUV0wwaiEGrgXACrd/9+QHw4o94TgVrJS/8Y+8b3
         CxFw7GgFGWvkbup+GIdekR39+ntWGKaXKmbhZHI0e2jCQGhigvdv/mQsQQRqkzhVACoD
         Zcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877123; x=1793481923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FT/A/DgEc/1PdtmIuuiz9qA/j5kLnlOWpR51oppuUm0=;
        b=mJ997EFrlBJ8AUMQsF5qCK1fZlqXRYQWps9STyp4Q864pzqmvwzQApoAToRQ2W8bt9
         fZXmqo9qG2cEaFZZaPQtUDZpl2gk/OponnwPtp9O/ricKu3hSBaxWorYXjGKqdq/EGo9
         xRmsKhng/PyGkYxqWCLKFXYK9gh9A+egrq6tLsNPPMoOfCcazpbGY5W7vLj4YAyxkeen
         DO+l6ZnZeVpWzv/zV1ApD4Wc1yOEnQj6t/MYXHA20dzhAW3KUx5hnTpmrBaAtvjVy9tM
         rOMtkGtrO+kor2+ueWclVBQjkHfmvPORPirutl28V5AhtEfVnxV1gXHTiCZG/urh0jO3
         AD7A==
X-Forwarded-Encrypted: i=1; AKwUvBx8R/XxThXkZGZ3RpMdnls3Nl3HQRPo5sXf7hQGP6doPwu236jgLua0/ZNFmhFqoj3zhg9lfmyQK7JuwqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyR1Spmp9rnJ4SvqPRGnL8U+V277hYFR8QNYqmBM0dYuQ4oIiW
	/KrzmGMplnl7SFfg+B2oTqp2C4TQuoOHT3XnxxnnIbn92EMHzr2qdW/YNZ+GdyOW+5w=
X-Gm-Gg: AYBFou1l5di4/TFaQocxRaqtsFSTbx3yiUTAcz1PCDIiFqGSltLA+PaWOLyfC/j5DoJ
	xux/LHHvOGTr0TpfSwhXKt3rCvEeRxRm7VUaDgVZbCpQZcB5GsN4JUv9A5i9Cev+LlCFITIlM7p
	ZuGcqOOpxDW7pTUXPZpKpJKWrvkQw30pIdIsxp7bZ9u3jUSPeRCfC5MGo6xt7iwbGBqlNU53D/0
	hNFXqRtFqIt+47RTvUE22LaUdqCM5RSrDdE7ojwziYLKZBal0r5NMJ9HCY6k9qUrDJZ/K3CTS3u
	L2112MLpvoWs8Sx/vDYSpAI5aTK6nK9qRpM4iWl8T2wqt/t3tiv8WS1dvWgp45LrhZl/xTfrz26
	ZOX/Zj2bPagCsoXxOEeM50fCFNAFOjcRqP+ecaydWt1fl09QTCDx2FgfEnBLHqd1MG7M+ZTuUDq
	K+VGGUQPvwT5SI+D7mNFRl43TDAjikbC982z8FET4HkJHVuwyIRJO5mwhke/VUkmxDL7cUCoSSn
	JnzQEcEiS5ZxBj7X5m/p1JfgVSagBXPawnanrmCWGWMgffORfNCdSV3XiXykic989Le/ZcdbL83
	CSrw+d8CloBoR/XPdljbOwJ5ZchA67ZYoNJetcREthxb3gUwYapjg/1NgWI7yt8FsV/NfZcybAM
	fnK04ZVjdWfoDAatTPGc=
X-Received: by 2002:a05:600c:870c:b0:4a5:4589:24e2 with SMTP id 5b1f17b1804b1-4a545892686mr2153365e9.7.1792877123471;
        Sat, 24 Oct 2026 14:25:23 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm79597135e9.15.2026.10.24.14.25.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:25:23 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Sat, 24 Oct 2026 23:25:20 +0200
Message-ID: <20261024212520.91401-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024212520.91401-1-olivier@mgcrea.io>
References: <20261024212520.91401-1-olivier@mgcrea.io>
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

The X1600's I2C controller has the X1000's registers, so it falls back
to ingenic,x1000-i2c.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
index b61fdc9548d8..9004f9799fd0 100644
--- a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: ingenic,jz4780-i2c
           - const: ingenic,jz4770-i2c
+      - items:
+          - const: ingenic,x1600-i2c
+          - const: ingenic,x1000-i2c
 
   reg:
     maxItems: 1
-- 
2.39.5

