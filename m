Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CB3A5E7A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760649; cv=none; b=MLRif3EsX4f6iFq6Ex6rk/u+zCILXWLjHdUnJ+PS0Jh8EsDCO3tkOIZUE81IVzNmZcDTVQejrcyiuy17JtEkA7MSTFd/3ocMpAAh01YlTd6KiovBEdfP3Ae/fUf/FwmRf7VFe+DobXXka0P0rEQDj4FSqE/lEgiC6CIYEHxKDrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760649; c=relaxed/simple;
	bh=QtaCvtB82nVMHgqJpRLty7FgR+XTbYY1+IELklBAaFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufFvLt6x/TAoOIes/rwByYwg+qRcsUgKUfSR8mAnDZyLel5CHsVdYU3XWzER8y+U/+ZLFpjJWxPqQD23a5F5UINV9WnsYZNQD5qw3Kd5qRAQidGkdGKeEaHGxXwZmedaaTRaWOK4aAhwgHLZkYerhrWhaZ43eYy4aQRAh1wNi8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN60qiSL; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN60qiSL"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso9096632a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760643; x=1791365443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xy3iOEWnL0tHwimE1DNns8Vy695o1slJtCha6gEPJ2w=;
        b=ZN60qiSLq7qyqFaG7CoW2kCEMDZNLbg1JoJsegoPZtKthtyPfu0Ntj7Iy1aQEIOj2S
         9dYe9D+DLaAw8KDxnfYB14CPIlJBgBYOLJE3X/0oC30uacDnob3o4B2vijWdxwgGjcYA
         EfCSbRhneduOU8FW4H3KaAhgW+Scz7xR2TI6GpnBnac/zlsuJrahLcOfaI8GLwmMuD2w
         iMHP8/QJB5v9Nz5gtyh3JTSAWPKUFvwDGWA6GLo2QOo7/4xFefkmDSbeNAdC+oNQ2i9h
         PifjParERI8Fc71539rYtz/Iry6yGgIWgcTPhp3nE7AHNCOsTFG74WVTaU2F+VPmm4Cr
         F90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760643; x=1791365443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xy3iOEWnL0tHwimE1DNns8Vy695o1slJtCha6gEPJ2w=;
        b=fo5XImXPCeqPbDbHThIpbLFCMjPe5IqxQExgSnnyjemgoq9daL+K+YAwWoztzIYqjh
         H7a0VenA0tf6PTcSubd4Z5KEiRHgBBbDN9td09Dv30whXFfocSms9hBMdzpWWuD6bPYk
         v4I0rKkvmx5exoXJWHyoCsXo7HTyNeUTvvVaeK2c0ialzR3gmFL3Lvb+BzlbbYsSU9WU
         zvn1Ft4lgSNjTgwIBE6A+A08QOuCNw9/1SvkKP6gmMOahbXXfHwgepPPs7cREpqeMr5V
         g3rWbWe80MhuV+m6MoA1tLRt26gwbA3dkJ/fACCcSO6M8im5q1pkb8ixW4GHHFA1DMZz
         rTww==
X-Forwarded-Encrypted: i=1; AKwUvBz/2x9I8ugGCPDP1R93GpZf5neh10QejujBWnrBe9SWXxH2voo0rGuH2bbrX/aZ1PLAuWVG5bw191v72KE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYLk08WDxpis+nw3Yoq0zh8sIJNpYBTAipdE9K3uSKuBH8Nyqi
	MTcyNm0eArIiJnzMmO0aebHU87+FPxJ8lDs+YoDwAXXzzbv1Vj33x1B1
X-Gm-Gg: AYBFou1L5D4RKvNviag6JOGrMja2ny5QWvrO8652x5O0S7xof5QQirodtLGkeIqUPuL
	TuFAMwfcbOgyHdSJTUccoYDac4jhlu8ptWbTDSIAgv5d1avtjGsFfh1n+Hg4663eXbKozPpaq58
	f9Ok/U+QJfEqMGPp5iw5RQd2eMojMgkXXeWdK2t9zf5cDAKkEfyqPDC/0FnTDuszHfz27BjNNSf
	76XVHs/uImM2e49IOpnljaxJlLnOG4cR6OsLCkE9c2/LYqvhR4UVAvlGK2XzLoDgVolhZiWpK+G
	yGWGK6WMOz5y/tvPX0rNnBTLhtSDpQKzdyifQ79toFuOZV/cmrRZFH5MlZSe9y3+8sKhCETiDH6
	Tm8AWEOPF5o2mbfAVw1RPbGLdgOxY5gsuWtZmJT9q/MYufMietQN9MgjJiDVdZELC9imdVYBA1q
	QKW/bH1G+Lj8GrfgGsggZ1F5yUmutyQbhn6LriQlejy8UhbObRNO7ARI0nYSF6PA1boysRSCSik
	fgKkbSU9uQ=
X-Received: by 2002:a05:6402:24c6:b0:6aa:f1d2:ddaf with SMTP id 4fb4d7f45d1cf-6ae1992a5f5mr389769a12.10.1790760643233;
        Wed, 30 Sep 2026 02:30:43 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:42 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Wed, 30 Sep 2026 14:29:07 +0500
Subject: [PATCH 4/4] arm64: dts: rockchip: add FIT-PCIE-SATA overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ok3568-c-v1-4-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
In-Reply-To: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=2276;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=QtaCvtB82nVMHgqJpRLty7FgR+XTbYY1+IELklBAaFQ=;
 b=14smWAzHi2xRrXpAi13KJaNbjx0ttZoWTFTNLI/D7Q5zDrRvqa5emJFRD2xr8nDIQxXywPHPT
 +IVUk/ck9r+CLpAB3/8taFFhgxzFtu2slMMBjccsD5WGzHH/SqcCadx
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C board
and allows to connect SATA drives to the device.

Add overlay to use combphy2 in SATA mode.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile                    |  5 +++++
 .../boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 48c83f79f83b..45e94a44107e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
@@ -275,6 +276,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou-haikou-video-demo.dtb
 rk3368-lion-haikou-haikou-video-demo-dtbs := rk3368-lion-haikou.dtb \
 	rk3368-lion-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtb
+rk3568-ok3568-c-fit-pcie-sata-dtbs := rk3568-ok3568-c.dtb \
+	rk3568-ok3568-c-fit-pcie-sata.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
new file mode 100644
index 000000000000..474488ea994b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C
+ * board and allows to connect SATA drives to the device.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie2x1 {
+	status = "disabled";
+};
+
+&sata2 {
+	status = "okay";
+};

-- 
2.55.0

