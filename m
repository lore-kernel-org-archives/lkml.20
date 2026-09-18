Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB43FB04E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723153; cv=none; b=Itrb7hlrU3DlRFXM6aQB5ynJ3PSeoGb+6LJFmVzqMzpn3bVp+7UOSzMdJ94vfqMZvG3y/QlQogfP11hFwPOgBqkYASsMKx+Ex/wi52x0+tPeYQZaMKBMUU7TxibqM3G8WhZWGDOyaK2WETZUsHf/1hWgd7vbjTCximDPu4QXzBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723153; c=relaxed/simple;
	bh=dumbrPOqQoW19bdj9Q+Yrp4aXi4kOxMnSTyfo6FbsQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXQjvFVUcinNVQcWdtg8trG3hro4whcc5iv5kXzrWMpt3homOEX62nT6WGS/zI4yCo0KSmKJXZ2a1lhcFAbSogZi+tNfa2K40/uHjdqEty5nkabSMBtgbnUaXECdtk8wxeC0LZaNuBSv4umDW1BHVsaHvm0aBpXP6w4ewAR3anw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cIehUhxJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cIehUhxJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so2612885e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723147; x=1790327947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=;
        b=cIehUhxJ20GkM9f9fklxlMfWu95w640RoOgUlyGlMFVzFd2QH8rC2CfeQWMFxXbCnS
         mPFiu00+exxgvd1PS5pLYAXrzFLEh+bDoYcnnBisKGKk8GsNRyXcHEAvRCmTgVii33sP
         DufXLzNQ2PPtBJNx6bMDIginjzsQD+gLlOxbQed8NrP7cjoESjgH+hLby774CSdGjdIC
         aZapV9mcl3ZZs/VaBzw8cvNLtvklsFGU5UeWuTFrc40VEoDV/rVB7dErAwtKjMhHWOx5
         yDowAMGtzmWaFLOg8CebB09Y/bxsqsZ4G9Qn/68iFvW6wG6x/Gxp9zNElOLrq5uVhe5i
         iGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723147; x=1790327947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=;
        b=WAcLYQjd/KvbRPzO+iEK5XWTqo/+qAWguwrIwNEcEZ8WhMsWSwbNAWhA5izpuWb38P
         +6soYZhsQoubf3ZiU7v2ay0r/ZquFaYfIcpwWx1YygYBVqWAgLIPKj6oaAf5QDyhNw/b
         MzripHs7H8MAQWbbQtKcbcZCdJ99JL2DLvl4mwMFtBrYdzjy1oJqC1TCoBy8t5KZjIzw
         9agAEa2MmNWanagGoLlHigC97NoURSES1Q/srNxR3ye4mt1toRIiEb9DEfG3FQ4jn2/H
         zrNl52FflmYV3Y8yK1g6+wMTHr1zq+2R4yU/AxLRLRQIdbgEchVadnOZrtHJmplf3lQK
         tt3A==
X-Forwarded-Encrypted: i=1; AKwUvBxw4VXBJzrfb8VvIiCWY5h0gVOCIA1xYK1mTXBeaYyZBIQxXcZz8e/zlWpPXTp7R3Vm3tdSKcdDz2VNxJY=@vger.kernel.org
X-Gm-Message-State: AFuF++nHyshXL+1TLKFenbr/s688UWt1xQR/Uk7tKBDww0yy7CjLcylO
	HzrKUmKjDe5r31u9cYxB6dgol1DrftBfdGPlEczIdVZbPicaUET7JTRIncf5X5h37XU=
X-Gm-Gg: AYBFou3WjZg5aRBuFx7fTsFb1k/Fb7yCzUsYVdxoYAkmolnWAYw6b/Yeqfo198Qy27d
	mFTYQu28oCx+HDKMao1CTtJgYATZ94h7qG2egqeynDzAvFoiuXJIgUzIu+gtokA3Bk/FQOcM8Oc
	zdDqZXBXu3hemFhNvuw8qDQT4AWtH/CHEUq5i3DnbWoS5s7GmU5iMbR4wQJWtI0sFdOy9P32fDM
	V1uQj9ZUXnnfIFrucbANketE931bnDMDSGdRQhvKxcgINadxcmE1rnLcggZa/xVYctWiE+7zXCf
	zosyRJCjnykMJ09et/R1l+zFPwExvtSYSvo9RlN6k8GewBYatNnfdL9Ph7rjWVg4hZA9nT0espy
	NL/HOObdgK6Du1Ege4jzm96laDDkMlXtSggOCJ2/9/VTWIZw6GftUbSbpgNN/r3Sn7niRf+wEOL
	HNHAoaF+MmUPy9M7KHmLx7SePT6d3ASREsfsB4/bkn6fJdjLaFN0RSnYaimauH6xrW2f4=
X-Received: by 2002:a05:600c:6305:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49fc50012f7mr25323075e9.13.1789723146740;
        Fri, 18 Sep 2026 02:19:06 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d46399sm49887575e9.12.2026.09.18.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:06 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:50 +0200
Subject: [PATCH v9 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-6-40972ef1f663@baylibre.com>
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
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, 
 Stefano Radaelli <stefano.r@variscite.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=msp@baylibre.com;
 h=from:subject:message-id; bh=dumbrPOqQoW19bdj9Q+Yrp4aXi4kOxMnSTyfo6FbsQM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jLcfHc68H/BS9uDUKBMetp0zrn/R/8SXy7XmaXuC5
 2WNhLlyHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR7gZGhn2FJjelbr/xPGh+
 +ureeM5Ahw0/kw7a/Z/ytP3sT9WFOm4M/5Tm5lvG6z0//MlfVijUUbM6besjTZ0bYZ8n3vi0cNb
 SLUwA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P")
Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 8a8dec80cb30..3d1a2c5bc464 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.55.0

