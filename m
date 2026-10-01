Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4016542ECC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883563; cv=none; b=QfuWjFb4dLZSpvn2/3XR0AZGfjtGGdyS9bUDBFKXpokm1gvjec5CO9vVaWjykFf/U9wkXulUi/W8vMzkioLCZ0acmjmk9iI9E+5fQmI+KnkegU1YenTWBE/Tlt8QH5p+6WBYv55F/a/ZJtKQfbcGfPOsja+fQWBA5iMflWrxhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883563; c=relaxed/simple;
	bh=vbmhm88/noJ83Q6vm4aEWqcAzBi/47a/QSvIx7WVrCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R7Crg1uuT+tqqJHPfpXmtliNVfBnjn7Xp8VVS040dAJWiC3LNGA+7ye9xc7ZmFQcnRIygrHEPx8lVsjisesANzGzrh1AoubB9XfMr4kzT3E+MS9yJ+/9N4WseCWRlitHMzzdVs2IYHVzQ8nGDob60zf/U8OgG4PzijmzJSRGOC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iTB6Gqiw; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iTB6Gqiw"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7bf18d0c220so693102137.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790883552; x=1791488352; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qwRtr1D4uvDf2NM6dCLPnk+e61bN3tdOAsVS/ij5Mfc=;
        b=iTB6GqiwY7CgsDW1uurVW6+uz/tODJs3czE49haWci7X6xGHsJwl/M1f+rGA3Nb6Zw
         ilM5b2BXUUewpiTlmfWGa57U3x5aMGujx7v9s8SPuZ9mtltCyRaN71xfrWWMSe36AVK7
         9s+3rZVCcSC7Mg7XqBBF8gL3sL0FUs6DpUdB4XhESpNmBjxqo8gNozdOvwUr7EmCK1G/
         vw4q86aNkkjekzle5lUUq0D6ICzUiSKoBhv8RUSpM7K2H+QItvpOjP37YZUj2Cprz0j3
         K5i9VMxPIFfPCCMV3wBgI5brwntK2IrzwviS209XS9rt5rOKUh+TtfId52703wQs072z
         LyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883552; x=1791488352;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qwRtr1D4uvDf2NM6dCLPnk+e61bN3tdOAsVS/ij5Mfc=;
        b=jVbEB7R6S+oJ8PAlNa09aFrpQjpQu//Dn9+FkVAfmLKfFlLe4XlUsMHO9+paQqHRDE
         ba7hbmoJZa+031neSIdZiaHi70i51xlSYNCQANz4LP4i4NuQ6jzqfzIPePIMx+1HjdlX
         Ec0CmMRB6VF5PiUO1oNiZuyAwnWolRjnXOXoaOj3yyU5Ecj5m58nNhbveG5dg4SIB78E
         nVFXj4QS/XEPgyvNpbVQh/0YWyN+d9/lx9SvKx/CQEQv3UCZScslvoMHT2L1Lli0bv+v
         hrnvpdSS2Hh5gQW7hnOx/ET8TwLQtATjfgLupw86Kw8vqqEDfpaMMQN+RvqX/hZ9LdWN
         uLZw==
X-Forwarded-Encrypted: i=1; AKwUvBw4LE9dochq0p6VrEBGmkv4rbg8kuoMKGyU0L9zrLOVm2ywGpPpg2R1z200tVfXhZ4kEazeRav/1OvHpQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmTwa0qIuZdSPhas98yr4fkT+TOw3QrWeXKWEmn5bbTlaJI+tU
	GwElBI9Vh1oN2oNoDmFIj2UNICUSIam2D7z1JkxEvXmcbE8DwZCQFt1E5VkVvu1YG30=
X-Gm-Gg: AYBFou0hIDCgighQI4zBjRnFoKIMteDfqtDTq16CU93I/d8jAHZhy85SgK3f6+Drfea
	Vijutz2MrF0IolCo5mPCKDiYXTfdYnHOfc6EGEJaHjUvZ2vEdGjCgEsnXxY99SQp/4QdVoQRdUl
	ryzt4vgvjmAfDYCyYKMMzLvUhmaQIKvHS5PGSFam/yXxrlBrPRL+lY8uuIL5G3/sjUo0SN5bqqM
	V4SOJQPXyP6GHdfv+zqp+dEieDwKJcQsNqvpWFwTPKCTiM7fInDhW+eInZrslueQr58aDSRZhP6
	kTltK/Edb1O0woAU97CNH22wY1HYkFm40G4H/CnWMUoJWoNI4KRVPCxObhdHGufCg66Hdvkz/Qb
	9qLpQmJUn5B6Q+98X8h76dom81R2v/61IqWStdfxPeLm34wzKuhbgNkbjLvKDOcKs+xbpdaXkTc
	erZNeAE5Xe5MZotpd6kFObUzc/Nu6cYBcW3m4KW4bYZ0DKcM3sDvVUBP7rm4719MVBEHReFzI58
	fT204+8fhKZbbmevLtqlKis5H2wINqIclVAJVYAajxpCDET
X-Received: by 2002:a05:6102:3fa8:b0:7b5:4f3e:70ac with SMTP id ada2fe7eead31-7c0f4c9e8d6mr134416137.24.1790883552571;
        Thu, 01 Oct 2026 12:39:12 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::ffae])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da612086f4sm921797e0c.5.2026.10.01.12.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:39:12 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Thu, 01 Oct 2026 16:38:30 -0300
Subject: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWTsJKNHaqxgXiGOdasWAEo3x7
 tJ2+Rb/n+DJMXl4Jic4CuzZzhEyTcAMen4RchcNmcgKKYTED09jwG6zSOuANpCb9IGmL8v8oVS
 llYDYLo563n/fuvnbb+2bzPqdwXXdIrIOGHkAAAA=
X-Change-ID: 20261001-milkv-duo-eth-overlay-cf7738449a40
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, 
 Andrei Lalaev <andrey.lalaev@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

The CV1800B SoC has a DWMAC controller connected to an internal 10/100
Ethernet PHY. Both the MAC (gmac0) and the MDIO multiplexer used to
reach the internal PHY are already described in cv180x.dtsi, but are
disabled by default.

Enable gmac0 and the MDIO multiplexer to make ethernet work.

Tested on a Milk-V Duo (CV1800B) with its IO base board. The link comes
up at 100Mbps/Full and the interface gets an address via DHCP.

This can not be enabled by default as others may want to use the same
pins as GPIO, that is the reason an overlay is being used.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hi,

This is a continuation of patch [1]. The same patch was sent before [2],
and an overlay was suggested, altought it was not sent. Therefore I am
sending this overlay now.

U-Boot logs:

milkv_duo# setenv fdtoverlay_addr_r 0x82480000
milkv_duo# boot
** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
1:	Poky (Yocto Project Reference Distro)
Retrieving file: /Image.gz
append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
Retrieving file: /cv1800b-milkv-duo.dtb
Retrieving file: /cv1800b-milkv-duo-eth.dtbo
   Uncompressing Kernel Image to 0
\## Flattened Device Tree blob at 82200000
   Booting using the fdt blob at 0x82200000
Working FDT set to 82200000
   Loading Device Tree to 0000000083560000, end 0000000083568fff ... OK
Working FDT set to 83560000

Kernel logs:

root@milkv-duo:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq qlen 1000
    link/ether 22:9c:5e:8d:3b:0c brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.124/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
root@milkv-duo:~# dmesg | grep stmmaceth
[    0.580448] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[    0.587750] stmmaceth 4070000.ethernet: IRQ sfty not found
[    0.594165] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[    0.604856] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    0.612359] stmmaceth 4070000.ethernet: 	DWMAC1000
[    0.617641] stmmaceth 4070000.ethernet: DMA HW capability register supported
[    0.625189] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
[    0.632191] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
[    0.639720] stmmaceth 4070000.ethernet: COE Type 2
[    0.644915] stmmaceth 4070000.ethernet: TX Checksum insertion supported
[    0.651995] stmmaceth 4070000.ethernet: Normal descriptors
[    0.657911] stmmaceth 4070000.ethernet: Ring mode enabled
[    0.663737] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    0.671939] stmmaceth 4070000.ethernet: device MAC address 22:9c:5e:8d:3b:0c
[   13.104870] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   13.125037] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   13.172421] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   13.203664] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   13.229963] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[   15.278278] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

[1] https://lore.kernel.org/sophgo/20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com/
[2] https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
---
 arch/riscv/boot/dts/sophgo/Makefile                   |  3 +++
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index d5c80d4ff005..adea990ad912 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
+cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv1800b-milkv-duo-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
new file mode 100644
index 000000000000..52c85b4e0155
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Enable ethernet support on Milk-V Duo (CV1800B).
+ *
+ * Copyright (c) 2026, Hiago De Franco <hfranco@baylibre.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};

---
base-commit: d24e8ac715de2e16a53c144005b1863660a5fbea
change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40

Best regards,
--  
Hiago

