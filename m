Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731885;
	b=LKH04O63Yk4XVySkrhhlufMwrnqgs+uFUll9lUEAd8zGEQ60zIXpq3Ek1yxF3E9EGoJH
	 YctHF/wN1A8ZPXQhTDoqwkj//FUrPFQ6KQBGx2irwOc8fFaKbVndIlBRmKTMuyBY/Cf0e
	 fRwlmNff9gRg7h1+cQ2QAEi5RPMR2FpFahJOpyRkipFKlhpfn76am+uNTauYTJc2P19B0
	 ToJvfai91MthkdaHCkLJoSdnEpr+vhi0hDbagCuGs0L/7M45M20ixH8R1pQzTLE9NNOFa
	 jiKnqPC7xW0gJxCQWvY/Hfjcd39nApqUweODFgTbJJzetcMNatkCuktNkkr5avSweQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
	b=SdFLVbjvWfQrtk7jNliHlPo/4detc+LjHW6kBSL28GiDYbvyVpGFIcyUXeJpKCrBXkX+
	 Yv4qyM7Atr827ofkicHGEST+m5lNWnHZJHB8AlxN4WVJRovT70FQ3uIhuxCtEaW54aqt6
	 UI8X8gAjfcphr+BJc1GeoFj1s/Jq0fN0hyUIldY3nwF7lPyojvaMipkdt88eiMZO9A6o4
	 iL6lAJMnVXQKEvSIycbo6Py5vnKhUxY6NiFw20jEYIUHITVnCHtlVraPEbM3gVHbIKKBd
	 LO97vPsWJx5KmzVa1ydurA6RofPkR3mBrqAgmlKwbIdRBuzmu1NiesKNTv4pyq2m3Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvVKeoHM;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11698606A33D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11698606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvVKeoHM
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b81214ab40so265953a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731883; x=1795336683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=qvVKeoHM4kmAdUefhbLzNsQaTehL/q6/ivDkdZOAGX/7czeIdJxqhrwmPEW8Gh/6F7
         sbSVMqL0foqRicWhK1ok6tB4VnEe93keo4KAR8lG/m2/3Wwkm5LeTGifc8ZAHmpzbzLF
         rGUP7AgUkygDQ6beLqTYBhv8JvX1VsTYvy416KjYN4vxzhbUFhxpFKv2km7H2mbH8XN8
         oHRnQN0UPr/IXDAIFItpyZABunCQGaOI5pDRNb1I8joEPua4W4PM+Hy1Xb9c29rgSLyi
         4/JBVnhylkZCvfegBFoCUhVZ0SGbSPe8tujYYs5r4yTgwat0TidTciy4GKiI3mrKLx0j
         MUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731883; x=1795336683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=A61aIIhCXqL7D91ESoO4XPVIYqnen6GwMovOW6aruco1t5V/F/U5Gd/77gi+QIsBFO
         Gmyjtctr8hBcuFYCCwNtXLssbtZCJlhXSxYPOB3U2UWwEN42/rbZ052sJEpnUFJVXAOJ
         Tj/gpb9qOG2er35ClZDiHLzSz7NIvTyGpEO/SIQAXucNCZb74izfIZBV8h8h+JEUTGEW
         nCMv97nCI8X62vkJErp0a40yGM3PACsaho8212+b+S+6yWbMz3qRvJnOZfdgHyOQlAhp
         J4a6bj6r9fCUYjHYfmQfvALCEzOW3tizh0pxsRBXW3G3sYuGjHx+YsCxt9yEPCtW288x
         AvFA==
X-Forwarded-Encrypted: i=1; AL+hErGxUm70wOQR18/DNbJ5UYaJTbsCttaDSIcvV1Mk9+krY5q2HYFFv4a3NsAY+aqX8HEC4q7YMVT9BhFtoP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gvQHSWhWkF1RKUXuq4TIVkhP/sOYqkUzPKZpKmAa4Y53tuIAT
	sM77We7XnuiGXEgfhzt5ChbwMyAcbzjimH+v0JQBWAidOYs4bVIoSBwD
X-Gm-Gg: AYBFou2vN2DV+w0Yl6b1BGVY4fLljfq9zRZJyO/qIH/kRxZVhXNeP4a+VQu4HKS5aGY
	U0lLPjh103WLJf/kApGDDOhz2URDp1IqEMaklw9fC7Lo/WegtQHmhbFMtk4B5kszCPlNfToykjh
	v7s54hDQ8438Ru6hpNZLDB5fTFYIJ7rS5pRzCrwUPmft7UaeaVEQzwTQyPb5UkFWBHWbj2/ahML
	LK+GMjJ3LCt/GXNzHntY11+IxILgg0986cdifJvaH4o5mpee7C0Fpwm+uW/WMuRcUeOYwqAWcJW
	2nLW9pq4MTOa5NTQ79AlJv5i4YuMmNXjEdCipoQ2yjAGfXLWtr6lzgLZNTdzoPCKXiFEzUivzhV
	WwZhc0GQkPuvdarwP4Mi99mXL1Tq4kYUHBNVThk4+uBgKB2H3UVhIDL38mhrz5PBsQWWfPt6aUs
	MoLnXSwhj8X7w4EMbVkJHeerMrFgjzQgwmzhWlof6q+eOok5gRJfvPlxVnyUi03aag22DGClWz1
	Mx1nQT2Lwy4q7sVPgcNU5KQ3ReVN3OPp+OJl88kF0tCQraRO/8X3GtrixSWnFwch8zQZkdxM29Z
	zEyCAK9lDwZIOxh7/6d93kF9ComzFdnaL1/a9U2NEQoItblC7KHWVj6qVlDwkLwg96sFNp59rOM
	7WAETwql6LQ==
X-Received: by 2002:a17:907:d01:b0:c2d:d4dd:8d0 with SMTP id a640c23a62f3a-c507c3c72b7mr878493266b.16.1794731883335;
        Sun, 15 Nov 2026 00:38:03 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5ad9esm284815666b.2.2026.11.15.00.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:38:01 -0800 (PST)
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
Subject: [PATCH v4 3/4] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Sun, 15 Nov 2026 10:37:40 +0200
Message-ID: <20261115083741.62140-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115083741.62140-1-clamor95@gmail.com>
References: <20261115083741.62140-1-clamor95@gmail.com>
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

