Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818191;
	b=w+o+4gQSN2eQcBbxdav8MsgVAkHrN9ZC8ZTj9CuFB+E39/FGDt9sKxLH0GiIc+X2gdLF
	 3msE6RtbPM8gL1+eRmwjhbwkm21Bm/tio1UB7OlOzZQBSkknMNxqmV5t8p54+6yCmv7/L
	 KyxubjDztVy0Iiyeaas+I/KRXkpO05PPXfcyYnxEOiNH0M8AjnRl/WVYD6Ay2u8Yq3N34
	 FVQYbT8E3XAb5qQxBUzQtpODbeRXCx8qRq+ctLJ989dyOheMAvTiGDUf8nh3OmoKzPwTW
	 192F9zvO6XjfGbYQD0Ps2bqw4B2C74xlk4aqO1otCl6Ms8ImrnY3HXB0PWtClyax3/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
	b=DXunCb7Y89IonInyYb4Yem57e6W86YDOYNQA8aKdVZd6lBW9f+Xm8+cSMHAild/ByaWZ
	 Ia0kRXLMyKKx3LorTNGam3JG+lDvVQ2UV/4inGp3w5dEieebm5Yrk/YVL+z5ZOCRn26hm
	 DwFSeW2qwHY617Al1XaBPpo8kENr2h5Z8oX4Zpsycs9NTNpl4Nm9xpkBfVyv2byVG63/A
	 45+CtHiInNUZpIaj1zc0Np0rsqXmbl/gir6whmB4sb35N6TP//qkZsNG0tNqoL8zUpPXl
	 yui4zrv23o1Piumu6DrEonl49x7DHCTT6LYrUgsRJFAaSZEmbq4hGZ60peZd/5CO1Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05pD6O3R;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51960A262C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F51960A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05pD6O3R
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so11308285e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818190; x=1794422990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
        b=05pD6O3RiElyTExOgex5tBJahBNwds0FfURJpsi1kmuICtcOLYBDz3wa+JFtc1hDrI
         0MHhG7pa2vP1lbLCqBHlISreOChjl6YOC3gTpIO2882NRGPle8rhtOHso6A5JkrhxB8F
         B1Oz1dqao52CZ+rJFqfvEOvwiG0AfIrgR0UXUF3YQoIHu/c8LGSJ6chwkZkkjz8gxK0K
         ExHJZKBTV4oUi7OUvFlPzngpkuSCoI+VCp7AeF9RK3GnD0FMwJfn5HRM3kGi3UroUvGN
         awrZvJUgLZoDh+cdNceOjHNesxiPer1DXcQyaZXug9ZYDfIcBOYIicLBdpQJOu/EKtvC
         iU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818190; x=1794422990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
        b=rpYpvEEQwqBmm4lsQFu2CgisrxChL4q4vw7eFfH5Il9O5HC/zm8CQxyWaYNRLrvj/n
         ScYwvX/PRmiYxrZveis0S0Z9yYEdU32V+t1/b552RP3VfXn5zWJFh1yFwIe65ivntd3T
         aaisYaJZkGQw5NwKZF7JKy7aUePY3mNQrHtgAy5aWiVwcnVWjf4hDtslrT1tPap6pP6K
         +gTWXUw4YTEimwsYnB67RHGnDqZzKOiAFx+f+HcJbwt1kIOf5eOWDc29VsK35OuWj1RL
         /wP78gUL69NFfLDQ6gBaGZ7u6b3Sl36t03RFWJJVK2/D+KAxPgyffKM2Xel4H0kbWRki
         Ej7A==
X-Forwarded-Encrypted: i=1; AKwUvBwNMJBbKldWPmVWfpnozWxbFx3igkvRdb+wq8wOBMOaKlZZ/EXQnhgzXxfpFUISp9RtHhUFyIBDk+cK8aU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fgK7ECVKwBvR6vfDftrmrEFj0fOXu65HdNEPY/xnAjBwsSTcS
	3SLIKk81uvQFERLLX/380M6u0fJsE7XNTbKMEJfZbiF2U42KKH0v/+IW
X-Gm-Gg: AYBFou2AveBKChqsQlkJ9iW/84AK1ssnpjeSyGZhflJd1uO8UY1QOkX0ztFbzO7QEo8
	4lNV94UV4LaHhNX2Kh9F7GCB7/d3hHmkc0iLIu7rluD2l4oMuAEFdZZXX5RSg3G9suTZI1+CvGt
	SpDgeZWDZ6whGqT23FnzjXrMPQnUdHDL44qzxaGsxIJyDJ5pNv6XkLmEg9dNAupVxOVk7y2r5GH
	wwa115AH/hIsTfGLU1HVb2UFM/C6jCbWQegytJ4SNJe4bzKY9tMIA0Lz5HFH80tIh1AsneE/rYk
	pWlsUtrO/gd21O6AFUiXNzyDJsKnK2Uj5b7yD/R7fyU7mgE5m4ierqhhYqUqEW8kwfnHDOlGzcw
	EzdhuAIJwlN79pavqYVQdii9ymyxf/8ey/wKrie5JK48CPJyna370yU1PtoaFh6r6Hklhnnn7jT
	B97z6UfjoggwFZWgQvnNRAlfesDuhlRXkhuj3Sy5BeYkdmu56qbvvhMuVi2x5vwuki7CFcPEwzB
	hhwEl6dkW5hBl3Rvew5ANaRUrC2fS5QIhLq7CB+p6JSTg5E/eR6g/AJBPjj7jXK/DLbZbKXOFBp
	BjfWGHJ1VvuwaytenGDJU5lzGs2vcDINZfSyn98Ul6v8TpWOxp+kZGyf/xa8+92N35UbI8krERD
	QIlzNVliKkcHvQwN642a5GEiH5uSk9sqTI6yP2X2kMvcSN2NhFEO14qwexqGll9sLEOOYV7aFhm
	UGlUn6VAM/eM+aZNh2fpP01uJLkpe12eFAnWqEpCi/edrbfbVGnCNmDFx+VjRrNZtCRBVp2f6Vd
	kGveWV6suPs/Iumk1GT4Xk6quYSQ/pix1NgdQ3JZ2Tn
X-Received: by 2002:a05:600c:3b09:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b14017c507mr197486915e9.20.1793818189742;
        Wed, 04 Nov 2026 10:49:49 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:48 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
Date: Wed,  4 Nov 2026 19:49:40 +0100
Message-ID: <20261104184940.882833-3-jernej.skrabec@gmail.com>
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

The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
so the CPU never scales its frequency. Add both, like on Orange Pi 3.
OPPs above the regulator constraints stay unused.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 2948369cd659..b7351b1db97c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
 &de {
 	status = "okay";
 };
-- 
2.43.0

