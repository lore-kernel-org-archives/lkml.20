Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927028;
	b=YrARklRlybKVxbVwFfSR08QDyH+JXW+6gcylMi5XyEXfow5kP23OoqKISGQgGyNMR3J1
	 IwDDPwB1pnCaieNHLr7hdDtjXbhDT+gMZa+mS9uI32RKury/EdIvGcZZPZnZTGQ73vCG0
	 xqukUregYfyKVszKh8ZsZoj76DAGsm/fqM5+TMdj4d4djhxqAi9ddYkn8A5CBpzR5iPDv
	 YBNYN4Bl3TpB8e89yVrY7zMmpDcAPWA5oJuGUIc6BHVIQFt2GPp4KQt1t1/1AcRYc9xk2
	 4nUbEkKplwy6LiNpDsbyFVVFMOYyY9u4x4a6sYnLpuJcMHKVF0+donAW0cgN6anfuDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927028;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=3PNrU90Ym3OnIOEwE1smLole3lwUQzVG8J1GjkCgnUM=;
	b=RXAA/jzfKmkCgjSBEWeoCps1iBtbNHeXdev1R/0/RkeChTUp+8xkflzKgJL4VuYGAg14
	 nLdEitgl0grTPEIsSfdVQoJIh54aqMrDkVJbm+tyPWefK6ywStPgtaGw6HHQGskCYrPiV
	 LsWmDNjpfvAkW52u4BB80+JTsiuVYXu4LYf8TWYBvxOmcDSjlGYnYS8iyufy5phiRqKG1
	 sRELZgWAbTnWWds5K5EyIYoSYaXBy96KgaCzx/PXA+T+rkOQ4LFKUxd1Gl1UGxhm6fkms
	 /AhpIQV2582uuiKBzISP54VMSMLpsXf/PtLEXcN6f/wPeSZBo+IhgBjgoS2wEOLfONg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=NvMuDyof;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBF6606A33D;
	Tue, 17 Nov 2026 14:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BBF6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=NvMuDyof
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55020e812;
	Tue, 17 Nov 2026 22:50:21 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dm1105: Fix potential frontend leak on probe failure
Date: Tue, 17 Nov 2026 22:50:20 +0800
Message-ID: <20261117-571e631490-media-dm1105-0@mail.sdu.edu.cn>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e9fccd7b03a1kunm5a6d9fc3156564
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkNMVkpPSxlPHR4ZSh1KSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=NvMuDyofdyx9Ryz4kmgBtH5sfFcCLFmKxHdRMGcYUNfP6VrlaGGxEPQ/Ej4tom0+xQ8C9YNyI/igInmisWBXSOqb0ckb3uHh5hJaTH3b+JGQNOf8zn4Z+Evu06xaTBm6EDggkR5nr9nCU2NP7vetLfTWu9v79XfuhaLRlKRDg8I=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=3PNrU90Ym3OnIOEwE1smLole3lwUQzVG8J1GjkCgnUM=;
	h=date:mime-version:subject:message-id:from;

The frontend is registered before workqueue creation and the IRQ
request. Failures at either stage skip frontend teardown before
releasing the adapter and driver state.

Unregister and detach the frontend on these later probe failures.

This issue was found by our static analysis tool under development.

Fixes: d1498ffc474b ("V4L/DVB (10743): dm1105: not demuxing from interrupt context.")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/media/pci/dm1105/dm1105.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index ae4544042a74..45f3db06b7b9 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -1132,7 +1132,7 @@ static int dm1105_probe(struct pci_dev *pdev,
 	dev->wq = create_singlethread_workqueue(dev->wqn);
 	if (!dev->wq) {
 		ret = -ENOMEM;
-		goto err_dvb_net;
+		goto err_frontend;
 	}
 
 	ret = request_irq(pdev->irq, dm1105_irq, IRQF_SHARED,
@@ -1144,6 +1144,9 @@ static int dm1105_probe(struct pci_dev *pdev,
 
 err_workqueue:
 	destroy_workqueue(dev->wq);
+err_frontend:
+	dvb_unregister_frontend(dev->fe);
+	dvb_frontend_detach(dev->fe);
 err_dvb_net:
 	dvb_net_release(&dev->dvbnet);
 err_disconnect_frontend:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
