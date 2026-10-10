Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF423D75A0;
	Sat, 10 Oct 2026 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624254; cv=none; b=JZRUtIDvgGV3tN53aHb02IlUpCCbbO1v+w7dm3sioU85SA/lNqj6r7p79wcvARmRQizDSGDYFdUqXe+L7fQi5s3HsmZ6FZSE5Z1DfMXWV61vH3NC18cYE/drVRaKt5xlJcQwdQreDv0DfUkzQJ+TF8u+OXInmoiksuwGICpFNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624254; c=relaxed/simple;
	bh=UUpCWJajX8V6Dq1NPRCctW4bZeTijElkvsAgBs1TwYE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NGq+NhRW2q55t8Trn6g5wAkRfkov6Bn2COaShLux7Ivp3NKlyNw2vyBpuYlrvkPECbFMn1hdyUnsYhmfqBT+ElWGrjC81VrmN6qvT3ou+3G9AwZNImlkGXgXVBVNOBWFttpwZrbclqwF+qIW9Gtevfb6K0wBNAtplvnRUaLOBWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YGr8coh8; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YGr8coh8"
X-UUID: 54e3f254c48c11f18dc8c9802ae25ab1-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=azLOPk6OsFJ2Ggfp1q3aWvwtqJcArDmv2/YPPX7LCOQ=;
	b=YGr8coh82csrfrjd197c43pmPKfVwztkD4aEDMr+MNAK5NRp+DbBmdYkZrogr1LyeyCSqj7zraUPCCYujUu9MrybNQTdF9WHyDIFalqKrUiQR76RMNrt0WV/pdaUaDw8GAOXYCtW0LDhNYBhEQ08Sj9YPJ/l2xqtURYGZK6v0jg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:a85061dc-7787-4a7a-a0ad-30d85fa8cd47,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:a66dedb8-514b-419b-be8a-53f1868a3ee6,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|52|99,E
	DM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 54e3f254c48c11f18dc8c9802ae25ab1-20261010
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1369319320; Sat, 10 Oct 2026 17:24:02 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 17:24:01 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 17:23:59 +0800
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
Subject: [PATCH v11 00/10] Enable video decoder & encoder for MT8189
Date: Sat, 10 Oct 2026 17:23:48 +0800
Message-ID: <cover.1791623422.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MTK: N

From: Kyrie Wu (=E5=90=B4=E6=99=97) <kyrie.wu@mediatek.com>

This series enables the MT8189 video decoder and encoder. It adds the decod=
er
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
  [1] MT8196 decoder/VCP series v8, which was used as the base for
      this export.
  [2] MT8196 encoder v8.

[1] https://patchwork.linuxtv.org/project/linux-media/cover/cover.179161974=
2.git.kyrie.wu@mediatek.com/
[2] https://patchwork.linuxtv.org/project/linux-media/cover/20260914073423.=
16131-1-irui.wang@mediatek.com/

Testing on MT8189 (reported for v10; not rerun for v11):

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
https://patchwork.kernel.org/project/linux-mediatek/patch/20250811015922.32=
680-1-huayu.zong@mediatek.com/

DTSI upstream link:
https://lore.kernel.org/linux-mediatek/20251030134541.784011-12-jh.hsu@medi=
atek.com/T/#m847e35de0a5b18fac0ca0624a8559d84964ad5c7

Changes compared with v10:
  - Rebased on the latest media tree.

Changes compared with v9:
  - Rebased on the latest media tree.
  - Reordered the compatible string for DT bindings.

Changes compared with v1:
  - Added v4l2-compliance test results.
  - Added the SCP upstream link.
  - Added hardware difference descriptions to the DT binding commit message=
s.=0D
=0D
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

--=20
2.51.0.windows.2

