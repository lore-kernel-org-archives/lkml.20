Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018112;
	b=KX3iPIVlsBQxirHXvyj2ifXGvfSSyUvrLloBOQG3Su9hc4vQOXfSjueSSANcU3AEfSOc
	 QJgtBSZrGKC7GfvPDn9iBB71ad69Wf98w3+YBLuCC++Jcc/IkR6YKYxNeI5csrbqCQdIL
	 ivlMWKF1l/LWshj3h5NRR5p82c+XGlkHnX3Oe64ztgF80riYUG0iv1L5p2XyqJ4XSpgqy
	 Dul7zooz1nMooqk9ipFhT+Q+xF+crhsdNBTempXrMDqnXqN1X6l5CJSEA5PcdgM4igT0I
	 ZL+vPBT1yo6puPaHfJwFiHPVeQe6KngsgnLdan0d8iDETTyrr3l8YJmZqmEvakRezZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
	b=zq1UAM9Pn/wcCxQeP2DnsLoBqXnE6UUiDTwn6GS6PjQXvuPDFRNhLMgfKrtXQR5CFQi8
	 jE7I7d0g+MN1ec8hslfclMEKvqXiyrL5qiTPvHJ8kVrUfS1F5AeNl8UCGKcJfJ8CQcvNm
	 7R1Di3AZBiMcOQRzfv5YoIW001Oys+XAPFgXuCfbPmyVf/VO4xYym6diVqfQOFIWfNAEx
	 mU794MrlVFHUPJ0ekrlngV3ecV2HFE9A3uaM0QtoCeBBeXtpqqGPKI91Jo22WjYmpZW3d
	 bwMU+GuNCDR58m1PGY0UjndO2/NfdPPqS/srlHhIPIx0vaujaStUeTLubhIEFoNUcAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qkhv+Hm9;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB847606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB847606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qkhv+Hm9
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso9826125e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793018110; x=1793622910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
        b=qkhv+Hm9IYH3dXC2pNRxrOmXBhnnePnkId7peSsnhaChoeVp3+7806GdtwGAS5i53p
         nE7LffofTV7VqZUr6sRHceBvM9ne3E+RRNxrkrK5i7QSvK7377A8EzSmcF7HvZIWVBwJ
         ASC3LtPK8noipN+A8tHTWY3+3YSBFQwleV9UyzuBKMnxWwrCWNCjhJmra7agliSt5h22
         6UM6qOnfUhFZrdt/+jLZy6gas6JEF3pL/65l6XC+qbqnaGlMlaL7B84RHe30WIDjlpw+
         vrBAUxc4FXLpmg3yrWW7aabuYTmrZi0ihqHLP16OOHAIT80DdbhPTWrTJKe0HlUBIZCZ
         tSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018110; x=1793622910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5A+DLdxVW9FkUL5FZuPh/ObPDtnDvcGqZf/YqlSK1o=;
        b=buiuihzr82tK3qNMuMsSwr2iu+XWx/QlkJrVfSz+FJdoQlfIX/1xrvydbZQRLNxAAy
         VuJOZgVUtLuoWpZfJR86AXWruA1KJc3pboLc/xefRgmngaOcqT3IzwxF/xvS6vynVt0/
         ZQfvQ2rDORYDYS5UqN8ymR10xEBjsIQs/gIwXd1r1IIF8E4YxUg8Kc5CtgXaQLjpMFgV
         SZekAD+cKoaGuwNWpRkTytdJHsMpy2yvj/71i7T98geasrwCIleesACQFbTp23MUoKk7
         oy+TA4+1794CTBj9ma45Bb7woWqwRcu9jWR3i3o+ystQbEka+hZmUEim/RVBw2wBh8kK
         oTAg==
X-Forwarded-Encrypted: i=1; AKwUvBwdlZ8GNZx+E/fNThJD46a6MwoaEUxM4+P7lSHfog07PExH1cQT3uMV4c1CK9ajVhsvVyKQxF+M4ZzPojk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0HT3FaYXgHPU5j9X2Pi0X3iIqgZ6I5n9Jhiy2Ydanghgpi+hn
	ah3lQsxlOZkxkB0sqodFFQ7uRkkyL44uBxs11EI6zTxSQNOe57lowZvl
X-Gm-Gg: AYBFou3/Jh2WF/dQxJ0DgCJnaJTzHEEGokaAuPd9sFy6hV4EJ1h+bo5rk9VFiI/90m8
	kRfzcioI9zPYXlOU6thZffA9YzFQSPhFo9z2rUzos2v23twjIUoFRAkRufU3uSooyVtA8tj9GFH
	axo4IrRFk5uVLEwBxZN3cKDGWd40NNXvunghnqr1ppNszo1Vm8UYLzKhX7E+ur0Kaq2ZO76t0Z8
	8/dJTIJ1IUwdWZB1c39I9LgAAfgudHs/wlf4+RYjWMRqYL1CrM4zA5mtdjEvL8UVy0yswdt+12i
	PfK0ks4jcM4TXQ9EtQwPshFRToGEKDGOS1a0wuyK5nndsoN5yxJ+VAAbzmOSS/2QOfb0qPej6oN
	5EtjwEeQbwNqAWob/d6gh60wBxINSEPPglHbC3F+ZUyhCF5NUHPufzbFXeGfhuhIvuMc4vGpf3o
	bDTFKWYqWYqtPiZwUHGQk1vtqAcW5R7ga4dIMMXUWVx1LY062Tl9JF/NoEznMJatlu73+fFrhzg
	oekWkoclBpLKFNxygQwkrPE7kcOiLcpb92JKM1bPPhn6SvO0qNXnUia/mlz9HkaET9hMHk2xqu4
	wgstAzBp9Yg9NEHBtPTdC3AHX37nKdmwAffW1ONo5JFtE9+KD4t93E2HK9QGbSQk3RDNRS/aZ4g
	=
X-Received: by 2002:a05:600c:83c7:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a35ac39cedmr117361485e9.3.1793018109889;
        Mon, 26 Oct 2026 05:35:09 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm19175944f8f.45.2026.10.26.05.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:35:09 -0700 (PDT)
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
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix TPM reset polarity
Date: Mon, 26 Oct 2026 13:35:05 +0100
Message-ID: <20261026123505.48909-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The reset input of the ST33KTPM on the Sonata carrier is active low,
but its reset-gpios property is declared GPIO_ACTIVE_HIGH. This
reverses the asserted and deasserted levels of the reset signal.

Use GPIO_ACTIVE_LOW to describe the reset polarity correctly. This
fixes the TPM not responding on I2C and the resulting absence of
/dev/tpm0.

Fixes: 770aba46ea0f ("arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..2644b7c1239c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -259,7 +259,7 @@ st33ktpm2xi2c: tpm@2e {
 		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
 		label = "tpm";
-		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.47.3

