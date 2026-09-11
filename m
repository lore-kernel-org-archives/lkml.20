Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4E3EFD21;
	Fri, 11 Sep 2026 06:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106978; cv=none; b=AQzUPaQjgcxwQhimCO1rZfMi0sCdp2dXsm0RUYloPxhSCkKyfRfMVkS7+sm2FlS1kqjFPRRdLF4fRgI/JIRldyTKvhagHFG1d690VT6NOHtUxgjRear7H8t1/evclLwL+0LBlZOtrGtZvwVIR71CohnlMdtFtR5eMTlOUj85Qo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106978; c=relaxed/simple;
	bh=bLHJdiPyMNpxEXcRIcX85BnimzVghstK4xXzepMi1jM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wa5et4fKd2rZW+/+2xmAjOgI2JNgfXJSoTAOw2adLA+LNvGXBf+zp8TWVNBxJluSaqm1Driv0xygRCH/o/g5j56IOGf6vk3KoRUkZ5x1eCbpR8v9l2YF52NbpRzNdCO20vwmiKOfGS96R/k/vc1rGmZS4SlWMbFqKjZMBx72Klg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=bnfAl9fU; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="bnfAl9fU"
Received: from seu.edu.cn (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fc6;
	Fri, 11 Sep 2026 14:09:32 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] media: msi2500: propagate control import errors
Date: Fri, 11 Sep 2026 14:09:31 +0800
Message-Id: <20260911060931.94557-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15e4ef03a1kunm2b249d901c7380
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHkJLVhodHUJOHx9IT0IZTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=bnfAl9fUbMS7RgfhTFbGdH7QCEoAjss9+Uf1/cydBK5STqX5TbX1iOBjjviVpOJbWV8q5Ke2QpQ4N2pMtLEQn5mJb5d8XmQ90twdGtG5iRaT7Xtc1djxxEk1wKxKXiHpBYj2SxXairfE5K8iAV2mG6UdNF9GC97N82Q6/lSWbAc=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=TQ+Jne/ojyrFh4jUquuCUGtOpYyeuI2ifVl8iAa4YGA=;
	h=date:mime-version:subject:message-id:from;

Importing subdevice controls allocates new references and can fail
even when the source controls exist. Abort probe through the existing
control cleanup path rather than exposing a partial handler.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 2e68f841a5d1 ("[media] msi3101: use msi001 tuner driver")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/media/usb/msi2500/msi2500.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 282256ab812a..4c4508d2977c 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -1268,7 +1268,9 @@ static int msi2500_probe(struct usb_interface *intf,
 	}
 
 	/* currently all controls are from subdev */
-	v4l2_ctrl_add_handler(&dev->hdl, sd->ctrl_handler, NULL, true);
+	ret = v4l2_ctrl_add_handler(&dev->hdl, sd->ctrl_handler, NULL, true);
+	if (ret)
+		goto err_free_controls;
 
 	dev->v4l2_dev.ctrl_handler = &dev->hdl;
 	dev->vdev.v4l2_dev = &dev->v4l2_dev;
