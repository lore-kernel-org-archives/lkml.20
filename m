Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311391;
	b=smHHkl8x2/uTxf7srcPpVvdQMwNaQ2XgjMFOw1xfSIIKlTAegxQw7WEI7zzTY47eOX0/
	 j6rTgcj6C/VQzCCXSVo6UmokDfPRzeFqhdwCrSvj3TXSfRfs1nbE/hQNzDOzyxK4UO7AN
	 mjR7h23tfOYkTZITc6NXF0OCDXMCC4vdSunMYNSovDgDWOHeXGg6sJhC2rBerjgkNQLlF
	 ckXB2TKWFhJlL/zzppHmWFzHo43JmZIio8jh26wsMA81KNOe1cw1fCbMVxU/ZdvtOaOJt
	 L85OO1TJnz20yv8oNSxnrqIazzSIRVqhvsuwn/Vv8bSpkiw6qW2X+Xlti69fMFkJQLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311391;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=UxQvBCWTGDJp0csChHCGxtym2Bdka/KsE4W82hKPGgY=;
	b=amxQ3p5r+EnUkHzF35giRDepn1I4a0s6uxw86LLAfZ38dU1de83BooHKRhnYXjBmxqHN
	 SG+zFpPRzWFlaiJTLoK4WatAY1TmUCp1sPSgjZZ7DZ4iiCdUJIzBFy2OkMZ1iOw8jrJl5
	 fSnPdw+V7DH+MKLRtlIvoCN62MVwz72td8cuoka1Lqd1y4UiiJuqD85mRjenNkaQ12Ywk
	 ncEKLcrT4VsM8rh65DHUYW1L6tUG51TflxyKOHON5NQk4+YXPtIx4kijx1iH6FTfZrTpu
	 T4tvklEIyd/rFFP0X1OzBrwN6vyANr23NZirNWTZ/yuneV/R8wMD7mnEDYov7Ib3Fpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=sEzBpdmI;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CD7606A331;
	Tue, 10 Nov 2026 11:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50CD7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=sEzBpdmI
X-UUID: d3360cf4dcfc11f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UxQvBCWTGDJp0csChHCGxtym2Bdka/KsE4W82hKPGgY=;
	b=sEzBpdmIMpkLNhDRTseC9NI/0H8iuovYvsE/TvjNnuzaKTi2i6MNoG/imoDhqJ1RqpuE+qaP5R5N0chTVF2Yizq5J8uH5zEFNUz8ZX6RU7DiJ4gWUcQsw/X5aQjLh3kC2nruW5Zt3C8HcHdGTDoyDASJnvnLHxS3Y/mi7TyGEPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:3ce510e2-18b3-43a5-9cfe-7780639db0b3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:96428d8d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d3360cf4dcfc11f18dc8c9802ae25ab1-20261110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 891433865; Tue, 10 Nov 2026 19:49:45 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:44 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 19:49:44 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH v2 5/7] thunderbolt: increase the lane adapter link-up timeout value
Date: Tue, 10 Nov 2026 19:48:53 +0800
Message-ID: <20261110114925.722014-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
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

when plug into a USB3 device into USB4 hub's downstream facing port
to trigger usb4 driver wakeup, encounter the lane link up timeout
issue, then cause usb3 hub disconnect:

usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
usb4_hi NVDA8100:00: 0:4 <-> 1:20 (USB3): deactivating
usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:20
usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:20 to 0:4
...
thunderbolt 0-1: device disconnected
usb 2-1: USB disconnect, device number 10

Completes link training at ~1.48s (with two retimer) and transitions
to TB_PORT_UP after change the timeout to 2s;

In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
1000 ms. When add tPhase2~4 (200 ms), and retimer transaction delays
(tCmdResponse = 50 ms), the physical link is allowed by spec to take
1200 ms to 1500 ms+ to complete initialization.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: change timeout from 2.5s to 2s
---
 drivers/thunderbolt/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7ff3da79da76..7daee83c7ed8 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -486,7 +486,7 @@ int tb_port_state(struct tb_port *port)
  * @port: Port to wait
  * @wait_if_unplugged: Wait also when port is unplugged
  *
- * Wait up to 1 second for a port to reach state TB_PORT_UP. If
+ * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
  * wait_if_unplugged is set then we also wait if the port is in state
  * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
  * switch resume). Otherwise we only wait if a device is registered but the link
@@ -500,7 +500,7 @@ int tb_port_state(struct tb_port *port)
  */
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
-	int retries = 10;
+	int retries = 20;
 	int state;
 	if (!port->cap_phy) {
 		tb_port_WARN(port, "does not have PHY\n");
-- 
2.45.2

