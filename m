Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EE54BAA0B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963972; cv=none; b=dnXRzRO5Kz4A5RzkiMElhO/Rl0iTfLAEmQQkKlbqiRlhSnuVBc7nQhXLoN5BFFOINFWLgUzjolqdNGvr7YbDP6hB9olAbxblX2IJrdB5yvnENh8TzN2YcJA2rbEoBKExN1z+0QMW/xOCy+SzQVBP+Fqkc8wuAJTv46Wnxwk0MUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963972; c=relaxed/simple;
	bh=CfdhSE3liIR+0R6sqyadTRehF8WcFvwZ62bfQk1lc2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhDk+glSBLlKj5NwRzhTKSLvTOMQFtrSY2voOM8FpXZV0jON/zP8gNoYj4YeCKsFDzO0q6UuVlLuvDo+m6V/UU3WGWQMBiynFu3vEJDMrwz3WeBVuTGdM0NaEzM3cBcBkTPMrJKC8fKU3eCySBftrkTq3T6imDW8WvBsn9ghmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/O2uhsB; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/O2uhsB"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so2808359a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963967; x=1792568767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MGyxds2cOQE9gU+h+bijFEd7tAx/jconp/HVBGACCc=;
        b=h/O2uhsB8YOMLTsH5NfWgQyJ200WHtiHWGeJ+wYHfoYR7APMYTPTSr6BOU0mu64BKy
         xWeB6gaUe45Sm6niJ1J9q4Du+7x+ST7I5zMxELYUyh09lzd7txdxkJYu39RfvXj/X1FW
         pqIih4Z3vn5KOp7XROfON0816+LAAX4UgRkMpnkcAdigNpIb/f9Wrp8sp05eR9dLqQo+
         IxejC3sKS1b0Dn/o6spJoVPwxwKqs6crnv9CT9rMFgWjVchngpen7wyqWtDEqvXqDn7P
         n/vj93j7Pr7DFMnmPN1XzSe15GpkchglF8fugWVP9BS2HPhV32MKtBgtQrZ7Ecv58k/a
         UCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963967; x=1792568767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MGyxds2cOQE9gU+h+bijFEd7tAx/jconp/HVBGACCc=;
        b=AeLnoL0aRIrUV38URtNeBgdGsI9s4q+okcjexClUqVT7o2zMrU050d9G3Lu21p2MGu
         vF8eTZQpFOgaRkYUF4T+UHd2Fk4HublNcuhkgTtSaK+MiG3JVMKspp0Sxgx9b1S4zKLD
         dXZH5iPRO6H+aPR1IToidNEZi6pWozOHpQuQWsnrR/GD8fikDGT8fSjdrVCFPycFY/7M
         m8cn4i+f0z6sqmE84GxhBDSVq2UczezQ9/YyT8JCt3lsR7za+I5wzdapCjjaUd9ZF8eu
         84vR1j2qvTgVVgx2Ljo7f3SvXmgFF6bhvKUZhKPO0keT99tYDX1oyzZhF4AmAdSr0dpY
         65oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOjWclrzcAQ4TRFqtNDTpppq7yAwQQe4QvkPl/5pXR+n681JBKNaxAu64WssB8ECQttJEuadPU+ts9qQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz+sYbQqfUtIe93ICEKs2uA+Fqg8Fl19xXoaoUmSayjypBi5ZC
	hLSoPFCfvkfO7mfELWhR3xaSfBJMOOGeBfPeDs4yIeo5fd+qL2946s9j
X-Gm-Gg: AYBFou26Uy7aTl564f8i/e9VeQn6AoqBEPvAD9VbzkJcqJNtsC2tbEQXK1Z/tR51aEl
	/sWsGLM1qR6S/NMYFTtmfqHq+XsaVOyU3HRRV/nTxaht1VwoWnyzuos4Q+G+va0YEdXhwOWzmPE
	v8b5z3pHZuIasw6oOMHJmfoR4bQF3X4Z43QEgLNI65uHMUayYctB+EbDGH53g+uLH2YoMAFPfaw
	bogZXRfjP28EtAJ8D6vOgNUjWUhPsUlPby+B57xJ2+q3+O2l0wXW1HCHXMl7AVIBS60UT58RtTL
	VS5TPC2YVxm1PwORgDBXLss5jmxpy/znmgqw1Wt3q6U/r5HciraK78qpQvb1k18X3RwyNlS92ME
	awi7jhv2mWZGFypbVBd/CyVdhvWjXE7ht16Xgra+V9MwzesoXthUzeTx4eWwXDDHVpWKEWvTHjd
	ImlKFMyuWrUrVze4owHyvpsy1OEHJhEwOLzLlZfieHkzrFf2gabOyKB7RQD+thT3CwHs3A
X-Received: by 2002:a17:90b:4008:b0:3ab:3767:65d1 with SMTP id 98e67ed59e1d1-3ab3767b8ffmr7741852a91.22.1791963967512;
        Wed, 14 Oct 2026 00:46:07 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f1fb257sm3293530a91.0.2026.10.14.00.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:46:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Date: Wed, 14 Oct 2026 15:45:15 +0800
Message-ID: <20261014074516.240247-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014074516.240247-1-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add eFUSE controller node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
 drivers/nvmem/sophgo-efuse.c                         |  1 +
 3 files changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index fed3d9a384a0..1b506972d465 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,10 @@ &emmc {
 	status = "okay";
 };
 
+&efuse0 {
+	status = "okay";
+};
+
 &gmac0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 320c4d1d08e6..9577aae08f7f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -408,6 +408,18 @@ sd: mmc@703000b000 {
 			status = "disabled";
 		};
 
+		efuse0: efuse@7040000000 {
+			compatible = "sophgo,sg2044-efuse";
+			reg = <0x70 0x40000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&clk CLK_GATE_EFUSE>,
+				 <&clk CLK_GATE_APB_EFUSE>;
+			clock-names = "core", "apb";
+			resets = <&rst RST_EFUSE0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7040005000 {
 			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
 			reg = <0x70 0x40005000 0x0 0x1000>;
diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
index 5f90adaf8e4f..568d17b88ff6 100644
--- a/drivers/nvmem/sophgo-efuse.c
+++ b/drivers/nvmem/sophgo-efuse.c
@@ -14,6 +14,7 @@
 #include <linux/mutex.h>
 #include <linux/nvmem-provider.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #define SG2044_EFUSE_CONTENT_SIZE		0x400
 
-- 
2.56.0

