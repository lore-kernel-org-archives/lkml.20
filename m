Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733894;
	b=J3HKR5ZWHLfuGL4B0+COiArK6gQ3AoBY9MIUeccBmL4pSL+rV7tEuBTNzv6SmAeRFj8p
	 0zib5ndCDOMkQAgQuS7a47cvM4lZzOztoAMFdTeDqhpChTsxbsDc/0Ls/Ka/XPBtSSy13
	 XNyfiB/CVBOe6+jir48GndsxGRIAvC1HJAlbWPAePHGGYVu5W6ZXLQsWDFPE4ep8zAzOM
	 TKOWlQDri1vfvM5sDPrukEsO8gVTIll9aD3mFNKjorM0ojccsUsesPZM/gE3/Z/Rb6mHw
	 QNEAho8yA58y1zI6Z0brWY3kl6fESoeyf0IGpr4ikxPSSZ99GlBSCXcoRGNPj9ZddZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KvSzSzK4RKteaHZ6/hsaC8V/11ClDZu+swGpFBPSid8=;
	b=ILj4re/UNe2LDOMoMczhOuta6yqLEOZmsOdD3lGzHxDgIlMbS4Q9IMB34oBCEAMkTgNK
	 QSHwAOSqOQ4Py/Ax/Ig8Av+gbmar9GR58V8lXlB4/ToBXpF5rmaBQU6PnNoghQuAvDDIP
	 1/4AWoP3FRh5FZvWXednNxFrp67jDXf3WdI/kuUklpq6JLpCMIfA4O3ce/H5tTXSnk2Fk
	 G25CQb1v06K7jvZ0Djdkr4Cf2WR9OpPpeBf0nsJQ+34omkv8t2XPU/O0vcx5I+nfQK4Dw
	 Avf8FWWPQoC749K/B1tHsxLGH1FKOc+r3aTUYMA16pKwarqfpZuUF2yJiys+asdMR0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhcnB8H2;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA448606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA448606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhcnB8H2
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c247f6687dcso472231766b.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733892; x=1795338692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvSzSzK4RKteaHZ6/hsaC8V/11ClDZu+swGpFBPSid8=;
        b=VhcnB8H2O2+aHJtEWWYXkj17gc4oRvabqTbRsHIW9PCroWlszw8zzmnKUuHwftGIUT
         jqxuYsWhxegfsoPv3F4fqngCnsVD6tEp1LAOs3y7z355+oPtPzqAfmLC0MISVhdaEVqY
         Vp3/elUXaFa84KCT/vxVK4oeGxtSkPvrVxWO9Prz5CPE/sceYXN0zw2nQTxu5TAS9+Gm
         IQzeMyq6YhKnezCrPXGRkSwyG+RO99kjGg1lL5iEvI2x24Xk8jtWQqmfVpqZdYG8+mNN
         plunPJ8sk7+Df3B7m5besr0VQZZabn2Un4TMuxw3IAORbduQf/+AK4N5EFOuSlJcIhmZ
         qWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733892; x=1795338692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvSzSzK4RKteaHZ6/hsaC8V/11ClDZu+swGpFBPSid8=;
        b=w4mQGDtYoXzCmLty3DkdhVPQ6p0JMbzXY1f61B/VvJz0I4gc9RWO++1guhF5y1BPOD
         mCjhZ8nN7u9Vv7fwAZgcmiT5T5pkViLFltsnrh5dguyFVIMgWaykGn1C1L3z8OBrpADP
         TX4op4BQbJO2Kre25jp9GiIZfNTbdVrk3D//Xv/gbD/ON85VZILtjHKg/4YeW5SKxkXS
         YZmMIT9O8JDy3tFXDPlmF0l/5PsTejiLmGcfv0F9lxeG04w67JyRzQxKpIVcJsZq8+GN
         Hx9fVf9D7jD6DX0cf0eEVe3tU2gJZrbrUpd8DfVZ0MND+IhQgib1FwZkHxgJWMbG5TmM
         nW2w==
X-Gm-Message-State: APuU4Z9P8Ju6Al+KgFvdfREk+25UabHp59zqufn7HYo46l2N+tYY8V2v
	bS42rpiv8koitfqHeIx+g9WpH+Pf8SzMi5GUiffaGeZYFGHPgB5bYCUU
X-Gm-Gg: AYBFou2JLe+g74P8cCpolhfw4P+3s2WWlsYKaLCkKm4EjNhRsySDFtYHLrci5+3oj4S
	6/SaFvAv3GWlvBPuHpabKop0EmRC7DLnDKy9ZGDJlxnaT4H9lihnjrB73h/56YNO+lsZHodvoWd
	svDzj4klM8362SkGmD6eeSIxaBzdMfvjbF0AQaNrODwYs783Yb1CW9POUkL2FrM+x4Az8bM+/3u
	8QLORjqBrJzTULB3gmY9nrGHyGG2Yc7y5lCnHIjsU0JxtfvE/qNgyFksTtXVCzjihDytAkhJYmA
	KNELlNmgLC8DCYD1UX3PPDH40aC9RtxXxOE51QTvcp2FeFac59iXtgzmPMUT5NdIxK04+si8Uk6
	A7M4bDST8h99sjviy5exBOHUYyUqwLiBG7iInvBjB7lxyDBL6cBdtPSjwP40XPTb2dg3PQsfnCp
	4EIji4kc0/wazNvbeUJ22Y+5ysGstqKqd6tlcktL9WmWZB+yjnHd6eOxxv52tyK8upAlV7P6PCT
	jmzjxE1Uc8G5HbqpMeuutGF7ve1AwR+yBBLs/lBNLjB2Kp44rNYSZDVxlTzu8scBfDMcIgkI3uZ
	BxwyrIUZB57DSI+EMs3Wc/TtpHnIY9BC32ASnX6BJP42EXIAP31HKcb7s3KQUdaXgDV/R2rtr/4
	iiwqLdVx2Xg==
X-Received: by 2002:a17:907:8e08:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c5095db2440mr698968966b.0.1794733892245;
        Sun, 15 Nov 2026 01:11:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 1/4] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Sun, 15 Nov 2026 11:11:17 +0200
Message-ID: <20261115091120.108684-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115091120.108684-1-clamor95@gmail.com>
References: <20261115091120.108684-1-clamor95@gmail.com>
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

The Maxim MAX8907 has a built-in 8-channel ADC. It does not require any
Device Tree-based configuration and is folded into the main PMIC
node. Document the io-channel-cells property in PMIC's node to be able to
request channel data in the Device Tree using the phandle of the PMIC.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index ee1a305d1c210..ccdeb9ba21e26 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -27,6 +27,9 @@ properties:
 
   system-power-controller: true
 
+  "#io-channel-cells":
+    const: 1
+
   mbatt-supply:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
-- 
2.53.0

