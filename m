Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733534;
	b=L8ztibfvYCXArKEWfnwMrQ6//cd+YG9RcrYQQP0eUXYDufS2uQJUjvLtKv45x3NsxrQp
	 Qz/+PPSh3tGtITd6bmo0LzHYRxqxDxfUgDIa/MOox4LDYNSmmYBlLV/0hRVveHJOeibDG
	 p0QrWre4OWSAsLZTEq7TfjGDaHKigj3Omvxjk6Uj0ZM2tYrCVnpam0aNBERcLk41Mxa9x
	 5kEGTPjOyzFR+rbaLMttQcJdia48dJW4gmbzopkII7EZbnR3pI3GYtOnrvJ4DYIGc0Vx6
	 vJH7vr0QotyntsStoaCduH9RCaAFvqG1n1XEmYnZ9+LgcPiaB9v/K2cLsWCjQUc6yVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
	b=I8F6MZL6AO1DfbwrzgUeO15KacHs8safvzL0HbeufxK72TrTeRjUsVMn1JbDKtastIA/
	 AEtm4OPxqgBKRbfgOvkzazMDdVi9M6/rYoDMDLT878Tz8I4CpKSPvudXMt3nKHpmqE3cT
	 331j9LWoKa5Qf7qFTTHeQNe6BRaXkqK4graRv/BpCfKW2bkGHKQR/SxN2vv4xZ0GYcGWE
	 39iEe8HUR4pqa3dYU4K9aAb9wQnDhCOgvrSaalgbLZi67Fm2LVSyZqBvxDP3XXl0YQARD
	 9aQE/hrfWpWPoIBiv/umUea7iS5I3TScwl5TWdAlRfmU6OJZZEwb/IktYMCLOMvS3Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ih+nrjKF;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806B6606A335
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 806B6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ih+nrjKF
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4395d31228so422170266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733533; x=1795338333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=Ih+nrjKFK5iCoO2tO7pmH4BWGl0hxpb95KHxQ4/FgWHWtbhq1z+Ym19vNfTmdEKS2x
         IR9BvFy7eMplgehfWprfu9XBH7qqi9EKHZGvlR8PO2QQrOyXcBv4109VJvztPeeBEKgE
         wSXsMVU4ej1cUhzJXB6iPP8VkoYaTBjAAlc2IEsw8/UZIMIBQbScQ+6JkcOh0jGd2UXB
         lYGtXrNFqHyI0Gr2LnDE3XgN3PqQcGuqmwoGMcWGbKjLSPicUTFruc+6kkFFICtINFuo
         Je3BDtjriYVp6eagNVfSED46cJjJbG+a2aKKvd9ZD2wFzNXeUZ9jrJHGhoB/2dJzYMfs
         2RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733533; x=1795338333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=PjDmOQyPHnoiEA7+EMsabqpXw3cU44JxKcY79zT2gOHcgte5N6zFmjE2wEROSj9W8K
         cKziC31NwUVwEw0eKPagu5qu+rfTgfDiMQOiT1ZiNOWMff5JepgVRVZmM8Rsi0ifXj9d
         Q+HdUiKsmIlmHUqZdQVAPHv73MayqQ6YiW2coeZLyu0bpaN0z57vkT0wRBlIeL/i//Xu
         Er2MHtsQpLpNAbI8WOXU0978lIGo0pa3Fj9fIcIBEAxJxP+6uDJx3odTd6EoUXzcGBi4
         5H8KOar3+aC0LbxGrLDy+V3fctduVVVWRVol2m1ffaSRNFDLnBAIWqpnV16dpR4ut5+R
         gONA==
X-Gm-Message-State: APuU4Z/M/jq+wxlf0qLfI6hSSHgH4niGbwHom7WxAqfy8kSaj1SMjii3
	BtGYl8eMF8YNjGKNLHFvZAKa4GxE8XNF3rXjJ4AtBwB9lWwuyH/RqtTH
X-Gm-Gg: AYBFou2HgXO/GwersLWNJJLqScXapETOEcUcqZ9/Hx2JNQL/yHjuJjxI2mJFijpUz3+
	A81S7c9Hz6mwmzf2OT5G44Ugyi77S41l+rR6GruuxHwnHmxdx18lrDTsZXxyLi7OCfg5r4h6Yl/
	QrCGZd9JDHsDd0NHWYYUsczmWIu+TjxLg25TARFKFzrmZrtmQkoZVApyut0lb33eeCDdZ/eYoux
	fHCQGWz2/wVmkbjT28zYNIXeZoca21neFR1NdMQ2rFOAjdvgitLMRZQ4CTomEbzVF2+1l10rgsw
	ioyZn3mmNxOny0/A91ImLqalkoVo/QKv8Jsf6n9z1hvmIyvPb9VSvhstsyjIxMgKCTv6Ijf64vf
	cZQYPIfKMWB9qlS0JJYPNjZ0APuMw/O64Kv93JYSVebYPuvhi4LG+Ksq/MNesZVihJH4HprxAAI
	nABhMyvWW3sdAJxZu4Ry1YlkR6UdSaaD2Y8Z7IA6WTIsHIjMSXpk+rzbULns66jzTDHGp+pvtbV
	IIfYQTcTp++wtdFYGcd9a3KqDLb1GbkFRHF83dD8UB472Tw00kZYTMo7J3zDJx7IqI4oiWEp55c
	kDnqEP2Wv28bzVKiwx9v8hFz/fL4R3txPv+u4YhFGM5JAW8Y+IHQYi5QO99897r3CMzK+iNzN48
	e3QBEC2OodTYOyVWIPSzeHTmREgcNfw8=
X-Received: by 2002:a17:907:7296:b0:c40:aa04:18d5 with SMTP id a640c23a62f3a-c50963075ebmr684777566b.15.1794733532776;
        Sun, 15 Nov 2026 01:05:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Sun, 15 Nov 2026 11:05:18 +0200
Message-ID: <20261115090520.102216-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090520.102216-1-clamor95@gmail.com>
References: <20261115090520.102216-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maxim MAX8907 PMIC supports a single LED; document it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index 6cf8e93867e1a..ee1a305d1c210 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -31,6 +31,10 @@ properties:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
 
+  led:
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.53.0

