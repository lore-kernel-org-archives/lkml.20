Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76811E5B9A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158926; cv=none; b=DTzffcbH3Hc4XztesZ51ibMZvBUgU8SAphDlpGb38xi7urDIpIB/bTmG7O2lPIZvozlyWUlos8VySwcOA8qvKBbk9gbbDBcAeaW7baNhlADhAkj9ezMDhqI0WarVvG4rkIhk2m/op8RN3Cl4Fu21X2VKdpI3F5xR/uX5DM9x3ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158926; c=relaxed/simple;
	bh=JSzgZhVL1qDlrIcLzUkxaB2XJecqxdWMVW5p7bya/MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oujDTrsU1C3eoRv7nhM6/GR51G3VjFBQIgFlujuF2ojNzVVU6hjSknNTr/5LGj1Diipf4jVQtzAJu9HHXoreUoHMntDi8IsnkMJNPXzvzj5KXox2OWyaDRjdmVWmIkDxueY3JSw/Hv6xhjatHbECkw0ETSgYxXQ6LsqyxQ9/fuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYbYgtjD; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYbYgtjD"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f066d8so697465ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158924; x=1789763724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kHBzfgquaXRWdYlhp+0HjCKIr2/nM/SVVPzQiQe/cr0=;
        b=rYbYgtjDzS9fJpbxIy/1VtA/Yvcr+TlrBsAHzTiOT5qDglgX6rst0TsxRFw6oGuEF7
         e6Cxgx34BHBYxpwVqtdNKKSq27IV+vN4iDaEhNrcRMe0+ipPVyJlfccGkrq5mvPfe0M4
         4DfUjTEkQ7QXZ+5SnUHvKIcfcONkSPYQrGnrHpunhlFRjYIk33mgYOhYczEZXbvOXbuV
         SHSr4pF91D+x9es7dQVHoFUwXVz3qLtXTgOdkSbd7WrVyiB/3oemAR+TMLl/QSQjWZhb
         rb3kRPJ2p7UD0+cEMAlj581rnld6WAeHzj7ohxSAMi24njAYYWCpK0Zfe83ge+cUoN2X
         TMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158924; x=1789763724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHBzfgquaXRWdYlhp+0HjCKIr2/nM/SVVPzQiQe/cr0=;
        b=nAAKgOZaf719tp3oN0zDdLUlLX6Lq2SRC0yh57vEKpaosjq53WWGNarI2v257ehqKG
         LH2Cx3g/SnuKez1YnwCVrmlkji2z/c1WXd9Q5rS0iloAsNtCnJbG+T3bdkUIDz3mlu03
         hDG/P2gK9YpD/pRXZl74QgNKzZO68TONtO4+7c0N6y5wYTadSL0GwOH+Hn2NAA2BgMgQ
         32Cb67n1yfQtHKVFCRcTW2a9mgLPtfk0/aQrkFIviAz/HefHDVOgpTHbO7UI9T5mQceh
         H3pZT6QNjIH8WdqoZZn6lkGJTJ5eJOlqwiczhDXIy+vMCzYLxvZB3comd/l01L4OJlbj
         POcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgFNidi5krhGp5jUJzRqa66qdZ869UcCPWGmo7JTNVl+KXSw+QRiMueExRJZa2l6bpmgP9hddHqvkUUTU=@vger.kernel.org
X-Gm-Message-State: AFuF++kj7Oa8+G80zwM+Vm/JIm/Le6SkFRxN8wfp6acwdX+2/SZcD2FU
	+X+5ieW/I+XuT7CcDGC0YlLmDh4h2V29aa1O+MLUWe9f+S8EXNFjze8k
X-Gm-Gg: AYBFou1G+buqxHYvp8hZ56BHT/bT1e8j7akA7PH5eNKW0tHp6ipdLc0XRPZktswZYNR
	XRLOOqxtkUeWDnJMM47PbCGWjCmaGVX1r6TFAV1JjD9rTXC6lUqbUwz8VAWulbO7V0lCzebI3wB
	ghbTTU3ypQfl9MOAnqc08VVqanJktTcNUK8viMo5skXrfq9sEXmtFjrMCyxKyaPXHRMbhYtxltH
	rejqryP+G62pT9vBUsDTTwb9V8ymdnPC2kJbq9Lw0DHQRPzre01h7k+FPbDLsftB6vFC6aj5XAm
	/zIUjIqO8YSdWe+E4r0sl3D1X8idrJQ7gRiPfsRO3gdCzEgmGeIOIRt098kFA/acP0TFBdo5QiF
	6Nyjz/pu9QWk/uM5gz5Dw1tMQQfu1EM/dN8TSwKUch1osyY4eVbp2dkprtKo79fTceDta5kxtCh
	iksYbaKCw5/nNW814bUGA8tbRBOMznaImrqAkvpXCQSt7kjvZdfF316NzVGzaFdFQKIUU7VFJ5R
	6OfS/ne3S/NYgxjz68JK5yDPzILlKZG7yZPHOYXI38qhKpVftMzCSe9r/9CHZREsrRHKvmHzv2v
	QFsUARgbdWAg01/8lr5uYDu18upxjIiDUtS7iMY5wAUUrc6X
X-Received: by 2002:a17:903:2452:b0:2db:2c05:5d92 with SMTP id d9443c01a7336-2dd2a1fbb4fmr61652715ad.8.1789158924270;
        Fri, 11 Sep 2026 13:35:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm16865345ad.3.2026.09.11.13.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:35:23 -0700 (PDT)
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
Subject: [PATCHv2] ARM: dts: BCM5301X: R7000: add nvram node
Date: Fri, 11 Sep 2026 13:35:22 -0700
Message-ID: <20260911203522.105474-1-rosenp@gmail.com>
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
 .../boot/dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 24ba8f8f9bf3..6ea845f3ac1d 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
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
 
@@ -104,3 +113,8 @@ &usb3 {
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

