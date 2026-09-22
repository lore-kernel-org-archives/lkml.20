Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D60238423B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059034; cv=none; b=YQ3VDqLIGO3iB7IvtGy8fACXUPX4EQp5JA/g8x/AhE19x8/IHtR6NVqITxy0YK4G5dDi6sRjmlCQtYmDRBHFs1nox5hKVOChtVNXqbSYKbZ4wHoiZM0eO2YcVU0nxpltvEoj5XIxDZdD2a3iTY86b9LEtX2ypjXQoPcVNgHeHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059034; c=relaxed/simple;
	bh=7pk2QAiCoN2WjnUEZkbiTQQScsGKdPuAypO+ppu6Nnc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T4JA6JrJe6uvsUuTC3NLN4+3hfmB+pz+QbSmOBUyeMzGsPq2HHsDuU+vb0iJVkrGM4LVE+OFn37gt9fhL5gq8CbhZbihV2y1eDzkoLACfLaAGpQ+hVwCzzP9ZhrJgop++HKIJCNsDktaj7tsd05YcTFIQ9FK9Q6SomUE1klCJyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 068eea90b65011f19a56ed5b684f684d-20260922
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f2e1bc45-c8f7-44e8-af56-b877d107c75d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:8b8a1cf4198c6068d23ea1bee1219219,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 068eea90b65011f19a56ed5b684f684d-20260922
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 474925947; Tue, 22 Sep 2026 14:37:04 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
Cc: abbotti@mev.co.uk,
	hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] test dt2811
Date: Tue, 22 Sep 2026 14:37:01 +0800
Message-Id: <b91ecde2db1cf37b070e3a7ef960d43bedce8873.1790058978.git.xiaopei01@kylinos.cn>
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

#syz test

---
 drivers/comedi/drivers/dt2811.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/dt2811.c b/drivers/comedi/drivers/dt2811.c
index 0438b8c90e44..5af2c71de4a2 100644
--- a/drivers/comedi/drivers/dt2811.c
+++ b/drivers/comedi/drivers/dt2811.c
@@ -567,7 +567,7 @@ static int dt2811_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 	dt2811_reset(dev);
 
 	/* IRQ's 2,3,5,7 are valid for async command support */
-	if (it->options[1] <= 7  && (BIT(it->options[1]) & 0xac)) {
+	if (it->options[1]>= 0 && it->options[1] <= 7  && (BIT(it->options[1]) & 0xac)) {
 		ret = request_irq(it->options[1], dt2811_interrupt, 0,
 				  dev->board_name, dev);
 		if (ret == 0)
-- 
2.25.1

