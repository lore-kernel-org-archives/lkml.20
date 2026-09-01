Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9EF318EC5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266387; cv=none; b=Vw1ImkKbq9oIuCnr9kNz6XkRuzLmTQnKkb9kTxeqEGvjB5xXcD0JjlN81vUOoJyccLmtlC86xoBSmBuF857k6EmL4zIlxi3IbJGyFJVuMUOfmOfScNwtWrlVFu5xzqkWZbS28rInE65XYoIEKoA8wyIxFBXOzcGurTIDePJ/qLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266387; c=relaxed/simple;
	bh=Oom8w0dRGJ1TFhpbrk2DqZ3kmut1w3sk1zV/g82JgEI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VGlO/Y96sKvdzST7uINMCY0MsDf6oeyuGcs9AquF1L5gPH098Jvj3eUT84NK3SCQjvkyPnqdHWv4teWJup8bIHhTIA9iXo1b6IJWKfm0ZVjSi6le7+Rb5fvfUAFQgMGWCjDFs7/+aKc+qKjYmjUmgWm/KiFLzcFQ2bp20wm3Ju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjwY12ah; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjwY12ah"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4843f205a5bso1108816f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266384; x=1788871184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yw3C8sMhiKvex40ZPlaCVKHi3bzP8PDS+ma+yPeTqLs=;
        b=WjwY12ahrcDjPordL7fxi93WDeTrwLH3GWnLyMma1x+x7rEfH1b1p7KLgmufPOaW0D
         Gi/NxeXz/TQsQvbLmuisbmagoypd6ptCMjyLsuL4uTYBDKKvWTBavb/A1hm2NSlVLZ6X
         73EK6LJ9aPha/HQ1hrUz0h63JVWGjCIsQF1SNVErTSQ4Fws8UoJLVLVSIvh72mqLQXFs
         52iSi329Bo2VCdeen7GOl3cRuCdlQa3qNDWDZPoCtI09qVX0MDfV05uPmRbcawljaMg6
         PDrDnHZ48lxDRTyEZquXegaBhBkAlUxpe0wFWZvR+L/syPgYhRuT1zJW5WfehPx0DvQy
         wSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266384; x=1788871184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yw3C8sMhiKvex40ZPlaCVKHi3bzP8PDS+ma+yPeTqLs=;
        b=ENFE2BQ2EYv1zPkHBA95yGyyJuuEtEY3IXgWO57YDsvO+IgbwhrLPiENZYYj/Wia9k
         Qsokki8YkIqzFOXHfKhF1KycdC4OkSvbK/POMjWuPThlK+jgrxSjASiPHF76wlnoCF8/
         yAeH5vNz7Au1Bft1iskeyTo5THGFZGcDN2vZgWByEtbKWYr2zRQtyxmgBA/B7S9nifFs
         CKM1YazXfKelwoeEM0vONjOsoTNFPOhxukS7O6CetNV9rCPeTFWjl1dAuuNxPHI9vrEP
         ARrFEPDwI478sUvYk7ef0MZrZ6AGaSu63sTHnfyh/pm8JGlFZx86AgYSMRIRG7+RDf7w
         PHsw==
X-Forwarded-Encrypted: i=1; AKwUvBxTMZbm7E+BiPCIe4/bAeVNLc6m65LuyETe4K0rb8WVMm1KaL6pMAbn+M2QuosgrPyhvQ55aU8YYQA8YpI=@vger.kernel.org
X-Gm-Message-State: AFuF++lRFmS6uN4UwoA7sJrIcZdazUcm7qJFL6aD2AOtQoTXs0mD1gYv
	lxZfmClBgGgWZWx+geCcO/J4hZ6XRiF8jRhtdEsXrPAm1XrLJtEWrnj2
X-Gm-Gg: AYBFou0mClTmMO0pOZ+2X7bfaXREA40hP0TwX1NV2ozTwELC/8i49wTcXsdBeU9nCq6
	BWtP9g5uyHtK+2tdWrMhJVxJciHsyHaVjsZQzxZduwTButQBk/tlEgM5B5pkjbHAP7iMIVncZzm
	aNJbB0fl1ubYe+9fZptGl3a07dYuYoXtLq7eBtEqj1VRlMX2BxrcL20JSbkejI5xTNf5wXf051Q
	apx7HfZCeS6feWayZk4kqC8hvb7MJ1OuoQciQ1MdEsGqwVKXjPJiAD2IidyaOxBHMp/O9NcI9sE
	Ah3IpCoVj5JiVpdZVM1P/EjH4/9FUDmVxXSMuscfEI0ow/J5WZZaCpVYHaX9BpxRBMcPiZ0s5Ys
	JbEONAJmUB9Eo4ri2YquGaPvmAA+UeYMBSgSLdmx9RYsj1cm0L1WMi+j/Rhsewa2m+SJytB7DaG
	Owc3qPMpdWOJXjuMwZjT+bJFqMp5ad5tgZY2seixnnMmkz0T+7wRzwuFWNa0y1irsF1MpEGlySx
	xmrywt5iRorH4arygfc92rRrLmakLiw/2QKr0PvBKZH04QKMgA+pog=
X-Received: by 2002:a05:6000:604:b0:484:3a11:c431 with SMTP id ffacd0b85a97d-4843a11c4f6mr27280442f8f.5.1788266383674;
        Tue, 01 Sep 2026 05:39:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm4644130f8f.15.2026.09.01.05.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:39:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] phy: Add support for Airoha AN7583 USB PHY
Date: Tue,  1 Sep 2026 14:39:30 +0200
Message-ID: <20260901123933.15388-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series add support for Airoha USB PHY and Gen2 PCIe
PHY.

Changes v4:
- Fix typo for Documentation patch
- Fix wrong regex for usb subnode for Documentation patch
- Improve register example for Documentation patch
- Address bugs reported by bot (off-by one and xlate function)

Changes v3:
- Fix broken patch for YAML patch
- Split the YAML for USB and PCIe
- Rework driver to direct node for PCIe PHY
  Link: https://lore.kernel.org/all/20260827131551.26725-1-ansuelsmth@gmail.com/

Changes v2:
- Add Documentation
- Out of RFC
- Rework to Serdes PHY instead of SCU (following
  for consistency AN7581 implementation)
  Link: https://lore.kernel.org/all/20260811124724.702467-1-ansuelsmth@gmail.com/

Christian Marangi (3):
  dt-bindings: phy: airoha: Document support for AN7583 USB PHY
  dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
  phy: airoha: Add support for Airoha AN7583 USB PHY

 .../phy/airoha,an7583-pcie-gen2-phy.yaml      |   63 +
 .../bindings/phy/airoha,an7583-usb-phy.yaml   |  133 ++
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    3 +-
 drivers/phy/airoha/Kconfig                    |   11 +
 drivers/phy/airoha/Makefile                   |    3 +
 drivers/phy/airoha/phy-an7583-usb.c           | 2023 +++++++++++++++++
 7 files changed, 2236 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-usb.c

-- 
2.53.0

