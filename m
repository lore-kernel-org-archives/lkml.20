Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703215;
	b=Vx12XHuFGFdPGbR1Ras1uLPySPL3If+tumP/qcK0grDhQ0NE6pE7ZuTRJBTS+DyL2EKW
	 7YMR4Wzjw0sI4HTlP+1809VevQLdIiPPvkSODQgy7//R3NGoWfJptxQiSexUR2eesrqrK
	 ULKRKRLGdfg2jrLp1iDZzaTLzqZacchuMGkn5tgx0bWjsFZFydZprQKaWhXXWkGPuOsYK
	 QEUGCYS57oB1+hjfUOPrUam/0gYBfAXtqd/Bu+ifVl3EXVYf84JDpPNVtxZdlGuVbO/0x
	 Kml6JKtr1TArxXzGyqAbuiXdhihUEHscbcG58oo5rPeL7SNN2RhWLiiugUUnraZcePQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703215;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yZULAJenn5FpHFmW4iJ5T1lRKnAas/th6WVGZ4q3kuk=;
	b=RGIM4uqQi3k0Jed89lOkPVx+htlybbgNEQ2AWdLlRJ64WUs9QnIwG2+v/IFgLRf/l7wu
	 +Y3l9Nik7sOqOLzXXOMOZa84KZnZqpdyY4xbvYFAJPke2vASbK9SQOoPENnDghoATolPF
	 BOp8Rpp4wMra5VZom01di3yWQOCLLK1JIbONu/cfCZ+WdYBSEP/JOHQ5+w/XFiFEV8Mf8
	 Ql/fs2VZ6FD7uTL06pPkawOZHK3l0YfBK2PF+yqK3Of/4LHRQZ0PV8Hf32G41pQUB0HaT
	 XpWiRoCXrtaKhFNXcrUoBA/0dKTPPx5ly6pGW9UyWJLiKSf382FDvc1tyQwqL+Vr3lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="JrI/Tnsa";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE059606BFB7;
	Tue,  3 Nov 2026 10:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE059606BFB7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=JrI/Tnsa
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 4A7991F9E7;
	Tue,  3 Nov 2026 11:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703211;
	bh=yZULAJenn5FpHFmW4iJ5T1lRKnAas/th6WVGZ4q3kuk=; h=From:To:Subject;
	b=JrI/Tnsa0kSXWpKhwtP3yZXkHs8CvwVT15jM+DkFLfbHf0Zc0trrLBgE7ncGtxlhI
	 587POREeU2MVGpUlWuN4qMBFYQvZWl2oC2f5WtZ38SmKcJ5S07F4V0OldOmDhVYlsp
	 ecXD6nYfUXr2s9pAmNNwR3wry4M1O8tcH3OImosm9a+50tM8njMia776EhcCG1aVVd
	 1iWIhGv5rBIFGQZN1yQvx4ZLwIm5V7+zArjdqKEGFDT4w6LCc984wZ8v6Sm1wWTvfX
	 Sdf2kHKBR0hnlPCLeSD1mgNtHqN4PxLedWeianJDHbexeviuvwLJ3WzpTuYh0zSJZe
	 HemnP2pmBvW/A==
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
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx95-aquila: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:53:14 +0100
Message-ID: <20261103105323.2394012-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Francesco Dolcini (2):
  arm64: dts: freescale: imx95-aquila-dev: Keep DP_PWR always enabled
  arm64: dts: freescale: imx95-aquila-clover: Keep DP_PWR always enabled

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 2 ++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.47.3

