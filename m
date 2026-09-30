Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF8F3C276E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752718; cv=none; b=pm0EtRJ97ySYskIra/YGzGG9ZDQrj3VgMUwmExiOjSLpLIhkFMDNWZCjoZHeGUb//2KIrV827gtuoSpruZko0NSaQ6PiYfdQXwgbakbKGVOQ0KouQDvAArltcp5u9ppSwLdH70yqoCZXpJegWC8mBJQeAICT3aNlpxXqB2xoz00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752718; c=relaxed/simple;
	bh=GMtjND5ptledmZaDMH/T9/dH+V/0E+i0Av6Y/iGEgXc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lyvoo1KvyHV5CXGQY3IgIZlHXqz+InjFraFZBj5MJiCDEYDOYrTV0e5NolC/V2OK7a1ACnmlMUffdMbVyz1ISB20Q8Kv6jqoGeD7+teRd3QmkC1rDBJKuULBjyrA8hB6lEYU5piuZ+VsjyXhPjukeBZs184CH2GGg2fhLeVtVXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpX6NTGl; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpX6NTGl"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so4320083f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752715; x=1791357515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5Ar/J3lXFwxWphKUtD7c9Gh3UMYH3kW8PbvXHpvZmY=;
        b=PpX6NTGl0ts5aj4P/31JOamR9oEXSWIZcZZwz8EAiKd+HyJ150vMW2aho8dS95Wskq
         5NhrpTw3b7cYLbaIx8RcXNI1LyfNU+AQrNjkM1JU2CB+AsT/hrLBvo5bspyOEbSLQ2s3
         ICpZD+R91rSioVsUdUjYkz8dfuuIyAVnF65c/MTDDZyo45anbSy6y7FXpWDaeNHJzUUM
         5znv7TslxqRKsKVmMPzH0U8LZ8uHvokhpwYfcd7gDmHNzVSIAVwBcDpdLXOLA2jLgEUD
         Kb+0BwhfzRSTAF8Ew26CTg4zHFzin+ffzUdFyYRgTRaV+LoDvFdn9PHJij/DbOv3WMYD
         6lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752715; x=1791357515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y5Ar/J3lXFwxWphKUtD7c9Gh3UMYH3kW8PbvXHpvZmY=;
        b=bZrkTZbqOTa+pWvY/3SV0HyWSTRAsSjwoB975tdU8wzukCvijhEWRR0qDc4wk7Dpju
         6BJDiEY0JyWXeY1dbSfOHThHfpuhLDNnauC2P+B7z4B4iGtr6KBbpdHiUDpdTYfdCLek
         GHKTosOnO6U9dkx3Aqkhv0fObKHyxTrMLjZjKcqCkUioxsutOv2kTFGQkf5z/HcGRo8r
         Ic5TW7hPOXKIN57y30DYZ5uZwWofRk6itMcTB84Sx25yaBpmOMdTim1EghwyYfyhfpYe
         SPGNpoL6rC16ku4ZOK+K1vQZhAEN0ev4Xi8K+fcuf1SmUZiGLwKSKGG9LxqahLv8kbG3
         gCKg==
X-Forwarded-Encrypted: i=1; AKwUvBx7TJwNET93nBRkZvOp/uMjAy3MoMoLWmjZQgU81ULhMq/Hi6X2vcv1zo+82TLVzfMCC8eG3zrFQBSzLmA=@vger.kernel.org
X-Gm-Message-State: AFuF++miOZ6lqL6lgEdFJQOnPxStnEiP7QU0l2UvS9tcylJpQupU6Ja2
	PfsxlFEH55NKqC2pT97alf5HUBlRcTRC9viblGcnvqC3P1Iqqszm6zXm
X-Gm-Gg: AYBFou3aYyTOEGFVE5jGlybq7eq3OBx0+72j8aX8Vd7aPFlfQg6ZMGZT+tRtR1U3fvD
	eiRIBmvScJ9dgL3Sd7DkPEAklqFAwf2q20zmSd2/Nfkyb30sEWC1RrO4BL5s+9UfBSc5sx3xWUc
	MF6TjprBMwqLHSGrzXjTsC55yvGRJcEYMuLLvH69nrJ1ZbIFY913NllkwSv0UVhQHvz3yEKrSXL
	F7yqFSt9aiz+36xPpdy9qkNVLNRE2yYx6zzV51/xqG7XMjDL5gdqNbKLIx4LnlhDa1NTWD2P0EN
	RFWIzejGk6dEjENRE/oBWggZqyOPocZodrWqCnORcOE3qH1yqzLo1UjldLszk8ajMbM0c7xFjo6
	bHmHcoJJbLk4AOmIdz4qDCMkl2INs8FJ68xCs6yyDeKIpxnRyvkTRWpIicTXMcWxcjuVXoudh2g
	8pJ5ONb/nvAJD9lwR5WQcSjMai8uBs+szoH+IoXZa6Ed5COU187HtJotjI/asnWq7aZZ+fZcdiM
	SJ6LbEBnYrXt7ZKMXSSCBndCDjbIiw6G90IH6c49WNQSXw53mhw2AxG5PiIs3LE
X-Received: by 2002:a05:600c:3486:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-4a01ad9847amr4981855e9.1.1790752715090;
        Wed, 30 Sep 2026 00:18:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e79e4sm10590905e9.2.2026.09.30.00.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:18:34 -0700 (PDT)
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
Subject: [PATCH v12 0/3] airoha: an7581: USB support
Date: Wed, 30 Sep 2026 09:18:16 +0200
Message-ID: <20260930071826.48811-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  62 ++
 MAINTAINERS                                   |  11 +-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 9 files changed, 665 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

-- 
2.55.0

