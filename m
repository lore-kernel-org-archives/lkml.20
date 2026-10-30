Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348760;
	b=a9jOYziW7LegQq+S1rbDUvedw8OejthI33qSu27o0KOTjvhOhOlv9+bWgC1aKYBAIWbg
	 88UoQhHiSHQLPibV6cwbDucEZbvG0pyStr+EGBdVapanZiK2HODe+5smmEWKIgJczc6KD
	 bMSEDO0PIZ9B80c3zHPO0e4nRW8GbILlUPkM23KbXMYHFHVcv54qzzV56MwbszrFO+0HQ
	 JDy2lZLcHbbtfzkNwnDe3wl7q3RJOShkWQiD8YUoqBo23qlEiHbjjqb44ZQ0JmII5gqzd
	 GTh34FOQNnot+H7HFI8guL35qhxO/m0rmZQlLzAPjdWtLfbSrWfH/zsIow3uAt1CL7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348760;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=nFSrdi8B+V4M8lR/Laz8DolSkuuYIVlmri4bckiEtjg=;
	b=Tb4sw8bQru534A3x9Nzboc2ax3Z2ESIqEEiNBfQjywu/PYmvO0UEEtv01ZNnxqxMOHA3
	 hlce2BDnyYZxYIm5QejvRHU3B0IJzsssAc/jQAzSzmyv5EYu4cyBRbB6TMZuUYBtXTUti
	 Tr9slK4rNzTv4CXlwWJOStWGGv0nuHRB6WHa0J6JzjvAcnRni18cYebWT/9Fv4QvrPno3
	 kQocVcgNNzIzvrjS9SS2q5gsmyFbpUGtRUGQUceAZKrnI0stmHu7EkFAV23GtLTGyaofi
	 cQKQNlVNGor2FNRLC9DUldhgGr0bUnCoAnJpJolqiFcLdsQ5IRI2ZYsWrHiCGybF6VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Cc4G9LaZ;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60249606A31D;
	Fri, 30 Oct 2026 08:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60249606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Cc4G9LaZ
X-UUID: 86693d34d43b11f18dc8c9802ae25ab1-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nFSrdi8B+V4M8lR/Laz8DolSkuuYIVlmri4bckiEtjg=;
	b=Cc4G9LaZlSxkLaREgge9ctCkV8Lm39gB77Q87m9WLSG4s67dGo2Kkz6uQzdfnFcXI0G0yydxBDiQIQm9d3F8C+0+WUdVwSpLdFVjW+r11nOvSM4LkwTMyvivsAz+eKG6HAsn60P68vTsF2GOGFHhF6rn+JaVeHuTFsgtSxBqRf4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:d3b3a884-c70b-4d97-81f7-3b7774ed0a33,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:6afee7ed-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 86693d34d43b11f18dc8c9802ae25ab1-20261030
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 374960647; Fri, 30 Oct 2026 16:25:54 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 16:25:53 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 16:25:52 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat
	<YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 3/4] thunderbolt: improve usb3 adapter link up timeout value
Date: Fri, 30 Oct 2026 16:25:38 +0800
Message-ID: <20261030082539.1208733-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
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

when plug into a usb3 device into usb4 hub's DFP to trigger usb4
driver wakeup, encounter usb3 link up timeout issue, then cause
usb3 hub disconnect:

usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
usb4_hi NVDA8100:00: 0:4 <-> 1:20 (USB3): deactivating
usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:20
usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:20 to 0:4
...
thunderbolt 0-1: device disconnected
usb 2-1: USB disconnect, device number 10

Completes link training at ~1.48s and transitions to TB_PORT_UP after
change the timeout to 2.5s:

In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
1000 ms. When add tPhase3 (100 ms), tPhase4 (100 ms), and retimer
transaction delays (tCmdResponse = 50 ms), the physical link is
allowed by spec to take 1200 ms to 1500 ms+ to complete initialization.

here are two retimers in the link, if more retimers add it, need more
time

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/thunderbolt/switch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db8f890..e7ee9639c54c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -500,8 +500,9 @@ int tb_port_state(struct tb_port *port)
  */
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
-	int retries = 10;
+	int retries = 25;
 	int state;
+
 	if (!port->cap_phy) {
 		tb_port_WARN(port, "does not have PHY\n");
 		return -EINVAL;
-- 
2.43.0

