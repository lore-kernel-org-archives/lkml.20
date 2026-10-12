Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003F47D455
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805598; cv=none; b=pcDUIXin4eF2LAjRggwmbYfor35oXkBuYCxmjvW/x2QkCQ2lF+PGkLa0Hc2qZjjKWzueIQnC8XFG0IiyW+541Y14dAt+gqMLtPX/xPUoko8WeOZ/+daYafVHbivFIAuls/+S0mTDXG0ue6q1OnX+uduFXXe1CzDE4GgVVvUfwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805598; c=relaxed/simple;
	bh=EDVRJCkzx89jDEe+Pl3psDSsRUyzz6EKZz4YhpQWGUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2WPda4qsklgAG1UgH0CH6RuWMqt1akgEZo5S8hzvSpJS7gYsQhBzOa+ziZThTKEXEutPtjEs7gqPRXal00Dvyw65QJXYV55n1n6n1MOW1VwT+tz+Hq7JL1QCKmuPxoVn/vK0ohIgoW374X9G1uyOf1UYaMq9UXcFBanzrWmqs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDs57S5p; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDs57S5p"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e7496f947so285438566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805591; x=1792410391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yECm1RLd5ULC3OdA5Y1glV8njf74UTs5u5isG2u8hV8=;
        b=bDs57S5p+mObIf42HyGpoK6iAVize1G1MDd/7DDF5QC6LLMj1Vrz/B4Xg7WO8LQDse
         gvqUG7k6Fu97rYpVwfK+j0ODTO+hRUVzH46twYh0GYM18R1E/fSkdRjyIwdqHicNVacu
         dW0etEKGL/dinLEQI3EYc1jp7nBBkbAlHWdlQ7lYp0v07OrgwNIzzxc18gIminUKbgau
         BKVjRefvuKc0/euZSZFkz7cxh6XNAg+Hjhs1WBLNsa6rty3OBGW1t6nKJkhNpbibtVY/
         J77AskGx4MTX4eaccuvSy5QMqzf7e5/xgqzc084xCJoyNc7TMs94lRiCdzMHi67ycYVe
         xV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805591; x=1792410391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yECm1RLd5ULC3OdA5Y1glV8njf74UTs5u5isG2u8hV8=;
        b=hTiAFYMDF3IoAvL2WAq4BQp2N7OvBG2fDv6hSSJ3TYzU6TkkcLFE5TpfcRNXdRT0yi
         7U7xRGa3H6fDxdLiFc8Z10yzLQ6wOcxcx/8B4YfsZoU8FZpT5Mp5gcsE6am3I32HOq+d
         zOPLLI3+g/nYWnDif5h33kUKlmr0uy1xlkf5AL8ZrJrZmOpTkiLAT8Iec7GsXZAKe36V
         eQNQUsZ3knFVBNun8OFJ7tKrStQ7oX2RfUm7bdkcWf5ysOR9Zkh7h+EvE5jJogS6MH2i
         6KSsyPmJyVk464zEo/4qJXYsiWukFDhdgE0Y/hbeOFxMakJVfiWYai8dpmiFkH0MzgGc
         DmpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUm/zoiQQZ0k5C1P09DPxlXJ5TP3UWGa38zfhgBhSfuFQ5WFn4iSaDUtk0V93dqk47m7yHtjYuc0CYJrk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHpL6gEpEbZbsIfx/P+AY5o1tW8GZ/IqpCN6lSCw4SYnRi+PBz
	uYceF09PVsVh6T5VwcadyaOjUBNEtDcObYvcBHZlvT8NGAsmHxiDvrMC
X-Gm-Gg: AYBFou2PC97jwXDbCqQ4owKfIHtVl/BpW0b8Sn1um/5NTIl5So6L01uZuorlQ6Ise+s
	kjparh8Urg20SAqk2IeayVzD5tQExMcrttaaNSaHcEUwNspeH49oD4xIBvd1xOx5Plw8G1sSSUZ
	RNfDEgmY4fFVtccteN2cWh15hcQaLsE8v0BI0kOdVNbqXBuBE9atmghVwkcL1LQgw3Qo6VW8Vco
	JThJjT41EaO3J4dd+kn5ksin8MKX1TeWfOL/5us5UtU8tJO1+4TGpFObqedD8dI0j8kyZAGfXXH
	2+yTUkok9emOPIn+0mElBCFmjUsqzbsLpmDyakrvvnT1SVJX8tq0DUb8oE4U0z4EqasrEKEUB6u
	32bJV9ei/yB2w27RKjyaiRgZI3lqlreY8bPyoS4IupJj3Wtlmj/xPuE0Kbl4rn28bV7j4LGNTle
	ohy55KUoLHUBmnWaEM6fiRoxvjrZ0JUJEzbUbPe6P9iLxvLjjXUxt3U5T/dgj/0eQLnxfrhyTvN
	kxiOu+XovmK3vKyd/sy5pm0w6xfCfJds+/ZKwjGIRSlbrZ4b+tH3h1IeETG9d/vvzEhd4wQrkZ5
	G1M4FWG4MkGS3yBfdidAD7c=
X-Received: by 2002:a17:907:7fab:b0:c26:1691:b368 with SMTP id a640c23a62f3a-c31a9f6b728mr950732966b.33.1791805591090;
        Mon, 12 Oct 2026 04:46:31 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm118669266b.42.2026.10.12.04.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:46:30 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
Date: Mon, 12 Oct 2026 14:45:49 +0300
Message-ID: <20261012114550.1680054-4-paulius.zaleckas@ui.com>
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

The Zilltek ZTS8032 is register compatible with the DPS310, but has two
more pressure calibration coefficients and takes its temperature from a
different sensor by default, so it cannot use the DPS310 compatible as a
fallback.

Assisted-by: LLM
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../devicetree/bindings/iio/pressure/infineon,dps310.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
index 1912a1b0b4ba..416117dfd927 100644
--- a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
@@ -11,12 +11,14 @@ maintainers:
 
 description:
   The DPS310 is a barometric pressure and temperature sensor with an I2C
-  interface.
+  interface. The Zilltek ZTS8032 is register compatible with it, but has
+  additional calibration coefficients.
 
 properties:
   compatible:
     enum:
       - infineon,dps310
+      - zilltek,zts8032
 
   reg:
     maxItems: 1
-- 
2.55.0

