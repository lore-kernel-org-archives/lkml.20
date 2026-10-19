Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F07498E20
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398990; cv=none; b=TEGqgSBDfxrziPOuPo2k9TB36OgR95CeeGJSesWOkAwMQQMV53NtHkqueKmTTXELjPfPrryIXoSKMcVkgHUjA0Ef8RqI9Uix7Fq7rrWW9EGQcR5Mo73A0wyFTYblP19W/1Tu1hSG9Uknz/bZZr0zs92+T700GhELsfkWmxJi5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398990; c=relaxed/simple;
	bh=WNP9t6TIXZ0Xl+cKQ0K8b690KUl1scppTVbII9h9hh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHDNRBzBtjJrkYr0n0mOUcYu1vXbrUI8deKlTJeFcYEE5y2dOnkdApllIfjsa65AkbpHzBDYakXzkEi/2wsot6fmbPWUYlR23Lf89EElzrgVDJsfne17oxCgc2ZP2ic85gFO+FHIvEKU/Np20yi8ILVisl8B72EkuUDm2eFWDdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD5S1t1A; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VD5S1t1A"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c445c95d553so64356466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792398987; x=1793003787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZCkslrjV5YGHVR25wzRLTh0GGDFeMzjCzaLuY5/q3E=;
        b=VD5S1t1A+M4ysbBYWBNahSQ0jaxLgmfHy6uYYITP51oOxcuzMNJ7W2qakpzzcyZgkX
         atDOKWMVlcatHAPpl2VDMxqNm+cMsQSm7IuujPD0HqDAxcisaTXYs5ruTS6Lj/buSXfa
         zPj4cXcja9FZr/NRRMr8ufAdHRhKBIiWbKkZ12SHtntkk9ZLVg3mM1AsFhC8FeD/rec5
         szjtVwpNJnU3WS9benbANAd2Mj2dl2XV3OOeDaSmmwywyH2wdnfLnzxcAHoM3wwg6HIh
         vHW62bANfFLeYrLBGRWt6XueLdCwFkmG/xroIAPhXxZaY4Iv1kjVjuA1MD5S4cMxL+36
         vbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398987; x=1793003787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZCkslrjV5YGHVR25wzRLTh0GGDFeMzjCzaLuY5/q3E=;
        b=qKQd7hZmnqGAkHFbk9aceLzOB0kii48xEa/MuRg9V3czqAzpApkybYyirvLWvXfkjz
         abCROEfQSvSygPpEXKN6/oNIDquDTnBYXY07S3OIDK8X5GR4p0Uyno9R7BNVdzN9u97E
         zkDLY/gyCw5TEAidEMVziiday/Ris3siOhg+ijjxASMMKoPgjfC1zxfdCM6JIPU7dygX
         igPkbFOqJQZCPPR9rGISylJTBTLiznoGCMURCCV4CRynl4UIt6Nj2U+Em3Y6RPPeCKvY
         3M6Nk0j+udt+rtawusXZms77RQ9LqIrg5jd1MAg+U8MDzcgFjVRmvymgHHETf1aQxJuB
         0nmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxfNRXiGDA98ftQwUx7vJv7ZF47hEAq/fW5IAiHd60G4IjSQMN1EuMQGQEA4LPcE7DNy3nMsOnV/XHGm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoYEY1Cp+TbFdMn/zymlq5+IB/jQPj28Jq/KVgLTe4GbKXL2hF
	vJrTi0bQAWqUjx0bG2kTRno3kUhSZrbZtpjYv8nvq1BtzBb0GZJ4TJJV
X-Gm-Gg: AYBFou1dsylBuZ1QA+ItiSKgtOvi1N2gftBl9hoFYvJ6m3ntYdDKoPfQhJgg3A4+69a
	YzdDYhD/VFG5qn6VDcutoFywKh5MJmPfezfzhFbOCh8TRtswa64ZslOblAD/fzkzXJquDgHfJgQ
	i1hxAbAcRg3bS/qcuBzIgmlV2Xko6Igqk7OYuNm2xEmQ5G5PJY83Ev6tryb6JSMweP3UEpoDZd+
	MjeStavgME7l5n6jxS8kg6Fa/EG3FmyqpfJwFfXxAq883iWMrJ8f6yyCUJP1hb06lH4Oe+vHp6F
	Xj5CcYDYZEOLdYmVewDLAXH3gShfLOeq3h/0pYSimRJ3dggxrydiRAe9OAfo6CRxVIEoSrZX1CW
	p8T55XMuSbLe7sx5synxyhBW8bcGtf+lHY3iSc/HWJh9nmbae6B0ZdWb9nmTiIGKqtMX56ZQnv+
	EJJNr7qVZzBs0z88NkXqwhz4DUZJkoNwunarIuiseEvxP0gb1ccdq1o7/T+y2RZ9ktVcIlnHVPz
	NlzWZS2bQd0wJPSwRSOFOGKQVAv4A3pmCqZ91y4oPm/gy7srQUWcVjCTykD9OV3nO2Jwp7avlad
	w8D/ZKHlpdE22If1CUXQBSfD15g=
X-Received: by 2002:a17:906:c142:b0:c25:91bc:ff55 with SMTP id a640c23a62f3a-c419e639cefmr500101366b.23.1792398986916;
        Mon, 19 Oct 2026 01:36:26 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm323106966b.13.2026.10.19.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:36:26 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/5] dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
Date: Mon, 19 Oct 2026 11:36:17 +0300
Message-ID: <20261019083620.1285782-3-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
References: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zilltek ZTS8032 is register compatible with the DPS310, but has two
more pressure calibration coefficients and takes its temperature from a
different sensor by default, so it cannot use the DPS310 compatible as a
fallback.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

