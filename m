Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102458;
	b=1a27ht16Yqh3CzB7QYc2UhqyfFCXQ/0IqEjaQTPBq/x4n5UlQHmdpDDTV5jhSD9T9vDG
	 y2a/Ga+WMscBlKoawTG5UjIgnAlbgYKiYgD+ozYjLhaC4kpgR0ZtACXgiuZugFaOxfqdx
	 ljFCTxBi+q6WuochyfSxHlUWhOovufJ/MF22C++Iisl0su79d0k+xysQcZXME2Iv0JV7v
	 fCPvs9tZ6D8JQUvNql0tQIXWBqJ3gPQTmI9jJ3o619Czoy23sagryWuuhnZq1YMf6l8Xd
	 3ewLMzGDRUWZdDKIg7mCZX6hJUzewAhpV6rLu/qRpZQk+t1jm2fTvUdYeJPHl9fdGJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
	b=eS1PLC9RCLYlWXMA4+hubQeHfQTC4xfVTa4kYN2ya6upXE4Wifz6HkAZ5r560g6wlNNL
	 1hpglboQqcbPMKNm9DWqjje3Cxq+/hSKRuyBAXLg0lCP3nM3f0Mmxuq65eW0nUCVL5EaX
	 MKlhPLd9S+otZb7Xbgso7alPF1JrXwTm+/xIOtUBLEzvatW2ojDf5DTy8lSx9oZ4YwrFm
	 OV6tG4v2oWNq9JI+iPLmxg24FgYaQyhVieNuUknqg7CS6T+CKHsN/R9yAZvMl5qx17fD0
	 92gzLYa1trYuiHES+2xLecVMH/V0mI4hzy/5B2Gg3aYPG1F7zHXgvyxdiS0/46o7PAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0njOPL4;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D2606A334
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B3D2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0njOPL4
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso5582276a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102456; x=1793707256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=J0njOPL47nH+nuOWZgYQd1iIoRASbk4F0ijanhdpEKFSNwiQUSYj1A/63Ui9POlQu0
         BHjUVxBBQGr2/xis3Jjrqd+yaPz1vgde8hZlyQtGuAzKbIZmwlMvvV3sn1uWuYHLZ8iX
         r8qkYOLFyl/3FSZSOncs0badumBga4ckaoy5sce4lIpvacvmDe6lm6noQm0IXPDLOjlR
         YTRxUPlVjVk0UelR+bqruaPbbRT+Y652yOTQrFQ+aSbpoZA14e4lBJZr/O/BEAkV5Daf
         PusOj/huYVTguhx3ejtt36Tfzg25l9r6A+r64SbOEfDLrJZE/bowF1L7pN6ero3rSDvd
         Ajew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102456; x=1793707256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=PtSx5/q9BVY3Pmv8ug+3EY1m8n/H21PfcHa/iRDM2pOwJK0AsLK+XzYoGxGi4bIlWo
         wwEYi7Gik43tivy7lB/dsKRjuos7Hjo7vVB5JXQBQM2NQfj8ggG+2jdKIcRAF1rAKzhj
         2huVEHP+RODS6pO0s4i+xVaPk0/bBntPNdoPp9PkroWCVzAgqiPlHtWL8N1hp7pjvV+T
         5yr6fufyvOlqV0sBA7K7exwWuy+maQS1wcqUqcx28DzdO99eDKFkBKNc8fuWka/wRE/4
         hXw4cnmy/M3H9B4Wdpl7O3a+PDlgXZo5f0f/U3gbg0ThGgC9RGse+tdWQyxtaJkko/ZR
         mi+g==
X-Forwarded-Encrypted: i=1; AKwUvBzI+6DmfivD14y6+myPzCNey9axFw3Qc3zc1ayDqNR4w9Nef/RksjqDR9MFlW53R0tvMDT69O97cvhHvbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd38PNYgO2botq622Vdv+se6AAw2w8c8cI/DbRZwF+xnyEZQTR
	CgYIcKlH3JIWvDAeOxlB18LddGJctIpPEmgtK4K3tE3IOYrKx/JfS4iH
X-Gm-Gg: AYBFou31ffA0W27+DIq9twUuX/ivlMWiHxAEAd+iMTfD50jDDXHjMYYC3jgpfXfRC4T
	mrSK9iZ1jmHz9GLwWCA+Gqmr6QtwlXtFvP8l/nDl4DaA4xtiD7/ZP9lq7nNq3GOl4NCIdGGuhSG
	VaLd0OayToDoT2cL+JB2IHGG32kGDEYqwrr3E+0H9f/i2wVxXgZv12L+24fzWif/JOb3nST3Z//
	b5eMq5h0KqkH3T2GfStdRghlYIsdT121ISblU43gHiTrcUtMJPF+JJj+8Z+KeD5FTYY9avEjPg8
	yj3qOyfQMWG467V3pQRgYCWyeXG3JLpibTA9nbfInyLfHP0USlOUZZYj5V93WlxEAEG2i0ftwYw
	MGXc8IbcZPCzJhmlN5+/6pL/ol2QrUhxXJoNolIcgJpAqLOYPvlaNN1EOyz1horjgGuN0tRUQgn
	c5D4b1llrzwlXkxp/MBcds/73n3xExrfUv6MmfYPKMujOfTMy8pp3UTrMWfIGj3reCBLdNlP+8I
	1ZMq8HbdmLy985/GP/i1dReAe5Q+694JE+YXrHR0iR+cWov1VYpSi4d5DchxhfwveR/CFpzDkQN
	INzGAVAqJhygAWLZidroQ2WIXGPtXEz2VFrOFAWSFS4685N3Qg==
X-Received: by 2002:a05:6402:4142:b0:6b4:8d52:ade2 with SMTP id 4fb4d7f45d1cf-6b48d52b5f8mr498029a12.41.1793102456264;
        Tue, 27 Oct 2026 05:00:56 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:54 -0700 (PDT)
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
Subject: [PATCH v1 3/7] ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:15 +0200
Message-ID: <20261027120019.93611-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

