Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465778;
	b=T+OHRQnUIC3O95r8MLgZZMunrWBEuOlRAQmcDt5PiTCHQS8ibSkc1lsSEqAxcdc28IrB
	 7L8MD/VR3P/c4E3oaMLONOIoFfxX2S4uT3yyWEupIPTZmr75vHFWH9d8+z5VPBgKWxwSi
	 KlOD6fSGk+KCYdVOhrfMjbhp3OIvEH1J82P6pzWuGtwswJ1VP5y5VerIVC7tupo810SXy
	 CDvvz86tTYmPaWBQy5vshrHiuRbcWHmq6AhE04rxyrR7/FJZPDy2ZM99YBzunH7eE122T
	 gqaQwleKFbahUmjQH/mgGKWsljdA7yYBoO3QEHhZ3CDKC5ytzJdJutgUqTpG8VhgrhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465778;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=dt0N3ix0wAIYmAU9lbiuaFzpuHythTIbWJzQ9DvOTyA=;
	b=2ebHF/eZePKn08NYq6xkgJcUDU+vLjmyzYtlKz9RJypoPquu7WpYWp+2cdEpqWOgDRP8
	 MOKqrJ6Q8Ztvk48lLksSc1GWqrBUcPvY4JKlclBNmq5ubf/14MQgbVj/vdOs7Kl7fBTCa
	 3Cfusu3yyIuUpvvfXwh0ScRvhZk/TP9xTQePYnyvYoKX1e4EE+0cYJY9h4N2D8/ZdRMyn
	 q0dK7p1HvQ2oepS2qzpD/MLzliPzCwAP4mEvGCKK3IEFm6WpUJDXoy61usvaASYNVw7Vp
	 hhHDWzovSIIJSKKYWI78Ty2rHjlNJ0ZQJDKaviU1RuLsJJjetxw103BS+bwx9w/K6BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ejSv5eT7;
	arc=none smtp.remote-ip=154.81.10.224
Received: from mail-m10224.netease.com (mail-m10224.netease.com [154.81.10.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BD1606A31C;
	Tue, 20 Oct 2026 03:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98BD1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ejSv5eT7
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a4cee65;
	Tue, 20 Oct 2026 11:09:25 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 0/6] Add eDP support for RK3568
Date: Tue, 20 Oct 2026 11:09:10 +0800
Message-Id: <20261020030916.3223833-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa15749028c03a8kunmfd20f05334c72b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHh8aVksaTRlKTEsaTE8dHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ejSv5eT7K0+24gI8HbGP05HopX6koZdp+6lHCq0dDME2HQCRxnv9QB5FmRNP2hIjezD8oVsbDOrRGzT4gNj5j6MI2uKSOExLWPjL1Ie3b+8U3ARCtv1AzVSIQc0mnv+kwxxfMstgCL5uzVWb11nYY3Co41IV/QaKnbVLwQNt+4I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dt0N3ix0wAIYmAU9lbiuaFzpuHythTIbWJzQ9DvOTyA=;
	h=date:mime-version:subject:message-id:from;

PATCH 1 is to document the "rockchip,rk3568-edp" compatible in the
        Rockchip Analogix DP binding.
PATCH 2 is to add the binding for the RK3568 eDP PHY with NaNeng IP block.
PATCH 3 is to add the RK3568 support for the Analogix DP bridge driver.
PATCH 4 is to add the driver for the Rockchip eDP Transmitter PHY with
        NaNeng IP block.
PATCH 5 is to add the RK3568 support for the Rockchip Analogix DP driver.
PATCH 6 is to add the eDP controller and eDP PHY nodes for the RK3568
        SoCs.

Tested on RK3568 EVB1 baord with LG eDP panel LP079QX1-SP0V.

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

Damon Ding (6):
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3568
  dt-bindings: phy: Add rockchip,rk3568-edp-phy
  drm/bridge: analogix_dp: Add support for RK3568
  phy: rockchip: Add support for Naneng eDP phy
  drm/rockchip: analogix_dp: Add support for RK3568
  arm64: dts: rockchip: rk356x: Add eDP controller and phy nodes

 .../rockchip/rockchip,analogix-dp.yaml        |  25 +-
 .../bindings/phy/rockchip,rk3568-edp-phy.yaml |  59 +++
 .../devicetree/bindings/soc/rockchip/grf.yaml |  15 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  41 ++
 .../drm/bridge/analogix/analogix_dp_core.c    |   1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  24 +-
 drivers/phy/rockchip/Kconfig                  |  10 +
 drivers/phy/rockchip/Makefile                 |   1 +
 .../phy/rockchip/phy-rockchip-naneng-edp.c    | 453 ++++++++++++++++++
 include/drm/bridge/analogix_dp.h              |   2 +
 10 files changed, 629 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-naneng-edp.c

---

Changes in v2:
- Apply the lane-dependent TX configurations in set_lanes() instead of
  set_rate(), and store the lane count for set_voltages(), since the
  Analogix DP core issues separate phy_configure() calls and the lane
  count is only valid in the set_lanes/set_voltages calls.(Sashiko)
- Initialize val to zero in rockchip_edp_phy_enabled() to avoid using
  an uninitialized variable when regmap_read() fails.(Sashiko)
- Fail the probe when the chip data requires GRF configurations while
  the "rockchip,grf" property is missing.(Sashiko)
- Rebase onto latest drm-misc-next tree.

Changes in v3:
- Restore the PHY related changes which were missing in v2 for
  unexpected reasons.

-- 
2.34.1

