Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D413E008F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870073; cv=none; b=oEdCG06sjM5TtwPBDDhl7jmjoBAGs4qWZ1gxCWhMCVcOl+j2D4svoOdPQSlhOmQv4C/ll1zabTmFCHteo0iS1ep1jaOfFlngsZQKQ2G771uJH/eWSG5GKNa1R5srmG/Tm9NqNHR/nQI7/p1NmuO/JERtrtGMnIBcIqNlDclvL4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870073; c=relaxed/simple;
	bh=rKlCQm13/lVSoRcoMYle6T204+/T5Pa4/yPg7USLSQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfRkBDewQZqZq9LGiGFzXH/p8Uio74U8h6G789QCtipmL9WD7Miu5S9ZjXdV4ioVQcdQ3NMGtmaxchQPGy1vYFm0iVwL/B7g84c3ZE4/T/ASrVyEwKYCDywB/Lk5Ws6DJy42OR8FNdzOyumNavzCHlqCisE+HrnAvZjQo2c1v2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zo49IjM+; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zo49IjM+"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af929e59dso2139631f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870067; x=1791474867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Elg4CK8BHPTlS8KGlNqB5v2UOw1qnjW/5zGPlvDhyVU=;
        b=Zo49IjM+FJUumbqlcG/zNCdt8xNt8r5MwkE9xlGMihEMXhYKi4BgEbSeOoxv54zqAo
         uZq0ClpPcnfsw+jsQ1NXxuzZbEqPMg7+pToTYBhHOdkICaqoOTAmZKnL611ZEtY/15Y8
         syY3GvlpdoKLKwEyqOQpfwuE7/L+iwpH1T+DawIpc/9yngBo+tWYjLr8ngOmA45Os+E8
         N2clwD+ClQEQIAqPgID7ZYlSv3F1TgajjLUKOvCLhQSEGSKr+B5uEU+3gl2ZS3omxL/Z
         NIWkuSSirWdA1AYbwT2xA6Jc/1iBOXSGj6XCNMf8fFTG3skaPYnD61BLtnJk882Ku3LV
         YMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870067; x=1791474867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Elg4CK8BHPTlS8KGlNqB5v2UOw1qnjW/5zGPlvDhyVU=;
        b=Ut4lT7pp7tj/J3/hJEd3I1NFFZxX2mr3+FmDIyA6phrNHjv/Jaq3McH/FdsPsEfwSU
         sLtUcSmRsuf6GbeUOieyppE0zW/O2f0kwBWNDCEugkCmMsrbmogYBu96CYsIkP0AmI9a
         iVv2rFCcZjMxmFVl5lWJUsAc55SmgJg+2KZjZWFeQU/tnpOenMqetsH68rqG15DRgNDk
         7AGl5VU30N4ubgJSjAXFkacvqfibZuUoFwwI/AVZLdudtjKovq6UzGzMTLBt7xjtCkRv
         uR2uzH6cSkMDEz4Y0C8mPKG0HMoe8N3CFkM6Jm1HaLsATQu0sQO+dRdJAIhziNcq6nB0
         huug==
X-Forwarded-Encrypted: i=1; AKwUvBzoFfNemqXyKJzdlcrtixMnQ3LjbX0EAcgYi07hfOQ99BX5aK4m+BhETRBnEBFZqg6yh6HuQuQ0deubXn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9WKjpvbVkxFn2Os0rf5LM0ly/eww3ixehPkN1K0g9Y64DkMS7
	Dmn9uF5VqSFUQvb2kJ0SHFv5d78BlciqIE5ryckDtWBeN9MEM1ih2yOg
X-Gm-Gg: AYBFou2jCmWZqeizHWkbDmizHA8KhVN1XgmGgtnF297c4VO0ZcXNVgXQOVuUDc+WReQ
	C3J33PuWi5Ic44gLrnJVFkPfgWY+fkXfgzkWAE8CleEYDmGFxgyuG+o0dPR1TTdigV4jjNPCSyu
	XCpAboesuaeo4xLcH0QNHayBmTtepDN2tmdF98cvkEauVh138QCa/GuxskO6JHpbkxl4kkMphsd
	fgNO4K+JLTHDsYFtsDWWRzBbtMqplfffptU6bKHTkxUsBycVOvz3PklMCxTOG9fuBh4NhthUJhz
	JWyTKTJ9ajMDoRL4p7LlJBNCRlDwSxx1sAwUMHR9hGaZhJiJ4D12Yu3e7/WNqGuPptvz1BB9DVW
	ixI0JgGS6BapS+1mbKtpzCcv90/wG9atXsKLHlX5wcbi7m5zBcK/dLrcHBA7+JE61ZIxc/0ryr3
	GjPz+b+5ay0SSMJmbwVPIGlWJVL1pALVs01X2usLzDnPQ5TEXREHTS/BVm4bGO+ZWDRr3Ig3pTh
	lU2cA8LR67tJGR6ihGe0c+PKShYzd73Qv5rMTsDlexjD1nAAiXf6ikUVhy11WCFzyo=
X-Received: by 2002:adf:edc2:0:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-48b127431dcmr12700f8f.24.1790870067132;
        Thu, 01 Oct 2026 08:54:27 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:26 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
Date: Thu,  1 Oct 2026 12:52:52 -0300
Message-ID: <20261001155412.3177428-3-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

The Ixora carrier board has a switched 3.3V power lane that is used for
powering peripherals. Add the correspondent power regulator node to the
Ixora carrier board device trees, similarly to the already existing
reg_3v3_sw node in imx6q-apalis-eval.dtsi, so that it can be referenced
by peripherals that require a specified power supply.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a45016205..f6eb2eeee417e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -57,6 +57,13 @@ led5-red {
 		};
 	};
 
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
+
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be4352779..f015faf19199f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -55,6 +55,13 @@ led5-red {
 			label = "LED_5_RED";
 		};
 	};
+
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
 };
 
 &can1 {
