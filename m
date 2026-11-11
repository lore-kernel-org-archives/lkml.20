Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377452;
	b=Xo/q1aVhl9zggr1IRwiM9e8Mfrjt0B75nBjFcBvMFiCS8ziycKSB83Ke+u13wNtJZN7Q
	 dz/BfRQnzcIjW8YS1akkLa4hOp06jP5Aahe3cyJaB7oogO7sSBrpZ05klz6NYlAdjPN9q
	 1ZelVQmOTMb/eE4ob3eAQ6NyLrMzDYGPzqvstIrq9XujpRj68/UwneMlmSuZAH+cBjf8E
	 nkRdldn7DhoGQPOcfeVIyUIqOL6H8VUrX8IXWe0pBL7P7oZBKHBR7tSkoEgdaxFhDn99w
	 xfL/BKskHdi+a04EiTY/WN930tG85jbnItJ5v+/kU+FbwN2+DWIX/RvPZ2yHlydNjfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tf9jlObbsd4CIoq6s2RKk4rWo7jBbta2pgzbHELu6Xk=;
	b=ivddcTSRgL1Nqt2YVaNH38Y/u08m6Gh3OGxFQccmgHSouUX2cFnTYidc0Tby8fBcpv1S
	 Sk9qjj/kUYS1s8l8VD5ouUZA4D7nVzyiyVS32w9dPxqfUvO1/T1Ak1m8Ulx6cDBS22csp
	 9GaQc5amR6uS50uOst2qEcS7A9ao012L0jELUt/sw3grXo5JmysEi43ObV5/FWPeWaa1b
	 xK8wsMJGmJtq8tpz8dj27pSeGo/coRblwxSf9AFbdu2A1MVbFXI/EwbNE49dEonehddz1
	 v0Spb926SwD/yV1voy52xGu6rnrhUPKHDRIfs77Hm8BxAS9B3VdeQFOtTg7CJqM5VsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u4vCs+J;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACBF60A261A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACBF60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u4vCs+J
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed06b725fdso21145185ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377451; x=1794982251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tf9jlObbsd4CIoq6s2RKk4rWo7jBbta2pgzbHELu6Xk=;
        b=0u4vCs+JCzyr8wiUZvILWNHoTkZXbBfvQXbweey8CcFtdSsW4P8nSI9I8K7Cut71as
         z6vz6jSNd0M+x+kp6PoZmARLNZljGXOB7Ez0EzCQPllHfjVv7LtIfAAFP+pjgwy0WW7e
         R6L6oifOYOupThXs8qUKBZLghGoxzUdtsH2r6oXBKmV+oaofWaUNGjxytGg3x4/9y0zN
         ki4Oc4MaIBxGnuYGht3j12RLkKM30/qJ8Td7aSOp6I+l4UksqAKjMPMBGACGOTnCE655
         T4ajkca6L/AqWj+Vr+34qTTEnL07z/6t3fApMgZls4THz0advR0yccanzn2eAAD+i+qt
         ZDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377451; x=1794982251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tf9jlObbsd4CIoq6s2RKk4rWo7jBbta2pgzbHELu6Xk=;
        b=AbaLlJWgUO3n3/OW/HQ5drE6lKYtH+AxJgOjD4/HPx2TxAOjiWpI3gX4u1HPJNAZWx
         BYJfytTjibSXAQKgmlizmKrz61r4ebFzIqu81F8v7WEjykRSrVwTGnxP94cfzmyKnWBq
         m9tA2Ot9BJ2jSOlZhVUal8RwoPFRl5EWrDDA1EQZeJbHoBp0gmlJx3mCHOP7+rhZ+F6A
         kfezDsnx8z76umXczseIY4n6ALR5RP66OaSkNcI+HwELADEHhHrj58YXsEpKAClbw3fu
         HSpTHK/Jt++eZbML/fg7HT7vj86hklnXFlExvgDHPWuNGHXoFqsaXrhSu279oH5tXvYs
         4ngQ==
X-Forwarded-Encrypted: i=1; AL+hErE6yUWO+bhKhCuu3X2ym6q08s6d2PibQcJIM/M0tDXnjnchiHMKj0/1IX0E+HFGdAY5FUBr8nJd8XRCqEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/olxKm9TjJ4ZFUJ1OapJ0JHIn513lH1COl33At8SQzzbREpqjw
	6PXM0daxmniWKOQ0GKsVVtcIF3wp3P4Yxa08Jm9y/V++I3zWn5TyfCEe
X-Gm-Gg: AYBFou16XB56ZWQ1jph7gJucLgsxiWm4Kc1A2Rr/OA8BLpfjgcTX+JYRhKl2FjwqOvS
	/CW2lgdxCCueJ6wto8XuyF4NM1S85Q4xPlOFSMKjma39UDULCb00O7tQfzsHVNCwvTsKIP4kwjZ
	ChzGFSY6RQ49r1BqTjlvvhgdDM21h1XnL8bGX0JrlsYTuVGWhwwx1D6d/cdzPueQhex8CO3JVCw
	JhznkBVRgXmmRnl8XFmogdjfWQk4A9pfRYPnxlC8zrPN34lsb63V68nhFb0jAPSso5396HGBHIk
	s2nGjDx1SFwQu4oUst6Fr8sTFgmCXi7BNfewPPIyYgnAkCpu9FV4or0Jm/s+xKSq0fr43IdqYJe
	NfaHmKjotQxic9ozSlrUFPzfwnfuSbnw60y3LYNX8riynK6EWQc2gpHGwuEVZDYDbCX3bGSGg8q
	RwYYsjV1U2hDya98wQtiGs1zSCvLW53/WtEXhnhw6g6cQblIxaSzQDH1IZWT1jKlTL2379iIYf3
	9dXVP7oTQCalTQovdm1pYV0X6OqCRPOG4FvjIKJCoJdeplP4txiDCCjiC/CT4bYRGouhGb7HBYP
	VuHKri8hWAmY1DYiLEypcR7cdz0TBzcKYTYLVBkvGVg1qzr+FnjImLuu5QwHRdvXkP9I
X-Received: by 2002:a17:90b:3e85:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b182f91c63mr1169003a91.37.1794377451297;
        Tue, 10 Nov 2026 22:10:51 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:50 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:44 +0800
Subject: [PATCH v2 3/5] ARM: dts: aspeed: ventura2: Name the COMe presence
 GPIO
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
Message-Id: <20261111-ventura2-dts-update-v2-3-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=JUNGHAUf0IQHmc6IEwFOoWoV3n/zRCC0p3wp8n0F++I=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af1293/fjBxZT8qUQ7Ck1LzVeXz+XG4VA8iq
 w/9bLeZK7aJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9QAKCRClg0K3CVbE
 gd/HCAC29OQHvHu3hEGDxLtfZftWnVo9wSObeWfAYbo8H0gxB9xNgPeWCZdlnrbWJaoQW8iLJeJ
 nPbdsyxL3kL2h5sYjLFrZnPBxHUwI+LfYDHG6DgjdoKan1x0CxAWR72tkxv0/IVQBNmPl6DQajn
 KKjvIhtdPdU881ZSuBaOyTGfRpRImiTZbyqsZxsiAxhZMFWIAn/H1qOgkwVwnMWwJSBGMeW8j6E
 J1ox//pkKu2LZFkjIBRIC+LvdPkEd6r/wWDSJz7gcync1njgf3+fn/IfKkjVahhjIYguBFTnmY/
 eCea8i+6hU5+CkSU+JgM7oINoUxLzE4XfqQxXTyYAWnErhL3
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Line 9 of the PCA9555 at address 0x23 on I2C bus 3 is the presence
detect of the optional COM Express module. Name it PRSNT_COME_N so
userspace can determine whether the module is present.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index 21c40dd4bb84..c683ac19aba3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -625,6 +625,17 @@ gpio@23 {
 		reg = <0x23>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		gpio-line-names =
+			"", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "PRSNT_COME_N",
+			"", "",
+			"", "",
+			"", "";
+
 		interrupt-parent = <&io_expander7>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};

-- 
2.34.1

