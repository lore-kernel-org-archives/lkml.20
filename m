Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B23C343A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226185; cv=none; b=RFrloTXcVmwr1TczqPbLHvrGOfFY2E+LYbGIH0TcEB++hpLBSnKyMRTX6/VMTVdm1aAarYZ3bA8ULHm9dHxIaSyWBrD15KmcAKsOd9fSqGFOm5M+YdeX48Jq6SAlEzWUh2lDT461KCqMJBLw6AKBFMooqJ/NpqSdU1NfhNBgx9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226185; c=relaxed/simple;
	bh=H+/PngVUyrVREnpYqPk0KT7pitaBFyX7wNqwwHkQmDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLQKoRYiI/zuqWjrBahkZbAmQmvXgYzcjHWwkgVhQNpK/o3R4sIhTZzu/n+giYv6Bdy8O3WsFrAil1Md3NG2xeHiN5rP4uxPk33HmBiqMKDxU+7M3Sy4DQanQyO9kQrC7on91Y0EEv2qXMvssgRXDPfyI9xIsz/gYyZl+MVbqkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IS/61Th7; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IS/61Th7"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac749e0719so156129a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792226183; x=1792830983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDddWpoHqTtkxFsBbERUVZlldFJw6rS3OQ/sbeQSp+8=;
        b=IS/61Th7EtInhdn7S9Tl/41iUQOIhrfpxD8j8649CVk7WeIHwyv+dFKAqA9oDsRuY3
         dIXKJ5ALZoNxDpGGa4gMvR2bqi+rWH2+kh0bUJu0XxqK7DfR0hMkTa4I1Df+7Gp1lo7d
         fHfUK9dzIPaWU/1UH7mCw6zdaIgphLSMO70Deb2m/pRWfqIPO/5glY3DcrrvDO+dXYZ4
         Lk7rnQG/263F5Bb9vSO8qc26jau6faj+OT4qEkzJhJTo4ScAUeZrFKS7VkG8aEU0AmRS
         ekTXL/COi8vcsgUGafWEP+BitSpb15WysIeXehZPNA3zD2aql27uuQ9Yq33wHQrQinzM
         Sf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226183; x=1792830983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDddWpoHqTtkxFsBbERUVZlldFJw6rS3OQ/sbeQSp+8=;
        b=0zPHtdVpcZ/vzNx1YbGsHqQz/kH4R/V0Aq7A0pFZPBOvPzmCXagGl+hyqY9Wb9V2xp
         rIhbn7QPJJEAtWmId5O0v7C9WXegXVZqm6kQF+yazTwkw7eknos1hmLOkjQ+SVpFnQiX
         3rJhWTKkVY//PWUzoBQZl5D+TUhgnIoK52Q7MkEJqMxqjJ6CwqrdxxtXgZ/ebK36iTbG
         7CePCaZ30eA5jZXM3PORydbfwkxhH7pLjei4EphkCdSfE9K/f0jTna0/AUOmk/guO7qu
         b0P53+15QgrZGKwDNLnEpiIdCC0fjuReXQcXl7mkKcsmcqSLkPZv6OBuo0MuoBVfQ2zd
         mDSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNBnJLSYEtfdf1ynF/b9MhpgbgGr70jDrWeSQC4k+tsW9zeLsoz+kQRL47nORquk9OTwOtucrRQbINspg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvtIu/GGo5hSsq5C0nK+bxF9YmqX8NgYWFR2vV/zeRFE8+42BX
	UApb3zU1WMYKUIVmt8cwLYfpjAji2HA2l4vxTqa686E3bXpTPA2V766A
X-Gm-Gg: AYBFou2SFXdGLbwICkKdC416YIjPBRIcbCxipE6wKnXH0WUEquX+uon+Ssk197i5GZU
	bTCX5merPhgDx5T2/vdBor5jrX8FmTCPvay4aKKz09v8HE4PmmFK1BJX4fxwkudeGBQ1Fxjz0X2
	ay0VlTuXfK0CBuskWUN3vRHYO/TYahBhtFFd9bxgJ67jfYzqIGaly32QITkaDa8kP4kVugVmL4H
	O5r+3pirlQ3vjXpbRn76uokUrnvzXxBTJgWeCwfIeommFT8swTcbyQmXo+rAf/cOf9/vM/C0lff
	cwAy3sjqM3B4pWpJXZ61Z85y1oB34yRsoMAVHRjOrXfyi1dP5in6/xfDsYHM7fRiu/caf5Lf0GY
	XwPNbpc5uIck7UxZTGNgCxwtW83u4dgPgLou1heKFyaDB/EmS+NZTVmsCPgc0eeNKhiXJxd23iK
	QH9ZZziNLvh9jVRG9tISvEijfzS7mDF+XJO2YDOQRiavKOeIT5AL68DSk=
X-Received: by 2002:a17:90b:4403:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3acee277aeamr1748958a91.6.1792226183357;
        Sat, 17 Oct 2026 01:36:23 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:3141::4e8:8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9461d71esm12548544a91.7.2026.10.17.01.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 01:36:22 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add smartisan
Date: Sat, 17 Oct 2026 16:35:29 +0800
Message-ID: <20261017083531.766557-2-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017083531.766557-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Add a vendor prefix for Smartisan Technology, used by Smartisan
devices such as the R1 (trident).

Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..6ad8d3499227 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1535,6 +1535,8 @@ patternProperties:
     description: Skyworks Solutions, Inc.
   "^smartfiber,.*":
     description: ShenZhen Smartfiber Technology Co, Ltd.
+  "^smartisan,.*":
+    description: Smartisan Technology Co., Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.56.0

