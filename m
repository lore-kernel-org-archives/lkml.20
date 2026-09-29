Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A353FD5A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695079; cv=none; b=Uz3dOG8kJmind7ya7kRD85GKgEfqbjXRts/lYH7zR3ucHM7AZf/5i6CyFX+gRKRt4eil4V81Vhy9mnx+wbshCmILeqK02qo5wkaJUNHchYy8tBTYAlE/ecJj4YmDMm9D6Iw6Tnj9CQHrfxcDNbhte3kOjgHtcOLd3Vok4NDHIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695079; c=relaxed/simple;
	bh=cgkMSwM4juxySH5oXoW3O7eWRh40ogW9zBygalx6hnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHQ7r5iJOtH2vJoIjrWjl5BVbk0qoWR6+On/+WPqBcgkd2Qm2hD78eyCFFzlcyqX+gscWMTuaoacwUA1xmMAIsOPAUc30LlclScpQ2bsTl+VpkclRz1YkGzoOPW0ejhWn2cCRm0VB6SPgpm4ikkmcuH1CTjfI2PzpvVy8uRK5So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0uPNRmE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0uPNRmE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so26980135e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695066; x=1791299866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74RUEBvytcfICQALEQDWbpTlzpkzH2p8RRgKPqwsI10=;
        b=G0uPNRmEJkVsxUnU3QrmSFDCNF1h/pQ4Rqil4bB5YLfwdT45nTOzeH4XYZeTIsEy2y
         qLgBqZKYBmXmYkRkcz+JmqFv65jXvUtPRT5kcXbDmSw1UFmI6uLKf6FeUUOq/jmbyzx6
         YVXONTNPK7WxFaKj4fBRUi2pqXuAVGtFEN40qsRkcf2j7KzoT4H+BSQU5JSGAnIuq8pJ
         H7ePfbD41s1FEUfzB/bR+ARQ6FujmY60YTFrtTaW8nuVGSooNgLTs3yiI7faSsrxePBp
         uS0wC/jlyvmhXzLkveEeWzssJiQDzSzNRQXPK1mluUs8DaR075S7h1V98PkZa1JLL+lH
         6hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695066; x=1791299866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74RUEBvytcfICQALEQDWbpTlzpkzH2p8RRgKPqwsI10=;
        b=PHdz/16hoRMyZd/BcumiErfMqqFHZhpUcl+10C/jaM/zI0t5AuOkv9fT71ZDjxOTUV
         66Mi3FNqTgOHCwUe3nEQDyRMRV8zLXsYUojPmaoesu31quMJMInE9XP+Km7/tQt/ud7w
         sJR1CdyHGkGBDNqE7vlm5He8781cekBBlM1U66s9XXApUQVKiynFms27HDLKbstQDF8n
         xbyBL/fv7fiy1a87CQgRi2lTyUubyHgtnriA00X6fITHY7xtwRV7O1fmg7QQkQbE5+Ci
         JMm1+tKX0ekHbe+3B2ffOrR0WSPLfDD+gWqej5EOmK4NCc0Ny6hvJTA+fEePnd+/AViJ
         8I/A==
X-Forwarded-Encrypted: i=1; AKwUvBxQCuq1/IrcyPYV4SOMyedk+N5VcT3eNrZ8b8dFzIWrPKQnRZyRNIKYtAV4VbfUybb2jpMYMzAAbyL36xA=@vger.kernel.org
X-Gm-Message-State: AFuF++lbNLHJpPvVCHV3+XkJdV8LOhB1JnTZbSlU26Irm0ZsvRL94K6b
	pedjBRxExA9/cFkQHDUz5HtP7rn6WEoKFyYk+EFSTG5H+6tr+5BV/6Oe
X-Gm-Gg: AYBFou1veL1pGZ2UDRId/mPCpGUHZJvnnToPhjNIgeVm0bONfzohJOojui1UENIfiDr
	H3N84NSgjBQ7jwWMnrsRSc8fTSkWPgh+FYgwpWjel7uMQtagmAhL8ghWYJN/RDrG7lKa9wvmPfr
	w9BXXXMDVohqbp/5JgazKDqvwd/9bnFE++1SlfPzJsdwcNnkJzcYFYrrnQuClU+Bn355xWJw1EB
	Gd+j02gMcTYteOKKhc/L7YWopub9wiyNdjkOw+9O/LRE+3OXAivQei6XusKB6CTj/cOhCeASN/F
	IWsgul07pxjwou0VxJEP3rt4veAecMK7jsVwh3rrfV2q6GsVATiARhFPOttDSViQmM1mEMRUURx
	rfgwDbFiq7mUMP23q0Jo5dxN32umqGYCYuZxmYTX+cZbajMTAh1kYw1D8nIxQnyE8z1jIMrNBKB
	9yrKTBxIY8h6nh49d2t3EDw2Z6Olui+spfX+EQEHFJ5dK3JVqwGhYNhAxgGsTqQJRAGsTcH2TyI
	ITRyUWnu51Dd2qx/mFjGKajWf0AZwxrpJjIz/4lXYPe3aO+YdbKeCi/nZFKKurCsN6K/R2R1FgH
	LougH5TUKHxQUxWEXm1dcQ==
X-Received: by 2002:a05:600c:1c2a:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a00c2a48cdmr69280265e9.33.1790695066289;
        Tue, 29 Sep 2026 08:17:46 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:45 -0700 (PDT)
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
Subject: [PATCH v4 01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
Date: Tue, 29 Sep 2026 17:17:28 +0200
Message-ID: <c547995bcb14779a5883d855137148ebddb7ef8d.1790693249.git.stefano.r@variscite.com>
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

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad9..233687131adb 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,9 +688,46 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ul
+          - const: fsl,imx6ul
+
       - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ulconcerto
+          - enum:
+              - variscite,mx6ulconcerto
+              - variscite,var-som-imx6ul-emmc-sd-card-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-symphony
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ul
           - const: fsl,imx6ul
 
-- 
2.47.3
