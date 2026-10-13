Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0250A529412
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915507; cv=none; b=ElHkj/bHthwJ9KILWR5SMjqF/IWjJTUjwVHTx9Lp2G+EvxVeKZ2w5+LsYGOS6ci3u/YVJ/7JWlZb9MvF7n56lb04TGYgaF21a5kLR9KI00DXprR80/3Bt8BjrYszKm6jzlNwLjcfAb6GBjYS/cnQyIhQmtD2xyLCAtx3+8sd9xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915507; c=relaxed/simple;
	bh=lU65QQOg/GcibNh5g7Zm+usPEygQ/b2DT9OWNFxlqSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CoB7MmHUhP/GjEswn/BLEhf/DKZAXKvdIzqIk03KTDb7TT62UE0LQrZ70kbUmleFWcU5oqYUvu3ArVHbXU7O571m22s/VFnfFeW5EM3YVFJ/mHTPjULQpvQO2/y5tTUTxEU/YYsm52WnF9j7X7eoneQ/tMu2WH9sWMj8gAc1BiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCECqCcM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCECqCcM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1910306f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915499; x=1792520299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Bk4II3Yi7edkXaVIjuxBcIHECnvxgrsvWyjVkvqUUw=;
        b=SCECqCcMswpP1Jqe/3SKc4yBh8DNfsTlhoUk6WxJNygxwBO6vCwn4v3T0A08M5/HR6
         3u2JLAllLO+YhIUFR6/0ZMqITR7j4FajTS3EJDxUSMt7J4T8HfJPW0w39OyY25VvsEUa
         FFmZb44fcIuNgN1hJFvLc8Gw+93W1Qgb0gM10vGkEH45ReAdfyhOTPaTEBE5cyirikMh
         KwlBOKYwhP6XlDtaJdX066xnvYytbAJaTYRZz9mYE11H1YztPyYFftrKmSU8t9q43daJ
         jrrBuEECvy3umyrGGAG2VMR+pIagIbsNoFn3p89Lp1vTbHobKP6DVV5/bOsk3qFlv+11
         E8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915499; x=1792520299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Bk4II3Yi7edkXaVIjuxBcIHECnvxgrsvWyjVkvqUUw=;
        b=GHcJcCzqbdyxiQscy5GHU27WQASLX9Cd8mlRL+NR9jlqC9zEfCuKaJg2HQV3msLvF2
         bS0QYxUXSD2sQ1bp6/6OzC3x/Gb579V24XbNxI5rQnYCi6vkI31apU6Ak/dh3NnHW1pt
         Y5rJDiw2eZWf7nVvbma4S6SoUuqNC6Aa6PlbegvlJ8MTcJwwws4dUg5LPHzoggoywTCN
         v76O2HLmE/RD2SrKYAxhnkr0HI3tLqiHfAt6C5tlWkaZEwIFTc6g8sbgun4V+6SJGPnz
         MBIvg89jR0Rb3HgUYDd6Tsz+eIixWbSFkqSwqalpNg8p8iJ+0voj7Xc9LOBwEaTx7WIp
         kMYA==
X-Forwarded-Encrypted: i=1; AKwUvBwNIt8BuQbG2N0VIrynSE2ptUU2M9RyqnbgLVFBo0lIOTquWYAaQ+DYRoMbWILWV+3drEA7VJJqdt5mYwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTd9yPDzKTtiwpqG5ZmFR+8A+Di97nh0Dhrj5eNj+a2TLbiSoH
	vt0lFTvwR+XU9MyKiCUtFr2TLIbZ+QaySdUq4KCoKWdNdBs7LsIExlEV
X-Gm-Gg: AYBFou0MedaXM12WUdFggjyEeCOrGG7kLBYOzJr4W293EUKRSzIFrqkqzJf/kVElZmo
	eD4Yldih7M2Lk1MnVEJfwyE+KDKt3/9OTOw85MSWzelmfeYgJ+7cMTJejkWYZ23zFaCh9GYVxfZ
	ASQy7A+qgYG1pMwUxUnkDJN4XZ7yq5XHP8XrySzje+DFHvyx4kwnVqGsKYQUDro3aD1szmXKd7O
	moD3BQ8aysSbkJdtDrC351dhxw3CKbjnA9k+yp9s9qHIHs+3+c7cI4RYO1oORZaGQW24DG0ppmV
	akQdFEpFa5lX4x2anFqJ38OuMPq/yjJdu/Wx3Xswh4mqiMtPhLp+kigHlHR1yyp8DU7vV7f93UQ
	7TmQVbKLd7YA+9xlY4f02qnTrT1FBpdLr4uBW8as5nXv4oBTvFVS0xKTUAfvs3l4fAbf802PuUS
	xlW0WK/Zxf41tKfrNhmnbKTaTpn2DStHIR2kOk3VjvbtI63zNwB3tAxrPMIPpBOKyLxuyFbJ5f6
	KJynDcJzc/yJ0aQq+s=
X-Received: by 2002:a05:600c:630f:b0:4a1:9f59:ee7 with SMTP id 5b1f17b1804b1-4a19f5911f4mr137303645e9.0.1791915498902;
        Tue, 13 Oct 2026 11:18:18 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm6379903f8f.36.2026.10.13.11.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:18:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: leds: skyworks,aat1290: Document FLINH pin
Date: Tue, 13 Oct 2026 21:18:02 +0300
Message-ID: <20261013181803.496627-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181803.496627-1-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
inhibition.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index 7c26bb135c0a7..a5f3eba7d6480 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -31,6 +31,10 @@ properties:
     maxItems: 1
     description: FL_EN pin
 
+  flinh-gpios:
+    maxItems: 1
+    description: FLINH pin
+
   led:
     $ref: common.yaml#
     unevaluatedProperties: false
-- 
2.53.0

