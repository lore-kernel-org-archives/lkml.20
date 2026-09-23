Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477FB45C710;
	Wed, 23 Sep 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151181; cv=none; b=jIyrLSrBMCRwKxkHrdubkE5SF+vR+sOKl7QcSQ5Jpr7zFBTatc6IZiW0xedC6EKiV53mU9jToUHlhvg+n0tvJB0b+JWs5eOMPhSn0cOYqxmpqLIbPRJbmRyZR8hMoJLgZY+2cFY34ZqDMcDfV1YOwQ9pY/OUJ7Z6PLoSQcCPBzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151181; c=relaxed/simple;
	bh=4J6GFc8K8C2Yd2ciWnpV+Hv17k4b8a5sitRXNVd2/VQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IhqHSdWtiQJLoulTxfv+v0XPwLGbqf6QB+LtydnQwvhs4rmKmProsg8P1RDkhNqePqMNHN6TYcFH0Ke/IqPSa0UcswDr/6Bkw9Z63zLiB1qCZoAXcBaFSJ/zQAtNXvfiU4l9wzq2thwz5eYF+tMkKRXejFUbiPzz69rIeA/2dDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ryd/mHfL; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ryd/mHfL"
X-UUID: 926369fcb72611f18dc8c9802ae25ab1-20260923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nXFx24uHxr9xP0FU0RdXpsSyEvVzbxC7Cx4KbtNOMGc=;
	b=ryd/mHfL4NNyI4I5IXU0czBURmvlTKvyis5VMHYWK0JjCVAEpn88AFt4pyuyBiF2fPNskH/xXOnr9UGnvjsN8IVabiX18Ff0WPDM+nDqqTDlbC7zRqLoqHt/QVcSj9oVQ8J4XmHPszbgvBPBHrZbpxq66MZQt+eq9pjFSI7N+hw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8052bbdb-727b-416f-a580-827b51d749d9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:efe6e108-d10d-41b3-a8f1-bc707284d0ce,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 926369fcb72611f18dc8c9802ae25ab1-20260923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1381347116; Wed, 23 Sep 2026 16:12:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 23 Sep 2026 16:12:50 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 23 Sep 2026 16:12:48 +0800
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
Subject: [PATCH v10 00/10] Enable video decoder & encoder for MT8189
Date: Wed, 23 Sep 2026 16:12:36 +0800
Message-ID: <20260923081246.268182-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

It adds the MT8189 decoder and encoder bindings and compatible data,
updates the decoder capability data, and fixes two existing decoder
issues.  Patch 3 moves decoder firmware selection from optional DT
properties into platform data, matching the encoder implementation.

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
  [1] MT8196 decoder/VCP v7
      https://patchwork.linuxtv.org/project/linux-media/cover/20260923024258.257846-1-kyrie.wu@mediatek.com/
  [2] MT8196 encoder v8
      https://patchwork.linuxtv.org/project/linux-media/cover/20260914073423.16131-1-irui.wang@mediatek.com/

Testing on MT8189:

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

Changes compared with v9:
  - Rebased on the latest media tree.
  - Rebased on MT8196 decoder/VCP v7 and encoder v8.
  - Add a separate decoder firmware-platform-data patch following review.

Changes compared with v8:
--Rebased on top of the latest media tree

Changes compared with v7:
--relocate the patches set
--refactor decoder platform data patch
--fix commit message errors

Changes compared with v6:
--refactor the patches of set compatible data, profile and level
--add reviewer to commit messages
--fix commit message errors

Changes compared with v5:
--refactor the patches of set compatible data, profile and level
--add reviewer to commit messages
--fix commit message errors

Changes compared with v4:
--update H264 & vp9 fluster test results
--update vp9 single core decoder prob size setting and commit messages

Changes compared with v3:
--add reviewer to commit messages
--Rebased on top of the latest media tree

Changes compared with v2:
--add H264 fluster test results
--reorder compatible string for dt-bindings

Changes compared with v1:
--add v4l2-compliance test results
--add scp upstream link
--add HW difference discriptions for dt-bindings commit messages

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
 .../media/mediatek,vcodec-subdev-decoder.yaml |   5 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   6 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  68 ++---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  42 +--
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  16 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 253 ++++++++++++------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  14 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  17 ++
 11 files changed, 279 insertions(+), 148 deletions(-)

-- 
2.51.0.windows.2
