Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586735;
	b=x9geYKnxojZFKzzKu9tFCI63CYPIcfuG9KYKE0PePefTuvQVihrmpIgBrtnV7RiT9kba
	 PWJJ6xTmXD6FGqvyPuA4+zdhZt2oVcYAWPMPPY1GRDRftEU1bcLfbxl4xfpaoKvFpE6YH
	 TEkrjSqksRdbtXlH1Rw7v7uesEI3fLipAGHY2TlCfHJZMgpDUxP5pWseMwkSnTamxaEkC
	 iyukLRVbdIHh+8mRO7ERZ+mlDkxAvnWdvMTE1vGmsWxTM4th9AAJV3nebRksvfSU65e/+
	 T3ociXKESmjY94YdbJ2CffCHR673co3ttpQikDDy8BDEj0NDZlE2uiS9MY1jMJzS2Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
	b=BLdW0iItEmXuzVJuboQ7w9Bb0xh2UqkvpFJX0X9Je9z/TVKamyFm/kendDPfbOwP2wds
	 ZOB3hShzNZuDgGTQjE08qW/cPGzPhqAtqKmWEVky1GuFyWe2JffYjCBHAzfwSf/2vKEY8
	 Y5Wc3HxQL3yfC7jmtm4oJ69tA5pKxqwtywhDv9FsYWPKF3PNxAp31nQ1+vkw2U/Oq2c0S
	 xG+ezFxgNTO+rTTcNGJfaUoJz47G0sChusWzMjWmUsSMFILgQpd4ewRehQI7mvM22k4Ol
	 65b2Yk/oHwYRbRGe6x7y3S8hDDYAavMFq4hU8+/2OQFqYxCuS/H+l0jz42GOiqzjshw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8ApHqub;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F560A2615
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845F560A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8ApHqub
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c445c95d553so218645766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586734; x=1795191534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=P8ApHqub6qGp7W+FFebdVrJ+X5iLbPmacffloHi9fTC0HsJXY7rSMdfof50ekS7ma5
         n0CDtUxTa0CC4Q4nNOGSpnUl0HfOeZHPKL0SXehFLng+heyqaRIn2Mz7ZAw/6ZVcE7ZP
         iNFnqariIlA6DrC4gcyGg/2D1pBSshzYTdQ1bWvEHsHedrWACgysTbNUuVTYyXtLbmqc
         92vsk1zDxV/C7SAT8Nd1NZtnJn8rbJa5wLroVgvVrmlYuhfpGuO+Aq2CHOsopwMjAyZ0
         OKHNz0mtuFA/3TwthJNbgyRMxZ/oK3bMMORNrMcRu1AP2qITEXEM8WsMI5E+PkuLgfBe
         7q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586734; x=1795191534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=MhF7jPSayMPzC5SJt8kTGuNCkIY9Rm+0uSqPjjAsZuelEb/StsESMdTTIGteLWd1OE
         tWj7scKvd/2n88Sz7U06XyOAumLcmAm6mclmwoMubmBv7UULCON1yH7RJdj5/4jJYwOc
         wLUyU2zo1uC8R108umFVrkamZop6t+O4UvnJSMrgbLXrGoJ3jPQcFoMAfPfJcYmAGPET
         bEzdDiABh223AaE5htgbHKKZPwoHEXiOho6TQUFcv7v8IMD1Hgr+cA366iVgEmCelnY9
         U59OpV/GU2w0yJLv8PfZfNA7MhqWZDCoUD1DM6Zi+sLFgoRF1sPRySg+CD8reAayDSRY
         bUgA==
X-Forwarded-Encrypted: i=1; AL+hErG2T8MCc4UxCuA3/vF5pS75kaER6ZmIqhaK7DPPE6UvYC3Xyw2TvMD7AdOlL92ErXEKPeNxVjNh2z3YsqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w4HY28ZwexQhbdZhRILdnNWK2vJh0bzfE80DDc25uxPYaJ2hA
	qsE71RbkKH3hWRMGPV1lJPflFyeHai86Z10sCIuwIrqjnK7kUeu+HYBc
X-Gm-Gg: AYBFou1vSZEHaHr0pyhjiaLoRhq9XMForeB82C7SLgAg3ZUIhWabA0fNUcp/mhh6psd
	0jZbYwT7EX5uT7vjLfG9fA8v2kpYOOW9U++3qBYtgj4xoQ3rIL2qlEHFtilSOukEHXc8J7WHjB4
	qleYKtwCgS5IZUn36K4+Tp9SZz8kW++ADJwWuirG2ZLcuyNQcZZV3UR2OlRASJk5r4gry8elqCO
	ScS7CaESQs/OEd9VGvY3UEqlXU0si6lmO1bjCvsHJtK57X+wxM5DWQKY4DI+StDIP10MaiEkSf3
	BXvpTx70xp2P2KVTWhjp8sEXw0MyUHWQpUwh4I39St7acIhptGavE9/LqPBPJpPFkb4YdrOeZKs
	M8tNL4dHL+w3/epvJ2OP8uEDgTglkahfVh3RxyeQjI7HXrA5MNicRJus7M4TxBrjnyR/0vlD8V0
	SPr1eMeuhTAbKAzoOzU6c5jksRs7iGEZqte/SN1hj9lNQWmhLwIiZ+4e6HzxrwC81zjyLa+bpGm
	rvlQ7xAfaHTyZWiO7sz5sFKU6jgCc0nt9OE3wJ7gZZQ6H2IENplwvV5SIg7gE6z2wUKXV8GfOGp
	qxgFkdfAYZGJsIxUkIEIzugqxsrRcxg0hX2DLEpHG2j1HJsEYsWCcONo0aujLaKXFs2xgbred9i
	woeTqVKmniA==
X-Received: by 2002:a17:907:3e9d:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c5096396e4fmr271748466b.28.1794586733814;
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 07/10] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Fri, 13 Nov 2026 18:18:16 +0200
Message-ID: <20261113161819.36847-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..0c18ac81c6d6f 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,18 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
     items:
       - const: csi
       - const: csia-pad
       - const: csib-pad
+      - const: cilab
+      - const: cilcd
+      - const: cile
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -125,6 +132,22 @@ allOf:
         clock-names:
           minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
 additionalProperties: false
 
 required:
-- 
2.53.0

