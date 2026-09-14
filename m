Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66AD3E95B2;
	Mon, 14 Sep 2026 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371278; cv=none; b=PdlXc8on1d9ZwPn1JtbCJ65ssKLNRKpVY8JkieAofzVkIZdCwNuAmMHaOjWU8LhIq9ZwlZfVRaUE7HU1KobH8zkeYCcwhISrXSMH3JdGByBR41uRV0c/xlYT79BZ2IRTaniRZtvY7/nI8Z85QIndBKK1xT0UQkJE0rznnJpeyVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371278; c=relaxed/simple;
	bh=iYpxcEi+vSsmeCzv9oPf1ygPfNIU0QvOstJVHg7uGgs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iEdr0An4aDfm+ToeExqhST+0Edo4QR9YVcRnA1nRYl3ePgpBMc0xVHkXsoKdi883xAU+AfBycVewUyD+gAQfTT8YsNbRZ94on5yUX1dW++6A5bEb1Efy9x/AuZBNUXdvjmDPPY0RO7bP3/yDo0yaHobtTtliUc3oHwiTifgePH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZFV8yspg; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZFV8yspg"
X-UUID: b7ae3efeb00e11f1b1788b6acf885367-20260914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Bj+p5Xe9b4pgmGeFJIUoTwkyssUTNsuSHbYegk9Xjrw=;
	b=ZFV8yspgU1VgGR6tUJWNf7u1AoMM7HcELO1vAqj6Gc0nFzYfwY5c/3bdsPfCkGQCkKPzjmv7IDRgG9dImRHLZ15ddfuxTVurox6JwqZiPHc9G7JY7P96UurSLNp8y2vElil1jn0a+R8bKbs7YivDxbhJp2jAc81hZkEkj5Oz6os=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d9664ca1-cf66-4310-bb2b-a53af62cf69b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:ccb83c0c-027a-4b0a-91ab-050fa8cdb9b0,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7ae3efeb00e11f1b1788b6acf885367-20260914
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1847673177; Mon, 14 Sep 2026 15:34:28 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 14 Sep 2026 15:34:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 14 Sep 2026 15:34:26 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v8 0/6] Add support for MT8196 video encoder
Date: Mon, 14 Sep 2026 15:34:15 +0800
Message-ID: <20260914073423.16131-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This series adds support for the MT8196 video encoder.

Patch 1 adds the device-tree binding changes.
Patch 2 adds the new encoder platform data.
Patches 3 through 5 add a new encoder driver interface for VCP firmware.
Patch 6 adds the MT8196 compatible data.

The v4l2-compliance result for the encoder is:

  Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46,
  Failed: 1, Warnings: 0

The one failed test is not caused by this series:

  fail: v4l2-test-controls.cpp(1171):
        node->codec_mask & STATEFUL_ENCODER
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

This series depends on the MT8196 video decoder v6 series [1]. The decoder
series retains the "Add MediaTek VCP remoteproc driver support" v4
prerequisite [2].

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=28000
[2] https://patchwork.kernel.org/series/1086068/

Changes in v8:
 - Rebase the encoder series on the MT8196 decoder v6 series.
 - Adapt patch 2 to the decoder v6 firmware-selection flow, retaining its
   generic selector and validation while supplying the encoder platform
   firmware initialization callback.
 - Adapt patch 5 to the decoder v6 VCP teardown flow, retaining the complete
   teardown before adding the encoder firmware-device callback.
 - Link to v7:
   https://patchwork.linuxtv.org/project/linux-media/list/?series=26089

Changes in v7:
 - Patch 2: Add new pdata members to remove device-tree parsing branches.
 - Rebase the series on the decoder patch set.
 - Link to v6:
   https://patchwork.linuxtv.org/project/linux-media/cover/20260423073345.27402-1-irui.wang@mediatek.com/

Changes in v6:
 - Move the device-tree binding changes to patch 1.
 - Rebase the series on the decoder patch set.
 - Link to v5:
   https://patchwork.linuxtv.org/project/linux-media/cover/20260302035244.8994-1-irui.wang@mediatek.com/

Changes in v5:
 - Rewrite the patch 5 commit subject.
 - Add the else branch in patch 5.
 - Link to v4:
   https://patchwork.linuxtv.org/project/linux-media/list/?series=21757

Changes in v4:
 - Rework the patch 3 commit message.
 - Rework patch 5 with more details.
 - Rebase the series on the decoder patch set.
 - Link to v3:
   https://patchwork.linuxtv.org/project/linux-media/cover/20250814085642.17343-1-kyrie.wu@mediatek.com/

Changes in v3:
 - Add encoder rate-control buffer allocation failure handling.
 - Add the mediatek,vcp property definition to the device-tree binding.

Changes in v2:
 - Add support for the VCP encode process.
 - Add the MT8196 encoder platform data.
 - Rebase the encoder series on the decoder patch set.
 - Address review comments from v1.

Irui Wang (6):
  media: dt-bindings: mediatek,vcodec-encoder: Add MT8196
  media: mediatek: encoder: Add new platform data members
  media: mediatek: encoder: Add a new encoder driver interface
  media: mediatek: encoder: Add support for common firmware interface
  media: mediatek: encoder: Add support for VCP encode process
  media: mediatek: encoder: Add MT8196 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |  22 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |   6 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   1 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |   6 +
 .../platform/mediatek/vcodec/encoder/Makefile |   1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  24 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  63 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  15 +-
 .../vcodec/encoder/venc/venc_common_if.c      | 684 ++++++++++++++++++
 .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
 .../mediatek/vcodec/encoder/venc_drv_if.h     |   3 +
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
 .../mediatek/vcodec/encoder/venc_vpu_if.c     |  47 +-
 14 files changed, 850 insertions(+), 52 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c


base-commit: bf115aeef8fc70bc46b05733d0d3b77bd9e8af50
-- 
2.55.0.windows.3
