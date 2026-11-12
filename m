Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448327;
	b=J7EWhJSKPgh1dOX4R7tYJo7uinhCSLPosFZP/kgpgzXA9IGMDW54kDPXVj0ngq8p6C2B
	 tdSx3TiZU3e1d3/u775RURkVpRIVt9OAtZNzmVGya8baObg4ZcVvsKt7PLY4/GNgrjhft
	 ZrRu7Kr8Ls0JnLEi/glVgC1IYXC/fGVZMgev9Kx2g09IGbdbp50JyF9KX1e3LNWDqqyeu
	 U6osKsDY2EzEbDXN1Wvrsb2rux+r6uMgQvcpXDrbQoM3H+9jogpadRM/Qn9QJLd06NSWH
	 TVcIVK2n9S6rSx4m+HUtPc/vyLV2R+jPKx4qcws4cTrNwSYfU6lBLE0DC5rr1leFUag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
	b=RP7jlSUgiK6ZeHjpC8uR1Ataq1P7eBLu7PhJVqzYBxLjkIZ3CO4sExsCUcgwwrXw9zdm
	 oS5JQm/Ks0c3K4O0t0B20mGVzoB0Jp3FpCFy9sNGQwhlnEiXIQCaFEPi6pg+cudcrEPBn
	 hAlnmXZzoMM9zYfbDgbYv/S/MP0dSsRVwxdeAGAb1LnQZCai0uL2foJoZVo1WnLmz9UOd
	 0iyS+A9CUV+W3vb2MQiuqPg/OE8pOKUJEZ+/jrvLA9E1FqmPMetw9PrVysb3mJhzVcqUl
	 lUsQAgIiOw9D3Msss5cR5bPuMkytUaOH+VCN/m3amsQWvEJ+JYU7ET407/Q0itN6aBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ND1+QOw;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A4B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A4B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ND1+QOw
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-536c8f958d7so29458221cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448325; x=1795053125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
        b=0ND1+QOwW5zYHgp98KmfG5+gF6wM+hxCcoi7ET25XbEPtpM1QkWvoZDhV4T3m3GzA/
         S+EUwlPKG1/jcd+nz5+wisLK4PlmPxEMXfLUqXM1pTUiK6pAOnXYWEz0UsQSZdWbR7Sx
         uPx2cdZQ2vrSsTMYu0IAMtWJCcB9Zl8z76QSlyXxbdztXOD9tderaHqieP/HIomM6v8U
         DtBDan9JKHOQNxJWkUzY+VvZC4Fi9PIx0Y7SO1T9BkfuqtkuxbddmozhK37dqJt09m6I
         fggfNe9Tj+DOz4vA1lQs2ZV5j+UfJ180IOYGK8f70q/VzM9R4ZRcM0ZS6CPHTKRMXFuR
         BQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448325; x=1795053125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
        b=wyFYWHA8zWIU3IF7deUFSBwnrKBEyC+WhJ3Nc0xlRnQtLZt3Fp0YzBO6fvgMAUaKW5
         G6azO3C5TM7NzEGGJIJGywOBGGQV1gSibAvzhnQqgBPHOoFv7Y+jgcyO8Xm+WtCHH9P5
         pnV/1ox0GR+R2AARXmgSe1D2SamDjiuB1e7gqrYmmsmZt901WcMoZ/Sq+bdbSOX3SdXC
         w1ndET4nG5NAhM/dvWftCEEa3Qq+3pfxV/OJ4C1GlRStxXfG0Kgcm0dJcBupw1N3CW2/
         350lyUFVcFzA8Fbtw1uP/ddH6vb9D2PR1SpxG0F4Sgm8PDeOPqN1nspgbirrA0NDLjyl
         pzhw==
X-Forwarded-Encrypted: i=1; AL+hErFhntEDnC+vBZxdvNW2f0taQEATh6S89+HU9aR4BEgYlEIVZx/MeP7QBuzWr1Yuu1HA/z/ApFQUf0o3fNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1qESlMdg8jyxug5UOVYa6+D24vJbYXJZjxpySZ3O4EY/i6f6X
	hhG9U5Qo6f1rAEG64Re4TN9E3GpVEOlgOUc0AreVCouilKOZMO/pdAw=
X-Gm-Gg: AYBFou3/vkLTT0L1EDmJA4vRlot+Dk/z7Nvy5IcXGtXG5v/3WKpmlgcfkA5d8FVD7Xk
	G+al4h+jLB0OCLI2jjjeR5js/MgincCFFAd5Wr1uUvVN1U/k/BYMOj28lOrufiTu9uxc6D1tCNW
	SODVJUugc8JZTvwfDjj8/B3FFPnCYTGdBc/CjMJsJjKP6JriYWeYIUnKz+b50GWYUAAs0ixooG7
	CHXliASeAuOw/6JZwN/rdMUxtGpHT2rALzguVwb3HDNSv3D+opaqPUf70E9qnzeKULoScL/fO/H
	grHM7XwNl5KWE1lRjNeE1ixKUt1bQAVk38x7jGPYQznm8fABp0jZsyFom3/KlTrRERBng6C1Y/s
	F/5lE91Xkzbx92CiHpS0G1Ng6fz5AiWxwzgdBhrIRL8UlHAGTzFZrc4nlPBIZciTuVtO2jFpEgq
	2gMtjA0BsT18YxRzcrIdn87/PBvye0aDH841xKI+QyRgk4y3N5xGnalJg/C+UGTNmCZSYRCPyzD
	Nn1Grz3WbzdHfdhm73oD3i18MoSKFO7nLZ4l4SPuJsjfBf/Xn2iCdJ7od+3WhOTxzJL2PgMV3fi
	97ksM7WSrXBeEXda7yN7k5sHgDYD
X-Received: by 2002:a05:622a:5917:b0:536:98a5:cd8c with SMTP id d75a77b69052e-556c06e37c4mr54334061cf.30.1794448325483;
        Wed, 11 Nov 2026 17:52:05 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f0ffc6f60sm16052726d6.14.2026.11.11.17.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:52:05 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Wed, 11 Nov 2026 20:51:47 -0500
Message-ID: <20261112015148.3911178-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The dma-ranges of the shared pcie-bus skip bus addresses
0x8000_0000-0xb7ff_ffff, the union of the three ports' outbound memory
windows. CPU addresses 0x1_0000_0000-0x1_37ff_ffff are therefore
unreachable from all three ports.

SpacemiT's vendor device tree gives each port its own map that skips
only that port's window (dram_range2/6/7). Do the same here. On boards
with more than 4 GB of RAM, each port can then reach another 512-640 MB
without SWIOTLB bouncing.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    RFC: the per-port maps come from SpacemiT's Bianbu kernel (linux-6.6,
    k1-bl-v2.2.y, arch/riscv/boot/dts/spacemit/k1-x.dtsi). They imply that a
    port's inbound DMA to another port's outbound window reaches memory. I
    have not verified that on hardware. Yixun, Encrow, can SpacemiT confirm
    that this is how the K1 routes inbound PCIe traffic?
    
    On an OrangePi R2S (8 GB, RTL8125B NICs on pcie1 and pcie2), up to 87
    SWIOTLB slots were in use under load with the shared bus, and none with
    this patch. Receive pages were kept below 4 GB in that test, so only
    transmit buffers could use the new ranges.

 arch/riscv/boot/dts/spacemit/k1.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..949843bb7789 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1152,13 +1152,14 @@ eth1: ethernet@cac81000 {
 			};
 		};
 
-		pcie-bus {
+		pcie0-bus {
 			compatible = "simple-bus";
 			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			/* skips pcie0's own window, bus 0x8000_0000-0x8fff_ffff */
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
-				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+				     <0x0 0x90000000 0x1 0x10000000 0x3 0x70000000>;
 
 			pcie0: pcie@ca000000 {
 				device_type = "pci";
@@ -1203,6 +1204,17 @@ pcie0_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie1-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie1's own window, bus 0x9000_0000-0x9fff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x10000000>,
+				     <0x0 0xa0000000 0x1 0x20000000 0x3 0x60000000>;
 
 			pcie1: pcie@ca400000 {
 				device_type = "pci";
@@ -1247,6 +1259,17 @@ pcie1_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie2-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie2's own window, bus 0xa000_0000-0xb7ff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x20000000>,
+				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
 
 			pcie2: pcie@ca800000 {
 				device_type = "pci";

base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.53.0

