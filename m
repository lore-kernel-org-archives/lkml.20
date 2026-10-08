Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EF350255C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488460; cv=none; b=raNh5fyJBYxzKIZka3yn0TpatvuPBxePb8zaTH2nUlJzxGpviPBmzUTshsip/rGtqGZ2LzNK/S6laMjc1I34DsRYud7AEgrdpzM37200dXDqqCQk+E6528Y/P2dwfzZMEfbDKtESK6OvSxEOf7PDEhNesXJDGlF/9/Z7AocKsiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488460; c=relaxed/simple;
	bh=T0UKx50rNnWZxXGM92QqnnNP25zAAzbgddmjMHUQNY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+Uknm4dQe3Fr4mzUj4fVN1el+v3lL44zMz0gZY+MLj1U91DQbl3HwKxwuILArAlNlhizGwJIcl+0KmgZftgxdUaBt+hYCzBQ8Xz/GNGuWoTJMATkLOkpjX1j8UfziY8FZ72jWtmb+jHkYHBBFSgeMj6oIgsmb5dRqQX4DwTf/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaRlKbJi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaRlKbJi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e73611928so8133095e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488451; x=1792093251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pjy1B07QDOD0ZW1GLrx6e8gXgl1e1lU44sLjGLYTqSU=;
        b=aaRlKbJiTClwDHxkIK6wLEh6RQqF5nYgF5xaI7lVEe5+T+cXjOHrALu/7s7tUQhrf3
         9DPZR48R4JNs93ccYWH0CxD8Q/MazMKHMdV7COPORscNjtBbYKY17rcJoelQAR/mj04T
         Zz6Q4D7RGGzapSyo0kJSaA56EDEO/uUGdAxBayW455Q6ab8Lt6MvtH9cvNOc1e+Khdrf
         i96J5DoMeVgzp95WfXhY1e5I7ts/WPWEixwNmnbFKnJgckOkoV37h3NwlPjOE58GqJPA
         plC9j4Ga8ToxdkUO3XFrBz4Q2BuOx5HptKvVS92biPRQSBU1OQBS0/XNCufyYPgaJmDr
         /71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488451; x=1792093251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pjy1B07QDOD0ZW1GLrx6e8gXgl1e1lU44sLjGLYTqSU=;
        b=xPO7Ob8W3x5+kSfh5NjZx62h44G/J9lGoNZHUVukan+gMJl3X/eAu3xSN39hwsY3CH
         JtwR3ubULwuQp+SjS98jcbWn7mB0+6/35qgondogPTFP03eju8pRL4iTYu+WlIZFYv8C
         bMrAj+/GWtDtzMh+YaVY6r6CFDxL4o2/Ruh9f7lHmwQt3OWSxfffXD5OtjK3CtEelGtW
         K5yj9i4prIcpSds2Z2IHJv/VpdAQcddUFxrHs1zSwfA9elUYA0l/M7Pgjd7nH0daOq7D
         KRTVAXJ81MrMSv3yQJjHTreAcxfMNlbetT1CwFsCVDWwDkEP/DO2di4VUwpg+tnkTUqo
         Z0Hg==
X-Forwarded-Encrypted: i=1; AKwUvByEla1X50SUEDXZK++laGCCRorvF5P9DEbvhriQpsFV88RQoLV59xltxoKFVYofbBPeROFHC4JpOv18kNA=@vger.kernel.org
X-Gm-Message-State: AFuF++lvaw9GVMR8CREVHXyJaqbuPGlXIHvprUTy439gMSJSzGfpMFiM
	D/mmFcc9kIp+sXWqU73ryyrkXw+yF16mMbgSHoTP7IT4okTAR3uKgPfM
X-Gm-Gg: AYBFou2v0+H30WWqlTDInYum+BOJ5sZk+QYiY8aBUnwtMKQ6DGsO6YwB9bGPvA9pwN6
	YCN4gAdLKNLQEX5SImQY8Gr24PtmxKmg6qj23yFpFhVIwPaWrPBb0/SXS50ejzSB0F5kPihK+jR
	noUgUdZ9tAR+hL3f6s6+AT1PJAOUvlUG4wd38v/0znZs979JycfeAjtotXpfNrERVu1nKwcIIl3
	HC2gH9nHQkoqxvYPpsms/NNud3g1CjA6Up5iPaP0vTS/eZ4H9bb6Wp1SuFCseKWCZDVRcBIUm95
	L5T+j3VG+xDzOpMMO/WployvOvwwpXVr3xWfF3fr/AkrA7EeEvmRwOStWBegrAEXrwSupnHdNVJ
	dMQwMKx0Bq3tZ3WScP10szHHjZ0nxECZ1kQhPxUqvUl016hYx5Q0tK1LHYyBQNAtj5olTwMbamp
	vd1Ca5SbCnJd8PN9PzIBXgfCED+MF5hxJyAtaCpenfUy1ASXfKzOnDh+Mu51qq8ywpGl+vlMOy2
	CqLDKKcr4HZm3B8tC6IzpW3plGxKTJzn8H9jkI6LmbzyAkfxc/vopjV8EYdTVzF1BJ7ga12A2GR
	s1G14IGr22JKpUwVV7xwZA==
X-Received: by 2002:a05:600c:8215:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a1851acea9mr63310615e9.6.1791488450391;
        Thu, 08 Oct 2026 12:40:50 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:49 -0700 (PDT)
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 13/13] ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants
Date: Thu,  8 Oct 2026 21:37:53 +0200
Message-ID: <2d59e6f99bb823065859d78d88152cf4c9e37f37.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add VAR-SOM-6UL configurations on the Concerto and Symphony carriers
and DART-6UL configurations on VAR-6ULCustomBoard with i.MX6ULZ.

Reuse the storage, wireless and codec option files with the ULZ
module and carrier wrappers. Keep the original kernel-managed
Broadcom Wi-Fi and Bluetooth description. Do not include the LVDS
panel files on this SoC, which has no display controller.

Add each Makefile target with its DTS so the board can be built as
soon as it is introduced.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Reuse the existing SD and kernel-managed Broadcom option files
   through the updated module and carrier wrappers. Omit display files.
 - Put fsl,imx6ulz before fsl,imx6ull in every new board's compatible
   list to match the updated binding. No DTB target changes.

v3->v4:
 - Add sorted DTB Makefile targets alongside the board DTS files.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles, keeping the SoM options before the carrier name.

v2->v3:
 - Use the shared storage and wireless option DTSI files.

v1->v2:
 - Update audio includes for the shared WM8904 and WM8731 files.

 arch/arm/boot/dts/nxp/imx/Makefile            | 32 ++++++++++++++++++-
 ...z-var-dart-emmc-sd-card-6ulcustomboard.dts | 21 ++++++++++++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts | 21 ++++++++++++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts | 21 ++++++++++++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts | 21 ++++++++++++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts | 21 ++++++++++++
 ...z-var-dart-nand-sd-card-6ulcustomboard.dts | 21 ++++++++++++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts | 21 ++++++++++++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts | 21 ++++++++++++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts | 21 ++++++++++++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts | 21 ++++++++++++
 ...lz-var-som-emmc-sd-card-concerto-board.dts | 21 ++++++++++++
 ...lz-var-som-emmc-sd-card-symphony-board.dts | 21 ++++++++++++
 ...som-emmc-sd-card-wm8731-concerto-board.dts | 21 ++++++++++++
 ...som-emmc-sd-card-wm8731-symphony-board.dts | 21 ++++++++++++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts | 21 ++++++++++++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts | 21 ++++++++++++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts | 21 ++++++++++++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts | 21 ++++++++++++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts | 21 ++++++++++++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts | 21 ++++++++++++
 ...lz-var-som-nand-sd-card-concerto-board.dts | 21 ++++++++++++
 ...lz-var-som-nand-sd-card-symphony-board.dts | 21 ++++++++++++
 ...som-nand-sd-card-wm8731-concerto-board.dts | 21 ++++++++++++
 ...som-nand-sd-card-wm8731-symphony-board.dts | 21 ++++++++++++
 ...-var-som-nand-wifi-brcm-concerto-board.dts | 21 ++++++++++++
 ...-var-som-nand-wifi-brcm-symphony-board.dts | 21 ++++++++++++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts | 21 ++++++++++++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts | 21 ++++++++++++
 ...var-som-nand-wifi-iw61x-concerto-board.dts | 21 ++++++++++++
 ...var-som-nand-wifi-iw61x-symphony-board.dts | 21 ++++++++++++
 31 files changed, 661 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 4a8dac592212..399299178c1a 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -480,7 +480,37 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-var-som-nand-wifi-iw61x-concerto-board.dtb \
 	imx6ull-var-som-nand-wifi-iw61x-symphony-board.dtb \
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..58deb9e27364
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..94e744be4955
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..11e2e69fb645
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..288f6c37dd01
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..a1c973d8c56f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..2f83b765fccd
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..e6e4a0d99f8f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..cbb15bc96739
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..0435202f9413
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..821c870b99db
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..a3865e00e72d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..6598f081201d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..7573a410ce67
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..22e331a2fd10
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..db6ff37f3e3d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..402b64305353
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..94b155bd4ffc
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..d615c4f052a7
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..c4a4e6493b98
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..019991d038ce
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..386bdc0c7601
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..82771a7e9c4a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..a0c8c02a363b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..0ddc01fdb4c4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-var-som-sd.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..826c56f6e7b2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..be4442fbd269
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..39182b40c7b4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..fb74b81dca4f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..963cc17e9350
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..9865f4660c5a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ulz",
+		     "fsl,imx6ull";
+};
-- 
2.47.3

