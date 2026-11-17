Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886202;
	b=Kj60UfLBURqwQp/8UnnpOF0e3xqF1lQg+Q8nyTDji06eCxIVphpV8WzIOP0S4R0Nu09g
	 s+qgpde+OfD9P+fuZG6WiEdGXVG0fiCLVFNTeqC75q7k/Mn6rFL5Mcz4SAPhTr4OOxJbm
	 Gq42AkRJz+2TfcONgYFoXn9hc3tWeh35XshM7G6qj7iJBxt4rrlaC/Iq6DOgE9YYNCep9
	 ehoLKaHES7NkTk1+ba9nE6tNZfuSSFw3WsjAYYSeb+OZ8ZZeAryPOjvZ57QnVKHxK2oNr
	 tTJ0FPPsuMaeDhAGDDNxTWcpT5T4iqBX7mJAPJ6ztOjDhG4in7zlGL4YAw8uowlVH9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886202;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=aa07wRCQmEJ9AkdJ0/dRGM2JwpRTeKwR+zZmSvS1m+o=;
	b=Pl0DzfD9qYVzBn/hFv5q5yyFPoWE/n76kDwlL4kgAx6UKyDSLyQLMW1DT63K3C4P1kuI
	 /bRoVjSLLAipuKXRVLSu61g5tVbtdNbPE7KeKxCdKgjBfkziPTwpAa+TQW3UWix6aLURX
	 uQ7qChcsQLTwLDX5IlfkMCLEcgFqFh2z75fE/uM1a2lV2hm8cjOVSkOIlAljAvEqAg52J
	 qU5PoVGmwb01OIJnXaZ/8g4dtC3NVlf08mtTYnyNeH4D9TCVr/f9vC/A800vY+KO06bzl
	 JmcagCAucXhPgZNcWj/KGLuV+bZd9/0zSHnWGmk7Dl7bdlDJCVSrzA8Y0sbAXIr1+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=B+0N6ZWO;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3209F606A337;
	Tue, 17 Nov 2026 03:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3209F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=B+0N6ZWO
X-UUID: 27ed27f2e23711f18dc8c9802ae25ab1-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aa07wRCQmEJ9AkdJ0/dRGM2JwpRTeKwR+zZmSvS1m+o=;
	b=B+0N6ZWOJGXSxAXp4tQoGpmhSim0h4wjTt3QAnAgVh4aVhvG6cwy3NS5s9e7um625ileqb3589lHLE2QXveH/tSvvH/mtBBbw/G8emmfKg4Y3C3ZvgFacYAEUl85MTGn2ReoKGMyHSCKz0q8O/rEtJkvaSHq2mw7eNcXVfIkGvg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1695aa28-7c50-47e1-92e1-32b84f97e668,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:9881d552-04ef-4094-bd73-078046ac4d80,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 27ed27f2e23711f18dc8c9802ae25ab1-20261117
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1762392701; Tue, 17 Nov 2026 11:29:54 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 11:29:53 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 11:29:51 +0800
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
Subject: [PATCH v9 00/14] media: mediatek: vcodec: support video decoder in mt8196
Date: Tue, 17 Nov 2026 11:29:36 +0800
Message-ID: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Kyrie Wu <kyrie.wu@mediatek.com>

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

Changed in v9:
- Rebased on mainline 23c62304dde29abe92013d85910d03a77dada35d with the
  seven-patch VCP dependency [1] applied first.
- Patch 2: release the VCP reference even if feature deregistration fails,
  print the shared DMA address with %pad, and remove unused probe locals.
- Patch 7: preserve the 16-byte legacy VPU/SCP INIT message while sending
  the extended 24-byte INIT message, including shared_iova, to VCP.
- Patch 8: constrain MT8196 decoder children to exactly four clocks and
  update the binding subject and VCP/SCP description per review.
- Patch 14: save the validated remote AV1 VSI length and use it for both
  LAT and CORE outgoing copies.

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
  media: dt-bindings: mediatek,vcodec-subdev-decoder: Add MT8196
  media: mediatek: vcodec: add decoder compatible to support mt8196
  media: mediatek: vcodec: define MT8196 vcodec levels.
  media: mediatek: vcodec: support 36bit iova address
  media: mediatek: vcodec: clean xpc status
  media: mediatek: decoder: fill av1 buffer size with picinfo
  media: mediatek: decoder: support av1 extend vsi

 .../media/mediatek,vcodec-subdev-decoder.yaml |  52 +-
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
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  23 +-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   3 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  31 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        |  13 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |   6 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 126 +++-
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  11 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  12 +-
 .../vcodec/decoder/vdec/vdec_vp8_req_if.c     |   5 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  27 +-
 .../mediatek/vcodec/decoder/vdec_ipi_msg.h    |   2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  19 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |   2 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |   7 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   2 +
 27 files changed, 1156 insertions(+), 67 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
prerequisite-patch-id: 9f5a680ff9c58918d53c09c15d48e6ac33c643fc
prerequisite-patch-id: af540a1d2093ff0b635f96f3257fbf768302925e
prerequisite-patch-id: dee8633604fd7528e9ebcb9de25a3e42231f1f80
prerequisite-patch-id: f464ff9a2860b4fc07c051961e26c10047a1731d
prerequisite-patch-id: 1b9295ecd3895c60f6d5ab690f9c05987e1a551f
prerequisite-patch-id: a4abfe16fb9cfd55e44707491259f72f50783a33
prerequisite-patch-id: 472784c2603c63038b064dd36d867b9105a23eda
-- 
2.51.0.windows.2

