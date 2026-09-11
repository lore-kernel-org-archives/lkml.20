Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06704AA57E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158812; cv=none; b=Yo/9F6sU27JABIWIRknbPn3fbtnL1GDwr4e1MmDhOfBIRuwFp69Y7xVaojyYLDVhMNWQeBa+48yBKTsUgopuj3InZgg7oRK6TEp2Xd5bzgZqpoeSSqoHBpUPit8c/G03vZImIdYCGHVQ7CWM9YX3K3b1YVxRghrse+fVP91iS6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158812; c=relaxed/simple;
	bh=Ek4lxIShcSyB0pd0h/GUygXqYS185zwM+r1cAebpYe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0vuHLBDGj9eiQ/icTtkstTBsLxY0kwqRAuXiB5icSOQExb99T7520rMi5fFVTL1VERNGl1KTQH2covh9EG7k+we0v+kMQ3ZoCLV/c+Fi9011Tt1GzTXdwZ9crQ6YnQ7OS8mLRkKzn21dm9Nc7CrtA+7AQwhDmPRjXAp/WDPy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7X/9bzc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7X/9bzc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db18e5cb56so16303685ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158807; x=1789763607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcoCt3NplqcRzScaFBaJvGWmYj7kzQK/tDyE+wQSVG8=;
        b=Q7X/9bzc8RS5dS7OpsMpqittsnkdtYFD52qkpPOFqKMjgw9hB6XP25ESHARcld5VWB
         DRL4QDxVmrtMwlZs/w+ccbkG8ggItkpYD2wI3fj8lt9kkvkkcv9P2oXlDYseVy58JHhB
         dDxyMFy3W0xwenSv3e2T6MqetXO61e7jJDjSvEAs0BmpnnMlMEh/xY2Q+Qg1YYds3FV2
         uCcsisJntcQmo6FsMJMFdpBb2twyCn8Q4hIcS0oItlw38RZDpm5mS3wJSWKYq6ImeJhC
         RJEeck8AbXedTrB4EconuHNSAY0x3U0QqVJ92At9NJBI/7MttFOKd9ovXHMLrhFZpoQA
         baAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158807; x=1789763607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcoCt3NplqcRzScaFBaJvGWmYj7kzQK/tDyE+wQSVG8=;
        b=OOxS1Er6xCehM0yUlIg9dhWoDVIj8InUy82G7VwbTgjHb67U58GI/DaUG9hvkiUYb7
         n8zvfVoHhaRlDCqfxLzDKkrmxOW9y+0vixv828xY6PdE/7YphIbmJ8ZbrFS8kJMZi3As
         amKlIUUmM1aRYtFg5ADJ7toXyUHaubMFx3Qj+ZSgaS8YA/WwWgUMCi4/vl7YtcKg0/Ae
         UkGi3ipffPaZkEM2v9AaDeMFCv0WNIXI66qzB7dZw7ctpnTcmLyGxP1K72htBLmITIZS
         1GHCHhnVCizvpjD/8ZPXYFPQQhEUqRpHZj1R9RNn5dxw6HgOFbEDtS8Vi0aYsKBZkavi
         eBLg==
X-Forwarded-Encrypted: i=1; AKwUvBwE/pi+G7/TJmBC67Nzy4LV2s/9j5zU5M//fsJE+06F3OUJeS3PY32vhhabhvz/0HuE7BQy6nHrzxsOrhI=@vger.kernel.org
X-Gm-Message-State: AFuF++k5zc1yKvtBj+k487Yu0Nrx9ENKvDwd9nutTGNfS/eHgVjet2kj
	E0TpVcIhrA7n0zsteEgJiuFhH/p/HyxvieBJHIuEpQZNtksQIblM2P86
X-Gm-Gg: AYBFou04HSjf9WlLUbhFTffH+MK/1Zee3DNyUcF0ay3VoT+WWqxyZmqWp/7tM4AHRQ0
	OqtSXO8mIpPGXW8yYykdBhJXHusLCiCj96YLNj2WvtrPxxw9chkgbFjnb28Ki3wwOBN4CDANIHv
	o6FFJ7mPboyxnA+wc1dYbEJmTz6Usr/XwhFJr8rLVhK6C6tINpCJwDtb+FCOoOUK5i0/W76w1WV
	VK0x2bKQ4QaJEwKkdckilY/csVvtEivnl5vNPUEqHRVY4BcuY6zKRA3ux+XOsPlBUxPppKSj83R
	+PYf2smXq/RwbgtxH+oMJNogsVrvngtJgdQqBl45H0726tzo2FS1ZOOpt8guvPVWEoN/zd2BS2r
	bCj9T1xdsdPrnBkriGhB4gGEZyNP9DScN3Jl7+T67mjrl/v0QilP5b19xkUf1yiPjozq+3651Qx
	CPgodatNhmux7zS0buL9XBhTxl2A0pBPrkUv8lANIwZGGClWDHvpgKMJFjOabV8LG27Q6c9p181
	1YNb53bgsfEpRWUQfuC0HZvV0BJWVTClrFEvSCgYUxhHxDvoX6ljGwdJbJCtF9rJSp8cJ+qzWzO
	qBiXi8HOk9oFwXSJcmE/YcwuQYpDM3GBNkMXulRIATFWmw89
X-Received: by 2002:a17:90b:3c8d:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39d9bbdbac7mr10334495a91.5.1789158806647;
        Fri, 11 Sep 2026 13:33:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1879699a91.1.2026.09.11.13.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:33:26 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: N18U: add nvram node
Date: Fri, 11 Sep 2026 13:33:24 -0700
Message-ID: <20260911203324.104422-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set MAC for gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 instead.
 .../boot/dts/broadcom/bcm47081-asus-rt-n18u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 3854db0118a9..5874e6b606de 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
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
 
@@ -77,3 +86,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

