Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311393;
	b=kkPcB9jvc9nvhLyUyIXyeKcdO17l1xwgS+5X5ReRs9H8bPPedb6yq4S8GzpAjPHRxwZg
	 fvPYG6jvw/Ofrc8MolsfJsnAd3mquplOttjpTXKYjIOgSU3nyalxP67UNessfrXyECvct
	 iJVDcxkFEjbK0dvd1C4osyDeQBIKy1/y5HlmykgiXpV/Is63SwuIWEp23Rf25eiWjIktR
	 HU7cGNbk8koIHe+9YFMQM/DBarMKoickQqhz7sRP0pfHkQsJWNypBHhz58DQ4nIBCB5Ya
	 ErfOI+yl3r7EiJHFgsZDwX7FJ8e0AyEul/makjZv72BMnCFGkf1dREZb/txL+WvM2Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311393;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=gzuubq8Iy2353W0seuyyp5YBYZd9zRG3lSyOZYgRyCY=;
	b=WhhUtJNhT2VoGCPknw9II/8JaHh+kUJjqbRpwaYg6VbsBHM0YJH5kuX/lJ0Dj2QKoKWe
	 cmeGsqFQ66Snvm74pmHG3fzWSr6QxrrVTDGdIKcJYxxGGZX3mKmU9zEAAEFizbgls98lz
	 361mkEIXjmvBml5D9Lge+vDN7e2eqBWcUDub5sPlilZrk+81gKpraTBLwjbj/wKIpXTF6
	 9XFVP528uDaHTau9/wVHJ4Oi2JdTTRB+JHPUxUNFEKzt00u/iOoXNnQEaTH07pynz99zu
	 rbKBCe1A5Dj+Ioy2QjVk58syrp4Wvh3hGxfI/GSv1ZOGTXi9itN5V3DmvoCo09DgMpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MtDmdldx;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA57F60A2607;
	Tue, 10 Nov 2026 11:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA57F60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MtDmdldx
X-UUID: d438be1cdcfc11f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gzuubq8Iy2353W0seuyyp5YBYZd9zRG3lSyOZYgRyCY=;
	b=MtDmdldxgOzoX0Ozlu7ERQ4THpyzXwFQIxqWTx6ui7o9K0imNhdYIU9M6NOIfiJdhhiCxa4DcysfoXWULo/DOePQ0rNJtG+020xonHjJypLG7MUL0BpYzRMJRuMClbmOiw5u9TuoY70tSV/oOPS2XyFt/AcItemhp35UySpc9YM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:388ab836-a4db-4e7d-8697-0026260d6b8e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:acb91457-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|16|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d438be1cdcfc11f1b1788b6acf885367-20261110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1739390342; Tue, 10 Nov 2026 19:49:47 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:46 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 19:49:45 +0800
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
Subject: [PATCH v2 7/7] thunderbolt: prevent pcie tunnel activation/teardown warnings
Date: Tue, 10 Nov 2026 19:48:55 +0800
Message-ID: <20261110114925.722014-8-chunfeng.yun@mediatek.com>
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

When usb4 enter sleep mode, echo 1 to authorized of sysfile,
will wakeup usb4 driver, but fail to create pcie tunnel, cause
the warning due to a race condition between router disconnect
during resume and user authorization

[  278.831186] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7), retrying...
[  278.943031] usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
[  278.951125] usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
...
[  279.013763] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activating
[  279.019587] usb4_hi NVDA8100:00: activating PCIe Down path from 0:7 to 1:9
[  279.026468] usb4_hi NVDA8100:00: 1:1: Writing hop 1
[  279.031335] usb4_hi NVDA8100:00: 1:1:  In HopID: 8 => Out port: 9 Out HopID: 8
[  279.038546] usb4_hi NVDA8100:00: 1:1:   Weight: 1 Priority: 3 Credits: 32 Drop: 0 PM: 0
[  279.046536] usb4_hi NVDA8100:00: 1:1:    Counter enabled: 0 Counter index: 2047
[  279.053834] usb4_hi NVDA8100:00: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  279.062259] usb4_hi NVDA8100:00: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  279.069730] ------------[ cut here ]------------
[  279.074335] usb4_hi NVDA8100:00: PCIe Down path activation failed
[  279.080426] WARNING: CPU: 5 PID: 2433 at drivers/thunderbolt/path.c:587 tb_path_activate+0x1a4/0x5b0
...
[  279.220285] Call trace:
[  279.222722]  tb_path_activate+0x1a4/0x5b0 (P)
[  279.227068]  tb_tunnel_activate+0x140/0x498
[  279.231241]  tb_tunnel_pci+0x180/0x490
[  279.234980]  tb_domain_approve_switch+0x74/0xb0
[  279.239500]  authorized_store+0x214/0x270
[  279.243498]  dev_attr_store+0x20/0x70
...
[  279.288888] ---[ end trace 0000000000000000 ]---
[  279.293497] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activation failed

When usb4 enter sleep mode, echo 0 to authorized of sysfile,
will wakeup usb4 driver, but fail to disconnect pcie due to
the PCIe tunnel had already been torn down and freed if the port
is fail to resume,

[  545.887822] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7), retrying...
[  545.998689] usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
[  546.006778] usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
[  546.013474] usb4_hi NVDA8100:00: 0:4 <-> 1:16 (USB3): deactivating
[  546.020449] usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:16
[  546.027959] usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:16 to 0:4
[  546.035649] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): deactivating
[  546.042463] usb4_hi NVDA8100:00: deactivating PCIe Down path from 0:7 to 1:9
[  546.050320] usb4_hi NVDA8100:00: deactivating PCIe Up path from 1:9 to 0:7
[  546.057790] usb4_hi NVDA8100:00: 0: TMU: mode change off -> bi-directional, HiFi requested
[  546.067910] usb4_hi NVDA8100:00: 0: TMU: mode set to: bi-directional, HiFi
[  546.076120] usb4_hi NVDA8100:00: 0:1: total credits changed 66 -> 66
[  546.082844] usb4_hi NVDA8100:00: 1: link width set to symmetric, dual lanes
[  546.089815] ------------[ cut here ]------------
[  546.094420] WARNING: CPU: 7 PID: 2433 at drivers/thunderbolt/tb.c:2245 tb_disconnect_pci+0x108/0x120
...
[  546.238810] Call trace:
[  546.241246]  tb_disconnect_pci+0x108/0x120 (P)
[  546.245680]  tb_domain_disapprove_switch+0x24/0x60
[  546.250464]  disapprove_switch+0xbc/0xe8
[  546.254378]  authorized_store+0x19c/0x270
[  546.258378]  dev_attr_store+0x20/0x70
...
[  546.303767] ---[ end trace 0000000000000000 ]---

The check prevents a redundant lookup and eliminates the warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/thunderbolt/switch.c | 5 +++++
 drivers/thunderbolt/tb.c     | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e12546bfb869..6e9f439ebf3f 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1850,6 +1850,11 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
 	if (!!sw->authorized == !!val)
 		goto unlock;
 
+	if (sw->is_unplugged) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
 	switch (val) {
 	/* Disapprove switch */
 	case 0:
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 57c11ba13459..69310622d786 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2266,6 +2266,10 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
 	struct tb_tunnel *tunnel;
 	struct tb_port *up;
 
+	/* If the switch has already been unplugged, tunnels are already freed */
+	if (sw->is_unplugged)
+		return 0;
+
 	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
 	if (WARN_ON(!up))
 		return -ENODEV;
@@ -2288,6 +2292,9 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
 
+	if (sw->is_unplugged)
+		return -ENODEV;
+
 	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
 	if (!up)
 		return 0;
-- 
2.45.2

