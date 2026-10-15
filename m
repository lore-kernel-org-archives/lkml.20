Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366844ACC9D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061395; cv=none; b=bcQbAcvOdyxYrvC5Lmh8QZYrQyQ9EXmePtSHX478/t42IQNkaDEfuWRSkx+ZmuyzkQ0Bt1Ez9C06UgPChBAn9hV3jyFxB5f696s8XFm00K6S6NgGSguC6k1RQapVk52YJA5CaDygwiXFjFqUYSrtUGJIp5PUZm3IBTl/NWkhj8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061395; c=relaxed/simple;
	bh=nEBAEcr1DpggMNA7XbubOTPWUzXKTrOJxdCh4sDtEpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MXnKhV/6XjOvAJ4RBHI+wprDfZFyy3BAD/ZwPiNl7jwJ7gza+IrDeXgdp3jGsiC0Zs3BXdqPDllC4vvGi5fAycLA5uZZEJvuh0OUBq34IHhVdVeCfjCbYSDzEgtZYhY0niV7G1e+WoU3PSgKJIlg2QKbbFWirHw+480LSjLp+5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf8ATGlq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf8ATGlq"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c350db5a761so688052666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061391; x=1792666191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/Zy7Y5eanQKJCoQxPls43jtvnUNLhviTL0wISl0Q1Y=;
        b=Uf8ATGlqD2E7E71plUlHZjRo7gPgEIFE2QDGWsQgVD4gp1E299msUBLJoEVMtZOjr6
         xFkeO93OjRoW8f/uYQGq094vD0uiYQoLxtqp3qHSIng69LRTpt+Zwc8hqRbuH64xJuVk
         WS0fTkVSkIssVOmNfempPGqJ3Z71xRtoQytZvdqOvt5GZ9P57fR61aYE8Pk7Rn394Cdj
         aG+7OyrKhLzrP1X+g5dOaBvjVOGod5GKTj+QsUCVbHp99fnEWFQ3i7TLcteorsz6SYOC
         UoRfjzrfExiQt61k1xQGlPILzas7C3WTaAALRLPfSRAcNsnhleXmP0WQTD5wdM9e1iRt
         MklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061391; x=1792666191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/Zy7Y5eanQKJCoQxPls43jtvnUNLhviTL0wISl0Q1Y=;
        b=CZB2JqJOPoe8h8n3V0modiJ0FhlnQL8EM60hy2p1WsDVpC1rku1gUYpZ1iN8Qb9D3r
         1jbfIqirs0C0XEG2lvEmVCZEbLS2wulKsBir0nCxHG5sRjgR29GiaTuzGSwAnHlIgbRZ
         DhU+HoVx7fnk4uufh9GQvrxVknNWWKHhRgtym29am3/mAZ61+DcfwXXPlwuj1bPgLXpr
         I1NqVmy2NBG5bMIFn42vgvi5bvPkHwfGzmpziIBLjXt7V2vmQ4Im+GbWSpjvlMHd4Xo6
         hIRd7RoDly+ny5bKhdpB/JI3oUMIdWwkVjErn6ZLbrjgHSBmxoefNvYCermET5022qMW
         wdjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhN5lKRdNt/4PoSF+jqp5c67XOES8SJMsmPek2iCxUgtYoDkUB4Lt1hKrtiHwAWehpt4uRJiEVXdaSC7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYqB7A8cPdM4yzrpIfHc9sms1d0iQNTkDhGx8Pk1G+r7uX6DX+
	wBw+QJE+Dz0gxCGL/4UQUWm5I3QGzs940GorPA38kdBk2HVbz1VNaHCd
X-Gm-Gg: AYBFou0EZ5JRO/fylZ01RvPNsZ+63ZYKvJrRUy3tssrWB1stZsXUNSxs4ldP5u3BoWL
	/pesyjs1OfqrKrVxAmlP9+gKuNTUILlWoNLIBB0vzwF/zZjXM1L3CNvZ9iHjktRxYk56Wgf/dR2
	wqqbHXFg0D94KQWknd7vMiQCt9qN4aLBtTbGtVD8qadOp0uhkzSwPPF/DfARBZJ1W0GbCa957nl
	LsjbfxSLE6K7OAdSGgrVig6UA6FHJqKd9hWyh8JCoN4v0VkFt5VPFW9u+5OHydQn/dayxs2bqsA
	52yT/RjnFleuvShsq7Q5GJ0siQ6cH9iJ4f0KiQUjmwhpEwyZHAu4WA4yTUOO+t4PZlISEUg0Exw
	jJCR4zq6jnAJoWtZ9lSbv9tRdM9WSmkV3FsBCi2Ymuge1aTTUMAuJCyD1/awhHKeSomuji4YFky
	3uOy59HlLTZXuzYcgdBAw4D2DgueQpqr1BU7rOkUChBRCqjMyxLYNOFyzquaPjwen341IGn7vtx
	tvesD/3YU1bN5FPkLqGdwg6hT2Ky4UIXmmMXJKHqjHfbz7wONVBjDicpzwMsCXuhNdu39b6Pbyn
	FmwV1R58iapsgeKabfr+6HHeahM=
X-Received: by 2002:a17:907:9801:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c31a9fcedffmr1919031566b.13.1792061391328;
        Thu, 15 Oct 2026 03:49:51 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3af45sm107890066b.33.2026.10.15.03.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:49:50 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add ZillTek Technology
Date: Thu, 15 Oct 2026 13:49:41 +0300
Message-ID: <20261015104945.2687162-2-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
References: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZillTek Technology Corp. (Hsinchu, Taiwan) makes MEMS microphones and
barometric pressure sensors such as the ZTS8032.

Link: https://www.zilltek.com/
Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..255dc56edc36 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1977,6 +1977,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zilltek,.*":
+    description: ZillTek Technology Corp.
   "^zinitix,.*":
     description: Zinitix Co., Ltd
   "^zkmagic,.*":
-- 
2.55.0

