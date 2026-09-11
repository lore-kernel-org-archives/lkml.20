Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF59443C1A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125487; cv=none; b=S3aGa86FYErbMxSrxcaWX5guVy7WpZmAlW7h0uMCMPFn0MnuJXWSqgy6VypW4zofYVVfod3WxzICesdqgGsq5HpI1wkAHZ/p5RQq0HjcrEGTnPStNEUeQk1DQjNgeWJP1jjKhoU7mVkEP1tHWCue+8M/TomFAL3mC8//Y+ySBv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125487; c=relaxed/simple;
	bh=4mxpI2/893Z5UG8GLLl14OQMNMqg1usOfIurJ8Ot5xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ovgsqgk+1/01U1cZH6rhBp9LBqjBj0vwCoOm6e8eBXoafSUevSxggxb58hsDLZwkGzQxC+uLq/v/tZLznRcFFjZwe+31Xek4RO5zXykGCPZZpJf9vC99Ex6OYL8qmRPAdIBRfaiacjbqCpoLvJT0Bv0zV0PHW7PuBKXbSSnQzHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj/J9un6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj/J9un6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so404125f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125470; x=1789730270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeO3ig0BGAoWhhaLOpxWQIYCf0wbWpDn5BIfkqhUQfE=;
        b=Hj/J9un6I6+pKzjcLr8Ag+M3oBqa0r+mVSlQ/bxrTdt8KTJa4TF70FhTz0JYP/WuZz
         TL/w0nR7i+Ei7D6l5vAX0CoUJ9N0CN/2hzOH+dNJR5GjCghsxbCNA3T/S5W2rEn7qmmu
         bHzc50aCvnA7XhkLH9z58YfOsHZBAG41xvqqxLWJN2o3q30CpYgfUm8BLtKewzF5iedv
         2KPs+W/r8o6R3f6U+BoxJPgOK1DQbEZUbjHPtIk61SF0X9t2tgfbO2oc1URojnFPfDqO
         LJC8JOKJUGQhHveE601z/jOUFsw9O9iT4zGcLODCGs7fDH3HzfcPsXDR01m/e/SpmSJi
         WPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125470; x=1789730270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JeO3ig0BGAoWhhaLOpxWQIYCf0wbWpDn5BIfkqhUQfE=;
        b=dFeGHxo4dQrcH/vzptd5YKg0XGp864hcpBuEr/7n6oJ5VKofnQIaX/3uCG1QZ4PjZH
         9sF1UbeJitH08XUKwQ2m/r7B0w10gjDwgVsbRyQbFGSYTw7X7KkAL3Zm5jsXtjI/gsrG
         AhVzruNBsQZ1M5qRheAl9SL8I61cRrPmCPY7Y/B04ciIuVo2tPw2AVtlg+KLIfYLHHHf
         gl5id63E0JZUC3Q7PejD0xjrSKUkiUa6l0xQsHna3Od+1uu2nuquIfYeQwm2uY63HJzQ
         vnxEJ8Kh8DuMZIKYUi/WyUF10qpo1QVXKQ5q2kS5BXLn5pxuOBpShZFfw3/X++TFH2Ue
         G3ug==
X-Forwarded-Encrypted: i=1; AKwUvBze6VjodYbMTcMYxzB62RPcWU+ZyvKvSWHeaJtpAiIcnYPaFBAOmJIDj73Zsgumojr1SIOqhdnXS+6U3do=@vger.kernel.org
X-Gm-Message-State: AFuF++mSJZ8mZLEaFl2siVX6HpCkfWWwcXlGVgTN1zt7F9KKh7KdmRTA
	ureVPuFPh6RFO0hJonwI8HN9GC5aEGUFZcQM5TDAiMMigJGZQ0alijqH
X-Gm-Gg: AYBFou0kXOSQ/6o+CLjv/U5cOjnlBqc9kydljBA15noIVZSsezXeqO8dqrkvI1TRB5u
	WYFCNtCJwt/7OJ1Ebzlq058pXwEXzaSKrtKtvFMEw3tLKmK46odoTOjEuFbhaiBnGL2mqi8QPjz
	m6TkbQ4DlwISyPlcEr0X8AtG5h8iNbSjYRh3A1eKlqYQAM8m3dHj6U8nXarfuEbVSV0yLIyVuVQ
	FN3igWlEULTtzRssa2A4gP6GlNp6TNiKOVYUCKNhKufmJYInmI/zKNNtEt4eBWQLpmMbCU8agVS
	zcXlefU2OJezekQEI8eh5a3oBC5DJUKh8KePkLIlfwmBjdqTBzNkNjDRNUqUIDV8Dd1rpgafps3
	LYgU4QfJaMM3PnpUELjopFhF+KnToyg+L2kKt1ohqy66uPu7ou6e3VcFlMO0XzgjzRYUBsep4Mm
	U7plV5hSY3siOklgPwc5WMN/9VS5WUHomuRy1qwdo17c9zD4nRQTg8eOGG0iDlNZipT8QrvwXIs
	KEvngu16QzU0lb033Vu7Mtr2hrwzxBOx9tWZtnJbdideIE7Agu5DkS5jTrDBBge6dCjezyys2Sj
	EL/PFyuNu3CcjCXBweY=
X-Received: by 2002:a5d:5f49:0:b0:485:b169:54fd with SMTP id ffacd0b85a97d-486eb1d388cmr7915145f8f.4.1789125470232;
        Fri, 11 Sep 2026 04:17:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 7/8] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Fri, 11 Sep 2026 12:17:30 +0100
Message-ID: <20260911111731.3404308-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index de20bed2797b..80910e0bd977 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

