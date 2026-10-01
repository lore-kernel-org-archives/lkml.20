Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EAD330B01;
	Thu,  1 Oct 2026 17:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876983; cv=none; b=JMyvlI34w5r03KH2OTRr27MpcddUGxxVz5FRYqvwhpCgB5Q9WdeIv3LdTTOyyLC6hKdFSQn7e7qgtlPU4VPf1oL6RdGNFuYuTf+nAKeQzItCvumFAO+aC/TAgCQpi39oAEGpYATG6aYbbSdCR6Gue7fq3y0JfkKh9nUJpOurcvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876983; c=relaxed/simple;
	bh=XDpZtF12fOWG0et9UV5kwZQXNGjQB7CTyY320rc3jWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WwOpoyYkkNCwJ0NsT5uDhLz70PUgvQHNDM2aiQ+CocHugx0b2SPt4Vqsj/PO8CJKoPsbj5Up2dOxvvOMrHdnztVly27wY4N3eDJQ68GwaOmS5h18jkIhy2LCNjueroGdTOtTpU7EFLbLokcKUjjMSR4ie2h7/yFtFDuj+OdHJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=1K4JJy8i; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="1K4JJy8i"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2FE9A1FDEB;
	Thu,  1 Oct 2026 19:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876971;
	bh=yRMFVN1HT6+zFmJEuXLl/iU0H6OSpKVPa/q1510L2Gg=; h=From:To:Subject;
	b=1K4JJy8iJ1DAPpa9k4NWY3Nys+u9mkuzQXupISnjMuxu+mZu6ozmlR//fIKOAihWC
	 r2nImulR4aC4jS/GoVxvZEp+25xnF3AX7e3y7W8Sl6Eax3mS3QeOPcIE2xPHfbs86N
	 5GRDYJTnwHxjirMH6hUZvLKb8Re9Trt1bMUO6/e/xKnFB0/MeUFiG2oIl+wVFJUfXH
	 T5Qw94fn9uKlGdwhepijyridjzaaOEPRCsA/cl6vQ03+D0WpmA3LHSQz9NlrKi7/Rr
	 f/jT0CqqsyEDU/5dEr5P+gOj239v+Vqs7cWhQYaEYOeOwfiM3i6jp32G/5xP80mtYD
	 Jjg8pntUBiqIg==
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
Subject: [PATCH v1 0/7] ARM: dts: imx6ull-colibri-emmc: Add DPI display and VGA overlays
Date: Thu,  1 Oct 2026 19:49:09 +0200
Message-ID: <20261001174924.3831455-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add device tree overlays for the Toradex display accessories on the
Colibri iMX6ULL eMMC parallel RGB LCD interface, mirroring what was
recently merged for the Colibri iMX7 eMMC:

 - Capacitive Touch Display 7" Parallel, touch on the 10-way Capacitive
   Touch Interface connector (Iris v2, Aster)
 - Capacitive Touch Display 7" Parallel, touch through the Capacitive
   Touch Adapter (Eval v3)
 - Resistive Touch Display 7" Parallel (Eval v3)
 - VGA output through a non-programmable video DAC (Aster, Eval v3,
   Iris, Iris v2)

The panel, backlight and LCDIF part of each overlay is identical between
the two modules, both using the same LCDIF binding and labels. Instead
of duplicating it, each patch moves that part out of the corresponding
Colibri iMX7 eMMC overlay into a dtsi shared by the two modules and
includes it from both. Only the Atmel MaxTouch wiring, the conflicting
PWM channels and the BL_ON pinctrl and GPIO driving the VGA DAC power-save
input stay in the SoC specific overlays. The shared files follow the
imx6ul-imx6ull-*.dtsi naming already used in the same directory.

The first three patches are fixes needed before the rework. Patch 1
(from Emanuele) drives the VGA DAC power-save input through the BL_ON
signal, without it the Eval and Aster carrier boards show a black image.
Patch 2 adds the Colibri iMX7 eMMC touch adapter and resistive touch
.dtbo to dtb-y, as they were built only as a dependency of the combined
DTBs and never shipped by dtbs_install. Patch 3 aligns the Colibri
iMX6ULL backlight brightness levels with the Colibri iMX7 ones, the LED
driver of the 7" displays turns off below roughly 15% duty cycle and only
the three highest of the current levels produced a visible image.

Emanuele Ghidoli (1):
  ARM: dts: imx7d-colibri-emmc: Enable the VGA DAC

Francesco Dolcini (6):
  ARM: dts: imx7d-colibri-emmc: Add missing touch display overlays to
    dtb-y
  ARM: dts: imx6ull-colibri: Align backlight brightness levels with
    Colibri iMX7
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display
    7" Parallel
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display
    7" Parallel with Touch Adapter
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Resistive Touch Display 7"
    Parallel
  ARM: dts: imx6ull-colibri-emmc: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile            | 47 ++++++++++++++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 46 ++++++++++++++
 ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 31 ++++++++++
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 16 +++++
 .../dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso | 24 ++++++++
 .../arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi |  4 +-
 ...olibri-panel-cap-touch-7inch-parallel.dtsi | 29 +++++++++
 ...olibri-panel-res-touch-7inch-parallel.dtsi | 30 +++++++++
 .../dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi | 61 +++++++++++++++++++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 16 +----
 ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 16 +----
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 18 +-----
 .../dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   | 49 +++------------
 13 files changed, 298 insertions(+), 89 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-res-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-res-touch-7inch-parallel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi

-- 
2.47.3

