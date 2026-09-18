Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5088C39B4A5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723161; cv=none; b=nk23dNMW6rbEPw+P5JU80vPmN3If7QvaP4ZN8Kq3mdy1oZZpRgMhlnux77syIxZAVANbv/yAKh2OlUrQkBsq2QqzM6NNU1Qa4JbKhBgeL8tiWaa36xQH1iedYQx3aaROlauiTp56qpnVy2h92POjCRHf5ROoVeQDSosHojXBg6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723161; c=relaxed/simple;
	bh=ZJzy9E8PlgkB1b0i/bkQxUTFa8ZhyIY8E8Ayom+Mjrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBrtWr+6IK8sBG0ZnfkK017Bz2VOr3pnIf7VuFGkH6V/wT5LfBnGSvQ8l0gbUR5ww1bcG37Nggjq8q5+ZZCQNkjgBs9zlN/QRFrD8fMXfsniBpMvxumEYTT6MH2k7InnB+Bff+I6+UXCM1MTy5vvdFEg0pZrSUaWLqqcDDdTFmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PO++KLRP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PO++KLRP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so4369395e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723150; x=1790327950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6CPqEr4SU9cbA7obY1MdT4FutuIOLbY8+DXgp/Ikck=;
        b=PO++KLRPVEJjhkpAeR6kAz7BEFaqYQeVfU2HCJGKR/FIGrTJmdh42S5NLORB2tEcCL
         CH+MhYJXHzu94oEHfHKy6XXGKWHnTLDMf8jVOMfF2XNvBsPVD8zG9SleFFLmJjiu6A9a
         3YEQ8lv1fZaGIntbJ/sDHdu1MeSFFp5+Or5B6LXtcu6lntYr4U6ZrEZ57Or0dlkbrwwF
         +rSFKKuDI78UyUyYXeMgZnSgkQhbcDrDu+Vi94TIp49WCHvbBIenZ3C1qdpHBim+zvth
         t4MM8Yg1K4jcgeHrZBaOhKr5wj4EFFRBekEcZb96QSG+ThyMlKu6X7EhYEfOVvREWWNx
         rnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723150; x=1790327950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6CPqEr4SU9cbA7obY1MdT4FutuIOLbY8+DXgp/Ikck=;
        b=cV2/bgETA7mHYO32VTPzmAvH2YsstIyGsMZ0qoQtApXR6coCfiXyhfaYf/srVISGlt
         woR1xzXcXqOTaaO5Y0UcNh/KwOoRsaJF1aTEHnrPqcmR7ski7zfQvDqOJ2yMWESfgmPl
         q2XfE87q9UBI/MfMPlzGnp2979Mlyps4tqap0TO9FgtRKvEqtUxnzdUilq8t4A1oYXTB
         sQj2WJXiyHM4yMLvzzClPCINWWmqYc3W5sH5oa50bMS7gdtpm/guhuQx/lTz/m0Otuiw
         p/TVWA/muPeZeRXxLHiBcYOLJxnwoFDRtCNGMOjkyp66iwrpyOMVh2EpcySOryWiQu8U
         gL8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9avs3ig3+Dh06l0o4iWlwxEXer8yHjwM/R2HDbL92ZCOIb+ovKl3RvlG8fo2zK9+E53RykKFZic5NIrU=@vger.kernel.org
X-Gm-Message-State: AFuF++l1DzNdPN2rmq06k4qDc2K+qQv2e+JCXtXJInfLQv/dCupQQQsu
	jJOtWgozqKqu7Ay8bCJdDSbNeAVs+5bFxh1F++JIi6owoHvOnU7TpqPssUnEMA9xQ50=
X-Gm-Gg: AYBFou0ka8n0dWQz2JYfSL3T8FUg/AhXBl8WZTw6+Df7bpg5qRG2xe28clx+u9mTjwp
	TdSiWNx6YkfQret1ARCw8z00Do24ZoHED0gTMpR5qAGLB/D37otgfjjkTdo7Rff2q5iZguG3MoD
	/cFSiZ1zyptkB5XatPXLraWTsOEccOtAQd4MH47z33JDxnf4B07bC0uchM0BkWtp6jizxlAmZUa
	KqHGD+W+anedE/xX7etEp9YzFc7u5g50DCMyu605TuPWPNWVkwG4A4UUjI1ux7yylEZja71nKha
	Nx954WZ8oO/u8PXBP+7uU2RbPD1gV54NpAn35o56TYZs3Nj+w6UP+ZvTx5qD9SdQdsRi5uoU+up
	5TuLloDUyzCjzETc4dt9PBCI6AOSIDlQAMRwaFamZRLZlHW/eBMdcNSg1xlNGLRT27E8iXOjWux
	v+f+TcXKtbKTzigIFscg40euHlgUax9nxbkehqJoDaU4QyKKHHDJymNn5APHtTLgx+W7ua3Ry44
	KHMuw==
X-Received: by 2002:a05:600c:6206:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49fc5735339mr21824685e9.21.1789723149820;
        Fri, 18 Sep 2026 02:19:09 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm103172735e9.4.2026.09.18.02.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:09 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:52 +0200
Subject: [PATCH v9 8/9] arm64: dts: ti: k3-am62p: Split r5f memory region
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-8-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5450; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ZJzy9E8PlgkB1b0i/bkQxUTFa8ZhyIY8E8Ayom+Mjrg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jE9f9/s8XZ+rv7HG//mU7EOanrMe9qlkdxyq/dKct
 Ct1rej5jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjI4lBGhr6fZns44/erdF6R
 bl6uoZ0eOMEquzL8z4kKhx97/knsSWZk2Pfz9q45ZgwJXJ2GNVfv70/bKb6/ojOCWTPs9vlpR9x
 12AA=
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

