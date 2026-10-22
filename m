Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659315;
	b=ESC/btVq+u7f+VZiKv+6whaSO63GuoBOjQtcjZdiYQiDJL0pyxlbEuWj/RR61by8L9RN
	 digc8EZncPqnyohQnR+ZbLHDi/0P/pFsxQBPpkHMSOHn1k7JtJoxsi1avvR9Urj6RO1/z
	 QGEfNfMmeKbUoiSse0xHwbWOUEAqDx9XVtqfIViU5Utr2JbyYamQ3RFNl1sxVLRfk0tnA
	 aPDR1a0rxQaPrJFaALR3LSPCjRrh2/M90GbJVH2JeeAvs5Ib9VQ/ULUzBfmwdhj4Gam4X
	 uI2kFSCURrXyw6zeU4z/s/xqBVte9XS+87sCASX8ccEuHUmWlc7pQxbhOuRJ/1LEY+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659315;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=2rK4ek6R2FxmaG7c9tAqRDlXMKsebVTstRhPuv3hJpU=;
	b=uNZ1Jcf8nJXTIB3q1jDeG2odX/AdLdo8MfcFmdL3kFjdQnR+kzEDDYEsw3lCPaoKw4aC
	 ghyeT1ukbJpE/Ch1A+OOQL9wW7pfEBfArZ1NguVlcWdJBAnyZUnIqaLVMF2RrQihanlFe
	 rzVe8gJ+0i93koS1P+iexxZwvAlOoPjiuHwLoFobqFx31lm9UQfZtmtI4aADLdRZxlj8B
	 C1lQTdh+4rpcA7p5j+wR+rbmL8KWNefpOjRVflEZDAN3Y8AxoW//Of8/QBM7Kvbb25FTT
	 5tOMveGnkVMELtapX8MAaRUjU5AFEJsPjKiDDOWtdPHkHpaE7ZvOgqSOLGKg2KWnxFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MpVU+mj2;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789FA606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MpVU+mj2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2r
	K4ek6R2FxmaG7c9tAqRDlXMKsebVTstRhPuv3hJpU=; b=MpVU+mj2Vzr/qj2xIV
	UENozVmFiwFtSW+9sy9CtR4+Y2xSAqflu/6S3VfPvKtnxWNGUyrjEba2c050L2MH
	KtSBmQlzka9RK/OK5eq733YikJgeOGsop65WzPV4gCUBB+oVJ9wC3ZjPibkixe/9
	kpMViD8vq372iE8WFXa8AWE4Y=
Received: from pan-u.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3H9lQz9lqE4q0Bg--.6535S2;
	Thu, 22 Oct 2026 16:54:40 +0800 (CST)
From: rppxj178543@163.com
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	fuhao@open-hieco.net,
	linux-kernel@vger.kernel.org,
	renpanpan <renpanpan@kylinos.cn>
Subject: [PATCH] ALSA: hda: Force MSI for Hygon H34M51A board
Date: Thu, 22 Oct 2026 16:54:38 +0800
Message-ID: <20261022085438.1315679-1-rppxj178543@163.com>
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
X-CM-TRANSID:_____wD3H9lQz9lqE4q0Bg--.6535S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfGFy8XFWkJw43tFyUGFg_yoW8Ar43pF
	WYg39akFWvgFWjvan0gF48GFyfZF13GrsxG3909w47JanxZr1jqw4YyrW8JFW8Gr48CrWY
	qr1DKas7ZF45AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjiihUUUUU=
X-CM-SenderInfo: huss5yirxykkqt6rljoofrz/xtbC6RAZGGrZz1CAtwAA3j

From: renpanpan <renpanpan@kylinos.cn>

The Hygon HDA controller (PCI 1d94:14a9) has AZX_DCAPS_NO_MSI set in
the PCI ID table to use legacy INTx, as MSI may lose interrupts under
heavy load on some Hygon platforms (commit 41212ff3e4ed ("ALSA: hda:
Add support for Hygon family 18h model 5h HD-Audio")).

However, on the Kunlun H34M51A board (PCI subsystem 1d94:c950) the
INTx interrupt line is not wired.  /proc/interrupts shows zero count
for the HDA IRQ from boot, so the RIRB interrupt handler is never
called.  Without RIRB processing, azx_rirb_get_response() times out
after 1 s, switches to polling mode, and the resulting slow codec
communication delays card registration by ~20 s and breaks
unsolicited jack-detection event delivery.

Force MSI on for subsystem 1d94:c950 by adding it to msi_deny_list
with value 1.  The list is consulted in check_msi() before the
AZX_DCAPS_NO_MSI check, so H34M51A gets MSI enabled while other
Hygon platforms retain INTx.

Signed-off-by: renpanpan <renpanpan@kylinos.cn>
---
 sound/hda/controllers/intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 24015c73a67f..fa36ed4c1153 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1669,6 +1669,7 @@ static const struct snd_pci_quirk msi_deny_list[] = {
 	SND_PCI_QUIRK(0x1179, 0xfb44, "Toshiba Satellite C870", 0), /* AMD Hudson */
 	SND_PCI_QUIRK(0x1849, 0x0888, "ASRock", 0), /* Athlon64 X2 + nvidia */
 	SND_PCI_QUIRK(0xa0a0, 0x0575, "Aopen MZ915-M", 0), /* ICH6 */
+	SND_PCI_QUIRK(0x1d94, 0xc950, "Hygon H34M51A", 1), /* INTx broken */
 	{}
 };
 
-- 
2.43.0

