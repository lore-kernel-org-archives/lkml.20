Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090757;
	b=CPk2xOHDgpFXOa/HZBLcXQVP2YPW3VZ4HUM+6LnyQLQ7bMF8hZqyF531Hsk4NZo3ygpa
	 ACx5i/ylwrZ2nzGF4FNX/dXvZR2y+xFElMoy1iB9Mry4Xmkwce7wq+/lHY1JP2XLVnY+X
	 eo9mjBrb7snxmC3kWlbk3oiQfR6PWBdaInTRqFr12F/QWDEoztATKRJBSaPCV0tED/CAU
	 xeZeCdYpzce1zJSlWNbaEAgneO5x/6qe/NTS+ONQHVDfMDh3EfldTVSrtGTSzAHBe+03D
	 oBsFcbiLj86tDLFow27NIe/XEChbr5ip1fOb8bSuRuZe93Dj5bfU4i+QjllFKUlXShg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
	b=kp2Wg9+LZcFBmJJ/cNlz52RyUUBJpICAAL+J6ixF6iFRkcHVP2S+Q9foRjM2MONiZHP/
	 IoRJDSyXAYj0DredU8Ic/uLLyNpdDF7CXNsYXlm45Jmdhv83SRSDOVMZJ+c9W/IARTuYR
	 TwpWXTj3yU8N/xddewesj4GuJalt69jg/9v6ox1X6LtquFp/DGvAn4/9gmN8Uju1oQWXe
	 x99YKAwMWSlq/q+c007LMOaLFNenuB7CCSyrFfS+kh+9ASpW9h51HdALoGgc4iq06DBtW
	 /fzAEb6QyLCa7Ff62UHXD4lY3vlsSovg0/OmZU9jg4siLTZz9ZU2kH4BA4lHVc2Z+tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mjQcrcv0;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C71606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C71606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mjQcrcv0
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so1721644b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090756; x=1793695556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=mjQcrcv0zqwIVdk3DgRkBpMbLX3iyPKlyLrfzbTjC0Itrdc9QqJXlIF5+Y2PG35ZOA
         FOY+JY1Tp+/hLwHzaa5yPq39tEpxCPxAgEGMP3pedI6n7nJImKcG/IPzx80z0dFlikRB
         vVDsFMotHgUtDe4Q1/uqPQe5Pr6An6ckfZy7mFMnyRQH9Url5Nn6yEFixX7D0HbgRoEP
         cYnXycIorMr26/GHofqKVN/rpFKXZctXn/rajXF+nmFNgJOa3uKk/TPBvv7UXzNr5ZBN
         B1e0g/EeprlYMY9C+4AEnUPcaz6+4ZHPmrzOvRf0b8CDh1O57DvBobxbaJdrx3h/DgwT
         WExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090756; x=1793695556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=FcT/3asZHDkEQ652bk6z8AXqr/zF9hD43JHhLKGYBsrTqaJbN9OV0re4ByF8PmZ68n
         gYepBrFy0BjKdkFPwBo4WA5pg0+Ue6cMfjO7NdoPkggX4Irx8+jDS1ocFwkewy8sxRWG
         zS52kR4oAIQG8L/n9y27ere4tz1njC/24VdnB9M1vbpdcMrAiCjknI9378zjdgkAzCOY
         xi8q9Y2lqcoH2CAGr7E3gCIZQTuEFzXZ1384754rM1/mEG4oRv4L3/Lowdir5VbMekje
         OInx0evfcmoFQDuL0eBnLKClHWR97Tbq63hWHxxthVAgQrxV2qzg0d0fXVI+qVI5+dSU
         smsw==
X-Forwarded-Encrypted: i=1; AKwUvBzREmdbiNxdX6ohp8vnPos8N85aUHF3DWXJtw8xSTtC/G1Fp2Lv+9uunkpSh9lIj/Xc0xThNzp8lfPOnpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+Y9FoVhV/cAr3CX6hf3Y0jqOts4MkS4aNgVB501tGpcwLM/oJ
	r6uWd/GbIdOPjW3SN+52x/8lVU98c5F6to2aB3IMmXicBa8fqtn65gQn
X-Gm-Gg: AYBFou3+76ooBrezGzsMDkmYbx3DZ5btj+wpaZ41vS6D7SHYCh8CWKaI7gqVUK0qsWc
	v5ZSvc6p/aaH4AlP0/l+ARdEKZn1h0Vg/sIufY5sNXarV/VL22ste+Fhf2dV7YN12IpJwibjazG
	FhdSQZrgkTq/lBe5U/BaIlZ7HL2YD5rNj8yhvrlRL1/tocRljA72oc7ahJigUoSKmzIESFw8Q4z
	pRTf9sESmhjUvVK/xUPlRGXxXXQ4QgUv3VHyQ4YxLO5tgvHE/sh62R9t94kcA0kJDZENi0DZCx2
	3xib568aKY96hRVVPQNqbmOBtG+GfIW0ab844kiHw1yqajIsbWexgYATVKZs9QtS5bzXQL43/zR
	Dsn9Li+h6aN12YB3Ylqi+wrJgM+HNPl2W3uANmLoqmYkmHEFjlQcfEBgM9DrUSeX5lAEzn0weFF
	tXhX23Yspy8cYaFd7/O+ZXVvumrOPVUmU5SFp7ym3ZJ692mi3nHblqn9G/N5zSAe9pZp7dmD3Nd
	+Fg2jCHJtxHwbXkdJ6+lQytfyRqNfngHW+xgCyYDnTSUfOVZldpO/t8MtHGrQGggsgDTpsuAfyx
	Gdgn2xXdkPaK5+aCuRPhVkPrhcdnSyaUNs3+sBX8XMg=
X-Received: by 2002:a05:6a21:4591:b0:3e2:8c70:6d13 with SMTP id adf61e73a8af0-3e7cd51a7a5mr7982940637.71.1793090755759;
        Tue, 27 Oct 2026 01:45:55 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:55 -0700 (PDT)
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
Subject: [PATCH v5 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 27 Oct 2026 16:45:09 +0800
Message-ID: <20261027084511.1992-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
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

