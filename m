Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643004B1CFA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966102; cv=none; b=HpUSWh58I3S/k4Qb88K5zYeRxyzcPsYERYPv4mjgW9XPNrr6Bjl3fUz7UT25w4oE/yv/znE1938whe9Q/i5EjEetuKBQgxUrK47u+Aj2YUxnpDU/kGw0gc116lAKBMFJbwiIM9kz5LFDJ+Hc2gutM5Dds44n26Dg3AZnk4iwdMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966102; c=relaxed/simple;
	bh=1VX4rN7/mTu9mQGkDzrp56qGEl5UnWa6EMbBEoMhjec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyrjxPE10fkUgTTfhVVhv3WEHNsSir/I6tKrm/XxXkugglgSCh7NgwPHzmceT/burXyDde8ua7Nx+Qb0ALWJucEjaNFEgSTp36By703H2qbRBHQ1ADu/K9D0JQL4ad2q+U3gZiO6vHH7G4WVD5q/L3PDL2KAzrbi1mAt41bbAnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m1qFT81V; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m1qFT81V"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd3310348d2so2719068a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791966101; x=1792570901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6y7j+G0zmzgPrQrrwJmak2jWutCzC5yma4ucK0cyh8=;
        b=m1qFT81VTKWee8TDKFC5tiTunJlcLEn8uEXp2hPqPKQi+pM01tqilHIOe1uqIOo2iO
         3P+R4JQhzBC5zz7z6Gx9M7qvsv2+LXUbKCECwH3pUh9bHr62WgoipSRtJLNL/BdPs6SQ
         ScuJAsSSSv9PwcZT0jE6cry5QOkPHRHjwFcAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966101; x=1792570901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6y7j+G0zmzgPrQrrwJmak2jWutCzC5yma4ucK0cyh8=;
        b=c78evdoP+coCbHYByf1T+G0I1N26w7LoRBgvsp2lOn39Bq2V4v0i+c1BzwaZG1RK9A
         pAoAQ0yBUSS6zue9ljEQ49A1PBy7HBtUhbmclamVyP7OLLmZzfAPhzJuh7f6eUaZSW7s
         dtaB+F88CZVmVcb5AqSr50eeXCq3tABKIaR6hQY00sze1g7EYxrw+6CfnXeShvBqNmP8
         BGDOy+FLiIWNIK84V5iwg+LHw3TOuRGbEsIz/FK0jaRjiAIalAOtwuL3dpwxwlaTwO06
         6sLC/zOsUkfSnJNHjGhP380eBd3JO/vPVmWio8k/BT4DGKO4NwLoPG2aK+9ypVNWKKdk
         0pSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZI/QDXDeF02PJ0x15VYikuWCWsggHokGBcqf4mDkv16zkuGkDCjfFi/MJUahwHYzWUnZptEQfVPICFEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiLCOae6jrMxHwJH0QixHCM46q2eLngplY6xKWkGTEiMUpXS4n
	LAhp1wHUAUXiQAYQsRpjtKdbqrsdtu7UekRe69TlgUXxg4yx1+siG/oNgJqHDUuUeQ==
X-Gm-Gg: AYBFou0aLxqlpRRvj8aHkvLKtWrwCXPGWpbW5uy2fTaPlg3RlJ3iQr+b0L6AXBoGKWZ
	UwDeUQZuYuGzTuKvCeRXlwyNi1abyhbA32Agm78ly2uhfAtPZ/lYIS10VrF9qW0nJoXsF7x29Df
	kycP/nwUufNooLUkUb6BirxxAwZDALTYhXzGmkhmN2tjKeG0+PcjVkCRFDqAeI9qtEjoRWEEJt9
	GS8Ybga9S5BEO5DsS+aFa3mzBnCuva9uXHQ5oj2mUX48s7mflhySW4ANjvXwPIDv7HqTMhTSkQd
	k2WXkwgI3zu81TStykym8x7W45+ky1fYkUcwvigmztX9Oy3iosudr0Bkb/YL3itGI0ZegQv2f4j
	vAg7IEH53jpvG78syLd3B7ue2nmzqWg6M5JW4IPXuAqLomrbUtLd0tkfaXRZRGps2GKZ3Rxjf3l
	g6nGyLxWvjz/gkdlfIRCwXtmO9HIHs1O1j7+k14dKRiehu5VSMfKcEV2yR2ZrEH3xFbVORtJ1z2
	XA52S8pZoSvmM9yHM1YFsrN2m3J77YwGA7AE+NJKRM9KktIghx6qd3/kA==
X-Received: by 2002:a17:90b:1a82:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3ab3ab209f3mr7706681a91.25.1791966100501;
        Wed, 14 Oct 2026 01:21:40 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:373a:9eb7:c5ba:7b5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3682141a91.2.2026.10.14.01.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:21:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Wei Yang <yangwei1@eswincomputing.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Hang Cao <caohang@eswincomputing.com>,
	Li Jun <jun.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Roy Luo <royluo@google.com>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Xu Yang <xu.yang_2@nxp.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Ze Huang <huang.ze@linux.dev>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
Date: Wed, 14 Oct 2026 16:20:36 +0800
Message-ID: <20261014082037.1774672-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261014082037.1774672-1-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DWC3 controller can operate in host mode. It does so with a XHCI
compliant host controller. The XHCI has two downstream ports, one for
HS and one for SS. USB downstream ports start from 1, not 0.

Reconcile the downstream port numbering with the common USB host
binding, renumbering the downstream port numbers from 0 and 1 to
1 and 2.

This is non-backwards compatible, however it won't break current
major implementations:

- dwc3 "gadget mode" in Linux kernel only requires a connection to be
  present; it doesn't matter which port it is
  - dwc3 "host mode" OF graph connections aren't supported yet [1]
- FreeBSD doesn't use the OF graph for anything
- U-boot doesn't use the OF graph for USB
- OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use
  the OF graph for USB
- coreboot doesn't use the OF graph for anything
- Zephyr doesn't support dwc3
- TF-A doesn't use the OF graph for anything
- EDK2 doesn't support dwc3 and doesn't support OF graph
- OP-TEE doesn't support dwc3 and doesn't support OF graph

[1] WIP to tie OF graph port node to USB port device

Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS OF graph ports")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
It is unclear to me whether the HS/SS numbering is fixed for all dwc3
variants. I checked Allwinner H616 and Rockchip RK3588 and they both
have HS as port 1 and SS as port 2.

This also doesn't cover a potential "multi-port" DWC3 implementation,
which Qualcomm seems to have.
---
 Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..4b6304bd2ec1 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -410,11 +410,11 @@ properties:
       property is used.
 
     properties:
-      port@0:
+      port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: High Speed (HS) data bus.
 
-      port@1:
+      port@2:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) data bus.
 
-- 
2.56.0.212.g129ede20d9-goog

