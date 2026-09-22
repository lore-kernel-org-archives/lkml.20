Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1323F104E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061437; cv=none; b=CHstg0qUCR4RGjUl1ft0b3Ux3z0anUzFPmsM8NcHMeG+TK54sXd6t7ePBHdX4rbrGgO15Y82ijPxSjv+D04aTv5Abub6AXbXbApcOOKx19DShHp1IP7EIGV4szeOCsvAGiAzuMsK3Bfu0BB831PmJosyunmwJRwtzVwQyatMRgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061437; c=relaxed/simple;
	bh=uLkd0JPyhsHUlYTDpYDC4lnwFB2XZIZu3LCtxX/nbow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LHI1atrZW1c4aDTRewYGQkF5kma7Ma6hO5rhpLEiOO0H4/UKqBEgCtB0J+ePQSzUOS7b4LwGWfyCS8CSXtmnD9nMSOv4R3DwuQoWAXTCahDuZz2c91pZGAbeba3qSI1vTxO6O7x8nDsBtfKtmxdbpNtP7i3ou7b08NeZPE5VPPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9b3d55fab65511f19a56ed5b684f684d-20260922
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:457b145c-4c50-4545-95d8-16b6cd903f05,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:c5c72881f1bcea4d166d0cbb68f760c5,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9b3d55fab65511f19a56ed5b684f684d-20260922
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1466167696; Tue, 22 Sep 2026 15:17:01 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: abbotti@mev.co.uk,
	hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org,
	syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] comedi: dt2811: fix shift-out-of-bounds in IRQ check
Date: Tue, 22 Sep 2026 15:16:57 +0800
Message-Id: <02c46315293a26169d2a3862a2047959a1651ef4.1790061387.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6ab21240.e548f532.1ca396.0018.GAE@google.com>
References: <6ab21240.e548f532.1ca396.0018.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IRQ number passed via comedi_devconfig->options[1] is a signed int
that comes from userspace.  The check `it->options[1] <= 7` does not
reject negative values, so a negative IRQ number reaches
`BIT(it->options[1])`, which is undefined behavior and triggers a UBSAN
shift-out-of-bounds warning:

  UBSAN: shift-out-of-bounds in drivers/comedi/drivers/dt2811.c:570:31
  shift exponent -251 is negative

Add an explicit lower bound check (`it->options[1] >= 0`) so that only
valid IRQ numbers 0..7 are accepted before the shift.

Fixes: f2975a9b2ab9 ("staging: comedi: dt2811: add async command support for AI subdevice")
Reported-by: syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6ab21240.e548f532.1ca396.0018.GAE@google.com/#R
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/comedi/drivers/dt2811.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/dt2811.c b/drivers/comedi/drivers/dt2811.c
index 0438b8c90e44..53cb17993ae7 100644
--- a/drivers/comedi/drivers/dt2811.c
+++ b/drivers/comedi/drivers/dt2811.c
@@ -567,7 +567,7 @@ static int dt2811_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 	dt2811_reset(dev);
 
 	/* IRQ's 2,3,5,7 are valid for async command support */
-	if (it->options[1] <= 7  && (BIT(it->options[1]) & 0xac)) {
+	if (it->options[1] >= 0 && it->options[1] <= 7 && (BIT(it->options[1]) & 0xac)) {
 		ret = request_irq(it->options[1], dt2811_interrupt, 0,
 				  dev->board_name, dev);
 		if (ret == 0)
-- 
2.25.1

