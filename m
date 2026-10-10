Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597A33CEB0;
	Sat, 10 Oct 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619657; cv=none; b=dwy/W6rkWrrjoImo0wrx0Q4pMUVnDUxFXHnUjBhkKgmdjLGRG+4GluhuclMsGzijHoUaYU73gzmF/flHbaSzds5Shk1JGiX0h+jVqGkuO5WTGoaZmN8Q/YK5B/LoZsYe+ycQsZ/1uW6FjlsImW2ED+yLRHeu5465NfLS0ieasv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619657; c=relaxed/simple;
	bh=loPSsXBBMhdfolQBr8Hn+9BiqIyAtmwkrBAK9T2tRzg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jIIKj+kd0KKtynrSqK2aUZuxZBepF1Juo4ltjYYpYznBWhhGTFeMovRSxJ3nGUCPtzD7g/mPQ55l07p10IIIUq15KF7J+cLmB63TdqHc4b033fbhjLz2KUlbWIC93VkoixWiFRikDwT0oOwbQnnqSF6UnJmpCek0egST+9IHIiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=igRFxKKO; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="igRFxKKO"
X-UUID: 9fd30184c48111f18dc8c9802ae25ab1-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zBADeLLdYab1h+lZVbD25EN9gkPq27ksjFhjBzwzzYs=;
	b=igRFxKKOlgt17ziGbrFo4sPOdzP2/hrS5UakYUxBn9aKnj+IUKsM+YGQcgCJ23JZ+7HJiN5PFs2Ald7RlZF+34+tJ+E181B+OEqZpbusDlkZRXYsPZouzsX4aHf742/+8XPJyaAhy9EAyaRKghQbOcCxcVzsoKQxOg36MzElOj8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:1dd58edc-89ac-4b62-a213-ce0adcfc04f7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:43882e95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|52|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9fd30184c48111f18dc8c9802ae25ab1-20261010
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1447129023; Sat, 10 Oct 2026 16:07:23 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:07:22 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:07:21 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: =?UTF-8?q?Kyrie=20Wu=20=28=E5=90=B4=E6=99=97=29?= <kyrie.wu@mediatek.com>
Subject: [PATCH v18 00/13] media: mediatek: jpeg: add MT8196 JPEG support
Date: Sat, 10 Oct 2026 16:07:04 +0800
Message-ID: <cover.1791614327.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N

From: Kyrie Wu (吴晗) <kyrie.wu@mediatek.com>

This series have the follow changing:
Firstly fix some bugs, including resolution change handleing, stop
streaming sw flow, fix buffer layout and clock setting to support multi-hw
jpeg working and others.
Secondly add mt8196 jpegdec and jpegenc compatible to support MT8196
kernel driver.
Lastly, Add smmu setting to support smmu and iommu at the same time.

This series has been tested with MT8196 tast test.
Encoding and decoding worked for this chip.

Patches 1 fix jpeg hw count setting to support different chips.
Patches 2 fix jpeg buffer payload setting to handle buffer
size bug while resolution changed.
Patches 3 fix jpeg dst buffer layout.
Patches 4 fix multi-core stop streaming flow
Patches 5 fix multi-core clk suspend/resume setting
Patches 6 fix buffer state update timing
Patches 7 fix decoding resolution change operation
Patches 8 fix remove buffer operation
Patches 9-11 add jpeg encoder and decoder compatible.
Patch 12 adds MT8196 JPEG SMMU bindings.
Patch 13 adds jpeg smmu sid setting.
---
Changes compared with v17:
--Keep suspend/resume callbacks and clock ownership on multi-hw component
  devices. Leave single-hw callbacks on the master, and wait for the active
  job before disabling component clocks.
--Add a standalone DT binding patch for mediatek,smmu-config and the
  dedicated MT8196 JPEG SMMU configuration syscon at 0x38d0000.

Changes compared with v16:
--Rebased on top of the latest media tree

Changes compared with v15:
--Set max_hw_count from the DT child count and update hw_rdy from child hardware probes in patch 1.
--Fix patch 2 commit message wording per review.
--Rework patch 6 commit message per review.
--Remove redundant devm_clk_bulk_get() calls in patch 5 per review comments.
--Use %pe to print smmu_regmap error pointer in patch 12 to fix media-ci/static warnings.

Changes compared with v14:
--Rebased on top of the latest media tree

Changes compared with v13:
--Rebased on top of the latest media tree

Changes compared with v12:
--Rebased on top of the latest media tree
--fix kernel rebot build warnings in patch 5

Changes compared with v11:
--Rebased on top of the latest media tree
--Some modifications for patch v11's review comments.
--add reviewer to commit messages

Changes compared with v10:
--Rebased on top of the latest media tree
--add reviewer to commit messages

Changes compared with v9:
--Rebased on top of the latest media tree

Changes compared with v8:
--Rebased on top of the latest media tree

Changes compared with v7:
--Rebased on top of the latest media tree

Changes compared with v6:
--Rebased on top of the latest media tree

Changes compared with v5:
--reorder the patches set.
--fix commit message of patch 1-8.

Changes compared with v4:
--fix kernel robot build errors for patch 4.
--add reviewer for patch 1 and patch 2.

Changes compared with v3:
--change patch subject of jpeg encoder and decoder compatible.

Changes compared with v2:
--refactor smmu sid setting function interface
--Some modifications for patch v2's review comments.

Changes compared with v1:
--refine jpeg dt-bindings for MT8196
--optimize software code to manage jpeg HW count
--refactor smmu sid setting function interface
--Some modifications for patch v1's review comments.

Kyrie Wu (13):
  media: mediatek: jpeg: fix jpeg cores' amounts setting
  media: mediatek: jpeg: fix jpeg buffer payload size setting
  media: mediatek: jpeg: fix buffer structure size and layout
  media: mediatek: jpeg: Fix buffer completion on multi-core streaming
    stop
  media: mediatek: jpeg: Fix multi-core clk suspend and resume setting
  media: mediatek: jpeg: fix buffer state update timing
  media: mediatek: jpeg: fix resolution change event handling in decoder
  media: mediatek: jpeg: fix remove buffer removal timing for multi-core
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
    compatible
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
    compatible
  media: mediatek: jpeg: add jpeg compatible
  dt-bindings: mediatek: Add MT8196 JPEG SMMU bindings
  media: mediatek: jpeg: add jpeg smmu sid setting

 .../media/mediatek,mt8195-jpegdec.yaml        |  24 ++-
 .../media/mediatek,mt8195-jpegenc.yaml        |  24 ++-
 .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   |  41 +++++
 MAINTAINERS                                   |   2 +
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 156 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  19 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  85 +++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  83 +++++++++-
 8 files changed, 377 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml

-- 
2.51.0.windows.2
