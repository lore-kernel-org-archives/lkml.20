Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348760;
	b=L4xIIorZ+qjAUBg1VTIQBc05yQV42sbNwUvOpXzgkN5/L3SOi8lFRGX1BqPzPf5avkw+
	 /13zYtEjyaZefM+zA/XlmscCC5OnMIdxWMemcWP90frVdCtosSlmrPwhz1EXXErf3QNKm
	 CrDLts6pEIMfVQrR7gZHU3lvqW18Oa0fp94Woj/HhwpqKu6ZOpCMo8tbdavQsIfLm5DEb
	 XeeTjpAmhOe+TRuds2NF35FDf8wsJouVs+3fFxVweT0biPw4f9B8MqQmxSfj9PnMXnqEf
	 qqvPdkPdF5vRfIKWZJlFHvSzUaClvoEpuVjATKLvXzE39YiMZLY7OsiYZw1rlc0WwzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348760;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=zZCXHcsj20L277u6o8q/giVinaSkSlxz7Hty4A7qzkE=;
	b=Sf0zVbdBArV1xSbZkCBcuJLe1OTwgWoGdQ5RZ6dtuA8Q2DhizSHagyf3SMRPGe7FuLqi
	 ImxMPGrU64cxEDBtXkYjUMA7W6vtWw3k9eAJ7qcR4KAzUYtuebIDqjfFSwN2G8gvWvbg/
	 esk0ZDikW/RUpJ3L8103rpPvwQUX16uqTnbEK3+YOgAPrwa1rbZb0EWrAuSoP6XZH1C2+
	 qa/wrHr0NNceMYS16v1tXzR4qbzjSNStOptgxrJXQ91bbKPC7WZdzVSS8i+nFJfUcI/Qa
	 kBJ/qU9chNAwFh+ZxWsBcF7keXpa9xzPUj/Q9AqB9EbAjUjTcJwFpW7Rze32fM+/wSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=TXgJd0ac;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35386606A32A;
	Fri, 30 Oct 2026 08:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35386606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=TXgJd0ac
X-UUID: 86e9a1aed43b11f18dc8c9802ae25ab1-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zZCXHcsj20L277u6o8q/giVinaSkSlxz7Hty4A7qzkE=;
	b=TXgJd0acITUbVSUbpYLf8PcSmOd71MH3UY+R2/u0QV1tj1dQpISx1Knc+Uq1Ilv+yUZoWsL7A7Gqu5FO80QP7wTar8MoEj5eckqq0U8BEJU7R/KjT3U0gGEfjOZl2WPdiwTKmW1JiOqQKBqKx1UslyJlLWwcfeoDSd2eDH0tuXo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:522cf33e-2406-4e33-adc3-e7710efc7644,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:ac1198ce-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|16|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 86e9a1aed43b11f18dc8c9802ae25ab1-20261030
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 657886533; Fri, 30 Oct 2026 16:25:55 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 16:25:54 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 16:25:53 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat
	<YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 4/4] thunderbolt: prevent pcie tunnel activation/teardown warnings
Date: Fri, 30 Oct 2026 16:25:39 +0800
Message-ID: <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
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

When usb4 enter sleep mode, echo 1 to authorized of sysfile,
will wakeup usb4 driver, but fail to create pcie tunnel, cause
the warning due to a race condition between switch disconnect
during resume and user authorization

When usb4 enter sleep mode, echo 0 to authorized of sysfile,
will wakeup usb4 driver, but fail to disconnect pcie due to
the PCIe tunnel had already been torn down and freed if the port
is fail to resume:

The check prevents a redundant lookup and eliminates the warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/thunderbolt/switch.c | 5 +++++
 drivers/thunderbolt/tb.c     | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e7ee9639c54c..7902172f4e99 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1849,6 +1849,11 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
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
2.43.0

