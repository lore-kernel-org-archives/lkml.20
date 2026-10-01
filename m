Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1318525A6D;
	Thu,  1 Oct 2026 17:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876981; cv=none; b=FSj3nLTi+odVTV2a7qXE2xOxpAW/SpxbbibedO6EHJFmYnUeoz/IdCWsS33BU4iKg12dl3K694TcTr19L6IWOwjdnF7qCJMO2/366KgaJW5ZgaYniZ2M3VrMHePCT+rCXYurULFDt6nxXCCpdS3ZZMPcuH99c+aSoZbrCKkFiUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876981; c=relaxed/simple;
	bh=QbF61B+Vv0W7JNMlVNeXALMbpr7/uDCFL/vKIev5wfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNx/5OZF61cFhr020Wn/ytCPm46fE7oye+vfFrDQn6ZMsdzI/bmeHNeVKWQjfehL8MDX9N4fvkUUGIevRKkvuIDCSLJVbO1U1nwKpJucd+BPfJhaJZZ+5DDHCrb7N395ElivICrbmhcv5knFevEA0ASDRBWgHav1DLQVuwOgWD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=BjqA0IdQ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="BjqA0IdQ"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6C74120003;
	Thu,  1 Oct 2026 19:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876972;
	bh=JLcIgqVhaprqkzKPZI+fwqpmS8MYJ0DbDKbC0H5N2uU=; h=From:To:Subject;
	b=BjqA0IdQv9WcbS9kSeHnFxzTGROq4YJyABwH18v4K6p4Rbm0djmJ3ghhYFKzzJKaC
	 FdMHrExU4RXxrBpFJmL2mztvIlg20DW49Jkd86wMJ+lMM34Oiqn+5itqqZP394JWfA
	 6dAQoos+NcP5r/HGsrnRraZaSLTTzLnsDCPPZf9c/PoIbTH6ilyaB2XPownFuMG1qj
	 RXiHxtPXNfKWav0N8Mw/Sf/k2cOih5YMgcv11II48I33UjRGNv/CgcdHNgTSN1oJyX
	 HdrUaQ3TNtlPe3he18b9UfA5JV3nvQ7lfN3kfOSrM7GA9uO/eKSSA2KuH97bVi/EMA
	 3jGE3cqtCj6kw==
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
Subject: [PATCH v1 2/7] ARM: dts: imx7d-colibri-emmc: Add missing touch display overlays to dtb-y
Date: Thu,  1 Oct 2026 19:49:11 +0200
Message-ID: <20261001174924.3831455-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Capacitive Touch Display 7" Parallel with Touch Adapter and the
Resistive Touch Display 7" Parallel overlays are only built as a
dependency of the combined Eval carrier board DTBs and are not listed in
dtb-y, so the standalone .dtbo files are not installed by dtbs_install.

Add them to dtb-y like the other Colibri iMX7 eMMC overlays.

Fixes: 64e7d6ba2037 ("ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter")
Fixes: 392bbdb0357b ("ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7" Parallel")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..0aece8cc9fe4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -468,6 +468,8 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-eval-v3-vga.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
+	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo \
 	imx7d-colibri-emmc-vga.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
-- 
2.47.3

