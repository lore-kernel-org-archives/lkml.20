Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442409;
	b=XqoyV9VmRN5OjkAp++gnjbSuZIENEOZVCVcU85gBXQXMGUHTYMK4LWTWCX4/B4F+zMpD
	 fZUCPAVwAKb1NSkEuLvnFHRCOlZsDrbgKqulDE9wAOkVT5pwX973/Dr4wDhXBdHFctwvX
	 z7Hj4yePPHPtjzsNOIm57TogAgu2bNvz2AmJuUdvTMT250Ouet+tseCt4E7Rd/gr2gEci
	 U5FmXkrstX8cVQOVs1iCcjewijtVWXXd+pIjP4cTUM7ke+CCF2BdNuEu5mAsJ5FDEw6T7
	 QbzFX80SSCxfsdKElReVqGf1umJW/tFTNRT5pqbHsFYRZrmAZp4qJcC7EENrScJ+L3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
	b=ybo2rnGDpSlXWImMGBqm+o/YMBSRFXl0cLhG945qkD1eD1G3f4NvzQ68XGK4+rU3zErI
	 hovY6cFcBl0dBXjhCCbQR5QJqASBZwCAyBGHvQ8SRbdk7E/ttKQQfkE2EDNEEwqbWq/B9
	 b/NSPLY/ktCBwVxe3FB80prxUFieu9a/7So0Rwj2i0OEHFthtaL92cwV4UJthdIikw7xv
	 XEWS4Nxfp762l1s982S/7non3gfo+cKZiiRyROuUelEvBGxvJakKY7IHW7wObop3IpwUl
	 pJ8rYhWz6UOrNi+5ZM9C+gFuC8R8PiepxOBbsPPjU7wPbE7Uz86M2zp36VSUYP2o7tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYXG+O8;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714AE606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILYXG+O8
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so12816345e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442408; x=1794047208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
        b=ILYXG+O851xz2mNFgBIQEbi39aqInmTH/XfsTld5HmlZ05XEuURakX5jvYQiMskAKQ
         +TXaCaxNEnbPmX/0cN5WGtzAtYn3mvq2mukSMKzyN5C6yQVC7ICLuCODe2hVPSPrgvyy
         3CYwu3ec1pRO5FBnCwI0VSkBwsDADVT8NkSo1l8EBONb8wb2Co3P0ls1q3/lDw+oT7bc
         pFdBEI2n2SE9wVARJ71dBzUS2H0ZClcmC+6Gz2GUU+NM+yZmNlZeHlvQT+PxCt0Jk0+U
         8mUnBm40cqHNn0TW0QlwBcGe0eCni16Q3mjR+x2Mi/jO30O80+Dnzmm0oxXuy6nciQur
         hwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442408; x=1794047208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
        b=ic/FoAJprOwXG54sosW2WJEak2ao0/16OQMBhausbd25HB7TxooMB1elzviA4suWAW
         wgjY7y23B+WmhCbOlSV2E/jWbskVmorzaqqM/JuonbRRhsg4t2YsD9HWRmvNmBecl0s0
         OUSal+WpY2h4lhyd3H7CHgVg+mUHzZdUkFJUEvSq8ahPFlyPMeir0frZYa0iJm2OprMk
         IUSHZ0wNzOemvFc8zE1NHH5nSJYNeYNVrQ3OoKIm/bySDSu0mfb3hguaPioKZhz6Bo9c
         jGHKQPYJrHI5z/+NoH1+vXuSaTyzh99yQ1Rl72dhq108hAZpGYrim+CIA4+rSQrHgP8W
         FRrg==
X-Forwarded-Encrypted: i=1; AKwUvBxGpFuag3SLNFtSwbCwvh+6NYYT7CcuYzpPiz5wRbkBnE1umOeXWx3VLsvX56Rcl2+NbBKBgzdV5/HKN+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3QlJLHI0AtE/UVO6C1vKdgHnN9ZcVKvNXPCgPy+RsNPeDbYVl
	SOeVT83x+0J/gINs7mZTFa7OjwFs5xEKbTIXaueDg4YTIwGA48CLG7NP
X-Gm-Gg: AYBFou1oIZcL3Ya0NOvOt/lNb7FVTAXJ/NDevIshUSElBSSmk3oF2vQpbCK1AWNVNXj
	AwbZ1t0TPbI63KmRl3B5WXyFKwN90cTy259BDbc9OuVXPvtYOS+4N4DRcG1/52KS4wFAKGXOjsd
	MHo71pJmbruCt5MMKjOLhojOJL1En3CvqdFZ5Zw1lflPqvOzUFWt1+ipW/w4ueKPCoRzgPJK25z
	HeAxYyOVJ4hgD/8gG6c8W6A+1gZ1iSu/8mw7i7L83R9Rfq53teVg3KBpAxUvgJEPxCDyq4bVivC
	u+RkYoN4fNFdYTxje7b+7E+q28gfKg7+QmN6e/6Q1gGGvDTH4mrqs9kTYD9wg74mFbn1OG2RE7P
	Jg1vMtaofmoWhuBvgJh+4S/0f/raF2pqa5lSKQ8wyDlFJFpgy1V1f+zhIZxQcQwtrgUNigyLtQv
	a+nSuREVEI8ErWppnTvsLVIwHv+IBkVDLplkaeQWtHNvf7M7l3RCeWwxu/zL61/bItVXu0Uax2E
	8F/RsI9Rhl9iHE9NRCx+0kRS7U/9HztfIeuf26wk8Z9ZmN7G0VPcs3pnzCCE6u+131ULaD6Rh3x
	8ntLDxpUCmHUyiSnp9gbZGzxC76fnaqkonGaJCHQzRDahg0+69bht0QwZ3RXetg1hpoE4I1Wq3c
	EUjeR7xVWKWxa
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ac1228978cmr101856105e9.0.1793442407739;
        Sat, 31 Oct 2026 03:26:47 -0700 (PDT)
Received: from Ansuel-XPS24 ([2a0d:3344:54ec:1210:f1b7:9ece:c6e2:5df8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm90903535e9.2.2026.10.31.03.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:26:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Sat, 31 Oct 2026 11:26:39 +0100
Message-ID: <20261031102641.12649-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having SCL_STRETCH bit.

Add a dedicated compatible for the Airoha AN7581 SoC to abbount for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes v2:
- Add ACK tag

 .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..e6ea5bc1c681 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
-- 
2.55.0

