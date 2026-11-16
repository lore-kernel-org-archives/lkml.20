Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792861;
	b=d+kmwwlJia5qfTYRLQ2ywIE4SvcT4meM338aEf7QkWjseiY1MXfCVu0Wfo7KAabYoDdE
	 TdCUVjoWmfQi+MK+o9Gz6zTvW1HxrvLiu5QCf9Quid+a2QwIx5pT/gqmxW6t/XLJEthQw
	 EszrSos3m3O1xeQt41ug3r28a7NpJNc5OCRlHJkoA/vKvNh3Pkt3YcwHKAm3/mNZPrvXc
	 SNtdIq9cyNuEcYU8URPyO83l0Eu6SkNUrfHPWw5dX+3fRn3LRNJwiOiOSBH4Q1E7Qus/z
	 9nrFy3+8aOq4kLlEIC706XOY7X6ezojRJl2XwZW0IcEsVTmetxfTJ7jfciY5mTyWXSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792861;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-MTK;
	bh=Y55TdASnBoGfrDCMy+34oiKBw+p2hSLsA4K7WEYUknE=;
	b=U7AnElxU6xv229cv8euq1Mimv2yadd0JOMu+U+7LBHH61ZoulZ5ds0/bNzosLbDJWcr9
	 +T1/qPmOf35seeify0s6HFCO8hiGuXxeltZccp1tBPJq/dmq7fScfNHncKr6koDVjxKDy
	 QTq4N6LO3X8rarVAxTOv81OclLND8UjP/fPkepqkk7vosdBQC3ddcYH8k0YQjTeYsiFnc
	 jfieviHgqGMjIhgAoUokV9e7ULWZnZvr2GWi5gSeEWr7HOXnX4jgIUeTZbIXgGYLWgvLl
	 ohSbA9IDYNNqQSB39nogcyddtLlyM2K1ejt1SrXJRhd6H19KwcConbpM5xUM1deXknQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Z2yYJ5xi;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC089606A31F;
	Mon, 16 Nov 2026 01:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC089606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Z2yYJ5xi
X-UUID: d19eebf8e15d11f1b1788b6acf885367-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Y55TdASnBoGfrDCMy+34oiKBw+p2hSLsA4K7WEYUknE=;
	b=Z2yYJ5xiOOnIzziEmgvqMmemohbecnCE5mUdJqPmmaQipukV6vvsG6lfEDjFps6TUd56PW8O1bLjr5KJ+RS9XwnzCKVxXPf0JsIZoPQHoaPTZRP9sZYpTGtf3KZptjFwdZzLT+r6kU8cpRplT7jQ54fQK3P9JQPk72RXYezE394=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1a1c45c7-eb11-4af7-a132-9fef6136230f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:eddb5666-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|52|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d19eebf8e15d11f1b1788b6acf885367-20261116
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 613890696; Mon, 16 Nov 2026 09:34:09 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Nov 2026 09:34:07 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Nov 2026 09:34:05 +0800
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
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v19 00/13] media: mediatek: jpeg: add MT8196 JPEG support
Date: Mon, 16 Nov 2026 09:33:25 +0800
Message-ID: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

Historical testing reported for v18 (not rerun for this revision):
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
Patch 9 adds the shared MT8196 JPEG SMMU configuration syscon binding.
Patches 10-11 add complete decoder and encoder bindings for MT8196.
Patch 12 adds the driver compatible strings for MT8196.
Patch 13 adds jpeg smmu sid setting.
---
Changes compared with v18:
--Rebased on mainline 23c62304dde29abe92013d85910d03a77dada35d.
--Initialize hw_rdy before populating children to preserve probe counts.
--Drain ready queues before waiting for in-flight buffers at STREAMOFF.
--Reject component suspend with -EBUSY while hardware is active; restore
  M2M scheduling on failure and use pm_ptr() for component PM operations.
--Publish decoder completion metadata before arming the timeout.
--Keep queue-format updates under CAPTURE STREAMOFF locking and check
  SOURCE_CHANGE state before comparing resolutions.
--Unlink prepared buffers before arming timeout or starting hardware.
--Introduce the shared SMMU schema before complete MT8196 decoder and
  encoder bindings, including their required smmu-config phandles.
--Clarify MT8196 SMMU stream IDs in encoder iommus descriptions and use
  the soc binding prefix for the shared SMMU schema patch.
--Complete SMMU initialization before allocating a child index and
  publishing child pointers, preserving parent state on probe failure.
--Update changed descriptions and remove the agreed Reviewed-by tags
  on patches requiring renewed review.

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
  dt-bindings: soc: mediatek: Add MT8196 JPEG SMMU
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
    compatible
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
    compatible
  media: mediatek: jpeg: add jpeg compatible
  media: mediatek: jpeg: add jpeg smmu sid setting

 .../media/mediatek,mt8195-jpegdec.yaml        |  24 ++-
 .../media/mediatek,mt8195-jpegenc.yaml        |  39 ++++-
 .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   |  41 +++++
 MAINTAINERS                                   |   2 +
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 161 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  19 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  96 ++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  94 +++++++++-
 8 files changed, 410 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.51.0.windows.2

