Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5937105A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476372; cv=none; b=pt7rSxNQPypZPsKkU/tzBhlPTnFp3RdJ3YnHuyu2DL4kAsirAkS6TZGw0/clMaGi+adpCE0gIbkcINQZ5WRGghoP2UJWoen9i73Hoa6VLHezHXkHVxn7zZHL6KyoQataEUpdG5XjTdNYAegafB3bet16lMvyjYnZgu6s1I+6nDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476372; c=relaxed/simple;
	bh=5jGm6R10DrzDxLGqPcbj5OkHK+dKNQyDALZppEHj0fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bn5Fw+xVk3+mxiEhG1rQYs/x1rWAmv/Lxpb21iLQac099jZvYzuJ9uDkQp+oS/F6NxGTfeDLpIvCtGPOasIGKny2hK3aJUoz7f+m0lcotIiwu3Zcz4KJGaCpavKU3Itw0xYmJmQ8lKszQculNP44ntwdUjsx7Cj4eP/7acsi0R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48589798dbbso91411f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476368; x=1789081168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhGerqxK/QM75//01MhplOsQVgwGpiUbFZaCJT3sfQs=;
        b=fpAuC8jQmKp+H+nO7cKPJtTl7rqOIz3/s71Ez9JfPdwybSdFFm8jLg+6UuojbDkaGB
         AOYIb6pn/Nd+XLZxhNLVOApDPFOp9RA99hrtGGK+USMD2AimJOL/GFd3grmtRukrTOf2
         8beOMNoLQzCjeLWhM1gnsKSV29J/DhFJPt6+jvRcUv14pFrHOvIVbU4JKqeKO/5rhqJO
         lnriwvQBIAOgcd02gphHCIKfRs3DvhoBdIGP7mWh/R6nk3RC09QuucwNtLRG2SYXe/7W
         GHS1hjIFDLSW8w1KK6NPBQzjIyylWH/VVsl/svk3t8Eq2b+06ky+Em8BQnSU0lZgN5oA
         TPiQ==
X-Forwarded-Encrypted: i=1; AKwUvBygJ/VtNbrZO30qYkXXnSHJlZ2W3kZwTzsPX8Vxgjb8TSRKvkGeCMDFSUfeLL73QcxzGV6B+ahlqJRumIA=@vger.kernel.org
X-Gm-Message-State: AFuF++lAdikxnXqPHTRHtZ+w7/Rh2Yy7741XhJVEEDnaY2pGHLG9qL+U
	JcyGJ0VfCEppwZvccvhJlSsWNfZbWxsvsNd85oQbgrYKHdvbEYT/rXtT
X-Gm-Gg: AYBFou0eTZu77sZIgPQiTNINaVxiUtoluDhzTp2GcJGKhxMP8sP3PyjknuXFAD8QLHJ
	4zeJ+LRiXclqrdIkD3406j9ZtxOY6X2dqxQ2F84/tZNsJXk4yT6X/3GsccLG7q4qmbyyv8zB47Z
	fW139DGCFz8KOuz91igW6SJG0eEMoWufPsZdmrPxVRiICIEg1hk679h3KnQhqZq7QDUBrZ7+ABy
	ceGCftWXlU0I3RsztEkKFdAIwc+PL8ZxIgCWjMWf0qrZGSkraKfnCyrZxdkhV3yj9tH0STCj33Z
	uEpgJQcLtKKg3KmW/8V6h2HAI93IeEayNFeZ/qCxPmMcP625ob5gIe95Up58Bo5DqV2pMS1BvPK
	D48ES6OP88YoONhTRS1506XRbyM1IyM7B4gRMeFY4wgwR77UsLfWoiQoknKUUiKlxjgG21OkVfr
	hg3H4fIsN0KrQErDzZ96p6mnIagJwb70EnToPueec/N9ypj1hqbc9f/3sTU99pMaGaYd8oDK928
	+zc1Wx66WwL7pwuLQ0xlDafKg==
X-Received: by 2002:a5d:5f51:0:b0:485:8a46:704b with SMTP id ffacd0b85a97d-4858a467215mr292343f8f.29.1788476367923;
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
Date: Thu,  3 Sep 2026 23:59:20 +0100
Message-ID: <20260903225921.2290441-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SD/eMMC controllers reach the DRAM through a pipeline stage that
the hardware design inserts in the bus path to the NIC_MATRIX fabric,
clocked by CLKID_SYS_AMPIPE_NAND. When that clock is disabled, a
controller that starts a DMA transfer can never complete it.

Reference the clock from the three MMC controller nodes so the driver
keeps it running, instead of relying on the clock being marked critical
in the clock controller.

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 719e111bc3dd..8f3f1c0579a0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -762,8 +762,9 @@ sd_emmc_a: mmc@88000 {
 				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
 					 <&clkc_periphs CLKID_SD_EMMC_A>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_A>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -776,8 +777,9 @@ sd_emmc_b: mmc@8a000 {
 				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
 					 <&clkc_periphs CLKID_SD_EMMC_B>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_B>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -790,8 +792,9 @@ sd_emmc_c: mmc@8c000 {
 				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
 					 <&clkc_periphs CLKID_SD_EMMC_C>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_C>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
 				assigned-clock-parents = <&xtal>;
-- 
2.55.0

