Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926AE36E46C;
	Mon, 31 Aug 2026 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151557; cv=none; b=bbhVZ0AZH/Xu2T+HprftAL6gilXb82+ntaTz9VloqQpbnbmFWnKStZuTY79XVnqzVZbXHOmbEtEg1Ey9Kz1FZu715DXVO4O71v081TF9lCb1Zz7OevRwUosNaLYeZ8qJRcWKnYF/swdVqaVJGozFHvW07GOFfXetnv0NcEAQQRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151557; c=relaxed/simple;
	bh=ngmU0O+7LC4qNi14OyQl5sMqNVQyTsPn7CDGjvhLAFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AgTrhpd1ViaIkNmwDWMeE7Q8yezmrEMgtPRx7+OiajK27J235gSeS1FS4ksP/T/HfAodsp/oKQTjJUg84zgk7uNWZD2n7fnmnj3amtyGtBoPfrxjdEq5WloQZLXynQJ3ZAUh9ph7a1ShNdNyGFGv4WTkmZN5PhCtUeJkBJUPZAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=nJqJGPeW; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="nJqJGPeW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=ZXkyoIVnaSDzBLzZUNxox0KZYmsWGJCl9Qvu71vdy4w=; b=nJqJGPeWSyeaMs+3tuHykj3qDr
	vLLd7iD597xbqRdaRH+lvZwO7hvr9fV2zQJL1VuHa6qtrn09su49dfqFRiCRL8cqqitvv+Bh+zIY4
	duToABx/Ycm8ukb52R+/mV9FKF6/Trg/o4aWE//pY1doMr46PpofHwfaBrC8ulOgqhVnqWLBz0Ext
	y5QMzhsX8MWeKgJcF3ew0SLvK0YRN5raY/HKScxJoYy13BHmQuaKKM+bmI7knz8p98KaG0kziO9qS
	Ki7OMldqSg8iUUCb5nHOf3bpEV8X5WXNiJBFQOmhvVMCCKkOXfaWu+RnRcgXI/dVsssGReJ+rUSTj
	2aqmSVwg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu2-0000000Apdz-0TjU;
	Mon, 31 Aug 2026 06:45:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH v3 0/5] Enable Bluetooth and WiFi on K3 Pico ITX
Date: Mon, 31 Aug 2026 06:44:20 +0200
Message-ID: <20260831044540.3304350-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset enables Bluetooth through USB on the K3 Pico ITX board and
adds the rfkill nodes for Bluetooth and WLAN so that the devices can be
activated.

Note that WLAN support also require the following patch series, but both
can be applied independently:
- https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/

Changes v3 -> v4
- fully move the phy definition and the board level
- rebase on 7.3-rc1

Aurelien Jarno (5):
  riscv: dts: spacemit: k3: move USB3 phy to board level
  riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX
    board
  riscv64: defconfig: Enable BT and WLAN support for SpacemiT K3
    Pico-ITX board

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 38 ++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 63 +++++++++++++++++++-
 arch/riscv/configs/defconfig                 |  8 +++
 3 files changed, 106 insertions(+), 3 deletions(-)

-- 
2.53.0

