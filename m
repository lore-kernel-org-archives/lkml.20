Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818190;
	b=B905XhPm2yme/qvTaNH7K9j0YNOxsJqirMrNKpmEfcZ0wnAALCk89SerzgWeprhpDbYG
	 tYPpMSfWA4wpkMXEYp47DZ1kvNh3W60vFbRTrbTHp+qstUNFLdpar99wL+QUVvlQfQqA1
	 YkPqs+yz7E0E8gPNgZ+Dp3jaDs2anhz+g00jf9o3drlnHisBeMpwZ6aU5ShCCjGcGaJDb
	 3WulN1ivBRfD0p0fcJigADJyoVgOTB77E3TQx2hZ4iSGYaJtkcFKk+SZNS0v7vEX4UKUk
	 fecRJW8ov3UPOndwcfsulVpYn7S4axWHATgkZpod400NNZRXYjGjx6v2cM2RhCD+S2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
	b=ayhNXLChxkwUKSoAgWrWcj5uhoKtzp6Ki/SeJzteaKxld5eHw8H+qLlfESrT0l2RuoBi
	 GGaKmWz+twr9wmpu3KlER0ChqoYiXAvJKt/tJV5VTACg1mv2thC6IprAq6lQru5rDxT8G
	 k36YeN0X45VsrGcAxX1k7VgR79UENWILWJgT8B+EqdX8iKnfsU8GaJFF03vKbc6igaUrx
	 1t49ZtURpnStOW1fLFoBzLdJPdCaJrAj5B1zt2bYbj/O301lXbWfBbsLpVXsIjL5KmeVX
	 BmTKHQQAidgc/jlm/9OB3/Zz/xHLfPy14BuTWmIg+2Ia9MFtsTY/adT4xVpIaz9pcZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzTLr8mR;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B8760A2619
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B8760A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzTLr8mR
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so7762335e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818187; x=1794422987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
        b=TzTLr8mRllWr3Kr+KwsijkKD1sXTeYrZ5cfA2uwqEltp+EpAzowUY12ffRxDKzcuzY
         2LqeQrSe++Qrdwmm46icHLvpmmTnuOjq2sQVfuEiDxC6b2SviRy+yRF5SOOkoJ/Sqtoc
         LX9/SOWwuDcKFuLoUdDwQEGQEdhe0+kDFJod3y34mhHi+0Zy60sJvAwOGd1MdCVx6OUX
         nbhdR41quh9fBpcimOG00U7NQP29cFBgSdhjgem1ZDQnmDGY91pemu9azr6nzudr+jkr
         ygICUe3qLx1slRIjCPCVSL+XorTZjsyk/iUFg89a+uUhihqQNesceckrAbe+siw76kvD
         vt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818187; x=1794422987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
        b=v9r/1cwHwUXumUva3VN/GnCXeUzIJ76OfMK08++l47YW8ABpZ5rVPzd1HapWTVoCYk
         ZY8pA0KHQLRif+q7mXMgiZ0kC65+Lhvwom1teIPLda2/8Is8vADcyF4hrn0hUPdyJBtm
         CVGcZEIxLHnl2J1EH590Utdb0EoiPmw9nEJkCRdxPt7Y0rJ+kn+rWmWmlgX/Kva9fKOD
         NGnaJD3ScADBIm44/OlTMF6TTdvu0yBRetdWl4ErBLqrYGCEs2eGdvu7n0XJUcvDcNHD
         /3XMgyILp3U2/FfRBfPeigikkZQ5s+wnvUwbRKgGlvngQGc45T4t2G8+Pu/+kXE5vPUV
         lH+A==
X-Forwarded-Encrypted: i=1; AKwUvBwsvqzfJXEVjHpDE7aKXndfK9eGTdHQbfZpNWUdPFN2ypZt1FvJGkNxMRjJbR4NhUINERa+0N3EdfuUwgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TcF9EntdjRk1ug/StX1p2rMdMOyR/obUqNmgXnoGsm2tFMJAr
	zSrUeuyosvIHaXiNJBGZkj7uBJkHnt6OCqup95V17grlFDAohbrfASY9
X-Gm-Gg: AYBFou3LF/MYN9w5kxKT6gIP43gFVQ1cdZ70Hzgeh21woXBLEF9bCfE4Bk+XshDNDbp
	h2Btd9+f2ZJ/BASCjmQ/ThmUiPyDWjnnuGXIEkuXfu5/TjAdrHddIbbHcA5Iv9U/B42/KlgGef+
	6PTafHhmo28NPU7jg1qbFgKMl9/fQcaPUM8/QYnEb/dcX9F4cUvmXaoC8TNS+oD7pqyEwdDr1Qp
	+0ruqjKL43hdPXgad8nOf2TaaYR+wJBp1j0tIQUf2nObbA1bGZq0vxXUOOxE1ilCUlZhmAlFs7J
	KY5EHFw45r5kSfGwUl8djrLT8acozAORq0thbGxWm7NbLEtPirC108Xx9i1gmaNt8Co0CvGNGtW
	mBYMX2NiBS9EUpx994FWiqfvKLVCgKbasFAXMrgLLQasdgxnet8evRRmjKTOiXbxlyvhjmPwF54
	mbuNDn9+P2DpyzGhGk6Be09gXwJ/l7D7gKE49qoCx1khP+Vj8WsBRjuIbzhT464iS7wxI9P1sjE
	pAI8sLyKxQmjMqGeTw5cXSJwrZHHtPruzekVLTw8aF6VAvPNzggxkW8+NRE6Bijq75C2IZsBAqz
	wwU23CwSk15l3ScWTPbMumP9Dac9jjWDgZSaMrA4Gz9XmZtVLZmQmS+VBOZY58Iejz/FzIiJslY
	M2nhdrGI34fgqQE7l9IW7Bg2UezyqtTJZn7F9eF4fzD0mKQuh67YYm48N00sgGX+Z6DFK7y4/UH
	lGPAZqMTw6uIzAWv1UfFhggcyj6Nd3c5g4KfA/90kK6W3N7LMjTzMgT16TLZNXjA4e4feL000Qd
	kx7vOKDvt0/U6f6fIUAPx+hqIwuhKV/vuimYn4JLFJkQ7otD0sBGxNhyblE2OFDSw==
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr364814095e9.0.1793818187271;
        Wed, 04 Nov 2026 10:49:47 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:46 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
Date: Wed,  4 Nov 2026 19:49:39 +0100
Message-ID: <20261104184940.882833-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104184940.882833-1-jernej.skrabec@gmail.com>
References: <20261104184940.882833-1-jernej.skrabec@gmail.com>
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

Only the Beelink GS1 and TaiQiCat A01 include the H6 GPU OPP table, so
the GPU on all other H6 boards runs at a fixed clock rate. Include it on
the remaining boards, so devfreq can scale the GPU clock for either
better performance or lower power consumption.

The table also works with a fixed GPU supply, as on Tanix boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index dc7381c944c9..ce82aa265cfd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index e34dbb992021..2948369cd659 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..f4a5a2215ea2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..f08077175549 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.43.0

