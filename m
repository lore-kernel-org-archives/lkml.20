Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E7251A13A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750483; cv=none; b=VgVrLDhCxaveCtfS2Nd8SZjnIh0gQR5Zwtcz/gkzQ3dEM6N/CZs1vcPxOH2nF6d1PlKUEMltEMFW3eC0jtBW7Tu+nzjJcQFuWhEKGGFJzwx4uqAnr9aDvJKoMljt/jvw8tRFUZm1PYPSp/cQ+58GDxMSXIzOqHx8iFE6YWysI6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750483; c=relaxed/simple;
	bh=ZXJS5JzKrOR11yrKsPhvFOiNFDXrOJb0Qlf/cDD/4pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPYSRbRagJBiDMo/JakM22FztXz+e7HjE/j330wnDAXkARRifoC77S5dICW7sIzCvObCgha+y/dlS5b0XjwknkHNBwQ2iQzA/2DFUppL//0kd7bnHk1Sj/ZWY3sBpxh7eYHU3n0IaOXNFzHXlr6jqxO19Hr0Z1hjJe/I37UFYbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRXQ/oDg; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRXQ/oDg"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso865636a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750478; x=1790355278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=lRXQ/oDgPn5tS51PoVHVb2O8Dd2bli/P6S60MkN24vkv8flPtCFwN7c2jUHqqsBMc/
         UBodf/rDZG6USnbDwczYT3mqO0gfzQNghgeB0FO4rdSmRlOmyhVmUPrTNLAkmoHFPY3G
         haXt40QZwmeCmE5VPHZCOBoYghFOrU2LFHSlgigfLiaZ9B1WwAME5+9DhidQYMdFB/vl
         Nvi+LCq0kJbafEy4Yv14yGK66lVWlfQVBkVa7/UbaEoEAT4oRgP8TaIpQriz+7riHKpS
         0k+K6FziSHcfISYZI0Vl0SJwVIC3D5utdkwqM1BuAdUqDJYXM5y4HfbjW0OBfnx+OHyi
         fgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750478; x=1790355278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=ONBNGOm2KwsCc5TANLYhzJEtvK0nx6esWyhW3pp+SW04LODt0OKbkxbbooPrWjV/V1
         8t92ttvAlGNKlWpIcsqZh967BFe5jxmYaOdWjpeKMCl/c/Hgf91Rw8bGG9whYQBSVOlL
         fOgEIRVyEi8C+LdJwzbdKZ21EEZUB+NHH9LAqzXMjcsUXTPiWkv3sQ5N7h67AIMcRS2b
         cglTTNzKmdWWoqYUJkSCbYOlSRCXuLfnFIlFQwE9XdUk7BbmdVfFHrPdbR5qWnE98IfI
         Fw+cSlOPg+zcBq8HNr3TLIagOmQF0e22dknF2OiPNPrZckfqxw1fTRW0ocCRJNGhCRjI
         7/bA==
X-Forwarded-Encrypted: i=1; AKwUvBxHEbtHX9+hnE6xx1VIm1z/DXVilu+NPqBfQRyE9UDL3Fjixk8opVL2nZlL3eYINqPBu9rUiamT5cG0g7g=@vger.kernel.org
X-Gm-Message-State: AFuF++npkelg68DrUjNRorUzFZ+aBNliCGHjeRLuan3F+eh1jpFBpGT/
	4bFJS8x/Ya2rG3Az++RCgXN+c+bNNSpi8FJv0s8oAZUhQLFCGXTDz11L
X-Gm-Gg: AYBFou10E8WjgpvFVajz2Neb8MjgE55ZY/N+G24qb7TVHZ8Jf0oLN8d6hR7Od+ax5Ze
	8EkNORrcGxCh3nLpp1Inc7NMcfTWsskLax51w/LHhxpJtnygvWuozU651HtzMYqzYaheeDXYGrE
	6GsaWlz19seDo+OPvBGS7NUMSFGwsk02YwQTZufqdX+G60/IvQNjj/TzNgLCVkoGZTrrKoeogFC
	mfNPdBJCy/+69EHgWt7L6aOP6gdd5JDATu1S4OC4zJjWGXet702el/cDQVJHs2ecrULqwP0Y/N5
	0BvGT0XSUbyV/w0oHqNt7QyqRipIw86349DUQfgB21G0q6d+m5+RuxaFc9J1sj+MC+zo/+km3TT
	DU7yuAIPMgPwK+f7ZlOeHloUEA9BNlXjCZ3gnG2V0RdD18/DSfTKqD2X487iSJmqDwdxqLO+lKe
	DB5iT64zdcw0csNjqwcZQfLGFVRAVqPDb7nUPrVxEn6gk3vnqZ1ab4sHMMgKxzLWV7jd+Bxq35C
	CQ=
X-Received: by 2002:a17:90b:1dce:b0:39d:f064:3a68 with SMTP id 98e67ed59e1d1-39e54d36e3emr7094039a91.21.1789750478423;
        Fri, 18 Sep 2026 09:54:38 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:38 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Sat, 19 Sep 2026 00:54:11 +0800
Message-ID: <20260918165414.1129076-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
so that board compatible strings can use it.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..c7c2fcd37 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1694,6 +1694,8 @@ patternProperties:
     description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
+  "^teclast,.*":
+    description: Guangzhou Shangke Information Technology Co., Ltd.
   "^teejet,.*":
     description: TeeJet
   "^teltonika,.*":
-- 
2.55.0

