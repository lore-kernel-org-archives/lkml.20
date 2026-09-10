Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AAA2045AD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788999133; cv=none; b=HpCynrt7bXx0VivD3TdC3oyrrMmlIYIs1qeKs/WHByiOprZ+XkC+K0C1amWhlAyCG5ynrD2yVLttlf2xpqavXFfCCSsiLgipdsym63SNYDsMyyJGQ+rhXzmyNuRG/D6PZWGWfZd7WO7q1mwvKGsmqnCs04Ct6ff4rxp7bJGcP5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788999133; c=relaxed/simple;
	bh=tMMQrXoBwNrkZmIbfWMxHX62cipTtx8iUP9X1DBilvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q8zHtQ46Y4hHzqQ+Cg+59NOXRX1LHUTMYlftz0PG89xNOXsus/MJ0RGm0AF5pdRXDxJ35VjORQMGyXXqxDiZN1naS74S9+CEPcaXyThGaHUMj2rq2gw6RlzBZwcX2L269fmOJ1XOkRWJi8yUpEIQaLxlFfDj5QjutbZEHxyh8X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZh7rqJG; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZh7rqJG"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so6038535ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788999131; x=1789603931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sY14puHb0GhiWCfvvltTO6BX6TI/MIMm3GI5Q8Whaig=;
        b=nZh7rqJGuYQku2E5X88HgXvbX8hzYrbtPDEIhi/iL9I6uH0WiKk/8oWHkdD4OgBha7
         p7kjnk8LYZXBhfAvoKtZBR9YiahKG0StOfF4nohNblb4RNaoKmUCL0FrAWzglyHLp0OA
         2uI4+x1r/vAG388CSJFPX3vulZPmu0HzuJPetU3Uz04g1cxXSCP9QT96WmpI2sbAyfGN
         AjVXC3nlWWYxdHvqezj8VrlikWMGRfKzY5xz2YEcUcTSLoHloHts1yzV7LJ40fswU9oS
         mHdzV+Jz0Y0MevQlfyzgOIJ2XCj1D2cPmk2zh0gqGDlLEDFT/83wCzeNROh56EJuedbX
         HtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788999131; x=1789603931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sY14puHb0GhiWCfvvltTO6BX6TI/MIMm3GI5Q8Whaig=;
        b=F8VrX7SlQGTGZCLzC/tkAa/xqs/jamMdu/IYRGtMIx4f+Wh1Jy7fp7JF0KcCSvOW79
         sROw47mCOn38JF7jOJa8uPvJfBklrzl9O/xbgH/YdJUkZNoscUGcflQPHl81VVZ4pxHT
         rJ3K34a0rncwPviXdXZem+xQOx7SgULAQpu+s23CqO73FA0IJkRUwsZZmDLS4+pXvIEm
         kgFjEm19xF5QtuvWxS2lGNsYQMo51crjFN+Z9bW1w8OrkmAXCIlIF8KH3uY1+juknoFF
         /a4jv2m7g+ClOq/XySh15TMemTv3qOnoh/Hu5bzPpzS0HB1Q5mxMMEpmDJlneiLyPWXk
         0jrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNbAbwLK09L4oFqFiZp3XxfvRW8KfralM4CV9fciaoJyN+p8ChGkgV6X3xjkvmRkrZ1NejozfEeGEcQY8=@vger.kernel.org
X-Gm-Message-State: AFuF++lLAWHu8w58snk1FAyy37q2gRIDcea52nXtf3Nls5auuSuF7cyP
	l6zu9ZiEQEja3y5u/qcCsqhZaebvcc9H9u1lWc6Wx1V4KJAldU2XZK+K
X-Gm-Gg: AYBFou2Kr5PdveKRahlZECkjUvp9fF2DePXqMvqiGvUS2HkcXB15JdewN59UHZjSA+G
	YNoGA+O60clFubIn80ZIBP3cnpjNW0JNeFNXmXtnQApD6SiYkOiGMSdVbBCsrqd+a6UdihWpopZ
	vAGCZ/AhSFPJtePUveUiFQN+cfVbwZzbXmeV8/RPndqZ+Q/frcg041hW9/OtRAaAd48sIP+uudn
	e8tLPWWiWyW5cPfWQuU8dLW5eEQ4+n5bBz7W9OyVH5/bB4vJT0sXEoZQfPdSD9ECUs3cGAkGOKG
	ePie8UXq32yHJSdxcXUlBC3fa4o78AeS9GfnR8FGidYLwsd+AFSU8aJ/KyizPjsQsMXm7FuNfT4
	wHTck+R97AJsFCQUpfKUjbyheMUx0coknhOoSa1OJWZINPUhGHcCCCgU8fBCkMBHvLadaIyBVEI
	jAiFMnMoo8uwNa7BKd25Xws02pv109nf4A9je3yF//r+IWrdCO9xk9tdsrKXrAd4rYy6KTWfF7L
	HejReBgzj8Jv596Q9T8sbX1Ni0H/TBrGy999vsXdtv7VkylZOdvt+9DW2evOVv7J7RfGGxyUnDb
	HqK3eGFawmOBMOEbl56leAONKlUZajDuNv+7HvkIWIE7Q784vQ==
X-Received: by 2002:a17:902:c402:b0:2dd:143:d5 with SMTP id d9443c01a7336-2dd07de58ffmr54838165ad.22.1788999131634;
        Wed, 09 Sep 2026 17:12:11 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149cd817sm79825805ad.72.2026.09.09.17.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:12:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
Date: Wed,  9 Sep 2026 17:12:09 -0700
Message-ID: <20260910001209.116465-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix typo.
 .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..9ab618a097b1 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -92,3 +101,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

