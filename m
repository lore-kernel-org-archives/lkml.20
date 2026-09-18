Received: from mail-wr2-f15.google.com (mail-wr2-f15.google.com [74.125.225.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B252F547046
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723147; cv=none; b=ohAHlkO5MDXXr6t96ci71g8IbsNLDN2lg20nIXvnYrmddSTK8riygbYls05QP97Ai2XGY1fqoxvWj8xCz+cPMTZONz5PKQQHMrsHsQPTzDQL6iqLxapB5lCcZInMRbKQHk8a+semTO4flwPKd7gYcuXv4Pptdg3wKiXA6LWdIiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723147; c=relaxed/simple;
	bh=Bsy+D3QFn9R/hEGe07cbw74wD1PaG/3jyKHfoc+/Dhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5fhOBTe/3VtrnjWXwkGNP0sOS6OubuZoaJ7AirfNi53vmeRS/i+OUEiJtUnGXvyPuj6ooz/OucIHXSghHJy9fyU7YzvVCcd2BR0wirriv6pOfrJnI1HkWtlZCWUIcShUzB8rrA+L3n76HuQHyzkh/4mdmDvfQVfS17TeKAXyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GCakg5v5; arc=none smtp.client-ip=74.125.225.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GCakg5v5"
Received: by mail-wr2-f15.google.com with SMTP id ffacd0b85a97d-482f633ecdeso439833f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723143; x=1790327943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=;
        b=GCakg5v5dyxIRwqfSAvX1GAHY5bgTa2MKNKOnW/izTawR/ANGFgEB+eSWxcYgcu1TD
         z1MkqRm1r9UY+z4Izzr8AdZNqKjyGIkB150Eph0ypLf8HxxkyBM2sO+f11duyPB3yom7
         81PekfoNUIquSps6adu2NMmVbCVDwyMMlwI9EwWPmJfV0N8kwlTk3EwiEv7AGWTTisuP
         uKHsPDTJsdXqWG1wnMY4K7yAdTbaFfcnSWhGjqJ6JRy2kcfe2tHSyw0lhtqp2kXCyL3l
         mG9cCBLtkfh/sSOpLFfw03YKrqWsWshFS0VqwG4GurEEuchBoFV60JqrPVUbPQaGIr1w
         7gQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723143; x=1790327943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=;
        b=KkKtlwEikjrx1w5r8kICl9cV44Otf9cS1REJK1bHP6gF9zJTeSRWRdTdF0nEuh6JJW
         c2O50/riAt/gMnH7gqGd3kBz3sscCkcoWd+E3lKxDD04JDlV9862jD7nepoxjl8cp8DQ
         wRW1IlcL+JwH8Bn+1AkqpN6ey8JWFkTabSZYXdX+33p1jXMFZG8MLk6tN/b2vwZJl+YA
         mSa0BADT4Q6VJ8MZKFekSsqaSRPA//v9kYC3RZhY6cTf8y/jNepa1Yv0LVk6qQWNvCP9
         tRlVIJlj5Sr8N6cdXBjhK/kWe6E37/2TMCl2nCL+vVCkcUmL3nRFCCIn+XIs6BzviClh
         +zRA==
X-Forwarded-Encrypted: i=1; AKwUvBw9S13rlu8Kqi+FhKr2+bWWey3XNRUjI5p9DghYNxSlprOyjMyCedk4pk85JQUoKTWvkvxw5a1ceM+3e/M=@vger.kernel.org
X-Gm-Message-State: AFuF++l6jks5B/9bbX1lE9KEjkm1nkhh4D8Edgn0WB/A2bK/BQp99n1s
	gD4Xbt7PNG6y9FcKO88ucnSEXIxKPyguZkJbkDd7xhOLiFcXi6cF8kZtdpb4meTksFk=
X-Gm-Gg: AYBFou2GNjiOD6OoMFFBJXdhr7RRYqlsakaw5ywNuW2nMuf8EFVNuwZO6hrOdB+xS5J
	OVcmo0BSlblet8MYefWvJMj8G0T7e+5VbCFVONPaeMEz7tMiJo4+RsdOa++ykfk4fGzZfVVElXW
	ELQt/jNzQ0CGQnrtH9JPNv0ZbY/S6nmUxIquESfHKgyWu9LSoWVHckNl8wiTNX+e+4Bhc5ve2xN
	oZM7rD3ZfSvg7XapKWgWCtDi7wdBfCaUBo9z/xi4rqp9PUH/mbJTmJeuTH6lG4Obf56KJDVbyZe
	OP/VjY14OSAz/KjhMxMmDKym0K8zsZq+n5yTZPMG7XUGEntglixG78/+q5otbStgOmphGXmKR41
	A1SZwWwRDt1XYsbrCck2nJdal2YG4gispn8aziuOJG0HEYjvU4olOroYz4SU59KxGfM1RxadLDZ
	31vABh9ox1uIMp/S0pqN0WcDI2W6T5RM4kc5WXMr3NUz2UakzIUw+H6jlqqHuAuI4ccyijT6rZ9
	yifvQ==
X-Received: by 2002:a05:6000:41cd:b0:487:62d:37d1 with SMTP id ffacd0b85a97d-4871e2664b7mr2229141f8f.29.1789723142835;
        Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200737d6sm2803599f8f.24.2026.09.18.02.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:47 +0200
Subject: [PATCH v9 3/9] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-3-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Bsy+D3QFn9R/hEGe07cbw74wD1PaG/3jyKHfoc+/Dhk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jGde7z50ZbrNtpLSXMfzj92kE7sTYy6czFqz5F0Q9
 /ayiNrejlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIdxrDX4mVN+9HCl4p37CT
 1cdwS5rU+s87Ff+FpVeF/RbY/yytr4vhf+rj/+992Q45/wq+sjk440BG4z0D17dT+J7u9kyc4v5
 LmAkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8f..6e5419de8e35 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0

