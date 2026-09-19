Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C4E3AC0E5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821006; cv=none; b=KVi2JsEUMIhXEi4Eui0+Zg8UYlost4ggSf45PVGOkj+Trvsw8UP6fx+IWWnn0Uo+NBZqvdCJX4+dHlPPdr57f0IcYOAlrg4BIo/1XrT1+NDmDPTffS84jf4+S0PtZCLR2tLJ+w/kox1eNp3v0U1TKz+dwqMvAOzvv+XTlFiFSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821006; c=relaxed/simple;
	bh=w1bKyQWKw8iEtesnaXqouFCOrAm6kxtFiyY3O7rUloY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TN/5FTOnZD5WntaJ0dX1ZpHxWya/fyqlmv3onTm345cmwZDobcmZ/J7UTBu2izdxjy5nnBWcT2sEGCPY3TwNM3Vs8DVROQlQ9ovZA0X5wqD2mTy7kOWMalRWyl5DsDiHDOXCugU8+VhgbQpJmJc3l78OadPznCrfBhroHRnPMW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6Xcy0MB; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6Xcy0MB"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so10638265ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789821001; x=1790425801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=b6Xcy0MBqiT7yGp+DMlchFUW5GGK94WYqJYiZu8WQvV7PdCPUdD96OLbYEHNk0O26a
         YW1p98MLXb8ayPec1snGJ+G626xJmMzpe1LKm/LBgRQ00eUSaS9CO+bcndn4zmhr1cFI
         7uF5hPGMOyBrXQPElJYOMuc91xiM6RMYh7cI99FPXdZvnkQ9/4EONbJqv8SBaWdcH1Sv
         zi7VL9wp574YSOU1HsoAQUCaAKmJkt2S6duS57ct/aPc4j4H7lasiiGSPvpgr+NkyiR6
         MNafdSAQPb8zd4znrnywqU4EH+veao9gMtiPXmI7CCVKSw8eHzLtljWuPJYIXRyRRltM
         BQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789821001; x=1790425801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=SnNGn1Kk/0lNO3eM9dtkIDocaOYb6r3KQK7HAPgVuhdoHp2ajo1wKIfW0Fk5wjm117
         qsBB1OtbG8LZ/iUgKXvlvZ4MCGCyvktcW9J5XoO6tuqnYb0oTi88rJVrffZz0yPper1j
         u186oPwIo7ldPO2lLB2YP7ApDTKk+f3i3LJcE4H5ZU84Mx4/Ptv6N4v+YLW0EaUPJlH8
         aWKCnob1VBJ1gQFY3YL7AUdUqqf4PS4ZZ9pXOP/wqeylCmRdTU4YqgbJjyzHPRF50JY+
         SHkdLq5awp0xZ3z2T/1nUOZIaqBiPdA7c5bftD9kEozWXBRSs0oqIgI5a+vz2/PWkrZX
         o2pg==
X-Forwarded-Encrypted: i=1; AKwUvBxZJby3dKEBft6O3WGTg7Foash9+myb6LKyzjlOU1merrxvuABA8Di5vUnZ5wKpqrJJ8W9wqBaUNaqcqTA=@vger.kernel.org
X-Gm-Message-State: AFuF++malncwnVsAZAA5h3QJW0zmLKZyhppv8s+4huaT5J1MThG02oKv
	4ViXrOa/mOOciB75mAJBAgBrRI9sJ26NWufaqPpTDemjoQF8CwhgrJ5l
X-Gm-Gg: AYBFou0PiQB3mAlhMo37ytF5sSDZb2t9+V2Ef7VPVzoHUsPSFbYBcZx4wWxmp6qDptg
	XdVigy6WqKgOHEgwTjJUgsA+IgkygmAML/uUjZ5aLWhDd/6+sNccRXmLTmcCg7LMhGeOSJp3TE5
	h86B2shVpK9rW1hzNkRF4Ecvq4sG5F3u6pLJOnEfxzVzK3e94aiHj3haEdVh7pH+bCUhMhyvb9x
	OP4q0RtkBt5LIYJDhukNVSss8FAyGOptQi4WqPFcoM5+xNqimO2K2L1YkOg6lmUep8JHBj4VLAr
	cVUepjJ1NFjODlN9HTqczG4MkTvb0faaB9Q6nF1XIMFbma50BLniLWdoyWLfnZBFWjZoWffz7zF
	POoWUITeJNFN2QfLjmZacHHD1N8xUmTygtHI26yM98zZqUF/Y8T55LBxoIYmzBu8n6byRsyGixg
	YbIGMrQP58mVtGmPNNYfmBPPKjZHaB3tge7wxQ35UYat0xWDimjLA5MDlPKsPv3uUEwcu/9nISd
	sCE6kmeTsA=
X-Received: by 2002:a17:902:e946:b0:2dd:c0ff:e72a with SMTP id d9443c01a7336-2ddc0ffe9a0mr29054485ad.60.1789821001018;
        Sat, 19 Sep 2026 05:30:01 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:30:00 -0700 (PDT)
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
Subject: [RFC PATCH v2 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Sat, 19 Sep 2026 20:29:30 +0800
Message-ID: <20260919122930.1418-4-yaozhonguwl@gmail.com>
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

