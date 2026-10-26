Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047319;
	b=G5JKNA9Z1tYkSnJ3yuITYvlIyWgmZeGdMo80cP4sHee4wPFKk1xy9W2aW9zBfXBe5mlw
	 FqNLDULWU3aifJIHfOo0j4OFNyii6iEQZwvLWNa10CYgqQtF+d22IGe9NHIxc6DkRBYZi
	 +8QNuJaTH1XDJ7IngVxzax/52tKIj3JKk0W0kvuTM7BwtyV19KEi2C8w6WU9qvVN8TuG5
	 Yeqz+9mk6DIHLBzGEGn1VYO8pmb3YyNQxnIQ0V2QzTnfBei2KU9Z9p9fLP/mHabQlXv3U
	 Sw2oqzWuqD0ih0BGSsJW6qWnfBXFY1rSZsJAW4+3eK26Pt2bRjGsuX1LpvF8qpvlwiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
	b=G7ObZ51FwRM6YIwALWY3H5tmftMttNIxMkI/nUtKg/1UXnolFyMmvRDN7cAWyfM20Xsx
	 alhoLSlAy6mU0QDsNgxjPY83emstazeaym78M38KYRAx81ZmHrTahGBtY1WpDSlDPrnEW
	 qb2UfKV1f+Yn4CkGlKBg8tb4xeGhHJMnI2kaSVLfaE0ltthIFgGrBb7AV2cJxENbi5zWC
	 YR/pmLdQG7bNSxbvYDCT6X9b43Vl5o8QsR0fSotepWDuikX0saBpgqVc/1XlwmQmODvVv
	 ZgSsexzj08Rrxy9RqRZXvTJ32yD03Mdn2xzYPrUdjZaaWSltplVXImAw7QGgSz6W87A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeGzgw3o;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F71606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F71606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UeGzgw3o
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2044369f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047317; x=1793652117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=UeGzgw3oKj1+ar5nKLRK1O/jDI0bzDmuGoNYiHwFimUmmwxSkxH7UMv0x4tfGyka8/
         aC8ne+vIpoijlMr6SfGjUEPf00hxtbGJ+hNl1HRmeRQpwMFCgvj36qQup19O0OkFldin
         roKQnHtDayITfy3yYbgQPMvf92RZ+rEKQFWf792wT6MJZkI2f9+QsaYeicYaH1EXNIGC
         1Q26GoO1AJt5n9itbQ87kgiYBv6XRFvl/vkagTs9U/WChlRHULgDCjcyx6injwhrXTox
         e5lXb3/4p3cYopGTfV9tQMUkGm/RpW5E3sd34nNgW0lMmhBz7REqzbDbz4Ou/+13FPKu
         EhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047317; x=1793652117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=uQIHxqQDEfNxKgHOsmsXov/YkJw8wU94jq0ku/dHLEKvjTb1tmY3wI+s8Gw8zPKxk6
         qnDrOJdnaFhJmtUwXS16ZJvt5XqwXpSb6yXvErIcbFwQKsd/pkKzEAwnJiwgclXJkul9
         OeSGDL0KL7Gonh+3ZNTMIYT+wLyvCsDlyn3tY5eSjpYSTqLb0I11B0HQm5wTT0IN05bc
         YX9X6Zu7IjsfnXY9hwAFlq/ktgVHbt8iYdwPt0syI8jXbFgbZkpCrcCFVFSsDKl1RRE4
         jz3TAz4dp72vO/Ng9pWjGcPFj42NdJvdCBHqNonaDWo2ni+2b6rBlvKod80OnGemWAOa
         lL+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8WRZSDSRhYXzQN+70ZPCgYE195+PCPHm9Tk2/Q3oX80WvvdrktNRKGVxj3/id65v/O+4RXLQOx1BcntU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJC4ZrcC0pBtRPQjrvI01ZKW0XyOaFIAiaBNLdjepoecCE0EcD
	OM5q3ncVeoCHoU0ebsoS+75MSvuwmkIyw2Bt8dZVr5Z3iMFYNOqITqd3
X-Gm-Gg: AYBFou06iEp8+ffnxauWI4o8v1WOCnyLYHhSE5dlirnvVRvMQfNBUXbIJkrTx8Xz2LR
	pVmBunOj8jyWRvFxGb/dorPpeBiwuD9x0URQepPFg1Mu2zr5j/fLF7RaL0lAE7P4WsaLjYmuRSs
	GgUH1ZbmrB6/hpn06uWtpe6tRgWrASnpU2VkSOaZY0LSk/pYFwwda/UqQ1YjeSrqlFwbOTltudA
	yorlmXeuR6g4scyzVKFXw5BC2ru2+UjdpgZjvsi0hE9s2EDrP44pWGGwz/j2HaTbkHta4CxXBpg
	eVCC11/HIJSQYIMZfq3dyxACns1Zj1wgzJFMZEtcJ77KJ8ssyaQ8qwq90ZFnRfVYU0/n6pTZSJn
	owoVMeKu+KM1zaIlLok7sCztYj9TPxZS4k+AH8i52O7u/KRXmfs0WtglRR1QyAZM0R9jsQmsdfO
	FNqzfwqMyBLae6ojOS4il6i7K9BzLMQ8ExcMv6pY4WmhoQg8Gwi5d+a8eH09UOxdjKvCeUbPgVJ
	EmdZk6G0B5DP2FL70fGSEINPd4dJ1wJuBd1dwSD56D8rUL8vQ9cYqufumVg+9/Dh3Hnp2C3f4X9
	avsiA7kVylEvHQIV2VX3aiGtf3kT9dtoZJWhn8vx4A28fgGXoeMmxHQH+CxIFrQK17+XoFQxXVi
	4sXN9X9hnthAVlagwvhFT5rV17dG7gtL2e/oZsaAqSqJTYtax7S7UiX66WOkemGNK1UApQOwTzY
	QIQyNE
X-Received: by 2002:a05:6000:41cd:b0:48e:d36:59 with SMTP id ffacd0b85a97d-48e3eba9916mr13011096f8f.57.1793047317271;
        Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:56 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:53 +0100
Message-ID: <20261026204154.26378-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
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

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)

