Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796076;
	b=Zr1OqdlFvWyko9Wl0eI6byDOrCcuDfR4JhzI/zxBGsIpbTZZkxkA/IxtlVNZTHdAqUzV
	 qKMvmokVbkfMjMxKssBNpO0kWyD9NHlqI4PLNzDbz9sy08XPDp06g6HsufRHN7z6nrdwh
	 cRdFVAOB600eFm2yy3kZrhjf0SDbqYsi/mhKk7bt66B5F3kHIMrYmPznDOuvFg4vp97ar
	 KcIGGsfy+0fphQO9j35ca26dEV1l88R0U+eAGNtGebp6/EpdI/vWPynRiUMtk49oaJfqO
	 EBuKVNgodQX4tMiyvZFvz9euem+uvb+B5WtGoyfKpxZt1k+FoKf9Gg7mZpEGrE1lREg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
	b=EVuoIaz6czoK0kTBltL2KvrNqqnnlHVvZRBwxjcY7GaCexQ5mjv+P6hNL48xzT1Odq1q
	 wVBjjx6cdpmdKnXZ0yTYeIDbky4hmuZ2qfuqdkeNrkYT14el5R0vGFmbWICa+eUUJm9HP
	 io+nx1qtavfSdCjo1mmwQNi3PJ1G4lT5K8YwaKgH06bFnz/pD3863/phftlnwutx9ZHxQ
	 kRq36dRwyxIhCd/F9QTbmuaM2tw8KlnpQ6MwCuJghuOPCmeUnWeIuiMsd4pM78hZ1phkH
	 57osmpGJbBHfL/i4/JaRASipqFRtNqiIT4oBfG4dWUEnR1s+RH41jkYM+alptjQAmGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSqtwQi2;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB1606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20AB1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSqtwQi2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso5808415e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796074; x=1794400874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=OSqtwQi2DvYdW/9NDnsfd4FgY18hSmMQL1OgPhtx7ddG+pD8os18yaDsqXQNiF6K5X
         VfzHIMbUnVLQipkK7O2+ICU4WweZWaeNl8oYNGHQ3ZNFu2wsz266jOZQ93OMmmUgB667
         d4kkuvpbx69nmjeyhn0Hyulzm4QxVRNGNsMEjYdBp2L8tQYEk49N91F3CL/98GmGUJ9/
         c+hRjuXNqwZSLEtMhj0CoNtvytO8U5NlcqcODMUb8BJSKRSRB8PNkbnkHSVQNoxF3p4Y
         rg0lTVu9OdjgDya8m1qSsJeLYCrU/vefTFGv4R/X8Xc/OAK2QAPPHfYO+HRO2YBdIMSt
         xyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796074; x=1794400874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=naJ14/lpu5tkoFfFFPbJ0RDYR6+xqcshdrB+eDa/2OGlLtXssBXKSWQB3ZMQyGX5kY
         uaFmxHVJzZgutDc3Xx1GUY8urV+P5mICAzOLx70Y/SkyCwtGYzyVsEC+qBMIBF7JS6ON
         EdqbwRfIVSJ77K+u5aqmkESU9Vr1NtP88OSVsmLA/YGLMshbuHQXpL6DwZnpJKCG+9S9
         cfM02MS3HAsPyDI75VPdRqrZ/K6G2HPtG1uL+FrhlZbCU2MvIDH5qyb4yHdq8l+ab3aa
         wf//8uoLKsVqKZiYWY4jMNUs/zwOXyltcw6Mr2lkGTLLA+EYyE6/1g4tQ+FQeDzgsDGS
         ziiA==
X-Forwarded-Encrypted: i=1; AKwUvBy6l0sZ8BMl4W2LBkJCovEvlyH+sMgccFyOjMMYIieeW7u1TR34ah392JRl+7ch45lSeO1i7EsRllMWXVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W8xs16lSw7BFJY3rpxec/rKn5XCo/jHl+i0/oq/rYZWJPh9tH
	BP/Ow3hf2ONBTPCxM5usTWtZQmMbrvk9P0UzRIVI9xJ2IbkY5M7w/Fzb
X-Gm-Gg: AYBFou1BDHnjzpOmBgljS8GoQUXuy2XbhBWbES1mNhfJOeRnzEe+X/+y/b10qAixwk4
	z3BS41K8KopHSYhkDgrgHnAP5qCnUaQu+KhUorfB8If3WrsqGFVsReTX7pdwevRlE7YkqlOIS8G
	MMUSD5WDqAAdvkEnzqLY58S1f3189oyvFgdRy2T/hB1v6jrG4cWHaB21a7zFto+t6K55mfKbbBp
	z8MiV21CzH1UxVDZylLfSk0TIC9bkL0rxS6T1wOX0N+qXnr/JuSjPVZuKyCoaGlb/wdSwaiKg+8
	6GpPmXa7g5pmnIohvNd9kY9Bcgjh1lzcqBi51ezrjoUYigd0AgLn5DyVpH65jyjsZluwQ63ibkt
	1crgnJ31QMORmwar5e2M7XNQRuTg1NRvat5lWiP+MmYDvbhWGi4h6Ogl7UWcvzH0CbEbU7LVCRp
	/jSi0cDggzuMl9HaAoQ1DOiVw4UYoBbJEOBHyqX36bGAbu2rJQ8HT8haCyyWYlwE0pTtj9f+fn4
	miQnt2XnSZFFH+CwoLscpf66GoYzrspMI2pTHD+yuKqPsQAD1PR6W0eTrK82iz67ftlKO/ckYjf
	o4pA1Y9MgKXoiZd8jAW2aFATZmEVIqR8u9Muw5naqOL7v2tLKw==
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr370091705e9.32.1793796074373;
        Wed, 04 Nov 2026 04:41:14 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/7] ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:53 +0200
Message-ID: <20261104124057.240288-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

The Realtek RT5631 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44c99..3f5f7638cf84c 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -36,6 +36,9 @@ description: |
       * MICBIAS1
       * MICBIAS2
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -49,11 +52,14 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

