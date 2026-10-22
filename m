Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648336;
	b=tcj+FidbsKaraVjiJdm7FoxUSWSgot5ukc1rEg2POasT/tqNebZ/9fTO/Nog6kNzb6oa
	 8/BA9Wx/p3+JyrB8uEcMbf8VgtpaE5oCsNSxe3rkESEhu+C6dTEYcWVsSs1qz0qCsYMe5
	 GYueAd2auLbbM5Bk81RtikpaCzad3DvQFpEIn21KXWsq+Z+aN1r1n36lraALDCzMuLEKY
	 /Eaetpn46iOa55fs7e0Qw1OUmgbChiMoBi6PZ31NlV8x5O3Y8ElvsfxAYACFOZkSphAU9
	 uK9gE/GcvFKKOBLQ5T5YvM7DEbtSViG8NewwqdJke+ROEWdkKgzOqcmnwWVEErHb/3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
	b=QRP4S7+3GBMiEPlN5YtBUqaaviPbewLuNsZa4e+B/UIzSJ1ypX57s1KKBlg8BT8tsQ0f
	 pFafCXDg6SPt6tm8UxNPpiF7uMbirFu/jDOThEeR7MHmZL1tLS1ZRl5/xt90YWaT6FVa6
	 trB5vETZyeyFIn4oD+FC2CpNeLwT0DnHv4YVyB+ra7t0EL+rtnjdnKW8NM/8lMuptioIN
	 aoWpEBtygJDqZFlhtf2KQBTY98U608ZZCIhHE5gF7HqcdljkGXpVj4VHeHoDPrROq/mmf
	 6GYbvsydr+iRgFJG9IjsEbaUYcn4XtEEgvbpF2WCIBTE2boDRkO5c9ZEOswJ4HRM07A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McxzsOeT;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B45606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B45606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McxzsOeT
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso1542085e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648334; x=1793253134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=McxzsOeT3cRyR+H5WlkOR7UuGaGOBUj789iuYYSuvRyZzLlSdZ0le6nFZawvb9e8Tb
         RiqIy1kp/CaQrJvB2P625l8OvYF5b5GRfDyHRJjahSiPONQO2mmh3SY/FDDxX67/cgHw
         KPmjZM2OAngJsLs9zzOddztXf/fE9L1bruF4j4Z0FVX4q0b+481YBG1c+qimh2dvtC3M
         vbOmXia9B0ku91ru6TCdb7LKd5iYpVSYQz2bJMecUiSd22rzi9hq51m9ndtR42VYFJPR
         r+DNnDZM1L5mEEBRuahLHzyWkEoqyu7aU91kbum8/JsVwXg9W7VWCaL4jKuAUhhlyFiw
         7LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648334; x=1793253134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=nYSjFDpDNUkphtQsvIVoNTWdbxxLzfpsknR8CF7vhdhtGJT8CpVEgZh2b3EWVD8kic
         /O2vXQtOPiluhUMaxXCgBvdjgaCjY1O9vy7KfFHpgn4G0qp9HXJL54FW3Bwyy+vmBRgG
         rhU/qb8Q/ysu0rodoVkzIBy5+Ih/8jXL1o+IKEFNDuU6asj4b9t7nT9+LYI/GAs3hVZn
         3Af88615b+DlDiYmLs90cOO35yN4EwXPI3ITgureh1TA1fK+rkbnGOixXnAdxcHq/lps
         KXNNteXXowDWBtRgzFKOjnLSONWwRDq+b4iTCMAzhTVi7J5ce57gUAgBXSVgYz4Owooo
         YL+w==
X-Forwarded-Encrypted: i=1; AKwUvBxl+kzXOiwMHUcelJp9jiXqMgyHNqHj2BEaKKjUkgxzixZIjfUOg2bEIPLr+nJ81VnC5toePhdYESNTOGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0gffaebQW0SkBACshQV3NroNAqTyUMppehbrVebU2l58PfSSY
	+nMPFKFEpOjaLBKk3O8zwpOF9f3qJ3ZMCVTCnNs94AgNgLmvehmOBnwS
X-Gm-Gg: AYBFou3DNsKF7GwBAemdCrgN39WaXgII3wrWSnmvKWK4rnJhajMPpeGglkjwTTR1L7L
	/u5vC0K6VluRZThZNNQyTM5jtv+qwu7Buy1ENYW0cp4e7yXEBxTbLdlVXc+qq6qbs45pz2guDoU
	NLypMxiDeHWUU3zrtGvUdO2rLnL/E5ffvVY+FK+BvwawLKeqeB3S1zlVMLv9qARWU7vPVJuxAAO
	3gTQeDH++3ihe0Py+S9y0xc5zciTXLlVaZR5g4iQGoNe8Pkeb3Lak/Pi6B6E2xuQn9rXrVjd1UU
	sZZoUdmHbEyPWGS3j6xSIsSVber8eYthQjuOQuB19eEbTleKZyINlieHNLSRj10OcDopdMLykuV
	qBiq+zatIa6fqVMGDOMdoZOP+GaKCw3pjYuob4Rm/D12kTy0Wf/KrhEYiFStLQ5tGnIFIm4ezLB
	+0O6I4wn1MxFYq+KgcG6WT0dyEi0zwJ/yd+6jqX3gjQ79076rUVxxRP6r+DJF83Xo9nmDMBStR1
	ab91P9ldoVs6eMG8dkL3GHG8Ic2KXdI9NJbq45+nQXsMH4e4fmZcZ2IcNW0pLOzlDk5T7wmbQ4O
	O+XE8dlruif65oQa1Vdt3+CFV47NI7oHGTi+MX2DDILH1t+LDg9VmKYnMp5xC28VXlthvZpeoY2
	h9sgQj5AjsguQzQakU7G6LeJ0C63B169ELtEod4Y3e79xKErVpfWigKm0Zws/Yb07Uedu/9W0EQ
	JCEMfKi4zRqq6bGhyzU2dNtMcPyw==
X-Received: by 2002:a05:600c:1f95:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1fdd19dddmr91581465e9.30.1792648334182;
        Wed, 21 Oct 2026 22:52:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:13 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:07 +0200
Message-ID: <20261022055208.17746-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
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

