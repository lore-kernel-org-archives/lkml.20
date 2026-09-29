Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C373019D6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647743; cv=none; b=cXm9hacgykDvJ6nSvZJ/rK5MKRwSdSb20c9iYgAK9Mq/UpxDgH+hsAtTBoase4Zhi+yVcKM17twd2TwA1SMgbGZb6IU/w72s6iw0tJbAOZFEMgHMdZA9R3h61zjcrB2ubmAvnt+tRYbqtzC2HrT76uGZ4sl8Ws2UK/a9NVCxNQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647743; c=relaxed/simple;
	bh=1jWnqDpKjpH+RAsb9b6dffOISc/Qp590FeLfeOae30M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HE3yXi7CXsA/gdTMObJe/N/GtcUXXPk+nb8QpJTojnG5hL/SnHItUxxi/H9KZ6Gf97ZIJbu7JlKxDfOXr7g+obxEaM9InaRfpaahvL1KHhyT+m6Z0js+qgFLu+OfRAkSnSCTuraOsuoDI3jqShtcdS2xEuFV0ylOmFii51C3s2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjO/JwcU; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjO/JwcU"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc78d45f78fso2161528a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647741; x=1791252541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFE9LdtdYAs5eAg39qz6yH1XbrxOARGWKf2glnJZAQo=;
        b=pjO/JwcU8b8mJhh4+8/ONUnYt6gAL7o7JKAM2q3IEXAxkbhV+LMhSHyiE1F2g9gJ8g
         IvdcqxwaXS4tNlCneEVssViV56qnDMjuNsX+raElqxP50ZZ3iwWXwvl3pppZ6SKTfufy
         i0duuwPt29XYDS05KDBdUP088l3OKfqRO6qbF0ZV4lH3BTmj06myj9gcIykBfEkAJHhB
         b8tIxjSgcz5wssuSQVISbmVoP0Gw2RPRw5+j+eXc7cSqw7SKP7ZSTKCF8gcfeCEFs0qs
         FWYDaPLo10+q+oWcMDqNRqQMazN0TFRJ/u6Y3JeQu9XmQ/aKwRWsqFfktVY0i7SBB2OD
         ilvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647741; x=1791252541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFE9LdtdYAs5eAg39qz6yH1XbrxOARGWKf2glnJZAQo=;
        b=EcrACv/giNWvi3mWwT8ACNVWvVDL3XvPK1C8FfC2wsSmMI84BpzBmst/rIPy2QqyWA
         AE4ay7kD4OlvJq8ZeTJEY7fEkeuviOPCMBDg/aKPEE+gwYCLdrva60vw34x5Ic4H0S9C
         c6e9PjVVQdScojngolCw88ntPyUsERvAkRmdeg7LzYj41GSgx2p4aUCJXUOPxg4sHuLU
         TLDzlvwGYfR03R9rOG3DRVRRRpYJ8eIy1gyfaBol7pKfyvzN9q3NFxEW8PmcFqcBCkS7
         EyDHarEFRkw3PMgN4Cc5fVxcSuvp5HSBK2+ndRv11i80EvRhmHW9eXn+1TZWzz+U4wH1
         /bng==
X-Forwarded-Encrypted: i=1; AKwUvBzHeHGej9jQweEletVNC+1CZgQ9tZj2eWMR/8Icv0REipup0IHOfqh1Cvl7ULK6BOiU05flGk/y1qdyQl4=@vger.kernel.org
X-Gm-Message-State: AFuF++kW6GzhFowZzlHTU4AKmRJ2kc4+9VI6BW62o5uzjegxN6FEPIzP
	jIer/3gtOa7vQKB5ceoVliEPc5jewxmwF0DYSmnAXwm9W/9dHaa3JELZ
X-Gm-Gg: AYBFou1pNoZUJqRgDQy6xvwi/wLozgY/XTnnTSzwsyghHw4+fUwQCM3RZiPoW4iIYR5
	n1iwyb1cqNQTpBermwos5+zg+ho2sFu6FspgLfB4sKqExgVZoVzF0fYZIr9/446qvkSSz0r4LCI
	Z0jAyJYdoQneTBOIeIs36B7JtWCBgIRhnBfYA7IwYJCIAgijY+SkNIx/VwXhNULRGGlmVht7p4N
	dmPNtfCES5MPTKJa+4llrgRpmuRRQDAVuLKL0wTVxJQrExPCJdceJ3yjSeVpazRxH52FEEulxMM
	BXCCJiNYiZSebKCwc2TZNe0O8acJhvSmVHzP5/+yPqjbwu9qXnPzQqPayhcHXVx1hjhf8MbXr69
	htBe/7dwC/oL2Kc23FxIMlR64fmq60HdEj/IWhoXBQZoYROp4GkajcdtDj/RnJk0fPsv+K62Y7I
	sGGQoWcLK2aj3quJCMPyko9p/I9QtVZ757rB+QHGg2gQ4Baav20IAkrNakB6UtQ+6nuY5dquCCw
	Ss+gx55aCRfQmHxczLSZz7oAog1rLvocPLiAyZ15yK1zYjZosfzaUKV2PZfkKiR
X-Received: by 2002:a05:6a20:6f03:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3de0e6f42a6mr15736585637.1.1790647741047;
        Mon, 28 Sep 2026 19:09:01 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm5448596a12.32.2026.09.28.19.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:09:00 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Tue, 29 Sep 2026 10:08:51 +0800
Message-ID: <20260929020854.1282339-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v5:

  - dts: rename the hsusb pinctrl group node to hsusb-grp.

  - phy: keep the clock-stability polling when SUSPEND is already set,
    per review comment:

      > +       if (val & USBPMISCR_PHY_SUSPEND(n))
      > +               return 0;

      Please keep the clock-stability polling when SUSPEND is already set.

      If the initial polling times out, SUSPEND remains set. A subsequent
      phy_init() call will then return success here without checking
      whether the PHY clocks have become stable.

      Skipping the reset sequence for an already-enabled PHY makes sense,
      but both paths should still check the ready bits.

  - phy: clear MISCFCR0_UHOVRCURH when nuvoton,oc-active-high is absent,
    per review comment:

      > +       if (of_property_read_bool(pdev->dev.of_node,
      > +                                 "nuvoton,oc-active-high"))

      The binding defines active-low as the default when this property is
      absent. Please also clear MISCFCR0_UHOVRCURH in that case, so the
      configured polarity does not depend on the state left by the
      bootloader.

  These are pre-merge fixups to patches 2 and 3, which are net-new code
  in this series, so the commit messages are otherwise unchanged.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 286 +++++++++++++-----
 5 files changed, 390 insertions(+), 77 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

