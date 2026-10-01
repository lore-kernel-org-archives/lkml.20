Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0A837A829
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818055; cv=none; b=DViLkUmEW7WMgVg14Bv9zk/EOvof1cTr1AxCy+/xKAiWvPK+VWNt1XVFCN2Rg46qAVKlWllgZ8WGW+nCCfLeqIS9sPp2/4hxUoNwld3XNBEWtCzKWbgtv0GMfwVL5/XP0474kSlUbVxQCgN8KtIPjJTu3n+1sMEOGiC9VK9eI+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818055; c=relaxed/simple;
	bh=lnDe9unyJFbdpHrGquGQ4OrAPZiUzsxp5zW2uX63dLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ap2xQPwTDhtrRaF4Kc7WYvYiuvrJK7K3liw19o8aJVeF0rd2M4K3ihIqmCpo5A4zjVe43ahbyRqwI+CaDKLK/XzfEOYOhdvWDXcAa7NquTPI10JyEOdwTdbFt9YDLuvSLjuAMDBnv6jhXCWBTyTmnOFOv5TZ3zyEYtvejArWtW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CD/FbvMs; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CD/FbvMs"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so263287e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790818050; x=1791422850; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nf26PtyZyqNQ8F/dA4/jfbxWwkqjE7SC80bfURzMGRo=;
        b=CD/FbvMsfd2RvTU/nWI4HVvNkAYvc6GSHt5BKBvrPFnJdadDNZQwvKMYaz6/FgDW6q
         XpTYnDFZQzZ4pzUuHbUMTEP9QzeDXeM4a230FC8hHnYOK6XaOuIUokxZjMUuHkctxMPd
         q/6MLxDwLUbSp/tvgIDrf664OsJiKbslcFExt3Zpt+jqhPeuvzEhhPEVoMN+/We4a9Zq
         TUGY406LHt92BpOpL5SDifMbbQUFwlz+w5JFOrvcO+CcAVn0EdWQh5iEXQC7HIjm74Ak
         k5I00t9flRHWcqFkrjpwTdeDdFb6nE6vaUTeK4LguGX1rpW4G9H5z6h2T7cVM+E/j+FK
         OdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790818050; x=1791422850;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nf26PtyZyqNQ8F/dA4/jfbxWwkqjE7SC80bfURzMGRo=;
        b=tvKaJSGjct5B2Df3w7BjiRcRY0+WyGzqjyLSJEZ0WwTv6AB83Rx8PwO9ANE5QFlkqL
         fRK/qti2kec8huwFUZUd+VVxDdApFuIL6M2bMU8Xlxc2ll/vz69pkHoJNNyqwfJJTp5s
         oz1PJ+WjITOl++jF+KFEPLILa1J936mL9o2tmpJznZZrVzcCFxeJnUiZhI5g4js3tSKT
         Twop5x/P5cFYOV7ePV7192dFWAuB8rHWpb9FmFw/U7sztNIv9ZNtPZRAad9zQt4cK+YS
         sKIBX73hCQGYme30dQodTWugCN8VwRy72YkYc8sdF1l3coGGUkEf+Y2Sm3rwD1pyPEoV
         zUfg==
X-Forwarded-Encrypted: i=1; AKwUvByucnD77tz3xn0u8vq8o5M8tvGmmkkxw6uFUYVY71x0p0de7AIrSWBcACF/DUPiuFzIpR6Y/kRxy57tIBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMs1DnWtLsZ5WbudwbH/Cq7CX5lr9uJmByerHBPGXWXtLYmnRm
	MkbJ9nNbyv87VQh1ezjwEBwY6sEgf7kPFKETH8aO+uISSodqf2i36sG+CJ/NGChGTZE=
X-Gm-Gg: AYBFou1DF5ganDRgc/K6D6pezyHq0vTFq5OJuxcXcWhRcxtn+py5l5/zlGORp0FJjEd
	qeaarFOdVvJ+yHp+9tlDarwa5vOpxKqARa+/PzShmCdT2XwlOE6k/Vhjo+OsTMpV5ZOeOJ0kIUP
	MlGZ1BGTD/ZUi9kws0YwpNmYqio1ZQTwXB3APK1cfSjd8ih08GgPrLe+myr1NDox+v9pBrcyu6V
	xjQOpGdb618btX5JeqneyN5QaKGnAEMHKjfTk++3Bn54BXQ5aQeoDxpG/ox56nBjdONtwj9x8D9
	reIvytMOidl8364B9Wfup9RVwRo/v23ypDmo2C/NwY+hTNFHR0lBMTFdHw+cPkYiwV+ErhqEYT6
	zWl8LeZJbedtRDERDPVublAIXw/WmuTMVDmjqLnjTrKnDrp/OmlwpYP3/ZlUfk4mzq+AM002XGG
	Ipl/BFTyRyYFRUwTBaKzJfBKUVZULBnxikwjD5p4m6hBZmOXZY1ep8MwU/ORHiVkAHzP8JXgqcK
	uF3Q87x4S05vPv+o0QoiwdrDZ7Pfsbvvqno7RgTBivLGrQl
X-Received: by 2002:a05:6122:e41:b0:5ce:cdfd:89c6 with SMTP id 71dfb90a1353d-5d7b414cd85mr351702e0c.10.1790818050509;
        Wed, 30 Sep 2026 18:27:30 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::ddab])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d7fa498de7sm1536275e0c.4.2026.09.30.18.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:27:29 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Wed, 30 Sep 2026 22:26:40 -0300
Subject: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBG4Vchs3aSyqUEX8W4EOYXxkshbSEkh
 He34vJbnLNRgFcEumQbeSwadHQJ51NG3XB3PVglmXKTW9MUhj/6fi0s88iIA7xDZCt1IVZMVbY
 NpXDyeOh6TK+3v8PcPtHF34n2/QujMlumdgAAAA==
X-Change-ID: 20260930-milkv-duo-ethernet-6d73d6d054b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

The CV1800B SoC has a DWMAC controller connected to an internal 10/100
Ethernet PHY. Both the MAC (gmac0) and the MDIO multiplexer used to
reach the internal PHY are already described in cv180x.dtsi, but are
disabled by default.

Enable gmac0 and the MDIO multiplexer to make ethernet work.

Tested on a Milk-V Duo (CV1800B) with its IO base board. The link comes
up at 100Mbps/Full and the interface gets an address via DHCP.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hi,

This was tested on MilkV Duo 64M (CV1800B) with the IO board, to use the
ethernet connector. Log:

root@milkv-duo:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq qlen 1000
    link/ether e2:b0:30:2c:e8:16 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.74/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
root@milkv-duo:~# dmesg | grep stmmaceth
[    0.583766] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[    0.590691] stmmaceth 4070000.ethernet: IRQ sfty not found
[    0.597211] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[    0.607833] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    0.615538] stmmaceth 4070000.ethernet:     DWMAC1000
[    0.620820] stmmaceth 4070000.ethernet: DMA HW capability register supported
[    0.628360] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
[    0.635356] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
[    0.642881] stmmaceth 4070000.ethernet: COE Type 2
[    0.648072] stmmaceth 4070000.ethernet: TX Checksum insertion supported
[    0.655153] stmmaceth 4070000.ethernet: Normal descriptors
[    0.661063] stmmaceth 4070000.ethernet: Ring mode enabled
[    0.666880] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    0.675084] stmmaceth 4070000.ethernet: device MAC address e2:b0:30:2c:e8:16
[   14.965810] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   14.986562] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   15.050700] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   15.092635] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   15.114625] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[   17.193586] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 0e6d79e6e3a4..6fcd1d1f451f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -35,6 +35,14 @@ coprocessor_rtos: region@83f40000 {
 	};
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &osc {
 	clock-frequency = <25000000>;
 };

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-milkv-duo-ethernet-6d73d6d054b9

Best regards,
--  
Hiago

