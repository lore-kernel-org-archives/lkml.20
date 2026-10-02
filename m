Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD847F3C5;
	Fri,  2 Oct 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949822; cv=none; b=kiCHptIZWF4yeVzTlr8cNyRuYDoA0E4YKPQRrB5y4cRZP/jyelyj2Tc+LoaZE7feO8sifXWPg7mgSFfmsrIu960IUhoJiCH3KUS2cShYgHd9do4YDFV6EosO00przZPT7HeZebPWXOCZlNFL3wBB71j/SLRbQw+FrN/8bfeGTX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949822; c=relaxed/simple;
	bh=r2T3TwSRRt6cZsE4b78cYlmWBY1IdMY1DnlilJ/4BO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDYOXLHDgFDrb8+evv3l9Dq7vDLOwHHOHsMCJm5rjf8QtL9xF13l068ELuLx7HSfyV+s5Wm1ZZqX+ei98n7yS5x1UcDSFqM8M0puMaT8u/9D5AkMYngkZ2Vh3KGpCfxevR3/OjHhep3YI/QUHqgx1KpEmkHGDG/7+0t+NG+ogVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Ouw9q+8R; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Ouw9q+8R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=J+tYcXPbOxaIBDKGbBQGTpSuvi0uZa0xzFEPBfG60do=; b=Ouw9q+8R52UUZub73RUz2y31dP
	qJcTaJlczTIpgOxKmq4VRCi6mMCPcwrFRhV6oN2JWcrEk8yuoudzcsYzvCoHGJemDqUaKCPH8J6FX
	gh+XEPw4Fal++Ife9RqjRMfeKd4+nuvVariukHzGn3fd33G4yoR3Tzcj816FMTxlDZS2Du7Lzt4do
	OyrlWb2GIxZ4jhGvQQANLhxtKhkDFbHRBtY3Gm17dEl70qgyuOE+VUI2JDJRYB15aHncZKBpjqKFR
	4T8/SgkEwwvxPP/9UQUFEMx4Z8hgdqdI8E50xMCSN4HgtPzgIJT5EOlPRMmJyIsNGA0Cjgl4kSmfK
	8554L3tg==;
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
Subject: [PATCH v6 0/2] Add RK3588 Tiger DisplayPort carrier
Date: Fri,  2 Oct 2026 16:03:28 +0200
Message-ID: <20261002140330.2904616-1-heiko@sntech.de>
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

changes in v6:
- address comments from Quentin
- Remove misleading dp/hdmi hpd pins (as they would have inverted levels
- drop dp-connector label - it's optional and the board is not labeled
- drop redundant uart2 pinctrl-0 setting

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
 .../rk3588-tiger-displayport-carrier.dts      | 110 ++++++++++++++++++
 3 files changed, 115 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts

-- 
2.47.3

