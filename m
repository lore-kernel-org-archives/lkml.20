Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1B52D2B5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690840; cv=none; b=uOzvl2R+ToLLrjVEL4lj5hRhGzNZY50WZIs+TdtnONDxbRAc2lERsjOJ1ySxHpuAYUWLUnJnyP6/VAE4pXt/hZTxKIMI0kd6eSOxvtS66l8QYZmO+d5ApP3V2tsZ/8pOJaMXjpmRXH1Q83CJ0q3qtpe53shGacJGXhouTAR/UKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690840; c=relaxed/simple;
	bh=yNJm9rA62v9MpM3ToST3iGXEFOROWx+UkzYwEQFVslk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKmWD5c+dhT/GlQQEcWDJ/kG9ww7jUskRHlBOwBVjnKlhi7BJHafQ64LwZnYHE3POtY/4SIM/0UGmwQ44/OP+mvQVFtawHnCeOTkU2xdo554uYc8YSIToySYZpxXUy8u+T7swqvWhQE2lOZwrQ24fMjvyffBdh7DB0spKp22KKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sALH0gkb; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sALH0gkb"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso438670a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690839; x=1791295639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=;
        b=sALH0gkbc4rpwXCYFecuAY6zgc4p6x5wk5Oe7OXJcX4+8+mpXlhmoBSF+apwMSjtnJ
         eMxUfaTNB82/GChQ5B7yGZ693m0MAp1esyZc23pimHaxxMqKPkrkW1Q1D5tPDxs/C9Re
         0ErdT0E1W9+NyPZ39Nc0/jceCVbI4qy+kjQC+6sEx6UbVTZsE9nIoi3UHCR5s9+tJn2b
         e9SwxuRgrQ1Xe91hCOblON57yWkeWPrmwgLI8QWPpnMSKy3MjlfkYLdoMSwGUlSINDPL
         Ek+wuBhhMzSerm1S9wpuf6T3wU4w8mt+JSKrwUvFaCwxmWaO6WKOoKWV9mtNr7Nb/1tP
         IM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690839; x=1791295639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=;
        b=E/XR/9diLmB5dcOUTAorphWgfmrnAUkk92ZXeST66V+JWE2ZzSw8X9X7sXLD27dqp6
         jJW772JVA7b/1og/WCEPB6USluEqKntbmF1naIT0uLCiZoXJILBnribaVTLbemes/JJZ
         g114fZTYchxRs8LODFQwqlzxs1mxfOJ2m/efn6VqfqNU0m+o6owXM+CN5epEiWd1MZvd
         uJ51hC5Tr84wbV5fRUV1Fr5yCS/QLluvohI3koJdWkNFHRR2A4dDmWVPUGd4u7DspL6T
         JxC9Sl6IOY6aEP5ZTc6uRLG6Aqe3BbB8aueVIcT6+Dv51m3sU5m87YE/B/OHNNINzZum
         31fQ==
X-Forwarded-Encrypted: i=1; AKwUvByfxebBB45HBNqxHW4duQyDpiSON3h57bCYbgrP/fKWZbItDPfk4sv4ANVVnWeHiqm3qcASnk77T3ukSsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mf8uFptQvpbufOQ8cRgzlZlzyEFh6UVIaQul4MaGlnzirbkxDc
	n67XNf2yHtdgM34WQHgwjM80ZQ/FQguJtQ4Kbcoald9CkJockQPlRsTB
X-Gm-Gg: AYBFou2w6MlUwIWRA/4TAzzijeVgpobrb5qw1NBAEsXvYlcLSIBEUP9mFTVfaj2RnJd
	cCy/D8sZei1CLDxRftUBSHvkz9yL/u568RUDmO2mFygciasaN2a7k33fgZ5BUUw7JcYY73l2xhn
	IIQJAwy4+T2+uN5DBp6W1UH4Vabc37SV4+Y7H4SYSz93gbpM7uYiITVH1faq2tTPEwNkVuMUxZ8
	4T4PzCCZEqCPAh65o1GggwX5zEs2cOUsW/hB9v3JehS5kZmyA75K/ui2iJZCMiADAL7I1FBHdv4
	ccUciZGHQt+OGOIhRagzgdKoPWU2qgbLslWznozfPTKThUEebUGqlh/FRNQ+3lxQ3ZMXTuO0N4P
	jO2wxF3eCXmMOuYxyOxWUifjivHcglkPrCNxpABM8bfDhaHWVWdcFB24iC1dRVcESE2F2Ph3pH4
	nRcguUkuF9lGDqvI+yiQEhwJGglo4UtQaSQ1kj0J4U7iFLCFaaXGPwWu1qwY2BmYgT6GZaiucCx
	skZAoMBZys=
X-Received: by 2002:a05:6a21:150d:b0:3de:6172:e340 with SMTP id adf61e73a8af0-3de7cf3ea13mr1897125637.38.1790690838628;
        Tue, 29 Sep 2026 07:07:18 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:18 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 29 Sep 2026 22:06:48 +0800
Message-ID: <20260929140649.55-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929140649.55-1-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
runs before the PMIC's power-off prepare handler. That pin is therefore
left to the backlight.

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

