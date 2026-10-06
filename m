Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A523E4112
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282588; cv=none; b=mrQs5Tp/VWrLySwA1J7QNGb2m6VBupZNB8/5wtl6NbV9NZmQ6w7MHgxshCZ4RxBvVK5HPmsKNpJ+9cqDD6hw1V/Y/i50QicPp+j7U22BhhjilamrM7a4S7xRhauKGsAnCVAlIdiQXFp0hqecrzcGL35sS8xDtfxxdv/zEOX+uXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282588; c=relaxed/simple;
	bh=fCCMGsIdCATwcrMTmFVjngOswQXf7xCGLQnCBjdJHk0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NV580HPO+BW9f3kgBjj+L1Cac87rFMUDfvcLHhu2xwPpqWL/JPlqdzLssrN94AaZd3Zzev6gx++/uxrcuvcZ/qI0LpV/KKOixQgpFFsZW2tr/7fzPE236ItNLgTcr2WtKvmqDyCV05oswVkR5sUW1/jTf/o1R10qVTKDgJv3aQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxTrjAHh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxTrjAHh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a01933b584so4828105e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282585; x=1791887385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TysRoX6VmeGROus3Z8XTTK5G2wbRE4tAp4KLkmbW3DI=;
        b=oxTrjAHhjVRdUWRoSiCqIrTW/wPvu3F7WXupXYzfAvFvWxGussb9Q2bCQDSkvEG2jy
         9nJJj6emxXubY03Jt/6c13kitxJUmP5vpc8lAEQdcZBT2cEbzUYNbDM/a1+OcfbbLStK
         To/Lxsk4/raAd8xPPl2bDyRFnz1JDEoNXBqaPFPbaoGL64l5W9I2RscWf+gTUdwimzG4
         hFeb3ikRDOo7z3KuqYQBCvJV4vP+OhOaA7gyrSxO21crQWWI9bpsdi/ZQQOnrwqbOAls
         cAt+K3TxXHlVgj+L9nCQAacxaEKAqggV2HkDvnvN28+X9/v76zEvB3A7BZqJYDWjb6fd
         unFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282585; x=1791887385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TysRoX6VmeGROus3Z8XTTK5G2wbRE4tAp4KLkmbW3DI=;
        b=AlQQZHfPswoUicQfngrlIAPjSJ9fY4pARHxG0yMM3hd0INhH3fCmWTJs/Cdo6+/6kA
         YrKJJQxbf0GD/hSZOu+giEtZ4tCQzhJvqxv/eZffiPQ3NTPdAFFP6BQt+6Xv74zYgjVj
         foZ10C89eKRJOKEhFd+ujN/4wd62h8mi2wuIq64ZsqVwWwpXf3BadqiEj1soPHMBAWKR
         MCckdtuAGovrdgUFtn2aUuU6VazlLUpxd8U99IxAF/esbwqvLIy+ozkDAHH86GuxTGOO
         LKeb2AqD2wXqMyQ5k7iXg/uChaWFQZKtYCibGhpaMBrJogJjgeyHxUnj4/3TI42ZEFtG
         LiYA==
X-Forwarded-Encrypted: i=1; AKwUvBy6YKtoncs3t5aC1FqIYfoMNRHXpVahcQ10+21qD61HYCe84vxLv0OTYsfgrkUL1nGzMquDYkUW7HLR9vI=@vger.kernel.org
X-Gm-Message-State: AFuF++mtmnpv9CsJKvyXM09TNQL9byKScVxIo76O3sKs9DZrss3vG8op
	FUjxxKV28hcx+i15ecnCHDijpagOhYqDWD4kOD144I/GPEdK1XAYORN0
X-Gm-Gg: AYBFou398gT1V7adk5vyEM/LFOLA1d6t8PRxUYNRV+DXk7wGogqk5+cdp4hnCyNmhn1
	nx0gqOCSesC2qy6cozSZOvKch+sXwFwe0qRik2+6/9XQ5gRwVaRMFQ2+QJGh3gO+z8U2JRiRinF
	LPKtlbVRX5kmao/myOofMGptqDqBRiG+svL5W2Z65eQ1E4Jy/qQUVR9iJEUg8tuQ/bbpdQAT2tL
	XhFPwCVxRwNxvtYJdeJr1n3rk/Ed14vB9zbKn7/foiAHnLAZg2oyQAP/NxAqD3RiM6Re9l8O0Z+
	iJdyXfsuy3M3UBTAx5UCMivAdegitsaJFkoTazzWSeKuRRmi75Hyyk7d6nIBepWsCKWrm3oNR2u
	xkJuWN8ThThcWzvcbZXr0smdYNZ5HtogJ9MB22Dnd7uewQ+bgKfsH/t0d0WTLPbMoGs/xCv1fz2
	qOqXkl4Tsvwtnps4eylc81/KnBk3BnERB1Epfb/RhVbC1yswm5yDLfTIDbDjMZ3+cirzojLrldg
	vYQ1goIaDi+0ZPRXDbFs+purkLqtygqfNW4ddBIIk6tSvQKJdek7rpjEixj
X-Received: by 2002:a05:600d:8499:20b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a17b5526e6mr13173735e9.24.1791282584897;
        Tue, 06 Oct 2026 03:29:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178c33091sm63427485e9.4.2026.10.06.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:29:44 -0700 (PDT)
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
Subject: [PATCH v14 0/3] airoha: an7581: USB support
Date: Tue,  6 Oct 2026 12:29:32 +0200
Message-ID: <20261006102937.10972-1-ansuelsmth@gmail.com>
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

