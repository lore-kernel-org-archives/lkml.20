Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1658931327D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723148; cv=none; b=XFdWacXLI6Labvkf/VSI1HCVzmOxyj8AcNOwu0Ef7VC5JP8nUL9zkUZm2tRFEBcuiR5c24vQVlUQ7Zo61kjk8fDgYYgbpMyZxlDSSzrcxmDb+0Zaoc1egJjGYfq37Mt+C4FDFOqPY1NduQ8HSmq2BMHZw3tqqQnUI9c55NpG/X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723148; c=relaxed/simple;
	bh=Bw9T9kPoDvx3jWedb2GuXmBKbd8nnRyCUqGqNMfPoNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgnVeuUNdWPjx15eLFBqzclxYr1OiuuQmF1Wd4QSzQ8zKRVP95nO4mOJbfVBr/jmjsGayRT/x/x87hj5erlYDnus7QfA3PyHrV22TXx6ySbkpndh01eelIXIvdJn4RB9CLQJfmsTXyiZINBLH/6yMgK3r237V9zPth4ysThVCwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HRqZES30; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HRqZES30"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so3724455e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723144; x=1790327944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHpblPyGPvzLFJJQPED7TjfXg7mj3B+pu1lqZzx1RFk=;
        b=HRqZES30l4Mqu4DBTaSyQb8R7ymhbP39Jc7KzfHj3afGzlOKpI5XKAEQafwDV9nDa4
         EatW0xY221T0WaRx2IMWsbGLnEvxUNbS9rt8MBgpT70PnUp8ntz2Z0pqoDOknVBl4//M
         NtlvSsaUJO74qVSiumAk9PM94tV2IZyLZTAX1m6LvMMIONbcgOr4+GLGr4jyw5GJEbVb
         ZE2fpC8Hnv3ukpE9xW/LDNLPtXDCOiAUMYS9C0fsFqUYxuIkYENqZcLdX1zQZSm2AnyI
         0AoQHJCaNETlMo1ZFMnQ+AvRm481VYENSySgcOHOHegorO/AVcGypIfHk0MNrLC4P3lK
         vj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723144; x=1790327944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHpblPyGPvzLFJJQPED7TjfXg7mj3B+pu1lqZzx1RFk=;
        b=AcRP/6nPFioKo4bRy3Vd6T3GbcwaotMIfvExRetfER9KsgJcpvGTOvkpxXLXM8MKEm
         FBZtjTGBSV5m2X7esigh6O+3EQBuniJQ837eEm5doxb3o/FsqCTymAcjJuqdgQxolmn0
         4MKcVqYpyEs89El/SQPlTIqxioPrGF+lyVKHX0aK+wK/PtG2Y2pXRdJqD8a31PHCCCu4
         H4CXiCmI1EDIPfCrPCSC8EN2yyYt6u+tIfY5x2Yeq4aX9/bfySZj2OHM6uN4kF6CZ4JE
         lKiVh26uD8dCVaNBbzzhv/oS8pXmfVIuKR+qW1r/Wj8aOFIJSS9lnCnDPDfzbkBu3x0j
         YJUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBFIco4oMxF8+tK7ogQylqMS45Irb3Q9w45bhfqh3f4xf5xcC2hVEoUnco8gcYDgBS4tgPT5xdXihdanM=@vger.kernel.org
X-Gm-Message-State: AFuF++knmJsNJLVs58XFiQUjafFVkAMMu1UFnDzhtecrGWitHBRpvj37
	G0l4kxK+lae+ZZenX1bhHJqojAcOiXqHWSdiI9oyBc6LUUW3fLuWVZrMvmjlTFlsCyt2nMdWRG7
	HTt3H
X-Gm-Gg: AYBFou3qmqIsNwkfbtQ2n+vcXlpYrm3v/rz+WJ9607RojYxgQVWoOIjKl32QUce2FxE
	XurOhNiIwTFPe110eGGugQ9b2AFjQ8TnborkMekvK6WcoRYTgljIprdFoLrgF/8EAN90IwXttNd
	mwoy9MmPLBlnIgLliOWwhzo6tXbiOYHRDQy+iv7WQxfykhTmbIPFo5F3lizu+dSTxb6j8dIN2bA
	2zLQs+RgM+3HebjeUQA0jJgohRpII+Y4qFxvdcGwdeYTuFTZ/cp5vVatbZRzum1Map2Ybf/aBdS
	qCe2VodGaPaJk2m89BV7QvWQizUJdWYiplN0EgBe5OBCkFNCvm/g3r4AKKB3UTpdFQFe5liK0h5
	QB7XhoCK/NYgDYN80OezUZt/thi/4QdmHC8bHJ+wentTrTPR/1B7x+SmRiZv9Q5Fk12UE+FSrkr
	zxZsp0ykOKuUpHgBJwkwKHvPZjr4wlaFZzdUHzOwzeepFHC9ugqfMtiGquVsN2+AZlqTQ=
X-Received: by 2002:a05:600c:4505:b0:49e:84bf:6121 with SMTP id 5b1f17b1804b1-49fc56dac58mr22897685e9.13.1789723144132;
        Fri, 18 Sep 2026 02:19:04 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d4b9ecsm38524255e9.14.2026.09.18.02.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:03 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:48 +0200
Subject: [PATCH v9 4/9] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-4-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Bw9T9kPoDvx3jWedb2GuXmBKbd8nnRyCUqGqNMfPoNQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jBe7CzRZcpRcuvewa1x5NO164+TseMH5R0Q7Ha2VV
 zpuM+3qKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgIn8FWJkeCgslX5SN1vQ9cPG
 jve+i0P3M/e/3TFTI/f/HAPXL7vWsjH8jw7+OF2esbPB4q5za5es4Bpl+4SnRxZtllqSrc3topf
 HBQA=
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
Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113..8a5ff5c45757 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 	};

-- 
2.55.0

