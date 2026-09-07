Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BFC4156FB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810411; cv=none; b=rDUG+wzmI+eLAOKyzK/q5GlWxS1qXw+8deQ4dnCW2FK1cSjkTuBrW/uG+BK95uJ95pb3/aO8hITjyLhfrQAd/Jt31F0ct7HXRqRwVcFQ7j8ukLe5xfdVrHlsfkB56d0SRGDBelCSKHmc+VoIIqn0zwaLs0169XllY60v826+gmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810411; c=relaxed/simple;
	bh=DyLHAxWs9nq6ZjbHUwT7XIvcxiOYbz9hUehk4+JnrgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NcvpCMgu5iiiNp2Dr+5NbqPJlwy92bOymvUVJqJoFHTitQGqlWkQ3pj04atQW6unSPVMGPg3QT02m3SCGJ1PkihFi+JXJMDLUnahNpUzFGYFEyvUZtIfsYQ5hvVx3hjOu53UvdoHcPcwlpYXYaPxNt+sOhPCnOMb97JN8wl8J5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJBqeeI1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJBqeeI1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4945050a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788810410; x=1789415210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OETNujE7LMv/ipC540SMkvUZvl3I7u1TcYnMN40akSI=;
        b=WJBqeeI1lr9ojngaUVF7siUp2DG1bHQxWP7d+tKEe7FTM5DEd1gxUUgdIEv64khyIq
         py+Ek2EBiaQ0jlIx6q1kSpHpCKW3DXbL39E9skdMO0Yf/puSEJxvjYr6mYz0d5OPFEHv
         cxPduOTN5m/5v4eQdk5jlQmOEyVp3C+ktxhcdemj3pvEM9q7L6yp9TPDJJY5r5ypef+n
         /Yi2sAAUPsnrKgFHn+SXE4B0XsWL10mpLo0lZWQx3QGw7b8nBXj87rt6EjhEtRf+RIml
         Lee8BLFiUcv6NUxht6/gA5F5lO0dvi+/7rj2yZuKZX9MTCyB+znNwpt3JGpx2XlD0lV3
         fCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788810410; x=1789415210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OETNujE7LMv/ipC540SMkvUZvl3I7u1TcYnMN40akSI=;
        b=hGtIfiBOOUxrlyW24P+bExyQTf59LnHaGBr20tihwSAq1rqgnzRc+PhtsO1za2HJP5
         N4VGiTcc59IyvpGH/fYztsZEgOUT0P+QliCwRhiM3pn2YzBhZJi0MTLMgZhkAA9wJvLs
         1h+1rjbSnVYNTyHA1HOl2xGQQDTCP8+KtuubSYPfEV3l8lAkbitHG9ciVKhGu0xDll3k
         COaInNN786bRaHY2x7XUaoWkjjHVh1GCiNxJtvjf5v9AYvt8ZYrrKHbfEWi9/scnPqxU
         bXRIOAKfTY970EOVwwXo6ZRTU7hjzjuhmtdZgWHq+Y7HA4oYlj/xX8DKRxzT7f7Qlznm
         SigA==
X-Forwarded-Encrypted: i=1; AKwUvBwq9YsPATe6gLo/Dty+Ly7nGsWAQQq2+7Y5YyBkO7fyIbv4nHeVoHNbZAu/4Pv6435wccEXOn9fjRUGuYc=@vger.kernel.org
X-Gm-Message-State: AFuF++lGwIW4P/YXiOzfAn+nx1HAyqf3aSudYMdtGPwRzLSv5Sk9tUon
	LriLhv6NbPeRDL4l4u3e9371yEO7kwsPx+7OCbDPkr5AePcvmUpBwC9v
X-Gm-Gg: AYBFou0+ICjZxNnOR6gSp9WSlJ6ywLhZiGC1e2kZuryj5RVbxpqwK9c5gwsgs6CYRef
	atcvleCo3xpM2hPOfqcsRul8n1EKEOhadtGgcPwnuSXRykKgaamhfonmCdAAol6hHLMy69bqhhy
	zt7QE3l7Kvx9q0e0GWzU50ttr0KiP+dKzRK4KOHvIeoV7PnFqdDJWmwVrz4X/9aaHwmZ4fnT6BX
	hURKf+/ku6SA174/pvvJk8aXYzgsHh53h5qvusPwrcrRvAPVz7yLUgpREKdvK8CHuoFo3y7uHFR
	NvXopF+Folh4FAHU3Y1mawlvDbQFtTsRxYLMIAoSikkL33oUYvzF4FMe7CLyE9j71f0ovYMxrVd
	zQCkLSJVo3sL3N+n6mqKYx5C6zOTrTBUSf4mZRcnIJsO8qYrGVnXU+uUoOCqxpFq1Jh4xJJ528R
	fHkjXUCTQRrgocNaZnfqGQiyumo2Tw4X482p6QWcmhvL5eml4nN8hNWamZjL9ChOa7u78mHI2hN
	vwE5gYDiD0AngJ7mR8HRrZbG0OsHD/syNk9m908gJHYV6X81VtsfF+venuSl+yOcQDSCTC9QCss
	xU7flh15g1Bjf7/NSEoRDjY2cQqLpvmuzN1SxQ==
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr36435852a91.18.1788810409626;
        Mon, 07 Sep 2026 12:46:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm28219277a91.4.2026.09.07.12.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:46:48 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: AC68U: add nvram node
Date: Mon,  7 Sep 2026 12:46:47 -0700
Message-ID: <20260907194647.23151-1-rosenp@gmail.com>
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
 .../boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 3fe17bd7b86d..42618b5d6509 100644
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
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

