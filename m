Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572335;
	b=EMgYrQhGKXfrIfE80PuZMb3qimwWYti/mJcd85qVnwERGvwyfgeOmpUYgX6wrv8vj95V
	 WA7UGvsm5Sb/X4g8GllTAY/nRC/Ieg2frvTEOJAKyH/vnKnXSr1YVvwkifWjFFC/ONGAP
	 hWe+U7tiKDXxEgPvWt/zF+id1WGTCDzBED20tTJ22lLY7qLfttBKylyK4ia2hQD04VujE
	 PpEmgxU3hTEHnwkGmFr+ku03LgZR0RSpOPkWpKOsfubb7qVrNHmiQaaeHZ4hGZU8KJWIB
	 pOXRUBjmch2U/I+oTluvxG8u3pgnmOWQAupNZO+6+FMKm2AiKlc9s75ESGVAKbfewrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572335;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Unn0F/ftD1finXNKWi/skeaXkk+/fQXZw2324bDO7PE=;
	b=XauKI09sYyh4n3u+P4cfyJLmqzaTpv4H/xXX1kpFqiiEwPQqEUX+zXJLW7UAYBG1zHNa
	 3+wsuRSBQkaDGIE1adMr4fMdEJj2H9ivdEhvYu9oWokZ/dWuuKS1Aye8AaZmaQvSP06ZD
	 10X/BZQ++qijpA7SybKojZ7uE+dK57+Xvb+O6VoxbxvxLbqYpw9sE0OSiURQT5mEf4NAN
	 uZQ41ErX4Gc2bjS9tOAePu8KkCzpsyJPO/NfazNIrfbUvpXn4H+faFXM/nwfjXW71VytC
	 dUavur8dCE07uD9lpwf7j4AC7TDXe1qgRoEwlhkGzMCRSizBWhZoDkGFT5xu4a578Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69103606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69103606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so395516f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572334; x=1795177134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Unn0F/ftD1finXNKWi/skeaXkk+/fQXZw2324bDO7PE=;
        b=UipmbR2KJWw2flPhxaOzGdgh0RnRgOR2LbCvg5tOpx2dcYznVeg4T21Wv0bCTak9cn
         K47gHe2UlSFx4R3pXEjM8dFLLZ5AGU7PdDKQzQKS1AP4AdXvwb4rAicB58DwsV95ss2F
         mkJN25eLo+PeYQKllnP56DGkTYBvJqCNmLWv7rWajGnx9JyWW/egmxaigst7y0sr5DhC
         8RRBXuXOeWN/q2vdPESMOd30y9gFAxi6r2z+38cGBeALOcGNzJbbCWv2LQImfMTBj7HS
         diHhi2oKwG/0hCtJFj1Sv1Ha4GH03DsgLux1J3SxQ04dY7NfvAhegJ81igM/uJx2sfoV
         qDrA==
X-Forwarded-Encrypted: i=1; AL+hErHxCbzj3PQhDNa6gclRz0dcsG3D+QXJ3e8wcBgbaMRcLv6UNLoO7/5R3gzyMrz2WSPbb1oMXM4zd3uYTbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dVkuQGzO3Tf/e4m/R/Zq2ZUi8j/GRmmu9tN11IWF0qfSccjqA
	8r0nyrfxH0YLMFbaA9OGlXeywviVi1kA6ENkbN/jySsNyNIYSVK3Op8E
X-Gm-Gg: AYBFou26TJKQe5A0hCuSWhyfnMnYBv9rr9zPeVISI68DsOicLZSz2mpOoZV8J9lIiUQ
	dPd3ZIDQGWP6u7I42Xogyepw1jILpCVEr3lUi0B19LUmEDqVtJ6VcrhaShIichWRgSBSVn1Cirt
	B/9MNMdBhfvEiQcNwam7gPHZaoQq+a3VnFgHA9K2QA0J7IQ+aXLmjDm5qQfNSLe35iW38Ek7PGm
	fWdE+L6mz+QNWxCBtKSuQ7OE/p7HzisMsTxB55ztArkqlHvWEiBE4EkAnYfpyCD2lv/D/1ejggq
	+/2rWXjROuSAkNu/9T+CRtBk/saM/wmPnQjtQAk4JbHqrBm08lNjTle8+JkQcqC0A7WvPyRfa+6
	arVMgronKJRKZd5eKwnYO4uZvk4cMG48CpcDua4HjTVsDtuOxBUyRcbYcYKPBFWEv/0vFnGqbGy
	GevkcZXQwxD1y3ofXO9lCpH0dEPv3t0wnwlwjiG+AySQfG+NDKqXcm/wCwwFBBIIxQSMvtY/BHz
	/CnHg0GNrgY45M4OCOF60HULzzBkkB3ctdsuTs6X57KV3YsLgaClhO8YMfb5DETRpnGSguUvpEf
	Bu7Bk7EpKr0uJTCjvDnP0aS4SPmA6aegB0TP7Xk6Lm5oZD4rqvY1K5EFK90dwChxUGS4nHGmIoR
	a4aoZvSBs4IoEr3RmbtL+baOQ
X-Received: by 2002:adf:f14b:0:b0:492:dddc:64c3 with SMTP id ffacd0b85a97d-49c742a6580mr3860898f8f.41.1794572333528;
        Fri, 13 Nov 2026 04:18:53 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:53 -0800 (PST)
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
Subject: [PATCH v7 0/7] Add ethernet support for the Amlogic T7
Date: Fri, 13 Nov 2026 12:18:45 +0000
Message-ID: <20261113121852.334604-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
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

Tested on v7.4-rc2 on the Khadas VIM4: 942/940Mbit/s with iperf3, no
error.

Changes since v6:
 - no Assisted-by trailer (Krzysztof)
 - patch 2: the T7 gets a binding file of its own (Rob, Sashiko); the
   pclk description names the glue registers (Krzysztof);
   rx-internal-delay-ps as constraints, default 0, maximum 3000,
   multipleOf 200 (Rob); tx-internal-delay-ps stays false, the
   meta-schema refuses "not" on a top-level property, so the reason is
   a comment above it (Rob); "snps,dwmac" dropped from the compatible
   list (Rob)
 - patch 6: "snps,dwmac" dropped from the node (Rob)
 - patch 4: Andrew's Reviewed-by

Changes since v5:
 - patch 2: the T7 block follows the Meson8b..G12A block instead of
   splitting it in two; default: 0 for rx-internal-delay-ps on the T7
   (Sashiko). The explicit false lines stay, as asked in review.

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
  dt-bindings: net: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on
    the T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     |  29 +++--
 .../bindings/net/amlogic,t7-dwmac.yaml        | 112 ++++++++++++++++++
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  23 ++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  88 ++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   |  61 +++++++++-
 5 files changed, 297 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

