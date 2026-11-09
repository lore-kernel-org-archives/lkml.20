Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184466;
	b=cMluq/puIyA1Rf+UliqLBUSCbfOmqc1FR55fOdYLw8sVkNWotlna8EiiAGZWepCB+HKh
	 rFK1tAHhD1otZeuEEmpkLbkcCpX1V+gNeSs/WuGvO6P5QX9cFIC+RvePKJn3mVsL/na2A
	 HOVwnOoGY9WEJG083WP34/TD5Q5hy6zHy9kB7KSGY1tkzf79+wn8Mm7o7/wy5voAlEoFt
	 0G0Aq5pYk5sit+ro7jG10S7Ro0/8Hl66bih8X/rVEEJXKPcUx505oT+8erquLL14WIyEY
	 3pWPSz7+m4Fm+7ztHeufE39MAYXZib7N0e1owh3E8r7eH6gs5DdQo7HRxPDh2TkbxLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
	b=X1uZERxxpcGtKpIkHXY8Ks77nsk1LZUcaFoCc7ddCyVW0g/k3RWzrofwJzSuDJCBwlFN
	 YAnI3JgQZsB0nR44AHoFnkyjkgTpqEI9uXd5gnDTtRkoNNmYzcZowm35SEKUcT7lGfn0z
	 eD6IhmL0uBAyGz6F3EsRa4g4GsZ7qaEXPLRZGDfv6Fl68XXq0+4vNmvVm/Zu+JyAGlh+x
	 kqRXOW53JItZVd0iegg8bzLXUqYX3vplcM7X9faWmz0HvTayRG35c/3cGN5RwEwlODZ5n
	 tT/uGC7MrmYIkefHReiDpFnSS0eEOtjUX0RCDOe3ulkKtE9xtKXJECpyW6xF5ulUzUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXTbJrRO;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C47606D80D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C47606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXTbJrRO
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4919a880834so165039f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184464; x=1794789264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=qXTbJrROM77jrmCM9vSlEIFFKfBcarGsiF17Y6oDUL7SOkdiBhgFQr0+YixFQkWEIf
         bYD8oFTkhS58HuFfPLn9H6mX4m0ZZAxM4XzrERkTjpzB3SJLNHOSvSsV8AC/tEppq8Bt
         MGZppWqXbepkL7pMczc33p3cmiQFuRy5MYtLQQte/3bTxKRjI831KG5f3FDqNUryqnyB
         eEKohYIZ4FVRnbdpdXsFLSKFtCHd8jPmqTgGo4qq2x89oY5DmmCjomsXCqHjt6mhmPGl
         Xat49iJQqtdDJ/TsXzGZbMNuKHaq5TRzEMhuqi9PKjPqnxRIxqbDKnE/ZWsFJw1NO6tJ
         UnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184464; x=1794789264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=fOVi7MkFNjJWet+yNsdLel0iRtDcv00CAVeyLhIKlJ0YVBpXQKv8ZH7aeTQ3ZuVET7
         B89yTb+N1qCCHsddxS74xChFI/69sZ9kL+r0gOh2NMi5en4Y2qHIQPqaOdCa1qzht8FL
         b19CIw/Ti+biWULw9ApGQ9UVJWUv8gO/XOfco5nt50KErzIUgcNnjwTUWzo5hVqWBCZV
         wYvVQHkM0i529z+cZMUYa2CHwZGhrr8broGfgrfzIlif1LlKTmjWTe1cm+s42Fj+2tOe
         jxThusETylYOPLW590ysdGX9OSuptrdVvV+LoeAdMgzmPYzmUp5/OEHPZ7nyGQcDFAN0
         9S6g==
X-Forwarded-Encrypted: i=1; AL+hErEAqT2noA2nHTlj/ULzDB8y3uJoHn9MO21n2KzkmtTI9AaiYLV02PdOC7YH+MTRjbd3Y1wLjJvf1GEKuMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ClOd9jtheB9NftAC7Hk4cT+ndgSFhFj9828hZJ1kSZfdCiiqZ
	fCyvmHKjFb9hx2k4iXTSypga388xCTcM3wI4bFUxAhgbh27V0MMEhx+G
X-Gm-Gg: AYBFou1kMNGCKJiO82ekydyMsMP7PuD+JsNNnVMEkf+XMQEdYFIyuN9ilSogsn+qi42
	Z0z5JNIibc1KNeH/VfOXOJavsJ5J/fRpIoVaweovlhe3lWeQqRAugXDKLUK2b+ZhFrslWZICj19
	z6e1kQEj5GIjDvjxkA7HPcYWte7KRzgggX4G5ymg/8GDSUoADo+rL4ODT8u+CZgNXhj2/9WrUMZ
	kEGaP7iZMZEh2q3nV8P9qOf3c6kdssTYlc0HJJUbWhP+vjbhAkSriDj68bpIQXTINfp8yKlcopO
	fPm96UxveKhD7hBkxGDWUVg7DVNNyBy/mQvjBDKjBEtNgA1Ar38JL9+SxQ4wqV2OTle6CUIGW8t
	b6m9f764Pw9x5FqTwuP5vc6C2qB1QtZAnF3T1W/FCJaElm3F2Wc1usuWHlfMc6w09JUPm3CibvI
	Cx1GwtmE+oVe2lmmL/I1yWK8ZbPWdy4s8jY1v41Q9ZNMtb73L+Dff4y1+zU0M1UeoHe+Q9ke7HY
	JbcAlu2BPJQs47apwM9yW+6cSBENMprEKBKXP/NEQy2HvRfTUWnRP4qAxcqIhppfRzE2tYJ1m/q
	XXxz2CPVNACE/AJ4FFhLrnUNei4ZJF6WXbEsoHge
X-Received: by 2002:adf:e19e:0:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49588ce1818mr4774036f8f.25.1794184464442;
        Sun, 08 Nov 2026 16:34:24 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:23 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:23 +0000
Subject: [PATCH 11/17] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 Halliday
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-11-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=/dOrZ5kbZXiJ0bcfGwkBHl7a+YAKGn1bUTdYux1Y38RVDKws5L13g0SU1+8SFR4l0gLQgTvYS
 wprUB1wAKuOCKc4gs9aCLEB0eoMZXLaWUvR2Qma/3ofWIp9EDkckTFe
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

