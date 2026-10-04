Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F76A34D3B0
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130345; cv=none; b=ZdBgpAUGuvngKEVUyAYEqFxk/qXmK6NQVtCMpB23V/0v6YVmAzSm2APkhp9iRmNvuNwqODISi+HXVxVM6KNfpL4BGrf8UNgCiTLGhy5eBXDvEvDY56NcGxqJJ3gbusSykY/w7oQXk9by51+xNAA8i4Jx2lukiQQYfCx1I6RIlwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130345; c=relaxed/simple;
	bh=ClgAq/O5MvBkjXV02sr1E0P42r8WKbCjbOJayR2ornM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EkQasnYUeC0KU7r9ff/Z7XTd+TAYyC91AUOTsMarGH6ZNA81YtVFh94UWNi4DYcGrgWeGQx06DtVbgEOvEVo0h0KtvqvmVy4WsvPZYcfwtuGOMIWFgb4M8BOBPp2J3Aw1vC3GCudbKjQuqPAadaKXW7NUF7CxexJ0GdjnrPBHXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+lyNOrM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+lyNOrM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so635275e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130340; x=1791735140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybxlrlx1Ff+lveu/EBWApT9PoULzQ9pSYJTj7oZbCz4=;
        b=G+lyNOrM9zpBINGU8MVPE06xYNVhvLZca7oQA1xLaAEuiWsdUPrc3XN/qWFDHjpyxA
         asqh8XYktlmbFkrnXIzH/A9H55YBbrYnpjxDexbUiwKn77vWAwyYZJLpH1S17ACQdl/C
         EcqFFm2uJyU2HZBV+STbA+OaHJgmJeJrxldCAeDMhxC5buVgyN7Cdz/VvDA01bKUUaNd
         frl/3FmMiErk3D+AeepIUojw7yr8L0NQ8AFCu3ziamvrKSpwLh9gDgVT62SU9bd+HRM4
         kctTisaaYETJiqXPrymcRf6s2IExLCxXeqsSqVxBjAWdjR8AFYqlyyuVgm+47Q7wgn/N
         SjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130340; x=1791735140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybxlrlx1Ff+lveu/EBWApT9PoULzQ9pSYJTj7oZbCz4=;
        b=UBK1WXP9qQQW4wmcRMb12ePrb2LigazGFjtdXB9Kvfd/3rhztoqUN2bk4gmDTrOkF4
         9GXdTpEq/NdxMv9ekS9v6X+bPNJylSc7HoTXAQ++eWml5SM83DNofiWZlZxgk22zRSY3
         8koUZ+sLG9uoh6Ma64Yz5CZgQlfJvAYJcFYLgQwckY0n83rgztyXcuGqetZNEN2XFwxm
         PoDNXlsBd273+BvFt7tUzkae5u+MJAqXWpCyQRgOL8mYBa6ijQ8yyD9mykBtcteB1RPZ
         vWXlNOQL8/FV/6VjcHmt/F+r5vq7lAETC1KKrc4+zOmQf6/hJub+MJTZXThokvGJMkr2
         U0IA==
X-Forwarded-Encrypted: i=1; AKwUvBzr/q2YL99QYDXW4Ls0yoa49P2cSrAjE+iuZG8NmMZcdWj04By0yK5lLozZBwBU6PPoCr/Y79hkHhXW9uU=@vger.kernel.org
X-Gm-Message-State: AFuF++nxMZCOlp8QrCKNnDjwoa/s7KSy+A/Gno7wb6jpWxeeEYLKUh8K
	E0oNHLkIp/f+qxIm4/ufkGEM1sIGPtc4qi7zOaP9EfrUL5Xolh3E6vMh
X-Gm-Gg: AYBFou10zk4mKdd2zggAOUl85xQqbQqmMnBzGecpkmZvmXx+3xPjzM77Y6T093aTeOj
	JsCgDU4JfJawUmqdCW0j+mIyfumnhr5kgBCwXHY+0N94W09EseW96z6zNTsi4nwoZejiOIXck89
	6WZM3mUVvN8OAhPDzqLUX30vAibZRzvE3FTiSUI1yvda1yWVMUmrUsMC+SEshGypVbx2wzL5XLT
	EYfwamfawywgOCXQ9xpWQt7Q3ANm4r73BZjTWwyhnuv+FyZ+ihaf3ANi9CF6lxay7BVyzftiHVA
	pHiR1WbfF+FtcACIDb/8yo0h/VcCOHUpjDsIxITqANxGR7ILLxMrJvgTI2qJL+R+PoGoQnKN4iE
	dZMmo31OBZM/WO1iqX9EFS6J/eWr8GirD8ID9t2KhYiJzc3NwGhXiV6Q3Ha6qutHUBu8SiMKOv3
	8JHpghvUAEUpNMG79dWapt5XO0kdHs3yhW9pYnRxFUxF27J+of9R62B6rCkcSw9JAhoZx4vHBLh
	+KvWh619C1h391UdrU8ysCejA==
X-Received: by 2002:a05:600c:4e93:b0:4a0:1e68:d28d with SMTP id 5b1f17b1804b1-4a02756715fmr150200555e9.6.1791130340000;
        Sun, 04 Oct 2026 09:12:20 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:19 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v10 2/6] arm64: dts: nuvoton: npcm845: Split APB address ranges
Date: Sun,  4 Oct 2026 19:11:47 +0300
Message-Id: <20261004161151.803563-3-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
References: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomer Maimon <tmaimon77@gmail.com>

Describe the F0000000 and FFF00000 APB windows as separate bus
nodes. This lets each bus use child unit addresses relative to its
own range.

Keep this structural APB update before the peripheral additions so
nodes can be added directly under the correct bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi     | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index ab8a01c..a92fbd3 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -51,13 +51,12 @@
 			reg = <0x0 0xf0800000 0x0 0x1000>;
 		};
 
-		apb {
+		apb@f0000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
 			interrupt-parent = <&gic>;
-			ranges = <0x0 0x0 0xf0000000 0x00300000>,
-				<0xfff00000 0x0 0xfff00000 0x00016000>;
+			ranges = <0x0 0x0 0xf0000000 0x00300000>;
 
 			peci: peci-controller@100000 {
 				compatible = "nuvoton,npcm845-peci";
@@ -164,6 +163,13 @@
 
 		};
 
+		apb@fff00000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges = <0xfff00000 0x0 0xfff00000 0x00016000>;
+		};
 	};
 
 	pinctrl: pinctrl@f0010000 {
-- 
2.34.1

