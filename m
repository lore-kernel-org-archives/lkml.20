Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB774BEE3D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767153; cv=none; b=C5fzYI+oZFPL7aPEOoeGFeKsXpfUy5gECH0QZCryaKRifUynP9oe6p7MAZGvGxbYRa/Q3QbntNWW+bVxFWx+McaO/0MgAcIdBlpftQSIxqu2+SVah91lTBF4/Sqm0ls+RbDkEficy3nNDaw1nym8iCwi5wcBCodd2AIn3UIpGLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767153; c=relaxed/simple;
	bh=b8orlYB+Eqxk223Z48vvATiAePqnM1YqQUV8EDg5+qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNw40Vpuyx9mQVcPCvZBAQwxL1JVD2Kbbv8bXFGkDuCymMMscwL87DB6REM3l2ALRPSLuBJ+wSrtckWke3u08V9Cx7i3tnE2qlzK/sDtqanNO9MCQ7QGw485CSECXxF6D9nfOfmWKr48uSd8rOx0a0S2S7dlSYm2D5msU2Rg2Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4C8nLCM; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4C8nLCM"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469d249c6so3177525b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767151; x=1791371951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvu+NvcyVJHEn3ev6yli5NPbBHtkoDtdYJwktOVlhhA=;
        b=E4C8nLCMIOrqntMaXDIBTUH7NCy3Cv6Ui4TXNZDN1qi0zGQjw4+4w1h+bCY28rU10k
         XrOFmnild13OOWP4e9/YVt3XpymOBDFUK6hNj/NC5v57Kers4aJ8ATATosRq6N9uYWIR
         E2e3CNYL3bD9l5LKijxJnkzwlGFQio9nSo1mqeY96n1zbF+8JDQHZOHZKGa4uP+AWb58
         H7wRTB5Qz3d7K9OeCuAr5QLZOUGQBIbwywHV1oratcRzG8iFCQQdzhgKcniseO/oMRyc
         S0PYQnz2pFHr97d99rNx1+Y0xk1nfA70eaeOeC87d05SiUiOt72WOtuuocVraggo905u
         I3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767151; x=1791371951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvu+NvcyVJHEn3ev6yli5NPbBHtkoDtdYJwktOVlhhA=;
        b=VrwG3PFgyeP59a/P0DO8uSf+M6qF63yaeYN4hQvusGKq/mA4wV0nH+vZf/g22JMGuL
         3NxqpAu1cauWhxqEdwxD9p+8uMAhFl1l4ZGZpxYQuCQYuA/EuTEzh4LbmiZn1uz04Pxw
         ihRNJSQmWlVyVxP25DYc3bD9MReUO9ScmhYcp9L4YVMoMBkKZL0EFhFhFBkORZs1HLI4
         dYu+wzaHPyf6+HMozBclKvrlCFABqp4BVfJLqXVHJHKIfKP9itfwBknkE0emg2WyjfWl
         Fqx4gU3UgxAXSVmKE6M7Efj2jaXPOnIKVs35OpnoWO7FpWQBH7kVgbwt3r1oQg7xObYf
         DlDg==
X-Forwarded-Encrypted: i=1; AKwUvBy2YCkxf8RF3tuvShkWp71A6pULx91JpUmDVMaDa80F5Ar8bcDxKzBIwSX/pEqedzXs/6851wE0PDDz6tY=@vger.kernel.org
X-Gm-Message-State: AFuF++n8vA2x4aFdzg5tFI0fBQOLj7T51VdK47ZxrS5r/cnkIzXyz+x2
	+CXZ8nboqI5jIq+fTFT+T5kxqpjPX+8mVq+6XDfVNpZOtEC2B2C5ZVbt
X-Gm-Gg: AYBFou3gfXX48nbgq9PkMdF0GHuBwEWCSXd/Pi444jLPWXjiib02/fQbaduzwMKJ9UW
	vjACSvjt+DPd1HV1xSm+iMS/DYu1Tx3KlcIFy9TuDpbfnnHlSZlFcgov0TyhQV/HiLKllFWV8Su
	b4CAV8JGjyf/n56+l8TQXcf2D9Y/HpvDejQlev8RyqCdaWTa5Vb8bM0fWmWhXQP6NQqWIyygLOE
	bpM9zGhXDaFEEzYgf9fI8XvtIAnHGYs5Pu2CaVzaSs1vAK+IdhilBe5PlQ0WN3Rif7loXkIY4a/
	/3pbEWrwDVI2+FVQ8CCQJLRAspxCUB+DW5AA049tippu2C5YcmFaI/tBAGuIVpeqCf8l75wmhga
	cjBz4xbQHwTRuAA/HA4tLHNFqWiDySNPmVCrhKTGdwuFK4V7bs6KadHJp4gKPKEJtfF+GfY5ilN
	LFHI96ajIK+KlHBGRdYe6J3IF0HDBej3znSbg+oWc8mP9p7cA933jSSbYp0kKnJLnasp0cnI3zk
	COyijuklxKTsqx6WC5/+4RShW4v6SXyNczX1/sUC8iC
X-Received: by 2002:a05:6a00:124c:b0:874:706d:8572 with SMTP id d2e1a72fcca58-8874d979000mr800957b3a.35.1790767150679;
        Wed, 30 Sep 2026 04:19:10 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:10 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v3 4/4] ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
Date: Wed, 30 Sep 2026 19:18:13 +0800
Message-ID: <20260930111813.52396-5-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative ISL1208 RTC at address 0x6f to support boards populated
with the ISL1208 instead of the primary PCF85263 at 0x51.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 1883bfb850fb..76b7117344de 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -1269,6 +1269,11 @@ eeprom@56 {
 		compatible = "atmel,24c64";
 		reg = <0x56>;
 	};
+
+	rtc@6f {
+		compatible = "isil,isl1208";
+		reg = <0x6f>;
+	};
 };
 
 &i2c7 {
-- 
2.43.0

