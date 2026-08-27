Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A4B453A5D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836580; cv=none; b=T3KU1GuPRbjRWdjlAqZEbh700UcNWOJnL/D+MOZNX+K2qcMXWtCwOxUWpMghNgBDsR2VuUOYf4g+wXUsSoAgOlm8UVJKyThcv2b2aK3HybXhA401Yns1Y/QHYDJpQ5jYvT4jTmvLue55NTVHFBBmELDqTH+UUlOMSWQPAmMY7fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836580; c=relaxed/simple;
	bh=d17alDKmCRuWwyfr1cSfkyALNGmVJjvcCEUPOg8gE3c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hlHEEZ5L+PjT9eO57cR7cag7UMUtQAXevYjdOuUCGPJE2sCtnLMrVHbjkDqaIfo7IOw8IFCtOysVP3Osuspl3PsrsvrQ5IUrS9RRlnLk0WPU1y0qwpHOOTV0izUIl6Ybiv6kJ8on/1dbwoZvX11Ox6r8sPIh3wbd6kT1NGABEwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqIl4EHW; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqIl4EHW"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47de0093c42so1730729f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836559; x=1788441359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zau8axskQfgYwgId3j7+r2m2G5GC3NQebm9qgyCpq/Q=;
        b=DqIl4EHWPWchPYr4T5dXTZ6jOmSNMnLeh2hqT6CLXQ0KmnyIZIDV+z6hOu7ipDbmOh
         tmx8/iQaBAk7GoA5KQErxc5eYEzfkKauh91hhYOu4/sYOAifKpn50x6CLE4Pqa+EiNtH
         CrE534vmjX2uQM7EYa2D0IYbrsuJbgQTwo1Cs7dFeQVDD2WeK/0if0mtap2dsNEi9BHg
         MQVdQP5peoIP4JAgrWjRhmMl7u03Y8mg603b+6HQX9R2gHjf4x4tF5x2y9+Z/1caZ+LL
         C1Sd6hbUB8EoEDhy+0CEr83R4dG9bZFYNfdPJCg/NOYBCOUEjtbSoZfkALo+kjfVtVYF
         SmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836559; x=1788441359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zau8axskQfgYwgId3j7+r2m2G5GC3NQebm9qgyCpq/Q=;
        b=qltVtBH9sccwKXJo7mdWcACgBGXypl7B1RXQpyilFW53vLZXyNhpA1j5Kd0Jq62jd4
         3gsHEBGn8Kqr3shpYPPIKN3CG7/pZLPkIbEas07KvknndJTkT4nrTXDFn0W6vcIWgd8q
         0TRZ1lj8KA/AAhzIYdnyxHbx9KoWaraWjbHCdcjFIl9peHVlm73ijDk9562+ilCBsZzO
         QSxDK/rZbu6y8PhiunRUHVSK1cgWfAcIHZ1KvvKfoeACSJqpLbdvdFswzFqC8UzLmAcB
         K8ewe7F4X4uSiCXdUgKpwroAMEUBDai1OPnw6LYr5O9ENuKRTZfUBLXgZqNwbeNLozVj
         6vEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3VXJD/40fM0jf+GgfFwNSIT2EBNF4MWxBUU6imR4o7RJqPVL30lI52nYN1R4MGO0zR6Vw2p6XqKfe/V0=@vger.kernel.org
X-Gm-Message-State: AFuF++lEXy8GtPZl4O4Dry529C+GvixKWglx0nl32pmEgeT3P4ULQZHw
	hj7Il3pfiEEVKxBBNEQxSBXDa96lU4+eJlbUsx/2p/S+fBARLf5rF39J
X-Gm-Gg: AR+sD12kiT97K0lcQeXl6zpJvUXHM0eqactOsj816WwvB2tsMd5Crg+Bllsp+x4wVLq
	Ila7nyo5sb8EDQLSlr0IZToVipRGGN9HERavlUpFuE0Co1fvKht4/E7Ar/3ELYyjyE6bVWux80C
	su9UjjLYl8D009phPxsmZaY96p6dc7PtWhB/7YataFV4CDEznPa5zyyj4f+F70ebniC3y3WfcbM
	lF3pMPudF35yPwQh2fzA6F1yUyHAChgYUUa/L1x+tTcr9rUcwttNqLSS2d3PbIxQDriWk55qCUU
	d2k8aUk906DuxritOVUwtAa8VrOo1sLXw5PfhiACeBPQEndRydO3phn9kdcmGtib4JQYyI0pW8B
	EYBLe8eMM0yevlSiN7BxCCR4DgPD2+I0nFlEmK0u4n7GiPE45vMbuir2xOPzWxgEEZlQai33iKf
	68fHG4DyIXcs5FtVQxTQbXmMjvbxcTeiheOwuJS+mrttWyeUHPS96Jur0MTeK/lsNkdCe+LKpKs
	zh48M2VaFFJf8Pb3L4gCQOZO0pm5hHU5eRMcJBoKZhMUMzLtYlaHA==
X-Received: by 2002:a05:6000:4808:b0:482:f435:76b7 with SMTP id ffacd0b85a97d-482f435781cmr5464065f8f.2.1787836559059;
        Thu, 27 Aug 2026 06:15:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e28dc3f5sm9367192f8f.21.2026.08.27.06.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:15:58 -0700 (PDT)
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
Subject: [PATCH v3 0/3] phy: Add support for Airoha AN7583 USB PHY
Date: Thu, 27 Aug 2026 15:15:44 +0200
Message-ID: <20260827131551.26725-1-ansuelsmth@gmail.com>
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

Changes v3:
- Fix broken patch for YAML patch
- Split the YAML for USB and PCIe
- Rework driver to direct node for PCIe PHY

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
 drivers/phy/airoha/phy-an7583-usb.c           | 2016 +++++++++++++++++
 7 files changed, 2229 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-usb.c

-- 
2.53.0

