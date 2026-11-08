Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131009;
	b=NAChu7YLMWNU7FEpQ0ib3WzAH6maiPnQZDqu44I5AljaPr/PuLT7OI/M3NIqF/xOweyC
	 IDe7ZvxWzEicP6Nf9zhsFn0v2JIHM9Wm6jriOgi61QRdbxenxVKirxXFwmhhrZe7HU+zs
	 tcn+M3FxwkI0lpbeO5B/dJpBMHV8fSrGnwCaaCo3ldyb952hagiKCmfGhWgCkr98QPXV+
	 /n22lQdRGQrq/TMHVOuJkmQ1JjykrIX2QFMl7AJMIG2BYlKxyqsIkUvxA65xYZnYPPZjl
	 z/hJOZFpli/8jidAhbiQSdtY4eq4eEoYXDAbjijALf5OaqhPAistnq+/7r3GxS6qy6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
	b=A3UOcca/P6PzGZGUpAthAaoFXtiLYP4vMt+uwSDxN3BqxiuTs4jQnICKKy9MfGBoVBw5
	 wpNBK/wanH7dYo06hihDXX/iyUxOoxdOh6gQLHp0qvuVJiOFz9gcNTLzBhVLDFnKUUX6u
	 tD5ncwWm09Nte7pdJfJ3mE0+ewo0EZEWjhJ3NKvNTseQYx2eIyg9BheZTrQ5XF/SMg4ZV
	 AHYrgtXhdBifWXOKdu4MiL1G/lUYzfLNSFgikMLEu30weMKBrv6wHRpxnREg5114YsZqY
	 JmJiGob9tu0YXnpGCza5ORRorzmNZxQ64xwsyhLrvKBVvj/kf92Jmtxa3zCpH9qETHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waq5Jg1J;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22036606A33B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22036606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waq5Jg1J
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so16944a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131007; x=1794735807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=waq5Jg1JaS41DmS5x9j24tn4y6UrddE8wBQdKIUpsgUBmu8gnbHKLIY4QLb0KcKjMw
         1Dm8+xteo4Kl0L+sJ+l/GIKcpGAC1DXHMzPZwEdOsOR0su+Mn5LOL6D1aEXBshD//TY2
         Y4QsTZSakwnVUOKF0/AwVj8kAZtdSfZ3oHLfDWg5eWdO4gzqH2mUHt+LGK8PSm1T+7r3
         79geyjJJZQuhJkyxUVZ4zOgQMezN3fe5nVYLk0AOcvCfR45wVwnPHKLSKdurO1+6Wkjy
         uPI1dywmmZTwJoYAmr7yIIhnPhAtt4wKs/lO8Q9Nk8gshaov3CBp9IBTd3OoB2cncv6c
         c/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131007; x=1794735807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=BFda6iSngJI7XMBLUBIZ/LZ9Js+qhO0X8vY6ykkvYwelqCXp805MPEMrSD6l0LnfAt
         uaLwH7w2Zr6B75G88oq+pGz3/YnBWwChev/vZjuTP+DJxP7Z/RFG9F0wMPp1kfYzeeLf
         LQwh4uD/T5718Rt5t7lKLJzodRbWxXZBpIqDvBHT4ijWmbwEX5KozBaeOyfn5BdB0CYY
         ATI8Cv/rdfgF408WH0cYRRKvVoY4cuKLt+toZFB8zTe67pZnrmtZ/hv5UX0yDM4Hh75m
         LRBD47dJvzgzzZEmi5AEnymmvsyqPn3gdxApu2OfAeeFxkw1WYFunVSA9aYRAxPTNDJn
         ATHA==
X-Forwarded-Encrypted: i=1; AL+hErGt+s0f+QK2s5taY5JohkUt/a3ztzKP5ULcm7qN6b5lQ7v8u4PhPSfn8n4XjsS3OYXNeTb1ChgLmh2sUdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pxZvzfF5if/C8l5mbjdSalcKk9K8iarpD6659iPcwsD/tuYgQ
	CTL+qY/WtdDLtdHcUzWYETYHsAiM//hYPnsL9y2z00QT4nbAL40durzU
X-Gm-Gg: AYBFou2Mooc0p6Re7LFQWGqipZJmMhbLEgLoKxTQRgwPac0CQJ1VgaPNwXjASMq5cJn
	2qGGhY3STXUtiVxdh70EQh5DEMxIo7G7c8w8JA5W523OA91VTiiIyo0kTfHZgb930LBLyo+tMOu
	uka3mKi4j9bTrTmFkwl+8HEQ+21vs6Qt4kwfGftAGNXU3tgvj8/BGDh/xhGCglhZ4luYuhBMccg
	gf+QwkUlIMRoRnGmHIhWUCWF0Dj3y3GfBADExye8uW+JoWHkJbrV6bcpIos+s62rnNAqBb3Bh5a
	UuPM98fXDFqotkQzGkCeKfcgN3eOjsM0m82xroTAp9aYZuJH2huRHnXeY3DFVXDQ8qUTHHLvMSZ
	G1++2Nr5AnO+Ga771fJ/Z+8TgqyQeJ//efNKUPqjqXskD2yPISVYItTQMxGiA8j15xsxjCBb9SN
	0FhkJhwgBKKpf3RbR4K+NYI1sDTrcKOx9ekpdBIo3PyE9qu+qy8hN3D9eBs6PQIhEQD8Gaoxpyn
	uSyZYioYr9FqSZ4GUI9O0aYfmtNJDtMwGn1WhHztOTfb9Dfyr7g/FdMDQtgIzTk6XjFSv42E/Pk
	ZDVO5swJQSB7l2fqCrnlALtKQCxBuIj7dOxuRXsZMU2oE4X2E1bFtPvgkWT6VQKwEUD9riu/j8i
	XfGxSBJChWg==
X-Received: by 2002:a05:6402:518a:b0:6b6:eefc:ae7a with SMTP id 4fb4d7f45d1cf-6b7223c0e17mr600130a12.4.1794131007486;
        Sun, 08 Nov 2026 01:43:27 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm436321a12.8.2026.11.08.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:43:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Sun,  8 Nov 2026 11:42:52 +0200
Message-ID: <20261108094253.83899-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108094253.83899-1-clamor95@gmail.com>
References: <20261108094253.83899-1-clamor95@gmail.com>
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

The LTR-659PS-01 is a proximity sensor similar to the LTR-559ALS-01, but
without ambient light sensing support.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index 20abd7da080d6..85ac3b540c206 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -17,6 +17,7 @@ properties:
       - liteon,ltr329
       - liteon,ltr501
       - liteon,ltr559
+      - liteon,ltr659
 
   reg:
     maxItems: 1
-- 
2.53.0

