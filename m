Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E193418373
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134756; cv=none; b=qbctm9WngFBSn22wpTBEp3xiIzwuJF58zOcRjjncie9wA17X7OQNApyzb+10CBU3aPppFN3ySmZyVj7Tr2CFaPCfjCzylQTK+DqBgvhP0TaIZJ8AtWzc/ZIpZuRFUfhMf5RFKZDFtISmarMPXTnxqSb6Ox7AIq5Qh49itVnqCTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134756; c=relaxed/simple;
	bh=nUBV428k6cb1/zyNyUDW1FBpsf0H9Yc45aYCz8u//xw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=aqHszoLEND+AhIOIKE8eXHvSn0dSCiucR1oRJ8YLY4991xaiL0Ro4cSdlFW/u1BGXG7FxpKo2Ebl8OAnDI1wryUwLB8ui7qm+KgGFWxkoeHi74TqDVlYyIJmvB8wi0qBmRKh6ePedREYvsuwZmxm1bvZY1xbkywXvmC9UKFvcwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQQSG1wt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQQSG1wt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18868585e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134752; x=1792739552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0i4EWzFPDrCBGPxvUTW0hZsml2U+08zpz7E33Xi4YAg=;
        b=eQQSG1wtUIXTCkjwMHlwAdziWliClkLoVDpHtsONEI+DjWnTHMe/dkaY/s84fxvjI+
         /d7CC2ELrS0UXa+3eiVDzk3fdhwUHXwUSsO2YOki3VP1n0d8SCyNf52eBbFugGenoNi5
         QpyCbfYr4EPlvjZsJvuU4fqDok2sTXikfjtJPY2VKTzNsEkRY/8rOxyWmcTWSperF/xF
         ZZpOQ4heUZITNUq2y6Q3VAim4v0agzt8JdFv315UhobDoEQBDoZ7q9Yg+WH6dAT9USu3
         EnAXp5/S9Rz7rwpW2/FsGP+rr1tHq09cYf9QOUc4y/0xfjoj7zAxHqeAIPoamqUZ4YYh
         1cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134752; x=1792739552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0i4EWzFPDrCBGPxvUTW0hZsml2U+08zpz7E33Xi4YAg=;
        b=KmjUIF+dXYrm+gg1pdx6PDI2DxAdCpQ54kT2xkxy+LqNI+EhVr8STXCfp3zO9g3fQC
         2R1xnecUWs1VtyJJWvH9ge1BHhz35VWaCKYj+ZTxCzyhbYa3hM5T5KbMHoebTT6saaji
         E5zOfwZIenWStjGwzsJLuw9Wwtg5z1KR0RJITehmMJF+Z/bDXJNS4qxGgihovJtxPaZs
         OuM7Rac03L5ObWgR03ioGVbVikR7vFy1asxuYr901tDMKr0lPkW0jJrDhED0roC7CFln
         aZ0UVmQoT7jgqJhsZtZ7bBU0XP5C00j/QvRMzygnyxxHeVO/8H09xkwi9rY9oqI8tkTX
         NRYA==
X-Forwarded-Encrypted: i=1; AKwUvByF1OcL9j3tVIBzdQvNtRrOCiTozNv2Rlm9HNS2GfsZsAb0hHWJ74mpWNi0GWIPdgD97G7zYpgdoZeD+po=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/ouLzRrJAXzXjhy8zh5gdc1r8LRRxgnuW7J40G2JOu9Q5MW9q
	hyGawm8hBs+ne8uKW9Hm46LBRnQpMq6WIoVkMNR8Bg2SfduB7PezIoZ/
X-Gm-Gg: AYBFou2bEP3aR080RVp3X6618tydwF8jdqkUrZRVorZiEw35BVYdMbkJryPn/Ocdf+7
	LumBqtfJoa5sLpvOABUL8EtKTfqDuYwUmIajWURnYOSuMBJLfBUUyvYJQfgKCL7fSJ56x0CIpBT
	esUCCs5DwTKNY3a7k6G7j1ulHMx+BIncv5+MajkuGg7tDJ1T0wPlqFNV8PjzULyiVZP5ziiMPzm
	aRYeIYPkL6DD4Q2tqP4/rW1PWj9w4vvq8AcazRumg/9jKDyX7Is6+MToQZGwC0YdMsQcqqPiLPs
	ySCpzdWyizLQdf1WiS6p8EgXCPC8wmqLKlKIDQHV6mPhMA3AJ917qInbx+N/049C09fyjsBES5a
	gqCyWt4OPQhnZ87xEaeT5Jxi+T43GIwSYxKp/7hhmEmiCnb33dq8Fv3b3Rv9tTUnVctPNyHPfdQ
	X6hZ2nu6tVtN+nKnMnMW3w/80t9ZX/BCChm6SYDAmGt9HAnazxEd6b1GCuF1b8traTS3YB+PysX
	8Zhy+Inz9EyaAKme45feQ72BxMav0BMnbTpLHCB+9kj0Ymq2Z/IxRPr7JJKVZf1jU1HqbO1zItM
	TBr4biUwLAxiJNIfJ7NkO4Ck
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a18e4a7839mr459117355e9.25.1792134752197;
        Fri, 16 Oct 2026 00:12:32 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a1b377sm61802015e9.0.2026.10.16.00.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:12:30 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Fri, 16 Oct 2026 09:12:22 +0200
Message-ID: <20261016071225.2092-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v4:
- Add REGMAP_MMIO to kconfig
- Better handle exit
- Add additional info on QPHY usage

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  14 +
 drivers/phy/airoha/Makefile                   |   2 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 823 ++++++++++++++++++
 8 files changed, 1292 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.55.0

