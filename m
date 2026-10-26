Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042296;
	b=ClOL103EcmghafpYqkqUVlcxZz/hMU4dbBvjViUH4YFKShbUy/4GgcrdxRpFHl+AO8Jh
	 R+Bs8jxKdr5RoH8yJcT8L3aMzONoBGSRtHuPXydwB4MaJBlYVtH3pZVDn+26ISDT9NBGE
	 8OEFlm1Ne0Yoo+n0+U4NSofxgcitKSXxlloT5V6qwI90exlr7NlnZmcUuhAuYApFl+q1U
	 PjfEWEr6aECfs27U2nVC+Ddjmn0nQ2g0t36M7enzHwJwijsNS+wmMfHTiZPG8boLYnISm
	 g2hD+VU3RfvN6j8T6saF8jH1P1MSy6iZjkKUWLNkjQkc5Dy7BDWEE8hB9kjfjY5rpPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042296;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
	b=ezu+RJY0POoZ66pH95YMR+6E6+YMeh3338Qp4lOw8hjS81Bzwc6PdEB8BpOdIG70q+R6
	 TMMcHdrIoyyqYPGNAw00sXr/QysYletyEcdMkJoV6RVzK/Q0j4NK79AcvhL5GE4t7vfRB
	 BZ46FkNCNIaAJBQE5CbG/I253TAyURDyGoLxw/zpqDV5uLueetXBHB9kKbEZBEnSKXYiV
	 nLjDk9Y8OllAkAR6IUq2EdeZ+v3zGNInUGT8rq/4SgiTw59Q+9ybIOcewsMj7t0n2osxL
	 xSqttjnIS9g50rdozZuT1SZSV0gnH33HvjAqsLHG4DbYMat3997aTj00Vv6tobtx6Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZaQw6+6z;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6601E606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6601E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZaQw6+6z
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93f20b304c0so317961285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042295; x=1793647095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=iAhGfuPlovXysvZykGVySQk0Xw5L9pnY0YiwEUyWfLquruqQL0Vkjwecdb3ViR99wQ
         DfldvzPVR6E6s40YlFmA+Y9MR+e2CXSp4qaFOLx0t6fIpg3H3GknSTEdL9JvVWFu9C3/
         XcH/mATI8dz4nKQWuUgOTVQw0kh5Il1sJPvuCshGxXvWGFuKJ7JS9xp3tJEkSR7jQWMJ
         j+t+ZwZ1k0Laq27v7N53ePb8y/ERskHSXjGpHQ8tIj6Ob5M7DkjknzQG0YSr3uGem12q
         lGgYsoQZLmxFNITmMnC5k6DpC8dksbT+APpyMZ2gBNKW93gcZj7n99Y4kkxfFeeVREXo
         69TQ==
X-Gm-Message-State: AFq9FYKBSJtg+8TVbRe+sgYXrsMJBXXf89mmxVgv/hkYseecWPUBP0Zy
	6tWvW8GATZx8pja1fBFjxXLm+Yl8S4BaFw+3TV48Czl4Lkw6nv3iuX7NVmRbjgG/g55AlB0ntMy
	BBZqy4J/93CsHhHnosr/hnTBo6F+24uUM90e4DR4l9fCE27zdyZAbPQoaZTMMjckiI1Q/n3iyaZ
	OL5ANvXmifMiUmoHud5X4vNLlc+KsaZNgVKHPZ1QzPBpfqnaYfTTPSLa4cWddFi94h7aUqefDXu
	7G2ERbShnZKPyd52BQbBrHFqfA=
X-Gm-Gg: AYBFou3WiMdDpxmaSOKzYs5zVKX5znQSkql3S4lC7fUC2gEU32Dwc16gQeY9nkAkn1T
	pWWpECI9lv6D+InQc0vs/a11KPgGiRUKcjPLbVUm8SSAJcZjBcDG7PQ2NXkQVr9BMukPpLU4T1L
	Vb/6pN+G51zcuAlTwauM9Zz7935lNWkSpwsNTJI8lSVGn2/5/AIzZBkpS2SMWyfPhyg7jazcWka
	KxW33GH5OOpk1Oov4Rxh6r1xolFuyvVCeqGax1jEnVDjOYY7+i00HTW3fbCQwVL7PJRd0DbbRFe
	61AIScXTPJyieX0e0aiL6vBBw2k3rz/04CGdxJI/sJGokf1WpbWLhRao2v2WQjkbKENtJybFWfJ
	vpjCEU1wyPYWhBxeXSyx5N+LE54jOFZxgF346HF4ebALOU5U9PMzYiCBx0XyahTGWIuxkRQx3In
	1ZqpeEoqxtdg+SdMmfUGXbexLvGR9FDlys6I2XTIUA
X-Received: by 2002:a05:620a:25c7:b0:93f:6f06:d7eb with SMTP id af79cd13be357-940ef7d307cmr1125646385a.1.1793042295303;
        Mon, 26 Oct 2026 12:18:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f05b2712sm110619685a.1.2026.10.26.12.18.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179a556c43so77618266d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042293; x=1793647093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=ZaQw6+6zFxoBEbQe/sz92TQ46W9SM3oo9ELw08440qjow1aYBXUv1cb2a/dcY/Y1MM
         QgWcuh3h4Nz93wJV7hYyzRuzrRGhby+o2jok4D+0UePsTnegdEdZ/zqtpSCZEE7WpQYk
         frATGascxUN4IK5iHAPC7pjDVhdNWPhhd8Ggc=
X-Received: by 2002:a05:6214:3c8e:b0:915:e5c8:5663 with SMTP id 6a1803df08f44-91c48cd11edmr127063676d6.4.1793042292791;
        Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
X-Received: by 2002:a05:6214:3c8e:b0:915:e5c8:5663 with SMTP id 6a1803df08f44-91c48cd11edmr127062806d6.4.1793042292066;
        Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:11 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v3 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Mon, 26 Oct 2026 12:16:16 -0700
Message-ID: <20261026191618.3178830-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The NSP SATA description omits the IDM block at 0x1811e000, leaving the
interface clock and core reset dependent on firmware initialization.

Supply the IDM as the third controller register region so ahci_brcm can
perform the downstream clock/reset sequence. Extend the AXI bus range to
cover the complete IDM aperture.

Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..9dbcd810e27b 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -168,7 +168,7 @@ periph_clk: periph_clk {
 
 	axi: axi@18000000 {
 		compatible = "simple-bus";
-		ranges = <0x00000000 0x18000000 0x0011c40c>;
+		ranges = <0x00000000 0x18000000 0x0011f000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -538,8 +538,9 @@ sata_phy1: sata-phy@1 {
 
 		sata: sata@41000 {
 			compatible = "brcm,bcm-nsp-ahci";
-			reg-names = "ahci", "top-ctrl";
-			reg = <0x41000 0x1000>, <0x40020 0x1c>;
+			reg-names = "ahci", "top-ctrl", "idm";
+			reg = <0x41000 0x1000>, <0x40020 0x1c>,
+			      <0x11e000 0x1000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0

