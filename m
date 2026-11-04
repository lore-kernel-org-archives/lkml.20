Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796085;
	b=rudilsQ66WB7Xu/ve2WAtcHh83Je3sTcYTtyGV1izDUsCudIfiWYdipWgfXtXX5aTS7M
	 E1Ot0zi5pEoML69SJwTllU421URBuznUZmM5nVe1SSHsL3Y5F7HQ9+0S2fMjVmHPHSPT5
	 9z8Yr/raePS2K1KSQVPEZECyDGCrm1bq6Is2ivKr4vffqOu09VjFkLtw03gOtAKZrgiQr
	 ysURhwkvq9NtntAISkKBzkTm2BFvHXiUoNjZnmiigt1GxFI4CNEdCZTuDWLd1T3lOSLi4
	 m8NIeSQKXfDY3hQKSBQnPAKJO9tpLnsyekfWOV2xU6XI6rbfP4vm/sUTPvi54xP2Zmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
	b=4Wa19k1DURwSgPCqaDRxcQCtMGUJnDqgdZ3DcJh/CUkSc8WBZJVjMfwBjLLX1Higqgom
	 8aproRp/+1wLQ9xGVMeMXdxpJtvBplZUrBjHD6J4hvrS7S3EDB9ZMRI8qbBZqtxugrPJP
	 dLcgNuYz/kV5dkuaydsrvVowAKwXOUWoiw84AG6Pwy3/IkNxUmT+rWx6LdZXmF3wnDMMG
	 4HC3cFMb7qUfSfSOOxC4ahB7uskk9Oio/GtYJDN46WqrsfF//RjtaPtJZg7EvTNHjAeOp
	 KzHruUitBrH5Cb6qUuawwgp2sdgbhwxzzV9PlNlnv7OD+5qyDzngdgORoNlgCWwJrUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNhd0UHH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D105F606D80E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D105F606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNhd0UHH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6169695e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796072; x=1794400872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=eNhd0UHHlwredQE9dCABAE+no7ssHugAHzFNVD852XOpfPGxF8uQ9W5bPcI3+MwqR9
         Cw++Le4R37QwQjXfc7M46J56SV978jsy4//A9Cy2feU8/LlulcdRClN6aPk837nurjgn
         l4TyUixz3zG3gjBQX03Rsnm7rjLh1fJTNlKDUOxYodLhoED3eUn0Mu1xuXAzVGPXWsDL
         dvv50lpMvZDaxqD2yHPFMqfoQ8ZhHJNhlBPenAaQdepaWew5UKtMxAA3Ulo4MhH/eHqA
         FccmAKvd6BxvHxocuIHe4/MNg46zvMZYOffXunaoQYmCQGxfv3vVaKdD1LqcXiY24ExE
         MIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796072; x=1794400872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=INmIoA6SuaGouVBAz8Ca734ALte1o+R0nGQbb1QOhqKCfOYzZmZ+5XfLlNQgq/Imrb
         CF/Z/BttjmmoEDl6DJ/MRL4zzVFzD6EzDdknwqEM9/DpUjg09TJmVZ0wk8nKQN9SX/lV
         f/9zbCmTYMl6YICEYO+vFn5AaXAZKrmgd7C9i/SUROSA6g0q4booNixzexQoaV2mOurp
         mVO/FB/FWzpndqTeenph9fIrtLd6wekNjGhZxUMSoEzoClAHXQ3ozRirzj9rbO55N2O9
         NtkIKYKXfP4Ef09UF9Ksjjh6IQJw7x04khqTSkWc8U/67VI6/eVaUQyu9X2nV/93RJpK
         X45g==
X-Forwarded-Encrypted: i=1; AKwUvBz1ZgGzM3zb7q7ErhlutK2ga5H0eYqxcouLP7hADic3wi891+rbCDwio87UuMngBtTiaM3mG0JI6X88Kdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z899sgFQV4702sSHS92tBBiVONR/cPSD22p65bBzwHp7jPDIMLf
	dPv0ZzVDemCpo5kPMyz0Ru5qRlYoWn4Cobu8KvW0V85f1UlvkPy+irdO
X-Gm-Gg: AYBFou2XlJ6yO0ZnvKqq0R6Gcnt5Y8tD/H3iPYsAWeHExeuM1kRrTw8ypAk+wyaPten
	LsK6F5rEGWQIOh7yMSjjWnPUO8ZpDjcrPeQk/nO8SOQu17tlqbPwbUbL1lvmwXXseUOLYNO/l50
	pkKZQW+1dac27y88gQlFNQTEWuCl768nwap/V3xVxqi9D0FpAadPEFhUqokug4hKYEuFRq2uTUm
	1qWQZq3sbT/L1aVP6GE3HX9xiKf4O7Bk2r8vL9X3/9Bq8fRKYQcFYZ7Yavl9BDBnwJWI483erBI
	PYy+XkbCJ3R2wkp7EbNrvzi1EaueWaMlxKZd8MYqkG1UQvjVivJ7VNHQxMnsnrc0pZMAAcmVbVy
	t9m7fuTh66yqC+B+Ysw8Gk7zqykagNGWh71KtlMB9gHhSegkXU0pRRxH4XLqo+ykaNNpUyKrLof
	OgDli9+q+V6m8r4Q+HA/TBGDQsQo8aWEWM2aGKJyziLPu45KIBD9CLNrv8rX91P5++oo6+3778m
	uohIZn57qI1sfZygV61jPA2GpysOR7FF4k2Ta1P5tcN+Dwu1oWRhOC0HAAkTbRnDHr5S2AcYuI/
	W47icPoKegMhxHeP0pcqX6lS8WoGThMDtaAxqDiIYkSbrjeTZQ==
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr361875015e9.0.1793796072166;
        Wed, 04 Nov 2026 04:41:12 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:11 -0800 (PST)
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
Subject: [PATCH v2 2/7] ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:52 +0200
Message-ID: <20261104124057.240288-3-clamor95@gmail.com>
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

The Realtek ALC5632 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,alc5632.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
index fb05988ff7ea0..939b1fbf2afe6 100644
--- a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -28,6 +28,9 @@ description: |
 maintainers:
   - Leon Romanovsky <leon@leon.nu>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: realtek,alc5632
@@ -40,13 +43,16 @@ properties:
 
   gpio-controller: true
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#gpio-cells'
   - gpio-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

