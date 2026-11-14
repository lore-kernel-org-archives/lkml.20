Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.129.254.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645238;
	b=clZRyjq3RGZFAoTA0X0En7wRFhbyOPhptmD3d3b//1beupaV4DjILOlOgKGe+QbsIIQh
	 mzrBSHSy35Fe5Rt4E6YZ0Sru0S0IkK36Lf8Pt0eLpFALGdEoKCuqU8WNJeGP6TgzIxPdL
	 fvGvmUQa41cm1nNqzfHd+m9ynx1coQi4T1ip/wg0f5kAAvJT+SdKI/BLEwHc5L3e9tceU
	 XUmgr45K23Opo42DifjOsML4EmbNy8OImaeI7GhJhTjNRVZZnJLeAr7e+kYY+XYjxOZMT
	 QksgQj2KznPG4/GisR398RfjLaTEl1itY47Xhu+xG7/ITXx0wLJ4moo/acGnV7Hqlng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645238;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=oiYEUoevGz6B9k90gxoZ1hb0nRNZKhcTPfPp4iW8drY=;
	b=blvBWdIAeMnEFRoaTxpqEHypW7maD9D2cU4sgfZnrJ7DYuwAIgy8qePQtlqIRjjD1hhX
	 aGNcG5jwGW2KuEgqMUNq/fBl/L/1AWu9Qb9xZeESvBxEtH/5m/fE1J/6vaCAYcGlC0VYG
	 XVvIaOr1O5y92PJrcXU7Y1Q5H3erMZ7GXb9hmQ62zrgo6Czrkm5Iqqjagu8pVtzfI7PtX
	 k3sj0GRH7oPKPPi/tA5ZIVnh+vcYanv+5kbKx2GuTASTvDQzMAFAXY2zmumaS7XKqY6nD
	 wjRP5K2RcaTGm8S7k7W709Q3j9MRL63pgKvgdNeGBl2n/641m18hjWUK1gaXQDeWZzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ZKNDEIyF;
	arc=none smtp.remote-ip=103.129.254.75
Received: from mail-m25475.xmail.ntesmail.com (mail-m25475.xmail.ntesmail.com [103.129.254.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B4B606A327;
	Sat, 14 Nov 2026 08:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B4B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ZKNDEIyF
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54aa8867e;
	Sat, 14 Nov 2026 16:33:45 +0800 (GMT+08:00)
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
Subject: [PATCH v6 0/4] Add eDP support for RK3568
Date: Sat, 14 Nov 2026 16:33:35 +0800
Message-Id: <20261114083339.600986-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d930ee5103a8kunmf52e980410224b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQxkeVkpMTktOTx8YS04YTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQkpVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZKNDEIyFwrTvda+a/dvN3MOLDUUpNdafjehWACrhn+URRjLHh75AxazHiEalmTfkxl1+C1GJGU5frloJ8GmhskEQ8wlp41otoFFpnpC1ETXgSgvH28Uz9hOgJrst5SgsC0p5HZkqIF9ZfrJf/0gxCvdBFciYoSPvlEYlhfubsEY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=oiYEUoevGz6B9k90gxoZ1hb0nRNZKhcTPfPp4iW8drY=;
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
PATCH 4 is to add a MAINTAINERS entry for the Rockchip eDP Transmitter
        PHY driver.

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

Damon Ding (4):
  dt-bindings: phy: Add rockchip,rk3568-edp-phy
  phy: rockchip: Add support for Naneng eDP phy
  arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes
  MAINTAINERS: Add entry for Rockchip eDP phy

 .../bindings/phy/rockchip,rk3568-edp-phy.yaml |  46 ++
 .../rockchip/rockchip,rk3568-edp-phy-grf.yaml |  80 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  45 ++
 drivers/phy/rockchip/Kconfig                  |  11 +
 drivers/phy/rockchip/Makefile                 |   1 +
 .../phy/rockchip/phy-rockchip-naneng-edp.c    | 471 ++++++++++++++++++
 7 files changed, 663 insertions(+)
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

Changes in v6:
- Add a MAINTAINERS entry for the Rockchip eDP phy driver.

-- 
2.34.1
