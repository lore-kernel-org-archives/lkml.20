Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC1A4A4851
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439241; cv=none; b=mHAIkvX00gUEWLQ+nHtGt7Xfyee2is7Ml+sJ7KOhDnHBS+WLbVikT1woRpd1lZZ3I8giSFjyC4JBRDleyx3OrYsxmTZ3IbxcyiF1jXQlfYD7Rkb8tAw2WAIf4/xYlsZKGllejack1poYO8Clmh5JjqTebLRCfofd8bNGOfDXgaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439241; c=relaxed/simple;
	bh=uvwgPyWrOw9KmR0c/X2PNXzypQy3m3KL8GwzpX2fqTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SAwLQiGCnxZNYP21YrCTlt2/grDblai4p68P/W4pKUYIqQyMuunrlfg+EMJjRUyNBCjpTL7wKJYGbZTLsQGq3vK44P7C/n/dzIMwOta5yteG/QVgwCES0Osjkhk++L5XsAUzd1zgKM3iAoKAeCJrMUMQojco+D5waBVoO7HAFrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=f1eLVhBA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="f1eLVhBA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48436251906so2413680f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439237; x=1789044037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPKOB+wmvKHfT71ToWp2DBu/JFiXBk04+MQSH1C7GE4=;
        b=f1eLVhBAb46ZG25LDzbXsar83IfJ3bRIJQXQ5zcKJdVHkY9+I/0pBkczEF2J6caby4
         XXCZhZHYyXz9R8roGkE5VE6baGmeImQNVzOJQo8qdxePaXcCKv8gnORqaclXcmWbFSdy
         CfGFjPH45FfZGW50h+bkL8e9upHzI/PMZ4jUvk/Hbqic5qmkfdA4bfsdKPQKQnkBv94b
         jh3PSSuVIclDVk7zl2y3hVX8gzvunyQrLFkMRTF7a/roQTa5f7eiY9ZFiK8ervBtqJGP
         OCxYkRj8cBvEW8bWuIzQyphYKPS8W4xLzyBKDcuaDlwEP3MbLx0asVBCvnCTxzbGmQYi
         Zpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439237; x=1789044037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPKOB+wmvKHfT71ToWp2DBu/JFiXBk04+MQSH1C7GE4=;
        b=Wzt9dwHQEnZ+1vXkzuBZPCpQWRhZ55fmBk8+EHmsgZshwxzyILABodpOpxXyO6T/Tm
         +ztbppEqU9h2CwXaBGQOT7LmI/6r48m2/WYau/h5I3t3ySazeyiXBFwMx+pcosk4LvOH
         uXdNycHJtdoiAQNwByUdBwNWpizDjZYbm8KdTqf8TCkODTRXbQmzXFDKjeRkrL5L7Hyz
         CpFuEFepSvA5OKbpsmtPieOya5qUpIIi4LAvPC/IXQEw5+E+CtenaWBTjdJhgakZjeRe
         t/Ii9pHb3o7HGzziTZ3abAPoL4B3BC4RYux8b2pymNgZ8PseLINm8qVByOYclyMMIIS9
         jJ2A==
X-Forwarded-Encrypted: i=1; AKwUvByWpS8fx7ba0jH7fJmQpVPBTXxVVF+NeFSXzF7P4e+YN5k13tb177Enr8NoFaH78Bq6+QlR606+SW3LAjg=@vger.kernel.org
X-Gm-Message-State: AFuF++keJUPOiaX925iClaC0qiurkXGw+5a4frKbOZqRSq9XiIbKkLGa
	k7DOpdvWeCTLN+OZ2KEUNg6Qd567UG1fiK+xoTyPFzSCFjmdSPregnnZG7DD5vyPVjo=
X-Gm-Gg: AYBFou3xDzXe5QYKuUeRYh0zVjgkfVq2z8IuBbYaAS9EU27+TOKvsELhf8mtAlYRGVc
	IOtgMHHjrQxs3JSsYxhsk1U6LIU7oulBmigzo329tAdT+n4v7ubOBg0WFh/dwqd58XVxSCwKALR
	0DFqd2aV6K5/Vc4MYtOSDxJlhyYw8j3pJGliPQsyyp+l1w/93ut7wKLPYhN7iztbkKa2zDrL29A
	6KX3VoxBnn+yIztZrzA9txmpDRlqpUQ/bakVIC6l+UFZvi0QHPsOocaLnG/NXy9rPsAfAL/Qs+X
	md45jIUO1CX+zb/pq6o7XoYF7MEcPYDfY1E1WCA6S7Xb6/kCUFy1eCVlguj2ztEd1Cvn5XSALIy
	dInQjWbe2LoXgY9stNiFbRoye58RtBc3xwJt9MJFj+eorQWcONr8bCQ9O5zokVXR/37sv/7hzdF
	pgDEqPKNV3GrrSt70emIbzlQS3nRM5999kTyvXjlh5+gN5q7RLMHVGFOzdoA==
X-Received: by 2002:a05:6000:220b:b0:485:8313:9f47 with SMTP id ffacd0b85a97d-4858313a27emr5841765f8f.10.1788439236867;
        Thu, 03 Sep 2026 05:40:36 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm14692339f8f.6.2026.09.03.05.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:36 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:22 +0200
Subject: [PATCH v8 1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-1-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uvwgPyWrOw9KmR0c/X2PNXzypQy3m3KL8GwzpX2fqTE=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWZ3Xb3rEzHwTLcBk3zdX1pPhQcRpM8nwXSeWTNNSY
 T+Qrreno5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYisYLhD9+37a+NXBY7bmXT
 E+E2T9w1l3exxxWvf5sdZl/+nyWZfpbhf2SGeO2sNd0qNzXPbdzPy/cm95KaiKB6eNSNkyecT3Z
 uZgUA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564b..53c096da68b5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0

