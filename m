Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7843DDAE6;
	Thu,  1 Oct 2026 15:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870061; cv=none; b=e1g49MZ9UKMNPhUDb3/ffjoNvvV866YrQXEYCnlcPiOkMAqUvyrHy9VrdGlp3B21mS6I17Men6edz2DOlR58XZzl+YntB/eDRV8ol5pxmxGELGgYIRG3bdGNT6cc0Cc7Q3yRlNpFcQfDxS501qiiQNgp1dmHJVhaqecaYXY5MCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870061; c=relaxed/simple;
	bh=3G6MctPuFEq3MjP/UFIoNxPCj/ilxJu+9NYiVdYelYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D92AjKeY40I3bOiZbYmZA0b6zpIbgMS7I6FpWFP+HLFdkhGLHtDM/Cry1bjaMLqo4HhPwi7h7Fm2f99c4q2zCMIGPKXd6bRalASmY8O+02TWz5nr/F/JIwICMOrN4uc03jWZPrTuq4Lyk6YyhJP5wx3Lod+08NeX3cRmz6hjr7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=jxkKekKc; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="jxkKekKc"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C6C8B1FA7B;
	Thu,  1 Oct 2026 17:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790870048;
	bh=nldvaWty8I5E20Jn3Utrwqefv4fix1llm1hvljMYchc=; h=From:To:Subject;
	b=jxkKekKcuQjNzIIkOuifbqr+9Mn9hf0cPp3k36cSqiwJdeIqPzcxTstKwWCsWTF4a
	 W2SiyfCqAMDXXWQqmXSgfASqUJ4yJtX/IPlYHdncsRRbRkk9n+3cXM/6Q+p8nNLtmW
	 LWoElcmIZZ5taiwYEKPPxjw4POfiaDjloEXHQIcP3+tbx+fpKl755I+zuKUKe1Irlc
	 RtQ02KUWt7DhhKeK+iqEFgWKrVZd9qtCqg/ah1Un5cwO8D5mvSp9Iyf6JTGLR51V++
	 i8g6QfdnezHG1DvBnJP5kxnPweGzphsjYkfWIT+nKcTb6M9qkZZG+2CdJPD2XjQ0T7
	 1ulx6gGzInDqw==
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
Subject: [PATCH v1 0/2] ARM: dts: imx: enable SPI on Apalis iMX6 and Colibri iMX7
Date: Thu,  1 Oct 2026 17:53:57 +0200
Message-ID: <20261001155401.2584935-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The SPI controllers of the Apalis iMX6 and Colibri iMX6ULL modules are
disabled in the module device tree and no carrier board enabled them.

A device can be instantiated from user space through the spi_master
new_device sysfs interface, so enable the controllers on the carrier
boards where the signals reach a user accessible connector.
The Colibri iMX6 and iMX7 carrier boards and the Apalis iMX8 ones
already do this.

Francesco Dolcini (2):
  ARM: dts: imx6q-apalis: enable SPI1 and SPI2
  ARM: dts: imx6ull-colibri-iris: enable SPI

 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi      | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi   |  5 +++++
 4 files changed, 35 insertions(+)

-- 
2.47.3

