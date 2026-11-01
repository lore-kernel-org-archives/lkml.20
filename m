Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575224;
	b=dvBl1c+F4Zx1wfcaKjHksFyxJUeOzaqlimvx6c4IAyOfydlcRI1G1m8sXUjKuSWR43m+
	 ZrpTfCnUkSzJptKcsqoMgl84w57O3l2uZIX2cVvA9IfPLmzbbkRSeCWFJCnB8QVhW1497
	 YIvOR8FLmcFhsGtASX/LPhrVujRyhoPBgzW/XSaHGvMVDAVgiVHGesCHrf6DIJtDBKGOf
	 XwWU820kC2YtQAmjzDK+8SwPA5UPOas1lg98uxygaGFbAU2mRpkYs/O0Uwhp1RYA7HHGj
	 1zY4Knmk9pKWnDavJ9hHd9d4myw/aPEt1vaqysW4VONBHPCIRy0ki8M+XYAQ+bmvolA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
	b=UHZss0bWh1AEmD/RamO4jScqpG3sRdZO4J9SmCVDt/uDZnarJCcgU9yRfXDpqRy/OReW
	 ipFh3Mr4oAbSRx7R34CS9EZBpOx3SBObv+QnrZ6fizVLznaSSNw6zICiKGYB3iw6br4eG
	 M8YV3dnHN9Cvjs2q67szqFjJ3a/NaX/MgLYEuznoikrVJh/nrIIHkSjZVrz9y8Wx7spQp
	 CPEoALV/o6pNc3Npu1XLREaC40E879dqt9lux/NL69xwkLBmzo4Zb7lzxJoTXbp81izoR
	 kZ1CMb4ipGh2gZYwYpMpgtwaW1FqrPUPx3yyRPXUUi8kwAWzKC5BwlfBxU93Rx1PwdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zQ+VRDRs;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A192606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A192606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zQ+VRDRs
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so18496705e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793575222; x=1794180022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
        b=zQ+VRDRsAihzfyiAc0GNDklzPpgtkWAJKz5g19TQ5p5QgSim+4BrF1LhyKrdj5ZEFf
         Yy0ukBfGR4wtoPLiq2UOBolnqVLNOt1HiUtPtPblu0JVSyN15T0UfyTf8PPLwAR1ptAL
         hT9MTGVJu/V3l47aIP+W89VeNK65Nyxad2UMuIneLEI29gOFdpcB9+5ooGQQr3P/o4rB
         CzI/VB3WYAx6L+bphqjz7fOhtCtzhE2gcBd3NWkkKy3Oe/CY0eAPEna972ToFcBAdFMI
         JKYzn4YxY0dliqLEYQdfGmzTrYYxGIM3cPFCmJ8hY2DUDLOAPL8FDJy3pyTMfcG1jQ4h
         rz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575222; x=1794180022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
        b=bwy/+ci7jPx1qidvHSFT0JE9VfQyFdVCLFltXBlz7ewl5UTuDMaJElOgT96F/iY5wf
         dF67I5Mpkde/HTSvwlpOnX6q7i89tFrEuiDy4xYkPBVDYSrUhBUF0+ciZ/VPTFJ4fMPX
         2acgHHO8HJ8NfGg7/tvxecAUqbVvHWrMRvPYRaWki8A4YREUAX8bBck07ujTy7nuOWxx
         BCC12jH9wIGMJu4B8Snotu6Z/NG/JrX5zdHbsx7Z+haEnoUZzuz1blFd8AH7dncc9oPK
         IakOKFEAHh+qdFUMOXcR2OXqZHW99VF2NypZ21kT+58gVlL9KajB/QKkwslNxBv6YCCa
         o1/A==
X-Gm-Message-State: AFq9FYKY2nZ98AH5CKDI7TW5UxF/tL8Lsz27VFtpB5UklBqV5oKovjV6
	STLGPFe75F9dlPfapmUL4x3zdZD3wjGCqVfH/G5t3WFd61ItnZJUj+Rx
X-Gm-Gg: AYBFou3aJqIzFWeHoKdBtm9g/s4qK1Kcn813wWx4cvRH+dMkUSRXWP5p38VWAWQoGba
	Goy7Wy/xvRpEKjdUVx1GperTNuBVVjdOqKoqFGh6W0F3r/7ZLV9jIxrPiE7ZreiHaMPyrMIUK/N
	+oT3091MPqNJJeh5sR7Dv3JTF5uUKAfFHl8dncXCwwamcV165xoRa2di39f0+xDY2TqeB3T9t7k
	sCuJwGd1F5iqZgsTJPbWfN0g4h2pl1ZlyelYeUjdV2KqTKeudqQDEWWNt39fpixUQ26rzbz5Tgf
	zJGS8njYld4cf/7P+jO3RBb1FehkSiDkIpkcA88IbddNAYTtbSDcmPw+z7iZqQgQ7BqW1DnIg39
	p92yGaLdoGWKGuw6YcSXRwRpHYE/VSVqjRPaR/2h5tmKIuGtap5L9WyXO8CN3q/lPZc6/tcA24t
	W5+6JUZYkuPIILXQ2k8pvFqGFGXUefmUbvT+YpaBRpVfMcxCacLJ9z7xfO9hYUewBllQyKg6Hhg
	r1EG49pImcr9LaR3mvWQtGaHnTfDER5F0MCGY+rJEVhk8FZwYg4/8inXurn7v0L024kA90YVXzf
	tHmG3JC3pKUw/154vIVf5XalXT0DTNgp6o6teBAAdRkQ0k2jz7hyQib8O08rgoYvaf2tF/4HMju
	HkCGUJgvENnd8v4ym3wQAs1PVVc9h62zQG9vAQBuYN6ovkK0J9L73SyO8
X-Received: by 2002:a05:600c:470d:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4ac1899378bmr187344695e9.17.1793575222418;
        Sun, 01 Nov 2026 15:20:22 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-b1d0-8200-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:b1d0:8200:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm303691815e9.4.2026.11.01.15.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 15:20:21 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
Date: Mon,  2 Nov 2026 00:20:11 +0100
Message-ID: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.0
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

The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
identifying it as a Synopsys DWMAC 3.70a core.

Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8m2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8m2.dtsi b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
index 6725dd9fd825..cdc47ee1a233 100644
--- a/arch/arm/boot/dts/amlogic/meson8m2.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
@@ -25,7 +25,7 @@ canvas: video-lut@48 {
 };
 
 &ethmac {
-	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
+	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
 	reg = <0xc9410000 0x10000
 		0xc1108140 0x8>;
 	clocks = <&clkc CLKID_ETH>,
-- 
2.56.0

