Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D914D3F12CB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513225; cv=none; b=eJWYCXB+/XMybziHKUnsLsa6EsgOeNB1my/lscqEXtUUii/OETb2qKJBTGFvyzO28iPmS/2TJcgDapTonkuZadPnkJboBl4ey6hQTST2OiHKNKoHwDbCY8u0jdYQ8fxKmtiIjDlgX4HHEsbbBGtbFcRptrtGXSPZJdrDeNgitog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513225; c=relaxed/simple;
	bh=3vs5W3ZxvueDzALjPaBFsCU/2OT1GAPHaHHdKaDzoqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXTV96y3ogXctAPDp6mWlrpCqP/G9xN8a5btYZZvlVy9+NcEON4t38vYW0W5lKTVx15ytaCmO4stId5exGJ9a7lcwKMTvIO4egI7hdpYTwcsuE2zNd0znm17TuvbuCza6TjKy+flPwQ+HXtQfLMXaR4yaF8odR3jheH7JoUL8Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9ZOb+nM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9ZOb+nM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso16246535e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513219; x=1791118019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zB+0WWhii4wkDeFGGBMQh2kAmrjDEBPIyj5hNlO7dA=;
        b=g9ZOb+nMKxzDAoPs9MLuPqO2NqSx1+6QUjkbvWuh1rdEji9UIoch7m6uqyWmUQ/4V9
         QByrKEY7jBkwie3dBMMaCx5NZBWWKLKhTxmBaDlNuOujqQXH1sbg+FHH+RZNdx7nZgzo
         WrucTPaXKNFr7crldFo8biaNDgDDnRzif4xfzQIPRkMrPOAMi+Lha9NKYLmhDhmK7uZa
         DVf2yyiyrz8N0MUTPGkUFgdLQKPUcA19IuC2az49AXJYOxHPotTSwVDLTf0n1RnnXPLS
         k/h4g2rDGQvCIBQZNBiNUhN0FyIDL2s88OJCxxlJeuAfHgBGJEaYe8nRtEptYu3/DnpL
         57Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513219; x=1791118019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zB+0WWhii4wkDeFGGBMQh2kAmrjDEBPIyj5hNlO7dA=;
        b=P1tLImonTx2s3Ujd/V5MDL5oX7sRLQugjFKyGepaVdtGJVFywpbwQ3w184FxscKKcH
         G8YPiQJbq4GUApT9OwwgG3VBVLNhcQYgFIbkADdyYHNmUMleYdBgmGDSvzIvuvTvN036
         fFlc/0h0ioRtTtMNKXVA9dRfY1EYN/2zhuqb5tmjNlj9qJZ14Och0XqRZXEEfCT758oX
         eQr7lLDHoOk3n+7GR6+Rzwc0AvEZr7P1uCTmq2LBhfmWn7FMmIKFJomLiLHeKn9Z2l+V
         EebNPBN8Fi65lJBA2oHaFLR4xaivPQnTgE2Uqfu+qbr5deTaJ4j6VVR7j1f21zrTKfuO
         FwOA==
X-Forwarded-Encrypted: i=1; AKwUvByKYk4vAdHcDNCRa16YBtkpk0zp7gv515MogFK2La516iBKdl2XlAG92yo5QecqKN6ReiYB8ljWZ/HXzYU=@vger.kernel.org
X-Gm-Message-State: AFuF++mwNPltzqbZlgGoBJiCiFenu2/IfgR/ad5FVECBvHM9i0rvL1fW
	7BYZAii/NkuYItPq5zkfW0V64CMC3jMOMI8FZLWJtYhai4xYCTsg6kEE
X-Gm-Gg: AYBFou3oXo/ZTCRy69J8XmibFLn7SwxZGh67ptqLSr4/CnqoD8i6ejnqr5/uESd/qHb
	F1U4OYsb9RxvbxPmNO/lj+NtKce1OLI8HaOu2gFcql83E6AZqfTCe5cE9fPv8uv/I4Luzxz92OB
	qjwEc5Ssqs+9ig0oqHHhx9sIWuocRC74Uh1Np/WGtZWBlrKF+PsbHntJmKR9TggHjbDlnRPXbsn
	CR3uQVxOAsQBXTtPNw9ccaQsvlZ6DeT5f9ZwIYyAS5anUZDIl6qySw3zfbwLIoA2pRruMUtdVS3
	1XB58iCRGs5G9JvryQf8OgBtJrWm3uKucwvzlLPk1kPSyWIX/iKtPum8eT3bWoOVeOc7OnSc6go
	gyGo82dTZIlI81Lbui0LgQwKNQzG/455LtoAVu18eIpS2qFwMh6MZl7eGjCLI+9N3TlJYptjHYu
	jWumHXQ+Wf5hHitRgPYpJmGOUXLsl7CDT1NPjKivnQgvaZuJxilbI1ZP21aoL3fjGg23gjbn2kS
	+E2uYn+zdwYgME+vMlFnb1Q0kVKwpD3TQ/LlEqpMX5ZkVHZi1li65pLypAKnM77Grtp/vl8ltDm
	/cQjK5YLnPgj1HQk+4j3wQ==
X-Received: by 2002:a05:600c:19d1:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49fe7b62c5bmr188856695e9.11.1790513218838;
        Sun, 27 Sep 2026 05:46:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:58 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 12/12] ARM: dts: imx6ul: Enable Variscite i.MX6UL board DTBs
Date: Sun, 27 Sep 2026 14:46:27 +0200
Message-ID: <6278961388356f27f483b896288e7b0c0d240962.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add Makefile targets for the VAR-SOM-6UL and DART-6UL board variants
based on i.MX6UL, i.MX6ULL and i.MX6ULZ.

Keep the existing Concerto DTB targets enabled alongside the new
carrier, storage, wireless and audio combinations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Sort the Variscite DTB targets within each SoC group.

 arch/arm/boot/dts/nxp/imx/Makefile | 92 +++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..0194b22bad2b 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -375,8 +375,38 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-tx6ul-0010.dtb \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
+	imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-sd-card-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dtb \
 	imx6ul-var-som-concerto.dtb \
 	imx6ul-var-som-concerto-full.dtb \
+	imx6ul-var-som-emmc-sd-card-concerto-board.dtb \
+	imx6ul-var-som-emmc-sd-card-symphony-board.dtb \
+	imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dtb \
+	imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-concerto-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-symphony-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dtb \
+	imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dtb \
+	imx6ul-var-som-nand-sd-card-concerto-board.dtb \
+	imx6ul-var-som-nand-sd-card-symphony-board.dtb \
+	imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dtb \
+	imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-concerto-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-symphony-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ul-var-som-nand-wifi-iw61x-concerto-board.dtb \
+	imx6ul-var-som-nand-wifi-iw61x-symphony-board.dtb \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
@@ -415,10 +445,70 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-tqma6ull2-mba6ulx.dtb \
 	imx6ull-tqma6ull2l-mba6ulx.dtb \
 	imx6ull-uti260b.dtb \
+	imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-sd-card-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dtb \
 	imx6ull-var-som-concerto.dtb \
 	imx6ull-var-som-concerto-full.dtb \
+	imx6ull-var-som-emmc-sd-card-concerto-board.dtb \
+	imx6ull-var-som-emmc-sd-card-symphony-board.dtb \
+	imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dtb \
+	imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-concerto-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-symphony-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dtb \
+	imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dtb \
+	imx6ull-var-som-nand-sd-card-concerto-board.dtb \
+	imx6ull-var-som-nand-sd-card-symphony-board.dtb \
+	imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dtb \
+	imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-concerto-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-symphony-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ull-var-som-nand-wifi-iw61x-concerto-board.dtb \
+	imx6ull-var-som-nand-wifi-iw61x-symphony-board.dtb \
 	imx6ulz-14x14-evk.dtb \
-	imx6ulz-bsh-smm-m2.dtb
+	imx6ulz-bsh-smm-m2.dtb \
+	imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dtb \
+	imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dtb \
+	imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ulz-var-som-emmc-sd-card-concerto-board.dtb \
+	imx6ulz-var-som-emmc-sd-card-symphony-board.dtb \
+	imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dtb \
+	imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dtb \
+	imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dtb \
+	imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dtb \
+	imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dtb \
+	imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dtb \
+	imx6ulz-var-som-nand-sd-card-concerto-board.dtb \
+	imx6ulz-var-som-nand-sd-card-symphony-board.dtb \
+	imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dtb \
+	imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dtb \
+	imx6ulz-var-som-nand-wifi-brcm-concerto-board.dtb \
+	imx6ulz-var-som-nand-wifi-brcm-symphony-board.dtb \
+	imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dtb \
+	imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dtb
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
-- 
2.47.3
