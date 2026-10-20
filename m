Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505023;
	b=Pqhvdtkjf0HuqgVm9beXmaL5d/LUuYYgG2YkAMuDvY+9OB4lp0qOE/IguhAe9DfrCkPm
	 hTf80ayMBGHGxft4Yuwdpx/XRsUwao3XhwlqGg6wFjN60GxsPXH+hVakzHsHH0QxLiYXM
	 K2AkCwxtuYow51AF9KeWJ27K9qalfZePJRfolsvQCPJPaCb/GITHHadkgWlM6NAwzvsnn
	 HjmQ4HFnhoBPAGgoOJdNk5bXS/+6N2n1GEZH+pZPGtf8zDDWDOWZ9vzV/6QzoXGZHjYs3
	 bJklZZqETuKX99ltwfTpD1hxWv+bYoZohns8ca/eOSCmOTWeDq/Raks+Dr30EEqxedg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
	b=dNv/V3qjMwQ0tryGkFZebu+3Ks8WR6KqNZcCPTaR/lxxZTx+gJpP8MEPirKJMKC0H938
	 4Ts/sWEDXaVmHRTqzWQVjA5H9TvjEXSusz9ZXyINOpAyyZ7PBGhVYRclorV+Hf7pUz+rl
	 B34Kia+ZGSt5dwDrbx/gQW6BYEg4F2amA3c5o5p+609Mm/gD0zs49FzzVwUft5lU05sUF
	 1j+i28ndebqWL3F7o3KeqVm0IUTSPuNdREDoYLdsXFjMT2Wcp+CtBxTqki5xVT6Yqsudc
	 UDik2AS3nbLtCZv+lGWAsSToNE8ILxICnsQVkjppRNswAWQdLroz6W+KqaPbsrGnjHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HxiTvnzw;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E24606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E24606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HxiTvnzw
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e7e742a2c7so4806795ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505022; x=1793109822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=HxiTvnzwxG+Z4/tTdOnOwEo8xP/vrYpSV/ydXWUaOzzfYJO4JbvQjoz+tRYAChzTer
         ng/yjkIsN1a3TTM+m0rF1GjAgsXiuLexHYpXDp5idwUUpOFBdAzDxnDHgzZfp8D++0hF
         HYO+pkonW4yvEBkVQLX7zIIr4+mXlCMkVxJQ8FU/U77fJI+/j4F5SaS8lPHhNih2P739
         QL5wRnRARdX6cPYCKl1M5WhN+YbZeXZsumdMO4JbxlnddpcMckbBmzoFRMpb5QQxD0Qb
         PSpkTQYqydF70T2kwmyVfOBGMd9uLipAGCajKgfCNBX2SxWObutrdrD281Kwo3Gl/xeK
         +c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505022; x=1793109822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=HMips+CSfIaJyA41g+/5jNueYvtauA1mY7V58Rcah+9bJUK9d/8umJN4JYh+NV+8k6
         FEi2DPow+hlKfoMQ9gyzILmT2arFkzt1NGxo0bt340eT2dy2TFR77eoCGtIsKKCO2jC1
         Pr6RwlKg4UNzzMFK7YMeYIG0kCTh/H+gsclIgtwL1zdZE2hpfm39N41HO4gJyiOCVR0E
         gVfPmZsOtpEC2WQEqdUJQ7XWe34ru4r8vnQT9GRKjPK/ZBSKzdGAHf/pYnUZXSdEJqyl
         N85p8tGKYZag6R/4GZdB4FqB0u/TdE3tiRuyQaQy64QZ49wCwU6ghVP3AAnRv25DfBfT
         F4iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOn5MBBeDh1Ijj4+CNMVetlhmzZb0oHvGIPp3zyTVrKJ2+2gehsihazz5JpkbxLdS7TrAjsOVjJtWo/JM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvqgif3MH0sSI+q+2ED7aHh5BwpZkOni6mcFa19gKZb72XQzly
	YZYnPEHdYl8py/x8trt/ZQN8u2nMouqOv1T2jmoqmipgNsFJ2YQydJWT
X-Gm-Gg: AYBFou293y8AgeeU1pFxvsbhg2+wumPnxMlHI3sKHfGxE32Yuw7yuNnMo8d27kTPQBC
	sTRwsXMR5dv9UjH51nUFeV0JuXHxVxLG454+1CvJF22uwQYn+Rg4UJygyY4dtaB8jQnqkNkDg3R
	eOYuuIAtfXfHuVKCk1Dly4aEfwPngJN1Yvr8cGhgza0ghfBqmZXND6sQPxjRQfvqOvLMWSaoIW/
	h7xzVIHkebAVztYWdcRAnxO17HU5V5gKEPHX7AYyntxlEexBclCphd08YQ3EMs/TSe43Hd8cFYK
	6WSRobzOL9cvUTX2JtdZq3CpP0iYje3qksVmoonLNSEMJ4/rg0HvUUbToVshCwMLqSfPaHZOuNm
	lAbF5gzIQZ0sWfKNy75s1rOp7No9Jm0SR7ThvJ2N8CzLOmImNjTwfP+OXvnA6K34cLT7X5YIzSf
	A102s3hcj5IzCtZfgvHGFQbRBqvO1csmafw7jK1XHxIHkRP88wxfdAgSsUk+A8bBSsD0yb3q56c
	78q28favoY=
X-Received: by 2002:a17:902:ecce:b0:2df:34c0:72fe with SMTP id d9443c01a7336-2ea1dd670d2mr14819585ad.35.1792505021811;
        Tue, 20 Oct 2026 07:03:41 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:41 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 20 Oct 2026 22:01:14 +0800
Message-ID: <20261020140127.720-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261020140127.720-1-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
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

poweroff on this board drops the rails and immediately brings them back
up, so it reboots instead of staying off and U-Boot reports a power-on
reset.

Firefly's BSP drives GPIO1_D0 high while the system runs and low during
shutdown, before writing the RK808's shutdown bit. Mainline does not
describe GPIO1_D0 at all, so nothing drives it and the shutdown does not
stick. Describe it in the PMIC node, with the settle time the vendor
uses.

The BSP releases GPIO1_B5 in the same sequence, and in testing the board
came back up when that pin was still high as the shutdown bit was
written. Mainline describes GPIO1_B5 as the backlight enable GPIO.
pwm-backlight drives its enable GPIO low whenever it turns the backlight
off, including from its shutdown callback in device_shutdown(), which
runs before the PMIC's power-off prepare handler. When pwm-backlight is
not bound, nothing claims the pin; on this board it is then an input
reading low, which also lets the shutdown stick, although that is not
guaranteed on every board. The pin is therefore left to the backlight.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..210e4cb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -327,6 +327,8 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3

