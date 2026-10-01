Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DFF36E46F;
	Thu,  1 Oct 2026 15:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870060; cv=none; b=P1Lp5fMTMwvJsgvCoU8rtvfqIv4kMT/SNV9mZLlMsNcTkROaZ5qH3s0ANBKXuhYbe6iCcccAAEZpWsMVWEPXkN097pdJZv9q0YJug0Jtcs1uUPwnt+Z/knhfBIUU4iclfWjMXV1+WvBcmb2axlQFBSQcio8bg27GrwsjMr9n9Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870060; c=relaxed/simple;
	bh=ix8nICvBT374Y/QB/3GkTamjuBUG7RryzTuo+eyvWuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2ySKU3iTm0fatUPA1CXUriVJTN38GzEV4nze/G7ewkrmtWPk1RAfoytJQjUZoJL18k7xcN0QCvOdz7FaYr5qjHzudCF/s4QwJbkoy23T18mfDqQIdWghkNzKBBabkeWSBxUzCf4MLnhBqqndh8i5QdAZ5TiM6u5parx8eTdeyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=fwJM1d2o; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="fwJM1d2o"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 378CC1FB9A;
	Thu,  1 Oct 2026 17:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790870049;
	bh=3x2bn/a8NdA4CWa2j0Vm5z91bqnEClcg+9EX4z8Tomk=; h=From:To:Subject;
	b=fwJM1d2oe3D8wDuUVQSPv143aWXTdBPoKPcn7bcmOn/9QXaCfVbFEGK4seHPDWrEF
	 GbyIrKvz89E0Jobio5EwcpSb8JpbxTDAzur3fDjDW3+K6S7LTmhK+HUG34O8EF72lv
	 pfUw6IQnKTr7J6lnmaEho+OHwDx7BNZT/hu3uSavPez9Pre7F+kzPqrond9J6hh7/u
	 u1sZD/Zce+4v0k9jtalaBwpBfXuuTiCyAFsB1iP1YRVw3f5vtgpgjtuLB4isVXJ6RP
	 dQ3Kf8Fx956eYfBtVfqN1zlkvNKjKq1KW87J8ajOgCCfxofnrgsUFj5ACukO0wPUCV
	 5W3fChay/1vRw==
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
Subject: [PATCH v1 2/2] ARM: dts: imx6ull-colibri-iris: enable SPI
Date: Thu,  1 Oct 2026 17:53:59 +0200
Message-ID: <20261001155401.2584935-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001155401.2584935-1-francesco@dolcini.it>
References: <20261001155401.2584935-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Colibri SSP is routed to the X16 extension connector on the Iris
carrier board, and a device can be instantiated from user space through
the spi_master new_device sysfs interface, so enable the controller here
too, as the Colibri iMX7 Iris device tree already does.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
index bce6fbf230b3..5e408e54b335 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
@@ -52,6 +52,11 @@ &adc1 {
 	status = "okay";
 };
 
+/* Colibri SSP */
+&ecspi1 {
+	status = "okay";
+};
+
 &gpio1 {
 	/*
 	 * uart25_tx_on turns the UART transceiver on. If one wants to turn the
-- 
2.47.3

