Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB95C423A80
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439249; cv=none; b=fOjvUncpo56f4M+fWUg2ExqWo8SkSIxGP4G+BOOgI2g+7zaV7uNrH7SllNQdw1YUjzActbCdlX9NaF2cles6Z5Fm9WIuU6qHlGVTrZZnmM3DTmidVd2dbr2E3JYFBdr4KHhXlZMqzDXmnIEnJ6WH0muXj4hETrdg3Md1U9p7+6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439249; c=relaxed/simple;
	bh=UUUoF3s09RiDXoX7/gGcmRjq03IW0OJaVw01lmbJgnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPrkXhMCvRwou7yoF1Q6Xf/n/i0Xq5Nsjbw9HeJLHMxQOz+YJdMFF5RkHdnFGPVJ2DmwqxUg1P5lF9DzPqmM2eb2adnVcYlS979RAsr1WmOU75Rmtjrf9+I/xhrBg/N0GyuO8Cdgerd7VoHQbkI6rafXbTi7sfnQhVUARrvmWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XJDYUzAv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XJDYUzAv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4858303de5dso505897f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439246; x=1789044046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbzsY/FQUhuAGeeioamOWte0zZ4sj9lGHGXUa9x4qgM=;
        b=XJDYUzAvNjUpDs2r+6bJWp6S1gzKZZ8ICW9gx94Ctq2jNdqA/Zc+lT5QW92InR8I2S
         LSMARMe0LkADcnoh7hxAbJPlKdvSvRnR0mYSwT2GyCbx2C4cms58mrLtGx1/Eoi5troK
         za/ykgZ0sAKHKL1hTJv1LqkFMFXHtFHprNqv2UCAuAxE2MvcdfMCbl1DMf5Zi5XhiCr7
         gp+siL+3531mgQQUi4CpkYTBihFLAsQJmV0IdPAolwKq9TzvKz2Hw/E3V2gqFZcDvbiO
         HF35gqE/uU1q0xtAAggNLoO8J05ViY//jZnybVqD7geY6Xa2BS0S99ztSR+C/VFtfiAY
         Hwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439246; x=1789044046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbzsY/FQUhuAGeeioamOWte0zZ4sj9lGHGXUa9x4qgM=;
        b=id9DjfMayV8FcFxO2OA4tOORvbH1H1zThLuF5gkR38VjMJWALo1VDJRrvWjHhcsX/H
         AnqR3FtAOlWZslUV3obOYZzzyBTVP/xm3pc2pqV0DxjArNIXN7JxsSEQQw+XDDYXTnuF
         ZsmVFxhnHW/AUWVLUV60H26Qor183o8rwII8OxSgwM+UtOMAJaDRQ/YBRfOegAi8mlhx
         g9kuAx+brZGfiGrlM0AYHzOcHPFvqrQo4qa5YD2F6nWFjqI2qW4AF8ocfAf88FfK0AAY
         j9Nf19OULulfG7gEEZ+rT2yI0C/DVeXQm+taho85cBKaIFRCNEmtZ/C9f4iRfE6bZWuT
         rxvw==
X-Forwarded-Encrypted: i=1; AKwUvByJcWpanckhUbJmILy8qHsDgX0ehxcLoyqI19xFFT2B/iLj7fZ162QIzrg/eDjdUbACIuAcMor7VlfgZBU=@vger.kernel.org
X-Gm-Message-State: AFuF++lV9t23TxKwQ7k+CDdzrOLc/JlYbWsfVLlN6plGJ/KcQVxDbf8c
	vXoRvcYe+ryWTVV6EcehW1F3+Joe+ln+gcVTbLa6wovcHS8CM6oek3OLeOYCLYkd0NM=
X-Gm-Gg: AYBFou0Ju3BtAfqqRWe6uVI3jttWSkre6zGAEzbQ8KLkhgZKlKe7gzYx2sbx1ED82vz
	G7sEFxrcOdNTNdnPaf0I7+dYwZs9VJwEV+B2LMVrymjDZ4+rOkK+Kv7B6c0n0p7HZDsXCNGAFyx
	PLygj2CO3gzGb4AmV3vzOPqmp5mXZIRX4EGJ5q6z8LlTZTVKwOQJEeNQU+AUC1083suKuEUwjIf
	vUoK3bxPTqVJ7e0FxOntLY2yoQO0dcYXUZ0n87tw2WfwHP4ld3K0CvYTG3OhwliYRjNIDB7Ewzo
	zENH1eJDmORRCnAUBIbxXNl3lU4T3/i4yXFptfqR1vrH+3cH0BChOLGPKRdsBV68IpExT4ojrOa
	KUA7gtswdhMiPWO7O4zFLvJEUaObg6BlMe+W8nIEa9iBH/LNSi1/aykZdX0lvBPQc5pIbyweMnw
	gsCTs2yT4AMJqRXZkRxYEbQ08BegyQAfwpvFJxBXh4qOlze2doBVoizFzAFg==
X-Received: by 2002:a05:6000:4913:b0:483:ca4a:504b with SMTP id ffacd0b85a97d-48488dfa19fmr24924311f8f.7.1788439246099;
        Thu, 03 Sep 2026 05:40:46 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce236sm15801863f8f.35.2026.09.03.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:45 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:29 +0200
Subject: [PATCH v8 8/9] arm64: dts: ti: k3-am62p: Split r5f memory region
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-8-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5362; i=msp@baylibre.com;
 h=from:subject:message-id; bh=UUUoF3s09RiDXoX7/gGcmRjq03IW0OJaVw01lmbJgnU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWTtcb6sWKt+6nOdyegdripPis9Mz+2UUvp6Ya2D1L
 bDy0C72jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjINXmGf9aRNX/nbWq2MHzV
 bltuy8X73jXshHDLXF4VtZPLlgT9yWNkmLhVJmwGyx7zXYq7O1fsPl58PWPWh3DLX0e0Z/beaJn
 rxwsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 10 ++++++--
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 28 ++++++++++++++++++++--
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2..84dfbfd1986c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -44,8 +44,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 8a5ff5c45757..45ab9d947b3a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -168,9 +168,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b8af9ec81b0c..bb027c65eddd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -55,9 +55,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1d08000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 3d1a2c5bc464..31f670fdd91d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -69,9 +69,33 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: r5f-memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: r5f-memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 

-- 
2.55.0

