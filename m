Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679977;
	b=S0jgUcMTWeMl/F4vJPEX4NB2zQ4tIboUypF0GW4B61uISn8kDCNJueIpOU5TVpcSY5RW
	 rAAIhdNBGNMHGL2AfYuo2XkUxi/cAShF1vDPdSYthYY4LQopeuu24vPr86TDmduwNAdlJ
	 y6LkCIoCxdYZNtQbAsoyMFn5nFeWRWpzQAjY2Mhcyeqe5DM/7jr6UO7P2e1D5lhlMMFzm
	 /z0J96kw3nIP0cLrG0NI/oj4IUU6SUhPm8OOZO4+KDAzFygzQBIcX9DC15Oa8NTY1M5ky
	 U9aE2+ysMFaDfz40qNvA3bB4nNPMlaPE6rAtE05Ey4uX20y71TSC/Wp+9qdp7HyHMXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7cQFQl2Kr996XSKX3WpePSzhZ8Xk95BwnJZrJcsq3DI=;
	b=0r7yIln2XaFi1O2ma6FbPhWoRmA7zzqhngIdiyOn2U1ySdtOunAC2xC47hwBo3gAMU2v
	 dhU7XWXmxwBFKGfdPI5PqXm3OEeCyg6FVoFofAHNUh4+SBsGUbSW9Mq3cXrtEUqnte2Ab
	 de0VU7pEctaKSAxX94SfoybFns7M8tRwgG7riZ6EsrzUClEjGA3d6ZYiNFoaFLlcwFbEB
	 uLV7bGeY7abwH922gT3m2r2cRi282sB4B1hRMFC/PwwuINETla5XTs1Yd7bBcWCzpslEi
	 jL8tb+tGdOmSYqKI7NxqJugxr7v4loeGQVOrMIdn4yHxTArTf3qG8WqFTM0QMwdqeRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nZp3jnKD;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477A9606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477A9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nZp3jnKD
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so3049088b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679976; x=1794284776; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cQFQl2Kr996XSKX3WpePSzhZ8Xk95BwnJZrJcsq3DI=;
        b=nZp3jnKDcr6PJu/41ySHZawK9J6mo5SYfa/THCHEETnQAkc5z/EPnk48D5TyqlHyCE
         yqv/zuQxGR0CNF03z7owlwq9VBw0rasR7jcxA0CjzY2PkrHZ2atJO1nurlJnukG2RQtx
         Nhqroo+RVmPn94Dv83B6bl1XUJn5YXsFpe8XaXEeChtraC+k6rpfsSDC1+xM5jOCYG2G
         zwQYU7ztmx+f89kSE1VZLfnU/6O/xSzNnHNSrk7Bm4YsUoYXgEsJOx1MntTHDCbjS9z/
         hegvSNY0K25D2lxmwWVi8jr05VbQC+AjC4orY4SZtLegERuBgQO05E1mwSWXEIq4u4sR
         ftSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679976; x=1794284776;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cQFQl2Kr996XSKX3WpePSzhZ8Xk95BwnJZrJcsq3DI=;
        b=ErW7c0iUCz7AOePQvRe8U5MlpBFSCMh630kkhv99HHLSZe9k6RyTBxoyctfMQTli+d
         wvCEAgJ8qvH3Q6+D+lYz3kf3ofm/2RP/G8digvOgmA2jPXn1fC106JwkxavDZkGsdRiN
         AXaezZosfhRVVrN4n1ICzxG86K/WY8VFu2n81dhqDLjVYdB2INQiQV46MhzYNUTIqTFR
         iYoSm5/O6SvTpxqCqobE4XLr6kqMqn9ok4ieZZkmKgAb2SgSXXjcSLU5nlhsyoeIqwPX
         GEkY6RbtROpq4P7so0QNBRVFh6X0ngreoIKE/GDULFb8cnSij8+jB6J3Jpw3Jcwi55nu
         BOXA==
X-Forwarded-Encrypted: i=1; AKwUvByXwODwfdGOHUH9ujuurTzkfCkb5+hNCZ/q07UPnWnCuMjUQLGbpz4o43HVWTvJ3l7LdWbkN/LB9YAV1YM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YyYPFFJVFg0EwNQRuNYyOjucleVUlVYpczX7NvRF5Y0W6de4w
	GjEiHV7iaOO9ov1yjKJ3Jx82pyHDgAznVShh4CaF3QOhHxFcPChAtxORBMrnhPTYbN98wrCsvAb
	XvGL4+cwUkZ50EkoxwI44iknDvFSynoUQsQ==
X-Received: from pfei14-n2.prod.google.com ([2002:a05:6a00:c04e:20b0:891:b886:dd4b])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:349a:b0:89f:7ed5:865c with SMTP id d2e1a72fcca58-8a9be396728mr10313189b3a.9.1793679976311;
 Mon, 02 Nov 2026 20:26:16 -0800 (PST)
Date: Tue,  3 Nov 2026 09:56:05 +0530
In-Reply-To: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103042608.387626-2-vamshigajjela@google.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add smartdv
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

Add the "smartdv" vendor prefix for SmartDV IP Solutions Private
Limited.

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..f15d81da1e3d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1569,6 +1569,8 @@ patternProperties:
     description: SKOV A/S
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartdv,.*":
+    description: SmartDV IP Solutions Private Limited
   "^smartfiber,.*":
     description: ShenZhen Smartfiber Technology Co, Ltd.
   "^smartlabs,.*":
-- 
2.56.0.317.g454f8302e1-goog

