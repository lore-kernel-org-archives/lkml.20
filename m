Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2525478E5B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805594; cv=none; b=VwZUB7IZLd42FHbSPBKxtACcCUFjNAh975PNGU8fiD6jvyShNfNg6g4WJVXviVOp38dIiOcOwvKja0qVNa/Ih5IN53TpQ3gpynTdLybHalrUt+Fm13cmC08A/EPZPpNONMq+G6UHye4iunip+OfJNKHmu8e+SPSmFfAiRU3ohVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805594; c=relaxed/simple;
	bh=2H2R+h3ploQ9mGwP0LMTSWcS73/fZZh2+9TzpxjVCCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLjcDEF+BsMbXs9dxJ0agjQo89ME7yTAIbEbnZ3RnPeag3+k2BfUzbhD05xylGeecr6DoT/ExDQh3mQxvpfCjnuHllCPaKN+Z4gPZ50bU4obo3ZKebhvNRyBooe5QT6KfMjfMe1WYAALmPC0RJX0nh6KKVaHK6pMVbM4Iwp9FSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwaE5tch; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwaE5tch"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso182077166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805590; x=1792410390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDIKLW4OfQ4CZa1KsqrPUiZIfzQyCk0BDHwYXVAthtg=;
        b=UwaE5tchti1TEq5ukWctJ9AoTBbJpdptLS0iROz9TLmpQvYAzMWpiPJ6QvgwGQRMKA
         b9Ph4zxLqbBwu5Sl6sqLVnJFDT4spyuEzYUjDxRU9M++5SGqUyBnLKV5T5ZuhtiHTCM4
         8ckeEI8MJKslLOvjpZgZzwvYaW0WXq4lifINW7+wVYbT0LBAMQ+/XDOOpBQimTC23eot
         YudDC7hpsHEK1aX/jfaNp20VJ9hmQwT6icgu2/cBDInN0lEse8WkFi/v0KABH4uDrjGl
         7OZsDkk/Yaug6kCzI2m8mlo/dhKS0mf5zYnGlsEBPes2X+aTrY8VW0EU67FEoHr4V1L/
         oKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805590; x=1792410390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dDIKLW4OfQ4CZa1KsqrPUiZIfzQyCk0BDHwYXVAthtg=;
        b=HRJWW4euhKp0VwZv/wygZB2t81OWqLqXjuOiDjYGN7iUWlqCNi8oD6iV1wFt1Htqxf
         BvVl8NSrSULb07xJZpz4phvjz8B/ptjbz2DBx5HrKQGL1pL6YA0CluROzUjZNmLUUV7T
         VLz9Vkuh9TYjUPTOHixm3dBgUQJZM9J+vDm6CuWF4Nr6s1Lbb6Tful6I5eurAzc2XruC
         94LsQZViL+HQt8oATv8ELGFjjVClauLcAqcAk8NOAgtGQyPSHYOVYzseh3WYq7JXDVU/
         qLif3O/keeyNIPCTdO7X/XM8ckjsDoz88K82mEroqjAisOKLNWxGFIu5yTES1iBs2gIe
         a9FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo3+IGetbm5xHvUZDw3aQ+cE9WpHoAezTFE+hvneXsTFVvFD6no4OJmrwY9seo7hvlzDTKG09M0nORhgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1f7RxBfRdP/YuVxbx/4iwiAQrocQK9VvEPSCGIrHAWykEH37E
	6IefhDRxCE9XK2cW0UWS9V2xmKzTPbdDU54rtVsWVO/w0zqYdxqdqc2m
X-Gm-Gg: AYBFou2SrgjPCN4+S+9Lj6TosfwLvRfXn0oOuhnKElBudyS3HCgPcpnaHupr0QE+duH
	8SMs4Vz/d9sCn4G+pErnCtYmgj60k6eZ6M4eCnqQR771tPjeHHRhvByRtwuRxSbzqI7LEhMKG2/
	5waeUv5YdqSYlHn1GVbs7l5HJ9Ee3YSG6wF7O2IgLA+QkRqxaCB4P6c2ViZH8Iz9tBiVg8X+7Cy
	+ANkmW1XpyjQ4U5haS791eqXpjXmQFv+sGRUYDbrcJMuIT3eZ849LlBFJXVTI/nQ2xwewPD2H0y
	g47bvkrbXrqjyz+9K2XKox0kR4/h9HxJs9qMgQ25wfgxbddhoBkdxAAY4BvdMPrPL9ZnqwEkwEi
	WCyVgERpuE94bx5JA7uhmjBLXj9LpHUIZNaEfZIBnIXhTpRsxico3Ifn6YXrdnhQLlLzG2/by3N
	+Wfl25eUsVI8f6+UPNk1Phe3vb2xHtQsBpbsvcf+MnLmto+IPsVkrEwhzulSoX3scHv/QCGE59S
	f4AYckHu4KeVtMuW6vBZSE0usD8ohq0k+wloLyGzYzM5ZciVtITpQyLUBSN2xyBDJjoWe7nYofG
	vkWjH850Np/kKoll37D9EfPY
X-Received: by 2002:a17:907:7b9c:b0:c29:5996:6624 with SMTP id a640c23a62f3a-c31aa0ac6e2mr845327066b.37.1791805589670;
        Mon, 12 Oct 2026 04:46:29 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm118669266b.42.2026.10.12.04.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:46:28 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
X-Google-Original-From: Paulius Zaleckas <paulius.zaleckas@ui.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 2/4] dt-bindings: vendor-prefixes: Add ZillTek Technology
Date: Mon, 12 Oct 2026 14:45:48 +0300
Message-ID: <20261012114550.1680054-3-paulius.zaleckas@ui.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012114550.1680054-1-paulius.zaleckas@ui.com>
References: <20261012114550.1680054-1-paulius.zaleckas@ui.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paulius Zaleckas <paulius.zaleckas@gmail.com>

ZillTek Technology Corp. (Hsinchu, Taiwan) makes MEMS microphones and
barometric pressure sensors such as the ZTS8032.

Link: https://www.zilltek.com/
Assisted-by: LLM
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

