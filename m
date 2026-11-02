Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649213;
	b=oc5jdzEWrlBsi53+IG3Zg3x95k7uPQfxy8wk3L6O4MZbHcfVW4A0a5jyU/U6U1JO7Quq
	 M+08Wpv+JfIQeuavAS8kBCc97Q8kiyXV38JwE7FHs3Akz3IH6oQ/ZVNnOEfVxG6bGCP3s
	 xhOwrQHPD3ButIHG63219zsWi3mcFfgv6KY0x57v58S6jrWDDsZ1VWmx9T6KY1g+S3Zml
	 DMjMGcs/WkvMww1hfWZ4jrXZnkR3/prC4YZ+YwRb+RNSfB0EeOyYe8nUkVfiBs6d7l77m
	 txHo4NOX7amUNGWMwmok5eVB/QO0kW0tk4tLAf/KjJpxGRhhR7Vzv+0xvl3leoLTdTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7f/afSnO15hayW9629dG+dsshQNBLmVWgINs1QselwE=;
	b=oZrciJq8D+ffZelRnJfYVwAzqjAaM4bLo06BkNYiJijHKhUMW3syT4sB5HjhG1xaPP9u
	 +IFOb09DyQXMBOJNV9/T2iGqVo/2StNpWzTJ/IRoGwLbiDl6nqSfONtGMMk51wq1f8AAv
	 Y4h6A0pZLoORvJDnzKgGLr+1hTsMw+X/4BbE9DAOMPS1GUuk3LACTHLtfPfX8AxKfO2nf
	 p0Kn+EO8Z8rgDsoq5dn/D671wjkmUZgGkf1Imp377jh9YcG6H25tcFEAwtvyHPx8X72i0
	 HdJldbMfA8ZfHVmOUNddS4akEyZzdwGiXbuDdf0XsTxjc5zh/MF38gcfgeJ8upicvXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kbOaESfH;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43969606D809
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43969606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kbOaESfH
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2752272f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649211; x=1794254011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7f/afSnO15hayW9629dG+dsshQNBLmVWgINs1QselwE=;
        b=kbOaESfHOMY626Igcuy0ZYezGQ2G74bCe9kqAXY9wKdCr3mIrmueBNs1OENJzuaLbP
         otFje8FX/hRf50lXxXqgnb7mLox1fb7sbaxCNnCoTrDVjzBLHj8wLactklUaQy31pJMl
         t8iePGy05xOCA6tQyO2rULtyacL2INXG1A0NSJApQEY9immEPnG0ikEDg1Prfwn9ohch
         F0fcmfwdC2Cw3BOXK4SpOx28wawaY4/aQtx5OzMHi8W3BfkYQW8dAR5ENIjzOZ3m/ERO
         69DmUbrbz1Hf+EcJMNa8H4LQScoK3WzDdk/OnRXLVMt6LlvOFRMwzAK3NnOxdVY4+zIW
         TkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649211; x=1794254011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7f/afSnO15hayW9629dG+dsshQNBLmVWgINs1QselwE=;
        b=M2phpVGjD5VWt3OwsmSNF+oqJYfkintPqTadNcF2NTJho/gXfZv2l+3sSj42Y2Ul4R
         MgiAxLlePbpBYecWqFqATdWrnfp3j/5GXrvtBXzNwTZPhNVT02fzc/X6d+pZ8Cl0Ms7K
         9BdBBZBepmjdTIwkdRuOmAyIPKVa10QwmJkFOEony0yVxfcm/dJX2OX1ZVftZYHxUmnH
         i0bFZFxzTrkiBKdac+G5H1mcVVHUHTWKsoLtf0og3HWnyq5CV/HY0P1pvYjrkR6SWnh/
         GTDbdfh121iSbOa9c07vxm0ympkTeSww6pIrt26I+O04bOkbzEAsXtgMqq7BhrUFPPIL
         inkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhevrKO1Wxk9hmE8NcBtA02JOA4Q9o6i00NIqANeuM6ZgfycUmA6i1++Yl7IAKfSX6jqakXIq4eh/Kui4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BIelp4NC6ID65kBrF5MTFHNAK9kPVymx08zwWm8RHfFdbAetB
	+p2QnUfl+DMxPJQw7ScCp3BnwZOywMMxAR50KyZ/eaoWJtL9g9Nf0lVOaXOTh4MtDzs=
X-Gm-Gg: AYBFou2p2csJMhzKRhODXD/kQQH5vKwYxoqd4M0xjGoZPCyCTNremP4iYXViCdYcjPQ
	XpgM6bGSMuo8YCKAWMo4ciS7pwlACEYYGA8hxUcJQ7O7Nc05cAP+OZG8kyprc0tjYtHEVZIejgr
	3xbRe7YcXX7k0MQ7B0z9zrsSclUFj2mB/xE+hbgj3/6wUkNfa+d9RoPpEGSY/fScaubGJkf/05g
	1+HJbOJN0XAslsNOCwVZO9BytMYMEXQJjXf4Yw2ZZGrgw9U3BSv0sHE485cXZ8NRt6A49aLv05Z
	v0UIOhqvjQBP8rV6CD6jrnK8EgP9Yew7PSxbGqJbJoRlUfII+qDnMsIh8aKpkqdb5eJpc7dSD8D
	KIXzZbZ1Hs50umRtWzZox2/o/5Y9G7WzCzEr5ldvSoDHRK0yEx5CP2eE/ujRwapQAAyGAfZby3y
	s3x4Ia0wvtUfNS0QLwvYPx38n2hmQro/Iuxn5sjX4nhk7fwSWjpAs2twGheJ5SgKQJRZfjfbE7+
	j5E/LxSqkh9f+OWw37/ZKk7j6sP+HU9WCMDIATknCq9Pyo2jS8IZJUw0oQqxMk/jwE1RPsGdyZX
	zP31cQTZmzhpv2C/S2rqZ/IUax36bKODWq0NF4lmcgXDRRYkxHBLifh8QRmY82Vc0prmngz9EfJ
	/CN1AT0PbKPsj0xYvJJdp2IL10g==
X-Received: by 2002:a05:6000:46da:b0:48e:73dd:855a with SMTP id ffacd0b85a97d-48e73dd874bmr15997035f8f.51.1793649211435;
        Mon, 02 Nov 2026 11:53:31 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:31 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:48 +0100
Subject: [PATCH v3 2/9] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-2-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1157;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=fKPEsKCzv++RFN5u2bDuWS6LSClWwdOaKJr//P58V+M=;
 b=I+VJBZFPeuOC6dZiMIx+ofqumWARXfAbmku+/vywjiPGFscrrRHCMe45QSz37TGQ3hlsrboa4
 2i9XJN5sOURCYIyX0iXcOUjIyRKAHdlikFVLmW3aM+mjlyewJ0/KKqT
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
identical to OMAP2/3. They are actually inverted between Pullup/down
enabled and disabled (third bit in pinctrl registers). Using dedicated
DM816x pinctrl header to differentiate between the SoC families.
This changes the effective pull configuration of the dm8168-evm NAND
pins. Tested on DM8168-EVM with no functional impact.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
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

