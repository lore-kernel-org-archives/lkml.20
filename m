Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311391;
	b=oqEFtBfmJMr8qK5+ehxIX02n9LY1C8kCtAdFugF306I/lc1l+kPQvVPN94oVsMNIsDyZ
	 1wk3Tp41dD+WN3AK8xB7srbdA31HjafUD6Tzu95ahvtcDsxwNEs93AjnYt9tnnhlZXbKm
	 oivhpvDNUtnV+X8B+Y0It9G9S4sR+wJHUSJuBG8nGMQBO6EwTqJwXYHz1YPRRsrZLuOB7
	 dIko6cwAhZ8HkRDEkuRaHJmFAOhKzldJOWokejwojb/QiTYAbABKaXsH3tpcctuGW4P/m
	 ahdc8Rg53BWxhJOoYMXnL6r1RWLPdupEU8RqBoc45R99aSMc+ZSLkvo8luch/3Hz3dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311391;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=5MFak8Bg9i/mQ+Qaw0YkrN7t0h0c/xyAJIn04TPnDno=;
	b=FIwLMQJgjYQJuXMC8COQS8i7Mv4pheDWtxxaLrqJUqCQGAVmzZBRpB/a37K6Mge9L9cn
	 rld3Bh2e54fCvT/c8rM3ctqrgqDySCohfEJ9nJYGGnWxeVurI5Xv4yLMd9/BvlJ4EsXrI
	 1eaQSYnXOROGW+G/kUloX+yhRXffSJAbLcYhrPtP51EiMef6ercq1ypfUS5sQK03OAizz
	 V8ImJtuIZ3SQmfyQLOjVv3nwEZKoJAmCzxfvlU22bLnA1fOR6z369lLWICtSZXb/oItbi
	 4hj5mIJAsulA17+YA/ad7qyjDvgXrFF6sZVLSudE7c1yrteekAVnjcSuxcZnbX6euHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=jdyYrRTb;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60A5606A31C;
	Tue, 10 Nov 2026 11:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=jdyYrRTb
X-UUID: d393dd2adcfc11f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5MFak8Bg9i/mQ+Qaw0YkrN7t0h0c/xyAJIn04TPnDno=;
	b=jdyYrRTbmVL89ExCcXiVw6yAwVjchjWlATZ7EYTb87dcgK1VL6VNl0l/ni00Sxg1bciV8WBTvDGIRyU1sWmy+7DSBACv+P9yC8ZaW1BiQZHjcw3s1IkRIVYToiHTOV/qQZUcn6jdMxhTEzX0T8Iim0U/PAwqja7GwYtdo5UKVHI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7fbbf487-c591-4b36-a7d8-9ab38cca1f43,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:15221966-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d393dd2adcfc11f18dc8c9802ae25ab1-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1823166073; Tue, 10 Nov 2026 19:49:46 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:45 +0800
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
Subject: [PATCH v2 6/7] thunderbolt: decouple the waiting time of TB_PORT_UNPLUGGED and TB_PORT_UP
Date: Tue, 10 Nov 2026 19:48:54 +0800
Message-ID: <20261110114925.722014-7-chunfeng.yun@mediatek.com>
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

When usb4 is woke up by device disconnect, no need wait for 2s,
usually the phase2~4 takes at most about 200ms, and enters to
TB_PORT_CONNECTING, if it is still in TB_PORT_UNPLUGGED after 400ms,
treat it as disconnected.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
new changes
---
 drivers/thunderbolt/switch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7daee83c7ed8..e12546bfb869 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -489,8 +489,9 @@ int tb_port_state(struct tb_port *port)
  * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
  * wait_if_unplugged is set then we also wait if the port is in state
  * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
- * switch resume). Otherwise we only wait if a device is registered but the link
- * has not yet been established.
+ * switch resume, Wait at most 400 ms for link to start connecting,
+ * if timeout, means the device is disconnected). Otherwise we only wait
+ * if a device is registered but the link has not yet been established.
  *
  * Return:
  * * %0 - If the port is not connected or failed to reach
@@ -501,6 +502,7 @@ int tb_port_state(struct tb_port *port)
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
 	int retries = 20;
+	int unplugged_retries = 4;
 	int state;
 	if (!port->cap_phy) {
 		tb_port_WARN(port, "does not have PHY\n");
@@ -519,7 +521,7 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 			return 0;
 
 		case TB_PORT_UNPLUGGED:
-			if (wait_if_unplugged) {
+			if (wait_if_unplugged && unplugged_retries--) {
 				/* used during resume */
 				tb_port_dbg(port,
 					    "is unplugged (state: 7), retrying...\n");
-- 
2.45.2

