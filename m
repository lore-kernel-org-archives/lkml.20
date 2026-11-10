Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.195.17.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296752;
	b=l3UNOWm+FATo/DF2ZJtvp+cYAJKnnGVhCiSWOFINwUapoiPiIwpyFXPAYcoiDsZbUYPL
	 mkA5RdBQy2GSR8usTcnLDbW264f1OiF1MapgpJ+38yw4vXu7mdeMPrZCeqDo92u++xHFA
	 vNE93wdOs9mQhe1RKg//m/mEIVS2/Qa3mpDJh3rq8HwbaLcDxWQrmSNSr5mBBBlyr17f/
	 4AYg7Hg7sqaGEsh67/BaXJ+RLBSsI08d2YP3iiseob1u+NJQ1cvqUmzw0BmIZ6Ptahi27
	 fsJPMcfOiY7ksQNgOSm7lA45N0sAInl2XRmFKsQSqBvWitZgbXfQMfyOC7kZlHzP/3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296752;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=SV9FPv5bQCpmG5w0OSwyufr0Ia+XJV7fSCSE3cl9f1s=;
	b=l+DmCaMa7X+URj6SDLpWX6qNCExe0nYaxeUefmEsrt/BLtlqcMsF/4CBsN6e5D1r2Qax
	 JS6qMcup9jYvr5VrSS6CLC4Xx2fuYbdpcyQZElYkSjtWaGh/8rXt+aBL5gBLBYZEuZYSB
	 O7sqasJ2G8BruNKkBshkggi5w2rM0ETVT9PajIzJ5lnX9ZXbfwsn8SDn35oZWP4a+FUBT
	 UMDwWuJPCRLfqAuz91hp1gMGe3RLthrvcA+s0krsrgv4bXMg3Agv4v6eK6NP4J3/TUsRN
	 bpYou+L6AgowgNSkGGHIcN6tpxxnqlRW0Mr7hXHTqVea4v81cctuc2xQbpH1s0AwqpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cIuw9r3N;
	arc=none smtp.remote-ip=45.195.17.253
Received: from mail-m17253.xmail.netease.com (mail-m17253.xmail.netease.com [45.195.17.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0905606A56C;
	Tue, 10 Nov 2026 07:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0905606A56C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cIuw9r3N
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 542170ae1;
	Tue, 10 Nov 2026 15:45:38 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 0/3] Add eDP support for RK3568
Date: Tue, 10 Nov 2026 15:45:30 +0800
Message-Id: <20261110074533.4052196-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa1c46b72e803a8kunm3f9229952eb2cb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHhgfVk0fHR1CTUlDSk1PSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZS1VLVUtVS1
	kG
DKIM-Signature: a=rsa-sha256;
	b=cIuw9r3NlKowZrUWErU2uw/zWOZ1BHgXaY2pMGQAcI8VJH0escNu3mDkTD9SzrbwU4709UU3cIkQgmtkTvrZomScxd5YSLgUiZagqVIxNwjA9+OkNMtpHL76F/MpwrcZozR2Yhn4yiKff+6Ght1fQnd6qHPkM2hmbkVeDwiUweY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=SV9FPv5bQCpmG5w0OSwyufr0Ia+XJV7fSCSE3cl9f1s=;
	h=date:mime-version:subject:message-id:from;

Picked from:
https://lore.kernel.org/all/20261030064905.2248999-1-damon.ding@rock-chips.com/

The 'rockchip,rk3568-edp' display binding, the RK3568 support for the
Analogix DP bridge driver and the RK3568 support for the Rockchip
Analogix DP driver have been applied to the drm-misc-next tree.

PATCH 1 is to document the RK3568 eDP Transmitter PHY with Naneng IP
        block, along with the eDP PHY GRF syscon node it resides in.
PATCH 2 is to add the driver for the Rockchip eDP Transmitter PHY with
        Naneng IP block.
PATCH 3 is to add the eDP controller and eDP PHY nodes for the RK3568
        SoCs.

Tested on RK3568 EVB1 board with LG eDP panel LP079QX1-SP0V.

&edp {
  avdd-0v9-supply = <&vdda0v9_image>;
  avdd-1v8-supply = <&vcca1v8_image>;
  force-hpd;
  status = "okay";

  aux-bus {
    panel {
      compatible = "edp-panel";
      backlight = <&backlight>;
      power-supply = <&vcc3v3_lcd0_n>;
      no-hpd;

      port {
        panel_in_edp: endpoint {
          remote-endpoint = <&edp_out_panel>;
        };
      };
    };
  };
};

&edp_in {
  edp_in_vp0: endpoint {
    remote-endpoint = <&vp0_out_edp>;
  };
};

&edp_out {
  edp_out_panel: endpoint {
    remote-endpoint = <&panel_in_edp>;
  };
};

&edp_phy {
  status = "okay";
};

&vp0 {
  vp0_out_edp: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
    reg = <ROCKCHIP_VOP2_EP_EDP0>;
    remote-endpoint = <&edp_in_vp0>;
  };
};

Damon Ding (3):
  dt-bindings: phy: Add rockchip,rk3568-edp-phy
  phy: rockchip: Add support for Naneng eDP phy
  arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes

 .../bindings/phy/rockchip,rk3568-edp-phy.yaml |  46 ++
 .../rockchip/rockchip,rk3568-edp-phy-grf.yaml |  80 +++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  45 ++
 drivers/phy/rockchip/Kconfig                  |  11 +
 drivers/phy/rockchip/Makefile                 |   1 +
 .../phy/rockchip/phy-rockchip-naneng-edp.c    | 471 ++++++++++++++++++
 6 files changed, 654 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-naneng-edp.c

---

Changes in v2:
- Apply the lane-dependent TX configurations in set_lanes() instead of
  set_rate(), and store the lane count for set_voltages(), since the
  Analogix DP core issues separate phy_configure() calls and the lane
  count is only valid in the set_lanes/set_voltages calls. (Sashiko)
- Initialize val to zero in rockchip_edp_phy_enabled() to avoid using
  an uninitialized variable when regmap_read() fails. (Sashiko)
- Fail the probe when the chip data requires GRF configurations while
  the "rockchip,grf" property is missing. (Sashiko)
- Rebase onto latest drm-misc-next tree.

Changes in v3:
- Restore the PHY related changes which were missing in v2 for
  unexpected reasons.

Changes in v4:
- Restrict the avdd-0v9 and avdd-1v8 supplies to the RK3568 compatible
  in the Rockchip Analogix DP binding.
- Add the reg entry for the PHY node and the ranges/#address-cells/
  #size-cells for the parent syscon node in the Rockchip GRF schema.
- Map the PHY registers from its own reg property instead of accessing
  them through the parent syscon regmap.
- Model the PHY node with a reg property under the parent syscon in the
  DT.

Changes in v5:
- Move the APB clock (PCLK_EDPPHY_GRF) from the parent syscon node to
  the PHY node and enable it in the driver. (Sashiko)
- Split the "rockchip,rk3568-edp-phy-grf" syscon node to its own
  binding schema, instead of extending the shared Rockchip GRF schema.
- Validate the voltages against the effective lane count, to also
  cover combined set_lanes + set_voltages requests. (Sashiko)
- Select REGMAP_MMIO.
- Drop the example from the PHY binding schema, as complete MFD
  examples belong in the GRF binding schema.
- Rename the reference clock to "ref".

-- 
2.34.1

