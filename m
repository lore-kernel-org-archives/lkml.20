Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF96C42255C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161688; cv=none; b=qtZji97ZF2gp03GvYgiArKi1wdbxFlUaV8JxsrtGAw9//9QeNjCahebrLSu+fJNiL+hMDGikNXuZMCQ1ZVqFLfktSuTMrm3WjoD4R9q5z9i8oCFd+R4fBNJH0EwPbXRFb+T+9IFN+wZ3Fe2/BzkSaFHAk36Eqsy2TBgflJHEfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161688; c=relaxed/simple;
	bh=rQYMzDtVh44VYgzn8ZF81rVqoyDsHoJv3ovI5wxNPaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXuF2zbL3K/ZtBhjK570M/YzhXF7V0r+9zN3pVoBsfKNrXsNoV8m4Iil6yYC2JVveUf7V2bjbieclrbYbQ1TTXfpJsjzPDgmrGxWYYbNOUm0KoEaTazB8g6lMMmSdeC3h01e02rkXgxIfXozIV8zatXke1aOz/lTjRiOnsOHnIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULH+ggqs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULH+ggqs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1d665a5efso264025e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161685; x=1792766485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pte3u3WxOgw3Qgy52tQrveaoQhV4YTR7h3cZS1HtB1I=;
        b=ULH+ggqsHjUAOiZdLsxQxRGfbE7CedKqmY0pprZ9bw+KNwL/ajYt3B1CiGPSvzlE80
         vvXIIh7Rlo+lowlX+oFWptW6aGwiMEDJ9pQLNplMqCF2vsEW+9WRjAWHSRSldB+OuWqF
         /CsfJVzUUlTLRdmUzPNl8j2+N8PfQWj+fzu3Yk6m5/Zt9QuWRZzEzmcYUfhBEbEc6qqR
         jhet7+jBjwQZi+X3jAk78ikLIroOL33chgIFHqXJ6XCG+Dl05UowFKiWxrDtOCus/xw6
         2ivxDfS7AJx+zrp4iwhoRXgLxn3BUMgwUcwBnLTTTXEsIWpGY/JZafApO5oj/h8N06u9
         xNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161685; x=1792766485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pte3u3WxOgw3Qgy52tQrveaoQhV4YTR7h3cZS1HtB1I=;
        b=NE3s3DWm72zAVg0KODY5r5t3oz7qsIWR06ymPQrVTS1KJth1g0alx7Po6J9yjRLTdr
         ci60YGlGdNbSBPfaCRz+mrlsU7tVxUl+hyyelHzMjOSrxeHePsutTZxCKBoZwSIDjXSC
         EqOJ2RxB9DpDXd1+VvfNbKICW8mVH2gRoQrsYTOpYXQ/dmlJtdK3c0uHqo76ULQnsduE
         yUrKm0H5Gf56mvMq8UCwCLF02SdaKW3bSR94BHJlFh3BJLXERosM6Dtpq0P+fIn2FqDJ
         DlZiK9srxzVcv4M+FIoYsK0ilXtTg4Aj6oA/3kfwC1yWiBcjUTDmyfOx1pjNA1MSbn5F
         vdyA==
X-Forwarded-Encrypted: i=1; AKwUvBzXNVqR4ZWGqz1z370VuCHoHMZ+qXAzuOZ13wvmFrMuJbQ+tY/pNmJJnJElVQTO2tzdp4AXUPzw0ix3LoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq+kjkN6LK+15YbidXdCo/9Z04QF7BEnGj6qHT/bic1GnBJ+5v
	ayTAK7OQw1JQjlbtXFe6NYM5FyChiOeyHiX4LZzTCUlSp6kBAb2B7yQLjyllMZpW1So=
X-Gm-Gg: AYBFou1TaWXYwAo/1qOllk7krcPou289ezXbyPBzbilcOMGd0jGWwySNgLwpJDSgNMO
	VX4ADDqcwbKB2yelpFORcHMoZ8WVthA7q2o5YgGvbgRwsaPPstw4UtzwQrUWk1pCbcboc+p2Rim
	p8r52EMkndDPGlmROsPrnUrxYpwY4ViirwYv7wrZneiYysXKfMIhuyEKNsc7wrUN1gtRrtq8Kfr
	feNUy3sXJi4DBcOp96KhLZ+MyEa0rUxicgRSmGlc9F5jjeh+VM+q0bAZNA5zzNmR4fm6vixLKRf
	2wHiXyflapl11Rv7I1c6uGOyu4pwFUgWBHJZHInmQeYDpBSN/+alM3RwaNDS8ipqYVt+N9vTK62
	cSRmFf1XaAzE8HTFzbxGSCXB217zu1j4yfiJFLbGefXxXihUpu9lxfGyg8yV4LwC7K3l7vaIXTE
	qxTsfFQ5lCrM9wCmS2azI2m1CTMzZS2LtiBo62Fy5B6AoJ9u9tG9HRk/487A2/f3+HKTdEjezD+
	r5518bP6++q7GNnXxufvAzR/8s/WAoDOgS9595iR8ODcqM3bkkrlkodFuOCOWF4Pk7CDQ==
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr381415e9.11.1792161685121;
        Fri, 16 Oct 2026 07:41:25 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:24 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:18 +0200
Subject: [PATCH 03/10] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-3-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=991;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=rQYMzDtVh44VYgzn8ZF81rVqoyDsHoJv3ovI5wxNPaA=;
 b=3S50pMz7zQmvtFmL+2YZ1KgPdiCvRypjaxgUOOH+3aWGkFuLX2ipy1EzPmzd3M2yImYr6voQo
 syqhbr54WckBewNboAWAqmAJKY/GJNXAurDQYOCbAHJZBNcilzj5MjP
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
identical to OMAP2/3. They are actually inverted between Pullup/down
enabled and disabled (third bit in pinctrl registers). Using dedicated
DM816x pinctrl header to differentiate between the SoC families.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index ee0090f7aa64..de4d48babf77 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -3,7 +3,7 @@
 #include <dt-bindings/bus/ti-sysc.h>
 #include <dt-bindings/clock/dm816.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/omap.h>
+#include <dt-bindings/pinctrl/dm816x.h>
 
 / {
 	compatible = "ti,dm816";

-- 
2.56.0

