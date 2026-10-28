Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203594;
	b=S/ogMn3gqYipicZSICnmXTuk6W9bqR6Rt9WnAC2Gl5cx10JbMfJCPW7ROiWxNz+NoEBz
	 kjOG17MWxKnhzvFzjfYg4bSbel/Fsqt0DOuQqTvELS5p8niW8hrOVqdlBE6a1POdMf3G6
	 TJTqKW+OmHTpuvEG8Vc84gVg97k7BLknLusMaYzGLYmpW/Q16MZQtiL1fHCSothNPYaHX
	 nsL35d8OZgd9+GfXgv+/Sn1F5xSgdHZDBhOeQDCswe0zYrD0AitFEj8SqQ08poe8Wlyda
	 K0WYcMr2fBFLek9/gj3S6A8SzCVmCaxaW2oxUCfqSt86nDP7FNquJP1STJHsWWNSehA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K5cbxD/lRSp2Q3hLi6PLLzoHUCTKepxDQp4Kq4HqxLM=;
	b=Fhh+T11drSrrqt3BX/HYKiAy67gPkbJexXSVYX0ASJewEwliPMNhxn1XnIg0bAiukaoQ
	 VJt10zMpVqQgWtyO8i347JTJZQFEJDCrSQ2AEcV83/V+ufMVExqBhmUkjm040paH0+Xdt
	 QaO4l0BjufRMCcxNwXRlY0B9XzTi+RqITcWfIgpERINbABaVMwefTtVeF8F+AfLOo6UP1
	 XC3bPp0035Xf3XSUNurT+mMH1N8oCkc6iaBljUXHnyX+X0d+2LlXIrkviIA3YDJMfZNz9
	 vJKv+hZ04s3vuKQomrr43UDyZcY9JB712NXp3bpTuCqe8DrkTAP+V6+CRVba6JAaRHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mPH3qpCb;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3C60A3811
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C3C60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mPH3qpCb
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so10335355e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203593; x=1793808393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5cbxD/lRSp2Q3hLi6PLLzoHUCTKepxDQp4Kq4HqxLM=;
        b=mPH3qpCbAKLiev8/hNU719zKhQN6qRmCwgloVp7ypKQZpC9Uk61P8Yj7ABA16hvoM0
         +86OxbofRb70B4z3af2vh/6kS4boXPnK7Kr89xBvlCdoqdhMkfgWk1yAjghm1hu4q6C+
         Cqwmk6aI6MN2x4uCioaMdg0xvqiG+9IUdy7JUA5mub6nVtisQhw7+4pXhqWLkcExZxnQ
         rT0/j5XQ/jd9qw9/cnEW/pB5cJhyiPF6bDCExaREU0X9TRMvOk1a+QVOnAO0CGLGJ9tc
         aa2I5lc1eDV8ES3nhSOvoHuiZ3adPz9KxarEvKxpzICn871XshDaJ9331nE3NhtQoDpg
         Kmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203593; x=1793808393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5cbxD/lRSp2Q3hLi6PLLzoHUCTKepxDQp4Kq4HqxLM=;
        b=uVA9pMHUOn+M2vs4CdV4UbhQj5tmn12yPLrfLoM73Gv161VyMnbC2Nb80MJufKF7j8
         t+bkcIGp36o/0kG+GEWVzJ58nPrmmrChPT2DBa7tSFBKZqud9S+bpxXp1z8qnPvuiHwD
         3A/OZM8CPgjVSaQJtXs2dT77MEIdMqWtuQNmn9HP/NoxWH+fQ2d0FHXscueeId8gKB01
         lIVg3EL8JYOPGd4QuPCRNVXNOS6/GHxVaFJh/N5Mr2leJI8hYP9lVTAlnm19X+Ie4Jww
         v3S6zoZNIzREPqlsmRFsHUQ3zkKP656xXq4XlvLxYg845jr7kMcWRH7j9gH8PBRS64MD
         n8XA==
X-Forwarded-Encrypted: i=1; AKwUvBwx5C2CcJOcfR3G6etgeKZ4XjJjvXpJb75RzUWQODJpf6qG3pu5kD9xpYulkrV9vymZ8WJ5BrfY4P2JgRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAPiBl6QmnWLNbj25YBXHjjqDrczZNB2/X/ud+TO1SJTf6090v
	qf6/QiywTXz3Jr9tW+c7b9mSUQxg8baI1mQyY9pGmmzKfxL52GtRn6iE/UEjKenkzP0=
X-Gm-Gg: AYBFou1ot4H2muB36CEzUVPr3LfENtu1DTQWBOy07PKs5O0X9VFg6TPIu3w/nrlLvqj
	xICjRr5TQeKdlGemQdyvIVhrJqYEvF5VBFNTpVXv9n71Yiv2vf03rluVYttWj808rTHdEzRKYjW
	XsOGF8oexNQaPRM7Id+z+IMD4aJRV6y43jI16WU6nuh1Dc0nu+kvosdTQ1FOp7idLTHhppd5x0y
	UF2RQu9R1QLEEnuM0SK2lDqtyp07mtpdeCeFvA+WuSZzdG9sZEWbMLzeoIQZ90pmzEyk1DRu9Yd
	unnkEoriJVs2VwSwfzwR6LsLpDbb7s/9BT0zgEMLdV7u5hIzl07fneKDaQ6xRwOeZfv6NctFOMW
	R/nxd4BUxG8CVzJNcNTgfyHEhChCkwmXfSxjg1Bn6BT4aj80hR0e2rgF7lo6yLr8zv5ygnvd7vj
	kf+qp868rqaeQS6Xl9g76yWtVIvsatgxMLmRgkSq7vIgJnUXyRA8leD8f9/nJmW6HaA79jIeTyi
	wBjiDyY2Isxa32lxrZUIw7/ihQRcvzdly5lYkI6GXXg49HvLkknSrle0ZjYTiwXioYL3VdwlpXB
	NV0YOh7lK8ADSheKsFASwso4562bVP7dB//nsKInwDgsHerhrhte28ndnB3d7r+qobM52KZuum2
	l72uTBkabcJ1V/nIHgpU/2kweuG0IB44Y8yNwN5VkPFsAnUw=
X-Received: by 2002:a05:600c:34cf:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4a9667755f3mr61530825e9.12.1793203592754;
        Wed, 28 Oct 2026 09:06:32 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:32 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:09 +0100
Subject: [PATCH v2 8/9] ARM: dts: omap: dm8168-evm: Correct SD card pinmux
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-8-4544429251e2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2102;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=eWhzeB8jAMTZPI1KrE3IIq1D7Ssewn5fvDeiaH0we+4=;
 b=CUTdkEkF+dq1LidthdxZMOHWhYkh3VNaqmkMHQcbzmIMwWqhtlFSpowlgfjJ9B+E6nNFDhmgJ
 4l964OezPWqCU8RpaNDL7ofSCLEmk1/wscSP2drx4dcm0qqWHWQZ+ME
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The SD card lines use external pullups and so the internal pullups need
to be disabled so that they do not cause contention on the lines.
This bug was revealed by correcting the effective bit mask of
the pinctrl device. Use the correct macro for DM8168.

Also fix typo in comment SD_DAT2->SD_DAT3.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
[ettore.chimenti@linaro.org: squashed after fixing DM816x macros ]
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index 81450e15b889..a6d42766a496 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -45,13 +45,13 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
 
 	mmc_pins: mmc-pins {
 		pinctrl-single,pins = <
-			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
-			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
-			DM816X_IOPAD(0x0a78, MUX_MODE0)			/* SD_CMD */
-			DM816X_IOPAD(0x0a7C, MUX_MODE0)			/* SD_DAT0 */
-			DM816X_IOPAD(0x0a80, MUX_MODE0)			/* SD_DAT1 */
-			DM816X_IOPAD(0x0a84, MUX_MODE0)			/* SD_DAT2 */
-			DM816X_IOPAD(0x0a88, MUX_MODE0)			/* SD_DAT2 */
+			DM816X_IOPAD(0x0a70, PULL_DIS | MUX_MODE0)	/* SD_POW */
+			DM816X_IOPAD(0x0a74, PULL_DIS | MUX_MODE0)	/* SD_CLK */
+			DM816X_IOPAD(0x0a78, PULL_DIS | MUX_MODE0)	/* SD_CMD */
+			DM816X_IOPAD(0x0a7C, PULL_DIS | MUX_MODE0)	/* SD_DAT0 */
+			DM816X_IOPAD(0x0a80, PULL_DIS | MUX_MODE0)	/* SD_DAT1 */
+			DM816X_IOPAD(0x0a84, PULL_DIS | MUX_MODE0)	/* SD_DAT2 */
+			DM816X_IOPAD(0x0a88, PULL_DIS | MUX_MODE0)	/* SD_DAT3 */
 			DM816X_IOPAD(0x0a8c, MUX_MODE2)			/* GP1[7] */
 			DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
 		>;

-- 
2.56.0

