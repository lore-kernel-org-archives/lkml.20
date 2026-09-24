Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DAB3D6498
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234102; cv=none; b=XGrTTZqk/q7gfzjv9ziwfWZf52tsWp1OG7YqGfErOAyDTgPq+1qzdb7F2NMiSTdPbi8Yp56bqVgVOHYsyLosgdcDSXn+7dv6ClifWJu9Pe+Wb0+sCUjFV8e7ZBY+o/w391nzA5OT6nbJHq6K/dO7Y+IBj+Tb8fffr6k/PNXs8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234102; c=relaxed/simple;
	bh=Vkzk4N4Z/QtsUL2k5QK2nQqx/bwXtDFKYCl50lmWtKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KhirB5+U0R7oOT/9i7o2P/h3fHgGXamwjfoCNu/OExSXBRh0HUylGxpWHoHiAzfFngw866l0RZ3iJqEPs8cIBM9GnRqsihO5m0c2V8p/uCCWXWmvShMKV76LUMX+9Y8QEVU3dw7sFeRfd31VwGNkQRPZdsFyZ4Yh3B6Sa7ru/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=tcEJFp5K; arc=none smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="tcEJFp5K"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso2091756a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234094; x=1790838894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7STxnZVUQmrLVyWonCr/WVFvn6ySKjnlDMhE0HDJ/pg=;
        b=tcEJFp5KscFe2dnwwqD/+Dr1USwKa4BYFLx8P9Qo+bEnV+SaFiIYrzn6hmiotRciv+
         XJ0aH1OSMVj1B1u532BIXDYV0K8L9ijPR5t7fqxTP7HRB0zteOVqbIKS7p4G6b9KD4OW
         E5v6IMT2FGEzVpIS/OWGT8us1SyEBxgvIWKPAh90uHszvfsh8UQnuse3bJjoTl9Mso+q
         NU6giRRU35+0LR/mYeFCw38JdH+mWQmCtYYtP/vuQfse7PZmeTBj2D9AvzGfdSPE3PgL
         ugYmpsmQC15PW9C6+Pi6U+cW3sSbMn5RC6gKJ7w9u09B1uSYkGBJdOGNgS1x1XCNDsJc
         XsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234094; x=1790838894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7STxnZVUQmrLVyWonCr/WVFvn6ySKjnlDMhE0HDJ/pg=;
        b=tHmzHLyAJgroyfbFS6XA0wNJXooeqklu9faJsCCbnA+qox5/wK7KRWnBXi4EhQgrgn
         HIy9YXJXMJF2p3jExg+sMvlxVkCuqK3J6My14l6C7VsxvRmFxav4G+uwKYC8FooUxREZ
         v0Ptf65WuYrHlUp5e961VTVBdsES+Ty/zKums82JcksVgdKl9lYvw5b5MS+RUWDdxNjr
         FTah41uAGvFRSKm4Are7wgceaieqHkDj0LXtrhpYowHfmnpvAOn9xXfXBqtpdNhf2B+H
         RllwUMRSzQVGm45vURaBaG8K7wuvlrwIKnYNWqr0CxFH9J+THa2wEoHNL1DNSEQfVeV9
         mIgg==
X-Forwarded-Encrypted: i=1; AKwUvBz1loAuGWKkBShnbURNI7n7Jy7JwK/ftcZlItU8yEcz0df+ZjHi2OQ3oO8aKvqfHOhoKyLPNb4Rad8WrjI=@vger.kernel.org
X-Gm-Message-State: AFuF++nKmQI1M5BdBagqzgJmtZm88eeU9Ry2Mvq8/ipJ+6rjyKpEqVYH
	196l9EYHWpt5NGHcC7QlEhsL1CMTkoHrBbiWbI2Ggqr/CdQu2xsoT7kmWAFrlz9CanwEel4XS0p
	ClsCo
X-Gm-Gg: AYBFou3dgcuhrKfKo2FjLHZ6OehfJdSKmsHIHJU+l7qsmN96LM4l3reYTezHSUphd9p
	9xTeu6Myno7bSyCtpSfBmTxWvL8nS8YaFTBX+u668qVBenrYJBys/0zxKsT6H+efrTwBZNAv+FG
	7BcepDt3G1w/kWgGqNmVMFPOhG5mTyOhPKu1+wpwsWvdpxBsoKfbS+jjYgSrZaZZWGN4x1sDOPo
	tfUhGDeT3mJmIzPJtSLUn9ILrKbk7D85EI5cPuYDl60MWyvucHOVwoPoVLPWr9Cf6PD82LIg7Dv
	aJG8Q/nnnRghItTsf47+cXwjf4d3ZGNdv1MmP9h6EMx5+OU1Ip9tb0Ob1kX74gUwxQYgMXlth4g
	BEC4hJb/Wt02CgUnMN7nkTq+rMJVnYIyRZ2+Wulq82HJ2DaeCbRyXu/egMq+mKG/gUug/PboBJG
	FBo5OZYpSQutRMN78yB3ICeF7icbZwsF2t4Iop+qAf7i+L/qJURiv9jD3xh+nscXqytFZ/NhqEX
	VvUqbh8IlJmgPnrr/Pqp28vf/ZHTuKxxSBl915tQxVRNwPDcU+i9VDBzg==
X-Received: by 2002:a05:6402:44d0:b0:6aa:a040:cbd3 with SMTP id 4fb4d7f45d1cf-6aac8ed4399mr891513a12.3.1790234093718;
        Thu, 24 Sep 2026 00:14:53 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:52 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable M.2 B-key WWAN slot on Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:44 +0200
Message-ID: <20260924071445.441822-3-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924071445.441822-1-adam@wermuth.pl>
References: <20260924071445.441822-1-adam@wermuth.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M.2 B-key slot on the ROCK 3B is controlled by three GPIOs:

 - GPIO0_C6 (4G_PWREN_H) enables the 3.3V supply of the slot, which
   is generated from vcc5v0_sys by a dedicated buck converter,
 - GPIO0_D6 (4G_RESET) drives the RESET# signal of the slot,
 - GPIO1_B0 (4G_DISABLE) drives W_DISABLE1#.

Unless the supply is enabled and both active-low signals are
deasserted, the module never enumerates on USB. Describe the supply
as an always-on fixed regulator and hog RESET# and W_DISABLE1# in
their inactive state.

Tested with a SIMCom SIM7600G-H module.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index ad9a91c0d0d0..908bb4425e81 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -98,6 +98,20 @@ vcc3v3_sys2: regulator-3v3-vcc-sys2 {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
+	vcc3v3_wwan: regulator-3v3-vcc-wwan {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wwan_pwren_h>;
+		regulator-name = "vcc3v3_wwan";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vcc5v0_sys: regulator-5v0-vcc-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_sys";
@@ -220,6 +234,24 @@ &gmac1m1_rgmii_bus
 	status = "okay";
 };
 
+&gpio0 {
+	wwan-reset-hog {
+		gpio-hog;
+		gpios = <RK_PD6 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "wwan-reset";
+	};
+};
+
+&gpio1 {
+	wwan-disable-hog {
+		gpio-hog;
+		gpios = <RK_PB0 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "wwan-w-disable";
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu>;
 	status = "okay";
@@ -655,6 +687,12 @@ wifi_wake_host_h: wifi-wake-host-h {
 			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	wwan {
+		wwan_pwren_h: wwan-pwren-h {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pmu_io_domains {
-- 
2.43.0

