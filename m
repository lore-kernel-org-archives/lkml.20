Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803989;
	b=uN0qhDbLTTvqgp4n3tcP3E6KiIkyA0aKAvyBSxcE2zTyt7edchKyTftZG95F33iuEJoI
	 M8kv8zWssrtc/yCXN5DFVTrOiYIUbIlTzWOnvKqKzuz/XTbWqB8Op4eMz/Ys6ZCNWf+na
	 DMMxXWU7aNYb7+gmEDiwGdxI2Q+QdJ9ppZyS+lTNapYyC9zpjK+j1HBGo9iRaIyXsCNbG
	 tPn1/AUyynd5xqFfbc2zv+fLyi65j/COsHEAZjw2CBlPwiwxuR9c5yPbYiN7ZZzH1Y5Wf
	 6qULG7qPy98G1v7GONOvsG2U1KWAoiD5r7DdViVfh7SkUIBQ6Cnl4MIDug8mWu4wNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
	b=gBf7X9NZsdL+RcvsmEd06IgZ0E9OZhgpr79Y6YgX+yNC1oErZyXeopjL4K62ZV8J3C01
	 LZjWQCaF/mo/RlTyrt3aXHUQmJ/4C8p8UDmMcRUyZohSaL/IAoGWQiDN7IFLfmPM4flyt
	 o7s3gh4XFhb2mfk39GjniR/ivzYipEj9LkqNjqtgBpFEgwIN9QQs+wSGqjtJ462tf5ZKT
	 2BqroljDDKJ9tevS/Ghc7OQg38BQ9BvCgLj3Ke6BKwP/KJFIBVsGtRXh2riERJ1SSlqz6
	 voXMrepJ1h1qTVu0BVk0KHtLyogAnfQYINopTYUlgaMemOjmAHOt7Ei/T+uDLMum2yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Um7xfrUH;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5C8606D803
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE5C8606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Um7xfrUH
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67c00f291e1so62611d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803988; x=1794408788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
        b=Um7xfrUH5mSx1uN03lhpaZnDvaTL+GIA52skHnOwx4ydNDqEnzkgjzlcYf793dlE/R
         0n8UJBxYiO1eAdsmHGSQHtcJwG8jn4pHS7+30fynjMUcWFYVW7XVl24TCFPzz/GiB30Y
         v1B7na8MOxBSxgHM80CtPFQnbPfegDJhevh4OMT/JJootan/OPhR22Z/7+1YwP+sT7yv
         /T1d4H12caNosu16eHDKsV/hNPqdHF5GPTy5wkkMARnlCaHI9xlMAN42LktUPGzq0d+S
         uZ25OsXpwZFC7PlBugR/lVPznvw3RNmiZEMGXQLrvRNCJC/9wtU98NaWDmLJrN8VAU5Q
         JLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803988; x=1794408788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyfF4YBPoL5q5wee8LTCF2WwSqTvhH9a016gXbmqQ6k=;
        b=Kf+oCdgshthX24o3QdvJaVhCTfN1x2JzS0JE4CS2TMOClMAdanQu6dOhTOcRRJh1po
         +4bfaBj0LZQfLSgEeM4UFJgrzU2EkbRkNIJSNe/UKHBgs+N9J3rnysDl87v9D71nbEFh
         4oyj4RbA0wlw7nIZNAnu04qtbWS4aZxP8cpTO6u/1z2JDRHWBshmgTUZ58AQzYGtxD9o
         y/BeHDxCAALXHxKGSzikubxW7XtQWMbNup1DsXgGdnkXRSE+oi2xjwzK6j750TMd029N
         0SQ6zT5+hNomLT+oMEH9VHlCKDskAeILCvrgh86REMTU0pNry1Lf54OsRpvNRehWwy2U
         22yg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2RtYY4LwRmhAo8ODA3syTSVIsdOu0p5WKZWqE8UJZfL6X7xFmJ5iP4PkLKEd6JyLE6UsRCYeUf3En7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zOxJIcI15Q/p7nJcWdw8Pe3CkOreEXaL7XJR1yXp62pYLmWGK
	KW4B2KEYfEa5g/m8oSw0VZRWO/kmA79pLjfB+FeXaQ91NLUUS+QAVNtFvVFTaRlrofbaJqLp0aK
	Hkj4ucUA=
X-Gm-Gg: AYBFou1O2L8TX533eFqYcGqRNq144Uc2LtD+NpMJnj+4MnTYaLzGFKoy/ic2d5U+0pp
	uPPk5xFcqBLUP9wVOkCmS/cU/2f6kDqa67YRdBF4WlE5606Y/qdtQSPXAA+FugNxDLgICYkFpYX
	T9N0hJ5G1mFHTiR0cfBbnH9TMg/I0acfrPNb0GfdfLwmgduYayBYE3EN7mx2FB9xcnjsdj5k1le
	7faNmRXkZXHFxICVa+wjBytMBlkAz4T3HEUh944uN4LuVDf/SeXhZvxlCdob/t8IoBQNEpKt5lR
	t4aQwOvTDiQQFbf8eoYPNrpnshaoBMlPyylqKImpoLhw8ammBkXr4PRyMenANV5Am3hDMoBuBz+
	ewXkw7DX7DlIhYpFbr2icCTayld+tKT6JqEcm18noQRuLn1YD3XZ/2npsI917hpu8Zk0Q/onIqV
	W4pwu99wzxXthXRddwJthBHvshoNoa+I/0YaKpKcjrY8JQqgY73/LbUHbX0U5Vquni42o0flkpD
	Ucd7g7ZrTNJ/NoowN+wFbhDjPm87MYz8fKgK8vCQMkUEyBz3hdhC3K7iqvM6acA8x9/tHK2xlET
	6ClmZ9F/7egDSFgYmmDf+WBjkIpaufaLpg2uMWotHAxPe2MkcPqF1IpENBTiK7ICF7d3qA==
X-Received: by 2002:a05:690e:c6:b0:679:a898:7da2 with SMTP id 956f58d0204a3-67ba50e4d9dmr6951996d50.153.1793803987737;
        Wed, 04 Nov 2026 06:53:07 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:07 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 04 Nov 2026 11:52:33 -0300
Subject: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

The overlay only enables gmac0 and the MDIO mux, which are common to the
CV180x and SG200x SoCs, so it can be reused by other boards such as the
Milk-V Duo (CV1800B).

Rename it to cv18xx-eth.dtso.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/Makefile                                   | 4 ++--
 .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}     | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 49639cb0888b..440acd0aa55a 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
-sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
+sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb cv18xx-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
-dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
similarity index 66%
rename from arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
rename to arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
index cc93746d932c..cdb8db063977 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
- * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
+ * Enable ethernet on boards that use the internal ethernet PHY of the
+ * CV180x and SG200x SoCs.
  *
  * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
  */

-- 
2.53.0

