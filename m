Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561396;
	b=LMqlnyJKj6F14q9GYSDV8XDsRXEd6QsbZVWEH/q+urIvEIIfdcQG86/u7WhKVizX3liM
	 GBmCBq7zQyn33Sb4BOp6E0Nsz0xSSMdA1K7UBhpEcHmW2NDWg6nC5qUGvF3lKZ6kLdSII
	 mHFVGCg0vbg8TRjE0u78rUvRMz1ZD3MLDqymQ89ZjG6h5cVIRFKVvJ3pqJNO5+bAmORVl
	 Fc1JpKs6kD+K+slQ44rtJFmUk5Q1S03YhCmgK/SEdD/MfHNqM5Ghx7avHg8/Rk5Lfigj5
	 3VdwGVl56UCOu/dQX7nzqh8LumKvQZLCbsWT3lMwpYMEZxjsZDpagETPL5RND3I0AKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AmWM5i5bcYLOfgd6JgqgudQuIbo9gKLsDd/ijE1n9kA=;
	b=GDOxtpZSJbPrpHqJsEZKkFuZSrvlWjMbj8bAmmSVw5Ee5nOIsFgYI8wKWUfMDgXjD7c8
	 GgeQ6xeGkUvsQ9k1MO/axvmnKL699FrvBxkk/Ye+77ds+fIyJpZczZ3dbLFikvkundCvl
	 LjKt3WstWo7QhgApZiY5DEg1SAalWkQQK/qyBzgALwSZm97VzyPjLm7Yjl294LVDY2zhJ
	 GtpMwCq5rik5P41Fj7SZlpcXw5GuLg9e7gmvmU3f+pdGBjaT0NQxksKpgN2TRTyB72xlt
	 WyUkyYUL+ZnUOe1ptpKgKXlh9xRMBAzJD0HAcKVnsGbmjbr6LEMex/SSpq3fZI24k+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXExrATK;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25193606A33C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25193606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXExrATK
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369f126a526so3125860eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561394; x=1794166194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmWM5i5bcYLOfgd6JgqgudQuIbo9gKLsDd/ijE1n9kA=;
        b=DXExrATKhuv2WetJguNn6T+WIyLaHJQ0dzD4VYgImnZt3ZlQUYnYIQSPTA/j5JbPMw
         9kJfqbPAujFTCGQ4RM7W3G3MwPztfRW/t00V0E+Jy7wU7rDRaAY6rJaY1jgZ2ypTgu3A
         5eBTeZlT13S3IHbV3RU/p7KjD47jw6mRGiDBhvioib3fPSPl4q5Tbyoz/EPVHII2yYG9
         w7haRqtHVQvihwGlXhv8sB4IFMfR50bUeNxYAXk3kf4SXTkW45GDup9xMcGcSgDLbpp5
         QCMY4gDVkUiWm8N4aGC9N90dgJIKpSnU0h6CgvuUelmg9xtw1Feab32eSKvJQoTo/bIi
         byeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561394; x=1794166194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AmWM5i5bcYLOfgd6JgqgudQuIbo9gKLsDd/ijE1n9kA=;
        b=dxyzSFY1tR6qNh7v6kSal++K/BF/Wn6OP3wm9iwfqU7PeGQDdq9gDlf2w0IFUTbL9/
         423NnWtJTjfJyPWFD3fwnwLwA7oHjUdJStDEq18hP2O02vxOQDLl4jGC3aLVLD/7OP3z
         YeDZycQhV63ZNEP3YZjxBw6zVA3+SR1dM7NvYBY73O1tCjsnO04Wd/tDNhS9D/a8XcRa
         C5ixyEiRkE+ahSf6nMRyDn8mk1uPieYW2UBlzhcFtzRuapax0j/M14zPDdvcm1Mbgu1M
         7TOp8c3jEo5lapU50fY97obbFbgrQlc8tGFnA1w6Eao76rkn0K9DVrwfhXVbkuu+r3Ef
         O5GQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1yZFZ4MLQDiLw+9+IK8xaOMU0J6OyNUaKxBfWLm9Jl9w1DEyKDTQVb9HyfqcxhZ7XLY0gjlEwDhzsvgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xR15e7UF93zCgoA1ivTyRvrKnLoShjrkueFEUIDuA69bPtFc9
	aha1DXuiFmwQ/w0WfHSps3/AGzNmeo7zcRDDxpRcD5HEGLxflSHObW+n
X-Gm-Gg: AYBFou0LASKi2h40GXcHO++sgVDM0gDN7IXQn7/kyHGG6bqwQlYQSfoU33xnhIEnCYk
	TljgphEnMsS/GQvI4Pq5I62pSTPZQ45T8pAFClx4jLd2Dsv4JQswFOFpPBWtSl3K16WYTnqfp94
	UETBqSG88qp0mchoxxpPg02qRq6FWr65slw3nDWlOkVQiArN8Rc50Fepfo2FHMbBcaCXvMtckmC
	PshdjLwWg/qxpynmJPV+X78dkKmIGEBbWU4sbEIaGJJzgVGavVaFDuLj5v137vXb1KFjvOLfQY8
	wnm+h9ziD8ux3blLsPQ6pm7y3BOciBCNPARpTG8VyTHM7b+QNaptUctPa7HDZuchmPA+xwtEFRS
	5f0zOFdwJA9HOvTqe+dukhzTQinQrQBgP3BYKUAlojjgmqc7fqM+WufWarwL2I2thBiyZAVADWi
	jy+H86/vG9gz/XzGH+bILt5szoDyaZX+uwYb0jAO+nM+7O5BuFEYr6Tdwcf5MnLeA9+o7edT9/j
	83lURFRyySGmUCpYs2T81xsgshN4Byu7otH1Ia4XGO7TM7mjAQEa3bCIA4UXTNPjR71Y1HPV8Wj
	rxXatLUvnnEnI659kGLoatHe4lg=
X-Received: by 2002:a05:7301:710f:b0:359:2edc:e1d8 with SMTP id 5a478bee46e88-36a422039fbmr11538413eec.5.1793561393990;
        Sun, 01 Nov 2026 11:29:53 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:53 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Mon,  2 Nov 2026 03:28:07 +0800
Message-ID: <20261101192807.897562-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
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

When the Ariaboard Photonicat runs on battery, the USB port has no power
output and attached devices are not detected. With the external supply
connected, the same port works fine. The root cause is that the
regulator feeding usb2phy0_otg (vcc5v0_usb30_otg0) is only available
from the external DC input, and there is no 5V rail for the USB PHY
when the board is powered from the battery.

Add a vcc5v0_usb30_otg0_boost regulator, gated by vcc5v0_usb30_otg0,
and switch usb2phy0_otg to use it as its phy-supply. The boost converter
is enabled through GPIO4_D2 and generates the 5V USB VBUS from the
vccin_5v rail. Note that vccin_5v is the actual energy source, while
vcc5v0_usb30_otg0 gates the path; vin-supply is modelled on the gate so
the regulator core enables it before the boost.

This restores USB host functionality on battery power, matching the
vendor firmware behaviour.

Link: https://github.com/immortalwrt/immortalwrt/issues/1534
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Cc: stable@vger.kernel.org
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 7e0a2ab829209..bcdfe76000c46 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -151,6 +151,19 @@ vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
 		vin-supply = <&vccin_5v>;
 	};
 
+	/* actually fed by vccin_5v, dependent on vcc5v0_usb30_otg0 */
+	vcc5v0_usb30_otg0_boost: regulator-vcc5v0-boost {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_boost_en>;
+		regulator-name = "vcc5v0_boost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_usb30_otg0>;
+	};
+
 	vccin_5v: regulator-vccin-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "vccin_5v";
@@ -460,6 +473,10 @@ rf_pwr_en: rf-pwr-en {
 		usb_host_pwren_h: usb-host-pwren-h {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+
+		vcc5v0_boost_en: vcc5v0-boost-en {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	wifi {
@@ -617,7 +634,7 @@ &usb2phy0_host {
 };
 
 &usb2phy0_otg {
-	phy-supply = <&vcc5v0_usb30_otg0>;
+	phy-supply = <&vcc5v0_usb30_otg0_boost>;
 	status = "okay";
 };
 
-- 
2.47.3

