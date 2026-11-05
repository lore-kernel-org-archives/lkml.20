Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873007;
	b=tl2qiXdoyZKpNB10L1oQsLBy7iCZvnduRPLf56IcK19PgV04SpWjNvMENO2Lfm2HYEGw
	 2Bn3GvOGO5eMWnW7L2FDnExM15L3pCJB2unQGPwPM2UFrHNLydsvPK9rLg2xzdQ1FCNGk
	 QI5LrVec9J3OJHodEWNum77lWTKSuiUR8oIKVNWMiMiibcXDuJjDbxbKH7CESRPgpoJjm
	 AnjKE35ITiXTQLHJaw4xRQjDGHqcYS7SrYVFVGLn0RL9e0xE/r3X9O0gJ8Ir6D0EsZs4Q
	 m0OsQO/0UY7D57CFRYP8cr8nS4ZkSeT4y3PJWe/DL1SQR75kbWSzV7ZUfaH7+LVvQCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873007;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=R6cyamQMSGS+vKmEK5CyaNiN3MV88pM7I1W9QX3v1mg=;
	b=dAZQKHqFrSLQtjKzZOhRKSi86G/oKKtJCQecd+dXl0ZovaN8YkpJt6a9zNjECCE/42sV
	 yYUjyTaXKb+HMJgW0UhruPi7cGWCm5RpFv/O7c5bic49cfmrqgQF4laF0moGiSq2AVWhF
	 AzHsFbEVLwJmLipq5yeYQFDwjR1WbXPsXkn5gcD7WFzv/lD6olr8uJw5JPETBxfRkA7a7
	 SPS5P1vmNsQIOvVvEEud+wx//YJ4PuW1HXdcexJfviwlRZedk2qimgZJPltpmbMl7usBD
	 vIH+Jm2xKFIiJVGjD2cDeZSAvNZrBEVBoCG3rwfzybghxlGK6U4YU0FRFtlp53reVHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FA6606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2FA6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so14431215e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873005; x=1794477805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6cyamQMSGS+vKmEK5CyaNiN3MV88pM7I1W9QX3v1mg=;
        b=H5dF7KCNopTSlvI02l4UPnf2ulsTX14XLe5FrVs555rkZZCmC3Ef6BmU71K8Kv1YiI
         EbnjmqbrcAs4AP8CvhQEZOKqu/oCDhydOFx9b7NNQe5B/LZZ+1rDhkDI3uuSEYMLYpbu
         upt62aSQOeMfSVNGkewAsfoLntHv3JnBZc20tpmyYGXplLhWAb8waTg0qI0E/aZmNwZi
         HKlyadjYsaS/EuPymW8Ao+XQ7shbvx9SfbSIyZbQi1kJaUaDT1R7m5UIF++2m8bkJm9i
         h2WF85YmfeyotQ8bNJ6Qbk/AMrIXjHGuZ87s4uUs0FSfWeUCdpzHZ57bqtyL2l6fzk8J
         xOSg==
X-Forwarded-Encrypted: i=1; AKwUvBz3kYCDXC5FnptVvxSVVZdMIpKt/hhOSqIuG7VReUSp5KkKumS5sEQyGkCDwKaRepJGBzDKJja3IiZ6Eww=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d9Xaosg33JkPlprfzCFm6DRlXEroYqVmzrWFlvt0SgruUL59Y
	QaPQ8bzqnslGf9K16Qj6BaePv5ntJwIGJWiS1k71pkA+3nMcPVSnr3aR
X-Gm-Gg: AYBFou30TIGXcq+RPaN7sjMtZsu7N0SlJQOCS49N4iSj3DgLihB04y5hV1ogzx9szff
	fKq6Hue+4/nQrd4d5EtpIELQ/T20+ljz4yd7ZjO9mQpXqg8GLRvUIkSIMZ+trvbPBmeeGenisum
	Sg2FtI19wMxa1jSwOXn5+EIZU0M+MS8pz9Bh2WrSSC2X6mA1HZhhsOvtHkcLJb0M5qw4MVsnglA
	R6qo6bs5sHZ6VIwr50Z6IWzV3rUKMeRkuwmUxJYx09R3sWl6DW0BenF3KBHz4ukTj2f12mwJYTL
	4kMiyY+d0puBNBc4dtWdNfMYImBWC0o6VzszDUxVg8J7pd3BuOoqiYvDR/OdzCbWTGnHrFx8yKd
	T3cHeMd/J7KMnBL/FjqY/GxGNo2bsX8+PikUiWaxXi3nIeix6gmGDN+9WC/kx6DV0s5RnL1UszJ
	oWmRFdwEAEoeoAVD3l0q8+xo37+5wlUmDqBH67wnqx+fLzHgz5gXvfN3nmGRVBmzGewTQPkb3e1
	zoWC/k1iI1V4hT7dORHF4t07JryaqH+TkBrlg0NgF5bZFgusVJVMDf0KN95/h/ZwRDRshK/+QlX
	T4/3kOTLLR6N6ka8e0p3qgMS/Ia2tRu405DdDv5/pBGVnRsEorWr5OFPBajKt0Poe7wGneX0mZ/
	UIkYBAPkjuPYlCSkvR8dAbf040Q==
X-Received: by 2002:a05:600c:e547:10b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4ad5e09ae61mr211533235e9.29.1793873004567;
        Thu, 05 Nov 2026 02:03:24 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:23 -0800 (PST)
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
Subject: [PATCH v6 0/7] Add ethernet support for the Amlogic T7
Date: Thu,  5 Nov 2026 10:03:15 +0000
Message-ID: <20261105100322.37816-1-tanure@linux.com>
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
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on
    the T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 78 ++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 90 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 61 ++++++++++++-
 4 files changed, 236 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

