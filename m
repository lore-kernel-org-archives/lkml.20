Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9404409275
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154430; cv=none; b=ZlXP8GIOxdqHgMEIu44RO4L7u2WLwjf6CmrqaAQazT/0dogOBQZAzJ4jVDlhb8oj+YDF4TCKqUohauO+fzaXBJ0vDGUZfmAOhp/DBzq9Zj7A1PRgMg8bCNh/e5ALC5dyi99KpQxmgTxIxfDgYDwOSi12Edw95J6nx0xon35ElpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154430; c=relaxed/simple;
	bh=+PC7doOFzPG+ojV9Rhed2dlFn8Y4H/2XSh3B+i6O49o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P4fapZv5njJ9JG/CYGhXJ2Pd/fBy/aThmCep8R6V0VmgOHiKFyl7LsgDZiinMd58J40d1JGW2s8X2eaX50r7YNw/tUHWoAdPJcJ5fA1xXCkdreGv2B9NpjToJSzSW3rTfGJQn+U1ixDvkKnrG4k2ktYynNF6q41wIr6Mzq//2uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2UL3jb+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2UL3jb+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso1255364a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154414; x=1789759214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJukEihkZ2CZ5UwvR+b+a8gy04XbjNXCZYq/GVX23J0=;
        b=s2UL3jb+LJzP+Sx7DWs5xymJrgMT8vRDBzUzqRhjYyauYw5Yz7h0Ml8Dmoizk0OAXN
         Zbf/G0PbLBcvMAlWs6nWJTVjj+hQdJeMjWcFueOpz1VrHYgpQbXMlpdCpMKK1/ayQMRg
         vqceM0kFpLsH31p7rBjVNmQsoldRK8GwOTBW1tKiVVJMSYnvJ8wlueTIlDMP+otTeycz
         eFwQLzOd1/2VF1Lw98wMxxYMAjpTYIbJoeB+3qJLK65UbpWR3auNQBdtiYmfj6cXgwQU
         mlxWQfPqEXGOZj6PLSBVxCw3DYLhZcWhmjdrrBi5M4pXiTQeuRxu+PffEIHU6MQHONRg
         kkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154414; x=1789759214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJukEihkZ2CZ5UwvR+b+a8gy04XbjNXCZYq/GVX23J0=;
        b=Em54PVq72A1cxRouMKo6RwHDznt1ZTtcvgqCS8a2jVKRVsVNyZU7/eheaJZ/+Ivu7E
         H5C7kJiHCN0j5llgebOeoOCq5C60KoFTNFqNrn61KxIL65Sii2IjvN5ro234nOlzy0Cp
         0+gXAx+mFQQNB4FKAL5f/qNX2FBE2q718joAEUSQFnHNt/b5Y5StyEfD478L8KGdUN2c
         pa0gDGEsG+JBTovDCYGCIXb0tvY5yLhrpTpHZCJb7o76wGINQZw5jp7O/WNamcYmR6sw
         cQEpkHhkApOrSib4KSvK4B/gEeHcq4DVIUkO960XMqsjUHdWlFHZ/djSvqMKO+DugHSV
         PASA==
X-Forwarded-Encrypted: i=1; AKwUvByyl+HhQZObQkUFs5Oxjy9c3WcNeizrb5AztUdLSitj/1ysvRMU8+K4ITXahNZz1JLOTfamlQD1GK3rD4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lmKkGQ0ZaIvp3uVeTNIMNorldywTO2B/8IA0m/+4NmDG2qQX64
	2CC97uLuMo3pMg/C5B4vTgmXFkQzR5A+UI3XBjf8/W6+kszFnNTunyLH
X-Gm-Gg: AYBFou3OHIkh1Eip1eUdIb5ygrzdp7TdI2i6y15P/p+AweqF26xOHtUMFDRJ1WmUcNe
	mwavCIVVEdF0M5/HDgXxqz0XIJt44rLKsioH40lHq+1oDWwrC04E3vLUyI2QCyWTQs1TBieyZNg
	YoQVgKc32O2HrRK3sOSTJMYrYQLrBxsCwRK5o9OrvKy01ufrDk7gINDUyOb0fda6c5zX6EC8lri
	4cxnACWdKpLjqMkUR8OIeflQUSxAqruTkldi6nhb3j4iRjsP4/XhDUEe3rly61ht4bBpxh11AlF
	YLmsbUdS+5ybZMUkdQ7N+/MbprrlnW/czjfFZBdbaeatlzcUKuTkfYS9yymC8E4rxi7A3ECDued
	WjevjHjxXr565U+xoC877ApM24hOYeS5IPWllfEH+E6b1CEGDWvQ/3lOoff0FnUeIosGclV4dv/
	3NqBHqLLuRvcq0vduiBObvvV8aY0RfiJm0TUtjUzG1s+ZAADdk9W2i4Mz5sFS38xAPYdw54Z+Me
	ZLALDYuSVSvK8ji2ehuSvsluxbgrduVMDzAz1xRQZJwBkUw2o7CZMU0ZQ9UpAGsjWiIM9vQbfdX
	FPjLOBx0j2gqRkFb+sGFFN8gzrd58IohTDHVKSxDnGsVh39z
X-Received: by 2002:a17:90b:2b44:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-39d9c1bf032mr9565003a91.12.1789154413950;
        Fri, 11 Sep 2026 12:20:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm6375296a91.17.2026.09.11.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:20:13 -0700 (PDT)
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
Subject: [PATCHv2] ARM: dts: BCM5301X: AC68U: add nvram node
Date: Fri, 11 Sep 2026 12:20:12 -0700
Message-ID: <20260911192012.81280-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set for MAC gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 instead.
 .../boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 3fe17bd7b86d..6e82d2af9f1c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
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
 
@@ -83,3 +92,8 @@ button-rfkill {
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

