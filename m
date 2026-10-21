Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597202;
	b=WUvY8nt3iJrum1OO7gTK/nDNMIkVUaxJtH2cCsfzW9v8T3NBITIhoX7PMJgEx0v+Nfp0
	 vSnTXNXr/39KjCRG6dGOB2CZr4OxMn0QBSb61m3UBDMVOZv4uK0XLtH4wyf0ymPAaOUxr
	 ZiMnhSZWH+w1+BJZfyM3EwjDSFKGIujci2pbKJmmOFKgkUQoW9TeSE5GyzSHqrt+6StqT
	 eGzAI35vmSyPoBVkyxuT94Mn6aGVsDCiPAoozIvP2JNFnYDf5h/swdOA1xWpLdbOBrz9S
	 IWNmSIxSN5ZkANStQsKt4ls5nJb585HZoVG5PPe66U3JVlULCLfqX0Lqwf5I2+dEunQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
	b=gIoxlLZerPCILNI68EGRWzosyw8eGBmFmBzW5q3KD/uFDS/MzY2nQW1tkAhD3DVv3zNb
	 /4/4/deDj6gCuN/FTNWyVoQ2S9fIvhIJX9YPQzNJ/tvz8DHTftXLzdmy8janh/DL8cGU6
	 3ogu+Rt1RcWbYiSCKp1Gx03IT+3iRp8gAl1/3Wiykgas65/ydIvhxRfpWtVPZR51X4THZ
	 x9PChg+0gdLuaYGrs0bg6pa6/SxB9tTVc01bz5JzpmTolMLNwQuF8xhAsuoAJQPD/EMH3
	 Dt1/WcpoeGx3wJkvmTQkByMC6CmUR4FY5c9IfD8PDHu5zaUCPPSrA5eTOf3UQvz1hNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rg/NwLb8";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71570606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71570606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rg/NwLb8
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso9005005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597201; x=1793202001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
        b=rg/NwLb8t/dx1u3ms20054DPd+uqAc/PFciJysN5ahw3RUkjyXCYiu3TcXjMUbhssn
         JBmW2XFUGvpEIZuXrRKWERvjjRRxuARfaimuWyukv9KagkSpAdVcb5F3oILdMHJIytv5
         enINaPw57EX65qn03Sv7za0WUpq4VS8QdokhbAM9x3nt2icy2969M75Z2bN6MyURiTca
         sIhUJpU6AXQQ3nUjMJ5ptX6z1PSaNC+mYQYv8vuhKJPT1FJFyxEQxUp5car28WYcB74g
         IlrGayVarn2Hk8Sbstmn06bypann0+vygpt4LTAbOWFE0uoV7/rOhp64mUyq5OZzI+RT
         KLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597201; x=1793202001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4B42IGcjj02HwNf34eRwrJxmCqj0YjAetyw+WBTjes=;
        b=a+t0Jane2Vth4uziNpCIX/gVvw41kh0x+pCAIGxsG4xpupjwhBuu9XMOW8rX8KUTQU
         xlznBCt9ciE9HAgc5XXgusCqpxPS+2fcfXuE7Pp2PdkIa6zOF9vQVqHmRyM9aWfiCIon
         1trJOQAEzv4LrqPrDLAnqQhWb3q8T78XaVTu0p/ALbp9u2CvZ3paU8X6NGIjcmlsAAzF
         W2ATIw5HKq9CVs5483Es+EIma14UOmffSvzI+JKxDvPAYmt1Wm+KxvrNzFamVW4XoDzs
         74gwVmxT5sZ2ExXkwcDLUCiS1TWwJWtn63FG05qAzgbznVFUV1ZQ7Aqh5Zpo2p4sYE/Z
         bkgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+eaToc/2ixO8UgwwrWfsXvcxZrq5lRvV1v3x/gnJd8Axzt7/jxrq1zEp68P1ozErPL5BiUTg8lWylTko=@vger.kernel.org
X-Gm-Message-State: AFq9FYICdyl7OViUuPk6/Wb4fpAICoT/K+8zoy7V5TEFhPirTAKOboeB
	AyEDGH5ar9P3G8wjqLXsYJba8iImso0kVLSG69ZGgY/lJHwqvpi0+teQ
X-Gm-Gg: AYBFou3gAt88KKRzQoCGdIip1NGSkaZYJ7hHYG0ab2WD2Q9bUse56eIyCjKOkMx2B4v
	nQt/oTnwKmXQK71aRKgFVagd0Z+9tCQ8Pn0SU7mmSDdDqhhTY4gk7EYCAkg6mUtYCFBLamIc8Pd
	2jhqgQ/6L+Mers/eRgzBJxEu6Jts+OzpYwc7MTbXPYuxhchVo+uubIU5eWUhv2wQzpNNFKuXYXu
	oqWfkDVeVx5m5A0U8NAQbxAGkjln/2EgPs7PiJWTI0IdgAtpptARPKXlbMTIGGJyCfU6wIq3gAP
	OOtU5ZFeUig6Y5ce5H/Se9KIMrTXIoqOEmtVBIA+gvho6JIv00BRz4zxkFVEuaz3VyivNoTv0c5
	ntnBGpgdiwQfP/HkXJ24BvUyv1t43kNuWTOoAautSCFYcG81syQep+oxTDJZsjH9SFpt5voqs9b
	wLA56SucCZ+zAhjlrsOr/6d2BHcqOf2R5vO1wzPTfzFBNJYzQ9S+V5zFFvFVc7mIsZN+ycQu0wv
	L56/avkWDyyJb76dTfOZBagW1CSuUrhSqyAkllH6pPECcbVh0c7zrFEKGeZp+h+liHWK0/H7nTA
	ao200MR4UDgcMAvWUmYuRd0s5Ty9vINngibJXE8Xa8gyT/5/xcWArUOfgsD/
X-Received: by 2002:a7b:ce82:0:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a1fdd22b0dmr39355265e9.33.1792597200529;
        Wed, 21 Oct 2026 08:40:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd70027sm27793675e9.0.2026.10.21.08.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:39:59 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Wed, 21 Oct 2026 17:39:51 +0200
Message-ID: <20261021153953.285222-1-ansuelsmth@gmail.com>
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
---
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

