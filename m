Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D6A488236
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561435; cv=none; b=V8wDH2k5bUz3IpCMcJDVjvPtLmOU90Xr0LRNkUJ/bfk+JRmzNpDddMPFjfUGrL/ONUSo3JPglbxn1Cq772tXY15Rwn2H5HwM0JgdaMdg3+5Z2qLy28unI5eEdNFVJjSOxJr5koR6XoEJrv9KTbaIRXc6/lyT5vbcnkR6CxYyPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561435; c=relaxed/simple;
	bh=S+nKG48A6OGNxMKXPxUCRz5XTPSQA/uumMB7hcDtHRE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=F2+bx+p3Qmns9t/kZ8hIe1STQ+dDGq784I+qkrDaE70Uq+HgFi5x8NyRk2wiwcJ/V+kPUJSeoIFgdlYH0JXoFNT3aoDPkKlI3HauzjQ5T1E8n3bacX4muKCR0htMk7i07SUwBy7LeOg1O/76dpuLeL7CIWs7PeHs0Z4QfgsziBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=A71J4W9h; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="A71J4W9h"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260916122349epoutp0481e640a1becc8b113ed754e1a3cf23ba~VzKOD5WyP1965319653epoutp04T
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:23:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260916122349epoutp0481e640a1becc8b113ed754e1a3cf23ba~VzKOD5WyP1965319653epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789561429;
	bh=BZnyq9Veye6+ufVVuEqP6BfT4hxNX17wkGGrO1drTUY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=A71J4W9hLJQNpjok+1HwdX4sRCyCWwBXguzo/PQZFRa6kXY1PzdXRk9Y1watHkKah
	 9Vjmfzwn6hcap0xD3rVxWALhb+QVaNtqFoL9mWGWQ4Us4bRup491IZk6dvAqy8bFK5
	 0BpefsEbU9bXUOv9K6vCPyuZUoJHugEzzM07zoik=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260916122348epcas5p31c4318d2b535edd2096b90a9bb79abdb~VzKNYvzaX1679016790epcas5p3c;
	Wed, 16 Sep 2026 12:23:48 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hlJ2r1NXQz6B9m7; Wed, 16 Sep
	2026 12:23:48 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260916122346epcas5p376bd1f05910537d3e0025aac2a62ddf2~VzKLmJUH92587525875epcas5p34;
	Wed, 16 Sep 2026 12:23:46 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260916122343epsmtip238d3a5d0068aef2b1b5d55f5177ced2d~VzKIxlwz41938919389epsmtip2f;
	Wed, 16 Sep 2026 12:23:43 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v2 0/3] Add USB DWC3 support for Samsung Exynos8855
Date: Wed, 16 Sep 2026 17:52:26 +0530
Message-Id: <20260916122229.2604003-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20260916122346epcas5p376bd1f05910537d3e0025aac2a62ddf2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122346epcas5p376bd1f05910537d3e0025aac2a62ddf2
References: <CGME20260916122346epcas5p376bd1f05910537d3e0025aac2a62ddf2@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The Samsung Exynos8855 SoC implements a Synopsys DesignWare USB3 DRD
controller. The DWC3 core on the Exynos8855 is instantiated with the
generic DWC3 platform driver using a flattened model, where the
controller is directly addressable without a separate glue layer.

This is the first Samsung Exynos binding using the flattened
representation and this series adds the device tree binding and platform
driver support for this configuration. The binding follows
qcom,snps-dwc3 pattern, a single node referencing snps,dwc3-common.yaml
for shared DWC3 properties, with per-SoC constraints enforced via
if-then conditionals.

The MAINTAINERS entry is updated first so that the new binding falls
under the existing ARM/Samsung SoC maintainership.

Changes in v2:
- Commit 2/3: Clarify this is the first Samsung Exynos binding using
  the flattened node representation.
- Commit 3/3: Add the compatible entry in alphabetical order in the
  of_match_table.
- Link to v1:
  https://lore.kernel.org/all/20260903071250.3421499-1-selvarasu.g@samsung.com/

Selvarasu Ganesan (3):
  MAINTAINERS: add Samsung USB DT binding to ARM/SAMSUNG entry
  dt-bindings: usb: Introduce samsung,snps-dwc3
  usb: dwc3: Add Exynos8855 to the generic platform driver

 .../bindings/usb/samsung,snps-dwc3.yaml       | 98 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/usb/dwc3/dwc3-generic-plat.c          |  5 +-
 3 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml

-- 
2.17.1

