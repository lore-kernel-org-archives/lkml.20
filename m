Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735062;
	b=zlrbfGkDCrPTadGzlL3Km88os+R3QXzJsPEvsBzXJY6I2D7zE4UOjxKfEcGxG6/qcWkx
	 E7WvfoyLWnkfAquz1K68h4+GrMcXGXiYm+VnSN0IyAyTgq8cRwx4VYCc+emeyIPtZxz6e
	 z9fuDD8AKQCzivha9euBKM4QXZa3UX7sO/WyOyNb4dMKYT0royf0uFSZ0hlVhxp6zAShT
	 rwBFIoMp94X17J7g91BlZUy8m2KOdZpLtRz6GQmTI2zLj0z+WZyEI5BA9g+2nWbV8tm9A
	 VAh/man6tDmNJr4/IfSmpcmRnPgP5EjYdoTnq2tnGPPEKtp/yOgwjpnM1ga5VtFKrLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8y2ryjp6wjnywAYuPRaVBggY6L5+h6mqO8ONVPtZtiw=;
	b=ulBSzQPhhzstx0CdmnZCDEcr/m2mG3DLhbwZmVlUrp+1lB1bJxQnV+3gBeOKOwE0hjKr
	 QZ59vx/qHK8SY5lVBib6b7HVTBsd7m9wB6dDxImfHNUzgoqwNU7nyClUBioYbCW9SWSRz
	 +GAmUHZSYAiAsZEVy4NWPruWaJVeDbdw4s/cU/LDx73+JiojjFyDxlHliCQrGFhVrINiF
	 0xEd/1jAqhUS9/NxK0h/7KH12yKYyqDMjcRQ2or1LItgcbc2qhPwvexAMZveU1bduaMjh
	 aKSt3DnpGNZ6aHrcT3rpt24Gl3WZyrurYTmSUNHn/Ij3GFh2+Rcvhxa0kwbTi8ZrgAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4Y5Wz4t;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B100F606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B100F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4Y5Wz4t
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so36442785e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735060; x=1794339860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8y2ryjp6wjnywAYuPRaVBggY6L5+h6mqO8ONVPtZtiw=;
        b=S4Y5Wz4ttEvlFn0EnFUq17+YTd9tlEB7totHz0okQXC0T23Xfa4NCIQ7ccGRuofA+C
         A+XO1qt8lMfbbd1Aww/F0872Uz/95eiu+i1Cn1WIStC+OAImprOA0KCgcmrgm9oKLTZe
         wNqYmWHxHobyNrwEyJHl3k1W+1SK9paxnTI9MLzuV1OtD3nBVMl4GAnGHkE0JEIAjpmb
         Qc9xquBn/6mM8mj6+y6YmOeKSSS3XXIfk9LODOL5maps4EhUR4vxj2jNMThHQi/mSQpn
         ZegFP4qBNSiTTuVS0waRaO9qWpSokUG81fYLyISerWBUaFXF7cN0DNnUDUnQP6g9uyCw
         ZvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735060; x=1794339860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8y2ryjp6wjnywAYuPRaVBggY6L5+h6mqO8ONVPtZtiw=;
        b=BCwOanV+iqe5InDtLBsii2BVvDFiO03CDpa3Ze5ifoNNtBvb2YDbQ6UyxTH1JZuY5j
         QSGu35BXVYVA9af+yIwRdtRBFeX4G6iS7u9idGUeE9O+jQSbtpK+5et+kBzt7jUcZ4nk
         KVU6BIr6Yi5MOJJ9UpUfgEcpjkiQJKmR162JATN9XTlwOQh7B+4ezATapZzR5qYauKwZ
         xvQ6IZzvJV4Pn9MTE86TjObx+0Hc3bogrcmaBWN3OhMom1Ebr0L4N4tRbVq1DM0AtHu9
         H6zVtUwA7G1hZz3f4jlveQaY/bhdcxsg5hF+bdKsSZFE/aGFi8sGMQGG8/VXPToSQ5oC
         uzEQ==
X-Forwarded-Encrypted: i=1; AKwUvByVs/NM03w/sdyRlsGY/nJFAOZbdXRhYqYJuZ/EsT3OxK3PK+C5vs/0yCMqF7BUPQ4P7xBj987HL+7rjag=@vger.kernel.org
X-Gm-Message-State: APuU4Z/alWKuXyqimaZRapW522lHYnDobml1TW26Ork3BcK2tSzTIoxM
	2Z1id0OSsLFe7YDsN+Zfw7lxXAM97i1SB4uFiKt+nI/7nTFHI4WoFCCBkrciqA==
X-Gm-Gg: AYBFou3WeSboTDQSCtyB7L6SlvH3GToNkj8q7zYLb0yAzQqbFicXlGoEJTIFTb7G8Ud
	xMMH0pC6HKbfqjXPuXkVegVgBXYgXGzrgZ8KM/zrSXOAtudvhRVo2UaRluWNWHhSBh51KPSbMW+
	okYPObIP5YFkpM0ivB51PO+R5dVSrGEceJq9lfihmbIM6+W19aqDiDy75RkABqZleh1d1V8Qqk4
	Ymms6SZHDBYgAyaXy/kLhY+kifkBuGsuToWBWXYJszSJaotaaiIWCSftsUhI6fSurVcvwWJiPOx
	PbWfjEkOZjd+vIBizI+DymmD+MsNNVIgffXIXvqORAVeSAiHZSMWa8yq1g4YOTMUy0P4LROVfIz
	/oHCHaCPCDSAzLq82x/r0yg1dePsOOp7ahLjcgpPGfT8jt8ZewcxxkQdz+eqtkigukk/MboX8rK
	zzsqbts0IAtIO1/Z0kMcozi9/ieW8ns+DZz/LICsBlKhj1zUE+JF9f/4GzTvTLB/PAjHZ06bVUR
	MODdIarm2SFsBeUGRe1W/PqBDWYIThybkVfBjLRSB92hvTRPWinKZaXiKJ3zV81AGL/newgX4u1
	Qm3rB5zOIYVoDnvNq233b3oiHSAp4Qo5+FB5W9VvHA966MN8TCgOmqNoUWVmIrXb7wBaUlN3TNQ
	50mm2my1MDACRoTsM+UKzP6NSSZRtLKEAJfYyQQVf8FjjGQtkzD4J5jo=
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr328108365e9.27.1793735059988;
        Tue, 03 Nov 2026 11:44:19 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm82557885e9.10.2026.11.03.11.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:44:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 0/3] airoha: an7581: USB support
Date: Tue,  3 Nov 2026 20:44:05 +0100
Message-ID: <20261103194410.6632-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This is a major rework of the old v2 series.

The SoC always support USB 2.0 but for USB 3.0 it needs additional
configuration for the Serdes port. Such port can be either configured
for USB usage or for PCIe lines or HSGMII and these are configured
in the SCU space.

The previous implementation of a dedicated SSR driver was too
complex and fragile for the simple task of configuring a register
hence it was dropped and the handling is entirely in the PHY driver.

Everything was reducted to the dt-bindings to describe the Serdes line.

Also the property for the PHY are renamed to a more suitable name and
everything is now mandatory to simplify the implementation.
(the PHY are always present and active on the SoC)

Also other unrelated patch are dropped from this series.

Changes v15:
- Rebase on phy/next
- Add review tag

Changes v14:
- Drop blank lines at EOF for DT patch
- Fix SPDX tag for move patch

Changes v13:
- Rebase on top of phy next

Changes v12:
- Rebase on top of linux-next now that clk patch got merged

Changes v11:
- Remove clk patch and move to dedicated series

Changes v10:
- Rebase on top of linux-next
- Add review tag for DT patch

Changes v9:
- Add spinlock init
- Add ack tag
- Add review tag
- Add additional comments for phys on USB 3.0
- Add extra logic to make phys optional for USB 3.0

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot
  Link: https://lore.kernel.org/all/20260520150912.11614-1-ansuelsmth@gmail.com/

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/

Changes v6:
- Fix kernel test robot (sparse warning)
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v5:
- Add Ack and Review tag from Connor
- Implement Ethernet support in the USB driver
  (testing support for this Serdes on a special reference board)
- Use an7581 prefix for USB PHY driver
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v4:
- Rename PCIe and USB PHY to AN7581
- Drop airoha,scu (handled directly in driver)
- Drop dt-bindings for monitor clock in favor of raw values
- Better describe the usage of airoha,usb3-serdes
- Simplify values of dt-bindings SSR SERDES
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v3:
- Drop clk changes
- Drop SSR driver
- Rename property in Documentation
- Simplify PHY handling
- Move SSR handling inside the PHY driver
  Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/

Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (3):
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  61 ++
 MAINTAINERS                                   |  11 +-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   0
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 9 files changed, 663 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (100%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

-- 
2.55.0

