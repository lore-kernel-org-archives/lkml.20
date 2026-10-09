Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FAA44E64E;
	Fri,  9 Oct 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552363; cv=none; b=e5cCxgMehIOnE+yLc1/4yZoRRSJT1hcATVGWIGwvSjwSDYp0P1XKQ9hv8XyY9Ps31F/hdbGkV07hBWCL5C8PcgSENfTJ3mFp3ycdJSiwhqSJfXdRehdv+v4ewCNQg+tko2p2gHRbyCme6U4m+e2dmsqGuJtGz8Pwuz5QFK8d9S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552363; c=relaxed/simple;
	bh=Isul0VnRb0UIDbTp9rtxsYmIR3NqMSYyR4nC7kjOiNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SADlVjXHNjd95q4DeTkw7aJ6hpOXvh6GmzBZoTPfPUe085KIcKZM4rQQiUFY0cxxfgZfnWe/R0VYGvXvhPYzzsVVnnr4q+n/kOsSEpL/gsouJCQGCmRYRHncjrdzSSPCLDWT52Aiy7ZdU/SCgxOFstCQVI/Y+gug9/SbdQwWykk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=i6l2LpQ8; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="i6l2LpQ8"
Received: from francesco-nb.. (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by mail11.truemail.it (Postfix) with ESMTPA id A13AD1FBC9;
	Fri,  9 Oct 2026 15:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791552357;
	bh=5lskzRZiJ/wLUBka/Bq8NWnKrbKgiPUxlSQcyyAYMDw=; h=From:To:Subject;
	b=i6l2LpQ8qfF86Vi8Cgi/4Mt38dxdm9qSO6urKGuUKTHN1GMR8OzMG/LGjyYD3E6cg
	 ns+S0c/4ZotRjwC7ayy+BVgTWSQdMoJjD2YdA9cM3Tv0614yTurGCoPJ43OsVBQkRo
	 NUgMTLmC+02+BLU/MC9Pu9D2WWyNSIpwB0eLIh6AF/kZJ+E7DtM0u8QDKROUocSCDX
	 Fsh5XSHg7A4/dPXxYh5+N3DMCIcpRQ/fQ89e156BEXx0RiwKJv5OROWvKqW7QgmyZd
	 Z21XypLpdT+nxZw96q/JlrsBb7C4UtBzjKqH5YfWhTZaqIsElwd14ejDLRmnVSGvpo
	 g9bCRSmmd4ZOQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx9[135]-toradex-osm-dev: Fix USB_A source PDO to 900 mA
Date: Fri,  9 Oct 2026 15:25:46 +0200
Message-ID: <20261009132550.20793-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Correct USB_A source PDO from 3A to 900mA.

The USB_A Type-C port on the Toradex OSM development board can source
only 900 mA on VBUS, but the connector advertises a 5V / 3A fixed PDO.

Francesco Dolcini (2):
  arm64: dts: freescale: imx95-toradex-osm-dev: Fix USB_A source PDO to
    900 mA
  arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix USB_A source
    PDO to 900 mA

 .../boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi  | 2 +-
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.47.3

