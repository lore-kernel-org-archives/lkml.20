Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920E4499B6;
	Mon, 31 Aug 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186064; cv=none; b=b/s0dxGyRcx/e+fzysMeFCVK4NWcwHd/UUrE29XFiJS9gEo63xlJUFS09EF7iIY5s37r5J/E/q0bxfSj3dQKUy6Gb+aQuWKlN3UHb0cfURJw+GJgcfLHLkP8tnLt1eC6QC4wD7eKdxNNLOPkooJ0irGrGzh3jrO2qNFJYx8pVF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186064; c=relaxed/simple;
	bh=ot792P61hDoD7zuKxG0gMHaJ3eU44352gH7eU0h4ohE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WdXRnAN07lPrqEa9NLAtS0iV9KU/ztIoULw1+FOSNavaEy30ULFPrDoA7/IrEPj7lhu5jCqNluPSle2SfnzuRLAyfomuWcMvSQ/jMbt2SRKG0eN4ziNhqRzg55PhjLA/V9GQr0ZLJ1dmrpDQwSnkhEIgUNPdcvsgczZAwSLnzGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=flN6rklC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="flN6rklC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186060;
	bh=ot792P61hDoD7zuKxG0gMHaJ3eU44352gH7eU0h4ohE=;
	h=From:Subject:Date:To:Cc:From;
	b=flN6rklCWLgo+IEPbSBXz/hlvPPkUalq3ts9StL/ubsmQtaoEKGH70LhMteRZYg2o
	 SwOfrMcEz7UtEz4unOuxE9lTTh15Uv+tn4Ldlchrnnm4EO8zZ+s2NlPJ3QbltM3Bg/
	 lopVGnPuUH0PFD5317oruoSXsvdGE4ap0v6Lr++57X+eHAV2/XvWHz0aLzfNx98TYv
	 oWWhOcCfkZGk6+y9b0bdG/92QqAiOIqVO4tbtbzRwakmime+1ubaIC8IpaBTq4eM8F
	 6E8FqM2nuMyXPS5rs4t07xcX45HphbbnCXAOS+UNIr4EU2Z2qjZMa2Na+yyVictwQZ
	 4gaW4B2pHFrMA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C56317E0069;
	Mon, 31 Aug 2026 16:20:58 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/7] arm64: dts: rockchip: give HDMI sound cards
 SoC-specific names
Date: Mon, 31 Aug 2026 10:20:47 -0400
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtop47iq4iHmGY2ytrROBHG3
 t2qx+/w/yuYVBWDU7dClZealtzgdx1wonwT1NgMvesHF/YeR31jLfzgpDOmOCnSErVgpkkMA3t
 HcTiMx0DQHnOVFvz+58vftlzvws/vFLbtA3I9jbWBAAAA
X-Change-ID: 20260831-fix-rockchip-hdmi-audio-names-8c10ad64f58a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Hello !

Some Rockchip SoC that exposes HDMI audio through simple-audio-card
currently expose a generic and inconsistent 'simple-audio-card,name':
- HDMI on rk3066a, rk3288, rk3328, rk356x and rk3576
- hdmi-sound on rk3399
- hdmi[01] on rk3588

That string is user-visible and it shows up in aplay -l,
/proc/asound/cards and is what ALSA UCM, WirePlumber and PulseAudio
match on when picking a profile for a card.

As the names are not unique across boards (5 of them use HDMI), any
userspace rule matching on the current name is ambiguous.
alsa-ucm-conf.git has no upstream UCM profile matching "HDMI", 
"hdmi-sound", "hdmi0" or "hdmi1" for Rockchip, precisely
because such a name could match on the wrong hardware.
It also prevents alsa-ucm to hav specific profiles per SoC.

This series renames each card to "RK<SOC> HDMI[N]". The new names:
- are unique inside the Rockchip family and self-describing,
- fit the 16-char ALSA driver field after normalization
  ("RK3588 HDMI1" -> driver "RK3588_HDMI1"),
- give distributions a stable, unambiguous name to match UCM /
  WirePlumber / PulseAudio rules on, which the current names cannot
  provide.

Because no upstream userspace configuration can match on the current
names without misfiring on a different board, this rename does not
regress any known userspace setup and allows reliable matching on the
different SoCs.
It also gives naming examples for future Rockchip SoC enablement work,
which should avoid naming issues from now on.

As similar rename was already previously accepted in commit 309598fca339
("arm64: dts: rockchip: Use a readable audio card name on NanoPi M5"),
which changed 'simple-audio-card,name' simply for aesthetic reasons.

Detlev.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (7):
      arm64: dts: rockchip: Rename rk3066a HDMI audio card
      arm64: dts: rockchip: Rename rk3288 HDMI audio card
      arm64: dts: rockchip: Rename rk3328 HDMI audio card
      arm64: dts: rockchip: Rename rk3399 HDMI audio card
      arm64: dts: rockchip: Rename rk356x HDMI audio card
      arm64: dts: rockchip: Rename rk3576 HDMI audio card
      arm64: dts: rockchip: Rename rk3588 HDMI audio cards

 arch/arm/boot/dts/rockchip/rk3066a.dtsi        | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-miqi.dts     | 2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-fix-rockchip-hdmi-audio-names-8c10ad64f58a

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>

