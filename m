Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905928;
	b=m4j7TYK5n3/rvRplBaXCSCGWd0Wcq+yUHdaU1sF279CIkCLawH00yzc8TnpEQg61u5GS
	 nqPvqiqvQbZn64vJgDT20J/58t72MAuH2/Vag3J2PhN7d1RiXoDXptMU4xuIbdkDvacsi
	 RYL/VpTCIHdEGcxCi4bKVOV8SXA3IrIY6m3gt3XvAIMLbWd+Iq6K1FOLkVs4BqeLPw0am
	 j06/qyL6HCCEliP2PIKT8pnQr/jVZVwlHQrDY264bNAZhEcLprpiQY8fYLV2B3hogezF7
	 uJ4gdhBkF7ErBC9LBZQjetQSrC8/QO/zcBF5rFMibYD95JIjWHAL4s05ivRRotBHtYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905928;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-MTK;
	bh=R3DmmQZwXDBtJ43+iPI31TViuEgQgJ2iPPUbj/3RyuI=;
	b=w8+6c2ZpKX2GDm6pCH0ntOzJc9/TowgkpsAB5h9VfGT2xB0jetFeAkNQy2AKHtVZDSPU
	 cJATj3iXjm6UnT+6IhCzV+1C5p1OCJv+eGh0aMzwwbCp8So7G5SjaXFqx3MHfubEowmb5
	 +tuIhQmj6TVQBEYFoABg2rRM/BEk6xvcIhd9nFq0jd5tkItolnZnuRWqjjgmOkJn7vc7s
	 qm4rC5oE7yvjALFTttWoia/0KDj/b7Hp5yJDfcmY8Lt1TxBIrL35XX7reBcWGogdGG0jK
	 +m4n0Ltr/AoS061M483yIeDxG1J5/oSvnQwezLjhyHZWjSRAjDVSiogPlfRq2Ogw9WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=F8mICOLv;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B13606A880;
	Tue, 17 Nov 2026 08:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B13606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=F8mICOLv
X-UUID: 14b80336e26511f18dc8c9802ae25ab1-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=R3DmmQZwXDBtJ43+iPI31TViuEgQgJ2iPPUbj/3RyuI=;
	b=F8mICOLvLveN6DAub5/Pc1nxwl8iioNqkavrS3NNwPfGL0deSuBtSTLOX1EBEYtC4S31r11VE0IORPq+7+58PWnSdgoRjJImmxd1rXSPRSFBo3zm+nxC6GaeJWIdPk2dVxBxCVaS2THDXW7RQ38C9aVAiV8caLIr19X1gB8KUwU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f48f66bf-8024-4776-89e8-65827f79fca1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:6a38af19-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|52|99,E
	DM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 14b80336e26511f18dc8c9802ae25ab1-20261117
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2053637129; Tue, 17 Nov 2026 16:58:39 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 16:58:37 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 16:58:36 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v12 00/10] Enable video decoder & encoder for MT8189
Date: Tue, 17 Nov 2026 16:58:23 +0800
Message-ID: <20261117085834.1464723-1-kyrie.wu@mediatek.com>
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

This series enables the MT8189 video decoder and encoder. It adds the decoder
and encoder bindings and compatible data, updates decoder capability data,
and fixes two existing decoder issues. Patch 3 moves decoder firmware
selection from optional DT properties into platform data, matching the
encoder implementation.

Patch layout:
  1  Add the MT8189 decoder binding.
  2  Add decoder platform-data support.
  3  Move decoder firmware selection to platform data.
  4-5  Refactor decoder profile, level, and VP9 probability-size data.
  6  Fix VP9 4K profile-2 decoding.
  7  Add the MT8189 decoder compatible data.
  8  Fix the media-device node number.
  9-10  Add the MT8189 encoder binding and compatible data.

This series depends on:
  [1] MT8196 decoder series v9, preceded by its VCP remoteproc
      prerequisite, which was used as the base for this export.
  [2] MT8196 encoder v8.

[1] https://patchwork.linuxtv.org/project/linux-media/cover/20261117032950.1425556-1-kyrie.wu@mediatek.com/
[2] https://patchwork.linuxtv.org/project/linux-media/cover/20260914073423.16131-1-irui.wang@mediatek.com/

H.264:
  ./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j2 -t 90
  JVT-AVC_V1: 96/135 tests passed

VP9:
  ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j2 -t 90
  VP9-TEST-VECTORS: 276/305 tests passed

v4l2-compliance:
  mtk-vcodec-enc (/dev/video2): 46/47 passed, 1 failed, 0 warnings
  mtk-vcodec-dec (/dev/video3): 48/48 passed, 0 failed, 0 warnings

SCP upstream link:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250811015922.32680-1-huayu.zong@mediatek.com/

DTSI upstream link:
https://lore.kernel.org/linux-mediatek/20251030134541.784011-12-jh.hsu@mediatek.com/T/#m847e35de0a5b18fac0ca0624a8559d84964ad5c7

Changes compared with v11:
  - Rebased on mainline 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4,
    using the published MT8196 decoder v9 and its VCP prerequisite.
  - Require two MT8189 decoder child clocks named soc-vdec and vdec.
    Correct the clock description and remove Rob Herring's withdrawn
    Acked-by from patch 1.

Changes compared with v10:
  - Rebased on the latest media tree.

Changes compared with v9:
  - Rebased on the latest media tree.
  - Reordered the compatible string for DT bindings.

Changes compared with v1:
  - Added v4l2-compliance test results.
  - Added the SCP upstream link.
  - Added hardware difference descriptions to the DT binding commit messages.

Kyrie Wu (10):
  dt-bindings: media: mediatek: decoder: Add MT8189
    mediatek,vcodec-decoder
  media: mediatek: decoder: Add a new platform data member
  media: mediatek: decoder: Move firmware selection to platform data
  media: mediatek: vcodec: Refactor Decoder profile & level Handling
  media: mediatek: vcodec: Add VP9 Probability Size Configuration
  media: mediatek: vcodec: Fix vp9 4096x2176 fail for profile2
  media: mediatek: vcodec: add decoder compatible to support MT8189
  media: mediatek: vcodec: Fix media device node number
  dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
  media: mediatek: encoder: Add MT8189 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |   2 +
 .../media/mediatek,vcodec-subdev-decoder.yaml |  24 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   6 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  64 ++---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  42 +--
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  16 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 253 ++++++++++++------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  14 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  17 ++
 11 files changed, 298 insertions(+), 144 deletions(-)


base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
prerequisite-patch-id: 9f5a680ff9c58918d53c09c15d48e6ac33c643fc
prerequisite-patch-id: af540a1d2093ff0b635f96f3257fbf768302925e
prerequisite-patch-id: dee8633604fd7528e9ebcb9de25a3e42231f1f80
prerequisite-patch-id: f464ff9a2860b4fc07c051961e26c10047a1731d
prerequisite-patch-id: 1b9295ecd3895c60f6d5ab690f9c05987e1a551f
prerequisite-patch-id: a4abfe16fb9cfd55e44707491259f72f50783a33
prerequisite-patch-id: 472784c2603c63038b064dd36d867b9105a23eda
prerequisite-patch-id: 3e9f9d5336485e4bd3be2a8726d2c2428619e286
prerequisite-patch-id: 973ab0b15402c2096428453296d88f34fda6a700
prerequisite-patch-id: 051092a8424afa3002442799fb016651eb80f79f
prerequisite-patch-id: b04e354244d9eccb8355fc5a12426d762751de39
prerequisite-patch-id: e3c85085bf36c880690336d216901ffeb5c4e9ec
prerequisite-patch-id: d8a3b0e7f634d02d3ef0625a9ad0d7f2fcc20b31
prerequisite-patch-id: 2129e8aec7acd498dd7badbaa5610d03df7dc52d
prerequisite-patch-id: 9501dc5e63b8120861f9a1e61958e3bac18e5b33
prerequisite-patch-id: 7d41207a5d2d040ef77700c1d8a8bfca933ce040
prerequisite-patch-id: 1e5eb8ffad8ac92cea848342d2dec1b73683e75a
prerequisite-patch-id: 4489e714c6a152266194fdef803ba5fb48a685c6
prerequisite-patch-id: 341fd7d3230b150b3e17f298d1c06cfb2ad3ad5a
prerequisite-patch-id: de717dc84d8be3c25942021a48b8c26ba714a432
prerequisite-patch-id: b663c493b16bb7a21ad04ed6972b90bd5ed4960d
prerequisite-patch-id: 2b0b00b672f448f333e9def6b9864afc11df991a
prerequisite-patch-id: 9fbf014b290db330f44f6702777acdef8ed5d76f
prerequisite-patch-id: acac610274fe76d67cedcd2d9729659132ab891f
prerequisite-patch-id: afa01b367b18eebac4bded1729931f4b1d1fc2ae
prerequisite-patch-id: 2844bb2bbd9328add841f4b13bdbdd3c120ffa5f
prerequisite-patch-id: e7405e261fde65f2cbe4f9d78d15fd411fb749bb
-- 
2.51.0.windows.2

