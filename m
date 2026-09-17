Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9605B5A5128
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657758; cv=none; b=Aj45JHHT0GbvkN7nmFJmAynuaDVCzjKD5xBh8k0goe0GvZQ8TXNXPya/QB/cf+YP8hl7j61H9/v1W0w1ZYZnz0VfDvD/r8+QxJHtWtn4gZPhlP5hGhcdvGJBqL+ApP0gHPBXMtQ75+34+ym7ii7krkd/xjO8r3OkRA0BXDcALjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657758; c=relaxed/simple;
	bh=JSGj5xAcSCNQ30zQL91dR8x6nFv1RRyex1oTM12XUUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCt77nVOdO8kzXY421iDZEyz9icmNPpwyKT7MEEYaydFX1VtQrEJSkn/WDqnIkjqkpWN8WHgIiZGD5tzlZ5XNlCjRcE/4lggn/Z7hB3O5exNK1D3m6RfYHkvPieYB0d06UJYpSrkdTBeubSvo4HApn/LyIpy/LluDZcvO+uPaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNJQ+Vmj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNJQ+Vmj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so5785045e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657741; x=1790262541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kT758iWLtr3Wtamxp4dNWdKJ2omPK36POe0fhekDF38=;
        b=UNJQ+VmjgMGY1WleGMLZ7pAPqEZo803xjBWt/QyJbN+cxCK/aaEkXuQa36tTls0XzH
         h53nF17KPPri09kqWJWsP47TEPj3et/66noqWVr32cCTIiq5SmxoVynKcoiIywsUaCDY
         29iqN79pFxKIaTWW7bb8Q1/0QEVLKrU7ccEFVlCSiUqofiAYIhS8Ym2VchLl5teEflFn
         iG/5cY4Y9PBYQ1T9zHqRPpihPFN7qJ2pJXoPCx5J0ne038uqO1m0C0CtFWetywcZHMsJ
         njcvylvPMmp/83Rp3ILgFczYmqBWCZ9lvLTm52LIvHSdCFRq8Ww0BAHvhro4hHo44bZO
         2YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657741; x=1790262541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kT758iWLtr3Wtamxp4dNWdKJ2omPK36POe0fhekDF38=;
        b=BX7EJaAV59/+KkZTfxtSVKicVZNRTV2gXGoF3X71ThRvaRbREK6RMVZubvtIMVNvOK
         y+JDU8PWJYqLiy+YqZMENpTLhl52H1erldTRT8rKxzQPR1AMyfWiWfyzs4hkpHD+gtAG
         f2v85p1iTStaFFJJ7Px5z+jCuOjcfsxEscW9C/WPdKhfdwysbA7GWdEkbzhw33V2B0+R
         oL29VV70KiNROnaRvHpkuHXGKDm/k9Yhn3+iraRbxH29eJwLm1dyPihvC1t6+dMWzjO2
         kKf4eMB269qq3rBfQRa0F7vb9w7NwfrMd34NgfiegDRN4mJwEmxnvuTNdbXaq46OcR7e
         uGJw==
X-Forwarded-Encrypted: i=1; AKwUvBwNgGvgZUhNM5jEQXBrrPMEMr2Nd0e3FHl3kmu8O0knywSQRz96T0h4oW2MnfEduOP16RA3YIhpAYGzseA=@vger.kernel.org
X-Gm-Message-State: AFuF++l/EVxVu3WbH5hfD1V9xl0cgYCLR7hVNTGyP90ACDkCVYPmKlwz
	Kd0pqxim50B9KB51yxTpGNoTm5AbOvf9Nj6uuZHfIISMAAui1MKkOpbDYwZ3RZga
X-Gm-Gg: AYBFou2q3ztDCDMLOybQLS85VQQvOAtoYrf64287rcDXEJJaLDxMrBNVPhOQq53iVmQ
	1VfvKKSF44mX6bJ20+1rs58QR6amAIWK89YfXPETqZ0r0sI+m98i8m3NvsMxJQyRIThA2Vqs6EN
	+1f3JPWbQ4OxPtMy9mHa5mTIZm3VQ/OGidu9PSoLEsvgrmU2HdX9hr2+B7y52i4yLnpGCio5HzP
	A8URD8qlclvyu74h1MIGd5VomPinuUTumT51NLn0GcXGw6FbDv+Z73hWsc1ZXlktjpzM5GdqFcc
	OFCHq+ecbVp8xHY0h/duO7icUpeFHk67wrUGgxwrK1BtG4UlH5YE+1kQNmyrUbaX802vdM29MRk
	E9SZxy5wHiBQFRH4NFvM9h5rS0KhsY5FVvZZ3FgXcalBc3EmihxchrHyNDdjSuOeS2CqEMSRW8R
	DXrwNphWaIYUGQWgaCjhEJfpjJCoesZpQWEqSoe5wsr3yE3YZcScKvzMkPQBHH0eA1mhVknyYZV
	3TQe06SL1LaW3HthbneZguD+63xgfOlp0TKUvmnqBlOZ6KtadtbD6qY0E7KtBf1xx/Ym0StxXLL
	qT0H7Q+pLB6+/pk22KajUg==
X-Received: by 2002:a05:600c:1906:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49eb51902b2mr88747985e9.9.1789657740710;
        Thu, 17 Sep 2026 08:09:00 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:00 -0700 (PDT)
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
Subject: [PATCH v1 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Thu, 17 Sep 2026 17:08:44 +0200
Message-ID: <73937e762f723d9246778f548c4c9d4b087e4532.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..9fc0f7e551ca 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,13 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
-- 
2.47.3

