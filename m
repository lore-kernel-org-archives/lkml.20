Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703117;
	b=vZxyk7EkOe9Rn3V8vixFFkQ/Z1gND4X7KlKsPq7K3OvEl5Yf0P+YvQnmBUTte/eH/Ti9
	 LMtFNo4viNWjohwPPXTppKMHcWh3gOzNmQ29KlmYohUFRhtKCRXPpwFylud984AHSKItZ
	 YSPTemnSX7D29ebLgscKO2koduf3Su0cGq+jTU58rwkUNOf9z9NQGqZWflhBXXW28OQgb
	 ArJyEZ6gdYHvlk/9KxZnjAzO+yp74VUEoxVgJQpLH4q3aDcYkF4K2H4HQcUYi2LG6iCtF
	 e0qM55IqKIEyQAF1l4+eXUGk49NF1FRy6czYEQUMhgKQVNnhqmMcaOWlmJ/FHYdRTgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703117;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OzgwCIwWShDidCYfodpLoLuz6ukZj6iJTfhH6QPwT0w=;
	b=TNHP6uqHERLG/6ydtWoLwoFgWGELEZlJtKOyt3l+ZAR889mm5o1uak7oKdQO/L17OHMP
	 NjV6c80YB9m3acGhDk9sylLVxB1An3Ry+lLTybTVgpeFcijA/YeTYGsAB7hR7qjYPdKF9
	 5trYIC8R+syiHm24sSbsyS0ZtnfI4NFN0BW8XiiWkZUCxE6yFe95/5YDkx0KkQZDjMjOn
	 D27MURI4ltxcI4py9k5LnexJo1RZYHAxE1HXX4YEOsEF703SpelVmIPGGGbOTV3a2YGpp
	 +6F3fXQcdLxhmk4WHFoN25zIFLmOfWPrCPmlqEKtW1HwjulFdMg2ObIQ5N1AmFrLcIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=efdoLNPc;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A48606A82E;
	Tue,  3 Nov 2026 10:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A48606A82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=efdoLNPc
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id DF7831FAA9;
	Tue,  3 Nov 2026 11:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703107;
	bh=OzgwCIwWShDidCYfodpLoLuz6ukZj6iJTfhH6QPwT0w=; h=From:To:Subject;
	b=efdoLNPcZBo4NMSB2+g7SpKiBeH0lYrSSJiQQzNhF8psrpli0fY/hRlxHRKdzzQB3
	 TjouP1s6yZzHdJZU+KK6vZUOQ1SCiwFyZ0ggXHd4PGnOwrGU+SIljHkrk5H8seMHD5
	 1w7L9Ja1yNjmsag9iawQpklWnJvbhT3DRf7+OL6TaQGqZ7VRvC4Wv5Awpm7sBG9nEV
	 DWTDAF7LuNrI9QURL0tf+JEYGyXcZ6/Zt78N975t1rBcUIEAkl8MC83Y3rgeYD4zX0
	 tnS2Hyg/SQO1jfA0nZ2IcclKnz/8kOQApiKy1EGtH7wDLFPrmGtSA/hLgI2xJDrP8q
	 NHOEFTm5K153g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: ti: k3-am69-aquila-dev: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:51:35 +0100
Message-ID: <20261103105137.2393416-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103105137.2393416-1-francesco@dolcini.it>
References: <20261103105137.2393416-1-francesco@dolcini.it>
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
index d3677c2c2547..5afd7b806265 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
@@ -35,6 +35,8 @@ reg_3v3_dp: regulator-3v3-dp {
 		/* Aquila GPIO_21_DP (AQUILA B57) */
 		gpio = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "DP_3V3";
-- 
2.47.3

