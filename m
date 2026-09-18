Received: from mail-wr2-f26.google.com (mail-wr2-f26.google.com [74.125.225.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2593FC5CD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723160; cv=none; b=aZivLu1RWxvapQ+u5kvZLcsEGWBKcYc/mXTiagHIHZd/l8M5B7aWw550e0hBSZlSbuyW25A/XVRZMrD5qc0YXqdPJT++ch8iFeXA+NGG7XlJfD2fD32YVbjcGiae7JxmdooCd/dxht05PXwGkzLwgJcWqyZmskyo0DeWet8VntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723160; c=relaxed/simple;
	bh=5mALnbyOqdBZH9llVp3wtVFp2kPe5tzU1gIjquZokes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nj1vmNeiBabn+LxLUpmPvwou7CqYf9heqKvGhccwjdc+0QE5eTpxPv4LYFJDDK/cjPiEWY5VAgWz9QaBI8+jdb4qW7PxoH4bu0LTb27XDKYgeHjLSDVZfJShpIVls6PzYow/qnBlcH08ssDxwhNpHM15GlLmpXRsx30rBWwaR1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=igoKHmCg; arc=none smtp.client-ip=74.125.225.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="igoKHmCg"
Received: by mail-wr2-f26.google.com with SMTP id ffacd0b85a97d-4843f22dc83so330301f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723148; x=1790327948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yMJYTYJgQ/oqLDe8tgjpeMjyJjtzDo3z5nAQca+jEA=;
        b=igoKHmCgUM4e9QnrNsGiS4L+jA7xCWrBVMiKmfzj9P2Xq2jDudRMQA/+yc/8hmvmwH
         bfyF/XNsXu/GDmsJ17SXBQrDMK3nHH+VvKV90FfW9sTanLOqJjr/zUT3Swsq7/6h87G/
         cRrfLljpJTdQPza0a64Wm9UNLKQRr6o+Gdit0rArCHhLS4Onlc4Op6Scohf0qMIzRujz
         5Amb1yNLNCUuxJ3gHj4G4uY9zrnfO8MWoXd0e/lNiaXdu5hJIA4h15i2/iRbUhqEjf9X
         YVhLSQg7iprMrou31GzUsncyhf7vcdA7hLplqhpafQ/ORVilyAxER02Q6wJ60uZy542k
         2dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723148; x=1790327948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yMJYTYJgQ/oqLDe8tgjpeMjyJjtzDo3z5nAQca+jEA=;
        b=dHnRtTIoBEfweSY3ygiSLZ1dd8I7NZcRtCCmYD4OuhQ6CDgzL0SsrA3+ELm6oJpdX+
         vOSHvHIseVMiYRetVpJyDUcajwGahYTAj0TJz6udFIaHgmHg8Fkf0Psmxpbz0jooig/w
         10m9GMYPBZcYYckh1jNul7IBsCDYUAyZld0Dy+Qf6aPO6XJyoslNWJu9SzHNDB8rvTyl
         UC+REdqygMiaXb5N2ceDpdp21lH97MUcaFouRozOOziVv0T1DB06eIBJ8GE4n60G8/A1
         /UWQx9t1WS21+o7JaD5eblPZKN+UzYB+xkaGA/00nzTw6wY8LvHt6VbIOR9gNXn5dlp0
         Iyxw==
X-Forwarded-Encrypted: i=1; AKwUvByPdgOsy/lBjjbN3Q+D3I2hxrOLAS5S+WdmPxMUQuip1QohtnCX3rxs3hM8BHmxWq3YDXQPVJV9LX860C4=@vger.kernel.org
X-Gm-Message-State: AFuF++nZ93AwJQVPEH0geVl1hDQKuZqBI6CNjurKO5ccCNuLwRot2Hjy
	aK3lT0mSuWE/EKHStwSSIVJzOyY1TiK77rXP5Zv9UbKGKPkIqb4rjb/vZPw1Q8wTPiQ=
X-Gm-Gg: AYBFou2UPEJL3JQVXzKhXIpqYwC/suX64IxSBTWzgfaem9pMSbl33hC666Q7z2/Y3pm
	qOmeWTB3xqsUI5IXHx3K5kziHWA2bZR1678SNCyYMu0Wl7pMXqGzRbnehlP/VUJBQ1cyVscH8ck
	FcACD9niReuOYJX47jp2C8JZ8dMMTJJthT90d5v2D14fkOVjB716eMvR53Cw5WY/19nK4C3ulTP
	7DG9qLRYogSUU37dFptPIwsn1Gzp557/lbdv5ac9iw31iYLpKqwTpXJdq6xxvnTSjSzsb0kxD1T
	YxGoy3SxDeMK2ta5Esx7uhJIkFKSvg1GvJd8jHVxzLdFYFL13hNdE+xI8Sq0lpF/O0r9/ZBouAm
	iX8/RcvpbKzX5y0GgUSlJXT4feBkcgnplL109Bes8PZMVPsc8PQQFUzzxFJ+rJirvkktTfotWqN
	sl7hNDxRcpazLdWqqA7YCoRQcMSSi6jggEgm0UqS963AlK8swNSYIT56Hh9VMOafLpi/Y=
X-Received: by 2002:a5d:5f42:0:b0:487:360:f17e with SMTP id ffacd0b85a97d-4871e2552a7mr2255975f8f.17.1789723148442;
        Fri, 18 Sep 2026 02:19:08 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200737d6sm2804109f8f.24.2026.09.18.02.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:07 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:51 +0200
Subject: [PATCH v9 7/9] arm64: dts: ti: k3-am62a: Split r5f memory region
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-7-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5545; i=msp@baylibre.com;
 h=from:subject:message-id; bh=5mALnbyOqdBZH9llVp3wtVFp2kPe5tzU1gIjquZokes=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jA+4CvbPi9PXdTr/vslkeoaD96yzh7h3GF1ctlK0z
 Xqfnf3tjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIP0GG/15bzP/ar7keeHDt
 5MiqOYwH5Cv4K2a/CZoX/H+jgO6ZJZMZ/js8WC72NkNfuzSueKPwGZ6dUSrrBN0NNVPn8k475+P
 xix0A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 28 ++++++++++++++++++++--
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 10 ++++++--
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 28 ++++++++++++++++++++--
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 53c096da68b5..7fa19ced1a23 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -65,9 +65,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
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
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b167..94c1d60d8d7a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -65,8 +65,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
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
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 6e5419de8e35..871ec227def9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
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
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index a8c794d07343..7cba3ff99e6a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -65,13 +65,37 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
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
 			no-map;
 			bootph-pre-ram;
 		};
 
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
+			no-map;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;

-- 
2.55.0

