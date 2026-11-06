Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973316;
	b=3RDv1Y9fYD1Eh3WIgfVLif20C9ZCcv6jlxpCBOdFxYngSaMK6GW2aJ9vvvciho53bRYT
	 ekE7fPZG/JIkyzuL3ZsBFDJJ7GkY9Ptw77NTBFBSWiYHQAqFNVplnSPtRMuK+WZRwo6Cj
	 62gtNALUuGNXKrdUVKJnK6LqsK4UUS1y4WMNbzqtlkwTuLuDNxaATHXrsLZeQgXfZvcXk
	 y1k+nlTEMFWNYGnH1TvdW7y0ZzcTpDixtOeJARyFUvDJytFcKO4rynuy0QLaTYC9nZYjb
	 ujos0yqxWvQDGJLa5aIrWTHDQFznRdd/7lmm37p8lItjgaDmw3Mm7M4gwfa98fR2nXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973316;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=cvOXSk4ZSAmZ1qSeP/uBo94WdHQ7wPfDNQM3BweOM/8=;
	b=krmnRFo7q8Zrlgnlr44SPHOV8mWPywvMATfpxogcklTC82lMVg8o93xFk3rsEmnowfW9
	 LSXrJiiereFFkO/tfBqyCe4pKQ5pew2PqBm6rZ23gWJZjR6321H+YaKMpJkycAtD0ZO0k
	 KJFyEqP7Q+LVloMzAeNodLu0w0t/ti54avJbfYDrDDZ2bq+9YBc/7XF8lAWVh4QQBvbpf
	 aeoaKbuxWFFicTw6+jsIuAyeQJWp3XhrbijwGOdlX1a0QnVv0wiZleWgyL8TtbUFeEXuO
	 2vmj31DIVcp99dLkfb2Ds4LvEo1kJm1pfRvEVy4Ox5nPG2eO1YDsSrMY2ckw7DIbpyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cnvKamII;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5200606D818
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5200606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cnvKamII
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135510euoutp0219b5351cbe63051fa4c0d16c29274e00~leTiGdskR2549325493euoutp02h
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106135510euoutp0219b5351cbe63051fa4c0d16c29274e00~leTiGdskR2549325493euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973310;
	bh=cvOXSk4ZSAmZ1qSeP/uBo94WdHQ7wPfDNQM3BweOM/8=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=cnvKamIIbSl9tsxUe8y6gwRkXgcl4iQBYv9nrEE4FK6pdAD7kwaJl1oSAnuYNe1NM
	 5cw5CiSwh9vI5OwCgLR7Hel6cL9rnpCV4fhvfaN9FU3fhAZ78X9yo3hMf6mmyweWpU
	 yIiDiggCz8EEOmPskbu47QVbl44lYl8Xb2EJXzRQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106135509eucas1p218615ae5c95c50b0f39bfb9cd86b266e~leThlgObN0962609626eucas1p2D;
	Fri,  6 Nov 2026 13:55:09 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106135508eusmtip2f32a765489883255f5a9ccb15cfcd996~leTgxvtM92416124161eusmtip2f;
	Fri,  6 Nov 2026 13:55:08 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:53:03 +0100
Subject: [PATCH v7 5/5] MAINTAINERS: Add StarFive JH7110 HDMI PHY entry
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-jh7110-inno-hdmi-phy-v7-5-d49368303800@samsung.com>
In-Reply-To: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=1BpQ12qeO8tqDE0Ye1RozUCyoCBDy4gmigUQjixUNvE=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vWNuJCrAc6lxg/fGGdr1Obud8rMm2yds3v1B+ALbx
	TuH2Q2SO0pZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBEXlgzMkwW07aMz3PLVFwt
	sOx6QT9LklNF0L+SMqMjuQsYXHY3XmH4HzfthqaSjffMA3ZvhHomyMYWdyz4PIH/xsbVz3wZPfc
	+4QcA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135509eucas1p218615ae5c95c50b0f39bfb9cd86b266e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135509eucas1p218615ae5c95c50b0f39bfb9cd86b266e
X-EPHeader: CA
X-CMS-RootMailID: 20261106135509eucas1p218615ae5c95c50b0f39bfb9cd86b266e
References: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
	<CGME20261106135509eucas1p218615ae5c95c50b0f39bfb9cd86b266e@eucas1p2.samsung.com>

Add an entry for the StarFive JH7110 HDMI PHY binding and driver, next
to the other JH7110 PHY drivers.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065de00c29cc02de16c38eac58ac5a1..42b49ff71415f06f69f749d31e16938dad921833 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26731,6 +26731,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-tx.yaml
 F:	drivers/phy/starfive/phy-jh7110-dphy-tx.c
 
+STARFIVE JH7110 HDMI PHY DRIVER
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
+F:	drivers/phy/starfive/phy-jh7110-inno-hdmi.c
+
 STARFIVE JH7110 MMC/SD/SDIO DRIVER
 M:	William Qiu <william.qiu@starfivetech.com>
 S:	Supported

-- 
2.34.1

