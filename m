Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0748F855;
	Sat,  3 Oct 2026 19:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791055878; cv=none; b=ocQeY/vM9TSuydgz8fvVKWNVT9oR1PlayVepXf65Gp9xVVO77SBEcQm61GkuXfAURIQK/Pa6c8+cPBs4itSobWqCYe8Aq9uHJP86gbKcwGm6CoSxC3wq4pwQk+53XWjRAhC5HIXkrac9vtWyCpr4QZH/R0H0HVkf9zLhzbK3DAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791055878; c=relaxed/simple;
	bh=NBl5MBQEr9r73jdp+lWUfbbnaJnzQkvXY1jrCQq9vOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TzaF97mqME80cv8M9lBa1Mms4M+v3yA9KQebArj0jLt4BCNHjYOspgUafEFidt1MyWmWrK9AxCbdNhvS+/OAQcXQEXCItVMpQwM7I4Ny0WtZ1sASv3HmNnD6uCfYzkIW449WxwYTDP+0fYsmFXbDQA9axQpKifGgeyNiX3muQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=k0xdnR9p; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="k0xdnR9p"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791055874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKQvMc8/mTLRPG1Kp5VBsc/OygCqDeG9AghhS1OUefc=;
	b=k0xdnR9pU/icwwEkxAo90QC+I8f45hCOmjb0zbcsePfl8blkHKQ/5JaifRy1qWxCn8Rd/H
	ZQkA1vKL9M+bRihOkeZoDpHOsHOwXJNPbKJxanG/Pu188wTVH/IuZv/ZFnAQFlhlNurGYu
	IzS5JaZwFM+C2mQXUS1Tf9arw0GdX+VVKVXoSlfTVFMjxHBkkh6dxtPLzkCMOocQW2hQvK
	j9NE5TjPxzDgLPzWiy6Mw/WPuy+HHQSq2mA7p3eDpaXqOLQEYMpOrgfArV6owX+wD5+mbQ
	uLwT+nKLx4DkYMoZ88qM/eCTBUSss6MNl9iFW738XjYlO9E4nT6RPQ5ijjXtig==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fei Shao <fshao@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8188-geralt: Add the detachable base touchpad
Date: Sat,  3 Oct 2026 21:31:08 +0200
Message-ID: <20261003193108.789939-4-michal@nozomi.space>
In-Reply-To: <20261003193108.789939-1-michal@nozomi.space>
References: <20261003193108.789939-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The touchpad of the detachable keyboard base is a HID over I2C device
at address 0x56 on I2C4, with its interrupt on GPIO148. Describe it as
the ChromeOS device tree does.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index d8edbde6ee4ac..3bc15fd132149 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -494,6 +494,16 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	clock-frequency = <400000>;
 	status = "okay";
+
+	touchpad@56 {
+		compatible = "hid-over-i2c";
+		reg = <0x56>;
+		hid-descr-addr = <0x0001>;
+		interrupts-extended = <&pio 148 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hid_int>;
+		wakeup-source;
+	};
 };
 
 &i2c5 {
@@ -959,6 +969,14 @@ pins-gsc-ap-int-odl {
 		};
 	};
 
+	hid_int: hid-int-pins {
+		pins-ec-ap-hid-int-odl {
+			pinmux = <PINMUX_GPIO148__FUNC_B_GPIO148>;
+			input-enable;
+			bias-disable;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>,
-- 
2.55.0

