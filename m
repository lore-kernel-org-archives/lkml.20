Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117273;
	b=fQ8Qj5ZiBD+s/5FcaMIdS2wWN8VRYoBv9oCEFhdmxI5JWI++ZcI31Mvlvth7mhwJdUwp
	 3c2pX3QWfXZ3ZHUIxq29VdmkjNGslPDsv7bRaQcyfeyT5tRmB4cAOgKFrAtAT9BXcI/wu
	 gqMwuk2TR+p9FGBWcRywc2A2jYA6xQxYNjswRa9SEpSycHeaNt7gmBt5DQ2UID4e08uOm
	 yvIRQjfTfIrCgo8Mt4EHrnAghLmxm1gkE41HuU8CXsejhYNgapB4jrRurOiIPFKqNj03s
	 4SG/OBLRqe7rxirIuMJNQJ9VJ13mc3K3a5a6oiAhZpG078MPkhl/KzBhiUdsLKpyTcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
	b=g/mMdi/gsSbHjDx2o6mzH7Us66P4sYRdww9c5iaTOOJ/OCTcHiCbDAaym71lxrihxrdF
	 mbkXSd77K5YTVtjPMytaurmlokKjJq039bDb+vbBpUK0up9v0aQtH75upAyYr6S8D4nWA
	 UpRXlDQ4B9wGeBEMP56TJWgw+Dl6ra6jB0/5xGY6pHQEy2byRUjox5SyrKlkHiFZnKeI5
	 N/HME89FQloMNDJgYwreBTUTiCHORut1Q+wQoqs7raawBsabOcnT8wu4fE3vuez4xcnjz
	 0Qnphx4uWhT+vaQBSvZm/50PJOycP2o3nqg7Ij1Ex76ulNuxDjyUSs/sCPvp6KjgPmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBZxT6db;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7589D606A31F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7589D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBZxT6db
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so84048f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117272; x=1794722072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=WBZxT6dbmtgGu4NX/AXvPKKVj319Vr/Z/eOdd2LIEwC4/4NrJcpuVqz1zOzGGyb70v
         5mJ/I/I1anK89arOMd0mRfkDJYm/TxSE5de+mZf5LIjwwG6/fu5pR+oArGYglD3KUx4j
         JFN4+64u54wJ40hNGqjFDrT+p+Ky/evMqZVy1ACMH8vagenfG0xpFF0CN0wwtLXtledx
         0NcHZqMzrtpOrecUBABlQGBd9VV/hgWv+0s4ynYpSFCTod2+xuIVLhMq/g9uZJ+VzKZk
         YVX9Y8LYDUS5nk1ZrpeZ2vU+BE3JZ15crcJqmHhQYnArxGf8TUeSd0XT6HfQXz93sI8n
         yBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117272; x=1794722072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=l1wOYunV3YmohfBMn08fAPTHW8OhT8NYBBivp2EJ9l3UwEr4E94maoui3EpYkQUGZE
         ow3ABg5O7Wbqg95Mi/dPGMY+G1Em9dvqzyoXS0GD3eajoXAm0rE2n81hizt37b3kCl/J
         +3TyZ5Qxwnw3u+D1YnvAxxIUUOPixA0R52o74mnSGusgaOTx57TUD7EetN+V0H/CHmKZ
         YOgugYKZhHgq9c9TM+pGgb8Rh2BIbmz8xCJxZvgTjbrgMKRQhAQVrksDBekfDNpka9Mw
         qmKtPdouaDvUkLV9smjZQiGLZ5geqM/bJPK7fwiyrCMefKHgcUa9AhGsPeq76BFtah39
         RLXw==
X-Forwarded-Encrypted: i=1; AL+hErFqm+gdadWScSXfM6FzQzh1Qkg6QSN4FGYRsyPZZuejkLZBxePjdt3q2BcHzmc47JeldMuDdTz6h6NimMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pm5VVhygsG/fdRv5V8gopphQw22UZDEM+8Tt39RZiP0V2xZ7h
	yQowvNYHxs3GbfVkvarXauOcyzRrHb5OZMRCb6UPrt+gNfEvGNeIKn/6
X-Gm-Gg: AYBFou1m9N32te14UyzW45cR4ik+XKIYhseWZRCwyRr3q3erykHmC2BN6NJRHgcD0gI
	nwEy0y5oG965EaCVR4xBwxYVLdxTAyCYqqsmghFMWkOLEbfcqIxfQcbld84hjQypaGJya8PPsEQ
	1aUvZTXfeqkV9R5O51Ja2SdgYMRxxbr+bBkyYPJkb5KpAez1jscoLE3+h2M1XMuWEJSd/c2cw6A
	gyD2d2R6lIm0sgkou+BixaRCFUZiddenwyXotC5fI7KiKatKmB3f+BO/3RIdC2fIdsa8F7wYF1M
	FpKd/0U+2GNpXE5cvK8T/kJWPffV0LWfLMI0bHfHEPQOXjCcqEC7cHAqIIuI2HZJq15KwOH+BLC
	SOtE5HZHPylpjT/c0gxhvXBKiaTGjzNQH1LKmfUUP7s8wF3PEap3KWYjHJwQsXDd/WNK3S7JBwA
	X/Fz9+hUvjEtdwvUErArwV5w3jqkzRvSZ1ry/via/UmUl+oN+JJ3MTvysUPaNd4R16RaX16ISem
	+tw4azSRnVuEb2BztEn6H5pA8luAwyKTZrjtjZQUn2i9C9PRj6RbvYWGETBPy7cdplr/RyWVppz
	Hx5CQIB/T0su/f+KclAptPCCxsH8NdTxtYzTARnFmloOu9WCqndEJ7uwP0oCEQ==
X-Received: by 2002:adf:e19e:0:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49588ce1818mr1343254f8f.25.1794117271833;
        Sat, 07 Nov 2026 21:54:31 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm2113363f8f.47.2026.11.07.21.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:54:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 05:54:05 +0000
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SXR2250P SoC ID
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
Message-Id: <20261108-sxr2250p-socinfo-v1-2-06244862f5c6@gmail.com>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
In-Reply-To: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794117264; l=679;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=6bC47xmeKrVS8XaUkfpVIXGQqamVpsrDydmAXACmpko=;
 b=eusKBr2+0jXtX2V+REaLhJvjDXWsVAPQF2wGIpxdLnCYV8LxqKnT1CEBOuxNDsOIg4ut7aHdV
 pYEIRbrScwVCVS1TplNw/GaP76/vXN0delHjd9m9g9w3l9CnTeLVhpE
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..c5b61d28fc9d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },

-- 
2.55.0

