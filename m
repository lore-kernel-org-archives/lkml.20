Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6029C4F30E3;
	Wed, 30 Sep 2026 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785574; cv=none; b=kxGh3xoBGSJdvdFdeQhzuHy+YaXrgjCFIhuV+jCseTrd71WFyCkQUPlaZq9CtF12PmAjBBsgbf3hywtSwKC6nZRi8ORaKNiqovy8AAjqgBY1t47xhtKs+CgUDaV3+ea1/YcOxwYAzcqemHHW+O811d4iMdyXBPtWUiZiHyYpB+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785574; c=relaxed/simple;
	bh=52unVx4WXwmj1+7aWsnlyxM6kw6rbQbi6mJ7uqJ10D8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfRcRCSfcNYbPFXL1RLSXxxS01BQOIQI9TK+JnlViMzAgqYnlwy/XiTBAmHBcR0kO9Lb+ctJJ7b1JDcwwkLHPt5LcNalsUqRpfm+hupwwxS14JaEX2H7z+LBrpffH/nDWc+g46umLkdkk159di3OjYMfx7TaTVD9JT15SN7cvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=yaRIcbs+; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="yaRIcbs+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=d/n2Q7iLBDzlJSxI9q5zVVPLJKZXlFAXccXeWNTAMwU=; b=yaRIcbs+Yn1kstzUv+9ol1GoeZ
	5LGLiCuBMzCb74RnH8vseVWpY+i+ggkWFPw//9drVl/6reqm18kGMMoMwGZZ+svLcZA4Ocay/4GYL
	Gvi8oxgs8DdXMPnOqz8eE90nUq/FmRQciDxo8azg/Qqwf5M68g//6/UmSkyb/l52iPsO0SXjUpb5/
	lDjL0sGdakuRoWTa+f1dBJ33Lr9zQahNMPI+qpv1ALu1e660I1ooJLai+pkJJqRDGrtKnhoIwVZ/x
	3xfAIbxUbOMPI4Is6Oah+gRUmtQnoncGN2h575qQ2Q130zTva+8MowzWygrXoZiOi2vNDQXTesK+U
	Di0BLniA==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com
Subject: [PATCH v5 0/2] Add RK3588 Tiger DisplayPort carrier
Date: Wed, 30 Sep 2026 18:25:42 +0200
Message-ID: <20260930162545.2357505-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A board that allows easy testing of the Analogix eDP controller on the
RK3588. Requires Damon's recent work on hotplugging the eDP controller
displays [0].

Concerning displays, my current setup is

  DP-carrier -> DP-port -> DP-to-eDP converter from Aliexpress -> eDP panel

which produces a nice 1080p image.

changes in v5:
- didn't take a year since v4 ;-)
- drop wrong quotes around Rob's Rb
- drop wrong link-trailers that slipped into v4
- disable mmu600_pcie for the time being
- move hpd-gpio back to the dp-connector where it belongs
  With v3 of the hpd series, this now works as expected

changes in v4:
- move hpd-gpio down the the analogix-dp node
  As stated in commit cb640b2ca546 ("drm/bridge: display-connector: don't
  set OP_DETECT for DisplayPorts") the dp-connector can't just read the
  hpd-gpio and mark that as monitor detected, instead 

changes in v3:
- rebase on top of 6.17-rc1
- still should wait on the analogix bridge support

changes in v2:
- collect Ack/Review for binding
- address Quentin's comments
  - sorting in Makefile and dp-connector properties
  - ethernet alias
  - drop data-lanes comment

[0] https://lore.kernel.org/dri-devel/20260928081418.3605775-1-damon.ding@rock-chips.com


Heiko Stuebner (2):
  dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma
    Systems
  arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rk3588-tiger-displayport-carrier.dts      | 113 ++++++++++++++++++
 3 files changed, 118 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts

-- 
2.47.3

