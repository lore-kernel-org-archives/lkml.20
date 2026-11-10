Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340399;
	b=FiJ2qQUWOjVdMSxzgFRKbjBrRF3R5e3zDAFpvcD6IpqSxq9GrOJ59mmgb2gZkENQrnj5
	 gBh7vLc3tWdNWNDshsXxJgb1CXsqoyhNatpDaMuCeWZIOhzrs2WuZabe7Wf+W5Qm16eqY
	 qGutbeB+zHuSa2txedZSVpeny8VC/52sFV+8QpvGyYxJ/P1ARupAfMAC+7SHzM4dN0NTH
	 OM7HZ875lUJQgNX5W8+RP8wqv4euBD75sVEzifpDZQmu7BNA8PabdkDjZaqHPskizJL2C
	 8+P2ehrukA6gjuvQlNxVIgOlULL915UnZFpM7j1LqZ7YmkCNUDpQI+YIwAjCFHvTvAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bMjomd0jtFOusb4r+jQiPm04tLdqb5W0DB/94s0Gjp8=;
	b=NZ2AETpkkx2KweJmsuYe7HTsyQESusyW5GlXPnSFmoH2pMm6uhD6Kg4TPogs5g24gmcF
	 ztYOkSNyeiPQuLxwlAkPpXj76lUgfod3RN3MrRlNeSRMKKXbCalT6EMse7DTvGuKQOMrU
	 akdpIx1oZxFo+dZoJrTwu06HCHbygehWSrh8MEx4MeOHUruvDo5chbhii8MI+yz0tpscb
	 nrhmRSDF/38zfY7Tpj18Eo4MYfwDLweGea18WOnThmyrCF+6V1d6+Mnnhfcbmh5Qhn2/u
	 1JYkZmaBp+WGpGCC4JjCEKTeh3O7JnnN8Vl+4jz2DCUM0hgluI+YI8ctvlPKF6agkCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNmq6Glf;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4B60A2626
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C4B60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNmq6Glf
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-372cba0ecf9so232492eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340398; x=1794945198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMjomd0jtFOusb4r+jQiPm04tLdqb5W0DB/94s0Gjp8=;
        b=KNmq6GlfCII17HZE+AJjaHUons5D0oj6okIngpx/wla3vWVEXU5J9gr6TLWbCSCkNv
         0Vw+wgVtfmfckoLXVNaLvezuUTj87YqcDM/+tcgED8kk7TZAEa05Ga30rj0riDh+obd8
         vNqvmLLkqQQZCEgfwMcOk42iCUM5WeZXR6CPToOmSQ2qW2q8AWk0y+hxGHvM4thiJPHv
         DBpr8+lGdsG3sHWTvY2pilxDdGXQhJ6jGmqOmqaBolLw9Sm72No8hoDcbQK+kXa1KfU5
         6vk9zBIDasMCloANO3SG915OAxGrnGZwRK1TY/L7976gwnutBSXU2Os5f6x0KohUx95F
         BLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340398; x=1794945198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMjomd0jtFOusb4r+jQiPm04tLdqb5W0DB/94s0Gjp8=;
        b=Mleyhk4IxWYj3HZ6C8HUqlYSBHY5Mc1RsOTNV+3+wp1H4U2hmWItnRwaSAx1o/fagk
         vuvE+xDASUDV4QTFqouhyZFPsTj5kgKsUTU8orhSEmXxz8fX1fkKAjx/lSzAmNKl9Qzp
         rIlPn3867kND+3P1eXOD8jehfhI4YZ0PSCLJmXhWE0R5HZcuc3H8af/3ZUG9mistCKLy
         u6Q7SyC4iG0tYax6ySMJa8bjn5pYgDu1UWMs/HvieO06f/Axej0QClr/iqT4EMINVl6Q
         4RUXaLXD0hhRbiUYfwCM+934E4R4JDtCkS5gx0tTy9IiyFMl4XbgKw8sXD0gm5sa4IIW
         ONcA==
X-Forwarded-Encrypted: i=1; AL+hErG+XzksB6q0e/YzBxocE/8KhLQtT1qZCwOFg1Z01Up6XJ0X7r+CeFN96wdlxhKQcc7vrihJGU1qUoEDKno=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KXHbzXXJJJdHfo9K6cG4e5hJ5AyRn0Ty1KATCw6W+OSQn33bg
	CjapoAvL/XlyCwkhX0AaIepNgudnbjXb7zAEIKoCn/485+EWxpfYTQg3
X-Gm-Gg: AYBFou067Rh0VD0jbYofoW5msX/p65EPLrX8EJvvpbvY6yt/Y8/dClemwtHneq5Hp2H
	jTeYjQHMsxYXapykpIUf8+cAqTvfaW06z7DqfH6UzJCHca9KrjnNUn5WMz1r7iweA+7xXPuPcQV
	CtxM29dOadl1ToMIp6880t1JRxNmEa0mrt1NV8JsXImlZnUnwmCCaJk0IIws3UTX7c8F6aUelpH
	gWWu8MSk3vuzBk/pzAcbBWfNQQX1hTiTINf6ggtbHhSvwA4tfC2vy3wO2tu1fFKRKll+oADchZw
	Bjp5GnVUU0daFVpACNIGYOlk9bnH9D9XyLPOD1JsHdDO/lW4SpPEqmJnLriPxzdzJ21l+NaxMoC
	Gm976+B/DCbToFTfd2h3F3MRj1acx/E+qHuM/pf7gEujHuVPMmn+rmKojrKUgA6YnIAh8oUM5MN
	yCGOn73RsJ6/CLRnkSctRbZNI3qUCbQTKdh1GqkX619z5yVJPSMkR0Oc4iO7rzRiWCki35HHXjP
	l/cLgygr8Y5SibT8/KS4YK74DivHs3NUBOcgi/Av2JdrW7nvMGOeJgY7F4z0s/7+JNsij5Japi6
	JH9HVjHQvESSBeO5BVQojH9aBFOl3C8dB0NAdBjzlRpkRZgs7OWNZxzmiCkw
X-Received: by 2002:a05:7300:f797:b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-376850ceb37mr593617eec.2.1794340397850;
        Tue, 10 Nov 2026 11:53:17 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:53:17 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:37 +0530
Subject: [PATCH 7/7] ARM: dts: ti: omap: omap3: drop redundant ti,omap34xx
 compatible
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ti-omap-dts-fix-v1-7-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=3535;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=BYon5LDCHp9dtQh60TtA5CEBqyx60kTVIJ4v97FVd/E=;
 b=S58DoGXGcWdkV+aVPGpG3paMqKurohdzVxoPc8uuX39+HJMn/z/MkBGIFLsYmSuooUlFisMVt
 MdTLz9HD+qOA9S8hyk/CD65Ncqg2ZT49bJWNAAQYTTaS1CPtP1VxCqF
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Commit 6ddf6c91e6f8 ("ARM: dts: omap3: bulk convert compatible to be
explicitly ti,omap3430 or ti,omap3630 or ti,am3517") added "ti,omap3430"
to but left "ti,omap34xx" behind. Drop the redundant "ti,omap34xx".

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts  | 2 +-
 arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts    | 3 ++-
 arch/arm/boot/dts/ti/omap/omap3-ha.dts        | 3 ++-
 arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts | 3 ++-
 arch/arm/boot/dts/ti/omap/omap3-thunder.dts   | 3 ++-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts b/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts
index 0c6f14963e5ea..0a32ccc84e932 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "CompuLab CM-T3530";
-	compatible = "compulab,omap3-cm-t3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "compulab,omap3-cm-t3530", "ti,omap3430", "ti,omap3";
 
 	/* Regulator to trigger the reset signal of the Wifi module */
 	mmc2_sdio_reset: regulator-mmc2-sdio-reset {
diff --git a/arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts b/arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts
index 94f6b7931e333..e231209be3a15 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts
@@ -8,7 +8,8 @@
 
 / {
 	model = "TI OMAP3 HEAD acoustics LCD-baseboard with TAO3530 SOM";
-	compatible = "headacoustics,omap3-ha-lcd", "technexion,omap3-tao3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "headacoustics,omap3-ha-lcd", "technexion,omap3-tao3530",
+		     "ti,omap3430", "ti,omap3";
 };
 
 &omap3_pmx_core {
diff --git a/arch/arm/boot/dts/ti/omap/omap3-ha.dts b/arch/arm/boot/dts/ti/omap/omap3-ha.dts
index 19e471eb3b4e1..d4d883f588eca 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-ha.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-ha.dts
@@ -8,7 +8,8 @@
 
 / {
 	model = "TI OMAP3 HEAD acoustics baseboard with TAO3530 SOM";
-	compatible = "headacoustics,omap3-ha", "technexion,omap3-tao3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "headacoustics,omap3-ha", "technexion,omap3-tao3530",
+		     "ti,omap3430", "ti,omap3";
 };
 
 &omap3_pmx_core {
diff --git a/arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts b/arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts
index 1beefc3194224..c2b4c707cd9e0 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts
@@ -8,7 +8,8 @@
 
 / {
 	model = "CompuLab SBC-T3530 with CM-T3530";
-	compatible = "compulab,omap3-sbc-t3530", "compulab,omap3-cm-t3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "compulab,omap3-sbc-t3530", "compulab,omap3-cm-t3530",
+		     "ti,omap3430", "ti,omap3";
 
 	aliases {
 		display0 = &dvi0;
diff --git a/arch/arm/boot/dts/ti/omap/omap3-thunder.dts b/arch/arm/boot/dts/ti/omap/omap3-thunder.dts
index c87956c59b083..a0cd06d4e39ac 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-thunder.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-thunder.dts
@@ -8,7 +8,8 @@
 
 / {
 	model = "TI OMAP3 Thunder baseboard with TAO3530 SOM";
-	compatible = "technexion,omap3-thunder", "technexion,omap3-tao3530", "ti,omap3430", "ti,omap34xx", "ti,omap3";
+	compatible = "technexion,omap3-thunder", "technexion,omap3-tao3530",
+		     "ti,omap3430", "ti,omap3";
 };
 
 &omap3_pmx_core {

-- 
2.56.0

