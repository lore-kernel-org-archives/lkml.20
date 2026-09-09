Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CA452ED40
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997708; cv=none; b=W1PTk9LG2ZSq5hFWhS/qdz2cxVJfJTBgSfjmfAe9aokrImrAUGt/sUxGvSC52eljcz9XNgPNeHsOSCHb9VJPO6Cemmu8zGVRCoWUSStj/EI/MUtOgIfL7NMamdMytToqbBhE//+7asoFWK66B0JlII0ILUsBw/v5NnyS1fLov6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997708; c=relaxed/simple;
	bh=G+K6yZL86J94n5ErSMRjznPkkKACsHzlBBj5w8KooVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRIj3rfwQ1ws0LF5lZoYhRffWc6VC8u/j6e6JSlHzms1Bj5QUElaH8qhQz9mnJ+93Xxhp99m+xj3yrAay5n+OdhUxJQRjO9WoBhtdlTgEvt+HDUCtVUGZ0gdZ8xzf0ShheIlF3zmd4MBuqOeBH2vwdqvw9FXZlXKypxcDGrKuFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBWGWRYY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBWGWRYY"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso273637e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997705; x=1789602505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8Y4b3ddmCAFwqmVgH5ZGdYAfFuI96RtEoGFK9BOGP0=;
        b=tBWGWRYYjJrE6BZxUBY1ZqCaDY8qPibbPSdnmZO8I695Qw+OxAbU4ITco3cGxJcgbM
         w5TgdA3xXk470bY1UDsinzI2yV9PB7UboB9p5e+Yv6qpH7Dfbwii8M64M3fKe+eJl2gH
         FO/7SMdpuZWEIodXA92XrEuE9P5QPMhQzS/GXm7B/79TnPfOG2hufsprcHEmhq2QnmNs
         CwmppdIeP44grH5v5gpKMu4I8pNDRKqJfmRqru+SVYFdRWtxjEzwDoKKBsPj0MLuvnOw
         qkQH2mTgMofQ+IYZLsd2IRtXwkeUIoUeDuVBzUhXqTlLKtXZVuK9AMeCDCoumPtYmNTs
         caCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997705; x=1789602505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8Y4b3ddmCAFwqmVgH5ZGdYAfFuI96RtEoGFK9BOGP0=;
        b=tAkVohkyD+hpUnND+1oHhWsJNxgnVBdLhqlLIpoyXdOOsm1+gKfikacMUi0JMs+wTf
         9unajH7ls84i2Hh5roXlfdWpd3vrqDeDyDDvCfr3aUlwk3wxcUsXIvbx/PY/ldq61Kke
         E91jBgFm4bLfdqkdD843kJQno2Qeexl0py/Go680OXb1NJ3MRygxePrAEtCY+5vZPgb+
         YR0V0blaLyCnGKr5Ewqltu89rLcgq59S6aLeT090dRhlc1HxPxdS8co0XF/W7YCa7PF7
         PM+AhGlH5i+1L0BEV9Ml12cgGs1RcSbYiUgYzCLK2TOLDdtcfjnXbLt2RkFmqW/Tpu+h
         k05g==
X-Forwarded-Encrypted: i=1; AKwUvBzNtjj/hjPf2I5Xs5qbxkS7G1rNkwC1D9YA6QPX30Rhx5KMnU22pj1jV6HkbVQDwQ7fX8qhW/gKMHIpKGs=@vger.kernel.org
X-Gm-Message-State: AFuF++k8t/cASS2mrHxrS+8iNQPHLX12b0Vaem5buIiA2eqrd/aMX23l
	HFsAp6at2+W5/3kvfVoX5UfT4z3BWu9E1KzhvlXXET322R3p1LGy7Le1
X-Gm-Gg: AYBFou3HnABPr+ljjnMW85ekQpG3N6tKXRlB15vr1lGmptEM0plG2EcP5C0ztexU+EZ
	El2/wICnlDUPFMCaCM16Xig66kQR9l+uIHaMD5lPk+LciTHK/jFSrOCoy2mavVOvqbX96YlXln7
	liVK5w3ZlF7JjVYQk61IeBkKjsQhBeunTpG0Uss8AH7uISJDH10+Fvs2Kim69xjx2IpJNS1y6nL
	jp6wU7Kp3xqrtCJxqiLjIPW3Mb1PIkDTuFzbHhylzTSrZKrwrC6HImxridGyKHrTCFNWAn7q5V3
	QlGc5OfTKdIPDEfj83DW5xT/QRaAsQPohq+GltbM+wG1RfHZ4fpT2EvCGBQTp9dd2shw5lZw0Dp
	bI6imvxmGghzhtXRAOIetmqoXNhZJz8Aavi8srPD9Ewd4R4oXZW+1m/9rBg0ETjwB75/gC5ubta
	Fk5WXqeMm/xKDq3u20Ty+UkG4BDnXMLubmOdxp+wyBWCgtVP1FQjmVEsJQpHGi9+3Stnl59HX4r
	difeCmCAe8N74yRduYd3Qxl+XafPJUp6Zv0n5h5
X-Received: by 2002:a05:6512:3b85:b0:5b6:1a7c:59cd with SMTP id 2adb3069b0e04-5b61a7c5a4fmr6010294e87.39.1788997704650;
        Wed, 09 Sep 2026 16:48:24 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4cesm4153300e87.26.2026.09.09.16.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:48:23 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: power: supply: bq27xxx: add generic compatible
Date: Thu, 10 Sep 2026 02:47:42 +0300
Message-ID: <20260909234744.1177153-2-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a generic compatible for I2C fuel gauges whose device type is
determined at probe time.

Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/bq27xxx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
index bc05400..f2e0170 100644
--- a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - ti,bq27200
       - ti,bq27210
+      - ti,bq27xxx
       - ti,bq27500 # deprecated, use revision specific property below
       - ti,bq27510 # deprecated, use revision specific property below
       - ti,bq27520 # deprecated, use revision specific property below
-- 
2.55.0

