Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16A3DC4C6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946105; cv=none; b=BFgwFvDirtPGq/9FKRgyRorACxa0t3WxrWe11SmU0fmYngE+peeu/8nhvoeKyvYCVbGZirOLcdMBSo4pLLcpA6O1LH3D2Ycz3UR3u0H9H6geWasec2EbJuKvYOBVBHqbVn3u9IFtdq0WcoVJatqbtZ2jt9yzj5Xy1nZ9kMfQ8Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946105; c=relaxed/simple;
	bh=w1bKyQWKw8iEtesnaXqouFCOrAm6kxtFiyY3O7rUloY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XG2By2r5nyENwt+8ZAF9VKRLlV6jZ4RuJrOD7uu7LiBlZgS9PJxn2mtxRQouiEAPmBdkiCryZxB4PN2G7pwRoKBiUxBnPjVGnWM3791cuxxLQuMhSgHxYgBu2W6HmjcK79FdybrKK15Q4Z8Sae37yZkKUPqyjgK4BQuHKDz4omY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCeKaH1J; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCeKaH1J"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-855d2bfae95so6488514b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946091; x=1789550891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=pCeKaH1JttdvYhBGl60y3e0PfTY4j38fxgwvxoHrXuWHJOnHoJ4+4Y1e26gIO9Tmjd
         W/YZTSHMJFrhUSafmPjJVXZa7DtZ7s05t0AFoI9SI7iVwk69vEpBOJqasB9hty2Vtqle
         uAKfIVZ46Hwl+NG10YCUHmEeNVtOtP9HczoUzR+sD8CevNJjlj6Zf2xBLubLUcKRCeEq
         Y19D9ULkLWkZ2SGJzneKU8oy/NFdax4UN55FH/CRYA/7F8JHlrB8h1wJuib2cz6swT3K
         dZ98C/vcDjdVQJ43KN3sNCjJ9YG6UcFEd+kPpU6br43PnFfxmV9/RkICcxfQr4F6cr4U
         ddEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946091; x=1789550891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=gpH7pF8OQr/RUra5pkEtmbDLit47pUc/34z/ji6tUjjHHhc8f4lspOL2YBljvjc61X
         sxCIoV642ZmMuHpw7kNQBuqpdky3ufCvPQvF+ZjgN4/3pm1HQLcBQsI+Z2owehewcLx0
         2orsSvCEPXg/c64Mpat2KaGP6cLsqgAjcePbtGOMvHLly4TnFhRnps+7iIF7xCzpvrHW
         A8W+AlG890PpvLvZ6rDCpMXRuIlXKAzZHd5uco/5VfQX3usQQe8gmeBhD15+pg0MX98L
         HIMkmBsvk+Owi9nZNWrhcRd3a/kPg1ygT6aLNRL2xcVrx7A2kl90unvVM2qAYEnGQAFO
         N9Qg==
X-Forwarded-Encrypted: i=1; AKwUvByyEkpNs5v7Pk98Em66w0CXEJNsU+qc7KxG6MuqyzCtcySRES3HRJOj4hEYhcgpQsP2d4s7hgOi1AQd8fQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n41zR/Y/Jjjbyv5xPHABQop79cTbS1F/VIb1a+alyPgusnHEdg
	FxprrfCB23Z599SOhsWocv/AAkW8w5RC+YLyBjEJh5oLYTq96SK49ljr
X-Gm-Gg: AYBFou3Pz9odm6bVM87j6NY1V+QTco/26DfLS2csZz0G59+d4gRMlJCXrFJLRk3qwXK
	bNszRBCwmHJP/iTRQGGVbhILwzJRrkVHI76Uu5rjK17faTrR/bl6ziETGWnSZ3Y4lSwpYml4jtg
	nA/CD7NPW5Nc3z4tGK0XLs00RaqsRJQ5dVxp4+7qf72ofYLoIWfXOLkIpMO+yAtQReZ/FbGt5wp
	WTIgUJoYTBNiSqtsh9A6rQCfveddtREY3TAMldHSLpuhCh0ZPfzJkj6dFJJrLp/ET0cnjeQFmbz
	3/lePERSPJMesItjledoicYP1nh4xn+B9w2sU42f/OPJG/iXKMaXp/AdeYsY5WydWPT7dVj1h/j
	e4cLFgCGzjBUurUgRcOT6SmlKG1Vgmf2pc+LdIUfsAe2miKk1kwH1YTqnKH1wBFsJp7vbGt4grM
	T2pup6TCkN+tUDVXXxn+f4vAJvEiO8y7jpKvryMWCp06kk2ZMarX2oBBzP1U+vE08D1xdGphb7l
	C88Ois3JdAG
X-Received: by 2002:a05:6a00:2d0d:b0:857:73c3:4468 with SMTP id d2e1a72fcca58-85ffeadd911mr33200033b3a.23.1788946091221;
        Wed, 09 Sep 2026 02:28:11 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:10 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Wed,  9 Sep 2026 17:27:28 +0800
Message-ID: <20260909092728.1859-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
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

Firefly's BSP drives GPIO1_D0 and GPIO1_B5 low during shutdown, before
writing the RK808's shutdown bit. Mainline does not describe GPIO1_D0 at
all, and describes GPIO1_B5 as the backlight enable GPIO - the vendor's
own backlight node has no enable GPIO. Nothing therefore releases either
line at power-off, and while the backlight owns GPIO1_B5 it can hold it
asserted, which is enough to make the board come back up on its own.

Describe both lines in the PMIC node and drop the backlight enable-gpios,
with the settle time the vendor uses.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..75b75fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -27,7 +27,6 @@ chosen {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		enable-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pwms = <&pwm0 0 25000 0>;
 		brightness-levels = <
 			  0   1   2   3   4   5   6   7
@@ -327,6 +326,9 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>,
+				   <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3

