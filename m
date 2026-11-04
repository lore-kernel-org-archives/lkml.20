Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790413;
	b=PFtpSkvOxHIeVxST1wIllHh9qWAfekZ9TxERAYw0cYu/eHM3VMVepcvZWqH8sByVqc61
	 asZh3884TTNAotghfrKY7LXE/KlK0OYijfqLkyaDVFPlNfTNVdpLid4Bon8lFC5/f486H
	 6b9RpK6mTgyHDbjshesbVBB+bJX7iSgQW0vU6eyfBBaNcPl5D8yHdhPRqxtVmDtNt9l4z
	 QPEmGXjXWP6FMuOO2dxSYPMrBJTh7KxJlRR7wd14bL+Yu2vpsTslctWWcTyvSUyomScWz
	 lTUWEUTNr/j2llB6LD9IKT/DH9H3M5ZoLY8TYtjg/KBn6/B+5KUrxS3C/bE4Uvjoblw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790413;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UMqE8EVxBYiDVAgwLjMfmxM93uXTjiR58AH6MC3+O4U=;
	b=rXxkAqx9ubl/yZcTMMCar53mbbscGxeTVJwX9+m46TldOeXNsHwBVO197lBFnkyi59ld
	 +fzsIxT+IOcbR1lZilL+VRlh2V/TZrZefjDUL1Y1mz4ISaWkllSoUaKTUH6NN7zKWr2kp
	 +QUwd6eXThtDgWNqxAKNsrBtTQo7ERZPsMDE1CURgFQfQw60IPs5/jMrTl87uJfaQUziF
	 TzHo1fk9nybSI1ihn+yMKB9NgvatG+9EBPtH9sA+/31JkAzxcMotNMCsc0jzuktChrWM7
	 5+RAzJXtiyhU0cBSCdNt1KVspLlg/isVYnJaIQ+5BnHZOEmgNuvjkF2Y1ftBlwXmitA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=elG7yldB;
	arc=none smtp.remote-ip=91.218.175.65
Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DECA606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DECA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=elG7yldB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=90W3Vbe+A7EuTwCgPA1AIqMGxOjdh2ciRdVhxid1Mc0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790409; v=1; x=1794395209;
 b=elG7yldB6sqlf+DYHH88h/HcfX3C5m3SxEU1voeZtdU8dqe50+xUdM9qir62QNc/lPLthhjF
 RIsFjoWKEc2Y1UW1BNQkCBY0Rndr6ZtxgF+8MEE2RMKdTMzex7xZlqko2AAIBuKZgXebvyCFJO/
 nte4mpc/2vi1qoglprRcv5tF/x5jlZtB95Yq5LPujLDD0Qk7yTGA4tjooWBRc2T+JS5TOEssbuT
 3LjI1zTf1CrxC76nGrY6TP5MpK1fp5JlKOSlq7pT6VPixktseEt3M2Wh6e3BDtHmc+EhdTKszzP
 GyRCl8vJl/M6jwUvw6iG/OviIeznwjBMN8VN7ie3XFndw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2777f5a88c7f50cb;
	Wed, 04 Nov 2026 11:06:49 +0000
X-Mizu-Trace-ID: 2777f5a88c7f50cb
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH RESEND 0/3] Add support for FriendlyElec NanoPC-T6 Plus
Date: Wed,  4 Nov 2026 12:05:03 +0100
Message-ID: <20261104110640.1132917-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
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

