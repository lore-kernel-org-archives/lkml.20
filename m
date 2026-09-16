Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9425478851;
	Wed, 16 Sep 2026 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548043; cv=none; b=oUibvoJ21C1oykZEA7OvGU1h1YWRXpeirJnMwxct0DMv32pw4xh5RGm94BZVy4Bl8eTNNhek9P/fgZVbP1SNelAO6DqZi5U4ZqqgGAaEJUb+1J2g5Ff/O3o605o9ybs/oUFseRgSp1OkHxR3ne0/S77nAwKuyEX6GI6FadJMyZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548043; c=relaxed/simple;
	bh=YtbZ81xGfiyOxFBiNUYEH130bSijS8al+NPamB3XdpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cjjzE7N4R3WylwqTVdPdXXP6I10dF8SQ2J1KEYOPr8G4PCRKQKIthgUiVjXz1KhX5QTMUmgCsLALIv+nRgQ4u438x9FwvIBMYTLLmRIofRehhAGS1eBTPekeHwPc/CptvZlRp5ce6GsRZx3GSmB9SkkIltjUE4cfpRyTrf72f4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ZtgpSXN4; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ZtgpSXN4"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 2DB851FEC6;
	Wed, 16 Sep 2026 10:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789548032;
	bh=1jWVery/jvPjaF54+b9Mmqq0RRFOnxJSGo1ftYeFQR4=; h=From:To:Subject;
	b=ZtgpSXN4Cd3Q0yxWwkqm/ZJ2E7QsWHxYCQYVaD0o4cf3wl8ddlH6trj7l/LYrIR92
	 OPtoZRFRaL0hV+su+2Bdgodn1ZwnkuhxdCsq1QYea4W+fYNxR+hbyYgo6nnqM+E+bR
	 OtHg8TNdruIqrNOR5Orit2IF4oMhaVuqPYyAYQBJyAhzSMSSut8x1h0usEvRlhGr8S
	 3txOvmepE2W4L/QwIJf6K9dCp9CCrFXCMA6JbQWfdV1EDYVp22N2CdrI3WhWCprChG
	 9MNaaUmmaNWNvcceYaxFAc8OJ2FrZISozgm44n04sSbcXsCZwwsjqcX4F+m1Av0IS/
	 8dbMyGYYuLfuA==
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
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
Date: Wed, 16 Sep 2026 10:40:21 +0200
Message-ID: <20260916084025.274229-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

gpio-line-names names the two Ivy digital inputs "DIG_1" and
"DIG_2", while the official Ivy Carrier Board datasheet (Section 2.10,
Table 12) names them DIGI_1 and DIGI_2, matching the
k3-am62-verdin-ivy.dtsi variant for the same carrier board pins.

GPIO line names are meant to be stable across the whole Verdin family
and its carrier boards, so userspace GPIO tooling that looks up a line
by name works the same regardless of which Verdin SoM is fitted on
Ivy.

Link: https://docs.toradex.com/116799-ivy_carrier_board_datasheet.pdf

Francesco Dolcini (2):
  arm64: dts: freescale: imx8mm-verdin-ivy: fix DIGI_1/DIGI_2
    gpio-line-names
  arm64: dts: freescale: imx8mp-verdin-ivy: fix DIGI_1/DIGI_2
    gpio-line-names

 arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.47.3

