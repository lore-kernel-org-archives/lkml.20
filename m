Received: from mta0.migadu.com (out-241.mta0.migadu.com [91.218.175.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A0C48AE24
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783866; cv=none; b=J3YsICo/7eDrOLmZsCA7zzRGtVje2P1JqaiE6YEaCIZyk38mvsGUIHOcvgzaPWvtSC6p0uAj/yZwUFwav6RFUdItT7g1lW/G9dTeTXzgp4H9rK/mRIDq1Q+y89MHyfCCeKlGhT0lRm9lJ63NKePLJtFDTP/zP+CWYmd9A505twc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783866; c=relaxed/simple;
	bh=90W3Vbe+A7EuTwCgPA1AIqMGxOjdh2ciRdVhxid1Mc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obL9yRiUjK+sfzIkYkzMTMe3JA+jXLKDyBgWbw6nz2x9xITXzwfeQ9xscZ29DebhvOIN/g5XEeLq3TECIMJnoXgXjwfAB0KLfwSgdfBBUKsoPYdWJiULcg7UhwtsNUAHsdAFFy1Sc3iZpOO5bp+6muk2fj9K0/9lC4my+y0ACpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=AAZ6fEko; arc=none smtp.client-ip=91.218.175.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="AAZ6fEko"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=90W3Vbe+A7EuTwCgPA1AIqMGxOjdh2ciRdVhxid1Mc0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788783861; v=1; x=1789388661;
 b=AAZ6fEkoimQZ49kwgCPgGsy/DKH1kyQ7ppAqmysUpWTiFdLQfOAGm5EpjBkrBfnsCaMqhcRA
 5567/83zScWinTC2HbOHmU2nGKPPMXlVoXEGZPIJXDy8E9XzSiBlhOZ0AJlBy3evz605Bs4NpeT
 q02igNHIBZfDIDCIB6o5tnt4KSa6VJhSSkrwbV7asgopLpkVhzCGe1avrOmeftsusJ6WsKS1uMa
 LQ66uiweNWDha2m2V6H5J0zq1An9dEOqPGVDyi46daHpt2yXUuYoVn351S+gzqquZE4090ziMnd
 fJH3mbyjv3/+6mCD8RMTpvwuYRA1EMQkoaIAH1PORXflg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 253942340c5df991;
	Mon, 07 Sep 2026 12:24:11 +0000
X-Mizu-Trace-ID: 253942340c5df991
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 0/3] Add support for FriendlyElec NanoPC-T6 Plus
Date: Mon,  7 Sep 2026 14:22:42 +0200
Message-ID: <20260907122406.1862398-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie adds support for the newest member in the NanoPC-T6 series,
the NanoPC-T6 Plus:
https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6_Plus

The main differences between the NanoPC-T6 Plus and the NanoPC-T6 LTS are:
- use of LPDDR5 RAM
- addition of an M.2 B-key connector for a 4G LTE module and a companion
  NanoSIM card slot.
- different audio codec (Everest ES8389)

Support for it is added as follows:
1. Add the NanoPC-T6 Plus variant to the DT binding
2. Move sound card definitions to board DTS files as the Plus has a
   different audio codec
3. Add basic support for the NanoPC-T6 Plus

Diederik de Haas (3):
  dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
  arm64: dts: rockchip: Move sound cards to board files for NanoPC-T6
  arm64: dts: rockchip: Add support for FriendlyElec NanoPC-T6 Plus

 .../devicetree/bindings/arm/rockchip.yaml     |  1 +
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 39 ++++++++
 .../dts/rockchip/rk3588-nanopc-t6-plus.dts    | 91 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dts    | 39 ++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 36 +-------
 6 files changed, 172 insertions(+), 35 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts

-- 
2.55.0

