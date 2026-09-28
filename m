Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4286E4D37D9;
	Mon, 28 Sep 2026 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628656; cv=none; b=Z6MzuszUYy9bdTZNFORrhHrptH6Zntb+M6UQe/ItTylrw5AZs/kEhbG2LuAKFjM2EOC1VD6lEx//Hw3FN6F344CWYMGN8kdNNSjCcyZlcC4BUDHaMIZnJNWwZVzb18lBOBQ8wWd4ZldMnIzYN9P86vnHLQB2jAdR99WPD3IN0gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628656; c=relaxed/simple;
	bh=SegqKujbacGt9BNS9my6dmF8eS1hZiOA8I+1qBjca9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6BJCEWldfHhs7ZGh24P0VofmEZfC1fCWTGcbzlnFd5j/yuqAKEW+C9MhMfH2F9XsoIJOl4p8ZP0+GRaGyR+x62BIHSf4pgQSWWtg8bNX6vPH8IcubOVMBPLikSbDIcVFUBtQ1eSMYL9oSS6nuPvWY9vd+PVnv1S35SWMlHrq38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=YdzikDFX; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="YdzikDFX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=KihxK1P3oy+g5YHPx1kzAUcYW62SHsTbFZU9CTfYxe8=; b=YdzikDFXBbNRK3Br3DaLrq0aLv
	cYf5zrb8YvUPQbIGalWvvk2A9Z1+ZDoyCi33RH9hOHPTp2ctmQ/kdV4Jir3l5DU4sBlEzXgrbAYBv
	M4WbRX0CiTCRSF1GiUT9EUKl07Aeo1mi8yveCukrK6a19WTozePNIxs0uOwnkshYU+l4eJ349AoTS
	fF+Kdi/+1/mpumFP6FKLtxPNsPVAt9XI3PGP3rtM2giibuOsLyM/zKi3Ac/ZRpnM81a0gGEhFJ4yH
	+adRlj4OeFDuinTiCKDb/2r2C/yG0FS0ssbKpMVMnBpBK3L9nPqSOEs6bGgDwzxEwBaLPYowRDPyI
	UGY8ABfQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIJF-0000000F7qP-3wNI;
	Mon, 28 Sep 2026 22:50:49 +0200
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
Subject: [PATCH v5 0/5] Enable Bluetooth and WiFi on K3 Pico ITX
Date: Mon, 28 Sep 2026 22:49:05 +0200
Message-ID: <20260928205012.3689405-1-aurelien@aurel32.net>
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

Note that WLAN support (patch 4) is only useful with the following
patchset, but they can be applied independently:
- https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com/T/#t

Changes v4 (unfortunately wrongly submitted as v3) -> v5
- rebase onto spacemit/dt-for-next
- explain in patch1 why the change does not impact the DT schema
  validation (reported by Sashiko)
     
Changes v3 -> v4
- fully move the phy definition and the board level
- rebase onto 7.3-rc1

Changes v2 -> v3 
 - reorder patches in a more logical order
 - rebase on current linus/master
 - add patch 1 to move phy definition to the board level for the "usb3d"
   controller
 - remove link to USB3 phys, they can't be added if the combo phy is not
   configured accordingly - also enable Bluetooth and WLAN drivers in
   defconfig

Changes v1 -> v2
 - Rebase on current spacemit/dt-for-next branch
 - Collect Tested-by tag
 - Add link to USB3 PHYs in DT now that K3 PHY support is merged


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

