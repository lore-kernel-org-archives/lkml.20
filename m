Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203588;
	b=WdfacKxkfD/PeTZgkaeUvkCBIk/0UiYlgKQLx3ziSlWD1xR8s5I2nz2vG+dL/7sKRXNX
	 65D2W70MHcw8IDWlZAAvKS7OneJnlW1nFJux0YE/+a8Axgf4mwC3hAk68QnjOipUh3Twl
	 16AS9pVcIgSo4x+W9xW7WMVw9pYo+wL/p/OwTQ7ljQyjokeLPBfhKTYsz4KZ1NDCvDlLM
	 owfqpi/+HgNHM9glm69jmA9CLWGNkOE7RWC17k/kzXj528h8KVOwE0MqTGbhFCkztN9kI
	 2FkzNtJjZZ5QiDOK/oyU0GBWUrpJWRc1yVZv6n7P6ABA70ChI3+RRU7Sx6PHmRkeALQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4A7a+lLbAYsA78ZT0ERLpUjSwA13WWgnKlHJO2aUu+k=;
	b=drdSi3xVo9xxbSjYrpWqiqV15cShRnoXaxiKSATXSck8OT2WIjMuUF14GekgYg9nv2p+
	 3uzaY3ZBqzZ/1uQoMXzQCeHHZlzIE1l57Ly9KtKGMV8a9Hb1RqEtbv2ZNssCJ4+ApK8VH
	 Xnq9WbzoMSVjxVhGWYcIPAJ4whR3eGKDQ5iVRDk36QyOl/97rcqHEZZP4QxsmZpMk/xG0
	 9iznu1yNAsJiXxwoPNoBlx92DYhra0V6ae0Ymn81zS/t6oDm0c8hQ1JjdB6I4AfLE5hpO
	 Rr1sD4x5Z9wg+NHA0xp7K5OSGTyn3DD0baKlr7YgzB9Kk749PBhuc03QOFICaRxN8/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="f54qcOC/";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F90606B249
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F90606B249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f54qcOC/
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12921085e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203586; x=1793808386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A7a+lLbAYsA78ZT0ERLpUjSwA13WWgnKlHJO2aUu+k=;
        b=f54qcOC/BNNPwNgviROshFOqzIxuWEsty56PgH1QsUy0urArJbS6m8tOujoIIck2uh
         HEKjYJgDS6gAZxhF3RcCvii0/r5qk6ySKJv1OO643paYjrBMTkgd8Iji+CLMgS+nayN+
         tbfotU49LGIWkEUPN8cqkpw0fz21tXTSfmBI2e22W2Vl8ew2kBxo68GuXPQ5SMAVQ2Mq
         Tg51IU7bIFnZdCOXB4UApuCX7LUY/KW3TIg9Yi0EQWnOozXKcih+sWbH1QMd2mXtx1xl
         Oc7Zqo3fDYQPPSMi74tFDN0QxoM3CuiwH3OCbijQB3qwSJoLhBi/R7VhhmkxB3yxvG9W
         xHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203586; x=1793808386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4A7a+lLbAYsA78ZT0ERLpUjSwA13WWgnKlHJO2aUu+k=;
        b=x2kzmhsTeDVXkVAczJihIccNkRhJ2KNq2XKBg1F+AM3zyAm0Sieq7pQR00v1Mq3BpP
         1GDMxKR/eBa49PsokHOMQz4zT+S9SpM/xP96C/H+/3c8JO/IEIyrkGix2XhssW/qKC9x
         oI1ASSqJxWhHZ+aSnjkBLmHZ7KF5qtYIvO5hbHViZ3kIDfklsC4psjEBDxsR4OUmgU/1
         t52cEG10SVlx2RpBfK/NLw6/y82mWB2VXV4vqlh7yC/yWDLQ9vojcE7xDp8I74VeUhTe
         uiErG2u8UtBqAX3+bQyoxkuTYFewGEPFrcFIrsMMEjsP2r017MXjuL+1qsMBownTMJMe
         9HGA==
X-Forwarded-Encrypted: i=1; AKwUvBx7GdA38qh8E2b9dSlJ3Dhvk1wLLs2W3RT5Xmt17XO/5AMb0ZFuKn+3pIL2XMzNxEPPDIDYd1haVDaMJNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3ku7abcbnz5x9g7lMsau5FtlVWRLEf+beCdX4l9JLRwMlqB1P
	6CPBLM6tkoGCzOMa/FaTrzReKr/p+2HXzJ8yJbCPrCfCUkrlVy0aM9aisR6H0ixAT/8=
X-Gm-Gg: AYBFou3ap1ku7PEaMcvZWlODyaOJzCoa5npcwAjXAWQNxc6xp4sPOeJeqNLEzFzcySo
	/b/Yzi46oIPI12pwCFIp/PCZU3k9b+eDWNw8hIC4mxN5alUWnwuXVvNcdqg9MviLP4gVcoZIjxB
	NMpYREBv2gPVK0+10UosT9PJSflBIueyIvsH9yVxNGfB7Dglmt2LLae3RL7KDaJ5bKDwCxYThm9
	z2dHb2eOzhuf30Rstqe75xDhUOUa34xLUEvMawiCK8pT1dqX3kg7hY2ItIVGG0/wcFLWhpQdQgX
	12Mkd/b6AaTgbZZAVqkFSEQGddXsE9Q+XW+ipmN9WDcIgI7cz0P2qgPyJbeO37zqnltGhEhV4uV
	nq26Im8SxPBqFFUV5KatmI76pUqhn81PrxWBogm9Vmrl7p56SHVwIPKH95HGekTTwxHa7SR+JN9
	t9gnUXfVLAMByIf1D1zJYOCENVVguBZ+GmD25UUhS1ceeSshQY1YWeOmrHZOh596XTnD1KCGuMu
	unf3Pjzm90/TlQs1fyY3mYuF5ovLznS7Q8cuG4HLy2l7P145xlh847X6PBkxjm/4LGMvBgQvVIK
	pvVEZYzZr2bSypr9Nib9HWdNOQ0vnbw8OAc0Q+n/tgycw6Zx3AZssgW04G/RouaLIcvx4rQvvP4
	393A0SytxNOsdeLQH38kZjQB4Xg==
X-Received: by 2002:a05:600c:4f89:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a966c4110fmr63881135e9.16.1793203586322;
        Wed, 28 Oct 2026 09:06:26 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:25 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:03 +0100
Subject: [PATCH v2 2/9] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-2-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1104;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=h6W1WAoyAkjjjopOOo1a7vzZ6TBDQswOUA1Q/6FeKLI=;
 b=gvU6qdCGfmNuZ9+vLONQblCUNyQ/FTfMv29wXGHB3AHN77+6/hhoHgJy+LfWIKEOD86B1AR7Z
 Hk2Azj1uAdRCsEawkL0a93nWsHJgLJT0KXiPrySo2NVpfiA6SqFhUl5
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
identical to OMAP2/3. They are actually inverted between Pullup/down
enabled and disabled (third bit in pinctrl registers). Using dedicated
DM816x pinctrl header to differentiate between the SoC families.
This changes the effective pull configuration of the dm8168-evm NAND
pins. Tested on DM8168-EVM with no functional impact.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index ee0090f7aa64..261ebca8863d 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -3,7 +3,7 @@
 #include <dt-bindings/bus/ti-sysc.h>
 #include <dt-bindings/clock/dm816.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/omap.h>
+#include "dm816x-pinctrl.h"
 
 / {
 	compatible = "ti,dm816";

-- 
2.56.0

