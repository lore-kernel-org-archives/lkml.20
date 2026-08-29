Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B35282F16
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787969468; cv=none; b=hupwg4ydZeO4D+BeKSlAThZxYpiQs7XTUmQTQRESFHzGOWvrCimY+x/wU8M+9+WamkrDI5ggslbX0nUlXE8nR8TqiWww+PEYtuYNWBzKT3cFLv42ufJPw0HHDGN6Zi3almt8m5/vyQL+vtwoqBT7+6z9RvEbgH/eehnpHOhzlz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787969468; c=relaxed/simple;
	bh=MQe/xEPoCNbr6+EP2KnUEhfg2k9z2+GVow4LGSXW9cY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oHap02H/QPcAHIyRanJkZ9T59oPrttfh4wy51mHnNdh09I79JUaSoYBiRTON9KkCVrckNTVCWgEY6oXqatDf7r+iULWOq0pFPDkR9gVCGgzv2yIbQih+lnBV/WF1UY5MWzdRvGliWWYUL4z/aS05gqR/Y6M7bHXtMFYWDWyL3Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vokk6r6l; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vokk6r6l"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2043831a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787969466; x=1788574266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MPYBklt/xZLRwo665EAmIcEZjt6kKUUFD1xrGZB/rQ=;
        b=Vokk6r6lkEhB7MCxFuMU3dy6uOr5FRBUCB9nPTSO/9PW0kd0Vn2NFwLZAQKw7mXH4j
         mNEdJQxbLLfxoSJPu95pL3Uzvy8teHWZS0pp0NUohmub3mKYVAUJqMbqtp4+75p2hRQk
         gL1wKuWV4ymx9SVVOh3uVYwFd4/lvHVtGX6/w0geGd6Y+4wFE+5hYhNNlpfhrWnE6yrv
         81OaVOOBU1plkCerMOAOVlHULPh5HGtR6lMHzqH6Md7XEizZgYHhElmvy1+4+FZDBNyi
         +Xipd/czc0Zn1M8YmUSmBRshfe07cvEl70S00c9N7ZWNlRXJmeCC5Ye/SmCmDp5bckGm
         pLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787969466; x=1788574266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MPYBklt/xZLRwo665EAmIcEZjt6kKUUFD1xrGZB/rQ=;
        b=k2PRPWMweAPWCCkLQwGRIny6we92uSAIiVELPLGlC+x67aU6KT9EVTyFxiQDq6WRlb
         k81ZMg1XMbHBQ5R2ltz0bFvbUcOzRRN+qA7t4FoDoL78sBaUL9v9fOMrJcbUIe/0/pbu
         1wtYOgcwdY9E5R4d/fOfbdD3JM33zIUfle4vcZNHdFjcHlQVDozyhxfvyPtVOefPTLLx
         Bv8QjGbaQen3GYwO5AnJqqE7vJA+o8EFAnoc8GoMAKZqoHl+tZK05YdjovRTVJfVbfDc
         XHfLcexLBZqFExJxw66wIfuxva6+oFUCwj5thvxLPOhBmW5nJgKgc0gNM2kj1mgfljbf
         q6BQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjUV2+3RCwNAGuALIbsQJvnIDbe5lIbEv7Xngncp8aJZgBoTPYO7C3J0qkrRRBb17Srz6SN69iaN8NC3o=@vger.kernel.org
X-Gm-Message-State: AFuF++kyUeMUk8OyOzfDkfH5qkIczSC+/6zP4RvOKDEdQwZ2QgmyV656
	fthTRMeHoGDeP9HFJDPsPvnV7oOIzBeKdD3fYaOGbTjHz3R6A6xejvYo
X-Gm-Gg: AYBFou0e1HfAHoM042vrmHVP3naHqws0Kx6Kg35kzQHBxZyvR1Z0h0eQZWqssxfj6lu
	LWPjMjsDw6uNbr81t4uWYP6C8sB05PiRsLlnYSfR1TsKDmLm51OOpJUOYTujLBvz1HRJny5QV4F
	m68XyRqADvQvMONfkQmYT6YvZm1rLVAphsR32cGUkuwJfj0WNh5LDZK3aOYdcvttyQ8fKrKdzqe
	lNNdnbyM1f45RNPCp0f6gcJRTI1qimTyX0DDDQxFNjPo2E7tnnssLyBTLbzGSgPcoNCoeHeF43O
	2yR2FrbMLB+4Masf3Qep+92w6ywyrNhWCrIdEwp8v4ELeXyeoS4iG+WjlHkSzQNbv/AO4fWavrp
	86SCAtIhAB/TdS4znKqnKFWK1yTAnPfX2WDlw9N0bAwQzpjIB79Em2LadYrfneTZb7tBboRlS5g
	5GJX3flXpqp41RiRKFF90hMMOwsagRkaF/w2Eo517xqeSJKqLXo2p7il4gPaexEJLSh43TPxHSQ
	DNs8DOW2cIu/460bJ+WXu8hQXQj2tkHSmelrwG5ZweDfDErdUULqAZjqU50EVNFaJPKBanbThAf
	5yeRzODtUFTokRdvUFY6s5yM5dXhrmxLcNirT7+jUEnnF/tobw==
X-Received: by 2002:a17:90b:384d:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-396d0ec6bc1mr15703233a91.7.1787969466062;
        Fri, 28 Aug 2026 19:11:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7aaaasm4848984a91.6.2026.08.28.19.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 19:11:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: fix vbus-supply for USB2 PHY
Date: Fri, 28 Aug 2026 19:11:03 -0700
Message-ID: <20260829021103.332384-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usb-nop-xceiv binding and driver use "vbus-supply"; the driver
acquires the VBUS regulator via devm_regulator_get_exclusive("vbus")
(phy-generic.c). The stale "vbus-regulator" name is never read by
the driver and dtbs_check rejects it as an unknown property. Rename
the property so reg_5p0v_usb is honored.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index b8576ca0de1c..9de9a8a4267c 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -140,7 +140,7 @@ fan2: j17-pwm {
 
 	usb2_phy: usb2-phy {
 		compatible = "usb-nop-xceiv";
-		vbus-regulator = <&reg_5p0v_usb>;
+		vbus-supply = <&reg_5p0v_usb>;
 	};
 
 	usb3_phy: usb3-phy {
-- 
2.55.0

