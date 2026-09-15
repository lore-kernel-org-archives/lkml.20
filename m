Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3983EC822
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441849; cv=none; b=femoz3xaJtOfg2CTvPTePTqIZpdiK0lRU/qeI/EYzNxmt5pG3VIHA2B5WCUUDN1+r0NiFb2belZX57j1SlnXodbv0HbWNtxJ8sTZG+k/DU4lztAOVbZ4uMJ51CTYh3eNq4u5bqKQOqf5Xiq4tlifr+Yr8ARUAG1u7TO9D/Xs0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441849; c=relaxed/simple;
	bh=f7Iqm23CyhCZNlQSgebFwaEFnlASpLDGTdD+2Mkgv+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NgJ/aG19QjjNomZ7WkjoUicvdUtxzOypXmRtL9l1vnrY23i+SNA54xnprnAplroXIiDf8NB/BvmTeKHItLXoIt1tIWFeoaR/DW8gHL+MUJ0rf9p5BPYXEkIHfZ3SSDGe55sNcVd1NhchXRR13EI9Qwa/zfxP3VfjXbBYglaMmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=A/kTmTcX; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="A/kTmTcX"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9df1so35856841cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789441847; x=1790046647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YKF9FJ3sfZcV6ZcqIr7QU8JMz0GcZ7UOcl6ndWiktF8=;
        b=A/kTmTcX3BrPUom84acW4ixen1UU3tesgY0q4EEAXSzHsQKYYBYR4Qkb6NlGP9RCPk
         +pTpS5X1awI8osTCEj8hauHTNnG9uyMc8U3QMR0t3MIwJ5WNxsLH34+3PJMoqrZtGYCh
         VU3xSxRY3/Wb0vwZnuVYdrdBI2XmnY/79baP7D1nHovuf4YmjhRlj1KJEplf9GJ8zpcX
         z8sTQCHfRC9ycSwHPsDwahqtxgqOwhHLvAf/XwsUFx1l7Uqgv8FoHyriRbRskCfB/q+X
         S2G0L5+F0uOuHItoqUhUxp6fI6o4Es9sayQPAUVC8ACgHommUNmUKbcpRp+SVLpHlF3C
         jtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789441847; x=1790046647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKF9FJ3sfZcV6ZcqIr7QU8JMz0GcZ7UOcl6ndWiktF8=;
        b=YzMM2tdKep63+rWmW90wC2K+hyUtJSxNgLhia6ywPXBU+6GZyT/4RL5cjdCW1/305r
         b5VsiZ9YKgqDpc7WBb7/zb1LiHYsR9BYmlCJpJ91q2N5CAxWuHZyqnvtrPoyeB915xQ/
         nHqqzsTp2rGHYO4rWHhjqqwHfeofFbbZiH2iB6LF96oLy02Nc2w2uzh7EovglEItCols
         6wkhaB3zBqRhlqlkA47N9hpObYoYlXiMhWo7AGquaz0Ak+2nyY+3iXvbsdrmuVvCuvqz
         GNf6V1KqqE+gv/CIzC4gdlnQlSe5+KA2QUrHEuGiEB8OqIuUgggnliGqDQPX5sdSvI4I
         A52A==
X-Forwarded-Encrypted: i=1; AKwUvBygm9VpObjdmac5vywc3c9PsoSQiPLL9S03cLqayxn15gljJavsFWh46gnsIlpjQC9QehQhBxL11zSjQbg=@vger.kernel.org
X-Gm-Message-State: AFuF++mWWMqfNT4ZGfyUulrj1vxsC69IPPVvJxmX2JkDIIvTd3UP5kpZ
	HmPZHDZF7rthj4EQIUQ007YivgKRcqK5nc2IEyhS2ch69Ycs41yz7oPw9BMxaP8rc1c=
X-Gm-Gg: AYBFou1JDrNZQ8/Px9godtLvAG5o36iA/oZvTtEvmNnnCj0wbfUq7AIDxNiY2i9kWjH
	PdbBXaXd9DZYLfgr/g8RB7A3tcu7aqKMOMLQDahrXJLHJMVngLPKMcySE0dvqmFSvniVWz8Ia63
	PFWcvCPVMUjfzRiyFuiIjuZG5gSnXMKOkNlMbHe6LNvWvIdasdaPiffNWVMC/dh4AmVhgEexKfS
	lC3nQI+0YVJVShL+sjTPEq8TXgm8ZNtuxhBzYaWS8oM3bT6Cb4J5E+WNajcqyMoFX/HQhBU1dRz
	C75Sqv/RQ3imhK3sqnArYnV53IT5mcEVqOjVuMOjHbfeaxPkyRoIxFAWr58M01+Mq7ZiaiL59c9
	0Z8u3gQiDiOywHPVRaJaupvFhWHs/rnDYoQWAyMn7Sm0Lts1GEwaLSjN3S1eidTn2LG9uVl8yBm
	GX7FES/lOmnuCN5fiGrkGMvsHNHuPCx7Ey3VEYlYWqFo6yWwRfECthC1rqGToXMQWpGdsCLwY8z
	SY=
X-Received: by 2002:a05:622a:2285:b0:530:fe26:50c8 with SMTP id d75a77b69052e-5310d0308c1mr80574991cf.39.1789441842008;
        Mon, 14 Sep 2026 20:10:42 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ce4ec298sm118563841cf.16.2026.09.14.20.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:10:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] PCI: introduce TC9564 misc driver
Date: Mon, 14 Sep 2026 22:10:34 -0500
Message-ID: <20260915031038.1087264-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Toshiba TC9564 is specialized SoC that implements a PCIe switch as
well as an Ethernet AVB/TSN bridge.  It also implements other functions,
including a reset and clock controller, an address translation unit, and
a few other devices.  PCIe BARs provide access to registers that manage
these IP blocks, and the SoC is modeled using a PCI endpoint bus in
devicetree.  This allows the IP blocks to be bound to platform drivers
using MMIO through the PCI BARs.

This series introduces the simple PCI driver necessary to implement the
PCI endpoint bus.  It enables the device, enables master access, and
then scans the devicetree subnodes to discover any devices defined
within the endpoint buses.

The driver is placed in the "misc" directory, following the practice
of other PCI endpoint bus drivers.

					-Alex

Note: to work correctly, this series depends on this:
  https://lore.kernel.org/lkml/20260910021919.3421449-1-elder@riscstar.com/

Between version 1 and version 2:
- Updated the block diagram in the binding to include BAR2 and SRAM
- Use KBUILD_MODNAME for the driver name
- Removed bogus initialization of pci_driver->driver field
- Added the third patch, which defines pci-ep-bus DTS information.
- Now based on the Qualcomm for-next branch

Version 1 is available here:
  https://lore.kernel.org/lkml/20260813222943.1655453-1-elder@riscstar.com/


Alex Elder (3):
  dt-bindings: misc: introduce pci1179,0220.yaml
  misc: tc9564: introduce base PCI driver
  arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses

 .../bindings/misc/pci1179,0220.yaml           | 154 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  30 ++++
 drivers/misc/Kconfig                          |  10 ++
 drivers/misc/Makefile                         |   1 +
 drivers/misc/tc9564-pci.c                     |  83 ++++++++++
 drivers/pci/quirks.c                          |   1 +
 7 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 create mode 100644 drivers/misc/tc9564-pci.c


base-commit: 27b3028b7d65cbc44fc5b60d2e977ce55cf186f1
-- 
2.53.0

