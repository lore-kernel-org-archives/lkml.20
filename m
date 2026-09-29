Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2FB53F6B5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695106; cv=none; b=qWhx6gEGq23Sw4pv8BjkxwBaTdLIzOG++y+jXmCIuk8Rygp4yM23bgAd1ixfa5jphIK3+rOmlshM2PyReW6K6b6SX0CeA5BDAVvNW3c8p+Kv/bIUttGzoMYFS4NwDdNk/8mUAyh9KC+CMAYzbM9NsaJ/JFA+kyT+CjYYhjtOMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695106; c=relaxed/simple;
	bh=55uZemy/1WcZyG6/ykKWhPIgTZ8r/cmFwM2MknqHFEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFhdQUYryK9ORNlAEj4Cl1ruMtdf+dTBH8GtVf2lxwEDkHX/im0GF37mbuxQaEBNDRic9KbtfFN2xm3q0XJv864RJMImkzo1j9ssNeo15070mJTx85k2f/ysDl97VUCEJdPpTh69eEc0ZKRFd6zGiW+PD+4mxzL2TSSVwWA/vv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3HyxgNa; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3HyxgNa"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so3279962f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695086; x=1791299886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qUf+g4bCt5MdFtjpNpCg96lRmztOVhCXpafgxW+ipE=;
        b=X3HyxgNa4/XTgd387lmwehiAYaemtPvSgtfsp2/uwRl5RzFCSb1k2s3732uFzTVmmy
         9PVzpke13MA9Ui4MFtvj9HrDTcCdY+P6X1KvdM8nFrUEunfNm0en5QK6DvZ4zcnPii5y
         jZadi23LHcMSrbq+YhrAA/IU86LXpaB9wUZpdTtO+2nHcVeJ8qhq3SMJU7KoaFcPN1B0
         0KzjKmoSo0WopeTbPGN0XhGG+dnLWkeICdDD8Bv9E7JZQvpR7p7JbJomy7PBWOHSa2VN
         0diwa4TxNd+XU5YA7VZZF3QleuQhfOmCNHm84di8OUfpdUYrSyCW5n+mRjNXc55Lv+SM
         LcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695086; x=1791299886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qUf+g4bCt5MdFtjpNpCg96lRmztOVhCXpafgxW+ipE=;
        b=JBPRY33UleLG6xFh3h0J6K6qCmvggdbakl1+qIrq7enmI5jcou+NrLDsnOBARTTvRB
         D6HUySXMy2htsG5zhHPh+nJwSIIcTXoRVIqa1m3LMYwmlmxR+aNKXRf3hxQTyW+DGMuf
         nUQ7zvzLwJfIP6SwrpcbI4vvFwnTyzs4slA5OPxFfVnMRDq8RO250NQ+RhnkdKxOcT38
         gR/w98AP0mV/hbu0npK9sYblVRH/csbpVCnUQDBfIHtdavLwRpWwWZhhJF5hi9bwWviZ
         QCY3ofi5mVQLTwrsbD8c6b5OuTD9BsNnnZls0IVn2+UpADdrEJX2xtl5sQd5uG6VRg44
         Gbfg==
X-Forwarded-Encrypted: i=1; AKwUvBwzVvJq0xkD6fwwJCws/lK/cbo2CMfcbV6OyPkxJAFper7NYlLSkndqhZYZg8etT396FeM+6MI+CYziP/A=@vger.kernel.org
X-Gm-Message-State: AFuF++lSf0OS6Ke0rfZxLpPuAMtDCiXAnAKJ1n3yWndsuNIFpvq1LlZK
	n6QEDNeShlaa+t3Ck3826wJxkoapOgPwHjMTdUcyX7ZqQOLd4ncR+wYu
X-Gm-Gg: AYBFou0OEvN91zcOmBrYJEhEmQID1G6WejfW8KGz/oU7iiLr5yUjCLT8LwfC3rbTM/l
	k5kGiUggkeRzCdpeNYaKkiru4mhQkggPb8XQ01Tz84Lrrf8GI0q9S05/p0Sxa4j3L+5Ks7HXyGa
	7Oka++aVphPHafE8s+86vvAYM8/SPlpb7haUyYJa+EaSNEnKEb9EeeIR/qhX/cKIniGihAIoo0Y
	lwM/dFvqHYnIDFLCRlkPmLRJT9pVj5FDAKz5vEVp4KzL5xXK8jcSapdRbw76lQx9IrcREOhKKTK
	4vaxMSattMM38Ksbm8FWY1GR8Nhh9/BYyJekMdqKqxoH4EgavklRP4DonKZXW81BjFE0RHKPpQD
	yzZFw4nZ9mvFZBDZSjUT+wt2x2p2DbnV8wUXhZ/0TSOrAZMazvM7w3G4JT9N2wbEfV1yf01AKMC
	Xdn7fmeWGZFrpfsgqE0TdrsglbZKZvIdgh3jgoP1wQybbn2FnaNAEwkIn6DI+k8tXb2Eys+0lR0
	Xse5cEiSGgXPXq+nkJ1PjhNGyjNLnpJZ0X/aTb/xtSVaaWq4mXaAe3PMun7OsmufTrK/36DJq9Y
	Exvku69Q1bUCIyZ+6Y6c6g==
X-Received: by 2002:a05:600c:468f:b0:49e:799a:8952 with SMTP id 5b1f17b1804b1-49fe66e89e1mr303142575e9.26.1790695085880;
        Tue, 29 Sep 2026 08:18:05 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:18:05 -0700 (PDT)
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
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 12/13] ARM: dts: imx6ull: Add Variscite i.MX6ULL board variants
Date: Tue, 29 Sep 2026 17:17:39 +0200
Message-ID: <5a5a713bc2245ac1423d7b684af00e98e875bd6d.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add VAR-SOM-6UL configurations on the already supported Concerto
carrier, plus VAR-SOM-6UL boards on Symphony and DART-6UL boards on
VAR-6ULCustomBoard. Keep the existing Concerto DTBs available.

Compose each new board from the shared module, option and carrier
DTSI files. Add its Makefile target in the same patch so every new
DTB can be built as soon as its DTS is introduced.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Add sorted DTB Makefile targets alongside the board DTS files.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles, keeping the SoM options before the carrier name.

v2->v3:
 - Use the shared storage and wireless option DTSI files.

v1->v2:
 - Update audio includes for the shared WM8904 and WM8731 files.

 arch/arm/boot/dts/nxp/imx/Makefile            | 30 +++++++++++++++++++
 ...l-var-dart-emmc-sd-card-6ulcustomboard.dts | 20 +++++++++++++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts | 20 +++++++++++++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts | 20 +++++++++++++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts | 20 +++++++++++++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts | 20 +++++++++++++
 ...l-var-dart-nand-sd-card-6ulcustomboard.dts | 20 +++++++++++++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts | 20 +++++++++++++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts | 20 +++++++++++++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts | 20 +++++++++++++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts | 20 +++++++++++++
 ...ll-var-som-emmc-sd-card-concerto-board.dts | 20 +++++++++++++
 ...ll-var-som-emmc-sd-card-symphony-board.dts | 20 +++++++++++++
 ...som-emmc-sd-card-wm8731-concerto-board.dts | 20 +++++++++++++
 ...som-emmc-sd-card-wm8731-symphony-board.dts | 20 +++++++++++++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts | 20 +++++++++++++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts | 20 +++++++++++++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts | 20 +++++++++++++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts | 20 +++++++++++++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts | 20 +++++++++++++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts | 20 +++++++++++++
 ...ll-var-som-nand-sd-card-concerto-board.dts | 20 +++++++++++++
 ...ll-var-som-nand-sd-card-symphony-board.dts | 20 +++++++++++++
 ...som-nand-sd-card-wm8731-concerto-board.dts | 20 +++++++++++++
 ...som-nand-sd-card-wm8731-symphony-board.dts | 20 +++++++++++++
 ...-var-som-nand-wifi-brcm-concerto-board.dts | 20 +++++++++++++
 ...-var-som-nand-wifi-brcm-symphony-board.dts | 20 +++++++++++++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts | 20 +++++++++++++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts | 20 +++++++++++++
 ...var-som-nand-wifi-iw61x-concerto-board.dts | 20 +++++++++++++
 ...var-som-nand-wifi-iw61x-symphony-board.dts | 20 +++++++++++++
 31 files changed, 630 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 33a9a38d74a5..2d6b2de9d34f 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -445,8 +445,38 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
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
 	imx6ulz-bsh-smm-m2.dtb
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..ea8bf022744c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..b0f02ebf158c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..6e6a2c8ca180
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..7af5fe7dc1fb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..26d266d731fb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, eMMC, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-emmc-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..617bccd11457
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..d983c60015af
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..8d1620bc1209
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..3c33aff6687e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..061b427be774
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ull-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULL, NAND flash, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ull-nand-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..1e748f8b1214
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-sd-card-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..d7da400e14fb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-sd-card-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..4d4b69607486
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-sd-card-wm8731-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..dd7a9fe3917d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-sd-card-wm8731-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..eda48a9b7268
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-brcm-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..75cdbb5a5db0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-brcm-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..c294efc5c91b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..9ae9182246a2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..e9d47a865ff1
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-iw61x-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..aa9691429c2d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, eMMC, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-emmc-wifi-iw61x-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..617ae3e86dd4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-sd-card-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..2a09c16715fc
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-sd-card-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..19a2df6abe72
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-sd-card-wm8731-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..4028bdfacf12
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-sd-card-wm8731-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..0c0400a41188
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-brcm-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..6a4ba1d915a4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-brcm-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..de472b5aa11c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..a7cc0993e9d8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..add827d6d8d9
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-iw61x-concerto",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..d01ccbe10e68
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ull.dtsi"
+#include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ull-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULL, NAND flash, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ull-nand-wifi-iw61x-symphony",
+		     "variscite,var-som-imx6ull",
+		     "fsl,imx6ull";
+};
-- 
2.47.3
