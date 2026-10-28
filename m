Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203589;
	b=tfiIo331AngYelRscpaEzSmgRs3XsIkH+HL09nEFv2joDeOJnlyWZT9ay+hQJl/uop2H
	 mAUTvrpkVuWehlV680nyQfpdV6GIbmU9Up4vURvW//Bs1icybhXcT6J2/iolVlUH2QzJv
	 1risKowZtN2M82wo7sYXdG9yVdBJJeNqozSeuKDTAGIzq61nFsEeyIPcORaN2MoB/sx6g
	 sW0D/pzXKHZwZrLPii8ykLfTghEU2WJvFEOtRgq+wnx3+EfbkXhYgrgeuFh1sMtAEWX7Z
	 oQTSPqNLlOWXqqq5Tm0rbjOfjUQxw1PiqVxj/3ksyR5UlYuCd0vz7W2yYVUVuQIPfYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7rFZDp5Fkk3pXBS1B4nPunTNFGpd1zfRgzV12OlUjhY=;
	b=5cHd/XbHbTpg7hewYBaPA9zPCk2W/zBr+IRyTMS25b4+EtcVyk0Gcqd8/Fih5s3SfYFX
	 AKvWmsLW/EiozXbuSiLZDV+m5O4yvTU5gE09+t77TfGwARroK4HVrQawKBJxGF1OsDCn+
	 1yfBT0j+bGj9RoXj8kQNSNCCzwHnkTWal+S1H584JmaWra43fdOdkdR0fnXrQEGSPTLjc
	 m5U2cQQ+UXQUVXZ7z/9wuLarQQZF9cIOre23R14LJrQuHkPLcTvzwLnZ6ajZqx2YbvEVK
	 eweGzKWSl5cfMVU7GmIyXbeaKNeS284OameCcm1i34HGtev2GcK7Wdvr8OXn4pvyQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LHY69A8z;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04980606B27C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04980606B27C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LHY69A8z
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso12064425e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203587; x=1793808387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rFZDp5Fkk3pXBS1B4nPunTNFGpd1zfRgzV12OlUjhY=;
        b=LHY69A8zem1uo86TLqWbdiIDHeomOMMuc1jlaBY5+fJbstzoHGUh7oLXUHKpkGViC5
         4oPwpRAKE8riDfYFeY/2kvk1pmf+AufiCWqnoIfEA0FpA9BasK/hHyAUXUtBFfpOWyHk
         VFzeRplRrXfDckkj9c2qUNAKIFGDDK2pJ0SZ3lezx8NOlB6HMtpgkVFfsg1dkWT6RQNe
         tH/QNlJiv5dkag717/pgo2lMex/BkNL6QTru49B/61ah6ADjMXveFsNGwl83yoAEuF1a
         3FIpnIrrvwzYJf+16JvLakvEnSCQOP3zs5hUngBPv0/7uKT4Soqk76lHcoUx8aIT4J6/
         qr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203587; x=1793808387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rFZDp5Fkk3pXBS1B4nPunTNFGpd1zfRgzV12OlUjhY=;
        b=vun0K7j+gjrIiEu8aRFWEfdfkN1OuRJ90z4/Z3c9mZRelkmhGmbH2Q/POcDN8P7DxW
         vP61Z2C1sv/PFESOgKtQOGDuYnFgcvW2b+j3XRBQskPtML1z24rjgUu/nFMw5d4pKKxP
         53WuSb6BJPAmaWu64fRw3dpr4xC3gbtn0QjEpn9xhrMEv8QlipPuYUykvTZ6qsBgtmCn
         Hdlh4aICH+ysqBo5MBOsE28LTh4d+xNaN4uUpxH/wEOruJAa3wDmqHtYtmtWebU4h9Qf
         Y7hWHLaUhcpQs5V0T8zF3ee5wedpAsv8SOSsz/O/DPa/4vcxengR7x4XN9KIXxhwzDQC
         ZMJw==
X-Forwarded-Encrypted: i=1; AKwUvBzVfuixYVbrfB0oCGbNYCkun6+/xR0ROLNXJ3FzV7Q1Dm8ki1IObGRn6yTK45kpyP2Z1LxL+Fmfyxzv4xc=@vger.kernel.org
X-Gm-Message-State: AFq9FYITpa0vsLSJkM2GMbk2Z7HNFZbknkcwlyr8jk5CGPWYVaA5SSrA
	pV/CEudjJKrb9MXqiVEqFv+MpBGSGooEhAEk+/sGgoWtBnCJ6vuuu30GXm00ImBiQLc=
X-Gm-Gg: AYBFou1dfVWwDTRkOg+DH/cp5alO9rBhQLejMrB/W1KHnkbY0Wl6tBX8q0foeFq8BFQ
	dvwyVJ1Lj2uQrkgq+ZHpdXWgU40W2+rFtLsbxde6zrsjGL4u3zqaRPAvjmcdgRRsE2XSrxv6gph
	sK1cwU/qwI2yYlorpN7Ok7erHGktxCa1YJlkA8lNAjZa3ZyMptX8BiaT288unyogBm6nbxzTCRq
	DEuzVfOSvpY+AkSlODmsyPfeUSDtyPaKPW5Wa2MtK3ZDlrE6SgovYO5dKiPEYKc5ZTiHtlm/FF9
	/0f24vDPJ3IufPvJ2EsfVXB4gi5g9N4KWkUyjZ9sDvzXRejxLhNw4ZHSheaIZvo3ZX7FOe2u+CE
	QRNh9ubFwddf2RZBHYdXxnhPs4YUyWkztT1I8v3Wfd0iMxxYo1/MfbA4x6GRizXTQcZZYPHuK1b
	zJmzRM2F5EL2i3TIQb5IVjRPdRAz8/xGOD7STos6E8epgcodh7vVlFi8+xTulVj4LolWEv9KJJj
	Ch6bf6RIax1xnDFCbXRlYDl70sLm9QKddEmLlwEz9LWoSX3w2tnV49mMof7iB7MGZqwKXm+3lyW
	TemQR15NtqVujLvxcmrgZ57wkpmfsFy3YhTpfeQA+LMLZaoJkSAbVABiioe+U48Cx6Wz1Kc7ChD
	gHoRYmR1pCuz4QyzGl/Qb+JMH3w==
X-Received: by 2002:a05:600c:34ca:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4a967202e8emr63277675e9.24.1793203587385;
        Wed, 28 Oct 2026 09:06:27 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:27 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:04 +0100
Subject: [PATCH v2 3/9] ARM: dts: omap: dm816x: Fix pinctrl range
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-3-4544429251e2@linaro.org>
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
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1216;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=l89+KyhDD7zp4e3bcIBRXS/O0eyS2NPYdXJ3nkvpksE=;
 b=FRIsaf92TWQOagF+GOv8n6t9aT9JwhYIl1hTYOAJmhh5eb4lmXgIOUlXafuwYpqaXP0CZzzW3
 cxWCAzBrZVVAGYkE4JwhQ10VVBHHlU2jeyyfH71jwum/JRrFs++azkm
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The range of addresses accessed for the pinctrl module needs to be
extended to take account of the fixing of the size of the pinctrl
register to be 32 bits instead of 16 bits. So in order to allow the
final pin control register the address range must end on a 32 bit
boundary, not a 16 bit one.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 261ebca8863d..fc124f9ecfa1 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -90,7 +90,7 @@ scrm: scrm@48140000 {
 
 			dm816x_pinmux: pinmux@800 {
 				compatible = "pinctrl-single";
-				reg = <0x800 0x50a>;
+				reg = <0x800 0x50c>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				#pinctrl-cells = <1>;

-- 
2.56.0

