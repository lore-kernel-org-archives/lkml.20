Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BD956852D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000239; cv=none; b=JVd6ZcPGmVfAiMDi9jXKJrK49ugKav0mRGy6TRXKHW5ZP9iyj0giuT2g+v0IpGcMNgGZeAs3hrnXKF6ySqn0+XFg2zl6KQ43h7yDrJokfSpVONaCT5PDNUJyHGdYXFpMdnLhdedLcGjU1NiwG1vqrDxdouKED3kMOd8hEw/V1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000239; c=relaxed/simple;
	bh=bcpCKvVzfWBh/r6Hd1uM1Uzypdcg61eA5omXmDuNH2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJ2Eks9FNQuVZHAZ9MAq66O4dPOg1VzAGi2dCYrBm3Pak5O5Xlt1lKDP8P4swU8Dllyf7PXpV+CRZlSHl6QFxIDLU0dB+BJykwQxd94/AXOxGCbV4ZBSp7i+G1uAvGWrZMMvbUnu2nxWkpisqhynBGqwFPWd6DFfUsPrj+IDnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/Kwi0FS; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/Kwi0FS"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso2160049a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000238; x=1792605038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJ7/NhnH54F9thvi/u3AYl774UiiZhmgOKclyQGISL4=;
        b=X/Kwi0FS7FDhLF2Yn2MBG9i2ePmsW/ZqpR2PNTr7J+3+33jFXSDdxPXxoumixaHF7D
         B1atV2a+bKffCR/vZcmXxQPKr5Qc/Jg+C/DoyPTyGwGj1tJ+DcEVleRUlkq0AcblVM4f
         ICqY2a1PMNvEmKIFHaPQPZQYtxf0+NJkMpyaMZn87x9psg+SND2/+OepUlFM3flbTw8w
         2HFE5Y4IsnOqAyMJooobWmTwB4Zq41+06kCmHYkIoWDXYE3zK3IrDdySPbH+kE3uOSlt
         watPlnJCOlJ72BJmch7qDFPOF40gOAmvuwmSBJpLpA1a/1U5eyi/ecAgHfbPQCK4R19l
         m+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000238; x=1792605038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJ7/NhnH54F9thvi/u3AYl774UiiZhmgOKclyQGISL4=;
        b=ftCV5NG1fufQgVtJ2EAO3jnXZVeJzEIacaYBqoVWktC79jyDg3mH1L1yRWjTy9w964
         vbCk6dYzObzSHdugxypgoATCFiHJE1s4yJST3DSXYPBEfmJblaCJS2yhjni2NoR2lQhw
         Yu1ityfF5zgTPguLLMb6gRAvCrRdTiupkxDZ69cEXaKjYclMsj4RtcO6tvDjyBq6YzYD
         uaE0mOELzbHN523qM8eWsMssYAwTnl6yBYVkXGtNLRywcSObrsGJyYAJ2OFQHo/Xz0+A
         XWS2PRE4st8KH1Es6biCR9iPSKhBWzHRXbStNnJmONaJiS45zjoejb4/PbLs+fub0gj6
         ntzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPlfHtnwOmtP1pDxOL+59wWRk48i3dEKT6kjLjWPpXCKa8jc0lHv3JSyY2xJxq1F3Hg34QHkh3N+nNgQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW/l8OnlDbyMQpmOjuxQiQsHqrrhpgdIcMIiAiodRPNskgoUzM
	z5S3wcnDAhQnh7tb4rjfEl6ssGxlIE2/UAWzRGpoMWstxsfYr0NS2LYK
X-Gm-Gg: AYBFou1cFNJDesJInGB18XJK2NiTkrvYTMTd936z/4fPRZE+uGWErO8kCV8UD8uW0LJ
	S9ZIBQWKr093rNMrxnU9qrr7fuB2Ru12y+bEMLTANYPwkYKRhz7XsLXp2HoWOwBhrRKxzkqKai1
	/ZJIqgTwNjXMiciBZHHjUr9s1/eq6DySVkgU0rvujZjFZ8E5ScGT4QNbbBNy/Axx9Ws4B8yCJlD
	tp88YiI8FI1kKV6e9GkIiLYh5IDOrxr8PjUoMhNmZF91NdkZZWPuOOixCUf6UZyXUJbhs+p/lu2
	1BgXO7I5LXHwcyhgrrcvJxo+AW46ZQrHFmKbqZdm/m59C8RNgzU//CXy1DP3BYGn1H/JATuT1/c
	rzTMOILZ2v37z5MuPsL+Kof5he5z6gHhG1XkN53TtnNEO21uS1jShy5VXWDFCCsyBF1/8QGQgyY
	1n8n8fUYFfQHCmBF+G4HcQ7B6mxJsuS/kpiEpu5bS5rR8cjUCql88lNntqZ3FXzYUveB79SIiTZ
	9HWRJle8f0MqLASPcIX
X-Received: by 2002:a17:90b:35c2:b0:3ac:7c4d:8be1 with SMTP id 98e67ed59e1d1-3ac7c4d91d4mr1626449a91.62.1792000237533;
        Wed, 14 Oct 2026 10:50:37 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm403009a91.13.2026.10.14.10.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:36 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor prefix
Date: Thu, 15 Oct 2026 01:50:18 +0800
Message-ID: <20261014175020.62907-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175020.62907-1-cyan2254650260@gmail.com>
References: <20261014175020.62907-1-cyan2254650260@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for ALINX (Xinyi Electronic Technology (Shanghai)
Co., Ltd.).

Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
  - Update author and submission email to cyan2254650260@gmail.com
  - Fix transliteration of legal company name to "Xinyi Electronic Technology
    (Shanghai) Co., Ltd. (ALINX)" (Conor Dooley)
  - Add website Link in commit message (Conor Dooley)
  - Collect Conor's Acked-by

Changes in v2:
  - Use 'alinx' instead of 'ebdee' (Krzysztof Kozlowski)

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..26d5ef6d7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -90,6 +90,8 @@ patternProperties:
     description: AlgolTek, Inc.
   "^alientek,.*":
     description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
+  "^alinx,.*":
+    description: Xinyi Electronic Technology (Shanghai) Co., Ltd. (ALINX)
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":
-- 
2.56.0

