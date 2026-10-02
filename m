Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2315829346F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 02:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909874; cv=none; b=Q9tLJwcAHSZOhGRFEiJWs6X0TAV7+Nutlsdt0ru6QBZ78XeOqxUM+/VLICNrrDkRYtoLCipD/ipwYEnRGZaMjbKevwoMFSHiI6ChrhR4g57A8kBGh4zTGSGAEsT0g+peVpzGqVIzRU3ITGRsgTgNy6sBhpC3xbYgliy7LIO5nbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909874; c=relaxed/simple;
	bh=+rOznpuunXemMw6GDovaDiUAZaCGae3OqVN9WboilTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kWx21aZU0nThxYrLqUUI0k2t3/QKLqp+9GT1w3qgkllBZ1W0LtiYp1u3HHXPgJ8f3imEjqDJLvSvt6n04aVTfykuxvSOwmkskmCE2Ey91m6Ut/5qXJPdbJbzD7bB/WQBT7s+UNX2FyWyuUh2ug1+E8UgwG6XktyDc9gDkMldTp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=Tq5yNamq; arc=none smtp.client-ip=209.85.160.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="Tq5yNamq"
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-5332bc442ebso1285081cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 19:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1790909872; x=1791514672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8JFUeE5MEiIb7ITcrTZk76VTtK8zyPJORxw7JyUGnA=;
        b=Tq5yNamqAcDJgcsgn1p+AbUwZBolXqKBQFBmvw7EBr4YVjfxtl2F92xwj1Ml7pgLwh
         j7A5iZthbWJ1gdvDIWhmAwDRp2nT8Na89h46yhT9ZcssMcZ2Epg18MOskVWBWe8lzSGC
         W7OBW8Je9aIYd3uoOPOrvxfvx6uUrYRoVRle/alttHmm4GQ2YJMHhbLiU/thQSKvqV9c
         l9RtvnBKusu15m/QLebl4j/CM3mzGvhuI+jhpehwNJAa3WW1xWbjMsjLEOBZgC4AfuqS
         vS2PpObGOqkUt3A5Y3uT1fN2rNOUoJLL7JpuL5TVIDa+NRhIE45tfSeJEy753mB0Pwj7
         O5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790909872; x=1791514672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8JFUeE5MEiIb7ITcrTZk76VTtK8zyPJORxw7JyUGnA=;
        b=EVyw0RGEvhv468N/fxmVNYhWuWAOOrrVV8/o4k4p3fMfHCQ9s6lS85aCQWI8cjtHKd
         4RwaYkCN8zJ+V+RQ+ZB0ED0Dfe8m/x8hX522rdyFtpackd4PzEQuLNlpdRqfJrF0k4rC
         KPbe/I0hqi2ulvFpnYi6LXaO3xI6nTXPwI+0xRu9r93+19paQwg6qaQhKcTCJJ1xZaqW
         VViQYF+MZwI5bJtopCKQkPotlG4v5kvURsrzj/HBq6gFF40bwNBhp9IJIH6ocH5vEvAl
         p+2a7XuzNaom2Ahlsa53nhF6s2XcHHJMsGAOahfmlqeKERHCFMA8qg0ziX4A+9u1XzfQ
         zP9A==
X-Gm-Message-State: AFuF++li73N9kLfgrdGZNr7oXnfL1Hfqbn+HNagJoLEiMHjU/JxxxXPR
	018IH2ilzLFz/a3u1TeRKecGLveuLyN3PTECu1/l2BC14f1Ym45V4RAqCD2CTkzwTGQ6YawEIJS
	YoXGq9EvQX5b6q8AQvbJ4JwrXubx0ly9Ke1wooRCSZ1BD
X-Gm-Gg: AYBFou2a44wlmfJkwpIAF2dzmmhtx4tFnQGGA6xTglWDrA2lDiwHqNHssdVe2n65OFv
	dHm45tuAtKvBUNLyrlnF+lXNnoRExj+bsdOGbVGpSIWofcuqoQF4Xp/4ab3LQg3v6eDlGYsgdbl
	E7GRz9c+/9Vp+aXzwsnaPY05lRIpudcR3Lbi7sbyxrCjYtBexs27cTnMZDUhwykQARhHKGEBt3A
	zdcDBChZd5rQeOocDFetsnshueNcdBIXdP9JYYI8Z+WzFdCZZDThwlfiya793c6oMKYeip4MGba
	j++/edRJulpMzqNpk2NrnHzg0wvvZ9arUDlhsjHf9W5b9iiU7GF3UXs5u5JYxUnDyFafxjUAerE
	ZwmeyLC5bYFBl7ptKUfDpkq0=
X-Received: by 2002:a05:620a:d8b:b0:93c:c987:7f70 with SMTP id af79cd13be357-93ce7c0dd2emr226556685a.21.1790909871950;
        Thu, 01 Oct 2026 19:57:51 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93cca1ea26fsm54885385a.3.2026.10.01.19.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 19:57:51 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexey Charkov <alchark@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH] arm64: dts: rockchip: Use GPIO function for PCIe reset on Orange Pi 5 Pro
Date: Thu,  1 Oct 2026 21:57:46 -0500
Message-ID: <20261002025746.3284691-1-dennis@ausil.us>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PERST# pins of pcie2x1l1 and pcie2x1l2 are used as reset-gpios,
but the default pinctrl state muxes them to the controllers' dedicated
PERST# function instead of GPIO.

Linux happens to work because the pin is switched to GPIO function
when it is requested as a GPIO, but the devicetree should describe the
pin function the board actually uses. Bootloaders such as U-Boot apply
the pinctrl state as described and do not change the function when the
GPIO is requested, and probing pcie2x1l2 then hangs.

Add GPIO pinctrl nodes for both reset pins and use them in place of
the PERST# function, like other RK3588 boards do.

Fixes: f47af8ebbe53 ("arm64: dts: rockchip: Add Orange Pi 5 Pro board support")
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
index c9679bac1db7..783675337ab9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -188,7 +188,7 @@ package_fan1: package-fan1 {
 /* NVMe */
 &pcie2x1l1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie30x1m1_1_perstn>, <&pcie30x1m1_1_clkreqn>,
+	pinctrl-0 = <&pcie2_1_rst>, <&pcie30x1m1_1_clkreqn>,
 		    <&pcie30x1m1_1_waken>;
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	supports-clkreq;
@@ -199,7 +199,7 @@ &pcie2x1l1 {
 /* NIC */
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie20x1m0_perstn>, <&pcie20x1m0_clkreqn>,
+	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>,
 		    <&pcie20x1m0_waken>;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_eth>;
@@ -223,6 +223,16 @@ ethernet_en: ethernet-en {
 		};
 	};
 
+	pcie {
+		pcie2_1_rst: pcie2-1-rst {
+			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2_2_rst: pcie2-2-rst {
+			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		vcc5v0_otg_en: vcc5v0-otg-en {
 			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
-- 
2.55.0

