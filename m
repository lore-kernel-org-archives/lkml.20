Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166181;
	b=VHmNBPv/IfVPhlyGW0jdCP7ehmmjXEpIrf7Y5fYu/oHVb6lJ7moF1rL+Uef+QRc/5f4q
	 YkS2LtoX+JtltUBt37iY64tRppM8p9j2V8MXHDrEAuovL90JKG4ak3xstO6Un87AeM6nm
	 nACyBeHgUfNn2qqfzxVWgxSTyr/ZX6ZybW6g7cDIbR/h5x/uK81n98W4MnpkGyBAazf1K
	 njwVUnw62890KOFCDAwhQVFjiO8ou8vWg1bdGHRERtERTefCb5d0+qkvjxvrXJBqG9R9f
	 a3tf/c4CR4DviL/hmwnFUVMNQ1Um3fDSV9R1Kz+PI11wzftplvaIvjXbDwcplBs0nqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
	b=PrxSmAPRoohWWd+sW/o0JSALoueieQfBLo+f485T8+JbNw7vCsd/HTYnFNCbdxGoX/+m
	 FIFfkSr644z//Z6JKDbCsNOgquQR8e0XEIUoRTroRdwUc4cJEarKdXBcLqOOVZ+v1Gz40
	 6zp0woelQN5IOXxkhA1mTNcztrxwpajAEBbzg9Y7RdjQAWmJCbXOB4+uFutuqgbYHOO35
	 Nt0CuLQfSkpwtfyx/J2g2pgwMlWiz/xVc60cAgBzmSwSzJN3TPqyORZNtW2TronQMj8+d
	 tFl8smIv5tzfkwXwWH+5WBjq9FNvWHj0JFEu6r1EJAFeoo6gG4k0KwPvWn1OoA8mWZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diMutTdP;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98399606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98399606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diMutTdP
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33c10faf6easo21139eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166180; x=1794770980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=diMutTdPzaIdRwJ1lWztRLVLO88l0kujylEJez32p0TfnqNlWN7/HJxPLwLGXHRYbT
         srqdJWx53HEudaAU7kQrTSzCfV/mHA7UeHoLuXaNSAtlsKC7sit3owrJxb77c4bJAXvA
         6dRwXOOWMkh0Z2h702h9labUVhgtf+b/gG1Tr7FSxJf81hFOSWRE7E4xTTYkgkFPpIOi
         48z0jVxL8KIw6ofH+s+l0FxocWKkczvwjpgPmI/IVj3M6zOkUmZXavmyADvkKyPBYH+p
         A7OtHCIhSaN+USc1Fp+mcACnw5SZ9azFn9z5JfYqv+J6yEUi6lngPJBuyYT3z79xIRzA
         Tfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166180; x=1794770980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=JzzgSi6M5wnUXUgAU+kDJ1as0RSLtIiKbRwkcpzUYXhmqkogWHiRJUncYLj4f4ZG1i
         AQzRpcCNAJtK5WO6j871bkwAFRr7iN+Gch9cHfCDvV1cXw0Nvah2qjYPd/HTpYDkUlD7
         DRrk0z59qBL0tvFRSvrkAAsssZiEyc4XUotaT1rlgBcWiawrF8IyQ/7J0WNIFOznJrVR
         Qr/J/9WFwPJB/RpnuQUc9GcIYFCol4LPq4aE1+0doTIvCvaNgPg3CNq56a9XlCOmhlqd
         BDIqOzxuirYC54mV73GCDI4ugBFyBwSF5JtV8YTc8Lo8xZnfAi8of2zy+rEos1tOuTuW
         riqA==
X-Forwarded-Encrypted: i=1; AL+hErGLxAVGSVot9EYNxFPShuAZ81KdH3/S7Tvq+jWxqnvh1HyUXDtykZJXPiMRflg/heShh8JkLYAvGLy3MvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dOCmaj8h7/8wBtOJzv1Ndw+9P0lLjK/WwECu0uLPNX2c0LBR8
	+Oxxe4BGOYY1zWZUk3h6r7TI63vX+uvVq6KbKYenZwE0oLiT+SXhcN+J
X-Gm-Gg: AYBFou0oJS7uUEWdLQj98wmWYNxUWfMizFFC4U1aXLqjluNeXUgPcgcDpHnLLe13j2S
	KVa3AeYg7ikTsBrxwYO7IVwZZ1pDyH4lZpdtMGtvSE0cVtqDI2RoxcgdjpZnAOoSiXbOffXirwV
	oVYxuE57PskWE7lVgN2gZIiEKtcNvMlu8CpaR8eDiZ0zi1CZirnUCDvER9/xxK3hqQ6AQtGayE3
	C1b6J/Hs657JS2uCK/OTvA2mxNxw82wQq6ApeWYZBEwAaRiN/aKuAfD5xKLi+Jg7Ca6+c2n+9Ik
	YTRhJrkp/uSxtGnYLKo7T1M2auO4Q0wPKSU14+CdiMexh9M3NFzfeGXg69B2SlIgx3UbpjOVuVo
	UnSjs8/aloe7k5jkFCf2CukmDw58gpCDF0B3VA/GJHaUjX1Gr7XH/SaCkOp6khfq8rqFXZCWDYo
	C00CNWT0yTc7Fgu21i2b1YRP8K1HDdqsQn2775lRQuBN+Un/XvsrAopmc0PnYZnbOokNn1g/dg/
	H3Ogwc3h08Cw+g+avgp5FdvBg7MS1ejQMxQHeyA3PnZOgp9wqGtVoDdl54mOtmBnK5Hn2ajmRRF
	1LkQ1MgI7UUNJEyTHgOCTHyFH6VwGrislRwoY9zMt0jTI7lbv0pWFYSbswhF
X-Received: by 2002:a05:7022:7f0b:b0:147:d430:7322 with SMTP id a92af1059eb24-1b39fe73395mr4649246c88.1.1794166179643;
        Sun, 08 Nov 2026 11:29:39 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881e:93af:b6d8:a723:b13b:3c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm8800387c88.4.2026.11.08.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:29:38 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 09 Nov 2026 00:59:17 +0530
Subject: [PATCH v2 1/2] ARM: dts: omap36xx: Add unit address to ABB
 regulator node
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
Message-Id: <20261109-ti-l3-noc-v2-1-509e8485a1f3@gmail.com>
References: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
In-Reply-To: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794166167; l=884;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=mRJd2FscObSZq+5xKtM7LxfhPVQc620l8Gz6i2pWC0w=;
 b=TFOH4hkxM3D01wuR6L6Kuij4EhR1doZYnCWknkMwEvOXQXqR2Xw4A/iEi0VoxsMIDTuZfEQK0
 B89GT6/5jwlA6EA6BspnldEkt9laFNj8tzSyfMhmgkj5HCm6tLrKqeG
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The ti,abb-v1 node abb_mpu_iva has a reg property but no unit address,
which violates the devicetree rule that the unit address must match
the first reg entry.

Add unit address to the ABB node in omap3.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
index c217094b50abc..6df66eb7e7eeb 100644
--- a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
@@ -92,7 +92,7 @@ uart4: serial@49042000 {
 			clock-frequency = <48000000>;
 		};
 
-		abb_mpu_iva: regulator-abb-mpu {
+		abb_mpu_iva: regulator-abb-mpu@483072f0 {
 			compatible = "ti,abb-v1";
 			regulator-name = "abb_mpu_iva";
 			#address-cells = <0>;

-- 
2.56.0

