Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803985;
	b=ogfjDyblP9SUIamzxYWZ5WsJ0yupNahEWI7gyuWOmh/tAkldUZUHUC+ssm0irRVQwt5n
	 9G95aI0dg4uz9j4LPZemSjxytxsMpicP4Wsic6fphANTuO6fo0mX/oAmSOHc5CaKggHEj
	 3vRIXrb7RSIu1WbqOrYXB+YL0/HMaSfyGE6ytl9Ww0ExR4OXTg0mjOQuPzhV4WRFkeuc6
	 ZPYD46VY6BWsq07pwbual9TyoLq1YxP6YjMZ91CCbZD4LpH+3R7VoRfobGZS6mnmRs/8/
	 BZOEst2/buNtxFh/s/DsSdUUC+lzrSuzZzo/bhk0/8D3pOr6X8IIidB9u47CSH9Kt1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
	b=v0KtVOR7x7eIwqHnhJKoS3zrh6nkiaHpcIRb41Na82gkXlvO7e0DFKGXyMOI98Pk4I3O
	 WY+KA1coHevLCOP0tEjh/T8v12zdjynhXj7ZFaUvTTygb523YRnAc5KJMokOVAjzLZr6R
	 Tu/xzZx8eYt7KTv5PPO6DLrNkL3dI7v0jH4R5wO1V29f2BZ6JrC9n2pvUSORuwQYl66Sq
	 1HrAJoYbQ5xcuCrcDwCw4wggVZRQPgKxAWgys1ouNJCQS4n+EaqmBS4/LWGayQumOmYQm
	 mEE6lefGHK9sSIt5+EglKaXbKIBqxwLMQgkwWd+1pZFl6C75L6r+DA574q+B5Q4fITw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TOISeKFE;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C0B606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C0B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TOISeKFE
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-675617e81f9so728165d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803983; x=1794408783; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
        b=TOISeKFEmFP1tatdWcqA8TBRZWlRhRt+52z+SIO/yPZrCiNrJHjQW2+FI1ttMCcS6B
         IqBmkeWvatk5SW/BO2DCVbVmNcC6NbAXREZusg91mCrM5uqjeie+PIGahTQJnj/q7xhm
         Al9CIY4fBaM3yn32KOzRC1qkMW+XMGtZgVhXeYUeagX1luvFS5ksP0KUiCBuwD5ZMbyP
         wEniWWY5/LuacR1nrJSOjT7Oxng3a4ElC6RX4KjgzAvxkHGTMYH0WNCaX+T9hHXEu7nS
         PBPF8gptC8vgmTXSnKlPZ5SwUolrmioXCK/gYmD+QJ9F6bPle8oWamIu65ueap3FStXz
         9LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803983; x=1794408783;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
        b=cBCwiQ/ottILlw2eHGtL/lSDE2zJuyxoYBDg6rSAQ778mYw5eee7d1yIRVjgmc4SCp
         b/WLE7EwqZKinZthk79ANqmRFN5etbvVor7kQKyQn4OpwcaT6hLINuweSPe8bBL4k429
         mWHN0ZrCTt/q7r1Qo1tU7eRdmAOVmXtyX7vdsZ8A3oQ1Oki271+N5YWT9pB5Px/9ABg9
         wftfa6guK7nUdR5Sp9i6Aj7l35Dc1B8osgzFdggG9VEsVvXnWpd5kkt9wtXC2gfuqJ3y
         7kR003T14kEf/4XGFxMBJTKXzAPDt6Yk+CSPqb9sIy1QonYmcU2vUxM8kkvnqfohuW89
         rtAg==
X-Forwarded-Encrypted: i=1; AKwUvBxTs1F3KFH8MzvMm2Ud8fsVAmhtEMuK4oB/toXVXwWsBNxtAsD0nwWdaATHNb6LGKcTi+jTJX6xV2xOGUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+acHet+sSt+6lSg+DJ+hpPEhAQrOjRRr5POeBJLIew7eeksq5w
	K2DFJpf8BQeORbL2Z6b9X7su1QZb0RAgM64AdlNleHdnn9hk3ZzaXBR2f7Ew8FH5P34=
X-Gm-Gg: AYBFou2VmgFcTtxBBz+RpLi0N2IsGlI4XsZsz0dh1VMayctg43kaFIpzZYszXzK4Js3
	fvBLKwTFy83azPBat/V5KeGoU4+ofh1bEyxXYNK51n0t9Im7vWVwCaiSjDVcQDwGPXrlmyIMdEF
	vS0YqGNvgqKzcFAlLnquXEIKp2FS1LImxoqyR7lEjA3fq0mom6ojn2zpp3PGkwjTGnlv1/QGI0S
	g1cbU4OScPbgsN/gVj//y7ijtt/CFDyyUCVBi7nL+cKUVLODm4rIwISefOd5RQVL0v5euIqoc+b
	yMmnJfOxpWiTvlAknm8C1p2utXEmjwLG8NGUyxvH/n/GmfhC6mGVwG3RMpt705wRKDXggTSznr2
	Mw67oMSzCXmAE8kHmlG7tgp1lPqH707/8O9OF1r8339hLnzuM2CNCKY0mRRELKkv8Mi0xCscs+C
	RwKGc7iCoTpVuW4zFZ9slddxsNY+3MjmOyzM8Fc+Ss65OP2cfebEU8EYYrVbG/x1RhmoKeM7GCS
	kARcljjITygeBj8r95z7jFbSpca1oZW6RnQoj7yNAP22e37WzFus3UvpqL7E7oiV2oZXiK0eIGS
	hOXATdPQqMSgADP44Zilgrz4idSXzC72SxUykWeBEhRAP6cCOS3CY4a78xrspQzrmdJK
X-Received: by 2002:a05:690e:80c:10b0:67a:7b76:a5b2 with SMTP id 956f58d0204a3-67ba50235b4mr7893297d50.99.1793803983078;
        Wed, 04 Nov 2026 06:53:03 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:01 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Subject: [PATCH v2 0/2] riscv: dts: sophgo: add cv1800b ethernet support
 overlay
Date: Wed, 04 Nov 2026 11:52:32 -0300
Message-Id: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr2Jm7ZgWiqAr72FYtGWQUaCmhUZCu
 LuAB3D5kvffnyGQZwpwPczgKXJg16+QHA9gG90/CLlaGRKRnKUQEjtuXxGr0SENDbpIvtUT2jr
 P00Kpi1YC1u3bU82fvXsvfxxG8yQ7bLHNaDgMzk/7cZSb9+8jSpSYF8ZKlak6zczN6Kll4+lkX
 QflsixfiH8Pfc8AAAA=
X-Change-ID: 20261001-milkv-duo-eth-overlay-cf7738449a40
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

Hi,

The first version of this patch added a board specific ethernet overlay
for the Milk-V Duo. During the review it was pointed out that the Milk-V
Duo 256M already has an identical overlay, because both boards just need
gmac0 and the mdio multiplexer from cv180x.dtsi to be enabled. Instead of
adding one overlay per board, this series makes that overlay shared.

1/2 renames sg2002-milkv-duo256m-eth.dtso to cv18xx-eth.dtso. Only the
file name and its comment change, and the composed DTB for the Milk-V Duo
256M keeps the sg2002-milkv-duo256m-eth.dtb name.

2/2 composes the same overlay with the Milk-V Duo DTB, adding
cv1800b-milkv-duo-eth.dtb.

Changes in v2:
- Use a single shared cv18xx-eth.dtso instead of a board specific overlay.
- Rebase on v7.4-rc1.
- Link to v1: https://patch.msgid.link/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com

Testing on a Milk-V Duo (CV1800B) with its IO base board, booting the
Milk-V Duo DTB with the ethernet overlay applied by U-Boot:

U-Boot 2026.10-00013-g3c998cf93c4f (Nov 04 2026 - 11:35:44 -0300)milkv_duo

DRAM:  63.3 MiB
Core:  22 devices, 15 uclasses, devicetree: separate
MMC:   mmc@4310000: 0
Loading Environment from FAT... OK
In:    serial@4140000
Out:   serial@4140000
Err:   serial@4140000
Net:   eth0: ethernet@4070000
Hit any key to stop autoboot: 0
** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
1:	Duo-OS (Milk-V Duo Boards Distro)
Retrieving file: /Image.gz
append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
Retrieving file: /cv1800b-milkv-duo.dtb
Retrieving file: /cv18xx-eth.dtbo
Retrieving file: /cv1800b-milkv-duo-led-blink.dtbo
   Uncompressing Kernel Image to 0

   Booting using the fdt blob at 0x82200000
Working FDT set to 82200000
   Loading Device Tree to 000000008355e000, end 0000000083566fff ... OK
Working FDT set to 8355e000

Starting kernel ...

[...]

root@milkv-duo:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
    link/ether 0a:6e:82:b5:51:74 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.68/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
root@milkv-duo:~# dmesg | grep stmmaceth
[    0.500755] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[    0.500827] stmmaceth 4070000.ethernet: IRQ sfty not found
[    0.501156] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[    0.524693] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    0.524795] stmmaceth 4070000.ethernet: 	DWMAC1000
[    0.524819] stmmaceth 4070000.ethernet: DMA HW capability register supported
[    0.524838] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
[    0.524860] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
[    0.524878] stmmaceth 4070000.ethernet: COE Type 2
[    0.524896] stmmaceth 4070000.ethernet: TX Checksum insertion supported
[    0.524916] stmmaceth 4070000.ethernet: Normal descriptors
[    0.524935] stmmaceth 4070000.ethernet: Ring mode enabled
[    0.524952] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    0.525082] stmmaceth 4070000.ethernet: device MAC address 0a:6e:82:b5:51:74
[   12.726604] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   12.752406] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   12.792299] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   12.826448] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   12.826535] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[   14.892433] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hiago De Franco (2):
      riscv: dts: sophgo: make sg2002-milkv-duo256m-eth overlay generic
      riscv: dts: sophgo: add Milk-V Duo ethernet DTB

 arch/riscv/boot/dts/sophgo/Makefile                                 | 6 ++++--
 .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40

Best regards,
--  
Hiago

