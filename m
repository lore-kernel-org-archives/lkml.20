Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886217;
	b=RKmBM3rfUJxXZBFX2wtDcW6wAz3bf1q7Uo3w6+acpPgI57KkQxE1XpnCzFzY+ezoLceX
	 i/9+PbC5HDEY70C+THfJD9WfAmDwCY6Rh88CakPr0TWPintfj10LjxZalqtmVtuByce80
	 NlYWX6Z5v80CALWvM9ILiKMirCJsLkpG/x4lF8yiFw6P+cwMxr8gpww01kCtAtemHjjB2
	 3NB16HWkqGs+CZY+zIN597zwQVs4SPUIxL/+iV7JZhDD3q4gTYYt/fd35b/ftrBAeOm/g
	 Qo2xMbKYVrpIohwaoeDdOymeN8A4gjuC8DpJU+rqVfG2z+rSMhUdY7vu3WfyFvSfm8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886217;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=ZEXmGBXXJye9IGt3EKcRUDkbiwRap/GPuyXTExPamXo=;
	b=oe5I7XszIx3Ogg16YwOfCjhyxpftnHXYKT8iji0q5EKQjm0QJxNG4nDT9+NOMFBL2UDz
	 geo6t7m5KIvI4Ctbo/wOENn5Gy3UOFdHulIfgmb8g5tHBHeLwSNwX76un3L5mdMGJPYpD
	 /OivlYbhifUZDRgESl47XiqDA5WrTgv3KAmXhsjP3gmKAaJglxe2GR0oG4h7O702576sR
	 nWlUdFcl7DIvcGkCAzDeCnjjzMt21h5TNLptIALnEiS5wjKG4v6XQg3TRlAilad3iABPM
	 XJ/20It77PqFPd07IWypm0YZ/TiFYJ+J/yU8ogBVsQyFwjM+t+ORFv4trze8uI/RcQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ICa2PKhr;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733FD606A31C;
	Tue, 17 Nov 2026 03:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ICa2PKhr
X-UUID: 303a48e0e23711f1b1788b6acf885367-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZEXmGBXXJye9IGt3EKcRUDkbiwRap/GPuyXTExPamXo=;
	b=ICa2PKhr2GM+Fhf8IVvWB75y9txQteto/L2+lSolo/QQo9wfVq1hWa1OE1dlcwzoZVpBbv9rVwayuTwCc8MULk+dUrHkRuGknyndgCkswOCyIcrmwljubUbW6fBvyEmULpurSn/+RFpffguzjIBRkWaqiNPl3dWSH9WC5iVpjg8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:89f25594-bd91-4c7e-a74f-7fc4172d8927,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:09965e33-b2d3-41c8-8b07-c8724f80a34e,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 303a48e0e23711f1b1788b6acf885367-20261117
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 436069956; Tue, 17 Nov 2026 11:30:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 11:30:04 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 11:30:03 +0800
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
Subject: [PATCH v9 07/14] media: mediatek: vcodec: send share memory address to vcp
Date: Tue, 17 Nov 2026 11:29:43 +0800
Message-ID: <20261117032950.1425556-8-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
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

The share memory is allocated in kernel for vcp architecture, it's
different with vpu which share memors is reserved in vpu micro
processor. Need to send share memory address to vcp.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/vdec_ipi_msg.h      | 2 ++
 .../media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
index c2c2a3a63..8b771d470 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
@@ -67,11 +67,13 @@ struct vdec_vpu_ipi_ack {
  * @msg_id	: AP_IPIMSG_DEC_INIT
  * @codec_type	: codec fourcc
  * @ap_inst_addr	: AP video decoder instance address
+ * @shared_iova	: reserved share memory address
  */
 struct vdec_ap_ipi_init {
 	uint32_t msg_id;
 	u32 codec_type;
 	uint64_t ap_inst_addr;
+	u64 shared_iova;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index cdb673e6b..50f1e1613 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -4,6 +4,8 @@
  * Author: PC Chen <pc.chen@mediatek.com>
  */
 
+#include <linux/stddef.h>
+
 #include "mtk_vcodec_dec_drv.h"
 #include "vdec_drv_if.h"
 #include "vdec_ipi_msg.h"
@@ -210,6 +212,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 int vpu_dec_init(struct vdec_vpu_inst *vpu)
 {
 	struct vdec_ap_ipi_init msg = { };
+	size_t msg_size = offsetof(struct vdec_ap_ipi_init, shared_iova);
 	int err;
 
 	init_waitqueue_head(&vpu->wq);
@@ -236,10 +239,14 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	msg.msg_id = AP_IPIMSG_DEC_INIT;
 	msg.ap_inst_addr = (unsigned long)vpu;
 	msg.codec_type = vpu->codec_type;
+	if (mtk_vcodec_fw_get_type(vpu->ctx->dev->fw_handler) == VCP) {
+		msg.shared_iova = vpu->ctx->dev->fw_handler->vcp->iova_addr;
+		msg_size = sizeof(msg);
+	}
 
 	mtk_vdec_debug(vpu->ctx, "vdec_inst=%p", vpu);
 
-	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
+	err = vcodec_vpu_send_msg(vpu, (void *)&msg, msg_size);
 
 	if (IS_ERR_OR_NULL(vpu->vsi)) {
 		mtk_vdec_err(vpu->ctx, "invalid vdec vsi, status=%d", err);
-- 
2.51.0.windows.2

