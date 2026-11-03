Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723839;
	b=q3NAUWrD3wvMH00wfLNHR62pQfg1n0LW99EWmJneLFRrkBpdlzkGV8eeo6FSaUEOIObq
	 Va3aGMdzb2I+sxZx+xTCHLBmxiS4Kqj5t9aHop3lmx4fA8EJ/EhAKlF9pKNl/nPwGP86k
	 DiK6jC7XyXaAhQN7LV5jPV7o6qhJ0Zw5mfecXMX5j2+9ss6STiv+TI1jjwJsaLN0dLE+v
	 nQ2Gtv1k6oFGfqaxhOVxd9dyGDqg/RoIsN1uPdjDh6IuIhXyW3Ok0NQPJmGrl+oMIu/Vq
	 xq5d+qwfsPGjyvFraHJCXUqK6e44Zq4bzus4GvHwgT3fcNsR0vidHOLkykgr6QHVxmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723839;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Jpxt/nQGal/nc4TuRsev6IcXoTzVp5Y6wAOXrs7jBpA=;
	b=G5ZeSbFwbxzGC0ckSfJUG/sQ76LDS+7JNLr6SehcugsGUtOennJCNbYI3xbG19fErorz
	 KhWBIrB1eVuVHdLEsW+my83o/VcBZHV2TaU7XB2jt1dELgkLP4qaH3D7VfoOECelJ+9Tt
	 LFRvKp4tzlFVbSFB2pVjGGET2BTuzP4EFsT4zagxEz98eHjCmhLUR2DiA3p4GVLg/JDi4
	 10X0Y7i0YpbyfDjDOQQuOWpXXq3Kbd/xBK5BI21/QnlmCQE7ZX/83jqi3IjHiexnTDqL/
	 OFadTBSVX7YmjCa0ZURxPCGT7plDNUYrkmHSBfezjpsolhSAJX+PvZFQXRx/exToT0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369B2606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 369B2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3866987f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723838; x=1794328638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jpxt/nQGal/nc4TuRsev6IcXoTzVp5Y6wAOXrs7jBpA=;
        b=PhXTSSdMvBn4NBLO4KUKXVKlIHFLksYdnnSAbXUDDV2eHsQGhI6GtBIoqZ732Ggum2
         QQQbXzRgX5856RXryYgrA+8a3QeAzPpQ6K50TVn3btN8YkH7ukSw39kEcZPqrp67j9C/
         C34y87FXHgixyeHmXA4f8Q73ciAIOi17aq33pPl1zfmNADV9YPuRTto+hOyKuAvsKmvO
         9Aemz+38vAahEkOOCNV7vnVqpCJ83R2bQj3NdNPgo3zpdLUGOu8yIVSA063HELbvKhI/
         nGCvhXe6kn4N9AP8BsDgi2r5MNJ4QJCoZUlaprstBmkuEc9UICXQfvrWwynQCKnHe4Id
         z4/A==
X-Forwarded-Encrypted: i=1; AKwUvBzLwWjM/OJhW1PI45utcm6xDDZOCAO+mXsKju45a6Vg7HfR4wSOHe6zRWzLjg5mMrw79l+XltM3KrrNkq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/40n//FCnEa3dfUJ/MX1O3Ls6Qq0Anlf7AQxCskuwFDWBtc4TB
	GwZdh7KFS667vJef3FSDcHO/onF8eAvEvD5pMLSOPOCTq8i+KqjySgwn
X-Gm-Gg: AYBFou1Wa5aFeiMIc6x6BY64YT3Ds/BrikNGAxl8C3f2L+G4r7xI5SQFdnpUAaU4ozz
	WEvFshZV4IPIhSV8lCf5V3MSzcsa6PDgxF5VTKBMeByeq0AD9WpAHG2pe6eSE81NjT69aeGxcFO
	o3T5aQmoizhajYsAE3w3v6i5CymX1Zbmgx4MqZHZ5kUvplgulMhXtiPAS7iTUGSVs7UXTbP9OXf
	8jpsfkQ2b3ryz19C9fQqOfMfHSQznqfa6EvA8evc5ZBPS2Ae6nRENuMJ60T0lLsC9Sk3WQRi+6B
	twkS7VEfcWRPkNDNRU7K+ErXUGBQ8TwSr3Zi3juZnPjF7m81+DvXN4Ft6J63jircIzw4+L3UT6E
	s+3Xmhbi5qDXPOXYYDrdY8qlTMKYH0ou8E4eyC56Ll6g0JyZwV6isTbWcKbh97G+kIi/pAzlfw2
	57qAxsM8AHXVRBTs2UU5R9738qntKPYInl0W/1r9uj/i01wiG8uXyxegJlqZ5+pIZoq4IrJaQbd
	VV8kNMKYde+h32SsgdvAqcD1uNWiUe8U2SjUG8e12QdkkQYr/1XPfOtVFINH5j+Rjsexcdh7Xq0
	SyvR1gxfQqXJVbXR+SSwjQ6tdqYCjIkeAAkH55ukfPXFvQXPBPFoVZFBS0ECSjrge1i/aa2wqUE
	IJt0ZMO+GORVhZTlai65OBrY5cg==
X-Received: by 2002:a5d:588e:0:b0:48e:6652:fdc9 with SMTP id ffacd0b85a97d-48e6e4f54f1mr28922601f8f.17.1793723837259;
        Tue, 03 Nov 2026 08:37:17 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:16 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] Add ethernet support for the Amlogic T7
Date: Tue,  3 Nov 2026 16:37:08 +0000
Message-ID: <20261103163715.385394-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
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

The T7 has the same ethernet glue as the G12A. This adds the binding,
the driver support and the device tree nodes, and enables the port on
the Khadas VIM4.

Two clocks are new. The pipeline stage between the controller and the
DRAM has its own gate, which nothing else claims. The glue registers
sit in a block gated by sys_ethphy, so far claimed only by the MDIO
mux, which probes after the glue is programmed: every write to
PRG_ETH0/1 was lost. The T7 node lists that clock as "pclk".

The delays follow ethernet-controller.yaml: phy-mode is never changed,
the PHY adds the 2ns, and the T7 accepts only rx-internal-delay-ps, as
fine tuning. Its TX side is a quarter-period phase selector with no
small step, so tx-internal-delay-ps is not valid for it. The VIM4 is
plain rgmii-id.

Tested on v7.4-rc1 on the Khadas VIM4: 940/941Mbit/s with iperf3, no
CRC error.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v4:
 - patch 4: the old delay code is left untouched; the T7 only gets a
   callback of its own, and the probe parsing it shares validates the
   RX value (Andrew); no NULL check on the callback (Martin)
 - 0 accepted for rx-internal-delay-ps, the T7 joins the G12A list
   (Andrew)
 - comment on the deprecated vendor delay properties (Andrew)
 - the MDIO mux and the on-chip PHY bus start disabled in the dtsi; the
   VIM4 enables the mux (Sashiko)

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7 (Andrew)
 - 0 dropped from rx-internal-delay-ps (Martin); vendor delay
   properties explicitly false for the T7 (Andrew)
 - init_delays callback; patch 4 renamed (Martin, Andrew)
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works (Martin)
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands (Martin, Conor)
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - T7-only delay path (Andrew), PHY mode from
   phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps checked against the hardware values (Sashiko)
 - vendor delay properties not valid for the T7 (Neil, Andrew)
 - no max-speed on either PHY (Andrew); VIM4 PHY interrupt on GPIOH_6
   (Sashiko)
 - the T7 node owns sys_ethphy as "pclk"
 - no longer RFC; Conor's Ack dropped from patch 2 and Neil's R-b from
   patch 6

Changes since v1:
 - the driver honours the generic delay properties; VIM4 moved to
   rgmii-id with tx-internal-delay-ps = <2000>, Neil's R-b dropped

Lucas Tanure (7):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on
    the T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 88 ++++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 90 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 61 ++++++++++++-
 4 files changed, 246 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

