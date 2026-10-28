Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195184;
	b=pYtUhYlGvvfWMhQ46bASFC9ndw0MUPUANEMG+K04yD/H+xBVP+U4gNoyz7tgyuIgYfu0
	 /ygqsgHYY/I0Y9xmbRo42bMbXzNd9ybCMMhByqZdxCu3vRhHZtpxLdoCuaLq4oPCXjjKQ
	 ZEx5Alz+wA3l5oXkS1ib1CoIQZ+i/4iZaGnf7pORcTaNbSV9KE/IKQ9EIwJsTD51IZHdp
	 BmrxFl0Q+mUnZ9/BM5UnH4uAwpkYY1yzoUUlkbGZIauGi3cHPsldieuz7RRQ3rlbswsIN
	 5QUWFoNlYdcSDQvZiiECh3yz82QT6+3JAbmqKaWMHKYrbYpaaw7QbZRMEorLp2DRbyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PB3bcTSjIDz4nO+XHXTgRZYRg2UXUqYLAr6X7az+r2o=;
	b=f5hRnEDvY8Jgols6XJp0ynp7x7efTnp9OT0np1GB0832LoLF9nwyyfDo/ZlJkh0Cf3rm
	 sj6O3m89gQBJHJwLWRepcKureY5huOteXdd/QlBiZ23UTx1U1eGIsyRX3SWdb4ELHejnw
	 m+jhuBbWRuoI/k1ISlCHeP/M7YkKCD+BMiWn1ZHsa5Jm06QZ/HNCT09ioO7EFsIZiNPC+
	 EjQD1OpcNA/swUE3+jC5Kov3DkjoM4EO/e3GVFYoUi0im9gJsHnwOoBudIbLGa414LrGF
	 LGgDn51RWX2FuWqwWLczq1jhtZt/QLkgNQ6MJxRl8jypE3mLK8WuuZRoeMCWkOs9F2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ROoN+2c/";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E486A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E486A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROoN+2c/
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1846bc43c28so1119051c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195183; x=1793799983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PB3bcTSjIDz4nO+XHXTgRZYRg2UXUqYLAr6X7az+r2o=;
        b=ROoN+2c/8mEv+9bfY/JEsHLydAwpD0pWzkQ6bLeEWvQ37MJdyNbVpWLV6CPEuGiiM/
         9XgW/ONO60DSR/wMYtf08tRBRjYYWFEZRGlwoA/4F+WIZHe4lTzRH49qN/3V4BtUao8E
         cIjLCHmPZxwW+hb314/ZmOK1hM9bSotsYtstCm+pbkdph341sZPt4UMjsqFvUFgNo/E8
         tUhlnbI4wLxz00q0sG18BHalkONIXy57I/F261SRMjCZZDLdqSMvqHU2tnPLi/UPc5f6
         dqyekgSV5ZUMDqvRnqiJvZCyYrIpvx0U43c5nrI+R/T1+Fw8nkpQtdaiII+uvIydP6vO
         4wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195183; x=1793799983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PB3bcTSjIDz4nO+XHXTgRZYRg2UXUqYLAr6X7az+r2o=;
        b=b7MMrSwiztslKsZedv8EDOBwgyStSVYManGuwpIEy9BnYW3qF+lxp/Z0nEZTngNNp9
         uvV+w9Y4n1OiK5V8PaE2Ko1UcE6xFphQf6Av+bIwTKMrVCb9AHZ4l9YTgLjJpiCdIHRR
         14Yrh6ky3g/JEMeU9HKY4meph4hpUKojH5dcUAjYrH5LTFqLVjpufZNEzxLxmX+7BKqB
         eCPZb29phKcUVBGtiVpOHx7Mx/sxDzkBdbdW1wPkVY5vr4MGnUjliUdeSqyMgkgJsp7d
         KQlv5lpNfe94yUF/cNleLOInAPLqBucOkH0Vppbj9lwkfeUkRYT53LRW10q4vljcjWMW
         NKYA==
X-Forwarded-Encrypted: i=1; AKwUvBwuBKsrNKQ+kxVem9R1Yz3Yfpc45aYeRkPZ4YeapH5v9YD+GpBa2c9p1JirrMGbvpo9WEHsSOZY+N8ufR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiv09hzKSJfhtJianYsJS4bPlro6v+yg3TZ6FHAMhRRd+HAoJ7
	0nUJXopZgo4cSvyafoPKSK4RkWwxGaJ5xxzlvOUKfDmIuOWLFz6HhSLG
X-Gm-Gg: AYBFou2lFRD/DLomMrT3LqGbsXljLjmWiHvp3ZU5siVp5kT6U9HrNFb2m6O2KfWRiqU
	gg1tJmIQKcIIlTFvuElYvlYLA+LB9QO8SbvAZzuiMHnMvVPTNql5T9W2v4w31EYrDLrykyT/Kxw
	IaTCHaUtErTQa4HG+hcVikMfalN3yo/vInkoOBMGUwX98SoFhmfxHVTD5jVJuxlG1wdA3Km02ly
	4YeckCf4mBLDPukBpIGUJj+GB144Vl55ZfdPCg81eVQxI7SAGjprhX4RBVoPyTjIa5Qyupv2DM6
	3kBrcRUpU+C50wRN6hregZ70dZSKPxLt3dYlIgGt6A4lprL2fgHnx5mxIWzPQGmVszK+szvhsyK
	MP1D5EJZw/69H5dHeqAuDj5uTZ+cYPgcaqqACcYbLb96X9ED3x/1leNpTC6sIi5RPdacGWCCvLx
	SG6lex/uuTONiJT2hzODL9kRM3KkTRQu0+8TlWM9yUrfrBdkhyCVV7EpYMtlg2FI/mTR9wjvTAF
	R/QNQReeYa4J+WmkSnCIIjrBdXWuLTEA1i+UtFtifwqQcC8FJ8Psq5SR/o1fyxZuKsdLVlrcu3Z
	yKkyyN4zCp9aVAE6Xg==
X-Received: by 2002:a05:701b:2044:10b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1a6cfde23a7mr3093747c88.41.1793195182199;
        Wed, 28 Oct 2026 06:46:22 -0700 (PDT)
Received: from jklsarch ([38.244.63.126])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76056a001sm8583561c88.22.2026.10.28.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:46:21 -0700 (PDT)
From: airjinkela@gmail.com
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Sjoerd Simons <sjoerd@collabora.com>,
	StarField Xu <airjinkela@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: Fix malformed SRAM ranges property
Date: Wed, 28 Oct 2026 21:45:44 +0800
Message-ID: <20261028134544.594888-1-airjinkela@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: StarField Xu <airjinkela@gmail.com>

The eth_sram nodes on MT7981, MT7986 and MT7988 sit under the soc
simple-bus, which provides #address-cells = <2> and #size-cells = <2>,
while the SRAM nodes themselves declare single-cell addressing:

    #address-cells = <1>;
    #size-cells = <1>;

A ranges entry is therefore sliced by the OF core as 1 + 2 + 1 cells:

    child-bus-address  (1 cell,  from the SRAM node #address-cells)
    parent-bus-address (2 cells, from the parent bus #address-cells)
    length             (1 cell,  from the SRAM node #size-cells)

The existing values place the parent address in the wrong position, so
the 64-bit parent base is decoded as 0x1540000000000000 instead of
0x15400000. dtc and dtbs_check stay silent because the total cell count
still matches na + pna + ns, and the sram driver only translates child
addresses, which currently do not exist on any of these nodes.

This is a latent bug: adding a pool or export sub-partition, or any
other child with a reg property, makes sram_reserve_regions() fail with

    reserved block ... outside the sram area

and the driver probe aborts. Fix the ranges tuple for all three SoCs so
that the mapping actually resolves to the SRAM window.

Fixes: 65f0e3970143 ("arm64: dts: mediatek: mt7988: add basic ethernet-nodes")
Fixes: d0c970091abf ("arm64: dts: mediatek: mt7986: add sram node")
Fixes: 9846a8c60318 ("arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support")
Signed-off-by: StarField Xu <airjinkela@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index e63ba3ae395e9..2718c7dd7eb60 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -492,7 +492,7 @@ int_gbe_phy: ethernet-phy@0 {
 		eth_sram: sram@15140000 {
 			compatible = "mmio-sram";
 			reg = <0 0x15140000 0 0x40000>;
-			ranges = <0 0x15140000 0 0x40000>;
+			ranges = <0 0x0 0x15140000 0x40000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 318639a7c64e9..98fd74824653d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -579,7 +579,7 @@ eth_sram: sram@15140000 {
 			reg = <0 0x15140000 0 0x40000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x15140000 0 0x40000>;
+			ranges = <0 0x0 0x15140000 0x40000>;
 		};
 
 		wo_ccif0: syscon@151a5000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 8c9a5aba25791..d497ac826d669 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -1009,7 +1009,7 @@ eth_sram: sram@15400000 {
 			reg = <0 0x15400000 0 0x200000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x15400000 0 0x200000>;
+			ranges = <0 0x0 0x15400000 0x200000>;
 		};
 	};
 
-- 
2.56.0

