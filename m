Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611528;
	b=xsspIUUzWvC0bLr1cdFwgsroRXhRr4rKuv7sWs0roG12xlSKt6rDdvO8Y3vZ8ADPwQoL
	 nuLcUqf2zs8CYV8ABSaR2OneLrFfvPc/8kb6Hy0JQGkSWp7iJowkrjVOu4qnq2nnnpjON
	 n3EidzxNBEKUQy2AeAAjn3ZIvJBw4c4va9aBLvVuIS31hrZUO7SGU/yzOaEL/0W5VxogM
	 SXR+aUz+6+VUE1Y0RVflvc2OVWbRs4gFzrx/4wVOX/9uQj9vXKKAab72BABt0KUGuavYX
	 NL55kCf4qw7gIhhW4KAfZG4HhwCsIuHI0HIZtgpZeRzcvCUwbHpkq6Xs/T2m9tervCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611528;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=IsopkYbASgaNsvWK1EU2JdJ6JNwJnxcBHh6aeYgiZ/0=;
	b=Zc44vVAUgf6ZEDuJBO34DH95jUBqJNghnYUIf6TuyacU8DpdtzLhhigumdAIfAV2m4++
	 pFc1v0ZxwgD136gDTml+gv+Ogl1xSI5QlpKGv9IXYQe+cPlc9+Jb9Qq6FQ7DH7XJuYC18
	 cVZS2kgRYog0Juk/htykJib7KflPyV2oPH5vnXXFSsjCtFqLe7Z9Vree/f2qxV8wKXfZu
	 rhp42K9y/NJBDRGYjTlKHo7uUJMDEiUResXnPkrK5M02Xb//XzBsfYZ8VF41CT56EGjUF
	 88qC37on1y6SAbpE3uTnHzINehfjRnRG+2gdiJ5GVuIuj1Nb9fhVW3HNnLRLs3mbOlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ih3rFhL9;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1587606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1587606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ih3rFhL9
X-UUID: 541e4dead69f11f1b1788b6acf885367-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IsopkYbASgaNsvWK1EU2JdJ6JNwJnxcBHh6aeYgiZ/0=;
	b=Ih3rFhL9tbvv6T/AbGdCZZ/HbDETusxr8olbYd2qabPumZRxQfn+FmvG/PyJhy9ps9cRS0LOKaqwYM6aIHbwp/n7yrekt7htdHvjMjeIVxWDbKBYWXXY1RF3NmCX6I/b5bZfSQ2HS2+ZAR6G2PKVgdSuUXDiCBJ6qK7FiTyNtvQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7e767894-e737-4bd9-969e-6d8140fef31c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:d73602ee-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 541e4dead69f11f1b1788b6acf885367-20261102
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1697444797; Mon, 02 Nov 2026 17:25:22 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Nov 2026 17:25:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Nov 2026 17:25:22 +0800
From: santino.wang <santino.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<arnab.layek@mediatek.com>, Santino Wang <santino.wang@mediatek.com>
Subject: [RFC PATCH 11/11] Documentation: ABI: add the sysfs attributes of the MediaTek DRAM ECC driver
Date: Mon, 2 Nov 2026 17:23:33 +0800
Message-ID: <20261102092334.138759-12-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
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

From: Santino Wang <santino.wang@mediatek.com>

Document the error counters, the retired page counters, the recorded
error addresses and the policy attributes that the driver adds under
its class device.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 .../ABI/testing/sysfs-class-mtk-dram-ecc      | 182 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-mtk-dram-ecc

diff --git a/Documentation/ABI/testing/sysfs-class-mtk-dram-ecc b/Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
new file mode 100644
index 000000000000..7b31bd663c53
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
@@ -0,0 +1,182 @@
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/volatile_ce
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/volatile_uce_inline
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/volatile_uce_ondie
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/volatile_uce
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of corrected (CE) and uncorrectable (UCE) DRAM ECC errors
+		reported since the system booted, as a decimal number.
+
+		Inline ECC detects every UCE, including one that originates in the
+		DRAM die, so volatile_uce_inline is the total number of UCEs and
+		volatile_uce is equal to it. volatile_uce_ondie counts the subset
+		that on-die ECC also flagged.
+
+		Access: Read
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/agg_ce
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/agg_uce_inline
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/agg_uce_ondie
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/agg_uce
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of corrected (CE) and uncorrectable (UCE) DRAM ECC errors
+		accumulated across boots, as a decimal number. The counters are kept
+		in EFI variables that the system firmware creates.
+
+		As for the volatile counters, agg_uce_inline is the total number of
+		UCEs, agg_uce is equal to it and agg_uce_ondie counts the subset that
+		on-die ECC also flagged.
+
+		Access: Read
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/retired/by_ce
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/retired/by_uce
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of pages retired since the system booted because of
+		corrected errors (by_ce) or uncorrectable errors (by_uce), as a
+		decimal number. Each page is counted once.
+
+		Access: Read
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/addresses/current_boot_ce
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/addresses/current_boot_uce
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		System physical addresses of the corrected (current_boot_ce) and
+		uncorrectable (current_boot_uce) errors reported since the system
+		booted, one hexadecimal address per line. At most 256 addresses are
+		kept for each kind.
+
+		Access: Read
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/containment/enabled
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Whether the secure firmware handles and reports DRAM ECC errors.
+		While it is disabled, the secure firmware only clears the error
+		source and publishes no record. Writing the value sends it to
+		the secure firmware.
+
+		Access: Read, Write
+		Valid values: Represented as boolean
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/containment/default_severity
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Severity the secure firmware reports for a contained uncorrectable
+		error that is not covered by an entry of policy/address_range.
+		Writing the value sends it to the secure firmware.
+
+		Access: Read, Write
+		Valid values: "fatal" or "recoverable"
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/storm_protection/threshold
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of error interrupts within policy/storm_protection/time_window
+		at which the secure firmware stops reporting DRAM ECC interrupts, to
+		protect the system from an interrupt storm. Writing the value sends it
+		to the secure firmware.
+
+		Access: Read, Write
+		Valid values: Represented as unsigned integer
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/storm_protection/time_window
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Length of the window, in milliseconds, in which the secure firmware
+		counts error interrupts for policy/storm_protection/threshold.
+		Writing the value sends it to the secure firmware.
+
+		Access: Read, Write
+		Valid values: Represented as unsigned integer
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/storm_protection/cooldown
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Time, in milliseconds, after which the secure firmware reports DRAM
+		ECC interrupts again once storm protection has stopped them. Writing
+		the value sends it to the secure firmware.
+
+		Access: Read, Write
+		Valid values: Represented as unsigned integer
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/leaky_bucket/threshold
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of corrected errors on a page at which the page is retired.
+		Writing 0 restores the default of 100.
+
+		Access: Read, Write
+		Valid values: 0 to 10000
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/leaky_bucket/decay_interval_sec
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Interval, in seconds, at which the corrected error count of every
+		tracked page is decreased by one. Writing 0 restores the default of
+		3600.
+
+		Access: Read, Write
+		Valid values: 0 to 86400
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/leaky_bucket/max_tracked
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Maximum number of pages whose corrected error count is tracked at
+		the same time. Writing 0 restores the default of 16.
+
+		Access: Read, Write
+		Valid values: 0 to 16
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/address_range/entries
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Address ranges for which the secure firmware overrides the default
+		severity of an uncorrectable error. Reading lists the table held by
+		the secure firmware, one range per line, as
+		"<start> <end> <severity>" with hexadecimal addresses, where the end
+		address is exclusive.
+
+		Writing "<start> <end> <severity>" adds or updates one range. The
+		severity is "fatal" or "recoverable".
+
+		Access: Read, Write
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/address_range/clear
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Writing anything to this attribute removes every range from the
+		table of policy/address_range/entries.
+
+		Access: Write
diff --git a/MAINTAINERS b/MAINTAINERS
index e7d25be97f24..d1ab5806ad9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17032,6 +17032,7 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
 F:	drivers/soc/mediatek/dram-ecc/
 F:	include/uapi/linux/mtk_dram_ecc_netlink.h
 
-- 
2.45.2

