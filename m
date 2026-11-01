Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547685;
	b=ZB394adBBJSn3c166UZQW0zY4Jf0HKnndTehXZkvbMaw65iTHDQxWbK5v4nIVEZaxdqA
	 rY1vb2D21ewu4F7zUTcdnKb/7jpSq6mQlL/T0IGHD/1BR7U8AXhUo0rPDUXudY9g9RUCN
	 qSzgEnzuoRfu22g41tExjOlMUSynP6vDMW8C+BSFvXdpCiXxQzyvwdKcAvhF2njQPsWfc
	 +NDKxH287kzQQz1CpYdqOlm+ArtzhRr7vX8zfP9AHLlR1BhkffjAgyhmsZTPlh/l/qdGO
	 0hqH/oV4uhiK8/edcB48E0faIHZ452vMsok/YPDVzBoXenohGCOi4UtsL08z3u21q0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
	b=x9ZcuLO3jGKspdd0kWCC2NGja74+NcgRWYiET1QNf7bRHi2lYdg547SfSOAjsWTCK2XZ
	 pzXtUArh0jt110iuLzzFbwOXEX/lrpejKYwBjnmhJmkAYTeerkrSPvjYYtaMDwJO+gM6W
	 8koxQ3n1ABBPuS10j6S86bAltf90Ge4n9xvKzQ15dRa87ZYNlZLF1NP16GpfoZP9CWs37
	 0t2EJSBmL1tsaUntf5pqSfrTOdeNVIqvm5Xgsiak/puNpvg2zGyAKZmT6BfghG04wglIX
	 chikmvBSuRcVqhFN1bffjVk1zLONvfn4PUDDV+zWCyZRzO8gkyoJpEP++ShxAnaa5Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VV3qMfNz;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30A4606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30A4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VV3qMfNz
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1624982a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547684; x=1794152484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=VV3qMfNzQKSh8zCkNln09GFWI0Fu+0+4nHzy79620UCyoUIeHHzQIcUbU2UZE3l5ut
         GuImuywcdc36BIbF2cY1J+n/t6fX+xOfBl6xvUiukpybl/Qv92PBGsLfAUDx0aNrv2AF
         xo99Qojo5vH4QOdgoH7DUfglO2bCtO0ZaLr6Ux/DPLGmjwKVkH43nLQC3FXxZ3Z/fJRm
         8ef3WhnrTd2z9kaP4XhcsG1cY9NatTAaLX8ET8sFyIEVuBM5rU1GTi+tIyFmxyZwf5YP
         iiSPmfLhkLh7pusQVlt4R2YvI4J9DIWdANrzNSaoUtKnCzbx7LFBcruqTA1A9hkmvxFa
         VPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547684; x=1794152484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=uk1F9Yq3m+72XWRrN8QWSksz7ZYuhtSRpmqkIcZ5e4ScnGPK6RW3eDn7WRNnm8hsc5
         aaJUQVKerkO22XNMMg2TqtEvR5k/C5HxZ9RAW5BsvVhUzjwphJeTjrbEKHOjgOtRb9c7
         8zPZwqxjFmZ/OrysNR4+MRr9diZRVNvXLa+jR5tjBzqJ8l8b6xlgBwsQTj6v/gg6y3ey
         2WCH83l9K3i2iRSfHNxQY/dX0HUAhinUyH/2Cs7Mk/08JWo1f7vIgDqiN1gT0rE3cqap
         y7ZKc74mKYcaiTrWCijBE0GLCv+UTv14rk7v6gXq3pKZr/TFjDrU80Qqqf/t9LclgHuE
         Q8Yg==
X-Forwarded-Encrypted: i=1; AKwUvBy+DmhiLSB2SOhxPxMi00+62j6CPn6OPALL6TcIueOrrg22Yu5B880F/4AXRNlaUMZVlj1M1cyN0Q/WEuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kEqgiLFN+MN/zB7xi2eky0Pqh035NvY8DQCUmi/+2oWiExE6D
	0NJP9c/G3KnGjb7UDGtuv4N6pk1i8xqZKouwWFbUdZ10eRRUZzn6FBps
X-Gm-Gg: AYBFou1h/MwmLt2npGFGJxyddUQe/p8QcUvfkYgfdieOaOsGGtuS13bYH9a5N5SVRKd
	NwvzFn9CtOmQt+mRzv6MCyUKvpEsoqJEFQ0wEZtgIes6PwnWteOiJO8DzVqLTZXIloqQ8hbw3AR
	+dhvxdGevgHncqOAXJjfzC/USyXIHwVHr7PRjY76mNpNJnYd7BR2/KsbJmwxBA8uCu8VkI/jAQX
	3BuAA2CcnYOcxpyrR/rhzHyFVRqigKYwDRkAAg7f6TOvfYEMYUAfv1PE+XZAXjindVtqKktl5Cp
	MOKvXRgritMvMrcjy8foyrH2MZ9HXpC3/sZ/EGAS9VZkW5uAnNA9H3ll2LBi0q/K35XeojHPr8M
	7CGrRnFhKs9zmFTlv6unEAUMQ+YEL81C3hizUvjZtj7U/TJisVS222VX1vuOcBeJ44U2S2Lv0sY
	LDsunR+w956Uqs4ea56DRQjH4bdobeiaT627X8AK6C6g1qAin/K0bzOcOx7YGiVr8tpZ9dB0S6N
	I1FSAJjlirwL1zl+v7pEmFjkhUF1qWiz4wD6aTja5eET2wGRd0R0xHEiXk82bxynMBF9kMe+3jh
	Y/5K84pjex0NARdqBVVLSI4sPPJJEy7feOkkGp/6kA==
X-Received: by 2002:a17:90b:3c8c:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3ae8983126bmr7130051a91.49.1793547684390;
        Sun, 01 Nov 2026 07:41:24 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:24 -0800 (PST)
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
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Sun,  1 Nov 2026 23:40:52 +0800
Message-ID: <20261101154053.3874-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
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

