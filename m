Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB503BBFDB;
	Sun, 27 Sep 2026 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507140; cv=none; b=CdHLz+ALcanqms7nCuIJEVfP7fW7Lwu4nXkJFNcXgmH0T2IDTB8t8SktbQcOWgJxZrCCaETMoDpRusjIklclvkkmIlP8z23dvvDAbPAO3IOgeuht92nrkgs3mS+9zn+66/CS2xl3NeRu1BJsUs0gnhXDgKhM/Ft4rTrtnmI+9IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507140; c=relaxed/simple;
	bh=poN08yvDAAhf9UIIBErMuSeGn9BQ3mes0TMpLzvmJoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIqR3+EnPIPVhLNRUA6Q847BWpTeVlY7yrqlxPQuxEW99s8qdqo7dzfxdwP/EY4MbTZvTsBfDfdwcUFqWBmZ7pL7rya6mbzUj2cpqj2MJRxLQZGAFopXayl/bTEk9E8whErmQwapc3bCQd4K/yOD6EyOrqfmeF3NISv6jFPGE14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=OUQR4V4D; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="OUQR4V4D"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 33D2C20291;
	Sun, 27 Sep 2026 13:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790507127;
	bh=gpaaXjdlXODSgCKCY/4Mr6bPE7Uezooe0w7R1BnxDYc=; h=From:To:Subject;
	b=OUQR4V4Dgked0gsUKk2lTLiP/OFrWmTognhjNjGPkQN7Q0U81msgw6Z2L3G3v0u5D
	 9Zhuid7q420dPOHY8rW/jmfULmWMHAHtusQ4sqqtuwSr5JpDkqJS0yt7Tn9EwD43Z/
	 jN4GvEgPBVv5OrDzRwyI9T1Yu9B26BUY6rocTxtsSmtRm43RJlpdrxJTqJkr5MBaRU
	 IH6qB4a3sqdybDm/aQgQEOY6GVj0JQ0ozrY4HK4Gf8XOL+S4mi/ZS5dChXZmwHPqZj
	 HD1SOso/JHWard5UrvZndRexk5sLynf4eAyhajvaG20sXEMAfJHL01c9AbnlE9Zey7
	 rgQgeXMYKUWOA==
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
Subject: [PATCH] arm64: dts: freescale: imx8mm-verdin: add gpio-line-name for CTRL_SLEEP_MOCI#
Date: Sun, 27 Sep 2026 13:05:07 +0200
Message-ID: <20260927110508.60922-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Verdin CTRL_SLEEP_MOCI# (SODIMM 256, GPIO5_IO1) is the only SODIMM signal
of the module without a gpio-line-names entry. Verdin iMX8M Plus, AM62,
AM62P and iMX95 all label it SODIMM_256, do the same here.

Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index ac450fc6cbfb..4f64c5da8d15 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -353,7 +353,7 @@ &gpio2 {
 
 &gpio5 {
 	gpio-line-names = "SODIMM_131",
-			  "",
+			  "SODIMM_256",
 			  "SODIMM_91",
 			  "SODIMM_16",
 			  "SODIMM_15",
-- 
2.47.3

