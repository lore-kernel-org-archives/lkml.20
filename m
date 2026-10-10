Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E683B0587;
	Sat, 10 Oct 2026 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621390; cv=none; b=nboepC4sTK8kIpBj4duJvBoZ2fsxdCWCe5jMDUAqqPk21kwgC+9osMSeqRXpS463VQeptejHu7Z78USP0+UWV8ubRJtxCumhhwP9o//2BEVJIw7fUIy3XyHchjoj8/y3Hfq4DjlEoFNgWIo9TRHmOp1z4VsdkrJcbmEaayQ75+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621390; c=relaxed/simple;
	bh=riRIzhGsdbKO3Sm6KpCpKEg2NVYKDNFOvIPxHlr1NtM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BRH3rdvd6GaWYYuwtZgoijOu/KwOMH5HrY1rK13eIQZnXHh08SimzNcqbpMkCuNAN7Xa0ZuYC2lEzbhQME3HlF5S8nM2gb/l9fE47eu4Rgvd+StMdfc262fffnP9Vud9EGoByPyrO9wazQyZ9IGa5U5uimS0xAQCq3lGgoJ1zvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=fStN5mjm; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fStN5mjm"
X-UUID: a9649876c48511f1b1788b6acf885367-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TsJtz8fdnCdWlLckY0xo4dGvlNGWesYSOzQFzW8uTng=;
	b=fStN5mjm2tDALLBfqoRZ7oP5bvTjLsa22IveUBZilwCnEU4Am70ZqM87tbzJTE/evRxx1IxY4x5vIowo62sJ8HKJbqDbDQDANnlCdPTaYoqQOYFoCx9+Is7YdtWLiOCMDWd63r2Uy7llyQZgNRFixNkrF9bqma3MsUcIzmhkXgI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:64b2952f-ca6d-4c08-b973-eabf2b60be02,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:db27edb8-514b-419b-be8a-53f1868a3ee6,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|52|
	99,EDM:-3|-100,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a9649876c48511f1b1788b6acf885367-20261010
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1186248220; Sat, 10 Oct 2026 16:36:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 16:36:16 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 16:36:14 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v8 00/14] media: mediatek: vcodec: support video decoder in mt8196
Date: Sat, 10 Oct 2026 16:35:59 +0800
Message-ID: <cover.1791619742.git.kyrie.wu@mediatek.com>
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

This patch set adds support for the video decoder on the MediaTek MT8196
platform, leveraging the VCP microprocessor for enhanced performance. It
introduces new firmware interfaces for kernel-side communication with VCP,
adds MT8196 compatible, codec levels/profiles, and private data. Rewrites
the AV1 driver to support extended VSI structures, then change irq table
and cdf table size.

This patch set depends on "Add MediaTek VCP remoteproc driver support"[1]

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20260427111446.22955-1-xiangzhi.tang@mediatek.com/

Compliance Test Result:
- v4l2-compliance: 48/49 tests passed, 1 failed (known issue)
- fail: v4l2-test-controls.cpp(981): ret (got 13)
-        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Fluster Test Result:
- H264:
- Ran 95/135 tests successfully   in 73.540 secs
- H265:
- Ran 142/147 tests successfully  in 100.168 secs
- VP9:
- Ran 276/305 tests successfully  in 106.804 secs
- AV1:
- Ran 240/242 tests successfully  in 23.991 secs

These test results were reported for v7. The v8 change only updates the
DT binding subject and description; no tests were rerun for v8.

Changed in v8:
- Rebased on Linux master at 3857c2f.
- Update patch 8/14's subject and describe VCP as the coprocessor running
  the video decoder firmware, per Rob Herring's review.

Changed in v7:
- Rebased on top of the latest media tree
- Update the MT8196 decoder binding to require VCP, reject SCP, and validate
  the four fixed hardware clock names on each decoder child node.

Changed in v6:
- Rebase to latest codebase
- Change patch authors and Signed-off-by trailers to Kyrie Wu
- Use safer firmware selection flow for decoder and encoder initialization
- Add VCP IPI id validation and keep invalid messages from stopping the
  message processing thread
- Fix VCP ACK state handling, stale ACK handling, and interruptible ACK wait
  retry handling
- Stop the VCP message thread, unregister callbacks, and release the VCP
  remoteproc reference during cleanup
- Replace VCP readiness busy-wait polling with sleepable polling
- Add VCP encoder capability callback
- Fix MT2110R debug output string
- Update the MT8196 decoder binding commit message according to review
- Keep MT8196 compatible definition before patches that use it
- Fill AV1 reference C plane buffer size

Changed in v5:
- Rebase to latest codebase
- Move vcp init method to driver pdata structures
- change decoder dt-bindings patch's commit message
- MT8189 base on MT8196 patch set

Changed in v4:
- Rebase to latest codebase
- Move dt-bindings and compatible to the after of vcp driver ready
- MT8189 base on MT8196 patch set

Changed in v3:
- Depends on change no update
- Add Compliance and Fluster test result
- Re-write the commit message for patch 12
- Change the patches according to review suggestion for patch: 3/4/5/6/14

Changed in v2:
- re-write the commit message for patch 1

Kyrie Wu (14):
  media: mediatek: vcodec: support vcp architecture
  media: mediatek: vcodec: add driver to support vcp
  media: mediatek: vcodec: add driver to support vcp encoder
  media: mediatek: vcodec: get different firmware ipi id
  media: mediatek: vcodec: get share memory address
  media: mediatek: vcodec: add debug information
  media: mediatek: vcodec: send share memory address to vcp
  dt-bindings: media: mediatek,vcodec-subdev-decoder: Add MT8196
  media: mediatek: vcodec: add decoder compatible to support mt8196
  media: mediatek: vcodec: define MT8196 vcodec levels.
  media: mediatek: vcodec: support 36bit iova address
  media: mediatek: vcodec: clean xpc status
  media: mediatek: decoder: fill av1 buffer size with picinfo
  media: mediatek: decoder: support av1 extend vsi

 .../media/mediatek,vcodec-subdev-decoder.yaml |  49 +-
 .../media/platform/mediatek/vcodec/Kconfig    |   4 +
 .../platform/mediatek/vcodec/common/Makefile  |   4 +
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  21 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  33 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   8 +-
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  12 +
 .../vcodec/common/mtk_vcodec_fw_scp.c         |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 631 ++++++++++++++++++
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 166 +++++
 .../vcodec/common/mtk_vcodec_fw_vpu.c         |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  21 +-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   3 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  31 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        |  13 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |   6 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 114 +++-
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  11 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  12 +-
 .../vcodec/decoder/vdec/vdec_vp8_req_if.c     |   5 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  27 +-
 .../mediatek/vcodec/decoder/vdec_ipi_msg.h    |   2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  12 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |   2 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |   4 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   2 +
 27 files changed, 1140 insertions(+), 56 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

