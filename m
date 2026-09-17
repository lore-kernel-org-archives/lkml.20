Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F8354EEBD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659716; cv=none; b=d4YlPuTe4NBBmt4hthPDhmY+EXdl1k1akhdydGDlXYRyN1eTs6vAKZrqCeupkJ9CpWBSLLutxPpQqQbqhiPweYarV6HtZHVJzVwBwtjbdO9UoSquYhicHAQB4rR7s+CuhhpVu+XoE1vxsU8jW9X3PEPO1O7z9My8BguO9JpgyII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659716; c=relaxed/simple;
	bh=iOmCO9NxqyQ+5yWQl+Ovx/mmtM/mWQRsYwhnpKqkdrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODoySeu+croFopSrFLiSvLvBtceuJso3xTX3x6+sYIcqpPH2k7OeNFd0DvNcvDb1LCKAIX4cF04RqMT/umngcn19fhteTYgLm4Xrs3aCQPJv0kbOXJM7F7ca9CvrkCpJ6JZ8h/87JuqAwilinVkA/VgKeuTrqE5i6UKjf3qWNJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB5PZSXO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB5PZSXO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso5210595e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659704; x=1790264504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SHCRdKjHlCadmC8q5y5P3i56DmTdXwCHjJybAu+EXQ=;
        b=fB5PZSXOVhzFJIq/JkG6bgcXsNbWOp52mWMlR+T9sNrJ4pjqvRSqm54BcbZpnZXdu5
         64bftU4KtKF16lDfPXn5ZBnUwXlLQQRNQuvBXCMSUVHeQJNVcDfTXy93qBRc8wPuVNj0
         f06cHdZdgIHT/Qv8+Sicdy86gOsuhIoRBKT5nn+n0dtcE0ulEANSSahco7nfMFVA7UeN
         9MfqutKJ+UvBEAXdHO6G+fsiV4lpebV2dfbwhiaJ6H6u4UzA3UMCjKuK2LWbhbu/Gmik
         6B4d5xDM6xYfVWtSOTk9QayAh7uuK3q9DWMpuoBb1cY3h1HAOSsN2FwWCDnL1ZwOei7h
         WKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659704; x=1790264504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SHCRdKjHlCadmC8q5y5P3i56DmTdXwCHjJybAu+EXQ=;
        b=WOxSQ4YHwz7nHpZrtAPjoVZV9XANdEBbr2TdoBPrVBn7aTndNbzH6uRZ58xzB/8qDz
         u4jlnHAWDa54NC42op3WT28o4n9GmX2dj2/zP6ZJMVNt/Uu+ItFlvptJRI6+n1ZJ8DiM
         wl2Zxo5QSj1ThKGHfgrBx1mcmPxceWLZ1w67Akxxx1KoJtc3LjGL4DpgHJfnqcBD+R4k
         tkGeGtVDMxtylQ84td/D0Mfr6uWkE65C1Q0MaKcCxUXKFNfqLCkMxx+Ya7w2678SEgCM
         6RsTWY+PVybjbtzmsvxa8vQkju6M6tgFzvNR+3pfKNXsl7Othki7B5aEmT+UlorkaL8T
         FjMA==
X-Forwarded-Encrypted: i=1; AKwUvBwPXaKN8jBecAY0Zb+Ppae4Iws5t4j/ElQW1y3XlbkpHzOiagUsQ+S1M/VBQGwfewGVclR0/vAr8dApfj4=@vger.kernel.org
X-Gm-Message-State: AFuF++nNlJ+m9WKKouRa8r2csv4ISR8K0sTuavWjg9tAgHYhUhh++VLC
	+N4G8fSjUxvLI3EGgyxb9qu8APKMtGCcb8mwF8k+sFyhZYkErum4ZjCi
X-Gm-Gg: AYBFou2xSdoSsmkHFbxqa3Bs7o0mLr+mFOn22W9QTOlJViSO97EUOCmGxK7J1c3ivXA
	k6T2JxPcsdTO0hEZseXyinVj/BsDPBcnVMu3Jntgzj2frUWY/ynh2HJJBNPbIhmgMCz3ReaTvV7
	JU7l1R/PDvEM/5Ei9AVRCqLsfDtUZn77QCQahpMyzo4P3d7HEhMjweISey9oB+gC2U/gTUIVx7Z
	zfRVYo1HBEMApQhnE3n73xcmHnCcACZK4Z45/t0bspspOo1E0XfD2renOV6wO5RJ+sHkZuT9GeL
	rk5izB2mCcPnSTtYaNNogChXMuCkwUmOCrrFvsN5uaTVfLOCdOCw6/gBsFLn1q/VIKAousb8Fuk
	Wez8ufpWQGzCBTAp/tG1yli4chLCUf9uUzV/YKCmx2l7KKXeo5EgAYBkWp9ZZgoL9in8R8s1i0l
	ciI2HOyMRASeDtQDRpVjOaaEIrG1nTn9sJR7h9DPW7NDYSdhG17QUvIRPHGI+nJOmpVFb5rAEy8
	9MT/G4dWEsxiRJKHvg56aTHqrM2vwO+WVATQG6Uhl7KtHoQxjFut9SU2VXmU1qAkIbTox9HLC5n
	Dc9eQEWvDFalNIW7cpajFQ==
X-Received: by 2002:a05:600c:1f87:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49eb732350cmr85671685e9.21.1789659703973;
        Thu, 17 Sep 2026 08:41:43 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:43 -0700 (PDT)
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
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v2 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Thu, 17 Sep 2026 17:41:30 +0200
Message-ID: <c13d304b5eb9a82717d192aed0d81ffef5573aa9.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet PHY reset signal also controls the regulators supplying
VDDA2P5 and VDD1P0, so releasing reset restores the PHY's 2.5 V and
1.0 V analog supplies.

The existing 100 ms reset deassertion delay is not sufficient for
reliable PHY detection. The TI DP83867 requires 200 ms of stabilization
after power-up before MDIO register access.

Increase the reset deassertion delay to 200 ms to ensure reliable PHY
detection across repeated boots.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 953950e55bf9..4d6a79bbb132 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -123,7 +123,7 @@ ethphy0: ethernet-phy@0 {
 			reg = <0>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <100000>;
+			reset-deassert-us = <200000>;
 			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
-- 
2.47.3

