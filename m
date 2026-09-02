Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335534AA1E4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367415; cv=none; b=pmoTr7EiQi1aIatJRHvi6rGv/qM+2QG0hIWCcwyPWn1v2nMRezHT2GpXfXD+44us+yr3CPEnDhMImTTgWOT5NomU106iVvZImUNzxKM6aVbVfrijeH7KbfVjJBSZH/9HyzJQjzlx0+HrsPqGg79SEDvRo+ak5V7YfI7PfGaJIJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367415; c=relaxed/simple;
	bh=cpj++n5yEucYh17JiW67YDU5AHfejmNI3LdbjDaqbos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIrYLrHh7xBmLfyaq2kgaOzriIQl8hTn5D7qRiMvfRnZitvtDmheyIqJ4HIIh+y5i8m8BX3TG9OJIyfoMnySFJrel+Jnsj3UEE0+lAf8P6MyucSGXwYP6l+IfXAJ5gOSbQ61JNyj4YZJuZECOkb3V5qSzyVsiTwn5VJ5TbY0UkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQ00IuPF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ00IuPF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso9155035e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367411; x=1788972211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIzXwSsGWdM/2DswVIkQqllThw6W06XdbG4kX5z46ho=;
        b=YQ00IuPFcBen5Z5awhKbR6ipx9Rvgi4J+gzUsIiV69iFMiSKy/ee8JqsIK3sZd0i2D
         YCrkDfIgRMQ2uvA2ff63kcnD6jhFezOp3JQwrdQEJXTonFoGdf4r4ECsp4OtWe189V4G
         hlIWrc4lmBO/F2O6XETQ5yJmuiykfTIxsvHkgXcr4u4buA58o8QtwZlIDQp8WGSloig/
         Am13K+//zTRZG3oW8hFmgQOErDJaqBtwycM/ohWr/YFfWLPOZVDABh+yfvGi7HMvkNa3
         wNDl/Cco2rvOD4smzwMzheWp5MBW3UtpaasuI+lowjBGJPuRojOENGNfdj42AukmITi1
         OwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367411; x=1788972211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIzXwSsGWdM/2DswVIkQqllThw6W06XdbG4kX5z46ho=;
        b=RYbq00Q6ytbzMzqEyxFAaiEZUnk+pFdUrZMCv3PIryBr7nMpvbDSN6fVSNzd53yCHB
         v7qMOh6xvRnDFpLZcqfXJRe43hPOxLjd54DWmS88bjeeKIwrcvyPCwzzNkFHXZ1OWjsa
         La11m+S0TLwpC2aKRyWlfAHHXQ43S3Xfa6vIwxtL2gk8wROVw6V2ZqhvTfZjS4db/Obr
         e+EICrreFNL6cREnPwrXTkSzJC1R26aTgQIR76zQPAKb+1kLT384bsJHpqLtk5aPANaE
         rkwhgaXV22eGcYWhLgAoB9EzuN/Y+7VIY1ppEhPxTkKXLB/Y7g1u65TaU2iOENqxZKX/
         /5NA==
X-Gm-Message-State: AFuF++nI1ccZ48E1uvRQMdLa7IsFUF7BFf/6IQH62VRibGCBw+S1RG/m
	ESEXMRByhuAHdGTq/ai0hs+4HhK0gZtuKzW5qkBQx2vAdtiI3vqYuO3HVlo48x8OG9w=
X-Gm-Gg: AR+sD12LA5XhWC4g3OKKi+/UMIbqGqupMWYKEv2lgp6EFbp4bPeifyFRjPJBNp4CWdo
	/AJCqrt1KMPBtRG2CeWfXdXOLV4O3N+XIOQjPnhKdplfslzxFQbh10oquZn5tibjsDrfk5cmWie
	h89sv5g9p1GnkWkMjtOV+8nljPbgQvPEuKM4LS7XDZfCu0JqCfw3b5u9zAK+4OARI32r/NcQ9yt
	olgIFSZLr3Z892dph1N/GmK7RDrVifeFRoseJ9tuxl++6E1mOIblFbnJxS1eNv05C3qtk8aQZWX
	7KZA8ADzWNi7NPls7AQf8AZPJsGo/wzqwuVGoyaIO2f93yCyBJpGufdKRPcB9ahfGQGjsUmROUC
	H8ksAlUPVr7Nm3b6cb+SWnPrbpMgmvwMDUtNpp8WY1QcCTg1bS1m9VO2/M3Crz3Quw1zIcDPbxH
	9LFIeXiZBCgxt7+2Y0zJPEzbEO/oSqUDMjJyK1Zu5ZT/J+tD/936nv8r1mjKKLENwCOc9dFJIwY
	YfH+Kx0zLWYL3FQEVIArJRzjquuOW+NHqwIog==
X-Received: by 2002:a05:600c:c16d:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49ce55cb47cmr139584865e9.0.1788367410945;
        Wed, 02 Sep 2026 09:43:30 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dead1sm3844745e9.11.2026.09.02.09.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:43:30 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply
Date: Wed,  2 Sep 2026 18:43:17 +0200
Message-ID: <20260902164317.45925-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

LDO5 powers the USDHC2 I/O rail on DART-MX8M-PLUS.
Without a regulator consumer, the kernel disables LDO5 during late init,
which removes the SD card and causes filesystem I/O errors.

Reference LDO5 as the Sonata USDHC2 VQMMC supply, so the regulator
remains enabled while the SD interface is active.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
index 983d67a0c1de..7f78026e70ff 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
@@ -511,6 +511,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
 	bus-width = <4>;
 	status = "okay";
 };
-- 
2.47.3

