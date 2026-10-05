Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C5D2EEE66
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197752; cv=none; b=Ft04kxq8wRswsYfhDpd/2RLyw/tIABU640BcwT/WH/6vrWw9TZ39cKgj4xSB3Qi8lBFD2US9PEgTaSFWTRZANq3sRjmQOR94Ur1AL5imJTRltLd36eLhHisHeltgOLCfO6v0ruJoxoBEN4YYPcZmLEKbRfTWOxqcS+52xGytOd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197752; c=relaxed/simple;
	bh=lGVhjV2tjKftFwUx95gtvvwB+isDG7r11t7k/FTUtxA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uWD72EFDgU9nYDsBq+5gd8hoLx6bXOpxaItlUY6Gbt99l7Ci1rVMdBmW3tR0Kof84+nhiSP7iF+C7VIkEcZWb41dUqZ/UKrC13FQUJmmKQI9UYkQ+8nIJ7sySM6M8CpBzbMktwbjbfm57/V9YvT9tiSLPucJ2HXUkcC53OqmWWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbPOdgjO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbPOdgjO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a1681949b8so9402225e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791197746; x=1791802546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hlkJmoCvYYM7ubGBabOJCCJ2BxpKb+wkgUf28W1Js8=;
        b=DbPOdgjOHk3190XQColsM30BNeJDHrgqWwdHIZEzQ+arOTnNPESO6Yuw6zowVChkyP
         DqmoGGYJ8uynWrrhaGvkUpv/HLr46c1lXeW8vyiaH6Azqbj7AmGSnwzShmbUZuG0H1G4
         dYaNfAx1+IEPNPYEy8L9ECuenZXqA1GBGQ7+BJClcDRGugTVcGZ6X9w5xaaFxcYm21VX
         aWGD1DCNUdCXtOtpjYx6rrTXnBRGbnc7MzbNxp02wXBje32fo0CnwyBo2KrRoG3zD08N
         PnRXtcyaNK4WZdXlnmnUYbsTka1tShXzl0daRAEB+5lD9FsWmcEabAipkiw7NSXz14K+
         P/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197746; x=1791802546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1hlkJmoCvYYM7ubGBabOJCCJ2BxpKb+wkgUf28W1Js8=;
        b=U8Qr14O9I6gmodu25PKykcGmA3HrEWxAywJB0+BhDjTsR/AnwTiDy+Qzc8QYH+WzT6
         JcnGx72vPr70wAhl7PxWFshClMFgM3VXX9lX4yiqVcPTV724TULtIAmMhQ3HQsp+jzHA
         0JwdHyDL397OmdzrUIeR4XAsBV0RcwxjZZ6IGLGKnfH1OapOAWwXIluZ4Ph1njKPD5uv
         QerM+NzzrnXdsbN3uVtnyzzC6l0Vr5rMa/KmQuKHgzHjuK+DdvPpXZ7pYzKotmgBpYWd
         1k/3wTjWmb6IKvhvesYevgVfmjx4q4ihlOLpzaf0J5EuiRMnu6/Yh6haxQVFnac8az+q
         DZ7A==
X-Forwarded-Encrypted: i=1; AKwUvByOYES5rKOox6qPnesSUaFsT75F4mWCf73SP80YGhSBjVoIkc/Vbsr8fCkd3VbP4Dm/ssDOrecjnK73yH0=@vger.kernel.org
X-Gm-Message-State: AFuF++nUNq5eu8hpMH+6OU2dbfEwrAQwU6PWbnlP/ezxpw94ki7lGCIQ
	q2ob+3gaiSh/gLQ3TyBG/H1t1Jm+M7n99YnKSRAPr0VXbhq8wRQ8LmvK
X-Gm-Gg: AYBFou3mISA/Uimax2XRr7aD438hevZkL/zwbXALeUck1Q287ROFt7ezl+y5d95uvek
	z/miv19S8v21iSDCaSpC3U/HxjYf/DhUNyszKO7/WwWvKtX5I1CpJme9tqIlXT1bJuJm19uZ+ol
	ZXGN0xVdA9jw8vwEswFYww4PLfT/OBhdyabQKfrw2ti7ZyE0WjXyJ0MBgBtSel+ttOEZnHttUkI
	2gKI7aiARuaGYJ97RHmYEMED98PwI6yYo7WVZxPz8IdVSzvi8fYo3V8Gs6cQpBjti/rbbsWeIw9
	xfDqg/w5kZM5yR99kJ1vixIhoNgtiiYwfB26kFjFxC6AuYRwZOlHTfHk3vYmuUxW62THaM8Jji2
	STogL0wf43HMueqQw8cmBvoY1Xij+kdC7x1A3COnWtxTEgSkYRvoaijleerR2PpFr/1DftGQy6Q
	fbjbC0DpiSKFI9ztAC/nChseuLm8JZTs0Z/Kp/kKIMHCOx3a8070JrxcSi1ZHuYK9W5GfPO6RTm
	5mSHsyPWrf0reT+xdRCZ2SR+3mbz7dxGuNcehaW3dfGm/AE28AzaBbJm1caSeM=
X-Received: by 2002:a05:600c:3ca2:b0:4a1:70ed:882b with SMTP id 5b1f17b1804b1-4a170ed8cb8mr49669315e9.8.1791197745850;
        Mon, 05 Oct 2026 03:55:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm270319635e9.0.2026.10.05.03.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:55:45 -0700 (PDT)
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
Subject: [PATCH v13 0/3] airoha: an7581: USB support
Date: Mon,  5 Oct 2026 12:55:29 +0200
Message-ID: <20261005105535.2472-1-ansuelsmth@gmail.com>
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

