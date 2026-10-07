Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C6E45C6E5
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363320; cv=none; b=qEnCykQXf49LmFnvLQHafrB/YykJzK1aH2QFQo+JWvj8R9HdQrwPhrGwfsMcdcviJbo4pQWzfRdDRkAvrZC7+e5J6r2cAL6wVp07eubseDYmz2+zEjNWdwZP3+KnwrJ42tJPOs+iuDmPi2zwrgUfZjOibn9PpP60J/41O5Q9mTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363320; c=relaxed/simple;
	bh=mPskxgPYuAfFCQnnk7Iss6E+WGp/8ax+HTOK+Gc69q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgX8cYOt9ienCY1aVUTjlcb1zJlrBDE4DprOY3yBTQbSNPcIZDN6qr7/pDylMqxOJdjcYqEhiA3jbWd5GsROpmfCOl4gifjL2hfD/o2Re4slXl6a3YSZ562RjfVCyI/qDK0cfjJhXatyj+ZR1tAqy+cbGNJpnL+7mHgqIEwpGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRksqhwZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRksqhwZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so13902125e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363318; x=1791968118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jterHqkHpEJwSt6BwIj0mPjeE25maw/i/K8J/m2dFZA=;
        b=gRksqhwZoSaM2tItOMQpnup+rLuQRgKtui6OWtZiht0A6lhlOpdFsvFODijpYrPmbq
         H2ISNGmjZ41kym3vX0HD1aAKAakmW0fjJCyX1h4EWY3Of7gRdlzib8QTHgov179HdRfX
         OHEvboFtaLpjaoF4F+IB0uhWY2F8C4/J3aSLYU8/KOtJAvtFoA+dy68ahs6RI2+ZKDRf
         dRQNH2g5+WBP34DjCK2ZEpG1M3tKvAESvoOYNtiL1k2ES/cNavi/RLwsHdcKgH3c217s
         OgAEPX+pVbz9JDXJgSjqITBWRZ3G/ZQc/PMPi7JbUxfTNE2fR1wLN5HahoDuVQP7OUyl
         aYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363318; x=1791968118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jterHqkHpEJwSt6BwIj0mPjeE25maw/i/K8J/m2dFZA=;
        b=BZl1GznxSfnY0RvL2gKj4pTrPYnVNDkSzJ7SrOG76kJ3u+E1aZlq+IxwwbzN59edP+
         ZzeRYmjOmgbzpi2dC0amv8mLbqGUjCoemFPBGExy+GDB5HjiMQDgvY/SftOhogdP3xyL
         EgVLajTo/ClLmOiIzg2+8Y8G4koKwO8cs23YzJQUf5euAMG3bQl5ZvVvSqapRFlQyjOz
         /pCYViKucoKYXGXl07F1nIk+q1u0zWLkVseYId788jBrgKAbzrlXbOml8ohocah/L/5p
         TGPb9iTfdI698Mfyp5RcFM7buu6ELgUyyabFC3TJFPx3OOrP6e5iFzYS5MA3rfTwMpK2
         IJ5A==
X-Forwarded-Encrypted: i=1; AKwUvBx9IewyUKuBHwoj9Shl2QburTJLZ0vGL7L27mys/PhYvEnFTdE4CK/xbWQwfCiz877bMBjZsklDZeDd2ag=@vger.kernel.org
X-Gm-Message-State: AFuF++lsfAk2cEankogwydGoPJFnWttswL4hZyz3iRU8z7uwgqu+AJ25
	EFMnwDtPqgvEa11z0vY5PdJCYJduZENYCxgBN8m5JWrjmpN7BNYtQFOg
X-Gm-Gg: AYBFou0Ahaq1limfZlU1DYF9y7R9e1ApKSDozRxgPEw4ySe6ePE2QCn24ZwYu9RGts2
	QvzlmH5q4avjNdf6EK1Q7SP6vUG1CEyS/9c2OD9jQJS917oi493HRuR+ENElZ8LVaRP8V/lseCW
	zrQ9PnOfjxIrLPgDZLK+w8iQPUWY55HtUYjZ+ZvggUbWkg/DwDF9qt+inQbiRRID1yAif9OSF86
	ms2RzlMKVyV9mY3h6wiTAdxoZoLw7GEUg5sxFIbp6pKV6uRvCtyamaJpnvKeUbgxoVniNW6cufI
	B7NgZ3V/s7C+7MrpjmqdLrkPkHtcuB7RL9/yDH3Otur0nR+Y/VHbua/WDTzzriHYu5Ga9+AlAKH
	WdJP8/6rCXnsqXVFBW342ONYSbnVHJ5E5nggBdxD1RCJxO2uEFuN9wCZYqguw1HCS6vr3jHT5RR
	V/7jfV/PzylIy9feEe10lTQ6U1rFaKGNIU45P4VuJM81ntpPM9kyFjrl95hoogbg8Ijas9YeLJo
	ZaO6ZvK+sF0TtBthHw=
X-Received: by 2002:a05:600c:3b86:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18043c2a2mr27179375e9.24.1791363317558;
        Wed, 07 Oct 2026 01:55:17 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81709225e9.2.2026.10.07.01.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:55:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current Regulator for Flash LEDs
Date: Wed,  7 Oct 2026 11:54:55 +0300
Message-ID: <20261007085457.98762-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007085457.98762-1-clamor95@gmail.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT1270 Current Regulator for Flash LEDs has a similar configuration
to the AAT1290, but it uses a different programming model and requires a
separate compatible.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index 65576dfdca110..a65d92522c9cf 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: skyworks,aat1290
+    enum:
+      - skyworks,aat1290
+      - skyworks,aat1270
 
   enset-gpios:
     maxItems: 1
-- 
2.53.0

