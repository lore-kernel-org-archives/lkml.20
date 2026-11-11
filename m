Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421207;
	b=cFrrsvgCBC6IpdBxRSIDvCc6pqxgKwA8vQj5UqUO9oFkKygrrAy68WoTisPMklzcn641
	 YEbtYBnQcHSrkxcWn50XTWZMKP1fHawYL5bkYK464nAaGpaRsdTywtf+M30sOmE3Djfem
	 ftcDDeUHu7v05ReY+ERD/KZf0tqxgEz7Ebx7Z92oENK/b2aMsdvds0LvQZVAjN3EjzimI
	 BY7RSnBNXNldt1P8R/ufb6KzDa34TO8T729TwWdG50hv38j0yh/HVw0b+/rFXxPEmfMJJ
	 W7/cYHrBTlShAVuwAwRwL05zlBnEFRLcoH2P7D1V2m3c8RHOxKwr14se0Mgw0eak3uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
	b=y/P6hys8j8o6BCPe+5mcM1FWEGQMd03al0DUOT/Fj02TjiQnuVtjgXRiULM3M+4tgrF+
	 ozPVUIIJ57nXFefgzuUfEndTp/vSSs/lXN2xVAuh5k9c0j5gpFhBogao+aj7s/zQr1Ntk
	 Fu130iuY1X4HIpQLY+NqO3ojit8epz7jttzstSsm10p/xUvRVORAzF7xg5+BkjuNWVyka
	 YDP90RUOacRJm1HLx52KJ7HaBpgEUozrxbL6nNBlyuHKB9viAqIsB/2Z8VuO68hgH/uUV
	 p/KIh3iBnt3JzXhxHLxDBt12FR6O2vfU29calrIB/Tn3MiT/yGVo+w4sSxjYnblv5fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzMKYYRr;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0C60A2638
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA0C60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzMKYYRr
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-8458555b6a8so1059223a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421206; x=1795026006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
        b=WzMKYYRrGhT/EBsBFBcb6NtnVDnaS748TMKSSJA94VXfztPQc2BmZtOcbeBhyprQQb
         kON8odM+suVjRNAv6Llg9LiazgY1TlKiIMUFvicTTkbelurwDvomz0d7dYBYbKxafUoQ
         vYqBH4YxHGNjBVI1cmZqqpPlVNLNKZIbAhsn0EpmvseAPgsy2szhHx76Pa96Q3mwvyu1
         LBkfZxnPRKkt/mzNhrADJMG2SCydTzlAH4vZujpL9TYYdZUs8kfhZNkYgMbCIYuamt5M
         O5100Im4gNJSjmyOPLhWBOz/3PidrweiQW5/5P0Hu+nhyEIOaW88DwubJI9xeVKUyJ2A
         wm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421206; x=1795026006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ifZvoltqEgqn3t7aXg0tAmsOAN1/Z3pCD2DytrLj48=;
        b=FT3qEsq5BGSn+ftxOV07/LzjJUvDNB7BvE3WYDYa0UdyhZMP5tSO3OjGFaT4w2SDOz
         nkL4DA1YrPF0wuMQ0ZaeBuaxhM3NqD7NiM2ryxjoF0ya9lsUtl/M+42Fymcg/oeCHWNb
         BrXK1AU4xocy83VZmnw/Hsg6bNQMztUXBYc/4TYevwR9Opx861JfCBJ8yfs5sGdR128c
         DGf4/qpVwiSjQ6gWAAKrImiIDQaHeZJBOgBSPHIG0QRN9QFVRNEw6AtIph3QL0aVp4W0
         ohnUyawLSy9+/uhrSs3MqKEAcdKe8WaJUF0kA/x5xqWo7Ee4mSNxu9ver/3FPpW6jwaC
         HlDQ==
X-Forwarded-Encrypted: i=1; AL+hErGSYk6C5JmE9ziPDAwdgBOL0d9DLpn4P+mGlkATqypk+LfUHQ6Zr2BgExiMfFZlyYU2+g9ty9V7kQxabKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mXyL3IRgB8jHJbVzI45ilu19OvE+vweMdL3MxkRZApxxZEuEc
	Vrt/1nn1k3f92z8AQCGS60ulObArrkiQFyV+K/kADXhuMgl7p3rOV/gi
X-Gm-Gg: AYBFou34V77nKI/OI0Kc+5vtplKSEoeTgZNGCXB0IiWsZZjtlO4qBOw7OWmuPDF+7YY
	6tuSwaxGtXoxHQkg66axuCpbvzfgKZWNfZS6ysfMZ9Eiw7BIP63u19cqozzY6o/BXY/xCt7tnrG
	d6HQF8+3JcxW7uAcr5IzduRGWKFx/JABNFQiRcxlPyWGgLBTRheiyK+chHUUA2HsG189NH2ri9G
	y5SGTwcVWMj+YD8yPTQUB4YEf/N4gQBiH5rf4Em72cQHknFpM+pcsE5H5KglpSuk4kTGUApzZiI
	RT/SqUgn76FdM02FKAiAv0/pL5Yu25FvWm2PGDbKR3+TlBgegV/HAvsqeca4e9icPEGALnfC3Ol
	Jmuy4Z/YWAODwkG1EvICfV82lZbXospjrjj9BWFaW/mL/L5eLObMdlNvlOjzdhtNg6zSvdQMZXb
	J4il55ww34uHWjqlUeFkmOqIw0+zVeEQmKpapWlHNL0/z5nJR+d5Sfvt0hjG5o7sQLsf/GjY3QE
	DUbOcRUmCtg4JtEDw2sCeCguJoaRN/nETl/Phd3dFIp8+8RdQiYJ/JLY7YSK1x6NJEs3SH3f7TL
	4Vd5UmysXEwEuRrSk6V+q2YG5CVEEVtg1+VSYvJjYwusJ2mMwtJ2RXhaEGiztTH4MD/AJt0pM+S
	w/5NJpEhUO1nLI2M13jg=
X-Received: by 2002:a05:6830:410b:b0:822:527e:f653 with SMTP id 46e09a7af769-860f2873418mr3497542a34.13.1794421206253;
        Wed, 11 Nov 2026 10:20:06 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:05 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:54 -0600
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8173-amazon-suez: Add the PMIC
 AUXADC
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
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-5-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1624;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=HdWvFN0Bi8Q0rbvoIQxbOy8Qqy9TBXeblCz/hYCaNOc=;
 b=UvFfe+0GNgf41aG/dgO1cAx/OHNQZPN8YTQnRZRWrp3VGqS+hjyqshurUxvY6rTsopRdJ36hE
 4HIPzTzo7G3Bhra+u2cvMi769b+xIiRwgt/1s3ljGRKqqhzOF5zEQTN
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Describe the MT6397's AUXADC and the battery pack's thermistor on it.
The SoC's AUXADC only has the board thermistors, and the charger has no
ADC, so this is the only way to measure the battery.

The thermistor is a 47 kOhm NTC behind a 24 kOhm pull-up to 1.2 V.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The thermistor numbers were referenced from the vendor kernel.
---
 arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
index 7dc0d818a44d..07a1ba7539a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/adc/mediatek,mt6397-auxadc.h>
 #include <dt-bindings/input/input.h>
 #include "mt8173.dtsi"
 
@@ -87,6 +88,15 @@ thermistor-2 {
 		pullup-ohm = <39000>;
 		pulldown-ohm = <0>;
 	};
+
+	/* The battery pack's thermistor */
+	thermistor-battery {
+		compatible = "murata,ncp15wb473";
+		io-channels = <&pmic_auxadc MT6397_AUXADC_BAT_TEMP>;
+		pullup-uv = <1200000>;
+		pullup-ohm = <24000>;
+		pulldown-ohm = <0>;
+	};
 };
 
 &cpu0 {
@@ -471,6 +481,11 @@ mt6397clk: clocks {
 			#clock-cells = <1>;
 		};
 
+		pmic_auxadc: adc {
+			compatible = "mediatek,mt6397-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6397pin: pinctrl {
 			compatible = "mediatek,mt6397-pinctrl";
 			gpio-controller;

-- 
2.56.0

